Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C80681739
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:06:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXay-0007Z6-UD; Mon, 30 Jan 2023 12:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMXar-0007KH-Hu; Mon, 30 Jan 2023 12:05:23 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMXal-0001Hg-4c; Mon, 30 Jan 2023 12:05:18 -0500
Received: by mail-ej1-x632.google.com with SMTP id gr7so9105253ejb.5;
 Mon, 30 Jan 2023 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FxZmleG6adEil678uNZDK6EuOvg1oN2fSAmw+ZGz5I=;
 b=EnlUIHDglNyXA18Ingz5JSlPdWbqt0urwLpuyEBSOjEDhoDVElrKSTr6gBg7iRJIPX
 o0vLBo7PwndQtf+ExVM69Qny5MHtnkAtXGuww6vcTSDiX+ZoEXk5xmedWIzULYPOR7iw
 tRzQfxuMliOubfDqxbf+PGhCqj4Eckuwyxa9SoVxHVfKPefFIxvTtjF64HAiRPnQpgkg
 jPzunjUMRmjLIs9p4BKw/Eb6fsuc1+Vs6uK1cKMH9tFvH2rz7VYSQC3LNILugwdO8J1D
 1o2HjeqouLKq4RlFlSQ355Qcz/vWfK5nxGmzpqmVHv4UmmWXqitkX0CwLarFcJEO09Ar
 B9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FxZmleG6adEil678uNZDK6EuOvg1oN2fSAmw+ZGz5I=;
 b=QOvf8o8IMWVMwpfngJfpKSQ6tMXW+R08uo8WNvnBfS4gReVaAb9GR1du4ZLo4El9WD
 jBnlLYIWXUy3u/uz7SY/0DvCtQxx/Xu7lIH0AJnkqmOru74vXbvz2VN9XTgGHA/s6C2p
 dgoUeBTVINXW9x/Ll8QqENAGr7noopmTz7/rITOIQZb747FHSL2EESw2oXucvjb47Yzy
 bE164NFJDfPhkjASJAQCTnjmSEUXGk9pis7UvkpJGWISA6pYUQr0xikhtt+HnlFLYefZ
 gqSzSVm31EKWK0HGt8IuaFaPV1/ZRNTxWNtiNj8USxr82DDGDt7lnz6oxGbgTKHYJSiU
 HBYQ==
X-Gm-Message-State: AO0yUKUNtLXgEyOrKU/LhNH7cQoLa6laE+MaH4SNf43l3eqGSiqk3oEy
 UjJCee00ZVZdLuiosHlDLH6NZJdkzRw=
X-Google-Smtp-Source: AK7set/TpediPWYKApGl+NZStKntYS1TUM4UlTWQ+fM4HxHZbsk3/WfPo5UXKbMb1H0kXryp94xc/g==
X-Received: by 2002:a17:907:785:b0:88a:bb13:7329 with SMTP id
 xd5-20020a170907078500b0088abb137329mr2642953ejb.53.1675098307192; 
 Mon, 30 Jan 2023 09:05:07 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-240-001.89.12.pool.telefonica.de.
 [89.12.240.1]) by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b00877ec3b9b8bsm7181490ejc.153.2023.01.30.09.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 09:05:06 -0800 (PST)
Date: Mon, 30 Jan 2023 17:05:01 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 00/10] Resolve isabus global
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
Message-ID: <9DA3377E-DDF3-4529-BEF7-BB09E2457306@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

+ Mark whom I've discussed "multiple ISA buses" before

Am 26=2E Januar 2023 21:17:30 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series resolves the global "isabus" variable and is basically a v2 o=
f [1]=2E
>
>Note that the majority of the work consists of fixing ISA API calls in PI=
IX IDE
>
>which implicitly rely on the usage of the isabus global=2E
>
>
>
>Rather than adding an ISABus pointer in PCIIDEState as in [1] this series=
 uses
>
>a qemu_irq array which is roughly the approach outlined in [2]=2E Moreove=
r, this
>
>series considers backwards compatibility for user-created PIIX IDE
>
>"Frankensten" devices by fishing out TYPE_ISA_BUS from the QOM tree insid=
e
>
>the PIIX IDE device model=2E This hack can be removed again once a deprec=
ation
>
>period of user-createable PIIX IDE devices is over=2E This deprecation wa=
sn't
>
>announced yet but now might be a good time=2E
>
>
>
>This series is structured as follows: The first three patches massage the=
 ISA
>
>code for patch 8=2E Patches 4-8 change the PIIX IDE device models to not =
use the
>
>isabus global implicitly=2E Finally, the last two patches clan up and rem=
ove the
>
>isabus singleton=2E
>
>
>
>Based-on: <20230109172347=2E1830-1-shentey@gmail=2Ecom>
>
>          'Consolidate PIIX south bridges'
>
>
>
>v2:
>
>- Big rework sticking closer to [1], giving it more credit and reusing on=
e patch
>
>- Add io port cleanup
>
>- Rebase onto [4] so changes to PIIX could be done once and centrally
>
>
>
>Testing done:
>
>* `make check`
>
>* `=2E/qemu-system-x86_64 -M x-remote -device piix3-ide` still fails grac=
efully with
>
>  `qemu-system-x86_64: -device piix3-ide: No ISA bus found while piix3-id=
e requires one`
>
>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-220704-li=
nux515=2Eiso`
>
>* `qemu-system-x86_64 -M q35 -m 2G -device piix4-ide -cdrom \
>
>   manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>* `qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta -h=
da \
>
>  debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 console=
=3DttyS0"`
>
>
>
>[1] https://patchew=2Eorg/QEMU/20210518215545=2E1793947-1-philmd@redhat=
=2Ecom/
>
>[2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2020-03/msg01707=
=2Ehtml
>
>[3] https://people=2Edebian=2Eorg/~aurel32/qemu/mips/
>
>[4] https://patchew=2Eorg/QEMU/20230109172347=2E1830-1-shentey@gmail=2Eco=
m/
>
>
>
>Bernhard Beschow (9):
>
>  softmmu/ioport: Move portio_list_init() in front of portio_list_add()
>
>  softmmu/ioport: Merge portio_list_add() into portio_list_init()
>
>  softmmu/ioport: Remove unused functions
>
>  hw/ide/piix: Disuse isa_get_irq()
>
>  Revert "hw/ide: Fix crash when plugging a piix3-ide device into the
>
>    x-remote machine"
>
>  hw/ide/pci: Add PCIIDEState::isa_irqs[]
>
>  hw/ide/piix: Require an ISABus only for user-created instances
>
>  hw/ide: Let ide_init_ioport() take a MemoryRegion argument instead of
>
>    ISADevice
>
>  hw/isa/isa-bus: Resolve isabus global
>
>
>
>Philippe Mathieu-Daud=C3=A9 (1):
>
>  hw/isa: Remove use of global isa bus
>
>
>
> include/exec/ioport=2Eh     |  8 ++---
>
> include/hw/ide/internal=2Eh |  3 +-
>
> include/hw/ide/pci=2Eh      |  2 ++
>
> include/hw/isa/isa=2Eh      | 15 ++++----
>
> hw/audio/adlib=2Ec          |  4 +--
>
> hw/display/qxl=2Ec          |  5 ++-
>
> hw/display/vga=2Ec          |  8 ++---
>
> hw/dma/i82374=2Ec           |  6 ++--
>
> hw/ide/ioport=2Ec           | 19 +++++-----
>
> hw/ide/isa=2Ec              |  4 ++-
>
> hw/ide/piix=2Ec             | 75 +++++++++++++++++++++++++++++++--------=

>
> hw/isa/isa-bus=2Ec          | 54 +++++++++++++++-------------
>
> hw/isa/piix=2Ec             |  5 +++
>
> hw/watchdog/wdt_ib700=2Ec   |  4 +--
>
> softmmu/ioport=2Ec          | 70 +++++++++++-------------------------
>
> 15 files changed, 149 insertions(+), 133 deletions(-)
>
>
>
>-- >
>2=2E39=2E1
>
>
>

