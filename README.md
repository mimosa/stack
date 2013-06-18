```ruby

brand = Brand.create({name: '巴黎欧莱雅', name_eng: "L'OREAL PARIS"})
brand.save

brand = Brand.last
brand.material_list = '法国葡萄籽' # 成分、材质
brand.category_list = '女士护肤，男士护肤，染发，彩妆，洗护，其他' # 品类
brand.audience_list = '所有人群，男士，女士' # 受众
brand.feature_list  = '洁面，水，面霜，其他面部护理，洗发，护发，润发，其他头发护理，眼部，唇部，脸部，指甲'   # 功效
brand.line_list     = '清润系列，UV系列，雪颜系列，青春密码系列，复颜系列，创世新肌源系列，金致臻颜系列，劲能系列，控油系列，抗皱系列，效修复系列，精油润养系列，丝质蛋白系列，卷烫修复系列，卓韵霜系列，可丝莹系列，眼妆，唇妆，脸妆，甲妆' # 系列
brand.save

product = brand.products.create({
  name: '清润葡萄籽精华膜力水',
  barcode: 6946537059828,
  sale_mode: '必须分销',
  color: '白色',
  level: 'A+',
  prod_status: '新包装',
  item_status: '正品',
  packing: {
    length: 58,
    width: 49,
    height: 182,
    weight: 0.541,
    country: '苏州'
  },
  info: {
    desc: "水润喝进去，Q弹蹦出来。全民亲测：No.1净化水。顶级法国葡萄籽，50倍抗氧化能力，属于皮肤的葡萄饮。,10秒钟媲美10分钟面膜效果。水般清新，乳液般轻盈，面霜般滋润。持久保湿，滋润肌肤，去除暗沉，提亮肤色，定格弹滑，防止紫外线侵害，保护皮肤组织。,法国葡萄籽精华蕴含葡萄多酚50倍抗氧化能量，抵抗有害自由基，孚日山矿泉水与双重透明质酸深层补水，使肌肤弹滑鲜亮。",  # 宝贝详情
    guide: '每日早晚使用于清洁后的脸部及颈部', # 使用手册
    warn: ''  # 注意事项
  },
})

product.material_list = '法国葡萄籽' # 成分、材质
product.category_list = '女士护肤' # 品类
product.audience_list = '所有人群' # 受众
product.feature_list  = '水' # 功效
product.line_list     = '清润系列' # 系列

product.save

# 查找
Product.tagged_with_on(:features, "水")
Product.tagged_with_on(:features, "水", :match => :any) # 任意
Product.tagged_with_on(:features, "水", :match => :not) # 排除
```