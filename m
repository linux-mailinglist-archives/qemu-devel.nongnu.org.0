Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2E5BC614
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 12:09:38 +0200 (CEST)
Received: from localhost ([::1]:42572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDib-0003gI-4W
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 06:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaDa8-0006rK-Rb
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:00:52 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaDa6-0001Ua-1x
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 06:00:52 -0400
Received: by mail-qk1-x734.google.com with SMTP id c19so18183961qkm.7
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=/qpY9XWboRPSNERjKNjvA4MmwSNWC1UbDtaUyGoYlgU=;
 b=qLNzcgQNyRZ9/vBURIae+btH9kZpTxKcO/YLnrEwxweP4bkA1648Pf7SjY9/KpWVjc
 vSOPAADQQk61hfWSZoZ1j/AskFLEkPyEU5R2dtjO3SXIz+QiFiPznUj11zpUVZ+I/u2w
 xcLDfg7TkrbkbB9Hj/n8r1mA0CvGr/w3X9AzDN96CfP+rWSzQ9Xm2CLwdpnggBfEQWeL
 qEDr2BqhdYHv+WRL84n4oqcm7p+MAvMignTe0KgLC8bt3eSBXDh0biWjdeIPysHojihe
 5w1VWjqMIBW0xGHZj6ebNlLX2aM07byzXhcwQdjyW7A+F0A0rd8/TvgvD9CDyKQdqjp6
 peeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/qpY9XWboRPSNERjKNjvA4MmwSNWC1UbDtaUyGoYlgU=;
 b=qQgLNBDTBOcSr1587YmSfuOLRAJU7QnhAFJIn4UnajW2LWVg4IYzobaNQYSbCrBtFF
 bnUEJjJ/mC+UDY5JihwlaFkWfmrFSkXksTOce5lzUyvwoprily+9aF4Bu8ZHcvDYEXbc
 NOzd98v7QdEGLLT9darkhL7wpag29By2/ltA4XP7d8CPblqmXQpa6tuPdEK+S0tW3Liu
 Ysp6MCkmXnQOOW8sLwcAQwtuUGC5vJo8I8dTg1gnVVtUedgE52tvJ7URUEAC4LpsVEbA
 YOAqMENGKF67ljK3tou57cU+pWiLhctOTUAI/wn58iOlMhqUb9nfihA5uiOYbHJ6pKo4
 RtOg==
X-Gm-Message-State: ACrzQf1AwPLHPeSVJADA1ilg/RPy8cj/BCsDROy2xsN0Yl1R/i5OSIb8
 SbTEneVWZ/zG/3R4yYanDTKzD/zuqYkgK/WHWWY/vc1TbXM=
X-Google-Smtp-Source: AMsMyM6erH+HWQbW562LtPwGupP+kScSlfDHIyveL3N34IrVeVeNj7hXoRXzg34a0IlOg0iJdbUbMosliiLely29c7k=
X-Received: by 2002:ae9:df46:0:b0:6bb:7917:5c66 with SMTP id
 t67-20020ae9df46000000b006bb79175c66mr11989536qkf.342.1663581648774; Mon, 19
 Sep 2022 03:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-32-bmeng.cn@gmail.com>
 <CAJ+F1CKtJcFQ0=CFDs2mAPDPMVH_RZaJG4Q0CiusVT4iAcb9YA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKtJcFQ0=CFDs2mAPDPMVH_RZaJG4Q0CiusVT4iAcb9YA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 19 Sep 2022 18:00:37 +0800
Message-ID: <CAEUhbmWeUtG-1ckiTttsYm3ULu9OH6SAi8_bmELY_XJgY7r4aA@mail.gmail.com>
Subject: Re: [PATCH 31/51] tests/qtest: Support libqtest to build and run on
 Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

On Thu, Sep 1, 2022 at 12:29 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> At present the libqtest codes were written to depend on several
>> POSIX APIs, including fork(), kill() and waitpid(). Unfortunately
>> these APIs are not available on Windows.
>>
>> This commit implements the corresponding functionalities using
>> win32 native APIs. With this change, all qtest cases can build
>> successfully on a Windows host, and we can start qtest testing
>> on Windows now.
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  tests/qtest/libqtest.c  | 101 +++++++++++++++++++++++++++++++++++++++-
>>  tests/qtest/meson.build |   5 +-
>>  2 files changed, 101 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index 70d7578740..99e52ff571 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -16,9 +16,11 @@
>>
>>  #include "qemu/osdep.h"
>>
>> +#ifndef _WIN32
>>  #include <sys/socket.h>
>>  #include <sys/wait.h>
>>  #include <sys/un.h>
>> +#endif /* _WIN32 */
>>  #ifdef __linux__
>>  #include <sys/prctl.h>
>>  #endif /* __linux__ */
>> @@ -27,6 +29,7 @@
>>  #include "libqmp.h"
>>  #include "qemu/ctype.h"
>>  #include "qemu/cutils.h"
>> +#include "qemu/sockets.h"
>>  #include "qapi/qmp/qdict.h"
>>  #include "qapi/qmp/qjson.h"
>>  #include "qapi/qmp/qlist.h"
>> @@ -35,6 +38,16 @@
>>  #define MAX_IRQ 256
>>  #define SOCKET_TIMEOUT 50
>>
>> +#ifndef _WIN32
>> +# define CMD_EXEC   "exec "
>> +# define DEV_STDERR "/dev/fd/2"
>> +# define DEV_NULL   "/dev/null"
>> +#else
>> +# define CMD_EXEC   ""
>> +# define DEV_STDERR "2"
>> +# define DEV_NULL   "nul"
>> +#endif
>> +
>>  typedef void (*QTestSendFn)(QTestState *s, const char *buf);
>>  typedef void (*ExternalSendFn)(void *s, const char *buf);
>>  typedef GString* (*QTestRecvFn)(QTestState *);
>> @@ -68,6 +81,9 @@ struct QTestState
>>  QTestState *global_qtest;
>>
>>  static GHookList abrt_hooks;
>> +#ifdef _WIN32
>> +typedef void (*sighandler_t)(int);
>> +#endif
>>  static sighandler_t sighandler_old;
>>
>>  static int qtest_query_target_endianness(QTestState *s);
>> @@ -120,10 +136,18 @@ bool qtest_probe_child(QTestState *s)
>>      pid_t pid =3D s->qemu_pid;
>>
>>      if (pid !=3D -1) {
>> +#ifndef _WIN32
>>          pid =3D waitpid(pid, &s->wstatus, WNOHANG);
>>          if (pid =3D=3D 0) {
>>              return true;
>>          }
>> +#else
>> +        DWORD exit_code;
>> +        GetExitCodeProcess((HANDLE)pid, &exit_code);
>> +        if (exit_code =3D=3D STILL_ACTIVE) {
>> +            return true;
>> +        }
>> +#endif
>>          s->qemu_pid =3D -1;
>>      }
>>      return false;
>> @@ -137,13 +161,23 @@ void qtest_set_expected_status(QTestState *s, int =
status)
>>  void qtest_kill_qemu(QTestState *s)
>>  {
>>      pid_t pid =3D s->qemu_pid;
>> +#ifndef _WIN32
>>      int wstatus;
>> +#else
>> +    DWORD ret, exit_code;
>> +#endif
>>
>>      /* Skip wait if qtest_probe_child already reaped.  */
>>      if (pid !=3D -1) {
>> +#ifndef _WIN32
>>          kill(pid, SIGTERM);
>>          TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
>>          assert(pid =3D=3D s->qemu_pid);
>> +#else
>> +        TerminateProcess((HANDLE)pid, s->expected_status);
>> +        ret =3D WaitForSingleObject((HANDLE)pid, INFINITE);
>> +        assert(ret =3D=3D WAIT_OBJECT_0);
>> +#endif
>>          s->qemu_pid =3D -1;
>>      }
>>
>> @@ -151,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)
>>       * Check whether qemu exited with expected exit status; anything el=
se is
>>       * fishy and should be logged with as much detail as possible.
>>       */
>> +#ifndef _WIN32
>>      wstatus =3D s->wstatus;
>>      if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) !=3D s->expected_sta=
tus) {
>>          fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
>> @@ -167,6 +202,16 @@ void qtest_kill_qemu(QTestState *s)
>>                  __FILE__, __LINE__, sig, signame, dump);
>>          abort();
>>      }
>> +#else
>> +    GetExitCodeProcess((HANDLE)pid, &exit_code);
>> +    CloseHandle((HANDLE)pid);
>> +    if (exit_code !=3D s->expected_status) {
>> +        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
>> +                "process but encountered exit status %ld (expected %d)\=
n",
>> +                __FILE__, __LINE__, exit_code, s->expected_status);
>> +        abort();
>> +    }
>> +#endif
>>  }
>>
>>  static void kill_qemu_hook_func(void *s)
>> @@ -245,6 +290,38 @@ static const char *qtest_qemu_binary(void)
>>      return qemu_bin;
>>  }
>>
>> +#ifdef _WIN32
>> +static pid_t qtest_create_process(char *cmd)
>> +{
>> +    STARTUPINFO si;
>> +    PROCESS_INFORMATION pi;
>> +    BOOL ret;
>> +
>> +    ZeroMemory(&si, sizeof(si));
>> +    si.cb =3D sizeof(si);
>> +    ZeroMemory(&pi, sizeof(pi));
>> +
>> +    ret =3D CreateProcess(NULL,   /* module name */
>> +                        cmd,    /* command line */
>> +                        NULL,   /* process handle not inheritable */
>> +                        NULL,   /* thread handle not inheritable */
>> +                        FALSE,  /* set handle inheritance to FALSE */
>> +                        0,      /* No creation flags */
>> +                        NULL,   /* use parent's environment block */
>> +                        NULL,   /* use parent's starting directory */
>> +                        &si,    /* pointer to STARTUPINFO structure */
>> +                        &pi     /* pointer to PROCESS_INFORMATION struc=
ture */
>> +                        );
>> +    if (ret =3D=3D 0) {
>> +        fprintf(stderr, "%s:%d: unable to create a new process (%s)\n",
>> +                __FILE__, __LINE__, strerror(GetLastError()));
>> +        abort();
>> +    }
>> +
>> +    return (pid_t)pi.hProcess;
>> +}
>> +#endif /* _WIN32 */
>> +
>>  QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>>  {
>>      QTestState *s;
>> @@ -272,6 +349,9 @@ QTestState *qtest_init_without_qmp_handshake(const c=
har *extra_args)
>>      unlink(socket_path);
>>      unlink(qmp_socket_path);
>>
>> +#ifdef _WIN32
>> +    socket_init();
>> +#endif
>
>
> You can call this unconditionally, afaict
>

Will fix in v2.

>>
>>      sock =3D init_socket(socket_path);
>>      qmpsock =3D init_socket(qmp_socket_path);
>>
>> @@ -280,7 +360,7 @@ QTestState *qtest_init_without_qmp_handshake(const c=
har *extra_args)
>>
>>      qtest_add_abrt_handler(kill_qemu_hook_func, s);
>>
>> -    command =3D g_strdup_printf("exec %s %s"
>> +    command =3D g_strdup_printf(CMD_EXEC "%s %s"
>>                                "-qtest unix:%s "
>>                                "-qtest-log %s "
>>                                "-chardev socket,path=3D%s,id=3Dchar0 "
>> @@ -289,7 +369,7 @@ QTestState *qtest_init_without_qmp_handshake(const c=
har *extra_args)
>>                                "%s"
>>                                " -accel qtest",
>>                                qemu_binary, tracearg, socket_path,
>> -                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev=
/null",
>> +                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NU=
LL,
>>                                qmp_socket_path,
>>                                extra_args ?: "");
>>
>> @@ -298,6 +378,7 @@ QTestState *qtest_init_without_qmp_handshake(const c=
har *extra_args)
>>      s->pending_events =3D NULL;
>>      s->wstatus =3D 0;
>>      s->expected_status =3D 0;
>> +#ifndef _WIN32
>>      s->qemu_pid =3D fork();
>>      if (s->qemu_pid =3D=3D 0) {
>>  #ifdef __linux__
>> @@ -320,6 +401,9 @@ QTestState *qtest_init_without_qmp_handshake(const c=
har *extra_args)
>>          execlp("/bin/sh", "sh", "-c", command, NULL);
>>          exit(1);
>>      }
>> +#else
>> +    s->qemu_pid =3D qtest_create_process(command);
>
>
> Why not replace the fork/exec with g_spawn_async() ?
>

I tried g_spawn_async(), but I am getting in trouble creating the
argument vector of the QEMU command lines, to pass in g_spawn_async().

g_strsplit() with SPACE as the delimiter does not work, as there might
be space in the command line surrounded by quotes.

g_shell_parse_argv() does not work either, as it just ate all Windows
path separator "\", so a patch name like
"D:\msys64\tmp/qtest-4220.qmp" becomes "D:msys64tmp/qtest-4220.qmp".

Do you have any suggestions?

>>
>> +#endif /* _WIN32 */
>>
>>      g_free(command);
>>      s->fd =3D socket_accept(sock);
>> @@ -338,9 +422,19 @@ QTestState *qtest_init_without_qmp_handshake(const =
char *extra_args)
>>          s->irq_level[i] =3D false;
>>      }
>>
>> +    /*
>> +     * Stopping QEMU for debugging is not supported on Windows.
>> +     *
>> +     * Using DebugActiveProcess() API can suspend the QEMU process,
>> +     * but gdb cannot attach to the process. Using the undocumented
>> +     * NtSuspendProcess() can suspend the QEMU process and gdb can
>> +     * attach to the process, but gdb cannot resume it.
>> +     */
>> +#ifndef _WIN32
>>      if (getenv("QTEST_STOP")) {
>>          kill(s->qemu_pid, SIGSTOP);
>>      }
>> +#endif
>>
>>      /* ask endianness of the target */
>>
>> @@ -393,6 +487,9 @@ QTestState *qtest_init_with_serial(const char *extra=
_args, int *sock_fd)
>>      g_assert_true(g_mkdtemp(sock_dir) !=3D NULL);
>>      sock_path =3D g_strdup_printf("%s/sock", sock_dir);
>>
>> +#ifdef _WIN32
>> +    socket_init();
>> +#endif
>
>
> same
>
>>
>>      sock_fd_init =3D init_socket(sock_path);
>>
>>      qts =3D qtest_initf("-chardev socket,id=3Ds0,path=3D%s -serial char=
dev:s0 %s",
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 0291b3966c..6d469a1822 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -1,6 +1,5 @@
>> -# All QTests for now are POSIX-only, but the dependencies are
>> -# really in libqtest, not in the testcases themselves.
>> -if not config_host.has_key('CONFIG_POSIX')
>> +# Build all QTests for POSIX and Windows
>> +if not config_host.has_key('CONFIG_POSIX') and not config_host.has_key(=
'CONFIG_WIN32')
>>    subdir_done()
>>  endif
>>

Regards,
Bin

