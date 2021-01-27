Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72757305E99
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:49:18 +0100 (CET)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4m8C-0004EH-Uz
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1l4m69-0003Jj-MX
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:47:09 -0500
Received: from mga01.intel.com ([192.55.52.88]:24224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1l4m66-0000W3-JX
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:47:08 -0500
IronPort-SDR: H8q9QUffUVFyjbiwuk65AvjfhaVpnCbegydcE9QTktAYEVGldUC1ykQD+do16pKVd7+L7Cr8sS
 R/9rq76PxAlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="198884375"
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
 d="scan'208,217";a="198884375"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 06:47:02 -0800
IronPort-SDR: a5cLjvWcDy5tYCt810fW3J3iYQtg7o8ELyyT8kWcx1qPmsI2hRP/NI+39oc7TpUAZlnQ1Id44g
 DncSgugRAmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
 d="scan'208,217";a="369499214"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 27 Jan 2021 06:47:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 27 Jan 2021 06:47:01 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 Jan 2021 06:47:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 27 Jan 2021 06:47:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 27 Jan 2021 06:47:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNGhjlLK3lYMOEaGYi4gFjN0+p+KC/XTqHfkwOCgwLTiIN35rnXxQEyE4bYiYlQYODTnFEboLFk2cx9E+G46kNw39AxPIPIq2tTK+G5j8ue8JqvF7i1aGBMP92yRtlQc8yQissHbQJHhWP++IL1qXV/SV8YEv+RxAxsMXotlHBcH+nbpnGxJDDWLlBxFOcLHDEv87u2pDx+K+nJQ/Hr5IfG3065aB0ajKwrDGy5PXLCE909MOt//3Gs1qL+lrh8blP2fCmyJmiL/rS6OybquAUZB81ywAWlqwEKn90PQd806c9/SN2jXa8maRH+jEVlyOar9Ne2y4QJvTyyMch9PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2L6kdl1qA9gu4rRZq95frKdpSShef11gtL0Bq88G/Os=;
 b=Jke6jIjB3N8UKZLHdSchVLXdbuJQcp/vHNQbm2KeuqbXISIGfxsEytFYTkZpRAfkY2QoBQqHFlJMmgi4UNBg6jRd1k0TMKJZ9Sg2ihsF2HJ79qJZDmY4ImhCZlq4ES984abPLeXaNYY0ZO3GcrSIzcedlSIXLjyxjWVIMDof8kVKpvO1h5raoaBKQjLJ5OxJ/FHa3L+kzODRHHXpUi3GrJAvjD5kNnkzDow/OkuscCJyEj9wfMr53gEe2+pcQ67q1lUd2YCFfph7lzBkoY3sAGh7BUY9SJMfzujR73mONf6aM6USm+wiTrpmlrxyAZgktlKo6+sWM1aRGxg2YgbjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2L6kdl1qA9gu4rRZq95frKdpSShef11gtL0Bq88G/Os=;
 b=GUFZeoig0PLXfVUFELnBGUBkH+9xJpnw5Q6nJIoN1f0bkBA4kJbdgXpzam175cTIXd0AUxc5TYu/s6ApoaS+/G1A3mzbmrFNjntekupCqp9+T3axJKbeGBqVuJvn03torEezOzBqHs6/1zpnqaHEhg5LnNwv7ODBvnOxt9jGcmQ=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB2906.namprd11.prod.outlook.com (2603:10b6:5:6a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 14:47:00 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149%6]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 14:47:00 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: seems currently QEMU doesn't support file backend for RAM memory
 region on Windows
Thread-Topic: seems currently QEMU doesn't support file backend for RAM memory
 region on Windows
Thread-Index: Adb0upEpz3DqaekXRDeVZwDcPLn3nQ==
Date: Wed, 27 Jan 2021 14:47:00 +0000
Message-ID: <DM6PR11MB4316CE245E10B869C014C2FF8DBB9@DM6PR11MB4316.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f7ec030-1c5f-4f3f-c97c-08d8c2d26734
x-ms-traffictypediagnostic: DM6PR11MB2906:
x-microsoft-antispam-prvs: <DM6PR11MB29066404FD49F4FCB085D4ED8DBB9@DM6PR11MB2906.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G/t3d/wL7i8Sl8yr7SwZF4brlT+cu47z78crrXm6k6HgliB10jyBGT2/4iEuJBlKl8lacVWVy3NPTdFzKlelNNMpK3rV4UKoeRGnUmKlrNDUr+LYfB7WYTtZ+Qzag4r1GpQ0GfY88W5kaYZCPclRh1nzL37YzrCbpZn9V8mXojqeR69vUcUFdIhGha3HfhZ3nrqExFrplyt/J/J3OgZjS8xmmQ5IodQWK6FbiL7P9pXkKQ0PM0WMVXAPmbeVx/WhtG89XNRXaICWWVc/GV80w5tPd1J7IULcoqQN8CVs6YGV9xbM7qt65RDqT2o/Ah5qT3wqGiFR+R0GVpS7wBlH1U2vYwpxcRt93UwYa7i2EWEZZoguhfW8/iRqblMqtNBZuShulHW72SKYB1lhp4SC16LCay+3EIc6HOi564nit27zhzOPhODaG4FjRvWjYBPxOStW3Qm4fsb2syB1lqFm8eZ2NLO6RHr+Tu5U6WRATUFyPk260Up9R5dHpfSx1GCRgTb6q9DyOuaThGoAQ5MAmsVPPhoTayhtxkt5zcA00XSapU95UMVW5gqVJWspxgF+9zqRYzkG8KIYtfu+tB54elGkTyqs3ZYeYbJZUh8AuLs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(55016002)(8936002)(66946007)(8676002)(66476007)(66446008)(7696005)(6506007)(76116006)(66556008)(186003)(5660300002)(26005)(9686003)(64756008)(52536014)(478600001)(166002)(86362001)(110136005)(558084003)(2906002)(966005)(71200400001)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ISTQyJwNJnLGWsTG5TJsCP+dk6m/dG+njPMnQ/YW8XO0dIdpyMrH8buIRiKN?=
 =?us-ascii?Q?nFRFH5pC3Ot9xdKeeftDMDHltQQdtbS0DFTNswCN7vqVHVbM7BRK5OK5BXuQ?=
 =?us-ascii?Q?jVF3pWpznK6Sv+Xx8bDL68otYmqPV0EA0cnLH6/oChKdkVe93dL3e0qQ0Cl1?=
 =?us-ascii?Q?PG2jG9oIpSU8AMKFBqWr0p0hRWa0hsZqAAXvgKXvyjPpnS73bjVfTysk6gWH?=
 =?us-ascii?Q?rUpmJS9dBQvMqHsLXXt4OjzHQBWzrbk3cWXDRvh/KjxNdriJKXA5xndYJepI?=
 =?us-ascii?Q?xdSgqSLe5Cv2z1OomqfetjU25zn2lS+N4Fl1ral7RkNSNuszRJJhhCZQRgJl?=
 =?us-ascii?Q?RF7L9c33Y2J9brAAQuXZOarEW2hHK9XLjGFkOyvhvxNse5rVnm9hggxkX3W7?=
 =?us-ascii?Q?pqFbL+M46NlNvytplGcCPEG1nLlVmaOoyOQ+Q4zKhPWlbZLaI48pLFTeGWPp?=
 =?us-ascii?Q?FAy1uIA3v+1zz01ofhCrrOSPzpBKH6avUYCISH6hW0aFtZsNRTMRqZXdyr/7?=
 =?us-ascii?Q?t+iTTRzidCtCuf3gCFlDD0t7ICUOnHn0xQ8BDm50rvsR56U56AmV7GaleN/x?=
 =?us-ascii?Q?JL2U/JlSi73RlNjojAOdVAOwlwrldVN3kSDdWFvhTobZocItIWaGyDERXnkT?=
 =?us-ascii?Q?wf1vkmz3cy2jSnnmQAcTGBBzVLBl7leALfzhGUHoAeZF7o6lScUsgDq3V2Jn?=
 =?us-ascii?Q?gTR3RepxZP5mPcPCQFjkbZ5TKyVMqDF6XJMuOB3hzDJ/8h2bMqC1i/GV9k1p?=
 =?us-ascii?Q?xXkYOnNQYNUe6qXSbyGfYF8cYfELT8JgRskSpeeGZMMC0NqxgJbe8HXlbui0?=
 =?us-ascii?Q?3vm3jatv25gS62nHXSYa0KLSFnmzljqN0YZfpqABni0wwCkHD4briT30FJ9R?=
 =?us-ascii?Q?dQ4f+rQED5z3s+/wMn9GrQuogDyko5DybOjFNxPjdx53WiJV4xeEppTQIp6j?=
 =?us-ascii?Q?i9C7sm7G/OKHPFOqacFySc0DorZusAm5JR3K6uP4rcHN2ApbpehZFeyKRkO/?=
 =?us-ascii?Q?8kjZ595pPiZHKFN9McX66K18rejQnsAPgHvtH61GTks63H4mp7iZGsUENhMp?=
 =?us-ascii?Q?I71/0nun?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4316CE245E10B869C014C2FF8DBB9DM6PR11MB4316namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7ec030-1c5f-4f3f-c97c-08d8c2d26734
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 14:47:00.1979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtELu3Ja16FzqQM1RncBCzhIWrBRX1vP6rhDTdWB7ipqARs3x9qXXhaQdCdcrD43hRQSZGj3rOPtp9dSwnmiHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2906
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=wentong.wu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_DM6PR11MB4316CE245E10B869C014C2FF8DBB9DM6PR11MB4316namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There is a doc about the API of memory-mapped file on Windows https://docs.=
microsoft.com/en-us/previous-versions/ms810613(v=3Dmsdn.10)?redirectedfrom=
=3DMSDN, not sure anyone is working on it.

Thanks
Wentong

--_000_DM6PR11MB4316CE245E10B869C014C2FF8DBB9DM6PR11MB4316namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">There is a doc about the API of memory-mapped file o=
n Windows
<a href=3D"https://docs.microsoft.com/en-us/previous-versions/ms810613(v=3D=
msdn.10)?redirectedfrom=3DMSDN">
https://docs.microsoft.com/en-us/previous-versions/ms810613(v=3Dmsdn.10)?re=
directedfrom=3DMSDN</a>, not sure anyone is working on it.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Wentong <o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB4316CE245E10B869C014C2FF8DBB9DM6PR11MB4316namp_--

