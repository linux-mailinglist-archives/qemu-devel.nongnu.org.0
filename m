Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDB3CF9A5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:34:03 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5owi-0007Xo-Rt
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5otn-0004a0-Er
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:30:59 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5oti-0004gk-Cl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:30:59 -0400
Received: by mail-io1-xd30.google.com with SMTP id z9so23687941iob.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmh9KQdn1QKqnqwCwMkbJ1Cd7ARapwvUcANTRN1NDIg=;
 b=EAO8UScsxWK0RPTLHMbdsIIY+W+BwtTwOaCQs8E0yKnDXW2z5NFONRwdqSHUeDtSXg
 gr5sVouyBHQKpGU6Dfcs8uNfDkVkB/ek9Y8mjfFA0VgbIgDyZ/Rze6xSA+fwrGHOFa8O
 tQztgVR4+s9OS6pRpQsX+H7gWhVNu29k+qH4iH46z4qp0fMzbQT3f+pMGGyOLndwrGHe
 BB0o57APhCUkEfr5Yb+JCrGH25OCWA+UxzRdbsAmsIeQvp9DzdfwG4hmivDsYb05TKUT
 ciyTYWt2J5vDjFhPbreAWk8W/eWWVmHIfE6j1s/v6pJC21jOBHnZCbK6wDRtQq/UlHZe
 WZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmh9KQdn1QKqnqwCwMkbJ1Cd7ARapwvUcANTRN1NDIg=;
 b=JMqPnV3tIf43RF9+EKi9yFOuqTWss5cqXXOFNvOSdAJjsQj2Au3YugZertRNCZlEfW
 PP7mAatP6kcnsqbOv1Q6Uyx3CCikHgWHA8ZZ+iEKxtxgI2WbloRxt2AoxjIHXasIRA1v
 WMelnYNJZzt/MV5c8Q7q8Qr/H9ovOp/PRIimzvkgN08oJRnNIgw+Bfg573g0ZHan1eaW
 gf/s7CR4d6Tw/V4OUttz1O2YlNSlB6Mj5RNwiHFqFKRiS+vx01qLtuAh52aHKRozxp2H
 JLhM+RX0avds7dgOrt7vTMHYsDre4lDRw31+AS35TFi7o5q7Y7WSrHgawCTfihl+ZNve
 A/hA==
X-Gm-Message-State: AOAM532gnAzxlk2PNbA6hghnDg4JLr1UpWM0U1sUg6whhMMvoTee3nrL
 u9VUXqDREVpIvBg7f0x39oEklnKckRKtriOlnGI=
X-Google-Smtp-Source: ABdhPJwORg0rksrVe/2ZSynW6QrbtFcobBiX89vkV+1YcDUsZKwgBKnE2SIEPCteUS75Jhci4+LMn2lzyv9qwjTi/sw=
X-Received: by 2002:a6b:7702:: with SMTP id n2mr22697131iom.1.1626784251486;
 Tue, 20 Jul 2021 05:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210719123732.24457-1-alex.bennee@linaro.org>
In-Reply-To: <20210719123732.24457-1-alex.bennee@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Tue, 20 Jul 2021 14:28:59 +0200
Message-ID: <CAD-LL6jZgvTN6rt0E5Wv1n15sG4iszWPBsjUns5RjF34BfYFfg@mail.gmail.com>
Subject: Re: [RFC PATCH] tcg/plugins: implement a qemu_plugin_user_exit helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006fa57e05c78d39df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: minyihh@uci.edu, Kyle Evans <kevans@freebsd.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 robhenry@microsoft.com, Laurent Vivier <laurent@vivier.eu>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com,
 "Emilio G. Cota" <cota@braap.org>, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006fa57e05c78d39df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021, 14:37 Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote=
:

> In user-mode emulation there is a small race between preexit_cleanup
> and exit_group() which means we may end up calling instrumented
> instructions before the kernel reaps child threads. To solve this we
> implement a new helper which ensures the callbacks are flushed along
> with any translations before we let the host do it's a thing.
>
> While we are at it make the documentation of
> qemu_plugin_register_atexit_cb clearer as to what the user can expect.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>


Looks great to me and I cannot reproduce the race with it installed in.

With calling `qemu_plugin_disable_mem_helpers`:

Reviewed-by: Mahmoud Mandour <ma.mandourr@gmail.com>

---
>  include/qemu/plugin.h      | 12 ++++++++++++
>  include/qemu/qemu-plugin.h | 13 +++++++++++++
>  bsd-user/syscall.c         |  6 +++---
>  linux-user/exit.c          |  2 +-
>  plugins/core.c             | 33 +++++++++++++++++++++++++++++++++
>  5 files changed, 62 insertions(+), 4 deletions(-)
>
> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> index 0fefbc6084..9a8438f683 100644
> --- a/include/qemu/plugin.h
> +++ b/include/qemu/plugin.h
> @@ -190,6 +190,16 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr);
>
>  void qemu_plugin_disable_mem_helpers(CPUState *cpu);
>
> +/**
> + * qemu_plugin_user_exit(): clean-up callbacks before calling exit
> callbacks
> + *
> + * This is a user-mode only helper that ensure we have fully cleared
> + * callbacks from all threads before calling the exit callbacks. This
> + * is so the plugins themselves don't have to jump through hoops to
> + * guard against race conditions.
> + */
> +void qemu_plugin_user_exit(void);
> +
>  #else /* !CONFIG_PLUGIN */
>
>  static inline void qemu_plugin_add_opts(void)
> @@ -250,6 +260,8 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr)
>  static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
>  { }
>
> +static inline void qemu_plugin_user_exit(void)
> +{ }
>  #endif /* !CONFIG_PLUGIN */
>
>  #endif /* QEMU_PLUGIN_H */
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index dc3496f36c..e6e815abc5 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -549,6 +549,19 @@ void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
>  void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
>                                     qemu_plugin_simple_cb_t cb);
>
> +/**
> + * qemu_plugin_register_atexit_cb() - register exit callback
> + * @id: plugin ID
> + * @cb: callback
> + * @userdata: user data for callback
> + *
> + * The @cb function is called once execution has finished. Plugins
> + * should be able to free all their resources at this point much like
> + * after a reset/uninstall callback is called.
> + *
> + * In user-mode it is possible a few un-instrumented instructions from
> + * child threads may run before the host kernel reaps the threads.
> + */
>  void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
>                                      qemu_plugin_udata_cb_t cb, void
> *userdata);
>
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 7d986e9700..3f44311396 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -335,7 +335,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>          _mcleanup();
>  #endif
>          gdb_exit(arg1);
> -        qemu_plugin_atexit_cb();
> +        qemu_plugin_user_exit();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
>          ret =3D 0; /* avoid warning */
> @@ -437,7 +437,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>          _mcleanup();
>  #endif
>          gdb_exit(arg1);
> -        qemu_plugin_atexit_cb();
> +        qemu_plugin_user_exit();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
>          ret =3D 0; /* avoid warning */
> @@ -516,7 +516,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num,
> abi_long arg1,
>          _mcleanup();
>  #endif
>          gdb_exit(arg1);
> -        qemu_plugin_atexit_cb();
> +        qemu_plugin_user_exit();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
>          ret =3D 0; /* avoid warning */
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index 70b344048c..527e29cbc1 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -35,5 +35,5 @@ void preexit_cleanup(CPUArchState *env, int code)
>          __gcov_dump();
>  #endif
>          gdb_exit(code);
> -        qemu_plugin_atexit_cb();
> +        qemu_plugin_user_exit();
>  }
> diff --git a/plugins/core.c b/plugins/core.c
> index e1bcdb570d..c573b81a96 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -487,6 +487,39 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t
> id,
>      plugin_register_cb_udata(id, QEMU_PLUGIN_EV_ATEXIT, cb, udata);
>  }
>
> +/*
> + * Handle exit from linux-user. Unlike the normal atexit() mechanism
> + * we need to handle the clean-up manually as it's possible threads
> + * are still running. We need to remove all callbacks from code
> + * generation, flush the current translations and then we can safely
> + * trigger the exit callbacks.
> + */
> +
> +void qemu_plugin_user_exit(void)
> +{
> +    enum qemu_plugin_event ev;
> +
> +    QEMU_LOCK_GUARD(&plugin.lock);
> +
> +    start_exclusive();
> +
> +    /* un-register all callbacks except the final AT_EXIT one */
> +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
> +        if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {
> +            struct qemu_plugin_ctx *ctx;
> +            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> +                plugin_unregister_cb__locked(ctx, ev);
> +            }
> +        }
> +    }
> +
> +    tb_flush(current_cpu);
> +    end_exclusive();
> +
> +    /* now it's safe to handle the exit case */
> +    qemu_plugin_atexit_cb();
> +}
> +
>  /*
>   * Call this function after longjmp'ing to the main loop. It's possible
> that the
>   * last instruction of a TB might have used helpers, and therefore the
> --
> 2.32.0.264.g75ae10bc75
>
>

--0000000000006fa57e05c78d39df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Jul 19, 2021, 14:37 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.ben=
nee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">In user-mode emulation there is a small race between pre=
exit_cleanup<br>
and exit_group() which means we may end up calling instrumented<br>
instructions before the kernel reaps child threads. To solve this we<br>
implement a new helper which ensures the callbacks are flushed along<br>
with any translations before we let the host do it&#39;s a thing.<br>
<br>
While we are at it make the documentation of<br>
qemu_plugin_register_atexit_cb clearer as to what the user can expect.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Looks great to me and I cannot reproduce the race wi=
th it installed in.</div><div dir=3D"auto"><br></div><div dir=3D"auto">With=
 calling `qemu_plugin_disable_mem_helpers`:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Reviewed-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.m=
andourr@gmail.com">ma.mandourr@gmail.com</a>&gt;</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
---<br>
=C2=A0include/qemu/plugin.h=C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
=C2=A0include/qemu/qemu-plugin.h | 13 +++++++++++++<br>
=C2=A0bsd-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<=
br>
=C2=A0linux-user/exit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0plugins/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 ++=
+++++++++++++++++++++++++++++++<br>
=C2=A05 files changed, 62 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h<br>
index 0fefbc6084..9a8438f683 100644<br>
--- a/include/qemu/plugin.h<br>
+++ b/include/qemu/plugin.h<br>
@@ -190,6 +190,16 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr);<br>
<br>
=C2=A0void qemu_plugin_disable_mem_helpers(CPUState *cpu);<br>
<br>
+/**<br>
+ * qemu_plugin_user_exit(): clean-up callbacks before calling exit callbac=
ks<br>
+ *<br>
+ * This is a user-mode only helper that ensure we have fully cleared<br>
+ * callbacks from all threads before calling the exit callbacks. This<br>
+ * is so the plugins themselves don&#39;t have to jump through hoops to<br=
>
+ * guard against race conditions.<br>
+ */<br>
+void qemu_plugin_user_exit(void);<br>
+<br>
=C2=A0#else /* !CONFIG_PLUGIN */<br>
<br>
=C2=A0static inline void qemu_plugin_add_opts(void)<br>
@@ -250,6 +260,8 @@ void qemu_plugin_add_dyn_cb_arr(GArray *arr)<br>
=C2=A0static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)<br>
=C2=A0{ }<br>
<br>
+static inline void qemu_plugin_user_exit(void)<br>
+{ }<br>
=C2=A0#endif /* !CONFIG_PLUGIN */<br>
<br>
=C2=A0#endif /* QEMU_PLUGIN_H */<br>
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h<br>
index dc3496f36c..e6e815abc5 100644<br>
--- a/include/qemu/qemu-plugin.h<br>
+++ b/include/qemu/qemu-plugin.h<br>
@@ -549,6 +549,19 @@ void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,<br=
>
=C2=A0void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_simple_cb_=
t cb);<br>
<br>
+/**<br>
+ * qemu_plugin_register_atexit_cb() - register exit callback<br>
+ * @id: plugin ID<br>
+ * @cb: callback<br>
+ * @userdata: user data for callback<br>
+ *<br>
+ * The @cb function is called once execution has finished. Plugins<br>
+ * should be able to free all their resources at this point much like<br>
+ * after a reset/uninstall callback is called.<br>
+ *<br>
+ * In user-mode it is possible a few un-instrumented instructions from<br>
+ * child threads may run before the host kernel reaps the threads.<br>
+ */<br>
=C2=A0void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_plugin_udat=
a_cb_t cb, void *userdata);<br>
<br>
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c<br>
index 7d986e9700..3f44311396 100644<br>
--- a/bsd-user/syscall.c<br>
+++ b/bsd-user/syscall.c<br>
@@ -335,7 +335,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_mcleanup();<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_exit(arg1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_user_exit();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX: should free thread stack and CPU =
env */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(arg1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0; /* avoid warning */<br>
@@ -437,7 +437,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_=
long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_mcleanup();<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_exit(arg1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_user_exit();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX: should free thread stack and CPU =
env */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(arg1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0; /* avoid warning */<br>
@@ -516,7 +516,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi=
_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_mcleanup();<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_exit(arg1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_user_exit();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX: should free thread stack and CPU =
env */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(arg1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0; /* avoid warning */<br>
diff --git a/linux-user/exit.c b/linux-user/exit.c<br>
index 70b344048c..527e29cbc1 100644<br>
--- a/linux-user/exit.c<br>
+++ b/linux-user/exit.c<br>
@@ -35,5 +35,5 @@ void preexit_cleanup(CPUArchState *env, int code)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__gcov_dump();<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_exit(code);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_user_exit();<br>
=C2=A0}<br>
diff --git a/plugins/core.c b/plugins/core.c<br>
index e1bcdb570d..c573b81a96 100644<br>
--- a/plugins/core.c<br>
+++ b/plugins/core.c<br>
@@ -487,6 +487,39 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t i=
d,<br>
=C2=A0 =C2=A0 =C2=A0plugin_register_cb_udata(id, QEMU_PLUGIN_EV_ATEXIT, cb,=
 udata);<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Handle exit from linux-user. Unlike the normal atexit() mechanism<br>
+ * we need to handle the clean-up manually as it&#39;s possible threads<br=
>
+ * are still running. We need to remove all callbacks from code<br>
+ * generation, flush the current translations and then we can safely<br>
+ * trigger the exit callbacks.<br>
+ */<br>
+<br>
+void qemu_plugin_user_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 enum qemu_plugin_event ev;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;plugin.lock);<br>
+<br>
+=C2=A0 =C2=A0 start_exclusive();<br>
+<br>
+=C2=A0 =C2=A0 /* un-register all callbacks except the final AT_EXIT one */=
<br>
+=C2=A0 =C2=A0 for (ev =3D 0; ev &lt; QEMU_PLUGIN_EV_MAX; ev++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct qemu_plugin_ctx *ctx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(ctx, &amp;plugin.=
ctxs, entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plugin_unregister_=
cb__locked(ctx, ev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tb_flush(current_cpu);<br>
+=C2=A0 =C2=A0 end_exclusive();<br>
+<br>
+=C2=A0 =C2=A0 /* now it&#39;s safe to handle the exit case */<br>
+=C2=A0 =C2=A0 qemu_plugin_atexit_cb();<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Call this function after longjmp&#39;ing to the main loop. It&#39;=
s possible that the<br>
=C2=A0 * last instruction of a TB might have used helpers, and therefore th=
e<br>
-- <br>
2.32.0.264.g75ae10bc75<br>
<br>
</blockquote></div></div></div>

--0000000000006fa57e05c78d39df--

