Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10045617C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 18:28:20 +0100 (CET)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnlCt-0004qc-EG
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 12:28:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mnlC3-00049k-1v
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:27:27 -0500
Received: from [2607:f8b0:4864:20::42e] (port=38825
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mnlC1-0007W9-Ha
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:27:26 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g18so6720421pfk.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 09:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9h7ZQprOlUXDFSMlB5bRnXVytvo2Uw7M8Jezw7CdWXQ=;
 b=P8ueiorDDTfRKgEsnRj512NqGyIqdGVclByCVDhL+rLfmLHOQRfGOM/5xcwbfFSir/
 eZZRIM6JRdZrtoPJJ/Xs1Avrr4Nz6sARWOEm3uYh7SJIZx8QLL/2l4k4RnQ1zfJA3bNK
 kc9XJ/YG8JqdMS4GguIQNrdCxJLotEpwsNoJkTFAtAGD4w/j19gRgOejoo6mYWl2os30
 DgGsA4gyoBuChbdVfx+wy5FQKVVq82m996ce2KhscqnJ2d6DF3H7yqc4neFychLI0gcY
 5H6NPgezf3I0CXUtwBlVZx8yCUZMXhDYDePgITPqSEWzsNQw/KpBG7kuhn6rg2Dn6Ygx
 ReMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9h7ZQprOlUXDFSMlB5bRnXVytvo2Uw7M8Jezw7CdWXQ=;
 b=QjwnXjVBnkLKIRawak7j5r0nbGyfJI3fwyJBJM3nVzU6g32CzYUOIMRCjwyfr2L94Y
 7rABiULG0E+jm9BAPe2FUewaMrvb/bd9cCIxTCMLNb5SBJ5U7jR48muBK2dYGTgn2Wnf
 5yPIe114f38dbNy19839mKIykQWsbAVC+27pMA9Kj/Jest5/Edklk9Xqo6x8TgitAkOF
 6/ff0MV1/vffqkrnEIFZSolz5SlN1kDKJGa9KlKQAMxgBcIz0aC50nA+4eVYWVuVE/M4
 PCuz3fWu+7UX9eAvW4EzyfHEbLqmJMb7YEHTycBRKDBGlNjzL4h7Era5OUbBZLDIdx0p
 QIXw==
X-Gm-Message-State: AOAM531tum5db5ov+/YHn+A+dfIxHX65Hw5opRo31FKzRNcU/IM2+d1N
 H80QZw6XxM12jIRDfZmOvDw61JmmdflwIWrJWxCFJFLarBA=
X-Google-Smtp-Source: ABdhPJwsebHrPrFInMboc7HooxO8iQuQCu2+ZuKaqyPba1+mQ03uq8s8vEHqN3cPjMXzpp8f7iJ16X7NacbwO4TxL+s=
X-Received: by 2002:a1f:7c85:: with SMTP id
 x127mr104954781vkc.10.1637256115510; 
 Thu, 18 Nov 2021 09:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20211108215831.2162883-1-venture@google.com>
In-Reply-To: <20211108215831.2162883-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Nov 2021 09:21:44 -0800
Message-ID: <CAO=notxq1x2a3XWnEqsDeAMMrtp9fnyuCKgerPfhc+ybOBWY4g@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: add pca9543 support to mux
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com
Content-Type: multipart/alternative; boundary="0000000000002c30a005d113650b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=venture@google.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000002c30a005d113650b
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 8, 2021 at 1:58 PM Patrick Venture <venture@google.com> wrote:

> Adds support for the 2 channel pca9543 i2c switch.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/i2c/i2c_mux_pca954x.c         | 12 ++++++++++++
>  include/hw/i2c/i2c_mux_pca954x.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> index 847c59921c..36a5c8cb31 100644
> --- a/hw/i2c/i2c_mux_pca954x.c
> +++ b/hw/i2c/i2c_mux_pca954x.c
> @@ -29,6 +29,7 @@
>
>  #define PCA9548_CHANNEL_COUNT 8
>  #define PCA9546_CHANNEL_COUNT 4
> +#define PCA9543_CHANNEL_COUNT 2
>
>  /*
>   * struct Pca954xChannel - The i2c mux device will have N of these states
> @@ -203,6 +204,12 @@ static void pca954x_channel_class_init(ObjectClass
> *klass, void *data)
>      dc->desc = "Pca954x Channel";
>  }
>
> +static void pca9543_class_init(ObjectClass *klass, void *data)
> +{
> +    Pca954xClass *s = PCA954X_CLASS(klass);
> +    s->nchans = PCA9543_CHANNEL_COUNT;
> +}
> +
>  static void pca9546_class_init(ObjectClass *klass, void *data)
>  {
>      Pca954xClass *s = PCA954X_CLASS(klass);
> @@ -268,6 +275,11 @@ static const TypeInfo pca954x_info[] = {
>          .class_init    = pca954x_class_init,
>          .abstract      = true,
>      },
> +    {
> +        .name          = TYPE_PCA9543,
> +        .parent        = TYPE_PCA954X,
> +        .class_init    = pca9543_class_init,
> +    },
>      {
>          .name          = TYPE_PCA9546,
>          .parent        = TYPE_PCA954X,
> diff --git a/include/hw/i2c/i2c_mux_pca954x.h
> b/include/hw/i2c/i2c_mux_pca954x.h
> index 8aaf9bbc39..91e2ffd0a2 100644
> --- a/include/hw/i2c/i2c_mux_pca954x.h
> +++ b/include/hw/i2c/i2c_mux_pca954x.h
> @@ -3,6 +3,7 @@
>
>  #include "hw/i2c/i2c.h"
>
> +#define TYPE_PCA9543 "pca9543"
>  #define TYPE_PCA9546 "pca9546"
>  #define TYPE_PCA9548 "pca9548"
>
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>
> Friendly ping. The patch itself is trivial, but let me know if I've
submitted it incorrectly since I also maintain this device.

-Patrick

--0000000000002c30a005d113650b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 1:58 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Adds =
support for the 2 channel pca9543 i2c switch.<br>
<br>
Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a>&gt;<br>
---<br>
=C2=A0hw/i2c/i2c_mux_pca954x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++=
++++++<br>
=C2=A0include/hw/i2c/i2c_mux_pca954x.h |=C2=A0 1 +<br>
=C2=A02 files changed, 13 insertions(+)<br>
<br>
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c<br>
index 847c59921c..36a5c8cb31 100644<br>
--- a/hw/i2c/i2c_mux_pca954x.c<br>
+++ b/hw/i2c/i2c_mux_pca954x.c<br>
@@ -29,6 +29,7 @@<br>
<br>
=C2=A0#define PCA9548_CHANNEL_COUNT 8<br>
=C2=A0#define PCA9546_CHANNEL_COUNT 4<br>
+#define PCA9543_CHANNEL_COUNT 2<br>
<br>
=C2=A0/*<br>
=C2=A0 * struct Pca954xChannel - The i2c mux device will have N of these st=
ates<br>
@@ -203,6 +204,12 @@ static void pca954x_channel_class_init(ObjectClass *kl=
ass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;Pca954x Channel&quot;;<br>
=C2=A0}<br>
<br>
+static void pca9543_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 Pca954xClass *s =3D PCA954X_CLASS(klass);<br>
+=C2=A0 =C2=A0 s-&gt;nchans =3D PCA9543_CHANNEL_COUNT;<br>
+}<br>
+<br>
=C2=A0static void pca9546_class_init(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Pca954xClass *s =3D PCA954X_CLASS(klass);<br>
@@ -268,6 +275,11 @@ static const TypeInfo pca954x_info[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D pca954x_clas=
s_init,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.abstract=C2=A0 =C2=A0 =C2=A0 =3D true,<b=
r>
=C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_PCA9543,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PC=
A954X,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D pca9543_class_ini=
t,<br>
+=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D TYPE_PCA9546,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_PCA954X,<br>
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca9=
54x.h<br>
index 8aaf9bbc39..91e2ffd0a2 100644<br>
--- a/include/hw/i2c/i2c_mux_pca954x.h<br>
+++ b/include/hw/i2c/i2c_mux_pca954x.h<br>
@@ -3,6 +3,7 @@<br>
<br>
=C2=A0#include &quot;hw/i2c/i2c.h&quot;<br>
<br>
+#define TYPE_PCA9543 &quot;pca9543&quot;<br>
=C2=A0#define TYPE_PCA9546 &quot;pca9546&quot;<br>
=C2=A0#define TYPE_PCA9548 &quot;pca9548&quot;<br>
<br>
-- <br>
2.34.0.rc0.344.g81b53c2807-goog<br>
<br></blockquote><div>Friendly ping. The patch itself is trivial, but let m=
e know if I&#39;ve submitted it incorrectly since I also maintain this devi=
ce.</div><div><br></div><div>-Patrick</div></div></div>

--0000000000002c30a005d113650b--

