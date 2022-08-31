Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B75A7F55
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:54:51 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOB3-00026q-Ay
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO7Z-000727-S7
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:51:09 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO7Y-0002wP-0v
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:51:09 -0400
Received: by mail-lf1-x131.google.com with SMTP id g7so3093924lfe.11
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5cCtM/w1GKzMkPqXYaxuP1WvifK16J9kZw20i+ubCiU=;
 b=I5hNZ434bnoaEyJRrNPLBr+Qpms+LoqCxHFrstGOsbQounCXM0HNbIT7TL3wnWXazW
 1zLMKtpHUWo649169YkFsDd0tMR3u8BMH2JAozzmbDW7j7gthMipC4kr0ZGFiT58d8on
 unICKdvkwb1Qil0V6jWP8M4uhSJfcMg6NrrB/aOccxgPzzW5cly31Ebpf8FkKTMS8paV
 dj4Nyh3ndq7pAg80xkkPfipgGbk0dc3Hlu3d5Q4VGP1/gBBYqrsijxMsCvHFapNymG9b
 hF+uGXW/DK+karJpd6pmDPL34my40dwDvdcUiOZCHVJsRFQfLbDJO18/17VKMuGnXxhJ
 rI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5cCtM/w1GKzMkPqXYaxuP1WvifK16J9kZw20i+ubCiU=;
 b=giDrvHHvtlxUSTgxcaBMTuAc3zrYw2PAXTDmRFb1KNX4Dyp74HAKe2IfqxaxCxrWvS
 oofQyht0jMQQ2df3ENVG7Q+CsYqqgaZWV8k43xYyxiOlFz1KxoNnje2cbF6nZl14IhNZ
 RKrnMOjDPQANjBBB3fsHsMmoReF4YiGDnOrcZV76CbntNWSN4PnHq3svJlys77FRphQa
 NwEugGBoyNxJyYKSEauffSq4zXq/petTdXU4JeJVXHk4927SlQs3A9SQS/uUeU+IY090
 Zmmvgt12RuTHmuowQSkW0Y/pkXLa+tcieZ5IqXPZAUMW1mOog4v57QUunKdrPYQytSov
 sn+Q==
X-Gm-Message-State: ACgBeo2xN1qzIX+juBhSq64Spjo4qVUXyTRX5TVjc98B29JHHsI7Fww3
 4VArSdDBQDsB9sNweL0biKnvym2SvmJtB1N61tw=
X-Google-Smtp-Source: AA6agR6v0JvEjWtI4IzGq7yB+b+wJBhxbNAr/D2gfRh+pBA969RDYa+K70E0dT/vm91ay8HazOPFkH6BpGEs9iQZIzU=
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id
 i16-20020ac25b50000000b004945ec21ea5mr6754233lfp.276.1661953864395; Wed, 31
 Aug 2022 06:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-25-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-25-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:50:52 +0400
Message-ID: <CAJ+F1C+bDtFFFngGw1hAdikEEUxWvCz37a7wj+2x1u2JFR1ACw@mail.gmail.com>
Subject: Re: [PATCH 24/51] tests/qtest: libqos: Drop inclusion of <sys/wait.h>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b870a305e789c9cc"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

--000000000000b870a305e789c9cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> There is no <sys/wait.h> in the Windows build environment. Actually
> this is not needed in the non-win32 builds too. Drop it.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  tests/qtest/libqos/libqos.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tests/qtest/libqos/libqos.c b/tests/qtest/libqos/libqos.c
> index 85c7641add..5ffda080ec 100644
> --- a/tests/qtest/libqos/libqos.c
> +++ b/tests/qtest/libqos/libqos.c
> @@ -1,6 +1,4 @@
>  #include "qemu/osdep.h"
> -#include <sys/wait.h>
> -
>  #include "../libqtest.h"
>  #include "libqos.h"
>  #include "pci.h"
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b870a305e789c9cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:43 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzho=
u Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank"=
>xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
There is no &lt;sys/wait.h&gt; in the Windows build environment. Actually<b=
r>
this is not needed in the non-win32 builds too. Drop it.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0tests/qtest/libqos/libqos.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqos/libqos.c b/tests/qtest/libqos/libqos.c<br>
index 85c7641add..5ffda080ec 100644<br>
--- a/tests/qtest/libqos/libqos.c<br>
+++ b/tests/qtest/libqos/libqos.c<br>
@@ -1,6 +1,4 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &lt;sys/wait.h&gt;<br>
-<br>
=C2=A0#include &quot;../libqtest.h&quot;<br>
=C2=A0#include &quot;libqos.h&quot;<br>
=C2=A0#include &quot;pci.h&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b870a305e789c9cc--

