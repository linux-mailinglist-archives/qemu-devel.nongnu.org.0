Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF058F43F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 00:15:53 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLtzM-0000CI-Fy
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 18:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter-butler@comcast.net>)
 id 1oLtTY-00035W-PI
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 17:42:53 -0400
Received: from resqmta-a1p-077724.sys.comcast.net
 ([2001:558:fd01:2bb4::5]:52378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter-butler@comcast.net>)
 id 1oLtTW-0000p1-Nz
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 17:42:52 -0400
Received: from resomta-a1p-077060.sys.comcast.net ([96.103.145.238])
 by resqmta-a1p-077724.sys.comcast.net with ESMTP
 id LoUOovjfhaBt3LtTRov5Ev; Wed, 10 Aug 2022 21:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1660167765;
 bh=TjlrCZyeie2IIOuM6iVst2Ib7221cHPi2U1MZmb30sQ=;
 h=Received:Received:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To;
 b=RZDyh5tyPiBmTWH9Qj6394TfQg8hGCTg0bPOfBQWdJqGPJcol8htNTRhxldtaTMhp
 1fMzF1qfxyEKHud30ruYECqbgyWGK14rWTfzZPYrSYTKuvrzh+b5eDWvVudHUBDzvW
 f5ciaFUF/qjUtfyB69Ecal37PpWdY/h/BZkwbGKmv42Uvzd25OmU5I2QKYikN4l3rN
 aG4va1rELul3qbjsPblX3TjASwZhA6KCmSSPPgwCr6+CR4M9fqll7s76Z6eN/kh7fo
 JoRYSvU9brQqUIaBL8osphoJcUBL45I+Wm4qh+cb7p1wqc+ORN2F8dCeOhzzmZm3WN
 4X8/8qcZYsnOA==
Received: from [192.168.0.69] ([71.198.114.218])
 by resomta-a1p-077060.sys.comcast.net with ESMTPA
 id LtTPoQO1mqq84LtTRo8pZi; Wed, 10 Aug 2022 21:42:45 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucenucfjughrpegtggffkffuhffvfgesrgdtreertderjeenucfhrhhomhepfdfrvghtvghruceuuhhtlhgvrhdfuceophgvthgvrhdqsghuthhlvghrsegtohhmtggrshhtrdhnvghtqeenucggtffrrghtthgvrhhnpeetleejueeufeetjeelhfeutdeivdekheeugeehffehtefgkeehvedvhfduheevfeenucfkphepjedurdduleekrdduudegrddvudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddtrdeilegnpdhinhgvthepjedurdduleekrdduudegrddvudekpdhmrghilhhfrhhomhepphgvthgvrhdqsghuthhlvghrsegtohhmtggrshhtrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-Xfinity-VMeta: sc=0.00;st=legit
Content-Type: multipart/alternative;
 boundary="----=_NextPart_36766015.190071840210"
MIME-Version: 1.0
Date: Wed, 10 Aug 2022 14:42:42 -0700
Message-ID: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
Subject: Missing dll
From: "Peter Butler" <peter-butler@comcast.net>
To: "" <qemu-devel@nongnu.org>
User-Agent: Mailbird/2.9.61.0
X-Mailbird-ID: Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net
Received-SPF: pass client-ip=2001:558:fd01:2bb4::5;
 envelope-from=peter-butler@comcast.net;
 helo=resqmta-a1p-077724.sys.comcast.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 18:13:58 -0400
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

------=_NextPart_36766015.190071840210
Content-Type: text/plain;
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In x64 win10 I today I d/l QEMU into new directory. Then navigated to that =
dir and=E2=80=A6

qemu-system-aarch64 -boot d -cdrom f:\Downloads\debian-11.4.0-arm64-netinst=
.iso -m 2048
Error message:=E2=80=A6libncursesw6.dll not found=E2=80=A6
Please help
Thank you
------=_NextPart_36766015.190071840210
Content-Type: text/html;
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"__MailbirdStyleContent" style=3D"font-size: 12pt;font-family: Ar=
ial;color: #000000;text-align: left" dir=3D"ltr"><p class=3D"MsoNormal"><sp=
an style=3D"font-size: 12pt">In x64 win10 I today I d/l QEMU into new direc=
tory. Then navigated=0Ato that dir and=E2=80=A6</span><br></p>=0A=0A<p clas=
s=3D"MsoNormal">qemu-system-aarch64 -boot d -cdrom=0Af:\Downloads\debian-11=
.4.0-arm64-netinst.iso -m 2048</p>=0A=0A<p class=3D"MsoNormal">Error messag=
e:=E2=80=A6libncursesw6.dll not found=E2=80=A6</p>=0A=0A<p class=3D"MsoNorm=
al"><span style=3D"font-size: 12pt">Please help<br>Thank you</span></p><div=
 class=3D"mb_sig"></div></div>
------=_NextPart_36766015.190071840210--


