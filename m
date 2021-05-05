Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC943374AD1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:51:59 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePR0-0005OB-9O
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP0z-00009o-JY; Wed, 05 May 2021 17:25:05 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leP0w-0003N9-Vh; Wed, 05 May 2021 17:25:05 -0400
Received: by mail-ej1-x633.google.com with SMTP id n2so5072778ejy.7;
 Wed, 05 May 2021 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgVC5GAwCd579XQfB/Z8UQnM5xXmOIgrDlNOTtuLVrM=;
 b=gvv7T2hnHBdLIzK0PD1d6riDSQd5lSHn/MVsQC+pyQnCiu5uXDiSQVEJuqg/YE0aDx
 MhbcfzdMYGUuJzvv4LU+VE+gsNINUaOEEt41UW5qrYF/X25hj/rpYAOrDFgwV9sfRLuM
 RKPXFmIfcZ3q/349aM6H1tGOk2LkOrKS7HXkOnf4dYM/SU3VPAeUDOEtP2O7bBVZpkE+
 /cPftIZTs+z+metWqqQumv75sXDq40H8Bl0K0C6DWEL1jLZFLohzL2ZbuM/6F8yL0zGe
 lH60R5RGl79Z3Sg/6pjqph7uTG5kyYuW9/okk+zmFt1i78rdylUFmtsPhHXdEf8lZK/W
 bu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgVC5GAwCd579XQfB/Z8UQnM5xXmOIgrDlNOTtuLVrM=;
 b=XmLyTFf1GCN/+/qZAP+K8pxYtcK+7N/i0pFQ9stfuEjaH/WRY2Oj94yoF9ZA8UhCGY
 zjKWdVgMnX1RqF1jBJWubv4nojkmfJNe1DUj6RgSs9DfkpxoUkIUgQ5F4sS84nzzrwLH
 jYzaC4jXa/0uVD6heoHUTWAPm00egQD3PP0zew8isOKXHRZ/HLWx8twbi+0+JIZMcKbF
 sFV7jLx1lxKSyWRk207mljFQBXjeKjUiNPwrnREd0INTsAKwt5aGjekeZ24ZrOmJpJFM
 RzsTRpVHjqkSYXTV5KVVOaeObVnbgh3baDS9es7cH8Q+VSw1i9FBiAFTRKNgA/U4ZfXL
 F/4w==
X-Gm-Message-State: AOAM531s0TISSq3QTrZyxTyAb3j+IMbDn3aPHLPn51oq4+gZvP3LTGis
 /1105Sjj6RWjO/d9G5+rAZYe87y5Vh7NodhOhA0=
X-Google-Smtp-Source: ABdhPJzrVQH7vYHncArE+O9Rc9YYdl4xBBkv2U+T2sKjJrkqSyeV29MfQDO0DPUaloSQ4/rntRCzHEyv4P47ulcJJbs=
X-Received: by 2002:a17:906:b03:: with SMTP id u3mr725300ejg.381.1620249900449; 
 Wed, 05 May 2021 14:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-3-philmd@redhat.com>
In-Reply-To: <20210505211047.1496765-3-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 May 2021 01:24:48 +0400
Message-ID: <CAJ+F1C+p=9jKU-5hr_YWT5GT5yVgCZ3c0RY_cgm1vjcAoNAzUA@mail.gmail.com>
Subject: Re: [PATCH 02/23] chardev/baum: Replace magic values by X_MAX / Y_MAX
 definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3821005c19bd346"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3821005c19bd346
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 1:13 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Replace '84' magic value by the X_MAX definition, and '1' by Y_MAX.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/baum.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 5deca778bc4..adc3d7b3b56 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -87,6 +87,9 @@
>
>  #define BUF_SIZE 256
>
> +#define X_MAX   84
> +#define Y_MAX   1
> +
>  struct BaumChardev {
>      Chardev parent;
>
> @@ -244,11 +247,11 @@ static int baum_deferred_init(BaumChardev *baum)
>          brlapi_perror("baum: brlapi__getDisplaySize");
>          return 0;
>      }
> -    if (baum->y > 1) {
> -        baum->y =3D 1;
> +    if (baum->y > Y_MAX) {
> +        baum->y =3D Y_MAX;
>      }
> -    if (baum->x > 84) {
> -        baum->x =3D 84;
> +    if (baum->x > X_MAX) {
> +        baum->x =3D X_MAX;
>      }
>
>      con =3D qemu_console_lookup_by_index(0);
> --
> 2.26.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c3821005c19bd346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 1:13 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Replace &#39;84&#39; magic value by the X_MAX definition, and &#39;1&#=
39; by Y_MAX.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/baum.c | 11 +++++++----<br>
=C2=A01 file changed, 7 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/chardev/baum.c b/chardev/baum.c<br>
index 5deca778bc4..adc3d7b3b56 100644<br>
--- a/chardev/baum.c<br>
+++ b/chardev/baum.c<br>
@@ -87,6 +87,9 @@<br>
<br>
=C2=A0#define BUF_SIZE 256<br>
<br>
+#define X_MAX=C2=A0 =C2=A084<br>
+#define Y_MAX=C2=A0 =C2=A01<br>
+<br>
=C2=A0struct BaumChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
@@ -244,11 +247,11 @@ static int baum_deferred_init(BaumChardev *baum)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0brlapi_perror(&quot;baum: brlapi__getDisp=
laySize&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (baum-&gt;y &gt; 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 baum-&gt;y =3D 1;<br>
+=C2=A0 =C2=A0 if (baum-&gt;y &gt; Y_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 baum-&gt;y =3D Y_MAX;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (baum-&gt;x &gt; 84) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 baum-&gt;x =3D 84;<br>
+=C2=A0 =C2=A0 if (baum-&gt;x &gt; X_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 baum-&gt;x =3D X_MAX;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0con =3D qemu_console_lookup_by_index(0);<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c3821005c19bd346--

