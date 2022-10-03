Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A35F2E3C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:37:39 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHtK-0005bt-4t
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofHiD-0006AW-JC; Mon, 03 Oct 2022 05:26:10 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ofHiA-0000Vm-BT; Mon, 03 Oct 2022 05:26:08 -0400
Received: by mail-lj1-x22f.google.com with SMTP id d26so2828886ljl.2;
 Mon, 03 Oct 2022 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=OiVJE4I3Tpk0/+UErSu5AkTfcxYalWlyKPQO6XTk+Js=;
 b=ZDrOpdPenUSlZpIJEGDM1T3p5P/KJpFURelf1bi8nK57PZ37msQ+KMNzRO0+fgVjqt
 2nTxr5I6jg0yvYHK3TSHmswhN+WfJPI7ZAJXXkmQAzG1Y2V1Gp3atxe/rWd0j8KPWK/S
 +GMEJssY4sRsK6A8xN6qAPspBss31DGIxBImYhY8L9DhVtBrgREGBiqnS61gDYHKZp0V
 OjKpERBI+hUDCNmn1CXekLKP1iLIXdJy73DuPNrRP8yPsvYtgGgQKmRY2hlaLePFwT/U
 RD9+axFwv6K+WeV53FtbsyAUcwM/DnwiltDWONIoxEoImxyprYfjTiFwBF//9vFWg1RH
 IJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OiVJE4I3Tpk0/+UErSu5AkTfcxYalWlyKPQO6XTk+Js=;
 b=uEvMXhBRCZRCT/4Fgtl+EKKF6LhdFG+fm/gAHoMYFLLWQPwBUpmjHNJn2cs0eGbJe+
 ky9VaH9JPH0GeZQKj1CAISNuxy2uzJk3p9Rpopge1tDPidKNyR7RH5DXS+3DZ/nOR8XZ
 F47UiT7U3HOStQFI93HM/W112+VE+5xIj91OZlrt9juuvB19VggxBTQk6NW1hn8TWRs1
 tfZBbH/oy6sblMuOTecszcPv7RqOhfac/CO4VrN/252vhLMGJ5b2R6ox/oz8toEILUdY
 FO5emal6K+ra9OzT2BQWjMC5Af0Sai/pr5GZ5dinsFQ/fg9cdPnhs9xTrYAuUPNICx5x
 RmYw==
X-Gm-Message-State: ACrzQf1kEipJk/89qUw+LcPa9xrIH2zOPY7MTgkQxANDyGlBgMdIgfeA
 BsrWYkClgDIUx3ED4sPpOn2SPRmUTNR4Q5hH/kM=
X-Google-Smtp-Source: AMsMyM5Tv0zysj5+8/SXQbZvf/3yoHWl8kfqdJjBlIKIEhoTBz9Kw1cu7HzC/5LNESeXy6mxXzLCE2XKhDTFvZVF8TA=
X-Received: by 2002:a05:651c:c98:b0:26d:de84:cfc8 with SMTP id
 bz24-20020a05651c0c9800b0026dde84cfc8mr1138251ljb.529.1664789163222; Mon, 03
 Oct 2022 02:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 3 Oct 2022 13:25:51 +0400
Message-ID: <CAJ+F1CJ3cTdNwZEQ5i+05mgYXXngyRAF6MoX6JFadsp9tKEgmg@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, 
 Bandan Das <bsd@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Willian Rampazzo <willianr@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b3310305ea1deea7"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000b3310305ea1deea7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bin

On Tue, Sep 27, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.
>
> Changes in v4:
> - Do not use g_autofree and g_steal_pointer
> - Update the error reporting by using the GError "error" argument
>   of g_dir_make_tmp()
> - Remove the const from tmpfs declaration
> - Replace the whole block with a g_assert_no_error()
> - Replace the error reporting with g_assert_no_error()
> - Update error reporting
> - Move the new text section after the "QTest" section instead
> - Use plural in both cases: "on POSIX hosts as well as Windows hosts"
> - Use "The following list shows some best practices"
> - Fix typo of delimiter
> - New patch: "tests/qtest: boot-serial-test: Close the serial file before
> starting QEMU"
> - Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the
> file for win32"
>
>
Could you post a v5 rebased on the current master? thanks

(I think most of the remaining patches are simple enough that I could take
them in a misc PR if they are not picked by subsystem maintainers)

Changes in v3:
> - Remove unnecessary "error =3D NULL" statements
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Use g_steal_pointer() in create_test_img()
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> - Split to a separate patch
> - Split to a separate patch
> - Add a usleep(1) in the busy wait loop
> - Drop the host test
> - Drop patch: "tests: Change to use g_mkdir()"
> - Drop patch: "block: Unify the get_tmp_filename() implementation",
>   and send it as a separate patch
>
> Changes in v2:
> - new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be
> portable"
> - Use g_autofree to declare the variable
> - Change to use g_mkdir()
> - Change to use g_mkdir()
> - Change to use g_mkdir()
> - Change to skip only part of the virtio-net-test cases that require
>   socketpair() intead of disabling all of them
> - Introduce a new variable qtests_filter and add that to the
>   qtests_ARCH variables
> - Add a comment in the code to explain why test_qmp_oob test case
>   is skipped on win32
> - Replace signal by the semaphore on posix too
> - Use __declspec(selectany) for the common weak symbol on Windows
> - Introduce qemu_send_full() and use it
> - Move the enabling of building qtests on Windows to a separate
>   patch to keep bisectablity
> - Call socket_init() unconditionally
> - Add a missing CloseHandle() call
> - Drop ahci-test.c changes that are no longer needed
> - Change the place that sets IO redirection in the command line
> - Change to a busy wait after migration is canceled
> - new patch: "io/channel-watch: Drop the unnecessary cast"
> - Change the timeout limit to 90 minutes
> - new patch: Display meson test logs in the Windows CI
> - new patch: "tests/qtest: Enable qtest build on Windows"
> - Minor wording changes
> - Drop patches that were already applied in the mainline
> - Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
> - Drop patch: "tests: Skip iotests and qtest when
> '--without-default-devices'"
> - Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"
>
> Bin Meng (48):
>   tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
>   semihosting/arm-compat-semi: Avoid using hardcoded /tmp
>   tcg: Avoid using hardcoded /tmp
>   util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
>     temporary files
>   tests/qtest: ahci-test: Avoid using hardcoded /tmp
>   tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp
>   tests/qtest: boot-serial-test: Avoid using hardcoded /tmp
>   tests/qtest: cxl-test: Avoid using hardcoded /tmp
>   tests/qtest: fdc-test: Avoid using hardcoded /tmp
>   tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
>   tests/qtest: virtio_blk_fuzz: Avoid using hardcoded /tmp
>   tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
>   tests/qtest: ide-test: Avoid using hardcoded /tmp
>   tests/qtest: migration-test: Avoid using hardcoded /tmp
>   tests/qtest: pflash-cfi02-test: Avoid using hardcoded /tmp
>   tests/qtest: qmp-test: Avoid using hardcoded /tmp
>   tests/qtest: vhost-user-blk-test: Avoid using hardcoded /tmp
>   tests/qtest: vhost-user-test: Avoid using hardcoded /tmp
>   tests/qtest: virtio-blk-test: Avoid using hardcoded /tmp
>   tests/qtest: virtio-scsi-test: Avoid using hardcoded /tmp
>   tests/qtest: libqtest: Avoid using hardcoded /tmp
>   tests/unit: test-image-locking: Avoid using hardcoded /tmp
>   tests/unit: test-qga: Avoid using hardcoded /tmp
>   tests: vhost-user-bridge: Avoid using hardcoded /tmp
>   block/vvfat: Unify the mkdir() call
>   fsdev/virtfs-proxy-helper: Use g_mkdir()
>   hw/usb: dev-mtp: Use g_mkdir()
>   tests/qtest: Skip running virtio-net-test cases that require
>     socketpair() for win32
>   tests/qtest: Build test-filter-{mirror,redirector} cases for posix
>     only
>   tests/qtest: qmp-test: Skip running test_qmp_oob for win32
>   tests/qtest: libqtest: Exclude the *_fds APIs for win32
>   tests/qtest: libqtest: Install signal handler via signal()
>   tests/qtest: Support libqtest to build and run on Windows
>   tests/qtest: {ahci,ide}-test: Use relative path for temporary files
>     for win32
>   tests/qtest: bios-tables-test: Adapt the case for win32
>   tests/qtest: boot-serial-test: Close the serial file before starting
>     QEMU
>   tests/qtest: microbit-test: Fix socket access for win32
>   tests/qtest: migration-test: Disable IO redirection for win32
>   tests/qtest: libqtest: Replace the call to close a socket with
>     closesocket()
>   tests/qtest: libqtest: Correct the timeout unit of blocking receive
>     calls for win32
>   io/channel-watch: Drop a superfluous '#ifdef WIN32'
>   io/channel-watch: Drop the unnecessary cast
>   io/channel-watch: Fix socket watch on Windows
>   tests/qtest: migration-test: Skip running some TLS cases for win32
>   .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
>   .gitlab-ci.d/windows.yml: Display meson test logs
>   tests/qtest: Enable qtest build on Windows
>   docs/devel: testing: Document writing portable test cases
>
> Xuzhou Cheng (6):
>   accel/qtest: Implement a portable qtest accelerator
>   tests/qtest: libqtest: Adapt global_qtest declaration for win32
>   tests/qtest: Use send/recv for socket communication
>   tests/qtest: ide-test: Open file in binary mode
>   tests/qtest: migration-test: Make sure QEMU process "to" exited after
>     migration is canceled
>   tests/qtest: virtio-net-failover: Disable migration tests for win32
>
>  docs/devel/testing.rst                  |  30 +++++
>  include/hw/core/cpu.h                   |   1 +
>  include/qemu/sockets.h                  |   2 +
>  tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
>  tests/qtest/libqtest-single.h           |   4 +
>  tests/qtest/libqtest.h                  |   8 ++
>  accel/dummy-cpus.c                      |  15 +--
>  block/vvfat.c                           |   9 +-
>  fsdev/virtfs-proxy-helper.c             |   3 +-
>  hw/usb/dev-mtp.c                        |   4 +-
>  io/channel-watch.c                      |  12 +-
>  semihosting/arm-compat-semi.c           |   3 +-
>  softmmu/cpus.c                          |  10 +-
>  tcg/tcg.c                               |   3 +-
>  tests/qtest/ahci-test.c                 |  36 ++++--
>  tests/qtest/aspeed_smc-test.c           |   5 +-
>  tests/qtest/bios-tables-test.c          |  12 +-
>  tests/qtest/boot-serial-test.c          |  11 +-
>  tests/qtest/cxl-test.c                  |  15 +--
>  tests/qtest/fdc-test.c                  |   5 +-
>  tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
>  tests/qtest/hd-geo-test.c               |  24 ++--
>  tests/qtest/i440fx-test.c               |  54 +++-----
>  tests/qtest/ide-test.c                  |  30 ++++-
>  tests/qtest/libqmp.c                    |   5 +-
>  tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
>  tests/qtest/microbit-test.c             |  10 +-
>  tests/qtest/migration-test.c            |  38 +++++-
>  tests/qtest/pflash-cfi02-test.c         |  15 ++-
>  tests/qtest/qmp-test.c                  |  17 ++-
>  tests/qtest/vhost-user-blk-test.c       |   3 +-
>  tests/qtest/vhost-user-test.c           |  10 +-
>  tests/qtest/virtio-blk-test.c           |   4 +-
>  tests/qtest/virtio-net-failover.c       |   9 +-
>  tests/qtest/virtio-net-test.c           |  13 +-
>  tests/qtest/virtio-scsi-test.c          |   4 +-
>  tests/unit/test-image-locking.c         |   8 +-
>  tests/unit/test-qga.c                   |   2 +-
>  tests/vhost-user-bridge.c               |   3 +-
>  util/osdep.c                            |  33 +++++
>  util/qemu-sockets.c                     |   5 +-
>  .gitlab-ci.d/windows.yml                |   8 +-
>  accel/meson.build                       |   1 +
>  accel/qtest/meson.build                 |   1 +
>  tests/qtest/meson.build                 |  42 +++----
>  45 files changed, 452 insertions(+), 240 deletions(-)
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b3310305ea1deea7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bin<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022 at 3:18 PM=
 Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In pr=
eparation to adding virtio-9p support on Windows, this series<br>
enables running qtest on Windows, so that we can run the virtio-9p<br>
tests on Windows to make sure it does not break accidently.<br>
<br>
Changes in v4:<br>
- Do not use g_autofree and g_steal_pointer<br>
- Update the error reporting by using the GError &quot;error&quot; argument=
<br>
=C2=A0 of g_dir_make_tmp()<br>
- Remove the const from tmpfs declaration<br>
- Replace the whole block with a g_assert_no_error()<br>
- Replace the error reporting with g_assert_no_error()<br>
- Update error reporting<br>
- Move the new text section after the &quot;QTest&quot; section instead<br>
- Use plural in both cases: &quot;on POSIX hosts as well as Windows hosts&q=
uot;<br>
- Use &quot;The following list shows some best practices&quot;<br>
- Fix typo of delimiter<br>
- New patch: &quot;tests/qtest: boot-serial-test: Close the serial file bef=
ore starting QEMU&quot;<br>
- Drop patch: &quot;chardev/char-file: Add FILE_SHARE_WRITE when openning t=
he file for win32&quot;<br>
<br></blockquote><div><br></div><div>Could you post a v5 rebased on the cur=
rent master? thanks</div><div><br></div><div>(I think most of the remaining=
 patches are simple enough that I could take them in a misc PR if they are =
not picked by subsystem maintainers)<br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Changes in v3:<br>
- Remove unnecessary &quot;error =3D NULL&quot; statements<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Use g_steal_pointer() in create_test_img()<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
- Split to a separate patch<br>
- Split to a separate patch<br>
- Add a usleep(1) in the busy wait loop<br>
- Drop the host test<br>
- Drop patch: &quot;tests: Change to use g_mkdir()&quot;<br>
- Drop patch: &quot;block: Unify the get_tmp_filename() implementation&quot=
;,<br>
=C2=A0 and send it as a separate patch<br>
<br>
Changes in v2:<br>
- new patch: &quot;tests/qtest: i440fx-test: Rewrite create_blob_file() to =
be portable&quot;<br>
- Use g_autofree to declare the variable<br>
- Change to use g_mkdir()<br>
- Change to use g_mkdir()<br>
- Change to use g_mkdir()<br>
- Change to skip only part of the virtio-net-test cases that require<br>
=C2=A0 socketpair() intead of disabling all of them<br>
- Introduce a new variable qtests_filter and add that to the<br>
=C2=A0 qtests_ARCH variables<br>
- Add a comment in the code to explain why test_qmp_oob test case<br>
=C2=A0 is skipped on win32<br>
- Replace signal by the semaphore on posix too<br>
- Use __declspec(selectany) for the common weak symbol on Windows<br>
- Introduce qemu_send_full() and use it<br>
- Move the enabling of building qtests on Windows to a separate<br>
=C2=A0 patch to keep bisectablity<br>
- Call socket_init() unconditionally<br>
- Add a missing CloseHandle() call<br>
- Drop ahci-test.c changes that are no longer needed<br>
- Change the place that sets IO redirection in the command line<br>
- Change to a busy wait after migration is canceled<br>
- new patch: &quot;io/channel-watch: Drop the unnecessary cast&quot;<br>
- Change the timeout limit to 90 minutes<br>
- new patch: Display meson test logs in the Windows CI<br>
- new patch: &quot;tests/qtest: Enable qtest build on Windows&quot;<br>
- Minor wording changes<br>
- Drop patches that were already applied in the mainline<br>
- Drop patch: &quot;qga/commands-posix-ssh: Use g_mkdir_with_parents()&quot=
;<br>
- Drop patch: &quot;tests: Skip iotests and qtest when &#39;--without-defau=
lt-devices&#39;&quot;<br>
- Drop patch: &quot;tests/qtest: Fix ERROR_SHARING_VIOLATION for win32&quot=
;<br>
<br>
Bin Meng (48):<br>
=C2=A0 tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable<=
br>
=C2=A0 semihosting/arm-compat-semi: Avoid using hardcoded /tmp<br>
=C2=A0 tcg: Avoid using hardcoded /tmp<br>
=C2=A0 util/qemu-sockets: Use g_get_tmp_dir() to get the directory for<br>
=C2=A0 =C2=A0 temporary files<br>
=C2=A0 tests/qtest: ahci-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: boot-serial-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: cxl-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: fdc-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: generic_fuzz: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: virtio_blk_fuzz: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: hd-geo-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: ide-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: migration-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: pflash-cfi02-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: qmp-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: vhost-user-blk-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: vhost-user-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: virtio-blk-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: virtio-scsi-test: Avoid using hardcoded /tmp<br>
=C2=A0 tests/qtest: libqtest: Avoid using hardcoded /tmp<br>
=C2=A0 tests/unit: test-image-locking: Avoid using hardcoded /tmp<br>
=C2=A0 tests/unit: test-qga: Avoid using hardcoded /tmp<br>
=C2=A0 tests: vhost-user-bridge: Avoid using hardcoded /tmp<br>
=C2=A0 block/vvfat: Unify the mkdir() call<br>
=C2=A0 fsdev/virtfs-proxy-helper: Use g_mkdir()<br>
=C2=A0 hw/usb: dev-mtp: Use g_mkdir()<br>
=C2=A0 tests/qtest: Skip running virtio-net-test cases that require<br>
=C2=A0 =C2=A0 socketpair() for win32<br>
=C2=A0 tests/qtest: Build test-filter-{mirror,redirector} cases for posix<b=
r>
=C2=A0 =C2=A0 only<br>
=C2=A0 tests/qtest: qmp-test: Skip running test_qmp_oob for win32<br>
=C2=A0 tests/qtest: libqtest: Exclude the *_fds APIs for win32<br>
=C2=A0 tests/qtest: libqtest: Install signal handler via signal()<br>
=C2=A0 tests/qtest: Support libqtest to build and run on Windows<br>
=C2=A0 tests/qtest: {ahci,ide}-test: Use relative path for temporary files<=
br>
=C2=A0 =C2=A0 for win32<br>
=C2=A0 tests/qtest: bios-tables-test: Adapt the case for win32<br>
=C2=A0 tests/qtest: boot-serial-test: Close the serial file before starting=
<br>
=C2=A0 =C2=A0 QEMU<br>
=C2=A0 tests/qtest: microbit-test: Fix socket access for win32<br>
=C2=A0 tests/qtest: migration-test: Disable IO redirection for win32<br>
=C2=A0 tests/qtest: libqtest: Replace the call to close a socket with<br>
=C2=A0 =C2=A0 closesocket()<br>
=C2=A0 tests/qtest: libqtest: Correct the timeout unit of blocking receive<=
br>
=C2=A0 =C2=A0 calls for win32<br>
=C2=A0 io/channel-watch: Drop a superfluous &#39;#ifdef WIN32&#39;<br>
=C2=A0 io/channel-watch: Drop the unnecessary cast<br>
=C2=A0 io/channel-watch: Fix socket watch on Windows<br>
=C2=A0 tests/qtest: migration-test: Skip running some TLS cases for win32<b=
r>
=C2=A0 .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes<br>
=C2=A0 .gitlab-ci.d/windows.yml: Display meson test logs<br>
=C2=A0 tests/qtest: Enable qtest build on Windows<br>
=C2=A0 docs/devel: testing: Document writing portable test cases<br>
<br>
Xuzhou Cheng (6):<br>
=C2=A0 accel/qtest: Implement a portable qtest accelerator<br>
=C2=A0 tests/qtest: libqtest: Adapt global_qtest declaration for win32<br>
=C2=A0 tests/qtest: Use send/recv for socket communication<br>
=C2=A0 tests/qtest: ide-test: Open file in binary mode<br>
=C2=A0 tests/qtest: migration-test: Make sure QEMU process &quot;to&quot; e=
xited after<br>
=C2=A0 =C2=A0 migration is canceled<br>
=C2=A0 tests/qtest: virtio-net-failover: Disable migration tests for win32<=
br>
<br>
=C2=A0docs/devel/testing.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 30 +++++<br>
=C2=A0include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0tests/qtest/fuzz/generic_fuzz_configs.h |=C2=A0 =C2=A04 +-<br>
=C2=A0tests/qtest/libqtest-single.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tests/qtest/libqtest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 ++<br>
=C2=A0accel/dummy-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +--<br>
=C2=A0block/vvfat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0fsdev/virtfs-proxy-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0hw/usb/dev-mtp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0io/channel-watch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0semihosting/arm-compat-semi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0tcg/tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0tests/qtest/ahci-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 36 ++++--<br>
=C2=A0tests/qtest/aspeed_smc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0tests/qtest/bios-tables-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 12 +-<br>
=C2=A0tests/qtest/boot-serial-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 11 +-<br>
=C2=A0tests/qtest/cxl-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 15 +--<br>
=C2=A0tests/qtest/fdc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0tests/qtest/fuzz/virtio_blk_fuzz.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
4 +-<br>
=C2=A0tests/qtest/hd-geo-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 24 ++--<br>
=C2=A0tests/qtest/i440fx-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 54 +++-----<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 30 ++++-<br>
=C2=A0tests/qtest/libqmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 157 ++++++++++++++++++++----<br>
=C2=A0tests/qtest/microbit-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 10 +-<br>
=C2=A0tests/qtest/migration-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 38 +++++-<br>
=C2=A0tests/qtest/pflash-cfi02-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 15 ++-<br>
=C2=A0tests/qtest/qmp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 17 ++-<br>
=C2=A0tests/qtest/vhost-user-blk-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +-<br>
=C2=A0tests/qtest/vhost-user-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +-<br>
=C2=A0tests/qtest/virtio-blk-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0tests/qtest/virtio-net-failover.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A09 +-<br>
=C2=A0tests/qtest/virtio-net-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 13 +-<br>
=C2=A0tests/qtest/virtio-scsi-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0tests/unit/test-image-locking.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A08 +-<br>
=C2=A0tests/unit/test-qga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tests/vhost-user-bridge.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +++++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0.gitlab-ci.d/windows.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0accel/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0accel/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 42 +++----<br>
=C2=A045 files changed, 452 insertions(+), 240 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b3310305ea1deea7--

