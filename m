Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3B5FC169
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 09:49:03 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWUA-0003rQ-Av
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 03:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiWPT-0000bH-3g
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:44:11 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiWPQ-0005Ld-C6
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:44:10 -0400
Received: by mail-lf1-x12e.google.com with SMTP id r14so24558020lfm.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WlzjuJep3BThp1/jTFOvnS6I4OQSWmvGCqUaHI/85IM=;
 b=mvutlJ8bNvjTtn3UoUZxq6SZ847JLWZxOJTFdX0HQjWSvWIGdvcElsRlLpEEolwjfV
 QOG+SV60try2eSeQ1AktzY5Uk8iF9D97tAXQV6u2OZow0/RJ5bmYriiRWvlqMnw9FyAD
 huMHtKTGTz1/XTZ/LC5kfT3T62bIdfKHHlonHyMY8eECPARRHwgv/P8l/8WU5t7DrY2J
 /ACa1nc99OWn0dcAUhkkOcJv699HS5FfNUbxQHg0uWivcebJOxu2ne+r10gz0oYl9/cJ
 0ITj6ih5ieAU8X9JOobRa2fxsKja9MXnNcimqAL/PfusYBdAQotWeeheOHlKoOddDrOf
 M4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WlzjuJep3BThp1/jTFOvnS6I4OQSWmvGCqUaHI/85IM=;
 b=cmvhoJvcfhvDSjw08evRXyyris5TXnguYZVxOMdbTtxAgOjgBELoNyZSHDmYBAoZQU
 gc8ZBEdxCAGKY7gPrOPiwJ6znxm/hKKK+ZsZRiVQc/LpSCNavDhXCTEN0ZqMeAK5dNvo
 58UmyhUgy7hgP19hFKW3FqHafTGAYSC1A5x0J0zpIlptWlVBb0DvjsnbjPTo9u2+dOvi
 syYJUhUegkMCuLbsNahf9wZRSw58Oh+C9xCBe6+q/D0LuLH841jmnZ1FeySVC7UCLYxL
 P7GMW/4UOIzHn+GmTBADQUU0R9v0vD/78Ttt/CLmeT631rmUgXBZyyIlKqZHIOGYiq0F
 hpwg==
X-Gm-Message-State: ACrzQf3oereQ0V59Wd2Mb6RaQR8WFqVR2xoghjkTcP8c34WbP5RXr74t
 qKCf2HEoFIONwY999N7P7kWKvYKC2R4S/gzf0eI=
X-Google-Smtp-Source: AMsMyM58uX5aMDJRCsIa3/70POAhUhQVgHasPIxxR/bp02QxpSjbkPbPRdm+nqsukYr1ZNAXvVxP5P7iqoRvaiL/dCQ=
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id
 u25-20020a056512041900b004a22e450bf0mr10982286lfk.356.1665560646137; Wed, 12
 Oct 2022 00:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-12-bmeng.cn@gmail.com>
In-Reply-To: <20221006151927.2079583-12-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 Oct 2022 11:43:53 +0400
Message-ID: <CAJ+F1CKyteChdWzR8_O+zkHVnR6H7Fk03vmsWBQWn5cMm9Bccw@mail.gmail.com>
Subject: Re: [PATCH v5 11/18] tests/qtest: Support libqtest to build and run
 on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aa3d5105ead18ec0"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000aa3d5105ead18ec0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bin

On Thu, Oct 6, 2022 at 8:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:

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
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Move the enabling of building qtests on Windows to a separate
>   patch to keep bisectablity
> - Call socket_init() unconditionally
> - Add a missing CloseHandle() call
>
>  tests/qtest/libqtest.c | 95 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 54e5f64f20..ecd22cdb11 100644
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
> @@ -118,10 +131,19 @@ bool qtest_probe_child(QTestState *s)
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
> +        CloseHandle((HANDLE)pid);
> +#endif
>          s->qemu_pid =3D -1;
>      }
>      return false;
> @@ -135,13 +157,23 @@ void qtest_set_expected_status(QTestState *s, int
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
> @@ -149,6 +181,7 @@ void qtest_kill_qemu(QTestState *s)
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
> @@ -165,6 +198,16 @@ void qtest_kill_qemu(QTestState *s)
>                  __FILE__, __LINE__, sig, signame, dump);
>          abort();
>      }
> +#else
> +    GetExitCodeProcess((HANDLE)pid, &exit_code);
>

That doesn't fulfill the doc expectations: "It is safe to call this
function multiple times". pid will be -1 after the first call. I think it
should save the "exit_code", similar to how "wstatus" is saved in posix.

please update the patch

+    CloseHandle((HANDLE)pid);
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
> @@ -243,6 +286,38 @@ static const char *qtest_qemu_binary(void)
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
> @@ -270,6 +345,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>      unlink(socket_path);
>      unlink(qmp_socket_path);
>
> +    socket_init();
>      sock =3D init_socket(socket_path);
>      qmpsock =3D init_socket(qmp_socket_path);
>
> @@ -278,7 +354,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>
>      qtest_add_abrt_handler(kill_qemu_hook_func, s);
>
> -    command =3D g_strdup_printf("exec %s %s"
> +    command =3D g_strdup_printf(CMD_EXEC "%s %s"
>                                "-qtest unix:%s "
>                                "-qtest-log %s "
>                                "-chardev socket,path=3D%s,id=3Dchar0 "
> @@ -287,7 +363,7 @@ QTestState *qtest_init_without_qmp_handshake(const
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
> @@ -296,6 +372,7 @@ QTestState *qtest_init_without_qmp_handshake(const
> char *extra_args)
>      s->pending_events =3D NULL;
>      s->wstatus =3D 0;
>      s->expected_status =3D 0;
> +#ifndef _WIN32
>      s->qemu_pid =3D fork();
>      if (s->qemu_pid =3D=3D 0) {
>  #ifdef __linux__
> @@ -318,6 +395,9 @@ QTestState *qtest_init_without_qmp_handshake(const
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
> @@ -336,9 +416,19 @@ QTestState *qtest_init_without_qmp_handshake(const
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
> @@ -392,6 +482,7 @@ QTestState *qtest_init_with_serial(const char
> *extra_args, int *sock_fd)
>      g_assert_true(sock_dir !=3D NULL);
>      sock_path =3D g_strdup_printf("%s/sock", sock_dir);
>
> +    socket_init();
>      sock_fd_init =3D init_socket(sock_path);
>
>      qts =3D qtest_initf("-chardev socket,id=3Ds0,path=3D%s -serial chard=
ev:s0
> %s",
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aa3d5105ead18ec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bin<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 8:09 PM =
Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bi=
n.meng@windriver.com</a>&gt;<br>
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
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
<br>
(no changes since v2)<br>
<br>
Changes in v2:<br>
- Move the enabling of building qtests on Windows to a separate<br>
=C2=A0 patch to keep bisectablity<br>
- Call socket_init() unconditionally<br>
- Add a missing CloseHandle() call<br>
<br>
=C2=A0tests/qtest/libqtest.c | 95 +++++++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 93 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index 54e5f64f20..ecd22cdb11 100644<br>
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
@@ -118,10 +131,19 @@ bool qtest_probe_child(QTestState *s)<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CloseHandle((HANDLE)pid);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -135,13 +157,23 @@ void qtest_set_expected_status(QTestState *s, int sta=
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
@@ -149,6 +181,7 @@ void qtest_kill_qemu(QTestState *s)<br>
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
@@ -165,6 +198,16 @@ void qtest_kill_qemu(QTestState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __L=
INE__, sig, signame, dump);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#else<br>
+=C2=A0 =C2=A0 GetExitCodeProcess((HANDLE)pid, &amp;exit_code);<br></blockq=
uote><div><br></div><div>That doesn&#39;t fulfill the doc expectations: &qu=
ot;It is safe to call this function multiple times&quot;. pid will be -1 af=
ter the first call. I think it should save the &quot;exit_code&quot;, simil=
ar to how &quot;wstatus&quot; is saved in posix.</div><div><br></div><div>p=
lease update the patch<br></div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
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
@@ -243,6 +286,38 @@ static const char *qtest_qemu_binary(void)<br>
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
@@ -270,6 +345,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0unlink(socket_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(qmp_socket_path);<br>
<br>
+=C2=A0 =C2=A0 socket_init();<br>
=C2=A0 =C2=A0 =C2=A0sock =3D init_socket(socket_path);<br>
=C2=A0 =C2=A0 =C2=A0qmpsock =3D init_socket(qmp_socket_path);<br>
<br>
@@ -278,7 +354,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
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
@@ -287,7 +363,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
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
@@ -296,6 +372,7 @@ QTestState *qtest_init_without_qmp_handshake(const char=
 *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pending_events =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;wstatus =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;expected_status =3D 0;<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D fork();<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;qemu_pid =3D=3D 0) {<br>
=C2=A0#ifdef __linux__<br>
@@ -318,6 +395,9 @@ QTestState *qtest_init_without_qmp_handshake(const char=
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
@@ -336,9 +416,19 @@ QTestState *qtest_init_without_qmp_handshake(const cha=
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
@@ -392,6 +482,7 @@ QTestState *qtest_init_with_serial(const char *extra_ar=
gs, int *sock_fd)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(sock_dir !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0sock_path =3D g_strdup_printf(&quot;%s/sock&quot;, sock=
_dir);<br>
<br>
+=C2=A0 =C2=A0 socket_init();<br>
=C2=A0 =C2=A0 =C2=A0sock_fd_init =3D init_socket(sock_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_initf(&quot;-chardev socket,id=3Ds0,path=
=3D%s -serial chardev:s0 %s&quot;,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aa3d5105ead18ec0--

