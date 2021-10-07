Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08532425E34
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:53:15 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaO9-0006cH-TY
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDO-0005ZI-KF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDL-00063a-Fq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r18so22917903wrg.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7b3EeAKMVXMJvjZqjVt7dBgzdFixjwR1WsSFpK+LGKI=;
 b=OGr1QsvCR/wVZBjVNnp0usZwzhOLVlzLKbGO2i46evo1YfbUO7dolIr/HDpYSt9HWP
 XYfqYZfcSZPG6TXHgdBqM6IxZzBZRPFm8QX3ZT1Ac7i0+NXshd2Z4oLBmkb59PT0Sdjx
 qzquXfBpuajsNHYCs11/+vv8+jWQ3cIt2aYrnHljXA+0mRp0R8m3s7v2gUqwpgFR/YGN
 tA5FqwPBsjcbgQ27+qtalbdfPYX0FdKfrVfYOdgxZlYAqBR+QZ+5GYibzHmPS5FbeAiI
 cWYm5bkrWy2J+bcksbGRJJA5QUswzdpbc6Jf/mNz/4svrt2Rdwv06o4zBUSnOkJZ7mVi
 cnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7b3EeAKMVXMJvjZqjVt7dBgzdFixjwR1WsSFpK+LGKI=;
 b=Xk86+n1nZGq7eD3OwLq3gobQtSLPu8g6KQQJdkeGxJt/Jul18wznFt+I6gRy7mE4un
 0EHHcyJevlDWLyYjnDRUDLG3xm1+KOII2krjN8tvEchU4JUQdaLcd4x0KKMACMcJ7058
 3m1f0DlHfUvJr+zBMzwzmJgICgXMDLCVkmj2sSi6Wy97q6PgmQKS3ZPbEYJeR1YxAxBs
 fRi1AbMDpy/sq6hE5Wtyp0EMIp8LmOFkQ1D9WSkMa2nesQirxB2Jmz153hjwlQha2BHi
 +4s8k2x6CT76igDKMbHm1xq+q9bodHDunWRHOSn6TzioVZ/HYQEl1wWGl+0clRQDjzxj
 Jdjg==
X-Gm-Message-State: AOAM530XsKUY1blTT5YJbv7k874PaV1V7hhmFg7QNOhkNzc8IR70Uc24
 xrpmhUqfCAZDBuLeQDKUyxtvcq/oftITyVFtRzo=
X-Google-Smtp-Source: ABdhPJykJlSMqf0j6BZ6Ywi799yKnvLIwwTClCtaarGeB19q42LSsHzxUGL6POuxF3kLfz7F5eOM8DNWS3X2UCy4VTw=
X-Received: by 2002:a5d:664f:: with SMTP id f15mr8119184wrw.143.1633639322194; 
 Thu, 07 Oct 2021 13:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-7-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-7-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:47 +0400
Message-ID: <CAJ+F1CKghJW51E2VGSE98gBDmziUudMUTXN=dKLEApWZasNQEQ@mail.gmail.com>
Subject: Re: [PATCH 12/24] configure,
 meson: remove CONFIG_GCOV from config-host.mak
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d97f205cdc94be2"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d97f205cdc94be2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   | 3 ---
>  meson.build | 1 +
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 35e25bb960..499c84859d 100755
> --- a/configure
> +++ b/configure
> @@ -4628,9 +4628,6 @@ echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host=
_mak
>  echo "LD_I386_EMULATION=3D$ld_i386_emulation" >> $config_host_mak
>  echo "EXESUF=3D$EXESUF" >> $config_host_mak
>  echo "LIBS_QGA=3D$libs_qga" >> $config_host_mak
> -if test "$gcov" =3D "yes" ; then
> -  echo "CONFIG_GCOV=3Dy" >> $config_host_mak
> -fi
>
>  if test "$rng_none" =3D "yes"; then
>    echo "CONFIG_RNG_NONE=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 9bb443387a..2962c24eb5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1404,6 +1404,7 @@ config_host_data.set('CONFIG_ATTR', libattr.found()=
)
>  config_host_data.set('CONFIG_BRLAPI', brlapi.found())
>  config_host_data.set('CONFIG_COCOA', cocoa.found())
>  config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
> +config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
>  config_host_data.set('CONFIG_LIBUDEV', libudev.found())
>  config_host_data.set('CONFIG_LZO', lzo.found())
>  config_host_data.set('CONFIG_MPATH', mpathpersist.found())
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007d97f205cdc94be2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:24 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"ma=
ilto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat=
.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0| 3 ---<br>
=C2=A0meson.build | 1 +<br>
=C2=A02 files changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 35e25bb960..499c84859d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -4628,9 +4628,6 @@ echo &quot;QEMU_LDFLAGS=3D$QEMU_LDFLAGS&quot; &gt;&gt=
; $config_host_mak<br>
=C2=A0echo &quot;LD_I386_EMULATION=3D$ld_i386_emulation&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0echo &quot;EXESUF=3D$EXESUF&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;LIBS_QGA=3D$libs_qga&quot; &gt;&gt; $config_host_mak<br>
-if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GCOV=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
<br>
=C2=A0if test &quot;$rng_none&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_RNG_NONE=3Dy&quot; &gt;&gt; $config_host_mak=
<br>
diff --git a/meson.build b/meson.build<br>
index 9bb443387a..2962c24eb5 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1404,6 +1404,7 @@ config_host_data.set(&#39;CONFIG_ATTR&#39;, libattr.f=
ound())<br>
=C2=A0config_host_data.set(&#39;CONFIG_BRLAPI&#39;, brlapi.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_COCOA&#39;, cocoa.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_FUZZ&#39;, get_option(&#39;fuzzing&#=
39;))<br>
+config_host_data.set(&#39;CONFIG_GCOV&#39;, get_option(&#39;b_coverage&#39=
;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBUDEV&#39;, libudev.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LZO&#39;, lzo.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_MPATH&#39;, mpathpersist.found())<br=
>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000007d97f205cdc94be2--

