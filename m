Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5A585089
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:12:02 +0200 (CEST)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPmY-0001Rb-5i
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anbang.huo@ecarxgroup.com>)
 id 1oHLLj-0002mf-VH
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 04:28:03 -0400
Received: from mail-am6eur05on20626.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::626]:31156
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anbang.huo@ecarxgroup.com>)
 id 1oHLLf-0003Hh-Cf
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 04:27:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWri3jCNfocZKzwvX4Aup1Msc4YzRx16G/kbG85IQt5rXdiTjTrKBo7Ng+QrgOkbEzeCAj8MTyaCuMY+ZSDrlRW8Jdpnq19sPnDzbLpfO0x6gArvb0u3+q0QiJVcEnsAf3JSiAokBILNl2xpc2hXfX61gNS9WtBjxAmeZN4YvQ61YMsKJo1JYl7j+AQaoUEjQ5cHMIkJfrOq5DTMPYgWN4F9wn0V7amt84A2WsPPp2YClnD+aZMlMN761gt01Fy828gJEs6hv9WD/Rdi6eHo1RznfT7PoVzDb4cNHfZloW7KwTzdRyPNn3W5ciagqr4XZGqwhEJ3pR3SqA4u0JDsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HspFDug7yHU9FRNzYhosK2R2p6WnX0S5j4SPdcmKqsU=;
 b=InNfa762esb48++d4CLch8rz0x6F+xPhLGdYLm8N+CBhKzZEakZUvBeQlEW/lusXtf9mTSnid4t/5E1orGH+NncAiZzrs8L0q4OtQO5NCe4/IbVYVKqxsDX27eZJSWSFn1rLNGgv1EbxFuuk8PoGGS/pYdqTid8CNKRnc98mhaMfP4tF/l8YTNYEhax3Xg+QYOOfZQD22/6TEBLxoeIifiF8GGlbEPWryM4aYzWiAk78o5DANePqwieCSorGg3hyI4mSQagQIHpU8vKGJvn7HISzcdeotpliQ2eYxVyaJ+I8fO0y8e0xU/cgWILODxoa3dJtKh5kcHxCuymu8QA4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 183.136.190.140) smtp.rcpttodomain=nongnu.org smtp.mailfrom=ecarxgroup.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ecarxgroup.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ecarxgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HspFDug7yHU9FRNzYhosK2R2p6WnX0S5j4SPdcmKqsU=;
 b=oqax3x82MwxS8K19BHChcDQwCt+T/GrnBdCockWh19wpF555aBAossMJIAbldQK9hAnioJFqyi9p1EsjZ/r15x3QAJ+cObsdB+wcSGhlVwJPfoQlsRcjvDAxkOW3GQ7XlrBMy9G+gXZozqddQsMxdM9ZviHx5dnn5JeH0JtSQstMXXaouTcbSm403Q3d0ottjZsJ37YApZ0sDZK+2Bw6EpIzDNW3z9sWuThTVmsyP6/zwTT1fcX8aGn6Exzzo8CsYH8Zz6fuK8ZXB0opGigGqZYkn9+EzHn2wBRAXplFtvqKNl0w6h3lvXxDwdFHgLBbEHzNz0PhLVQIrmZLxCy4lg==
Received: from AS9PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:20b:531::21)
 by VI1PR01MB7072.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:193::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 08:22:49 +0000
Received: from AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::c1) by AS9PR04CA0127.outlook.office365.com
 (2603:10a6:20b:531::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Fri, 29 Jul 2022 08:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 183.136.190.140)
 smtp.mailfrom=ecarxgroup.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ecarxgroup.com;
Received-SPF: Pass (protection.outlook.com: domain of ecarxgroup.com
 designates 183.136.190.140 as permitted sender)
 receiver=protection.outlook.com; client-ip=183.136.190.140;
 helo=CN01MAIL03.ecarx.com.cn; pr=C
Received: from CN01MAIL03.ecarx.com.cn (183.136.190.140) by
 AM6EUR05FT011.mail.protection.outlook.com (10.233.241.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Fri, 29 Jul 2022 08:22:47 +0000
Received: from CN01MAIL01.ecarx.com.cn (10.43.200.27) by
 CN01MAIL03.ecarx.com.cn (10.43.200.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 29 Jul 2022 16:22:45 +0800
Received: from CN01MAIL01.ecarx.com.cn ([fe80::942f:be89:d2c0:d3ca]) by
 CN01MAIL01.ecarx.com.cn ([fe80::942f:be89:d2c0:d3ca%4]) with mapi id
 15.01.2176.009; Fri, 29 Jul 2022 16:22:45 +0800
From: =?gb2312?B?SHVvQW5iYW5nL7v0sLKw7w==?= <anbang.huo@ecarxgroup.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Bluetooth System Application
Thread-Topic: Bluetooth System Application
Thread-Index: AdijJCMv1UCedYHWS3W9GVDK2zZv3Q==
Date: Fri, 29 Jul 2022 08:22:44 +0000
Message-ID: <7bae9e4d70754ad9b6750b1d180d0add@ecarxgroup.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.43.200.13]
Content-Type: multipart/alternative;
 boundary="_000_7bae9e4d70754ad9b6750b1d180d0addecarxgroupcom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2dde4ac-682e-47d2-3865-08da713b8561
X-MS-TrafficTypeDiagnostic: VI1PR01MB7072:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDvd2vl6axmnWlm73yFvR0OorWIb4nvgBCr5OyslmR9x+kf0JOA5Zopj2L+2FPyWU6h1FE70P9gKR0K0TcXBjEICuXb1SyMCMHc6h+zUPjlFkZjoVluFozU6dvAAtIUMULwpwG4DLJfzBkF9GvI8pCyQ3Y6y5ECDqSANKbw+GYCdp2QhuiKCRSX+woPgfIL0gHW34QEalUrzHRAF9AxLXGO/UE8ztGhaw+iegtPdGxSCVRIcstvu8eEvUD8DkMd7dDrvTTtWhGJB270yXoDl298t5w/6jkr7xgfGHFRlY3VhAZr+NAUx977U0PARpfg4d3eORsm1oN/iepHnmEdT78R9q4EbcX5YBcDMmH4UDIxrsQ2KQ08LLGM2GSh1Wa/XtaXIUE2HNZPCXo85bxbdk8Gki2xQCDEdKmxI92NV+nslKcwFW66vfLeFW1g6Tz9FMziEwnuiqqspvpNhviYjX5YX5pvCeZM/H8ZWIXbQytpeZ4gB39NZYvQCjemZcBLa7effOgIGVR1KTyKCxWrTjtDO9fSuHRQ+nspxE+str7ZwG1/pd+J/SZYLtJTKNc2I4Hvz9m7+y7U5jSFJlCjZA23tvDgJPb//c3J+QFotwYPd3VFE1J9PIen1TvTHlKe3oGvR8ewE087aXxmHqjUdDV8y1wDjsscsZPIClMyEcL8FsQlbEFn52Mx1i4rE5d7nrwLgquJy1vS1b2gMm8q6KRHvvgY2oent1P7d2cSY2ylAO2Iq5T/mgZln6jJmH9YtRTLlLzjznVOKeC7on3U7Z/HGFnlAx2i/VlC7MV7o4q+FekedmtjUuCd/iuoZEtmR863a7x9oAX25PypirIJieQ==
X-Forefront-Antispam-Report: CIP:183.136.190.140; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CN01MAIL03.ecarx.com.cn; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(39850400004)(396003)(36840700001)(46966006)(40470700004)(6916009)(41300700001)(478600001)(186003)(24736004)(26005)(47076005)(108616005)(336012)(82740400003)(36860700001)(81166007)(2616005)(8936002)(5660300002)(8676002)(85182001)(36756003)(40480700001)(564344004)(40460700003)(3480700007)(82310400005)(2906002)(316002)(356005)(7116003)(70206006)(70586007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ecarxgroup.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 08:22:47.4222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dde4ac-682e-47d2-3865-08da713b8561
X-MS-Exchange-CrossTenant-Id: dbb6c589-23f2-4a0b-9518-e075818e7b45
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=dbb6c589-23f2-4a0b-9518-e075818e7b45; Ip=[183.136.190.140];
 Helo=[CN01MAIL03.ecarx.com.cn]
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7072
Received-SPF: pass client-ip=2a01:111:f400:7e1b::626;
 envelope-from=anbang.huo@ecarxgroup.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 29 Jul 2022 09:06:34 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

--_000_7bae9e4d70754ad9b6750b1d180d0addecarxgroupcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SEk6DQogIEF0IHByZXNlbnQsIEkgbmVlZCB0byB1c2UgUUVNVSB0byB2aXJ0dWFsaXplIHRoZSBC
bHVldG9vdGggc3lzdGVtLiBNYXkgSSBhc2sgaG93IHRvIGRlYWwgd2l0aCBpdD8NCg0KVGhhbmtz
DQo=

--_000_7bae9e4d70754ad9b6750b1d180d0addecarxgroupcom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; </span><span lang=3D"EN-=
US" style=3D"font-family:&quot;Arial&quot;,sans-serif;color:#4A90E2;backgro=
und:#F7F8FA">At present, I need to use QEMU to virtualize the Bluetooth sys=
tem. May I ask how to deal with it?&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#4A90E2;background:#F7F8FA"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#4A90E2;background:#F7F8FA">Thanks</span><span lan=
g=3D"EN-US"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_7bae9e4d70754ad9b6750b1d180d0addecarxgroupcom_--

