Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5686B76E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgkC-0008EG-Cz; Mon, 13 Mar 2023 07:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbgk9-00081m-5e; Mon, 13 Mar 2023 07:53:33 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbgk7-0005wc-17; Mon, 13 Mar 2023 07:53:32 -0400
Received: by mail-lf1-x135.google.com with SMTP id m4so2344793lfj.2;
 Mon, 13 Mar 2023 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678708408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVOTUgNQxA7EoFWG2pPkiRykgEZXo/ib18XDRJSY/YE=;
 b=QF6GrP3fSHFuKbSye5zV1pZrAXyBoNj3i2B1UEfcMgk1o2ZbrIZVr1spyN/9IpN7c3
 GkjlQ4eQzeAHMNKuBXbbKK3AmaNfwdghwQGbTRe/70ECqy0IZObgBz6hB3Y94H2XMVZ0
 Cl99TZalFuFivSU+i4ZiS0AeBgnywEQIVslpnEsrplZ6nxZtR6l1MKtFOtjYtoKYVna5
 DlfwSg7w4A1DRK/k8/wWSdILGzcXjTHfW1bepYYkkTE35ho0RuJtSvSEW1MxqP0J7T9h
 vdf+H1r7HC2zYaAV5TxqbsqUWKJlPabK8tkT5mcQpX5mNbmtpVf/U/oGLvacB5M5Qk9E
 bSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678708408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVOTUgNQxA7EoFWG2pPkiRykgEZXo/ib18XDRJSY/YE=;
 b=oeD63Jz0ezacaXbNKBeZQmuFJScGypqLHa0l9nNrH2zd15vIlbGQEs4r+zTWrjHxOL
 Ha2pRH8KNpIMcI26psr5o4hg5QKIcxqGwh/7A2Ibra75csjc+qfYLgMmkzqIYS/hO3jm
 cF0/apCVT12RbrLJkdZuplfye8M8kg/sSj8Su/lmks7kXU3qDvOYy/PBAXXEpW6lAIwt
 JL8k/v05v/3R3/mOqZXnKLTe/+zy2QEV/JCdWcI/kCw3m14QGmjjFmDl22JHoaoGP2sc
 MmHfLVDRTpqOq7yHhq31zLA2xme5hUrKa3f1Od8kSH59LKhz5wHVSbE3cloi+FbDAgFD
 qBsg==
X-Gm-Message-State: AO0yUKXj43vHOnGdCV/XFzGJiNELixe5hiyQ52JaD8/IAbutUmyi7GiL
 TkpU0HNJfwsLJhoxXxyMrOGz/nWNlh+LSOmFPosGxRla11k=
X-Google-Smtp-Source: AK7set/r2z3L5RG0ihZYa2r388souYp+2/BvaauQrIDkbRfrisW0mGqpm5UpurCostDQU8u8uRG+/EEjBVRBxMUMSrg=
X-Received: by 2002:ac2:4884:0:b0:4db:4604:6328 with SMTP id
 x4-20020ac24884000000b004db46046328mr10242426lfc.11.1678708407573; Mon, 13
 Mar 2023 04:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Mar 2023 15:53:16 +0400
Message-ID: <CAJ+F1CLAacXirNOmhxrbuCZDCAwArdTyicVSkFHFwofcncSe2Q@mail.gmail.com>
Subject: Re: [PULL 00/25] Win socket patches
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Mon, Mar 13, 2023 at 3:44=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc35=
17:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laure=
nt_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-reque=
st
>
> for you to fetch changes up to 0006c18362cbe1e93587ac1e8ee965c08e6970f2:
>
>   QMP/HMP: only actually implement getfd on CONFIG_POSIX (2023-03-13 15:4=
1:32 +0400)
>
> ----------------------------------------------------------------
> QMP command to import win32 sockets
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (25):
>   util: drop qemu_fork()
>   tests: use closesocket()
>   io: use closesocket()
>   tests: add test-error-report
>   error: add global &error_warn destination
>   win32/socket: introduce qemu_socket_select() helper
>   win32/socket: introduce qemu_socket_unselect() helper
>   aio: make aio_set_fd_poll() static to aio-posix.c
>   aio/win32: aio_set_fd_handler() only supports SOCKET
>   main-loop: remove qemu_fd_register(), win32/slirp/socket specific
>   slirp: unregister the win32 SOCKET
>   slirp: open-code qemu_socket_(un)select()
>   win32: avoid mixing SOCKET and file descriptor space
>   os-posix: remove useless ioctlsocket() define
>   win32: replace closesocket() with close() wrapper
>   tests: fix path separator, use g_build_filename()
>   char: do not double-close fd when failing to add client
>   tests/docker: fix a win32 error due to portability
>   osdep: implement qemu_socketpair() for win32
>   qmp: 'add_client' actually expects sockets
>   monitor: release the lock before calling close()
>   qmp: add 'get-win32-socket'
>   libqtest: make qtest_qmp_add_client work on win32
>   qtest: enable vnc-display test on win32

Would you consider those 3 patches as "features"? Is it too late to
include before hard-feature freeze? The patches were ready for the
soft-freeze deadline (I was expecting Paolo to send a PR last week, so
I could quickly follow up with those patches in a PR)

>   QMP/HMP: only actually implement getfd on CONFIG_POSIX
>
>  qapi/misc.json                       |  36 ++-
>  include/block/aio.h                  |   8 -
>  include/qapi/error.h                 |   6 +
>  include/qemu/main-loop.h             |   2 -
>  include/qemu/osdep.h                 |  14 --
>  include/qemu/sockets.h               |   2 -
>  include/sysemu/os-posix.h            |   3 -
>  include/sysemu/os-win32.h            |  15 +-
>  tests/qtest/libqtest.h               |   5 +-
>  backends/tpm/tpm_emulator.c          |   6 +-
>  chardev/char.c                       |   2 -
>  crypto/afalg.c                       |   6 +-
>  hw/hyperv/syndbg.c                   |   4 +-
>  io/channel-socket.c                  |   8 +-
>  io/channel-watch.c                   |  10 +-
>  monitor/fds.c                        |  77 ++++--
>  monitor/hmp-cmds.c                   |   2 +
>  monitor/qmp-cmds.c                   |   7 +
>  net/dgram.c                          |  14 +-
>  net/slirp.c                          |  16 +-
>  net/socket.c                         |  22 +-
>  tests/qtest/libqtest.c               |  26 +-
>  tests/qtest/microbit-test.c          |   2 +-
>  tests/qtest/netdev-socket.c          |  10 +-
>  tests/qtest/vnc-display-test.c       |  12 +-
>  tests/unit/socket-helpers.c          |   2 +-
>  tests/unit/test-error-report.c       | 139 +++++++++++
>  tests/unit/test-io-channel-command.c |   2 +-
>  util/aio-posix.c                     |   6 +-
>  util/aio-win32.c                     |  23 +-
>  util/error.c                         |  10 +-
>  util/main-loop.c                     |  11 -
>  util/oslib-posix.c                   |  70 ------
>  util/oslib-win32.c                   | 350 ++++++++++++++++++++++++---
>  util/qemu-sockets.c                  |  22 +-
>  hmp-commands.hx                      |   2 +
>  tests/docker/docker.py               |   6 +-
>  tests/unit/meson.build               |   1 +
>  38 files changed, 701 insertions(+), 258 deletions(-)
>  create mode 100644 tests/unit/test-error-report.c
>
> --
> 2.39.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

