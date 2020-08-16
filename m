Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC4B2459C0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 00:02:40 +0200 (CEST)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7Qjf-0002zL-KP
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 18:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mahmoud_Eltahawy@mentor.com>)
 id 1k7Qin-0002XL-9Y
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 18:01:45 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:16991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mahmoud_Eltahawy@mentor.com>)
 id 1k7Qil-00035W-0v
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 18:01:44 -0400
IronPort-SDR: mAsBIvJf7c+EDYO3me41V4zEQgwc/A0fa+QmP75rfkPH6kAGwoQoq0oCpzsfaN6cO1P6eCpDVk
 4m506To/DBHiI06jI7eDRFjIANZeg5B1TjE3pu3tQ1hdmRlILJ3tjVLkyAf1D5xL2gG5UzAulx
 /ZSLj4LAEcHC6qFEcfB1EPFJBsgZ2afuvro08o5FiF2gRt7IJHMXvxIJS12fD5+64H375L79lh
 GK0Wi6lLh/16JwxFjxtZYWkxCnQWVY3+cmbs5ipjn/cwzycxML01VNgz2JO/oqVJBCDlM1v0pV
 sOY=
X-IronPort-AV: E=Sophos;i="5.76,321,1592899200"; d="scan'208,217";a="52083321"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2020 14:01:37 -0800
IronPort-SDR: YyeyHkFJFztZDoykRpiZbsKbsNb61tdQCVH0o/MdpOAH7G3biXlCuGPSNcZ5qim1aY/cyNyFFb
 np6T06CAAUegyG0k7r3I44u8Ak2F3xcgSVCiDfObSKjSPL46B2cvN/j2HvJGJq3lpzw20OmWeT
 FfwfbPStI3u93watzVoORMtCr0mnCgVPhaMH8+LjQCXXrimvMsoWzV+zFVbCp/9ex1SqlKHQuD
 drah5ehHxAcqQU1vFmhmVtImSyW6XozdKvVkrUYvBINtA2znXg1/ieLrhxkP8o4+7fDKUTUFjp
 yx0=
From: "Eltahawy, Mahmoud" <Mahmoud_Eltahawy@mentor.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Guest Physical addresses tracking in KVM mode
Thread-Topic: Guest Physical addresses tracking in KVM mode
Thread-Index: AdZ0GLi+H9jaculbSRO1gaR1dOnomA==
Date: Sun, 16 Aug 2020 22:01:33 +0000
Message-ID: <68b98b0560a14fdd86442aaa85b27108@svr-ies-mbx-01.mgc.mentorg.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: multipart/alternative;
 boundary="_000_68b98b0560a14fdd86442aaa85b27108svriesmbx01mgcmentorgco_"
MIME-Version: 1.0
Received-SPF: pass client-ip=68.232.137.252;
 envelope-from=Mahmoud_Eltahawy@mentor.com; helo=esa4.mentor.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/16 18:01:38
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

--_000_68b98b0560a14fdd86442aaa85b27108svriesmbx01mgcmentorgco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I want to ask if it is possible to monitor the Guest Physical addresses ins=
ide QEMU code while running with KVM mode.
Appreciate your help

Thanks
Mahmoud

--_000_68b98b0560a14fdd86442aaa85b27108svriesmbx01mgcmentorgco_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to ask if it is possible to monitor the Guest=
 Physical addresses inside QEMU code while running with KVM mode.<o:p></o:p=
></p>
<p class=3D"MsoNormal">Appreciate your help<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Mahmoud<o:p></o:p></p>
</div>
</body>
</html>

--_000_68b98b0560a14fdd86442aaa85b27108svriesmbx01mgcmentorgco_--

