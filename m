Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B025A960A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:50:45 +0200 (CEST)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTiiZ-0002h4-Kz
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiXN-0004Uh-Mg
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:39:16 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiXJ-0007zr-9E
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:39:09 -0400
Received: by mail-lf1-x131.google.com with SMTP id z29so15397849lfb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 04:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=AD0D543FQO6a8rorDhuWD+NMB8XpKjmOMU53YFVlqsE=;
 b=aNAlBGUp0yzetdfDGvX8xUVg0x5TVuL/KpEFUko59GXrM+wNM1pHQWcIoHL9//Sxtt
 f7bdBO42jPv4VVsKDe0hXvMPYe0zVMHYrhTdd1XbHk/GMWM0sI+7Grv7Q4cJuz6Dq0IB
 RPq7J+J2cvu4A2jOtOziIIQDl4qmxofEfzeiVUzf593yCE66R1G4Ywuy1Qzt06CT3RHd
 j9fKU+iK+7lxVd/CY9hA401qHTWrbkP2bwLHmeFfV6Cq1VdXfwe1cE8FulrfzhHqBWNW
 TE4qdtPyR0AWrF8wzHfCc7Eb3wlqFUePr1OScBR5KVXXAwl8y6k63i33hG5mcABlybMY
 NFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=AD0D543FQO6a8rorDhuWD+NMB8XpKjmOMU53YFVlqsE=;
 b=S9n+jybWipOqTUAYvpy8cbwMm+0sLAfRkpdoLfCfreCGHARqMknPbAAVzcJvp8dZsQ
 vKD8utoCGxWG562tZsE+nFQDuNFX2mGnBf2ozQdS/zOeQiozgQMUITSzpwPvFEp1a9K5
 VV15HuYKCYG2OrXJ90L/u/FcNf95du4OHn3kGN1sEM+eup31pM9ATBZ6pT8GTNMVDgVx
 YBOoTX/V+3ZDvq6sQjkMCWN+8fHGdwM1phox9eb7laFCtZhGcmkJOZC8GsdqwEgMfsxe
 K2xU+uH0tNiaEHvKok5yqvswVMl5hd2K5j9FNRPuE1algK6vyCq3Q/ICY33q11e/Qp2m
 wYKA==
X-Gm-Message-State: ACgBeo1rIQ7Q6Vzu3JZXEPsNCovy90RUO4t81chO2kF26XnX+qoWBrv/
 pguhf4KB1Z/rlxRt5JKl+CgHOJogn8jSHjs7y+I=
X-Google-Smtp-Source: AA6agR64cj/UlL0Y/Y9JnJ+WNRo5lzUCgQtrQw5jNrZRT/gYA4bFlHG6M9WjnjoR/DtqeHqLht+1bxFsxg43EBIecro=
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id
 i16-20020ac25b50000000b004945ec21ea5mr8082241lfp.276.1662032342380; Thu, 01
 Sep 2022 04:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-32-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-32-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:38:50 +0400
Message-ID: <CAJ+F1CKuytbGCu0_uGG2K3xaOGGgMVj8d-zpzEqmaFOdLfG65Q@mail.gmail.com>
Subject: Re: [PATCH 31/51] tests/qtest: Support libqtest to build and run on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005f75cc05e79c0fc7"
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

--0000000000005f75cc05e79c0fc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present the libqtest codes were written to depend on several
> POSIX APIs, including fork(), kill() and waitpid(). Unfortunately
> these APIs are not available on Windows.
>
> This commit implements the corresponding functionalities using
> win32 native APIs. With this change, all qtest cases can build
> successfully on a Windows host, and we can start qtest testing
> on Windows now.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/libqtest.c  | 101 +++++++++++++++++++++++++++++++++++++++-
>  tests/qtest/meson.build |   5 +-
>  2 files changed, 101 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 70d7578740..99e52ff571 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -16,9 +16,11 @@
>
>  #include "qemu/osdep.h"
>
> +#ifndef _WIN32
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <sys/un.h>
> +#endif /* _WIN32 */
>  #ifdef __linux__
>  #include <sys/prctl.h>
>  #endif /* __linux__ */
> @@ -27,6 +29,7 @@
>  #include "libqmp.h"
>  #include "qemu/ctype.h"
>  #include "qemu/cutils.h"
> +#include "qemu/sockets.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qjson.h"
>  #include "qapi/qmp/qlist.h"
> @@ -35,6 +38,16 @@
>  #define MAX_IRQ 256
>  #define SOCKET_TIMEOUT 50
>
> +#ifndef _WIN32
> +# define CMD_EXEC   "exec "
> +# define DEV_STDERR "/dev/fd/2"
> +# define DEV_NULL   "/dev/null"
> +#else
> +# define CMD_EXEC   ""
> +# define DEV_STDERR "2"
> +# define DEV_NULL   "nul"
> +#endif
> +
>  typedef void (*QTestSendFn)(QTestState *s, const char *buf);
>  typedef void (*ExternalSendFn)(void *s, const char *buf);
>  typedef GString* (*QTestRecvFn)(QTestState *);
> @@ -68,6 +81,9 @@ struct QTestState
>  QTestState *global_qtest;
>
>  static GHookList abrt_hooks;
> +#ifdef _WIN32
> +typedef void (*sighandler_t)(int);
> +#endif
>  static sighandler_t sighandler_old;
>
>  static int qtest_query_target_endianness(QTestState *s);
> @@ -120,10 +136,18 @@ bool qtest_probe_child(QTestState *s)
>      pid_t pid =3D s->qemu_pid;
>
>      if (pid !=3D -1) {
> +#ifndef _WIN32
>          pid =3D waitpid(pid, &s->wstatus, WNOHANG);
>          if (pid =3D=3D 0) {
>              return true;
>          }
> +#else
> +        DWORD exit_code;
> +        GetExitCodeProcess((HANDLE)pid, &exit_code);
> +        if (exit_code =3D=3D STILL_ACTIVE) {
> +            return true;
> +        }
>

Missing a CloseHandle((HANDLE)pid) here.


> +#endif
>          s->qemu_pid =3D -1;
>      }
>      return false;
> @@ -137,13 +161,23 @@ void qtest_set_expected_status(QTestState *s, int
> status)
>  void qtest_kill_qemu(QTestState *s)
>  {
>      pid_t pid =3D s->qemu_pid;
> +#ifndef _WIN32
>      int wstatus;
> +#else
> +    DWORD ret, exit_code;
> +#endif
>
>      /* Skip wait if qtest_probe_child already reaped.  */
>      if (pid !=3D -1) {
> +#ifndef _WIN32
>          kill(pid, SIGTERM);
>          TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
>          assert(pid =3D=3D s->qemu_pid);
> +#else
> +        TerminateProcess((HANDLE)pid, s->expected_status);
> +        ret =3D WaitForSingleObject((HANDLE)pid, INFINITE);
> +        assert(ret =3D=3D WAIT_OBJECT_0);
> +#endif
>          s->qemu_pid =3D -1;
>      }
>
> @@ -151,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)
>       * Check whether qemu exited with expected exit status; anything els=
e
> is
>       * fishy and should be logged with as much detail as possible.
>       */
> +#ifndef _WIN32
>      wstatus =3D s->wstatus;
>      if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) !=3D s->expected_stat=
us)
> {
>          fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
> @@ -167,6 +202,16 @@ void qtest_kill_qemu(QTestState *s)
>                  __FILE__, __LINE__, sig, signame, dump);
>          abort();
>      }
> +#else
> +    GetExitCodeProcess((HANDLE)pid, &exit_code);
> +    CloseHandle((HANDLE)pid);
> +    if (exit_code !=3D s->expected_status) {
> +        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
> +                "process but encountered exit status %ld (expected %d)\n=
",
> +                __FILE__, __LINE__, exit_code, s->expected_status);
> +        abort();
> +    }
> +#endif
>  }
>
>  static void kill_qemu_hook_func(void *s)
> @@ -245,6 +290,38 @@ static const char *qtest_qemu_binary(void)
>      return qemu_bin;
>  }
>
> +#ifdef _WIN32
> +static pid_t qtest_create_process(char *cmd)
> +{
> +    STARTUPINFO si;
> +    PROCESS_INFORMATION pi;
> +    BOOL ret;
> +
> +    ZeroMemory(&si, sizeof(si));
> +    si.cb =3D sizeof(si);
> +    ZeroMemory(&pi, sizeof(pi));
> +
> +    ret =3D CreateProcess(NULL,   /* module name */
> +                        cmd,    /* command line */
> +                        NULL,   /* process handle not inheritable */
> +                        NULL,   /* thread handle not inheritable */
> +                        FALSE,  /* set handle inheritance to FALSE */
> +                        0,      /* No creation flags */
> +                        NULL,   /* use parent's environment block */
> +                        NULL,   /* use parent's starting directory */
> +                        &si,    /* pointer to STARTUPINFO structure */
> +                        &pi     /* pointer to PROCESS_INFORMATION
> structure */
> +                        );
> +    if (ret =3D=3D 0) {
> +        fprintf(stderr, "%s:%d: unable to create a new process (%s)\n",
> +                __FILE__, __LINE__, strerror(GetLastError()));
> +        abort();
> +    }
> +
> +    return (pid_t)pi.hProcess;
> +}
> +#endif /* _WIN32 */
> +
>  QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>  {
>      QTestState *s;
> @@ -272,6 +349,9 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>      unlink(socket_path);
>      unlink(qmp_socket_path);
>
> +#ifdef _WIN32
> +    socket_init();
> +#endif
>      sock =3D init_socket(socket_path);
>      qmpsock =3D init_socket(qmp_socket_path);
>
> @@ -280,7 +360,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>
>      qtest_add_abrt_handler(kill_qemu_hook_func, s);
>
> -    command =3D g_strdup_printf("exec %s %s"
> +    command =3D g_strdup_printf(CMD_EXEC "%s %s"
>                                "-qtest unix:%s "
>                                "-qtest-log %s "
>                                "-chardev socket,path=3D%s,id=3Dchar0 "
> @@ -289,7 +369,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>                                "%s"
>                                " -accel qtest",
>                                qemu_binary, tracearg, socket_path,
> -                              getenv("QTEST_LOG") ? "/dev/fd/2" :
> "/dev/null",
> +                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NUL=
L,
>                                qmp_socket_path,
>                                extra_args ?: "");
>
> @@ -298,6 +378,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>      s->pending_events =3D NULL;
>      s->wstatus =3D 0;
>      s->expected_status =3D 0;
> +#ifndef _WIN32
>      s->qemu_pid =3D fork();
>      if (s->qemu_pid =3D=3D 0) {
>  #ifdef __linux__
> @@ -320,6 +401,9 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>          execlp("/bin/sh", "sh", "-c", command, NULL);
>          exit(1);
>      }
> +#else
> +    s->qemu_pid =3D qtest_create_process(command);
> +#endif /* _WIN32 */
>
>      g_free(command);
>      s->fd =3D socket_accept(sock);
> @@ -338,9 +422,19 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>          s->irq_level[i] =3D false;
>      }
>
> +    /*
> +     * Stopping QEMU for debugging is not supported on Windows.
> +     *
> +     * Using DebugActiveProcess() API can suspend the QEMU process,
> +     * but gdb cannot attach to the process. Using the undocumented
> +     * NtSuspendProcess() can suspend the QEMU process and gdb can
> +     * attach to the process, but gdb cannot resume it.
> +     */
> +#ifndef _WIN32
>      if (getenv("QTEST_STOP")) {
>          kill(s->qemu_pid, SIGSTOP);
>      }
> +#endif
>
>      /* ask endianness of the target */
>
> @@ -393,6 +487,9 @@ QTestState *qtest_init_with_serial(const char
> *extra_args, int *sock_fd)
>      g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);
>      sock_path =3D g_strdup_printf("%s/sock", sock_dir);
>
> +#ifdef _WIN32
> +    socket_init();
> +#endif
>      sock_fd_init =3D init_socket(sock_path);
>
>      qts =3D qtest_initf("-chardev socket,id=3Ds0,path=3D%s -serial chard=
ev:s0
> %s",
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0291b3966c..6d469a1822 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,6 +1,5 @@
> -# All QTests for now are POSIX-only, but the dependencies are
> -# really in libqtest, not in the testcases themselves.
> -if not config_host.has_key('CONFIG_POSIX')
> +# Build all QTests for POSIX and Windows
> +if not config_host.has_key('CONFIG_POSIX') and not
> config_host.has_key('CONFIG_WIN32')
>    subdir_done()
>  endif
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005f75cc05e79c0fc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:46 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
At present the libqtest codes were written to depend on several<br>
POSIX APIs, including fork(), kill() and waitpid(). Unfortunately<br>
these APIs are not available on Windows.<br>
<br>
This commit implements the corresponding functionalities using<br>
win32 native APIs. With this change, all qtest cases can build<br>
successfully on a Windows host, and we can start qtest testing<br>
on Windows now.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 | 101 ++++++++++++++++++++++++++++++++++=
+++++-<br>
=C2=A0tests/qtest/meson.build |=C2=A0 =C2=A05 +-<br>
=C2=A02 files changed, 101 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 70d7578740..99e52ff571 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -16,9 +16,11 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
+#ifndef _WIN32<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
=C2=A0#include &lt;sys/un.h&gt;<br>
+#endif /* _WIN32 */<br>
=C2=A0#ifdef __linux__<br>
=C2=A0#include &lt;sys/prctl.h&gt;<br>
=C2=A0#endif /* __linux__ */<br>
@@ -27,6 +29,7 @@<br>
=C2=A0#include &quot;libqmp.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
+#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qjson.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qlist.h&quot;<br>
@@ -35,6 +38,16 @@<br>
=C2=A0#define MAX_IRQ 256<br>
=C2=A0#define SOCKET_TIMEOUT 50<br>
<br>
+#ifndef _WIN32<br>
+# define CMD_EXEC=C2=A0 =C2=A0&quot;exec &quot;<br>
+# define DEV_STDERR &quot;/dev/fd/2&quot;<br>
+# define DEV_NULL=C2=A0 =C2=A0&quot;/dev/null&quot;<br>
+#else<br>
+# define CMD_EXEC=C2=A0 =C2=A0&quot;&quot;<br>
+# define DEV_STDERR &quot;2&quot;<br>
+# define DEV_NULL=C2=A0 =C2=A0&quot;nul&quot;<br>
+#endif<br>
+<br>
=C2=A0typedef void (*QTestSendFn)(QTestState *s, const char *buf);<br>
=C2=A0typedef void (*ExternalSendFn)(void *s, const char *buf);<br>
=C2=A0typedef GString* (*QTestRecvFn)(QTestState *);<br>
@@ -68,6 +81,9 @@ struct QTestState<br>
=C2=A0QTestState *global_qtest;<br>
<br>
=C2=A0static GHookList abrt_hooks;<br>
+#ifdef _WIN32<br>
+typedef void (*sighandler_t)(int);<br>
+#endif<br>
=C2=A0static sighandler_t sighandler_old;<br>
<br>
=C2=A0static int qtest_query_target_endianness(QTestState *s);<br>
@@ -120,10 +136,18 @@ bool qtest_probe_child(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0pid_t pid =3D s-&gt;qemu_pid;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (pid !=3D -1) {<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D waitpid(pid, &amp;s-&gt;wstatus, =
WNOHANG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DWORD exit_code;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GetExitCodeProcess((HANDLE)pid, &amp;exit_code=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exit_code =3D=3D STILL_ACTIVE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Missing =
a CloseHandle((HANDLE)pid) here.</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -137,13 +161,23 @@ void qtest_set_expected_status(QTestState *s, int sta=
tus)<br>
=C2=A0void qtest_kill_qemu(QTestState *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0pid_t pid =3D s-&gt;qemu_pid;<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0int wstatus;<br>
+#else<br>
+=C2=A0 =C2=A0 DWORD ret, exit_code;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Skip wait if qtest_probe_child already reaped.=C2=A0=
 */<br>
=C2=A0 =C2=A0 =C2=A0if (pid !=3D -1) {<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(pid, SIGTERM);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(pid =3D waitpid(s-&gt;qemu_pid, &amp;=
s-&gt;wstatus, 0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(pid =3D=3D s-&gt;qemu_pid);<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TerminateProcess((HANDLE)pid, s-&gt;expected_s=
tatus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WaitForSingleObject((HANDLE)pid, INFIN=
ITE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret =3D=3D WAIT_OBJECT_0);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -151,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0 * Check whether qemu exited with expected exit status;=
 anything else is<br>
=C2=A0 =C2=A0 =C2=A0 * fishy and should be logged with as much detail as po=
ssible.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0wstatus =3D s-&gt;wstatus;<br>
=C2=A0 =C2=A0 =C2=A0if (WIFEXITED(wstatus) &amp;&amp; WEXITSTATUS(wstatus) =
!=3D s-&gt;expected_status) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s:%d: kill_qemu() =
tried to terminate QEMU &quot;<br>
@@ -167,6 +202,16 @@ void qtest_kill_qemu(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __L=
INE__, sig, signame, dump);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 GetExitCodeProcess((HANDLE)pid, &amp;exit_code);<br>
+=C2=A0 =C2=A0 CloseHandle((HANDLE)pid);<br>
+=C2=A0 =C2=A0 if (exit_code !=3D s-&gt;expected_status) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s:%d: kill_qemu() tried=
 to terminate QEMU &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;process but =
encountered exit status %ld (expected %d)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__=
, exit_code, s-&gt;expected_status);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void kill_qemu_hook_func(void *s)<br>
@@ -245,6 +290,38 @@ static const char *qtest_qemu_binary(void)<br>
=C2=A0 =C2=A0 =C2=A0return qemu_bin;<br>
=C2=A0}<br>
<br>
+#ifdef _WIN32<br>
+static pid_t qtest_create_process(char *cmd)<br>
+{<br>
+=C2=A0 =C2=A0 STARTUPINFO si;<br>
+=C2=A0 =C2=A0 PROCESS_INFORMATION pi;<br>
+=C2=A0 =C2=A0 BOOL ret;<br>
+<br>
+=C2=A0 =C2=A0 ZeroMemory(&amp;si, sizeof(si));<br>
+=C2=A0 =C2=A0 si.cb =3D sizeof(si);<br>
+=C2=A0 =C2=A0 ZeroMemory(&amp;pi, sizeof(pi));<br>
+<br>
+=C2=A0 =C2=A0 ret =3D CreateProcess(NULL,=C2=A0 =C2=A0/* module name */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd,=C2=A0 =C2=A0 /* command line */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL,=C2=A0 =C2=A0/* process handle not inheritable */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL,=C2=A0 =C2=A0/* thread handle not inheritable */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 FALSE,=C2=A0 /* set handle inheritance to FALSE */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 /* No creation flags */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL,=C2=A0 =C2=A0/* use parent&#39;s environment block */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL,=C2=A0 =C2=A0/* use parent&#39;s starting directory */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;si,=C2=A0 =C2=A0 /* pointer to STARTUPINFO structure */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;pi=C2=A0 =C2=A0 =C2=A0/* pointer to PROCESS_INFORMATION str=
ucture */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 );<br>
+=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s:%d: unable to create =
a new process (%s)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __FILE__, __LINE__=
, strerror(GetLastError()));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return (pid_t)pi.hProcess;<br>
+}<br>
+#endif /* _WIN32 */<br>
+<br>
=C2=A0QTestState *qtest_init_without_qmp_handshake(const char *extra_args)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QTestState *s;<br>
@@ -272,6 +349,9 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0unlink(socket_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(qmp_socket_path);<br>
<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 socket_init();<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0sock =3D init_socket(socket_path);<br>
=C2=A0 =C2=A0 =C2=A0qmpsock =3D init_socket(qmp_socket_path);<br>
<br>
@@ -280,7 +360,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_abrt_handler(kill_qemu_hook_func, s);<br>
<br>
-=C2=A0 =C2=A0 command =3D g_strdup_printf(&quot;exec %s %s&quot;<br>
+=C2=A0 =C2=A0 command =3D g_strdup_printf(CMD_EXEC &quot;%s %s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-qtest unix:%s &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-qtest-log %s &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-chardev socket,path=3D%s,id=3D=
char0 &quot;<br>
@@ -289,7 +369,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; -accel qtest&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_binary, tracearg, socket_path,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getenv(&quot;QTEST_LOG&quot;) ? &quot;/dev/=
fd/2&quot; : &quot;/dev/null&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getenv(&quot;QTEST_LOG&quot;) ? DEV_STDERR =
: DEV_NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_socket_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_args ?: &quot;&quot;);<br>
<br>
@@ -298,6 +378,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pending_events =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;wstatus =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;expected_status =3D 0;<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D fork();<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;qemu_pid =3D=3D 0) {<br>
=C2=A0#ifdef __linux__<br>
@@ -320,6 +401,9 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execlp(&quot;/bin/sh&quot;, &quot;sh&quot=
;, &quot;-c&quot;, command, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 s-&gt;qemu_pid =3D qtest_create_process(command);<br>
+#endif /* _WIN32 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_free(command);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;fd =3D socket_accept(sock);<br>
@@ -338,9 +422,19 @@ QTestState *qtest_init_without_qmp_handshake(const cha=
r *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;irq_level[i] =3D false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Stopping QEMU for debugging is not supported on Wind=
ows.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Using DebugActiveProcess() API can suspend the QEMU =
process,<br>
+=C2=A0 =C2=A0 =C2=A0* but gdb cannot attach to the process. Using the undo=
cumented<br>
+=C2=A0 =C2=A0 =C2=A0* NtSuspendProcess() can suspend the QEMU process and =
gdb can<br>
+=C2=A0 =C2=A0 =C2=A0* attach to the process, but gdb cannot resume it.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0if (getenv(&quot;QTEST_STOP&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(s-&gt;qemu_pid, SIGSTOP);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* ask endianness of the target */<br>
<br>
@@ -393,6 +487,9 @@ QTestState *qtest_init_with_serial(const char *extra_ar=
gs, int *sock_fd)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0sock_path =3D g_strdup_printf(&quot;%s/sock&quot;, sock=
_dir);<br>
<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 socket_init();<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0sock_fd_init =3D init_socket(sock_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_initf(&quot;-chardev socket,id=3Ds0,path=
=3D%s -serial chardev:s0 %s&quot;,<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 0291b3966c..6d469a1822 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -1,6 +1,5 @@<br>
-# All QTests for now are POSIX-only, but the dependencies are<br>
-# really in libqtest, not in the testcases themselves.<br>
-if not config_host.has_key(&#39;CONFIG_POSIX&#39;)<br>
+# Build all QTests for POSIX and Windows<br>
+if not config_host.has_key(&#39;CONFIG_POSIX&#39;) and not config_host.has=
_key(&#39;CONFIG_WIN32&#39;)<br>
=C2=A0 =C2=A0subdir_done()<br>
=C2=A0endif<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005f75cc05e79c0fc7--

