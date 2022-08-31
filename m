Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59075A7E41
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:07:19 +0200 (CEST)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNR9-0003oo-0c
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNMa-00007E-6E
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:02:36 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTNMY-00038c-1Q
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:02:35 -0400
Received: by mail-lf1-x134.google.com with SMTP id v26so9617928lfd.10
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q9AOLPf4p/B1hHFagVOIbrZ1dEfZGq+e4ZHrAbQlIQU=;
 b=G02DSlGJHameAuYm9qKi9hIdu7UnCGSVFDttxJXFDdp0Kt4KvIFjz2UMefjzzR5Ju1
 Mz4wg3RtQ8dFn0EQPJYc2YD7JeqqTTFbfvuJ8TGNw/0rWRec5HF5KMbQ1EFQqm8QVLO0
 STpU9pNsWNbmh/QuooHzIMvW2SCL6pIo1yNJcMUZsEOZV35Y7INCHwafwANbQONHR7u4
 jFCOVlio/noUTuM+WTDpRCAPVh2l4qhgLmL6bDtAW+HREETtEJwYRhfL5BmrMwexXU2c
 KKkvrP9kGPQjxCVz9NbBalXkWEDRF1QtBToxQwHzZeM6D6MoQ5Ebix6no6yAKqhQjylb
 ppJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q9AOLPf4p/B1hHFagVOIbrZ1dEfZGq+e4ZHrAbQlIQU=;
 b=EjxGLLFBOoHCemPkA7lQE0e+GfquT4bdptmWuzWOHr4Cck4JJD8XE08rSa1JSPrzmM
 bH42+ROmvUSILg+evmyYVqLT2kGVw52SEy1E9V3SfelSx3hqu1+LkcQdS4w8OO0gWmhd
 BZB1+KWypqwhqmeYuJz4CkO7yHwl+g3bIRttto+RQmaylBME0htdjkLLc0J5u6TbI5k4
 it4XBuIGsKdbShRAVIWADbo2k7gf/1c65ZE8T3E+b0JMhFE5Y6BjXs9Xety9GmNqrQ+U
 DuNldNADqs+QOkdDJ5BBghY/nMEtY/fCka9Ldc1w5IAmAFxHASkjfXhB8sSqV8KvQDjC
 SubQ==
X-Gm-Message-State: ACgBeo3GsDE9ypyTXhDS9D7QDS6+2mz4xM6dO06m6E+xktnLm1hTwD7M
 zxa1rFmZg8JOLDYB/yYilOOPpzapjYwwaLG2vk8=
X-Google-Smtp-Source: AA6agR6OIcDwg+qMXRvjUCny0nNOz2/wBHwMxvELpCrgCQDqKSJRAUuSrZFZw2Oh1zzd5RbEQfhR8FwQSINI9ecRIRo=
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr10504064lfa.375.1661950949114; Wed, 31
 Aug 2022 06:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-6-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-6-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:02:17 +0400
Message-ID: <CAJ+F1CLsycHaY81q5vosSabTjyLKA_4bbCCGSo_tQfU=3gwxog@mail.gmail.com>
Subject: Re: [PATCH 05/51] tcg: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f4c6ba05e7891be5"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--000000000000f4c6ba05e7891be5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tcg/tcg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 0f9cfe96f2..932156a352 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -4729,13 +4729,15 @@ static void tcg_register_jit_int(const void
> *buf_ptr, size_t buf_size,
>      /* Enable this block to be able to debug the ELF image file creation=
.
>         One can use readelf, objdump, or other inspection utilities.  */
>      {
> -        FILE *f =3D fopen("/tmp/qemu.jit", "w+b");
> +        char *jit =3D g_strdup_printf("%s/qemu.jit", g_get_tmp_dir());
> +        FILE *f =3D fopen(jit, "w+b");
>

(this is only enabled if DEBUG_JIT)

Why not? you may also use g_autofree to avoid the call to g_free() below if
you respin.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



>          if (f) {
>              if (fwrite(img, img_size, 1, f) !=3D img_size) {
>                  /* Avoid stupid unused return value warning for fwrite.
> */
>              }
>              fclose(f);
>          }
> +        g_free(jit);
>      }
>  #endif
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f4c6ba05e7891be5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:06 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Use g_get_tmp_dir() to get the directory to use for temporary files.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tcg/tcg.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tcg/tcg.c b/tcg/tcg.c<br>
index 0f9cfe96f2..932156a352 100644<br>
--- a/tcg/tcg.c<br>
+++ b/tcg/tcg.c<br>
@@ -4729,13 +4729,15 @@ static void tcg_register_jit_int(const void *buf_pt=
r, size_t buf_size,<br>
=C2=A0 =C2=A0 =C2=A0/* Enable this block to be able to debug the ELF image =
file creation.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 One can use readelf, objdump, or other inspecti=
on utilities.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *f =3D fopen(&quot;/tmp/qemu.jit&quot;, &=
quot;w+b&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *jit =3D g_strdup_printf(&quot;%s/qemu.ji=
t&quot;, g_get_tmp_dir());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *f =3D fopen(jit, &quot;w+b&quot;);<br></=
blockquote><div><br></div><div>(this is only enabled if DEBUG_JIT)</div><di=
v><br></div><div>Why not? you may also use g_autofree to avoid the call to =
g_free() below if you respin.</div><div><br></div><div>Reviewed-by: Marc-An=
dr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandr=
e.lureau@redhat.com</a>&gt;<br></div><div><br></div><div>=C2=A0<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fwrite(img, img_size, 1=
, f) !=3D img_size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Avoid stup=
id unused return value warning for fwrite.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(f);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(jit);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f4c6ba05e7891be5--

