/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : j2ee_project

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2015-01-09 17:03:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', '男');
INSERT INTO `gender` VALUES ('2', '女');
INSERT INTO `gender` VALUES ('3', '其他');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `question_category_id` int(11) NOT NULL,
  `test_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '下列的各类函数中，不是类的成员函数', '2,', '构造函数', '析构函数', '友元函数', '拷贝初始化构造函数', '1', '1');
INSERT INTO `question` VALUES ('2', '作用域运算符“：：”的功能是：', '2', '标识作用域的级别的', '指出作用域的范围的', '给定作用域的大小的', '标识成员是属于哪个类的', '1', '1');
INSERT INTO `question` VALUES ('3', '下列说明中const?char?*ptr；其中ptr应该是', '3', '指向字符常量的指针', '指向字符的常量指针', '指向字符串常量的指针', '指向字符串的常量指针', '1', '1');
INSERT INTO `question` VALUES ('4', '已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，是正确的', '1', 'void print()const', 'const void print()', 'void const print()', 'void print(const)', '1', '1');
INSERT INTO `question` VALUES ('5', '在类定义的外部，可以被访问的成员有', '3', '所有类成员', 'private的类成员', 'public的类成员?', 'public或private的类成员', '1', '1');
INSERT INTO `question` VALUES ('6', '关于类和对象不正确的说法是', '2', '类是一种类型，它封装了数据和操作', '对象是类的实例', '一个类的对象只有一个', '一个对象必属于某个类', '1', '1');
INSERT INTO `question` VALUES ('7', '在C++中，类与类之间的继承关系具有', '3', '自反性', '对称性', '传递性', '反对称性', '1', '1');
INSERT INTO `question` VALUES ('8', '结构化程序设计所规定的三种基本控制结构是', '3', '输入、处理、输出', '树形、网形、环形', '顺序、选择、循环', '主程序、子程序、函数', '1', '1');
INSERT INTO `question` VALUES ('9', 'C++语言是从早期的C语言逐渐发展演变而来的.与C语言相比，它在求解问题方法上进行的最大改进是', '3', '面向过程', '面向对象', '安全性', '复用性', '1', '1');
INSERT INTO `question` VALUES ('10', '在C++中实现封装是借助于', '2', '枚举', '类', '数组', '函数', '1', '1');
INSERT INTO `question` VALUES ('11', 'C++语言是从早期的C语言逐渐发展演变而来的与C语言相比，它在求解问题方法上进行的最大改进是', '2', '面向过程', '面向对象', '安全性', '复用性', '1', '1');
INSERT INTO `question` VALUES ('12', '下列关于类和对象的叙述中，错误的是', '2', '一个类只能有一个对象', '对象是类的具体实例', '类是对某一类对象的抽象', '类和对象的关系是一种数据类型与变量的关系', '1', '1');
INSERT INTO `question` VALUES ('13', '定义析构函数时，应该注意', '4', '其名与类名完全相同', '返回类型是void类型', '无形参，也不可重载', '函数体中必须有delete语句', '1', '1');
INSERT INTO `question` VALUES ('14', '在公有继承的情况下，基类的成员（私有的除外）在派生类中的访问权限', '3', '受限制', '保持不变', '受保护', '不受保护', '1', '1');
INSERT INTO `question` VALUES ('15', '关于成员函数特征的描述中，错误的是', '1', '成员函数一定是内联函数', '成员函数可以重载', '成员函数可以设置参数的默认值', '成员函数可以是静态的', '1', '1');
INSERT INTO `question` VALUES ('16', '以下对一维数组a的正确定义是', '2,3', 'int n=5, a[n];', 'const int n =?5; int a[n];', 'int a[100] ;', 'int n; cout << n << endl;', '2', '1');
INSERT INTO `question` VALUES ('17', '已知int?a[]?=?{0,?2,?4,?6,?8,?10}?和?*p?=?a，值等于0的表达式是', '1,2,3', '*(p++)', '*a ', '*(p--)', '*(--p)', '2', '1');
INSERT INTO `question` VALUES ('18', '下列字符串中可以用做C++标示符的是', '1,2', '_521', 'swss', 'case', '3var', '2', '1');
INSERT INTO `question` VALUES ('19', '下列关于C++类的描述中错误的是?', '2,3', '类与类之间可以通过一些手段进行通信和联络', '类与类之间不可以通过封装而具有明确的独立性', '类与类之间必须是平等的关系，而不能组成层次关系?', '类用于描述事物的属性和对事物的操作', '2', '1');
INSERT INTO `question` VALUES ('20', '下列关于C++语言的发展说法错误的是', '2,4', 'C++语言起源于C语言', '在1980年C++被命名', 'C++语言最初被称为“带类的C”', '在1982年C++被命名', '2', '1');
INSERT INTO `question` VALUES ('21', '大学生的成才目标是', '3', '培养德智体美全面发展的人才', '培养德智体美全面发展的社会主义建设者', '培养德智体美全面发展的社会主义建设者和接班', '培养专业化、创新化的人才', '2', '1');
INSERT INTO `question` VALUES ('22', '现代人才素质的灵魂是', '1', '德', '智', '体', '美', '1', '2');
INSERT INTO `question` VALUES ('23', '世界政治格局的发展必然趋势是', '1', '多极化', '单边主义', '两极格局的形成', '一超独霸', '1', '2');
INSERT INTO `question` VALUES ('24', '在全面发展的教育中，德智体美是缺一不可、统一存在的。其中处于主导地位的是', '1', '德育', '智育', '体育', '美育', '1', '2');
INSERT INTO `question` VALUES ('25', '时代精神的内涵十分丰富，其中居于核心地位的是', '4', '艰苦奋斗', '自强不息', '团结统一', '改革创新', '1', '2');
INSERT INTO `question` VALUES ('26', '民族精神是一个民族赖以生存和发展的精神支撑。中华民族在五千年的发展中形成的伟大民族精神的核心是', '1', '爱国主义', '人道主义', '科学主义', '革命英雄主义', '1', '2');
INSERT INTO `question` VALUES ('27', '下列名言反映中华民族是一个艰苦奋斗的民族的有', '1', '艰难困苦，玉汝于成', '先天下之忧而忧', '生于忧患，死于安乐', '民无信不立', '1', '2');
INSERT INTO `question` VALUES ('28', '什么是人才素质的基本内容', '2', '德', '智', '体', '美', '1', '2');
INSERT INTO `question` VALUES ('29', '什么是我们立党立国的指导思想', '1', '马克思主义', '社会主义荣辱观', '社会主义思想道德', '爱国主义', '1', '2');
INSERT INTO `question` VALUES ('30', '当代大学生的历史使命是', '1', '建设中国特色社会主义，实现中华民族伟大复兴的历史使命', '迎接知识经济和经济全球化挑战的历史使命', '粉碎西方敌对势力“西化”和“分化”中国图谋的历史使命', '促进自身心理健康', '1', '2');
INSERT INTO `question` VALUES ('31', '衡量大学生全面发展的一个重要标准是', '3', '知识渊博', '品质高尚', '德才兼备', '知行统一', '1', '2');
INSERT INTO `question` VALUES ('32', '独立生活意识是指', '3', '自己的事情自己处理不需要别人管', '自己想干什么就干什么', '树立自信、自律、自立、自强的精神', '天马行空独来独往', '1', '2');
INSERT INTO `question` VALUES ('33', '作为社会主义核心价值体系的精髓，解决的是应当具备什么样的精神状态和精神风貌的问题', '3', '马克思主义的指导地位', '中国特色社会主义的共同理想', '民族精神和时代精神', '社会主义荣辱观', '1', '2');
INSERT INTO `question` VALUES ('34', '人类心灵世界的核心是', '1', '理想信念', '道德规范', '精神追求', '人生态度', '1', '2');
INSERT INTO `question` VALUES ('35', '社会主义核心价值体系的灵魂是', '1', '马克思主义指导思想', '中国特色社会主义共同理想', '爱国主义的民族精神和以改革创新为核心的时代精神', '社会主义荣辱观', '1', '2');
INSERT INTO `question` VALUES ('36', '社会主义核心价值体系的主题是', '2', '马克思主义指导思想', '中国特色社会主义共同理想', '爱国主义的民族精神和以改革创新为核心的时代精神', '社会主义荣辱观', '1', '2');
INSERT INTO `question` VALUES ('37', '当代大学生的成才目标应当包括', '1,2,3,4', '德', '智', '体', '美', '2', '2');
INSERT INTO `question` VALUES ('38', '社会主义荣辱观的基本内容包', '1,2,3,4', '以热爱祖国为荣，以危害祖国为耻', '以遵纪守法为荣，以违法乱纪为耻', '以崇尚科学为荣，以愚昧无知为耻', '以诚实守信为荣，以见利忘义为耻', '2', '2');
INSERT INTO `question` VALUES ('39', '什么是调节人们思想行为、协调人际关系、维护社会秩序的两种基本社会规范', '1,3', '法律', '制度', '道德', '政治', '2', '2');
INSERT INTO `question` VALUES ('40', '学风是指在一定环境或条件下形成和表现出来的带有一贯性的学习风格和行为样式，优良的学风要在什么上下功夫', '1,2,3,4', '勤奋', '创新', '求实', '严谨', '2', '2');
INSERT INTO `question` VALUES ('41', '大学生活特点表现在', '1,2,3,4', '大学是知识的海洋', '大学有教书育人的良师', '大学有浓厚的学习氛围', '大学有浓厚的成才氛围', '2', '2');
INSERT INTO `question` VALUES ('42', '大学生活与中学生活相比发生了以下显著变化', '1,2,4', '学习要求', '生活环境', '物质消费水平', '社会活动', '2', '2');
INSERT INTO `question` VALUES ('43', '当前，我国发展所面临的挑战包括', '2,3,4', '我国自然资源保护的挑战', '世界科技文化发展的挑战', '新世纪新阶段我国发展任务的挑战', '复杂多变的国际环境的挑战', '2', '2');
INSERT INTO `question` VALUES ('44', '大学生崭新形象的必备要素包括', '1,2,4', '追求真理善于创新', '视野开阔胸怀宽广', '谦虚谨慎虚心好学', '理想远大热爱祖国', '2', '2');

-- ----------------------------
-- Table structure for question_category
-- ----------------------------
DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_category
-- ----------------------------
INSERT INTO `question_category` VALUES ('1', '单选');
INSERT INTO `question_category` VALUES ('2', '多选');

-- ----------------------------
-- Table structure for test_category
-- ----------------------------
DROP TABLE IF EXISTS `test_category`;
CREATE TABLE `test_category` (
  `test_category_id` int(11) NOT NULL,
  `test_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_category
-- ----------------------------
INSERT INTO `test_category` VALUES ('1', 'c++');
INSERT INTO `test_category` VALUES ('2', '思修');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_category` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Burgess', '123', '100@qq.com', '1', 'Burgess', '2');
INSERT INTO `user` VALUES ('2', 'zh', '123', '', '1', 'zh', '1');
INSERT INTO `user` VALUES ('3', 'zz', '123', 'xxx@qq', '3', 'å¼ ç¿°', '1');

-- ----------------------------
-- Table structure for user_category
-- ----------------------------
DROP TABLE IF EXISTS `user_category`;
CREATE TABLE `user_category` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_category
-- ----------------------------
INSERT INTO `user_category` VALUES ('1', 'student');
INSERT INTO `user_category` VALUES ('2', 'teacher');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `test_title` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `test_questions_id` varchar(255) NOT NULL,
  `test_user_answers` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('1', '1', 'c++试卷', '8', '1:2:3:4:5:6:7:8:9:10:11:12:13:14:15:16:17:18:19:21:', '1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:1,:2,:2,3,:2,3,:2,:', '2015-01-08 21:23:56');
INSERT INTO `user_test` VALUES ('2', '3', 'c++试卷', '8', '1:2:3:4:5:6:7:8:9:10:11:12:13:14:15:16:17:19:20:21:', '1,:1,:1,:1,:1,:3,:3,:1,:2,:3,:2,:1,:2,:1,:1,:', '2015-01-09 15:30:23');
INSERT INTO `user_test` VALUES ('3', '3', 'c++试卷', '8', '1:2:3:4:5:6:7:8:9:10:11:12:13:14:15:16:17:19:20:21:', '1,:1,:1,:1,:1,:3,:3,:1,:2,:3,:2,:1,:2,:1,:1,:', '2015-01-09 15:30:23');
