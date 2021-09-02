Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892F3FF4A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:13:54 +0200 (CEST)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLt5t-00089p-Kh
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt3C-0004ZB-Pp
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:11:06 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:38850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt39-0001z2-R7
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:11:06 -0400
Received: by mail-vk1-xa35.google.com with SMTP id k124so1053387vke.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fsnnJngU8FJKGJiteH3LQIa76mAdiGjGjhj3YdkLcB0=;
 b=tMLGYsHRCqlvyuZ9xdquTci31FXqNIL406Qq5pyI23fQN6YS89FgGbIV/6QW0vPpB9
 kkXVmYD0su2o7/LbC7cLNCqa/Zl2ojZjd0v0PcpUmrVN961W40KU5IQGVEdFpU3+/k0b
 qPtXXadbHY6dN6GaqYKuLGURJj9a6dj0SZTW8qErTr2xlyfLDdwhSpkBXYVvhaK++Z75
 Wn1gzZUjoqhc3jmFNNB3Q+WVCWcOzbTgmvqgU+oa9oSEQBdxEVzBU2f4jlgUP5YHC0w4
 GhnBVTMELgDmlVKs4FQHA1b1F0t01SunCn2vkCnuGBuULQsuycT+pQwLUJtI4soqv7BE
 tuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsnnJngU8FJKGJiteH3LQIa76mAdiGjGjhj3YdkLcB0=;
 b=NsDvOJzvYKxEEv14Tq9RoiA4MrFDB1+3/ras8VjCbsn3AHdtXNd4Vzbo/V67SVSr9K
 bBY2ILKI8p2JuXsKReACc/bhOiXUhlu8p1bI3sB71ODKdmk27semFQ4PDCppAGSNFr5b
 LnSdiEu+SBjO8tRg2mKvzZS+fW2ACO1UhVSnTvcr61kb9S15mOgBl4BhPODCbpPqo8BD
 oVqFKYONoeRYv07Hjkn7N2P5sjBDI6frFdflbo7R+hEjfZYU89deoU7XEdgqya2K1Dha
 oHEIGLDUxNgYSfhYpDlup7zJ2hcwigaTuyQFpe/tl3UKc7T2KR5jzb0uaQ2U79o4h1bw
 SqnQ==
X-Gm-Message-State: AOAM530EeBHYFkR2BiSLgCMNEkT/8uU8DYB50Kf0745jTG3/At6Daijh
 UGnOc5mUndlZ5RCRGfYs2Gtqm9qe0+eBdjpuGLh6EQ==
X-Google-Smtp-Source: ABdhPJykUjAj44lQwyxasc9By/yS/I/T1+ezHsLfrj8akvWosfeRVhbblPYY+8f0ZcCIRUYTagjrRjOdALhUSRHnIgY=
X-Received: by 2002:a1f:294:: with SMTP id 142mr67784vkc.6.1630613462724; Thu,
 02 Sep 2021 13:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-4-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-4-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:10:51 -0600
Message-ID: <CANCZdfqmsEyj7S-b2P1jdVWjZg2mPS2mKGeBQ21=VFm2Ux=c2Q@mail.gmail.com>
Subject: Re: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000036482205cb08c819"
Received-SPF: none client-ip=2607:f8b0:4864:20::a35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000036482205cb08c819
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Merge two TARGET_X86_64 consecutive blocks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/i386/tcg/seg_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



>
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 3ed20ca31d7..dee7bef68c6 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int
> intno, int is_int,
>                     e2);
>      env->eip =3D offset;
>  }
> -#endif
>
> -#ifdef TARGET_X86_64
>  void helper_sysret(CPUX86State *env, int dflag)
>  {
>      int cpl, selector;
> @@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
>                                 DESC_W_MASK | DESC_A_MASK);
>      }
>  }
> -#endif
> +#endif /* TARGET_X86_64 */
>
>  /* real mode interrupt */
>  static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
> --
> 2.31.1
>
>

--00000000000036482205cb08c819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Merge two TARGET_X86_64 consecutive blocks.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/i386/tcg/seg_helper.c | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br></blockquote><div><=
br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com=
" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo g=
mail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px =
0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c<br=
>
index 3ed20ca31d7..dee7bef68c6 100644<br>
--- a/target/i386/tcg/seg_helper.c<br>
+++ b/target/i386/tcg/seg_helper.c<br>
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno,=
 int is_int,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e2);<=
br>
=C2=A0 =C2=A0 =C2=A0env-&gt;eip =3D offset;<br>
=C2=A0}<br>
-#endif<br>
<br>
-#ifdef TARGET_X86_64<br>
=C2=A0void helper_sysret(CPUX86State *env, int dflag)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int cpl, selector;<br>
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DESC_W_MASK | DESC_A_MASK);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-#endif<br>
+#endif /* TARGET_X86_64 */<br>
<br>
=C2=A0/* real mode interrupt */<br>
=C2=A0static void do_interrupt_real(CPUX86State *env, int intno, int is_int=
,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000036482205cb08c819--

