Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B776A47C76F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:25:34 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzklR-0001r7-2P
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:25:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzkin-0000rc-8h
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:22:49 -0500
Received: from [2607:f8b0:4864:20::632] (port=42713
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzkil-0002Xb-4u
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:22:48 -0500
Received: by mail-pl1-x632.google.com with SMTP id u16so14089plg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 11:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qaFIQC5UAWDOQARbop0NJkLfETxccpXG9VG7BANuENE=;
 b=CbwKlEJJ9zuxy50LjkJu4sSTl2EkG5O1UowiW0r2m7lnvJSLsd5WW5RjjABvHJvukG
 fO/FvTykQJ9sAnd6EV996CBiLoFRA6btbNgoyUI+l036ytXZnplKwfzVH30dPVQ2st2A
 mRlcop67/ZzCPpcI4uWxF+/ZYTDK4PfVoXP1u8FGaK1DdDfBYh7SLZKqUb77kWxXnD5o
 0Psc1je/tNnigm6OOnBlr00L158NCYPGxZdo5ok4/yEXiU+Q11frcr+maOQnmxPjM8Vt
 wMlwWBZLWhIgTUqBGtHU8AXqT7PvvdehpqICoyI8ecR/ye5AGw6MWaoGIzWm43z78jnX
 HqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qaFIQC5UAWDOQARbop0NJkLfETxccpXG9VG7BANuENE=;
 b=A6tVnADXVc7LTe9vhJAgsVLdtW5ltRZkGU0+E8txS9fgJhp/kJz04FutgQkNGvzeuf
 lp/8p/2BhPuycP6RC7CfaSqoihGK60dKhaMoCmqJ71Kh+m0uAK1mGhrJtYcD8KfS+bQY
 IK89/vpZwhd98Zh5JxfSKezH/f3f5SOoEpRSWqZz1uf4QL2/7crpE71jF0R9P76ZGh7e
 fYv7//ebVX3u6UGv8F/jssDu2ejNuQZWQLbpRr/f95QibZnt73b3kM4UEac59eltYVWN
 6RP/mQa9/Q6XpKrlYbK36bLn3fsiG05BOHGxmzr1Nk0ZP3xclGcQQrcQrJZ+GtWSkc1f
 GCZw==
X-Gm-Message-State: AOAM532bERvSVcO/CD96MfjsxbQAWyqgTb2LYqpB6nuQNmTIC8eW34Gz
 UYiWKefU70FjDdW73ne54lpj/w==
X-Google-Smtp-Source: ABdhPJzE4NL4Jc/Oot3EaE4/rV3G+jjxEoMTPMDXilaqURSWU6UvaoAnj8WsMmRYihcAilZ6851PDg==
X-Received: by 2002:a17:902:6547:b0:148:ac36:25fc with SMTP id
 d7-20020a170902654700b00148ac3625fcmr4532049pln.144.1640114565625; 
 Tue, 21 Dec 2021 11:22:45 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2439070pga.35.2021.12.21.11.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 11:22:45 -0800 (PST)
Subject: Re: [PULL v2 00/36] ui: D-Bus display backend
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1b298b2-d619-84b6-71f9-93bb8be9ccf8@linaro.org>
Date: Tue, 21 Dec 2021 11:22:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:58 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:
> 
>    Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/marcandre.lureau/qemu.git tags/dbus-pull-request
> 
> for you to fetch changes up to 89f4df9595e162ce4cc65f31a994a31e3e45ff3a:
> 
>    MAINTAINERS: update D-Bus section (2021-12-21 10:50:22 +0400)
> 
> ----------------------------------------------------------------
> Add D-Bus display backend
> 
> ----------------------------------------------------------------
> 
> v2:
>   - fix Cocoa build
>   - fix 6.2->7.0 version annotations
> 
> Marc-André Lureau (36):
>    ui/vdagent: add CHECK_SPICE_PROTOCOL_VERSION
>    ui/vdagent: replace #if 0 with protocol version check
>    ui: generalize clipboard notifier
>    ui/vdagent: add serial capability support
>    ui/clipboard: add qemu_clipboard_check_serial()
>    ui/clipboard: add a clipboard reset serial event
>    hw/display: report an error if virgl initialization failed
>    virtio-gpu: use VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP
>    ui: do not delay further remote resize
>    ui: factor out qemu_console_set_display_gl_ctx()
>    ui: associate GL context outside of display listener registration
>    ui: make gl_block use a counter
>    ui: add a gl-unblock warning timer
>    ui: simplify gl unblock & flush
>    ui: dispatch GL events to all listeners
>    ui: split the GL context in a different object
>    ui: move qemu_spice_fill_device_address to ui/util.c
>    console: save current scanout details
>    scripts: teach modinfo to skip non-C sources
>    docs/sphinx: add sphinx modules to include D-Bus documentation
>    backends: move dbus-vmstate1.xml to backends/
>    docs: move D-Bus VMState documentation to source XML
>    docs: add dbus-display documentation
>    build-sys: set glib dependency version
>    ui: add a D-Bus display backend
>    ui/dbus: add p2p=on/off option
>    tests/qtests: add qtest_qmp_add_client()
>    tests: start dbus-display-test
>    audio: add "dbus" audio backend
>    ui/dbus: add clipboard interface
>    chardev: teach socket to accept no addresses
>    chardev: make socket derivable
>    option: add g_auto for QemuOpts
>    ui/dbus: add chardev backend & interface
>    ui/dbus: register D-Bus VC handler
>    MAINTAINERS: update D-Bus section
> 
>   docs/conf.py                    |   8 +
>   docs/interop/dbus-display.rst   |  31 ++
>   docs/interop/dbus-vmstate.rst   |  52 +--
>   docs/interop/dbus.rst           |   2 +
>   docs/interop/index.rst          |   1 +
>   docs/sphinx/dbusdoc.py          | 166 +++++++
>   docs/sphinx/dbusdomain.py       | 406 +++++++++++++++++
>   docs/sphinx/dbusparser.py       | 373 ++++++++++++++++
>   docs/sphinx/fakedbusdoc.py      |  25 ++
>   configure                       |   1 +
>   meson.build                     |  22 +-
>   qapi/audio.json                 |   3 +-
>   qapi/char.json                  |  27 ++
>   qapi/misc.json                  |   4 +-
>   qapi/ui.json                    |  34 +-
>   audio/audio_int.h               |   7 +
>   audio/audio_template.h          |   2 +
>   include/chardev/char-socket.h   |  86 ++++
>   include/qemu/cutils.h           |   5 +
>   include/qemu/dbus.h             |  24 +
>   include/qemu/option.h           |   2 +
>   include/ui/clipboard.h          |  55 ++-
>   include/ui/console.h            |  70 ++-
>   include/ui/dbus-display.h       |  17 +
>   include/ui/dbus-module.h        |  11 +
>   include/ui/egl-context.h        |   6 +-
>   include/ui/gtk.h                |  11 +-
>   include/ui/sdl2.h               |   7 +-
>   include/ui/spice-display.h      |   5 +-
>   tests/qtest/libqos/libqtest.h   |  10 +
>   ui/dbus.h                       | 144 ++++++
>   audio/audio.c                   |   1 +
>   audio/dbusaudio.c               | 654 +++++++++++++++++++++++++++
>   chardev/char-socket.c           |  72 +--
>   hw/display/qxl.c                |   7 +-
>   hw/display/vhost-user-gpu.c     |   2 +-
>   hw/display/virtio-gpu-base.c    |   5 +-
>   hw/display/virtio-gpu-virgl.c   |   3 +-
>   hw/display/virtio-vga.c         |  11 -
>   monitor/qmp-cmds.c              |  13 +
>   tests/qtest/dbus-display-test.c | 257 +++++++++++
>   tests/qtest/libqtest.c          |  19 +
>   ui/clipboard.c                  |  34 +-
>   ui/console.c                    | 305 +++++++++----
>   ui/dbus-chardev.c               | 296 +++++++++++++
>   ui/dbus-clipboard.c             | 457 +++++++++++++++++++
>   ui/dbus-console.c               | 497 +++++++++++++++++++++
>   ui/dbus-error.c                 |  48 ++
>   ui/dbus-listener.c              | 486 ++++++++++++++++++++
>   ui/dbus-module.c                |  35 ++
>   ui/dbus.c                       | 482 ++++++++++++++++++++
>   ui/egl-context.c                |   6 +-
>   ui/egl-headless.c               |  20 +-
>   ui/gtk-clipboard.c              |  23 +-
>   ui/gtk-egl.c                    |  12 +-
>   ui/gtk-gl-area.c                |  10 +-
>   ui/gtk.c                        |  28 +-
>   ui/sdl2-gl.c                    |  12 +-
>   ui/sdl2.c                       |  16 +-
>   ui/spice-core.c                 |  50 ---
>   ui/spice-display.c              |  27 +-
>   ui/util.c                       |  75 ++++
>   ui/vdagent.c                    |  94 +++-
>   ui/vnc-clipboard.c              |  23 +-
>   ui/vnc.c                        |   4 +-
>   MAINTAINERS                     |  10 +-
>   audio/meson.build               |   6 +
>   audio/trace-events              |   5 +
>   backends/dbus-vmstate1.xml      |  52 +++
>   meson_options.txt               |   2 +
>   qemu-options.hx                 |  20 +
>   scripts/meson-buildoptions.sh   |   3 +
>   scripts/modinfo-collect.py      |   3 +
>   tests/qtest/dbus-vmstate1.xml   |  12 -
>   tests/qtest/meson.build         |  10 +-
>   ui/cocoa.m                      |  22 +-
>   ui/dbus-display1.xml            | 761 ++++++++++++++++++++++++++++++++
>   ui/meson.build                  |  28 ++
>   ui/trace-events                 |  15 +
>   79 files changed, 6249 insertions(+), 401 deletions(-)
>   create mode 100644 docs/interop/dbus-display.rst
>   create mode 100644 docs/sphinx/dbusdoc.py
>   create mode 100644 docs/sphinx/dbusdomain.py
>   create mode 100644 docs/sphinx/dbusparser.py
>   create mode 100644 docs/sphinx/fakedbusdoc.py
>   create mode 100644 include/chardev/char-socket.h
>   create mode 100644 include/ui/dbus-display.h
>   create mode 100644 include/ui/dbus-module.h
>   create mode 100644 ui/dbus.h
>   create mode 100644 audio/dbusaudio.c
>   create mode 100644 tests/qtest/dbus-display-test.c
>   create mode 100644 ui/dbus-chardev.c
>   create mode 100644 ui/dbus-clipboard.c
>   create mode 100644 ui/dbus-console.c
>   create mode 100644 ui/dbus-error.c
>   create mode 100644 ui/dbus-listener.c
>   create mode 100644 ui/dbus-module.c
>   create mode 100644 ui/dbus.c
>   create mode 100644 ui/util.c
>   create mode 100644 backends/dbus-vmstate1.xml
>   delete mode 100644 tests/qtest/dbus-vmstate1.xml
>   create mode 100644 ui/dbus-display1.xml

Applied, thanks.

r~


