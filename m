Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68516F2A82
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 21:50:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptD3O-0004jy-TK; Sun, 30 Apr 2023 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <contact@canokeys.org>)
 id 1pt9jb-0006tL-WB
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 12:17:12 -0400
Received: from t05.bc.larksuite.com ([209.127.231.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <contact@canokeys.org>)
 id 1pt9jX-0003dX-DG
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 12:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=canokeys-org.20200927.dkim.feishu.cn; t=1682871407;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=j6tfKXObaDUQEEG9Rdo+rokEVpj352UD7d0RBnJy6kA=;
 b=Bw93+UrYmz3EVxDrtrPqgEUVAPdCZUtqkEDlpSPzYfP5x5SaZilAYvr6JrXgwe7Yg5WASj
 Ttwwi+oZ+9baOwFDVk0+q6yL2q5GeGgd3ZxnBOe+yJ1OjTj/diQf9rzBuwMlI8zpJEVrvz
 mSGWVLMk1PY58YJd0E2bT7EcCnPJisOwaMp3GhZWbWMsiKrJpwoPq9eoaNOySmfZzqDBnZ
 ixLSNiV/eZIBYTR7AS3MwUfq8jyGkMoPwBSew7Gij7zF4BWI3yHVdFZBTL+1E7mudVFTk5
 Q6KEMVohY6p+oaMpymPYJKYxcnFrhfJWZ/SNMMRXckOox4uytVr6AZU1MBzVaQ==
From: "CanoKey Support" <contact@canokeys.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary=1a1fff1d48ff54fdfeb3fbdfbf6b771233b7542f7aa9619369718c11db84
Cc: =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "Gerd Hoffmann" <kraxel@redhat.com>, "MkfsSion" <mkfssion@mkfssion.com>,
 "qemu-devel" <qemu-devel@nongnu.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: =?UTF-8?q?=E5=9B=9E=E5=A4=8D=EF=BC=9A[PATCH]_hw/usb/canokey:_change_licen?=
 =?UTF-8?q?se_to_GPLv2+?=
In-Reply-To: <ZE5z+2WbvVpTa82H@Sun>
X-Lms-Return-Path: <lba+1644e9464+8d4232+nongnu.org+contact@canokeys.org>
Date: Mon, 01 May 2023 00:16:36 +0800
Message-Id: <55c999f8c0c33e98d72b123492a3cedbd7789f7d.15e35f36.aef6.49a1.b25d.f925b666a83b@feishu.cn>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Received-SPF: pass client-ip=209.127.231.56; envelope-from=contact@canokeys.org;
 helo=t05.bc.larksuite.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 30 Apr 2023 15:49:46 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--1a1fff1d48ff54fdfeb3fbdfbf6b771233b7542f7aa9619369718c11db84
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Apache license is considered by some to be not compatible
> with GPLv2+. Since QEMU as combined work is GPLv2-only,
> these two files should be made compatible.
>=20
> Reported-by: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Link:https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@redhat.com/
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> Acked-By:canokeys.org<http://canokeys.org><contact@canokeys.org>
> ---
> hw/usb/canokey.c | 2 +-
> hw/usb/canokey.h | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> index bbc5da07b5..b306eeb20e 100644
> --- a/hw/usb/canokey.c
> +++ b/hw/usb/canokey.c
> @@ -4,7 +4,7 @@
> =C2=A0 * Copyright (c) 2021-2022Canokeys.org<http://Canokeys.org><contact=
@canokeys.org>
> =C2=A0 * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> =C2=A0 *
> - * This code is licensed under the Apache-2.0.
> + * This code is licensed under the GPL v2 or later.
> =C2=A0 */
> =C2=A0
> #include "qemu/osdep.h"
> diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
> index 24cf304203..e528889d33 100644
> --- a/hw/usb/canokey.h
> +++ b/hw/usb/canokey.h
> @@ -4,7 +4,7 @@
> =C2=A0 * Copyright (c) 2021-2022Canokeys.org<http://Canokeys.org><contact=
@canokeys.org>
> =C2=A0 * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> =C2=A0 *
> - * This code is licensed under the Apache-2.0.
> + * This code is licensed under the GPL v2 or later.
> =C2=A0 */
> =C2=A0
> #ifndef CANOKEY_H
> --
> 2.37.2
--1a1fff1d48ff54fdfeb3fbdfbf6b771233b7542f7aa9619369718c11db84
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div id=3D"editor_version_1.26.3_ejQlURxx" style=3D"word-break:break-word;"=
><div data-zone-id=3D"0" data-line-index=3D"0" data-line=3D"true" style=3D"=
margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><div class=3D"" sty=
le=3D"font-size: 14px;">Apache license is considered by some to be not comp=
atible
</div></div></div><div class=3D"history-quote-wrapper" style=3D"word-break:=
 break-word;" id=3D"lark-mail-quote-168287139"><div data-zone-id=3D"0" data=
-line-index=3D"1" data-line=3D"true" class=3D"history-quote-line" style=3D"=
margin-top: 4px; margin-bottom: 4px; line-height: 1.6;"><div class=3D"" sty=
le=3D"font-size: 14px;">with GPLv2+. Since QEMU as combined work is GPLv2-o=
nly,
</div></div><div data-zone-id=3D"0" data-line-index=3D"2" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">these two f=
iles should be made compatible.
</div></div><div data-zone-id=3D"0" data-line-index=3D"3" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"><br></div><=
/div><div data-zone-id=3D"0" data-line-index=3D"4" data-line=3D"true" class=
=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px; line-=
height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">Reported-by: "Dani=
el P. Berrang=C3=A9" &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_=
blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0s;=
 margin-right: 2px; cursor: pointer; text-decoration: none; color: rgb(51, =
112, 255);">berrange@redhat.com</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"5" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">Link: <a hr=
ef=3D"https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@redhat.com/" ta=
rget=3D"_blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s=
 ease 0s; margin-right: 2px; cursor: pointer; text-decoration: none; color:=
 rgb(51, 112, 255);">https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@=
redhat.com/</a>
</div></div><div data-zone-id=3D"0" data-line-index=3D"6" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">Signed-off-=
by: Hongren (Zenithal) Zheng &lt;<a href=3D"mailto:i@zenithal.me" target=3D=
"_blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0=
s; margin-right: 2px; cursor: pointer; text-decoration: none; color: rgb(51=
, 112, 255);">i@zenithal.me</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"7" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">Acked-By: <=
a href=3D"http://canokeys.org" target=3D"_blank" rel=3D"noopener noreferrer=
" style=3D"transition: color 0.3s ease 0s; margin-right: 2px; cursor: point=
er; text-decoration: none; color: rgb(51, 112, 255);">canokeys.org</a> &lt;=
<a href=3D"mailto:contact@canokeys.org" target=3D"_blank" rel=3D"noopener n=
oreferrer" style=3D"transition: color 0.3s ease 0s; margin-right: 2px; curs=
or: pointer; text-decoration: none; color: rgb(51, 112, 255);">contact@cano=
keys.org</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"8" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">---
</div></div><div data-zone-id=3D"0" data-line-index=3D"9" data-line=3D"true=
" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px=
; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"> hw/usb/can=
okey.c | 2 +-
</div></div><div data-zone-id=3D"0" data-line-index=3D"10" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"> hw/usb/ca=
nokey.h | 2 +-
</div></div><div data-zone-id=3D"0" data-line-index=3D"11" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"> 2 files c=
hanged, 2 insertions(+), 2 deletions(-)
</div></div><div data-zone-id=3D"0" data-line-index=3D"12" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"><br></div>=
</div><div data-zone-id=3D"0" data-line-index=3D"13" data-line=3D"true" cla=
ss=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4px; lin=
e-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">diff --git a/hw/=
usb/canokey.c b/hw/usb/canokey.c
</div></div><div data-zone-id=3D"0" data-line-index=3D"14" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">index bbc5=
da07b5..b306eeb20e 100644
</div></div><div data-zone-id=3D"0" data-line-index=3D"15" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">--- a/hw/u=
sb/canokey.c
</div></div><div data-zone-id=3D"0" data-line-index=3D"16" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">+++ b/hw/u=
sb/canokey.c
</div></div><div data-zone-id=3D"0" data-line-index=3D"17" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">@@ -4,7 +4=
,7 @@
</div></div><div data-zone-id=3D"0" data-line-index=3D"18" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; * C=
opyright (c) 2021-2022 <a href=3D"http://Canokeys.org" target=3D"_blank" re=
l=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0s; margin-r=
ight: 2px; cursor: pointer; text-decoration: none; color: rgb(51, 112, 255)=
;">Canokeys.org</a> &lt;<a href=3D"mailto:contact@canokeys.org" target=3D"_=
blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0s;=
 margin-right: 2px; cursor: pointer; text-decoration: none; color: rgb(51, =
112, 255);">contact@canokeys.org</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"19" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; * W=
ritten by Hongren (Zenithal) Zheng &lt;<a href=3D"mailto:i@zenithal.me" tar=
get=3D"_blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s =
ease 0s; margin-right: 2px; cursor: pointer; text-decoration: none; color: =
rgb(51, 112, 255);">i@zenithal.me</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"20" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; *
</div></div><div data-zone-id=3D"0" data-line-index=3D"21" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">- * This c=
ode is licensed under the Apache-2.0.
</div></div><div data-zone-id=3D"0" data-line-index=3D"22" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">+ * This c=
ode is licensed under the GPL v2 or later.
</div></div><div data-zone-id=3D"0" data-line-index=3D"23" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; */
</div></div><div data-zone-id=3D"0" data-line-index=3D"24" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"><span>&nbs=
p;
</span></div></div><div data-zone-id=3D"0" data-line-index=3D"25" data-line=
=3D"true" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bot=
tom: 4px; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"> #i=
nclude "qemu/osdep.h"
</div></div><div data-zone-id=3D"0" data-line-index=3D"26" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">diff --git=
 a/hw/usb/canokey.h b/hw/usb/canokey.h
</div></div><div data-zone-id=3D"0" data-line-index=3D"27" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">index 24cf=
304203..e528889d33 100644
</div></div><div data-zone-id=3D"0" data-line-index=3D"28" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">--- a/hw/u=
sb/canokey.h
</div></div><div data-zone-id=3D"0" data-line-index=3D"29" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">+++ b/hw/u=
sb/canokey.h
</div></div><div data-zone-id=3D"0" data-line-index=3D"30" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">@@ -4,7 +4=
,7 @@
</div></div><div data-zone-id=3D"0" data-line-index=3D"31" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; * C=
opyright (c) 2021-2022 <a href=3D"http://Canokeys.org" target=3D"_blank" re=
l=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0s; margin-r=
ight: 2px; cursor: pointer; text-decoration: none; color: rgb(51, 112, 255)=
;">Canokeys.org</a> &lt;<a href=3D"mailto:contact@canokeys.org" target=3D"_=
blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s ease 0s;=
 margin-right: 2px; cursor: pointer; text-decoration: none; color: rgb(51, =
112, 255);">contact@canokeys.org</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"32" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; * W=
ritten by Hongren (Zenithal) Zheng &lt;<a href=3D"mailto:i@zenithal.me" tar=
get=3D"_blank" rel=3D"noopener noreferrer" style=3D"transition: color 0.3s =
ease 0s; margin-right: 2px; cursor: pointer; text-decoration: none; color: =
rgb(51, 112, 255);">i@zenithal.me</a>&gt;
</div></div><div data-zone-id=3D"0" data-line-index=3D"33" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; *
</div></div><div data-zone-id=3D"0" data-line-index=3D"34" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">- * This c=
ode is licensed under the Apache-2.0.
</div></div><div data-zone-id=3D"0" data-line-index=3D"35" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">+ * This c=
ode is licensed under the GPL v2 or later.
</div></div><div data-zone-id=3D"0" data-line-index=3D"36" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">&nbsp; */
</div></div><div data-zone-id=3D"0" data-line-index=3D"37" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"><span>&nbs=
p;
</span></div></div><div data-zone-id=3D"0" data-line-index=3D"38" data-line=
=3D"true" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bot=
tom: 4px; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;"> #i=
fndef CANOKEY_H
</div></div><div data-zone-id=3D"0" data-line-index=3D"39" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">--=20
</div></div><div data-zone-id=3D"0" data-line-index=3D"40" data-line=3D"tru=
e" class=3D"history-quote-line" style=3D"margin-top: 4px; margin-bottom: 4p=
x; line-height: 1.6;"><div class=3D"" style=3D"font-size: 14px;">2.37.2
</div></div></div>
--1a1fff1d48ff54fdfeb3fbdfbf6b771233b7542f7aa9619369718c11db84--

