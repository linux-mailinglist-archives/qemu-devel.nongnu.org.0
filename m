Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DC5A7F4A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:53:52 +0200 (CEST)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOAA-0000sK-R8
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO6e-0006Om-Ua
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:50:12 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTO6c-0002mk-QS
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:50:12 -0400
Received: by mail-lj1-x229.google.com with SMTP id z20so14716174ljq.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=S1Rl5H7MlDelGgXGWaiQFhWJzgwKsAPFAesK1IYRf2Y=;
 b=Ip8LI3HxCCC+B5dID+907kqU2xRs2HFHGn5te1b4L2bw1NnYjHXDFHpdwaxk+5L4XY
 7jj//wPgTZyPM6LkWHcDl1XJNmsIY89ewpxS3subSzdIy/NWGK7QL1cjfRqQ1nYx6rsW
 Z4gyZFe/sWwkvSgcyV7MOQL0GniHA0+jfVsiB45jcec8sFk9X6Q5p78b+wm8pdSB8fZW
 OHPzc/zqIzAfE7CF+1Ts/RdSV5R4gdFxpnBuVKcLs5lPLRMwsQrlHDsZy1JKhGyRfgIx
 6mRlhlZJym650yF+YMoLMkWsn0Ig3HPqTCNPSjhdTHfyFd1tcPZd2gh6VIAKrhb1bXXH
 s0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=S1Rl5H7MlDelGgXGWaiQFhWJzgwKsAPFAesK1IYRf2Y=;
 b=Vt90NFCJNSa6xKEqiUBrqRHcRa8Y2pEzK61v+cEG/er+g5Wm2UiFfD85/cqMir/wcs
 ewGWejsQBlPE/phT9kyu7O/MVBRWsFR1vGsegEUHQokIPZkAcdPhxjnpXr0hVW8pH6Ed
 rtExi8gwBgKfgMsJRLzFsUP0O9LVh9G6xu/bcaDT80VTcuZvt8aXbz3eCtAKbf5yafJ7
 h/3PW4v+VMYZhUpi1LbfQ/X3NuN5xxw9nDYNSqlOBkuarnXBLbbCIlwqElG5n3MxsaPN
 7wHhM8XlBotO7pkj24U3D5X92DZj/FBTTUOBX5yuwAE88BNVE8c6uBW1VdwA+Oj5apvs
 b8Iw==
X-Gm-Message-State: ACgBeo2367wJEax/uCCSrvXSmF7IDPATRP3OyRyKsi/t+48ZQlkVM0bu
 Dy8rSylpkZuJyx2+dU7ZuUb6Fc8W8iXvLTC/pQU=
X-Google-Smtp-Source: AA6agR6Ss9gsKXWwqrYX4k+NQ2RM6DMS2XESl/3Al2GS/UCaLk4+OdEH6CVANu0MDEsSitYH61G6K2xkZeAyUgUXwSw=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr8011682ljh.267.1661953808778; Wed, 31
 Aug 2022 06:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-24-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-24-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 17:49:57 +0400
Message-ID: <CAJ+F1CJGp_rS1zQLmH7RDP+imTKZ12yCm-cRg03M-T1XEMpGKQ@mail.gmail.com>
Subject: Re: [PATCH 23/51] accel/qtest: Support qtest accelerator for Windows
To: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000067cdb405e789c6b2"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

--00000000000067cdb405e789c6b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Currently signal SIGIPI [=3DSIGUSR1] is used to kick the dummy CPU
> when qtest accelerator is used. However SIGUSR1 is unsupported on
> Windows. To support Windows, we add a QemuSemaphore CPUState::sem
> to kick the dummy CPU instead for Windows.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

What if we replace signals by the semaphore on posix as well?

but lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  include/hw/core/cpu.h   |  1 +
>  accel/dummy-cpus.c      | 14 ++++++++++++--
>  softmmu/cpus.c          |  9 +++++----
>  accel/meson.build       |  1 +
>  accel/qtest/meson.build |  1 +
>  5 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 500503da13..c564108877 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -325,6 +325,7 @@ struct CPUState {
>      struct QemuThread *thread;
>  #ifdef _WIN32
>      HANDLE hThread;
> +    QemuSemaphore sem;
>  #endif
>      int thread_id;
>      bool running, has_waiter;
> diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
> index 10429fdfb2..d6a1b8d0a2 100644
> --- a/accel/dummy-cpus.c
> +++ b/accel/dummy-cpus.c
> @@ -21,8 +21,6 @@
>  static void *dummy_cpu_thread_fn(void *arg)
>  {
>      CPUState *cpu =3D arg;
> -    sigset_t waitset;
> -    int r;
>
>      rcu_register_thread();
>
> @@ -32,8 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
>      cpu->can_do_io =3D 1;
>      current_cpu =3D cpu;
>
> +#ifndef _WIN32
> +    sigset_t waitset;
> +    int r;
> +
>      sigemptyset(&waitset);
>      sigaddset(&waitset, SIG_IPI);
> +#endif
>
>      /* signal CPU creation */
>      cpu_thread_signal_created(cpu);
> @@ -41,6 +44,7 @@ static void *dummy_cpu_thread_fn(void *arg)
>
>      do {
>          qemu_mutex_unlock_iothread();
> +#ifndef _WIN32
>          do {
>              int sig;
>              r =3D sigwait(&waitset, &sig);
> @@ -49,6 +53,9 @@ static void *dummy_cpu_thread_fn(void *arg)
>              perror("sigwait");
>              exit(1);
>          }
> +#else
> +        qemu_sem_wait(&cpu->sem);
> +#endif
>          qemu_mutex_lock_iothread();
>          qemu_wait_io_event(cpu);
>      } while (!cpu->unplug);
> @@ -69,4 +76,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
>               cpu->cpu_index);
>      qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cp=
u,
>                         QEMU_THREAD_JOINABLE);
> +#ifdef _WIN32
> +    qemu_sem_init(&cpu->sem, 0);
> +#endif
>  }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 23b30484b2..fd10db927a 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -437,18 +437,19 @@ void qemu_wait_io_event(CPUState *cpu)
>
>  void cpus_kick_thread(CPUState *cpu)
>  {
> -#ifndef _WIN32
> -    int err;
> -
>      if (cpu->thread_kicked) {
>          return;
>      }
>      cpu->thread_kicked =3D true;
> -    err =3D pthread_kill(cpu->thread->thread, SIG_IPI);
> +
> +#ifndef _WIN32
> +    int err =3D pthread_kill(cpu->thread->thread, SIG_IPI);
>      if (err && err !=3D ESRCH) {
>          fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
>          exit(1);
>      }
> +#else
> +    qemu_sem_post(&cpu->sem);
>  #endif
>  }
>
> diff --git a/accel/meson.build b/accel/meson.build
> index b9a963cf80..b21c85dc0a 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -17,4 +17,5 @@ dummy_ss.add(files(
>  ))
>
>  specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true:
> dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)
>  specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
> index 4c65600293..a4876fc0f2 100644
> --- a/accel/qtest/meson.build
> +++ b/accel/qtest/meson.build
> @@ -1,2 +1,3 @@
>  qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
>                      if_true: files('qtest.c'))
> +qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000067cdb405e789c6b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:31 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
Currently signal SIGIPI [=3DSIGUSR1] is used to kick the dummy CPU<br>
when qtest accelerator is used. However SIGUSR1 is unsupported on<br>
Windows. To support Windows, we add a QemuSemaphore CPUState::sem<br>
to kick the dummy CPU instead for Windows.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>What if we replace signals by the semaphore on posix as well?<br></div=
><div><br></div><div>but lgtm,</div><div>Reviewed-by: Marc-Andr=C3=A9 Lurea=
u &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redha=
t.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
---<br>
<br>
=C2=A0include/hw/core/cpu.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0accel/dummy-cpus.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++--<br>
=C2=A0softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++++----<=
br>
=C2=A0accel/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0accel/qtest/meson.build |=C2=A0 1 +<br>
=C2=A05 files changed, 20 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
index 500503da13..c564108877 100644<br>
--- a/include/hw/core/cpu.h<br>
+++ b/include/hw/core/cpu.h<br>
@@ -325,6 +325,7 @@ struct CPUState {<br>
=C2=A0 =C2=A0 =C2=A0struct QemuThread *thread;<br>
=C2=A0#ifdef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0HANDLE hThread;<br>
+=C2=A0 =C2=A0 QemuSemaphore sem;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0int thread_id;<br>
=C2=A0 =C2=A0 =C2=A0bool running, has_waiter;<br>
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c<br>
index 10429fdfb2..d6a1b8d0a2 100644<br>
--- a/accel/dummy-cpus.c<br>
+++ b/accel/dummy-cpus.c<br>
@@ -21,8 +21,6 @@<br>
=C2=A0static void *dummy_cpu_thread_fn(void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D arg;<br>
-=C2=A0 =C2=A0 sigset_t waitset;<br>
-=C2=A0 =C2=A0 int r;<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_register_thread();<br>
<br>
@@ -32,8 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;can_do_io =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0current_cpu =3D cpu;<br>
<br>
+#ifndef _WIN32<br>
+=C2=A0 =C2=A0 sigset_t waitset;<br>
+=C2=A0 =C2=A0 int r;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;waitset);<br>
=C2=A0 =C2=A0 =C2=A0sigaddset(&amp;waitset, SIG_IPI);<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* signal CPU creation */<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_created(cpu);<br>
@@ -41,6 +44,7 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_iothread();<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sig;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sigwait(&amp;waitset,=
 &amp;sig);<br>
@@ -49,6 +53,9 @@ static void *dummy_cpu_thread_fn(void *arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;sigwait&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_sem_wait(&amp;cpu-&gt;sem);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_lock_iothread();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_wait_io_event(cpu);<br>
=C2=A0 =C2=A0 =C2=A0} while (!cpu-&gt;unplug);<br>
@@ -69,4 +76,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cpu_index);<br>
=C2=A0 =C2=A0 =C2=A0qemu_thread_create(cpu-&gt;thread, thread_name, dummy_c=
pu_thread_fn, cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 QEMU_THREAD_JOINABLE);<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 qemu_sem_init(&amp;cpu-&gt;sem, 0);<br>
+#endif<br>
=C2=A0}<br>
diff --git a/softmmu/cpus.c b/softmmu/cpus.c<br>
index 23b30484b2..fd10db927a 100644<br>
--- a/softmmu/cpus.c<br>
+++ b/softmmu/cpus.c<br>
@@ -437,18 +437,19 @@ void qemu_wait_io_event(CPUState *cpu)<br>
<br>
=C2=A0void cpus_kick_thread(CPUState *cpu)<br>
=C2=A0{<br>
-#ifndef _WIN32<br>
-=C2=A0 =C2=A0 int err;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;thread_kicked) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;thread_kicked =3D true;<br>
-=C2=A0 =C2=A0 err =3D pthread_kill(cpu-&gt;thread-&gt;thread, SIG_IPI);<br=
>
+<br>
+#ifndef _WIN32<br>
+=C2=A0 =C2=A0 int err =3D pthread_kill(cpu-&gt;thread-&gt;thread, SIG_IPI)=
;<br>
=C2=A0 =C2=A0 =C2=A0if (err &amp;&amp; err !=3D ESRCH) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;qemu:%s: %s&quot;, =
__func__, strerror(err));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 qemu_sem_post(&amp;cpu-&gt;sem);<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
diff --git a/accel/meson.build b/accel/meson.build<br>
index b9a963cf80..b21c85dc0a 100644<br>
--- a/accel/meson.build<br>
+++ b/accel/meson.build<br>
@@ -17,4 +17,5 @@ dummy_ss.add(files(<br>
=C2=A0))<br>
<br>
=C2=A0specific_ss.add_all(when: [&#39;CONFIG_SOFTMMU&#39;, &#39;CONFIG_POSI=
X&#39;], if_true: dummy_ss)<br>
+specific_ss.add_all(when: [&#39;CONFIG_WIN32&#39;], if_true: dummy_ss)<br>
=C2=A0specific_ss.add_all(when: [&#39;CONFIG_XEN&#39;], if_true: dummy_ss)<=
br>
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build<br>
index 4c65600293..a4876fc0f2 100644<br>
--- a/accel/qtest/meson.build<br>
+++ b/accel/qtest/meson.build<br>
@@ -1,2 +1,3 @@<br>
=C2=A0qtest_module_ss.add(when: [&#39;CONFIG_SOFTMMU&#39;, &#39;CONFIG_POSI=
X&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if_true: files(&#39;qtest.c&#39;))<br>
+qtest_module_ss.add(when: [&#39;CONFIG_WIN32&#39;], if_true: files(&#39;qt=
est.c&#39;))<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000067cdb405e789c6b2--

