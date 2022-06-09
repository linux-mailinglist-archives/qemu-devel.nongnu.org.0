Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48768544E74
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:13:13 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIuO-0006T3-92
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan@aitechgroup.co.za>)
 id 1nzHYc-0008Vz-FE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:46:38 -0400
Received: from spe5.ucebox.co.za ([197.242.152.133]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jan@aitechgroup.co.za>)
 id 1nzHYT-0002Tz-T2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:46:37 -0400
Received: from sunny.aserv.co.za ([154.0.172.134])
 by spe8.ucebox.co.za with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <jan@aitechgroup.co.za>)
 id 1nzHY4-0006FN-7c
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=aitechgroup.co.za; s=default; h=Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sgP+6DFa7o/oh9OnC9ZtsC7ONPAHKX3Ey3uSQJ8AHIw=; b=ayYYXh9jfogIsJOtipBZgW8emT
 m84KsI9P16kBRPUaoBiHzJ6ShWygHB30qnBWMcRQxtiCnbH/3/02Jf1SG4HXJMYsJRls9T+TUwpIp
 n1T8laqUl9kamzePeTXoYuI4febsE0KcvUUMq3hg7vOnlIu82oKlNNQww4ftTsk1tNmazXIKb1NB3
 cs/S9mHshuOtSlcPhwVEJC3ILSbqe/toP3MpOZeJbSl7BUwnZQzYFbE8FabL8OCkaGFAfOw17PcG9
 16a2Z5fMQaNd/R/10pyyyX7LeRSzCsrPovIH0zlbZFpY02xA9GDlUhd8lhorjUf+muhlN62qOjWX7
 6Om/TQQA==;
Received: from [146.232.52.106] (port=35077 helo=JL)
 by sunny.aserv.co.za with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jan@aitechgroup.co.za>) id 1nzHY2-000CYs-Ni
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:46:02 +0200
From: <jan@aitechgroup.co.za>
To: <qemu-devel@nongnu.org>
References: 
In-Reply-To: 
Subject: Using Qemu to isolate/virtualize applications
Date: Thu, 9 Jun 2022 14:46:00 +0200
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAABjvNn0fFylGiile0N9hKioBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABq76So2ebGTZpSGNoiKoJmAQAAAAA=@aitechgroup.co.za>
MIME-Version: 1.0
Content-Type: multipart/related;
 boundary="----=_NextPart_000_0002_01D87C0F.A3953D10"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF4IIvvSr/ehD+VfEwhCpertWN9Ba4Hu7ew
Content-Language: en-za
X-Get-Message-Sender-Via: sunny.aserv.co.za: authenticated_id:
 jan@aitechgroup.co.za
X-Authenticated-Sender: sunny.aserv.co.za: jan@aitechgroup.co.za
X-Originating-IP: 154.0.172.134
X-Afrihost-Domain: sunny.aserv.co.za
X-Afrihost-Username: 154.0.172.134
Authentication-Results: ucebox.co.za;
 auth=pass smtp.auth=154.0.172.134@sunny.aserv.co.za
X-Afrihost-Outgoing-Class: ham
X-Afrihost-Outgoing-Evidence: Combined (0.27)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/fWFS0cUnAci8pJW720X+hPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xUbXzExFviXDWTk35KdvgCTJYNC8Q3LqML+eJXYT0BJtcV
 PSoHm0W/3adFfiYl2nuH9MTTGS7UIiguiVzwoUJc/T4GcPvCLvSpAEEGy7kYxuJh+jYVlc3CVZAm
 jZcUxyMwnnQeceSEqScl3UqTo0wUEjeL3b4da9nBsN02Bj5mTa89jJvJeHY9KTDbWRQ4iAWiKOzR
 0FGFxVuI5n5QwHvmXzxdcSEOF5ZgjdwpVsfMm9dCYgcgr835yVjKQZA6hJL1LiMHCxRezvZaFOrU
 Vh8zNqs59tg7m1SQLJtFApHh60KEcxAcIwRZNf0cSHBI/j8xKX6Z6/Qz1w7TE/bz3YPRDfgblxZ8
 KT4UwlLW+nAm2eZE7YJwhBWCb1PmFojBOyjXs2KsRjKrCowEavDwQuKoDMwQiNpECc6NeluD4mMa
 /1YmDHeI9dU6Rq238kXYC+KNLtSRWKGmohoil/1AiKo+tkgXyuidojvEg3qjfiiAf/vg7iEFLP+S
 SY+Av5+AiC4Q9+LS5YIOCn3baNtafsxJutq7290k2Vb0So4nrTnOTc9oyn83f+sJ/eWBvQAAUYVi
 7wLmYnntkb2D1B9sGkgXjmKqVuWj16/eADH0Zaayt0NU9Dp8x6/UEw+9D2q7hxbTPpuFqUUQz+mM
 8JAD4ECW/9TmdGQS9MS1cs71cXQ1NT4fRBO4Vp3zkt7tCVBbyRAlCXAKHUuxHPyBEVrwcnfBJMIC
 PPaLambx5zeUcmOghw5Vxm/bnhrVKymAutkEJf+NvSJuqsCYDLYwPg0qIRnow6nIoDr0sXUZ7YZo
 Z/GZ+q9IYNOeOs4415gJ2Ok8EtUbN1uw4Ep9Vn923vgqAdmBfryJIwZc0qPaLQ4cIH/b3BcyBfcJ
 laPlEu50FQOBn0USo7CfEbHh+ueVDBxHlI+4+Z14cnlDLfxJVlFatvRYSwgC422CT1QLgSBnQ7Kx
 ws0=
X-Report-Abuse-To: spam@spe1.ucebox.co.za
Received-SPF: pass client-ip=197.242.152.133;
 envelope-from=jan@aitechgroup.co.za; helo=spe5.ucebox.co.za
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_05=-0.5, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:21 -0400
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

This is a multipart message in MIME format.

------=_NextPart_000_0002_01D87C0F.A3953D10
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0003_01D87C0F.A3953D10"


------=_NextPart_001_0003_01D87C0F.A3953D10
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'm interested in investigating the possibility of running applications in a
virtualized/isolated manner to minimize access to the OS
(Windows/Linux/Android). Preferably there should be no or minimal software
changes to the guest OS or application binary.

 

Generally applications in an OS can perform the following hardware
read/write operations:

*                   Memory

*                   Internal and external disks (file system APIs)

*                   Network (Ethernet, WiFi) (socket APIs)

*                   Ports (for low level hardware access) (assembler
instructions)

 

My understanding is that memory, disk, network and ports are virtualized
through Qemu and therefore it may be possible to:

*                   monitor access (beyond the monitoring provided by the
guest OS)

*                   manage access (beyond the access rights provided by the
guest OS)

*                   undo disk changes without rebooting the guest OS

from Qemu regardless of the guest OS.

 

Assume a zero trust model for the guest OS and the application being
executed on it:

*	a hacker can compromise the admin or root account 
*	kernel and user APIs can be exploited with or without admin or root
access due to vulnerabilities

 

The network layer may be the easiest to implement if you want to just deny
incoming/outgoing packets regardless of the process or kernel/user context. 

 

The problem with memory, disk, network and port access is that the CPU has
no concept of process IDs or user IDs. The OS does the context switching to
provide a time slice to each process during which the CPU executes the
relevant instructions. Therefor one will have to develop drivers that can
pass the process and user IDs to such an access monitoring/control system.

 

The ideal is to restrict user mode applications to:

*	Only access memory that belongs to the application process
*	Only access files/folders that it has been granted access to via an
external mechanism
*	Only send/receive network data that it has been granted access to
via an external mechanism
*	Only access ports that it has been granted access to via an external
mechanism

 

By external mechanism, I mean that the permissions are granted and managed
outside the guest OS and if Qemu is used, that would be the host OS.  If
restricting these actions are not possible, monitoring/detecting these
actions would already be useful.

 

My question is whether Qemu would be a useful tool in such a system.  The
emulation feature of Qemu could perhaps be used to instrument certain CPU
instructions, even if the guest and host are the same architecture.  

 

I will appreciate your thoughts on this

Best regards

Jan Louw

 

CTO AITechGroup

South Africa

https://aitechgroup.co.za/

 



 

 

 


------=_NextPart_001_0003_01D87C0F.A3953D10
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><!--[if !mso]><style>v\:* =
{behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:572933909;
	mso-list-type:hybrid;
	mso-list-template-ids:1278620560 470351873 470351875 470351877 =
470351873 470351875 470351877 470351873 470351875 470351877;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:591549849;
	mso-list-type:hybrid;
	mso-list-template-ids:2083804402 470351873 -1 -1 -1 -1 -1 -1 -1 -1;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1196579101;
	mso-list-type:hybrid;
	mso-list-template-ids:-306445146 470351873 -1 -1 -1 -1 -1 -1 -1 -1;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:0cm;
	text-indent:0cm;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:90.0pt;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:198.0pt;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:306.0pt;
	text-indent:-9.0pt;}
@list l3
	{mso-list-id:1278678794;
	mso-list-type:hybrid;
	mso-list-template-ids:839577808 470351873 -1 -1 -1 -1 -1 -1 -1 -1;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:0cm;
	text-indent:0cm;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4
	{mso-list-id:1966354069;
	mso-list-template-ids:-1525239334;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level3
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level4
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level5
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level6
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level7
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level8
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level9
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5
	{mso-list-id:2109151349;
	mso-list-template-ids:-516377974;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level3
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level4
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level5
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level6
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level7
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level8
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level9
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-ZA =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>I&#8217;m interested in investigating the possibility of =
running applications in a virtualized/isolated manner to minimize access =
to the OS (Windows/Linux/Android). Preferably there should be no or =
minimal software changes to the guest OS or application =
binary.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Generally applications in an OS can perform the following =
hardware read/write operations:<o:p></o:p></span></p><p =
class=3DMsoListParagraph style=3D'text-indent:0cm;mso-list:l2 level1 =
lfo2'><![if !supportLists]><span lang=3DEN-US =
style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span =
lang=3DEN-US>Memory<o:p></o:p></span></p><p class=3DMsoListParagraph =
style=3D'text-indent:0cm;mso-list:l2 level1 lfo2'><![if =
!supportLists]><span lang=3DEN-US style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>Internal and external =
disks (file system APIs)<o:p></o:p></span></p><p =
class=3DMsoListParagraph style=3D'text-indent:0cm;mso-list:l2 level1 =
lfo2'><![if !supportLists]><span lang=3DEN-US =
style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>Network (Ethernet, =
WiFi) (socket APIs)<o:p></o:p></span></p><p class=3DMsoListParagraph =
style=3D'text-indent:0cm;mso-list:l2 level1 lfo2'><![if =
!supportLists]><span lang=3DEN-US style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>Ports (for low level =
hardware access) (assembler instructions)<o:p></o:p></span></p><p =
class=3DMsoListParagraph style=3D'margin-left:18.0pt'><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>My understanding is that memory, disk, network and ports =
are virtualized through Qemu and therefore it may be possible =
to:<o:p></o:p></span></p><p class=3DMsoListParagraph =
style=3D'text-indent:0cm;mso-list:l3 level1 lfo4'><![if =
!supportLists]><span lang=3DEN-US style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>monitor access (beyond =
the monitoring provided by the guest OS)<o:p></o:p></span></p><p =
class=3DMsoListParagraph style=3D'text-indent:0cm;mso-list:l3 level1 =
lfo4'><![if !supportLists]><span lang=3DEN-US =
style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>manage access (beyond =
the access rights provided by the guest OS)<o:p></o:p></span></p><p =
class=3DMsoListParagraph style=3D'text-indent:0cm;mso-list:l3 level1 =
lfo4'><![if !supportLists]><span lang=3DEN-US =
style=3D'font-family:Symbol'><span =
style=3D'mso-list:Ignore'>&middot;<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span></span><![endif]><span lang=3DEN-US>undo disk changes =
without rebooting the guest OS<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>from Qemu regardless of the guest =
OS.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Assume a zero trust model for the guest OS and the =
application being executed on it:<o:p></o:p></span></p><ul =
style=3D'margin-top:0cm' type=3Ddisc><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l1 level1 lfo7'><span lang=3DEN-US>a =
hacker can compromise the admin or root account =
<o:p></o:p></span></li><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l1 level1 lfo7'><span =
lang=3DEN-US>kernel and user APIs can be exploited with or without admin =
or root access due to vulnerabilities<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>The network layer may be the =
easiest to implement if you want to just deny incoming/outgoing packets =
regardless of the process or kernel/user context. =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>The problem with memory, disk, network and port access is =
that the CPU has no concept of process IDs or user IDs. The OS does the =
context switching to provide a time slice to each process during which =
the CPU executes the relevant instructions. Therefor one will have to =
develop drivers that can pass the process and user IDs to such an access =
monitoring/control system.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>The ideal is to restrict user mode =
applications to:<o:p></o:p></span></p><ul style=3D'margin-top:0cm' =
type=3Ddisc><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo10'><span =
lang=3DEN-US>Only access memory that belongs to the application =
process<o:p></o:p></span></li><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo10'><span =
lang=3DEN-US>Only access files/folders that it has been granted access =
to via an external mechanism<o:p></o:p></span></li><li =
class=3DMsoListParagraph style=3D'margin-left:0cm;mso-list:l0 level1 =
lfo10'><span lang=3DEN-US>Only send/receive network data that it has =
been granted access to via an external =
mechanism<o:p></o:p></span></li><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo10'><span =
lang=3DEN-US>Only access ports that it has been granted access to via an =
external mechanism<o:p></o:p></span></li></ul><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>By external mechanism, I mean that the permissions are =
granted and managed outside the guest OS and if Qemu is used, that would =
be the host OS.&nbsp; If restricting these actions are not possible, =
monitoring/detecting these actions would already be =
useful.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>My question is whether Qemu would be a useful tool in such =
a system.&nbsp; The emulation feature of Qemu could perhaps be used to =
instrument certain CPU instructions, even if the guest and host are the =
same architecture.&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>I will appreciate your thoughts on =
this<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Best =
regards<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Jan =
Louw<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ZA'>CTO =
AITechGroup<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ZA'>South =
Africa<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ZA'><a =
href=3D"https://aitechgroup.co.za/">https://aitechgroup.co.za/</a><o:p></=
o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ZA'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-ZA'><img border=3D0 width=3D200 =
height=3D200 style=3D'width:2.0833in;height:2.0833in' =
id=3D"Picture_x0020_6" src=3D"cid:image001.png@01D86B87.C7964260" =
alt=3D"Logo, company name&#10;&#10;Description automatically =
generated"></span><span =
style=3D'mso-fareast-language:EN-ZA'><o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_001_0003_01D87C0F.A3953D10--

------=_NextPart_000_0002_01D87C0F.A3953D10
Content-Type: image/png;
	name="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <image001.png@01D86B87.C7964260>

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

------=_NextPart_000_0002_01D87C0F.A3953D10--


