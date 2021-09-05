Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EDA401025
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:23:39 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMt3Z-00063w-Nu
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt2f-0005OL-4x
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:22:41 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt2d-00010F-5z
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:22:40 -0400
Received: by mail-ua1-x92e.google.com with SMTP id a14so2317695uao.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GR+A9xBkd4iLofRrDDO1+3+L5U6smd7SDDfNkDTUYk=;
 b=ynqsok7LAI78crqaV5rQR1vfdXiU8eIojgitRDR1Md6YM+US2aXuEvz9ONtDNQFSu4
 SaPHZA24BYXcuZf1MTqFkqJJOJDQXuEhhYt2DC5gOyqxG2sobKB5X0rMfjmEPXyrHtrA
 mIMRGR5TW3NjNHfaqDYxCIzH7MFj6CqLmtkuZ54pRVdihar8IjgcTjLkZu8h19plu73i
 1RJE27a5Z85C40nXZpEftblcRjNXRNnDfD21WhGheCA/Hg5JU2PWjBb/YJChkuKPKrVe
 xsD2WgcNZT1U3+WSGlfq6i3jNWEJsvoeH4IF0SPf2GdeqwjNMZjVEIaEcbIZxXiDlVgf
 Dcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GR+A9xBkd4iLofRrDDO1+3+L5U6smd7SDDfNkDTUYk=;
 b=Bahq6cb6sSvUoAbyd3TNfHIo3b+X4KiZGU3BStFle/itr0V6XKbW/0Ty0jShBLxGj9
 hDPU5KlKBcU2OTNyw5TpQMXIeCBAOhs7GPeswpI+7jgDR56xNDaKbpg1cAxDN8tdc9sd
 qkmkggKLCGTWCBuNPtiIOwXonA6oN4g0T3sQtH7HjKGJQMDqsNNoo7mXgJeUZd7qjGLH
 vv0tD0nJfgKibOs07NL+CxRSFuOzf1UQJjXkf1ym6IsNAQaagN7KQfwztaleEApjOKeN
 7DJzgCLPTs6pbXQZI0kZqy4ZObeVZZwjNT7/RBbLzfEcdolN7q19dIl/KrMFpoPsZGKZ
 oZew==
X-Gm-Message-State: AOAM531NDJNvsyYyfaIxAcyhh1ueLLbj0VRbb5zKuqK5nLCmAG2x5A7/
 24mrE+sHNWWebMrdSkpWJ5h6DN2qO+G76Owhmw29Uw==
X-Google-Smtp-Source: ABdhPJw6q44oz0MDxJpN0mMc4mLfd2nC1kDKqvh6JuMhNCw7AZP311o3BKyNPpq9WA1tq8K/pcXeYPtD7ZHY+a0J37c=
X-Received: by 2002:ab0:74cc:: with SMTP id f12mr3602162uaq.85.1630851757416; 
 Sun, 05 Sep 2021 07:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210905000429.1097336-1-f4bug@amsat.org>
In-Reply-To: <20210905000429.1097336-1-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 08:22:26 -0600
Message-ID: <CANCZdfrnqZ3acHuzzAF9X--67FHa7wOyAgOBSS6HkYuvddOorg@mail.gmail.com>
Subject: Re: [PATCH] user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000aeb4b305cb404359"
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aeb4b305cb404359
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 4, 2021 at 6:04 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> cpu_loop() never exits, so mark it with QEMU_NORETURN.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h   | 2 +-
>  linux-user/qemu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-By: Warner Losh <imp@bsdimp.com>


diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index c02e8a5ca1a..05bee7aefe5 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -155,7 +155,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>                              abi_long arg5, abi_long arg6);
>  void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
>  extern THREAD CPUState *thread_cpu;
> -void cpu_loop(CPUArchState *env);
> +void QEMU_NORETURN cpu_loop(CPUArchState *env);
>  char *target_strerror(int err);
>  int get_osversion(void);
>  void fork_start(void);
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 3b0b6b75fe8..5b2c764ae78 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -236,7 +236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long
> arg1,
>                      abi_long arg5, abi_long arg6, abi_long arg7,
>                      abi_long arg8);
>  extern __thread CPUState *thread_cpu;
> -void cpu_loop(CPUArchState *env);
> +void QEMU_NORETURN cpu_loop(CPUArchState *env);
>  const char *target_strerror(int err);
>  int get_osversion(void);
>  void init_qemu_uname_release(void);
> --
> 2.31.1
>
>

--000000000000aeb4b305cb404359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 4, 2021 at 6:04 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>cpu_loop() never exits, so mark it with QEMU_NORETURN.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0| 2 +-<br>
=C2=A0linux-user/qemu.h | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div><br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
index c02e8a5ca1a..05bee7aefe5 100644<br>
--- a/bsd-user/qemu.h<br>
+++ b/bsd-user/qemu.h<br>
@@ -155,7 +155,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_long arg5, abi_long arg6);<br>
=C2=A0void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);<br>
=C2=A0extern THREAD CPUState *thread_cpu;<br>
-void cpu_loop(CPUArchState *env);<br>
+void QEMU_NORETURN cpu_loop(CPUArchState *env);<br>
=C2=A0char *target_strerror(int err);<br>
=C2=A0int get_osversion(void);<br>
=C2=A0void fork_start(void);<br>
diff --git a/linux-user/qemu.h b/linux-user/qemu.h<br>
index 3b0b6b75fe8..5b2c764ae78 100644<br>
--- a/linux-user/qemu.h<br>
+++ b/linux-user/qemu.h<br>
@@ -236,7 +236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long ar=
g1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg5, abi_long arg6, abi_long arg7,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg8);<br>
=C2=A0extern __thread CPUState *thread_cpu;<br>
-void cpu_loop(CPUArchState *env);<br>
+void QEMU_NORETURN cpu_loop(CPUArchState *env);<br>
=C2=A0const char *target_strerror(int err);<br>
=C2=A0int get_osversion(void);<br>
=C2=A0void init_qemu_uname_release(void);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000aeb4b305cb404359--

