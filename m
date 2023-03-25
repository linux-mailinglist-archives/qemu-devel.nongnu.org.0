Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD16C8EDE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 15:38:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg50n-0006x9-Qu; Sat, 25 Mar 2023 10:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pg50l-0006wM-IX; Sat, 25 Mar 2023 10:36:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pg50g-00070r-U1; Sat, 25 Mar 2023 10:36:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn12so18761123edb.4;
 Sat, 25 Mar 2023 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679755003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7Cv4zkNYLwlN2HRN2oc7iJJ5/jpmpDogpwXth5l/Ic=;
 b=DDfcWuHxgoxD0b26c0bt7mjNVJO0n3x6lt6qhbaiaQLId2ja0tDlkvOZWimnrmgdUO
 8tqxk8RJ5aV5TUs45trAck/DAM3vudup5iEUSwAREhVbhOElQevny7NQ7bXD/e6PLJA5
 12Ye7zkK+Sm9i06TQXSP1PKulKNVRaSBoTdX9EQP9gaUKpmwNzXCBX+3bafSe7gE+KnG
 T8+T2PlE6Zky23gH9pLh4x+6pLi99gz1V5Ysg+ZtIKd7dFDRhuWt3lxXO8Zxi08FHIyx
 6dvKKbzHbR88oPDW2JnSykdPhWlSxOjchoSKg4p0ZVRmH/qKmiSYxd5ERSFQb+/+2d6m
 u3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679755003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7Cv4zkNYLwlN2HRN2oc7iJJ5/jpmpDogpwXth5l/Ic=;
 b=Ddiql496xW4GBnhGNOa7VWgpYnqir/oKk6x2Dfe5lBoQzEzQ5dey7qysp1btvixtfW
 Jpmnm0g09PbNBKOFvaMnOPaJ6LqWf5dqbUBeoG73bNaS0bTbyPO5MLnCWqT7bE1YgdPZ
 jnf0N5ofG8tK+TLg1od1/3bXRDbXfRU/ClgD5cOVApwlrIj1G6ZmXI4h6KK2AuaNztIe
 lnj7vAR07S4o7ATt9LFXWfd20uLEOz77Q6DOl3D3JZpb/nYMHk+IwaGEbMWjaUCr8FGh
 1sYwAONOXEKavJqCwsCBXhgsLuhFs5j0uvMwVw+EYnS7dTTzt98ikGmZfMEgH9X5hfVI
 jVuQ==
X-Gm-Message-State: AO0yUKW9aSZJVnoCPLE2yMwzqL+p3s7UMEoexB2tYCQfjkKFTczBoluv
 +gUaxGlu1BwO5J0LzEbv7I50eIZ5GzR/lecXV70=
X-Google-Smtp-Source: AK7set+CUNBKQlqE1bFF25B502XBc4pV5aw/IAj+e39RbYGI/Bz1uyh9QdmVvkhYT/UDfNbP9ToJ1Z4vwH5boIvIZYU=
X-Received: by 2002:a17:906:ca41:b0:939:a51a:dc30 with SMTP id
 jx1-20020a170906ca4100b00939a51adc30mr6932117ejb.2.1679755003259; Sat, 25 Mar
 2023 07:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102510.16754-1-qianfanguijin@163.com>
In-Reply-To: <20230321102510.16754-1-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 25 Mar 2023 15:36:33 +0100
Message-ID: <CABtshVTop2nuF7E0exASFYgV012PC0d31sVMQ-ZehCt4REO7HQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] *** add allwinner-r40 support ***
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52f.google.com
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

Hi,

It's great that you are adding support for a new SoC/Board!

On Tue, Mar 21, 2023 at 11:25=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> *** history ***
>
> # v1: 2023-03-21
>
> The first version which add allwinner-r40 support, supported features:
>
> + ccu
> + dram controller
> + uart
> + i2c and pmic(axp221)
> + sdcard
> + emac/gmac
>
> Also provide a test case under avocado, running quickly test:
>
> $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes tests/venv/bin/avocado \
>     --verbose --show=3Dapp,console run -t machine:bpim2u \
>     ../tests/avocado/boot_linux_console.py

I tried running this on the latest QEMU source and compilation fails with

[1758/2912] Compiling C object libqemu-arm-softmmu.fa.p/hw_arm_bananapi_m2u=
.c.o
FAILED: libqemu-arm-softmmu.fa.p/hw_arm_bananapi_m2u.c.o
cc -m64 -mcx16 -Ilibqemu-arm-softmmu.fa.p -I. -I../.. -Itarget/arm
-I../../target/arm -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-isystem /home/strahinja/work/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /home/strahinja/work/qemu -iquote
/home/strahinja/work/qemu/include -iquote
/home/strahinja/work/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef
-Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes
-Wredundant-decls -Wold-style-declaration -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wimplicit-fallthrough=3D2
-Wmissing-format-attribute -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET=3D"arm-softmmu-config-target.h"'
'-DCONFIG_DEVICES=3D"arm-softmmu-config-devices.h"' -MD -MQ
libqemu-arm-softmmu.fa.p/hw_arm_bananapi_m2u.c.o -MF
libqemu-arm-softmmu.fa.p/hw_arm_bananapi_m2u.c.o.d -o
libqemu-arm-softmmu.fa.p/hw_arm_bananapi_m2u.c.o -c
../../hw/arm/bananapi_m2u.c
../../hw/arm/bananapi_m2u.c: In function =E2=80=98mmc_attach_drive=E2=80=99=
:
../../hw/arm/bananapi_m2u.c:41:9: error: implicit declaration of
function =E2=80=98error_report=E2=80=99; did you mean =E2=80=98error_report=
_err=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
   41 |         error_report("No SD bus found in SOC object");
      |         ^~~~~~~~~~~~
      |         error_report_err
../../hw/arm/bananapi_m2u.c:41:9: error: nested extern declaration of
=E2=80=98error_report=E2=80=99 [-Werror=3Dnested-externs]
cc1: all warnings being treated as errors

After adding

#include "qemu/error-report.h"

to hw/arm/bananapi_m2u.c, it passed and I was able to run avocado
tests for this board, as well as for cubieboard and orangepi-pc.

* Bananapi

 AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado     --verbose
--show=3Dapp,console run -t machine:bpim2u
tests/avocado/boot_linux_console.py
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_initrd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_initrd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_gmac
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_gmac
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_openwr=
t_22_03_3
JOB ID     : ed47ffc59b1f9ceb8b68a87405040d3af2fb9156
JOB LOG    : /home/strahinja/avocado/job-results/job-2023-03-25T15.24-ed47f=
fc/job.log
...
 RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT
0 | CANCEL 0
JOB TIME   : 70.79 s

* Cubieboard

 AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado     --verbose
--show=3Dapp,console run -t machine:cubieboard
tests/avocado/boot_linux_console.py
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_in=
itrd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_in=
itrd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sa=
ta
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sa=
ta
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_op=
enwrt_22_03_2
JOB ID     : 1510a9b5f36b74dc1378d50dbb40553e6fb76316
JOB LOG    : /home/strahinja/avocado/job-results/job-2023-03-25T15.27-1510a=
9b/job.log
...
 RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT
0 | CANCEL 0
JOB TIME   : 42.69 s

* OrangePi PC

AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado     --verbose
--show=3Dapp,console run -t machine:orangepi-pc
tests/avocado/boot_linux_console.py
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_init=
rd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_init=
rd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bion=
ic_20_08
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboo=
t_netbsd9
Fetching asset from
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboo=
t_netbsd9
JOB ID     : 6655d0df3c2eecf2181d7fa2d7cd8aee9e4b504c
JOB LOG    : /home/strahinja/avocado/job-results/job-2023-03-25T15.31-6655d=
0d/job.log
...
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 248.93 s

So I can add

Tested-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

I will go through the individual commits during the weekend.

Best regards,
Strahinja


>
> qianfan Zhao (11):
>   hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
>   hw/arm/allwinner-r40: add Clock Control Unit
>   hw: allwinner-r40: Complete uart devices
>   hw: arm: allwinner-r40: Add 5 TWI controllers
>   hw/misc: AXP221 PMU Emulation
>   hw/arm/allwinner-r40: add SDRAM controller device
>   hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
>   hw: arm: allwinner-r40: Fix the mmc controller's type
>   hw: arm: allwinner-r40: Add emac and gmac support
>   tests: avocado: boot_linux_console: Add test case for bpim2u
>   docs: system: arm: Introduce bananapi_m2u
>
>  configs/devices/arm-softmmu/default.mak |   1 +
>  docs/system/arm/bananapi_m2u.rst        | 138 ++++++
>  hw/arm/Kconfig                          |  10 +
>  hw/arm/allwinner-r40.c                  | 558 ++++++++++++++++++++++++
>  hw/arm/bananapi_m2u.c                   | 131 ++++++
>  hw/arm/meson.build                      |   1 +
>  hw/misc/Kconfig                         |   4 +
>  hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
>  hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
>  hw/misc/axp221.c                        | 196 +++++++++
>  hw/misc/meson.build                     |   3 +
>  hw/misc/trace-events                    |  19 +
>  hw/sd/allwinner-sdhost.c                |  70 ++-
>  include/hw/arm/allwinner-r40.h          | 148 +++++++
>  include/hw/misc/allwinner-r40-ccu.h     |  65 +++
>  include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
>  include/hw/sd/allwinner-sdhost.h        |   9 +
>  tests/avocado/boot_linux_console.py     | 173 ++++++++
>  18 files changed, 2337 insertions(+), 3 deletions(-)
>  create mode 100644 docs/system/arm/bananapi_m2u.rst
>  create mode 100644 hw/arm/allwinner-r40.c
>  create mode 100644 hw/arm/bananapi_m2u.c
>  create mode 100644 hw/misc/allwinner-r40-ccu.c
>  create mode 100644 hw/misc/allwinner-r40-dramc.c
>  create mode 100644 hw/misc/axp221.c
>  create mode 100644 include/hw/arm/allwinner-r40.h
>  create mode 100644 include/hw/misc/allwinner-r40-ccu.h
>  create mode 100644 include/hw/misc/allwinner-r40-dramc.h
>
> --
> 2.25.1
>

