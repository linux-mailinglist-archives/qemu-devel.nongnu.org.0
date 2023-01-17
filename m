Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1766E340
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoe5-0002v4-8y; Tue, 17 Jan 2023 11:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pHodk-0002ur-95
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:16:48 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pHodh-0004TQ-Ew
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:16:48 -0500
Received: by mail-ed1-x52d.google.com with SMTP id x10so42909198edd.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lOpfpVuKqa0yg6r4pH8gycP8p2RizJZhbQTs7yC2oTs=;
 b=qtc2xhAOgcSoPR26x/EAYFvW0NoF17xq851uTO4qUEUcxb2V0rUiQR3qlArW6ulgKg
 VwNpaCEOUjsEBBHCcPeyv3Z2uCpUwrv8gr/v69WK8pPaINA0SU9fHNGDbfUp1+Bn1dH8
 T2vIYc1j/1nsj41kO2Rb8p9KDXf4CEG2MblT2Ek7nm4AWyVZnOPkDrbGZp6nk63Fdki2
 ROIp81cWy4RGw4V3cw8BbLQC1p4oG+rYQiqG1/cfy+OZqCVItekysNKThq6jikNbRjqM
 XpVWyfoI3Mgv9OdJe9SMWjpBo9zLcD6R673WNsTc45cQiwGQjwgKd+kBEErd6PMNRE1B
 +UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOpfpVuKqa0yg6r4pH8gycP8p2RizJZhbQTs7yC2oTs=;
 b=lQLVcfD5PwJtv6IsvR8zWOjfR7YwKvLmCZ+LRUfnTflFwibOK35PGSnbq+ZHUR0iFm
 rFryG6s/MYcx+Uz0X19pRhP9WIwJ5LqdKMp8OKbNKhcyaOgDKTNZn3smjqWcp9vc4RmC
 ce1UE8gj026H7f5wq7TDAP/LsCxhowcAw9gimaO1bR8huzV1CWw9zfz0tTUbHQOOVcB6
 GWhlt6ga0wL5rCan96HXAwM5zSFehtIss4sZ2nPb99f4ZQtqIoRA7rK2dz8S70k9SDGm
 oC+3OascPn7U3ZiDam8MRZmwcMHEy067LaWRhAaLGGzzyPAOt91SN4XBi6YRWxoenHvO
 gAig==
X-Gm-Message-State: AFqh2koo+XdnHdrQgsHtuqUV0iXm3cjr2n+dGFZXoDDG2qHTkrtuUI0h
 Y0olyZCvDGK/p9/WKiQUSvZ6c2YT5ZtDciem/ddX9w==
X-Google-Smtp-Source: AMrXdXsmH/AySc4ZWxt/i/lVk2BLIXkGvisREJ2JBTolSqSRZtwmka7ecRCnRjjQKGTzB1+LIJ3yV763yOUh95Nyd4w=
X-Received: by 2002:a50:ec82:0:b0:486:ecf1:b6fb with SMTP id
 e2-20020a50ec82000000b00486ecf1b6fbmr450694edr.48.1673972195357; Tue, 17 Jan
 2023 08:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
In-Reply-To: <20230117135203.3049709-3-eesposit@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 17 Jan 2023 09:16:24 -0700
Message-ID: <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, 
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001186df05f2780674"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000001186df05f2780674
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
eesposit@redhat.com> wrote:

> QEMU does not compile when enabling clang's thread safety analysis
> (TSA),
> because some functions create wrappers for pthread mutexes but do
> not use any TSA macro. Therefore the compiler fails.
>
> In order to make the compiler happy and avoid adding all the
> necessary macros to all callers (lock functions should use
> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
> pthread_mutex_lock/pthread_mutex_unlock),
> simply use TSA_NO_TSA to supppress such warnings.
>

I'm not sure I understand this quite right. Maybe a clarifying question
will help me understand: Why is this needed for bsd-user but not
linux-user? How are they different here?

Warner


> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  bsd-user/qemu.h         | 5 +++--
>  include/exec/exec-all.h | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..711fdd1b64 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -37,6 +37,7 @@ extern char **environ;
>  #include "target_os_signal.h"
>  #include "target.h"
>  #include "exec/gdbstub.h"
> +#include "qemu/clang-tsa.h"
>
>  /*
>   * This struct is used to hold certain information about the image.
> Basically,
> @@ -235,8 +236,8 @@ int target_msync(abi_ulong start, abi_ulong len, int
> flags);
>  extern unsigned long last_brk;
>  extern abi_ulong mmap_next_start;
>  abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
> -void mmap_fork_start(void);
> -void mmap_fork_end(int child);
> +void TSA_NO_TSA mmap_fork_start(void);
> +void TSA_NO_TSA mmap_fork_end(int child);
>
>  /* main.c */
>  extern char qemu_proc_pathname[];
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 25e11b0a8d..4f0c0559ac 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -25,6 +25,7 @@
>  #include "exec/cpu_ldst.h"
>  #endif
>  #include "qemu/interval-tree.h"
> +#include "qemu/clang-tsa.h"
>
>  /* allow to see translation results - the slowdown should be negligible,
> so we leave it */
>  #define DEBUG_DISAS
> @@ -758,8 +759,8 @@ static inline tb_page_addr_t
> get_page_addr_code(CPUArchState *env,
>  }
>
>  #if defined(CONFIG_USER_ONLY)
> -void mmap_lock(void);
> -void mmap_unlock(void);
> +void TSA_NO_TSA mmap_lock(void);
> +void TSA_NO_TSA mmap_unlock(void);
>  bool have_mmap_lock(void);
>
>  /**
> --
> 2.39.0
>
>

--0000000000001186df05f2780674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 17, 2023 at 6:52 AM Emanu=
ele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redhat.com">eesposit@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">QEMU does not compile when enabling clang&#39;s thread safety an=
alysis<br>
(TSA),<br>
because some functions create wrappers for pthread mutexes but do<br>
not use any TSA macro. Therefore the compiler fails.<br>
<br>
In order to make the compiler happy and avoid adding all the<br>
necessary macros to all callers (lock functions should use<br>
TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of pthr=
ead_mutex_lock/pthread_mutex_unlock),<br>
simply use TSA_NO_TSA to supppress such warnings.<br></blockquote><div><br>=
</div><div>I&#39;m not sure I understand this quite right. Maybe a clarifyi=
ng question will help me understand: Why is this needed for bsd-user but no=
t linux-user? How are they different here?</div><div><br></div><div>Warner<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@re=
dhat.com" target=3D"_blank">eesposit@redhat.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A0include/exec/exec-all.h | 5 +++--<br>
=C2=A02 files changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
index be6105385e..711fdd1b64 100644<br>
--- a/bsd-user/qemu.h<br>
+++ b/bsd-user/qemu.h<br>
@@ -37,6 +37,7 @@ extern char **environ;<br>
=C2=A0#include &quot;target_os_signal.h&quot;<br>
=C2=A0#include &quot;target.h&quot;<br>
=C2=A0#include &quot;exec/gdbstub.h&quot;<br>
+#include &quot;qemu/clang-tsa.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * This struct is used to hold certain information about the image.=
=C2=A0 Basically,<br>
@@ -235,8 +236,8 @@ int target_msync(abi_ulong start, abi_ulong len, int fl=
ags);<br>
=C2=A0extern unsigned long last_brk;<br>
=C2=A0extern abi_ulong mmap_next_start;<br>
=C2=A0abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);<br>
-void mmap_fork_start(void);<br>
-void mmap_fork_end(int child);<br>
+void TSA_NO_TSA mmap_fork_start(void);<br>
+void TSA_NO_TSA mmap_fork_end(int child);<br>
<br>
=C2=A0/* main.c */<br>
=C2=A0extern char qemu_proc_pathname[];<br>
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index 25e11b0a8d..4f0c0559ac 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
=C2=A0#endif<br>
=C2=A0#include &quot;qemu/interval-tree.h&quot;<br>
+#include &quot;qemu/clang-tsa.h&quot;<br>
<br>
=C2=A0/* allow to see translation results - the slowdown should be negligib=
le, so we leave it */<br>
=C2=A0#define DEBUG_DISAS<br>
@@ -758,8 +759,8 @@ static inline tb_page_addr_t get_page_addr_code(CPUArch=
State *env,<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
-void mmap_lock(void);<br>
-void mmap_unlock(void);<br>
+void TSA_NO_TSA mmap_lock(void);<br>
+void TSA_NO_TSA mmap_unlock(void);<br>
=C2=A0bool have_mmap_lock(void);<br>
<br>
=C2=A0/**<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--0000000000001186df05f2780674--

