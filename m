Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B352DB575
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 21:54:53 +0100 (CET)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpHLP-0005PS-VE
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 15:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpHKH-0004hm-Kb
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:53:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpHKF-0007j9-6R
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:53:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 91so21180157wrj.7
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 12:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fMzcUmtnmaXuf+VtRXKNfj9ggMBOX87ZxxP2ZXhCOJY=;
 b=ilwSYaRXeMt/TKfqkTjY00RariLZrYaFE0RJbRUCt6cqGqMySmzPUTJuXpQf58pOwg
 u7Z18BxZYCs6RmC9MlOH+YxtrsCm6Y0CqzGhVTCb0ibNYiYqG5KWFcBo/y/bU8snutSA
 Yir0ZhHvjlBRMhQHKiT1EXLslINpqXotm3/onT3hq+/q8lpO5zMN1I7fe9ef4Gbabv/2
 RjyJogPuPYfYwOrwuXDPug+z23D14l/uEB9HnSm8jpbm1+TJh9LC31bAheia/JcTU0T5
 +rynEJdDAb7qF7NXlFuhE0xAJBHDUnc4F2NYbsppTTZGhIEicesHNSjpGwKkE0KRt8E/
 6m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fMzcUmtnmaXuf+VtRXKNfj9ggMBOX87ZxxP2ZXhCOJY=;
 b=SAEPz7v5QL0DAgCKHyDLwSqCLSa8uj5166Ndu1WYR8NcAYeXRTyAibC0DZDHEVPzqw
 AsLLS0AckNaR6aUoQ+0PUTOMgher4ZBVCEm/+SPZ3OxU3pnVl768hwxMpOw6S3N1tIa2
 ONqpfdAkY2BaHkvHm/lSqMLotuyyhcpifI28ve/GZo34FKR0zOkPYTSIQIdRbyxOVto1
 XwbJ6zjjFA17Gv4fj1XW1jcc4BwQuXVzBjLLLqM0rRdwUyav+xFjbrNZnamICEe0Jmqt
 qbaPQJvwdy+PvJ2lKrLj4EDWz2sVOB88pmFmYUb7ABp9uwV3HO7qeboOEU7goC7mZXBh
 RQMg==
X-Gm-Message-State: AOAM530DwrvDwI47Et2DzwxOx/dWNQFqI2mYeR6vQoqH9ihHrLMdrStq
 7SZtxk38AijbX3Xz23I0u3C9Vg==
X-Google-Smtp-Source: ABdhPJw+vLxWM6X8kwzXatWaN4taPTnjp68A5ObgwJAB9RgfXtCPL4K5PWFbtxc2/keKXypz4Yrffg==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr34548741wrv.270.1608065616673; 
 Tue, 15 Dec 2020 12:53:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o8sm27185226wrm.17.2020.12.15.12.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 12:53:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C92B1FF7E;
 Tue, 15 Dec 2020 20:53:34 +0000 (GMT)
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: tests/test-char hangs in CI (Centos7 with check-crypto-old-nettle)
Date: Tue, 15 Dec 2020 20:31:37 +0000
Message-ID: <87eejqu6y9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <pmathieu@redhat.com>,
 Li Feng <fengli@smartx.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Over the last few weeks we've seen a steadily more common failure in
test-char on CI. It seems to only manifest itself on the
check-crypto-old-nettle build set and fails with a message like:

  Running test test-char
  Unexpected error in object_property_try_add() at ../qom/object.c:1219:
  attempt to add duplicate property 'serial-id' to object (type 'container')
  ERROR test-char - too few tests run (expected 38, got 9)
  make: *** [run-test-87] Error 1

This would point the finger at test-char /char/serial

I've managed to re-create the crash on Centos7 (x86_64) with the
following build config:

  '../../configure' '--disable-gcrypt' '--enable-nettle' '--target-list=3Dx=
86_64-softmmu,x86_64-linux-user'

The failure rate is something in the region of 1% which I confirmed by
spamming it with my retry.py script:

  retry.py -n 100 -c -- ./tests/test-char

Amusingly attempts to hit it just concentrating on the /char/serial test
with:

  retry.py -n 1000 -c -- ./tests/test-char -p /char/serial

passed with flying colours. It seems there must be an interaction
between the tests to cause the failure. Attempts to valgrind out any
strangeness were met with valgrind hanging on exit but otherwise
passing. You can avoid the hang in valgrind by commenting out:

--8<---------------cut here---------------start------------->8---
modified   tests/test-char.c
@@ -1434,11 +1434,11 @@ static void char_hotswap_test(void)
     g_free(chr_args);
 }
=20
-static SocketAddress tcpaddr =3D {
-    .type =3D SOCKET_ADDRESS_TYPE_INET,
-    .u.inet.host =3D (char *)"127.0.0.1",
-    .u.inet.port =3D (char *)"0",
-};
+/* static SocketAddress tcpaddr =3D { */
+/*     .type =3D SOCKET_ADDRESS_TYPE_INET, */
+/*     .u.inet.host =3D (char *)"127.0.0.1", */
+/*     .u.inet.port =3D (char *)"0", */
+/* }; */
 #ifndef WIN32
 static SocketAddress unixaddr =3D {
     .type =3D SOCKET_ADDRESS_TYPE_UNIX,
@@ -1534,12 +1534,12 @@ int main(int argc, char **argv)
     g_test_add_data_func("/char/socket/client/dupid-reconnect/" # name, \
                          &client8 ##name, char_socket_client_dupid_test)
=20
-    if (has_ipv4) {
-        SOCKET_SERVER_TEST(tcp, &tcpaddr);
-        SOCKET_CLIENT_TEST(tcp, &tcpaddr);
-        g_test_add_data_func("/char/socket/server/two-clients/tcp", &tcpad=
dr,
-                             char_socket_server_two_clients_test);
-    }
+    /* if (has_ipv4) { */
+    /*     SOCKET_SERVER_TEST(tcp, &tcpaddr); */
+    /*     SOCKET_CLIENT_TEST(tcp, &tcpaddr); */
+    /*     g_test_add_data_func("/char/socket/server/two-clients/tcp", &tc=
paddr, */
+    /*                          char_socket_server_two_clients_test); */
+    /* } */
 #ifndef WIN32
     SOCKET_SERVER_TEST(unix, &unixaddr);
     SOCKET_CLIENT_TEST(unix, &unixaddr);
--8<---------------cut here---------------end--------------->8---

At that point valgrind doesn't have any smoking guns of corruption but
minor leaks and also it seems a bunch of fd's being used up:

  [alex@centos7 crypto-old-nettle]$ valgrind --tool=3Dmemcheck --leak-check=
=3Dfull --track-origins=3Dyes --track-fds=3Dyes ./tests/test-char
  =3D=3D28263=3D=3D Memcheck, a memory error detector
  =3D=3D28263=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Sewar=
d et al.
  =3D=3D28263=3D=3D Using Valgrind-3.15.0 and LibVEX; rerun with -h for cop=
yright info
  =3D=3D28263=3D=3D Command: ./tests/test-char
  =3D=3D28263=3D=3D
  /char/null: OK
  /char/invalid: OK
  /char/ringbuf: OK
  /char/mux: OK
  /char/stdio: OK
  /char/pipe: OK
  /char/file: OK
  /char/file-fifo: OK
  /char/udp: OK
  /char/serial: OK
  /char/hotswap: OK
  /char/websocket: OK
  /char/socket/server/mainloop/unix: OK
  /char/socket/server/wait-conn/unix: OK
  /char/socket/server/mainloop-fdpass/unix: OK
  /char/socket/server/wait-conn-fdpass/unix: OK
  /char/socket/server/two-clients/unix: OK
  /char/socket/client/mainloop/unix: OK
  /char/socket/client/wait-conn/unix: OK
  /char/socket/client/mainloop-reconnect/unix: OK
  /char/socket/client/wait-conn-reconnect/unix: OK
  /char/socket/client/mainloop-fdpass/unix: OK
  /char/socket/client/wait-conn-fdpass/unix: OK
  /char/socket/client/reconnect-error/unix: OK
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D FILE DESCRIPTORS: 12 open at exit.
  =3D=3D28263=3D=3D Open AF_UNIX socket 12: <unknown>
  =3D=3D28263=3D=3D    at 0x5B9EAE7: socket (syscall-template.S:81)
  =3D=3D28263=3D=3D    by 0x14B1AC: qemu_socket (osdep.c:472)
  =3D=3D28263=3D=3D    by 0x1562FB: unix_connect_saddr (qemu-sockets.c:985)
  =3D=3D28263=3D=3D    by 0x1575E8: socket_connect (qemu-sockets.c:1158)
  =3D=3D28263=3D=3D    by 0x12A1D2: qio_channel_socket_connect_sync (channe=
l-socket.c:145)
  =3D=3D28263=3D=3D    by 0x13A7B8: tcp_chr_connect_client_task (char-socke=
t.c:1123)
  =3D=3D28263=3D=3D    by 0x125640: qio_task_thread_worker (task.c:124)
  =3D=3D28263=3D=3D    by 0x14F245: qemu_thread_start (qemu-thread-posix.c:=
521)
  =3D=3D28263=3D=3D    by 0x588AEA4: start_thread (pthread_create.c:307)
  =3D=3D28263=3D=3D    by 0x5B9D96C: clone (clone.S:111)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open AF_UNIX socket 11: <unknown>
  =3D=3D28263=3D=3D    at 0x5B9EAE7: socket (syscall-template.S:81)
  =3D=3D28263=3D=3D    by 0x14B1AC: qemu_socket (osdep.c:472)
  =3D=3D28263=3D=3D    by 0x1562FB: unix_connect_saddr (qemu-sockets.c:985)
  =3D=3D28263=3D=3D    by 0x1575E8: socket_connect (qemu-sockets.c:1158)
  =3D=3D28263=3D=3D    by 0x12A1D2: qio_channel_socket_connect_sync (channe=
l-socket.c:145)
  =3D=3D28263=3D=3D    by 0x13A7B8: tcp_chr_connect_client_task (char-socke=
t.c:1123)
  =3D=3D28263=3D=3D    by 0x125640: qio_task_thread_worker (task.c:124)
  =3D=3D28263=3D=3D    by 0x14F245: qemu_thread_start (qemu-thread-posix.c:=
521)
  =3D=3D28263=3D=3D    by 0x588AEA4: start_thread (pthread_create.c:307)
  =3D=3D28263=3D=3D    by 0x5B9D96C: clone (clone.S:111)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 10:
  =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
  =3D=3D28263=3D=3D    by 0x4EC6B06: g_wakeup_new (gwakeup.c:146)
  =3D=3D28263=3D=3D    by 0x4E808B3: g_main_context_new (gmain.c:656)
  =3D=3D28263=3D=3D    by 0x4E842C4: g_get_worker_context (gmain.c:5797)
  =3D=3D28263=3D=3D    by 0x4E84332: ref_unix_signal_handler_unlocked (gmai=
n.c:5205)
  =3D=3D28263=3D=3D    by 0x4E84458: g_child_watch_source_new (gmain.c:5384)
  =3D=3D28263=3D=3D    by 0x4EA5E64: wait_for_child (gtestutils.c:2814)
  =3D=3D28263=3D=3D    by 0x4EA9993: g_test_trap_subprocess (gtestutils.c:3=
100)
  =3D=3D28263=3D=3D    by 0x11BCB3: char_stdio_test (test-char.c:125)
  =3D=3D28263=3D=3D    by 0x4EA92E0: test_case_run (gtestutils.c:2255)
  =3D=3D28263=3D=3D    by 0x4EA92E0: g_test_run_suite_internal (gtestutils.=
c:2339)
  =3D=3D28263=3D=3D    by 0x4EA919A: g_test_run_suite_internal (gtestutils.=
c:2351)
  =3D=3D28263=3D=3D    by 0x4EA947D: g_test_run_suite (gtestutils.c:2426)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 8:
  =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
  =3D=3D28263=3D=3D    by 0x4EC6B06: g_wakeup_new (gwakeup.c:146)
  =3D=3D28263=3D=3D    by 0x4E808B3: g_main_context_new (gmain.c:656)
  =3D=3D28263=3D=3D    by 0x4E8098C: g_main_context_default (gmain.c:692)
  =3D=3D28263=3D=3D    by 0x4E818F4: g_source_attach (gmain.c:1194)
  =3D=3D28263=3D=3D    by 0x158D5B: qemu_init_main_loop (main-loop.c:167)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 7:
  =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
  =3D=3D28263=3D=3D    by 0x16C76B: event_notifier_init (event_notifier-pos=
ix.c:41)
  =3D=3D28263=3D=3D    by 0x1626A7: aio_context_new (async.c:508)
  =3D=3D28263=3D=3D    by 0x158CF9: qemu_init_main_loop (main-loop.c:159)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 6:
  =3D=3D28263=3D=3D    at 0x5B9DEB7: epoll_create1 (syscall-template.S:81)
  =3D=3D28263=3D=3D    by 0x165B5D: fdmon_epoll_setup (fdmon-epoll.c:151)
  =3D=3D28263=3D=3D    by 0x16269D: aio_context_new (async.c:506)
  =3D=3D28263=3D=3D    by 0x158CF9: qemu_init_main_loop (main-loop.c:159)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 5:
  =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
  =3D=3D28263=3D=3D    by 0x16C76B: event_notifier_init (event_notifier-pos=
ix.c:41)
  =3D=3D28263=3D=3D    by 0x1626A7: aio_context_new (async.c:508)
  =3D=3D28263=3D=3D    by 0x1588AF: iohandler_init.part.0 (main-loop.c:551)
  =3D=3D28263=3D=3D    by 0x158C23: iohandler_init (main-loop.c:575)
  =3D=3D28263=3D=3D    by 0x158C23: qemu_set_fd_handler (main-loop.c:572)
  =3D=3D28263=3D=3D    by 0x158CF1: qemu_signal_init (main-loop.c:109)
  =3D=3D28263=3D=3D    by 0x158CF1: qemu_init_main_loop (main-loop.c:154)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 4:
  =3D=3D28263=3D=3D    at 0x5B9DEB7: epoll_create1 (syscall-template.S:81)
  =3D=3D28263=3D=3D    by 0x165B5D: fdmon_epoll_setup (fdmon-epoll.c:151)
  =3D=3D28263=3D=3D    by 0x16269D: aio_context_new (async.c:506)
  =3D=3D28263=3D=3D    by 0x1588AF: iohandler_init.part.0 (main-loop.c:551)
  =3D=3D28263=3D=3D    by 0x158C23: iohandler_init (main-loop.c:575)
  =3D=3D28263=3D=3D    by 0x158C23: qemu_set_fd_handler (main-loop.c:572)
  =3D=3D28263=3D=3D    by 0x158CF1: qemu_signal_init (main-loop.c:109)
  =3D=3D28263=3D=3D    by 0x158CF1: qemu_init_main_loop (main-loop.c:154)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 3:
  =3D=3D28263=3D=3D    at 0x5B97C89: syscall (syscall.S:38)
  =3D=3D28263=3D=3D    by 0x16C0C1: qemu_signalfd (compatfd.c:103)
  =3D=3D28263=3D=3D    by 0x158CC7: qemu_signal_init (main-loop.c:101)
  =3D=3D28263=3D=3D    by 0x158CC7: qemu_init_main_loop (main-loop.c:154)
  =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 2: /dev/pts/1
  =3D=3D28263=3D=3D    <inherited from parent>
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 1: /dev/pts/1
  =3D=3D28263=3D=3D    <inherited from parent>
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D Open file descriptor 0: /dev/pts/1
  =3D=3D28263=3D=3D    <inherited from parent>
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D HEAP SUMMARY:
  =3D=3D28263=3D=3D     in use at exit: 62,568 bytes in 537 blocks
  =3D=3D28263=3D=3D   total heap usage: 5,803 allocs, 5,266 frees, 2,400,98=
4 bytes allocated
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D 576 bytes in 1 blocks are possibly lost in loss record =
352 of 359
  =3D=3D28263=3D=3D    at 0x4C2C089: calloc (vg_replace_malloc.c:762)
  =3D=3D28263=3D=3D    by 0x4012784: allocate_dtv (dl-tls.c:317)
  =3D=3D28263=3D=3D    by 0x4012784: _dl_allocate_tls (dl-tls.c:533)
  =3D=3D28263=3D=3D    by 0x588B87B: allocate_stack (allocatestack.c:539)
  =3D=3D28263=3D=3D    by 0x588B87B: pthread_create@@GLIBC_2.2.5 (pthread_c=
reate.c:447)
  =3D=3D28263=3D=3D    by 0x1500E5: qemu_thread_create (qemu-thread-posix.c=
:558)
  =3D=3D28263=3D=3D    by 0x1619D8: rcu_init_complete (rcu.c:379)
  =3D=3D28263=3D=3D    by 0x16FC9C: __libc_csu_init (in /home/alex/lsrc/qem=
u.git/builds/crypto-old-nettle/tests/test-char)
  =3D=3D28263=3D=3D    by 0x5AC14E4: (below main) (libc-start.c:225)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D 576 bytes in 1 blocks are possibly lost in loss record =
353 of 359
  =3D=3D28263=3D=3D    at 0x4C2C089: calloc (vg_replace_malloc.c:762)
  =3D=3D28263=3D=3D    by 0x4012784: allocate_dtv (dl-tls.c:317)
  =3D=3D28263=3D=3D    by 0x4012784: _dl_allocate_tls (dl-tls.c:533)
  =3D=3D28263=3D=3D    by 0x588B87B: allocate_stack (allocatestack.c:539)
  =3D=3D28263=3D=3D    by 0x588B87B: pthread_create@@GLIBC_2.2.5 (pthread_c=
reate.c:447)
  =3D=3D28263=3D=3D    by 0x4EC7C81: g_system_thread_new (gthread-posix.c:1=
177)
  =3D=3D28263=3D=3D    by 0x4EAA82E: g_thread_new_internal (gthread.c:874)
  =3D=3D28263=3D=3D    by 0x4EAA8E7: g_thread_new (gthread.c:827)
  =3D=3D28263=3D=3D    by 0x4E842E0: g_get_worker_context (gmain.c:5798)
  =3D=3D28263=3D=3D    by 0x4E84332: ref_unix_signal_handler_unlocked (gmai=
n.c:5205)
  =3D=3D28263=3D=3D    by 0x4E84458: g_child_watch_source_new (gmain.c:5384)
  =3D=3D28263=3D=3D    by 0x4EA5E64: wait_for_child (gtestutils.c:2814)
  =3D=3D28263=3D=3D    by 0x4EA9993: g_test_trap_subprocess (gtestutils.c:3=
100)
  =3D=3D28263=3D=3D    by 0x11BCB3: char_stdio_test (test-char.c:125)
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D LEAK SUMMARY:
  =3D=3D28263=3D=3D    definitely lost: 0 bytes in 0 blocks
  =3D=3D28263=3D=3D    indirectly lost: 0 bytes in 0 blocks
  =3D=3D28263=3D=3D      possibly lost: 1,152 bytes in 2 blocks
  =3D=3D28263=3D=3D    still reachable: 61,416 bytes in 535 blocks
  =3D=3D28263=3D=3D         suppressed: 0 bytes in 0 blocks
  =3D=3D28263=3D=3D Reachable blocks (those to which a pointer was found) a=
re not shown.
  =3D=3D28263=3D=3D To see them, rerun with: --leak-check=3Dfull --show-lea=
k-kinds=3Dall
  =3D=3D28263=3D=3D
  =3D=3D28263=3D=3D For lists of detected and suppressed errors, rerun with=
: -s
  =3D=3D28263=3D=3D ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 =
from 0)

I also have a core dump of the binary when it fails but I suspect it
requires someone with a bit more deftness of QOM to see if anything can
be devised from its guts.

So anyone want to hazard a guess at what's going on?

--=20
Alex Benn=C3=A9e

