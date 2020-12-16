Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ED2DC374
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:52:38 +0100 (CET)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZ6T-0004HC-CU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZ4c-0002wN-CG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:50:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZ4Y-0007b7-H2
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:50:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id v14so2818293wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iB8/6Mv3nRp17/bq6nrSn2NHhqH02K6rXproPxTJulM=;
 b=xYPd9ykN2JpDkrXxG1q4gzE9Lh+ZntqG304hMOnQ2oC42mKq7yIcnSPrJEHh/pwJam
 ig+b/fX1XtF1gCay0DQPkdla/wAmvEzFLtUB+tm3QJhMthZ3bIvj2neO1obdVIeRwPmM
 /W3kgC5/xgM8Qo4eoItZH0yUZwsg0Luoh+TKLRMvBLX++Hq3kqyzSnROnzgOShXX7b5f
 kTf0Lsp38g9rXhIFwCczAk2nDMDbeBnHNCyxpnFDqPJKGihRv7MXyRZShDTZwvdwB+D/
 BD9X7qsyU4jLPvPS7UpmBfxY1A32QO4omV7iL99TevxLnxfFv6zCcBCiNNPNJfTWUiWt
 m6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iB8/6Mv3nRp17/bq6nrSn2NHhqH02K6rXproPxTJulM=;
 b=bXEtRM8d9pMFxnvG1WFUg9nQC1yGSdNULVy5pWNZVlDGAs11+R8tpFoWWSwGdgDOsG
 SuFoG9rx8ojFedKUhBL63Fl2QqqPGopL1TZnNTuLxMThHtdBN3fyycWWisPT9WbN3Cda
 FaqkyMH0jjqRUJddHWXcWot6mS3+b8mmJdb9eHVdsDkx8kZkr/CkRgkd+UjGtz5H9zNf
 WJuu2kZgPGUaFNjVkL6NNiQdeEGAY1dnu/25RLko0iQtZd2Vh5d9hVCA9jv9m4wDeJOJ
 oszzg9P3Zbib7nM2kQCNl3T2qPegyuYu7tn289x1g6WwWHGgfKK3ETpzttJZvEU9dci9
 Sdsw==
X-Gm-Message-State: AOAM5302I3i7Bypwxu8nJQ9R5CPcDYkKWfgjmgGJONZc2Qf3B9UreB/Y
 hUBOvFoVcYm/VG/vyq21QG+GOQ==
X-Google-Smtp-Source: ABdhPJy2ZxwH/C1aL11CW65vdi/m6DnzD3k8WV03v/8fi38w24nUj4vznk2KBywdOZhnARCN1j3rsg==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr3923413wme.43.1608133835547; 
 Wed, 16 Dec 2020 07:50:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u13sm3770870wrw.11.2020.12.16.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:50:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A1731FF7E;
 Wed, 16 Dec 2020 15:50:33 +0000 (GMT)
References: <87eejqu6y9.fsf@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: tests/test-char hangs in CI (Centos7 with check-crypto-old-nettle)
Date: Wed, 16 Dec 2020 15:46:52 +0000
In-reply-to: <87eejqu6y9.fsf@linaro.org>
Message-ID: <87wnxhsqba.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <pmathieu@redhat.com>,
 Li Feng <fengli@smartx.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> Over the last few weeks we've seen a steadily more common failure in
> test-char on CI. It seems to only manifest itself on the
> check-crypto-old-nettle build set and fails with a message like:
>
>   Running test test-char
>   Unexpected error in object_property_try_add() at ../qom/object.c:1219:
>   attempt to add duplicate property 'serial-id' to object (type 'containe=
r')
>   ERROR test-char - too few tests run (expected 38, got 9)
>   make: *** [run-test-87] Error 1

This is fixed by Eduardo's patch:

  Subject: [PATCH 0/2] Fix test-char reference counting bug
  Date: Tue, 15 Dec 2020 17:41:31 -0500
  Message-Id: <20201215224133.3545901-1-ehabkost@redhat.com>

which also fixes:
>
> passed with flying colours. It seems there must be an interaction
> between the tests to cause the failure. Attempts to valgrind out any
> strangeness were met with valgrind hanging on exit but otherwise
> passing. You can avoid the hang in valgrind by commenting out:
>
> --8<---------------cut here---------------start------------->8---
> modified   tests/test-char.c
> @@ -1434,11 +1434,11 @@ static void char_hotswap_test(void)
>      g_free(chr_args);
>  }
>=20=20
> -static SocketAddress tcpaddr =3D {
> -    .type =3D SOCKET_ADDRESS_TYPE_INET,
> -    .u.inet.host =3D (char *)"127.0.0.1",
> -    .u.inet.port =3D (char *)"0",
> -};
> +/* static SocketAddress tcpaddr =3D { */
> +/*     .type =3D SOCKET_ADDRESS_TYPE_INET, */
> +/*     .u.inet.host =3D (char *)"127.0.0.1", */
> +/*     .u.inet.port =3D (char *)"0", */
> +/* }; */
>  #ifndef WIN32
>  static SocketAddress unixaddr =3D {
>      .type =3D SOCKET_ADDRESS_TYPE_UNIX,
> @@ -1534,12 +1534,12 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/char/socket/client/dupid-reconnect/" # name, \
>                           &client8 ##name, char_socket_client_dupid_test)
>=20=20
> -    if (has_ipv4) {
> -        SOCKET_SERVER_TEST(tcp, &tcpaddr);
> -        SOCKET_CLIENT_TEST(tcp, &tcpaddr);
> -        g_test_add_data_func("/char/socket/server/two-clients/tcp", &tcp=
addr,
> -                             char_socket_server_two_clients_test);
> -    }
> +    /* if (has_ipv4) { */
> +    /*     SOCKET_SERVER_TEST(tcp, &tcpaddr); */
> +    /*     SOCKET_CLIENT_TEST(tcp, &tcpaddr); */
> +    /*     g_test_add_data_func("/char/socket/server/two-clients/tcp", &=
tcpaddr, */
> +    /*                          char_socket_server_two_clients_test); */
> +    /* } */
>  #ifndef WIN32
>      SOCKET_SERVER_TEST(unix, &unixaddr);
>      SOCKET_CLIENT_TEST(unix, &unixaddr);
> --8<---------------cut here---------------end--------------->8---

the need for the above, however we still see the "leaked" fd's and I
also noticed you can't run the same test in parallel in the same
directory (soak test and valgrind) because of a non-unique socket
address in:

#ifndef WIN32
static SocketAddress unixaddr =3D {
    .type =3D SOCKET_ADDRESS_TYPE_UNIX,
    .u.q_unix.path =3D (char *)"test-char.sock",
};
#endif

>
> At that point valgrind doesn't have any smoking guns of corruption but
> minor leaks and also it seems a bunch of fd's being used up:
>
>   [alex@centos7 crypto-old-nettle]$ valgrind --tool=3Dmemcheck --leak-che=
ck=3Dfull --track-origins=3Dyes --track-fds=3Dyes ./tests/test-char
>   =3D=3D28263=3D=3D Memcheck, a memory error detector
>   =3D=3D28263=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Sew=
ard et al.
>   =3D=3D28263=3D=3D Using Valgrind-3.15.0 and LibVEX; rerun with -h for c=
opyright info
>   =3D=3D28263=3D=3D Command: ./tests/test-char
>   =3D=3D28263=3D=3D
>   /char/null: OK
>   /char/invalid: OK
>   /char/ringbuf: OK
>   /char/mux: OK
>   /char/stdio: OK
>   /char/pipe: OK
>   /char/file: OK
>   /char/file-fifo: OK
>   /char/udp: OK
>   /char/serial: OK
>   /char/hotswap: OK
>   /char/websocket: OK
>   /char/socket/server/mainloop/unix: OK
>   /char/socket/server/wait-conn/unix: OK
>   /char/socket/server/mainloop-fdpass/unix: OK
>   /char/socket/server/wait-conn-fdpass/unix: OK
>   /char/socket/server/two-clients/unix: OK
>   /char/socket/client/mainloop/unix: OK
>   /char/socket/client/wait-conn/unix: OK
>   /char/socket/client/mainloop-reconnect/unix: OK
>   /char/socket/client/wait-conn-reconnect/unix: OK
>   /char/socket/client/mainloop-fdpass/unix: OK
>   /char/socket/client/wait-conn-fdpass/unix: OK
>   /char/socket/client/reconnect-error/unix: OK
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D FILE DESCRIPTORS: 12 open at exit.
>   =3D=3D28263=3D=3D Open AF_UNIX socket 12: <unknown>
>   =3D=3D28263=3D=3D    at 0x5B9EAE7: socket (syscall-template.S:81)
>   =3D=3D28263=3D=3D    by 0x14B1AC: qemu_socket (osdep.c:472)
>   =3D=3D28263=3D=3D    by 0x1562FB: unix_connect_saddr (qemu-sockets.c:98=
5)
>   =3D=3D28263=3D=3D    by 0x1575E8: socket_connect (qemu-sockets.c:1158)
>   =3D=3D28263=3D=3D    by 0x12A1D2: qio_channel_socket_connect_sync (chan=
nel-socket.c:145)
>   =3D=3D28263=3D=3D    by 0x13A7B8: tcp_chr_connect_client_task (char-soc=
ket.c:1123)
>   =3D=3D28263=3D=3D    by 0x125640: qio_task_thread_worker (task.c:124)
>   =3D=3D28263=3D=3D    by 0x14F245: qemu_thread_start (qemu-thread-posix.=
c:521)
>   =3D=3D28263=3D=3D    by 0x588AEA4: start_thread (pthread_create.c:307)
>   =3D=3D28263=3D=3D    by 0x5B9D96C: clone (clone.S:111)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open AF_UNIX socket 11: <unknown>
>   =3D=3D28263=3D=3D    at 0x5B9EAE7: socket (syscall-template.S:81)
>   =3D=3D28263=3D=3D    by 0x14B1AC: qemu_socket (osdep.c:472)
>   =3D=3D28263=3D=3D    by 0x1562FB: unix_connect_saddr (qemu-sockets.c:98=
5)
>   =3D=3D28263=3D=3D    by 0x1575E8: socket_connect (qemu-sockets.c:1158)
>   =3D=3D28263=3D=3D    by 0x12A1D2: qio_channel_socket_connect_sync (chan=
nel-socket.c:145)
>   =3D=3D28263=3D=3D    by 0x13A7B8: tcp_chr_connect_client_task (char-soc=
ket.c:1123)
>   =3D=3D28263=3D=3D    by 0x125640: qio_task_thread_worker (task.c:124)
>   =3D=3D28263=3D=3D    by 0x14F245: qemu_thread_start (qemu-thread-posix.=
c:521)
>   =3D=3D28263=3D=3D    by 0x588AEA4: start_thread (pthread_create.c:307)
>   =3D=3D28263=3D=3D    by 0x5B9D96C: clone (clone.S:111)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 10:
>   =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
>   =3D=3D28263=3D=3D    by 0x4EC6B06: g_wakeup_new (gwakeup.c:146)
>   =3D=3D28263=3D=3D    by 0x4E808B3: g_main_context_new (gmain.c:656)
>   =3D=3D28263=3D=3D    by 0x4E842C4: g_get_worker_context (gmain.c:5797)
>   =3D=3D28263=3D=3D    by 0x4E84332: ref_unix_signal_handler_unlocked (gm=
ain.c:5205)
>   =3D=3D28263=3D=3D    by 0x4E84458: g_child_watch_source_new (gmain.c:53=
84)
>   =3D=3D28263=3D=3D    by 0x4EA5E64: wait_for_child (gtestutils.c:2814)
>   =3D=3D28263=3D=3D    by 0x4EA9993: g_test_trap_subprocess (gtestutils.c=
:3100)
>   =3D=3D28263=3D=3D    by 0x11BCB3: char_stdio_test (test-char.c:125)
>   =3D=3D28263=3D=3D    by 0x4EA92E0: test_case_run (gtestutils.c:2255)
>   =3D=3D28263=3D=3D    by 0x4EA92E0: g_test_run_suite_internal (gtestutil=
s.c:2339)
>   =3D=3D28263=3D=3D    by 0x4EA919A: g_test_run_suite_internal (gtestutil=
s.c:2351)
>   =3D=3D28263=3D=3D    by 0x4EA947D: g_test_run_suite (gtestutils.c:2426)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 8:
>   =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
>   =3D=3D28263=3D=3D    by 0x4EC6B06: g_wakeup_new (gwakeup.c:146)
>   =3D=3D28263=3D=3D    by 0x4E808B3: g_main_context_new (gmain.c:656)
>   =3D=3D28263=3D=3D    by 0x4E8098C: g_main_context_default (gmain.c:692)
>   =3D=3D28263=3D=3D    by 0x4E818F4: g_source_attach (gmain.c:1194)
>   =3D=3D28263=3D=3D    by 0x158D5B: qemu_init_main_loop (main-loop.c:167)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 7:
>   =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
>   =3D=3D28263=3D=3D    by 0x16C76B: event_notifier_init (event_notifier-p=
osix.c:41)
>   =3D=3D28263=3D=3D    by 0x1626A7: aio_context_new (async.c:508)
>   =3D=3D28263=3D=3D    by 0x158CF9: qemu_init_main_loop (main-loop.c:159)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 6:
>   =3D=3D28263=3D=3D    at 0x5B9DEB7: epoll_create1 (syscall-template.S:81)
>   =3D=3D28263=3D=3D    by 0x165B5D: fdmon_epoll_setup (fdmon-epoll.c:151)
>   =3D=3D28263=3D=3D    by 0x16269D: aio_context_new (async.c:506)
>   =3D=3D28263=3D=3D    by 0x158CF9: qemu_init_main_loop (main-loop.c:159)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 5:
>   =3D=3D28263=3D=3D    at 0x5B9DC1D: eventfd (eventfd.c:28)
>   =3D=3D28263=3D=3D    by 0x16C76B: event_notifier_init (event_notifier-p=
osix.c:41)
>   =3D=3D28263=3D=3D    by 0x1626A7: aio_context_new (async.c:508)
>   =3D=3D28263=3D=3D    by 0x1588AF: iohandler_init.part.0 (main-loop.c:55=
1)
>   =3D=3D28263=3D=3D    by 0x158C23: iohandler_init (main-loop.c:575)
>   =3D=3D28263=3D=3D    by 0x158C23: qemu_set_fd_handler (main-loop.c:572)
>   =3D=3D28263=3D=3D    by 0x158CF1: qemu_signal_init (main-loop.c:109)
>   =3D=3D28263=3D=3D    by 0x158CF1: qemu_init_main_loop (main-loop.c:154)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 4:
>   =3D=3D28263=3D=3D    at 0x5B9DEB7: epoll_create1 (syscall-template.S:81)
>   =3D=3D28263=3D=3D    by 0x165B5D: fdmon_epoll_setup (fdmon-epoll.c:151)
>   =3D=3D28263=3D=3D    by 0x16269D: aio_context_new (async.c:506)
>   =3D=3D28263=3D=3D    by 0x1588AF: iohandler_init.part.0 (main-loop.c:55=
1)
>   =3D=3D28263=3D=3D    by 0x158C23: iohandler_init (main-loop.c:575)
>   =3D=3D28263=3D=3D    by 0x158C23: qemu_set_fd_handler (main-loop.c:572)
>   =3D=3D28263=3D=3D    by 0x158CF1: qemu_signal_init (main-loop.c:109)
>   =3D=3D28263=3D=3D    by 0x158CF1: qemu_init_main_loop (main-loop.c:154)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 3:
>   =3D=3D28263=3D=3D    at 0x5B97C89: syscall (syscall.S:38)
>   =3D=3D28263=3D=3D    by 0x16C0C1: qemu_signalfd (compatfd.c:103)
>   =3D=3D28263=3D=3D    by 0x158CC7: qemu_signal_init (main-loop.c:101)
>   =3D=3D28263=3D=3D    by 0x158CC7: qemu_init_main_loop (main-loop.c:154)
>   =3D=3D28263=3D=3D    by 0x118FD7: main (test-char.c:1453)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 2: /dev/pts/1
>   =3D=3D28263=3D=3D    <inherited from parent>
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 1: /dev/pts/1
>   =3D=3D28263=3D=3D    <inherited from parent>
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D Open file descriptor 0: /dev/pts/1
>   =3D=3D28263=3D=3D    <inherited from parent>
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D HEAP SUMMARY:
>   =3D=3D28263=3D=3D     in use at exit: 62,568 bytes in 537 blocks
>   =3D=3D28263=3D=3D   total heap usage: 5,803 allocs, 5,266 frees, 2,400,=
984 bytes allocated
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D 576 bytes in 1 blocks are possibly lost in loss recor=
d 352 of 359
>   =3D=3D28263=3D=3D    at 0x4C2C089: calloc (vg_replace_malloc.c:762)
>   =3D=3D28263=3D=3D    by 0x4012784: allocate_dtv (dl-tls.c:317)
>   =3D=3D28263=3D=3D    by 0x4012784: _dl_allocate_tls (dl-tls.c:533)
>   =3D=3D28263=3D=3D    by 0x588B87B: allocate_stack (allocatestack.c:539)
>   =3D=3D28263=3D=3D    by 0x588B87B: pthread_create@@GLIBC_2.2.5 (pthread=
_create.c:447)
>   =3D=3D28263=3D=3D    by 0x1500E5: qemu_thread_create (qemu-thread-posix=
.c:558)
>   =3D=3D28263=3D=3D    by 0x1619D8: rcu_init_complete (rcu.c:379)
>   =3D=3D28263=3D=3D    by 0x16FC9C: __libc_csu_init (in /home/alex/lsrc/q=
emu.git/builds/crypto-old-nettle/tests/test-char)
>   =3D=3D28263=3D=3D    by 0x5AC14E4: (below main) (libc-start.c:225)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D 576 bytes in 1 blocks are possibly lost in loss recor=
d 353 of 359
>   =3D=3D28263=3D=3D    at 0x4C2C089: calloc (vg_replace_malloc.c:762)
>   =3D=3D28263=3D=3D    by 0x4012784: allocate_dtv (dl-tls.c:317)
>   =3D=3D28263=3D=3D    by 0x4012784: _dl_allocate_tls (dl-tls.c:533)
>   =3D=3D28263=3D=3D    by 0x588B87B: allocate_stack (allocatestack.c:539)
>   =3D=3D28263=3D=3D    by 0x588B87B: pthread_create@@GLIBC_2.2.5 (pthread=
_create.c:447)
>   =3D=3D28263=3D=3D    by 0x4EC7C81: g_system_thread_new (gthread-posix.c=
:1177)
>   =3D=3D28263=3D=3D    by 0x4EAA82E: g_thread_new_internal (gthread.c:874)
>   =3D=3D28263=3D=3D    by 0x4EAA8E7: g_thread_new (gthread.c:827)
>   =3D=3D28263=3D=3D    by 0x4E842E0: g_get_worker_context (gmain.c:5798)
>   =3D=3D28263=3D=3D    by 0x4E84332: ref_unix_signal_handler_unlocked (gm=
ain.c:5205)
>   =3D=3D28263=3D=3D    by 0x4E84458: g_child_watch_source_new (gmain.c:53=
84)
>   =3D=3D28263=3D=3D    by 0x4EA5E64: wait_for_child (gtestutils.c:2814)
>   =3D=3D28263=3D=3D    by 0x4EA9993: g_test_trap_subprocess (gtestutils.c=
:3100)
>   =3D=3D28263=3D=3D    by 0x11BCB3: char_stdio_test (test-char.c:125)
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D LEAK SUMMARY:
>   =3D=3D28263=3D=3D    definitely lost: 0 bytes in 0 blocks
>   =3D=3D28263=3D=3D    indirectly lost: 0 bytes in 0 blocks
>   =3D=3D28263=3D=3D      possibly lost: 1,152 bytes in 2 blocks
>   =3D=3D28263=3D=3D    still reachable: 61,416 bytes in 535 blocks
>   =3D=3D28263=3D=3D         suppressed: 0 bytes in 0 blocks
>   =3D=3D28263=3D=3D Reachable blocks (those to which a pointer was found)=
 are not shown.
>   =3D=3D28263=3D=3D To see them, rerun with: --leak-check=3Dfull --show-l=
eak-kinds=3Dall
>   =3D=3D28263=3D=3D
>   =3D=3D28263=3D=3D For lists of detected and suppressed errors, rerun wi=
th: -s
>   =3D=3D28263=3D=3D ERROR SUMMARY: 2 errors from 2 contexts (suppressed: =
0 from 0)
>
> I also have a core dump of the binary when it fails but I suspect it
> requires someone with a bit more deftness of QOM to see if anything can
> be devised from its guts.
>
> So anyone want to hazard a guess at what's going on?


--=20
Alex Benn=C3=A9e

