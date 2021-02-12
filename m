Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A831A701
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:41:09 +0100 (CET)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgBY-00007d-Qo
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg9c-0007eW-Jx
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:39:08 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg9a-0005ZH-0Y
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:39:08 -0500
Received: by mail-io1-xd2d.google.com with SMTP id u20so657206iot.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zz+K8ViQbR5P7cwxMLQZ2JvbtEjOgwVqQlaY++GZmjs=;
 b=okcpfQZNHJk1Be7bxSr6RwmHYT2YpvVGqIbIFZN47YBLqAtGs4OUCgdNm5ZgUlAYD/
 Xfg0U9Dz3g6E9jldOIEfMrcPXNunefE72Et8343hW3LE8QThVXKmSpEvMYN7vwZm/t11
 I3G31nJvr6yTumHqu2/ZFMxuG8fL0SKE9qfb4J/zsKD2UpjO5Mwlo3l6lKNGYEEf9DkX
 NLdhR8eMHOJAgN/w5PtiC0B7JUBuYQPug0n4h3Ro79Nd6ujgPi6rGp6VkpnAH7lX98TB
 DUPvdnD0gd2azLgJK/NwjDEmzN6lW8E6B2tT2xowUMRsIw5JQ62gSsd09ESfRRjveW2o
 UfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zz+K8ViQbR5P7cwxMLQZ2JvbtEjOgwVqQlaY++GZmjs=;
 b=Z6N+uxuYEVAvGdCsIgmOg4iBI2wOOXnf8z1PV0yiJV+TI1AcMrt7Wj6JAdn0p/7hDo
 A92Cwr9VajIwE0mk1ZTQ1rphv+mhOtWaJOt5L13N96zJSTN0ooyQzFt7D6fUmDCcwpxA
 Yo0GV66K3SGDnWgAgX995v+iHe6vWQ3sGq2BXUK1b4TN1sCGYmspMSqaklr0aOqyXirt
 D4x0W5KhZY9FutU24jsA6F2aaAdvccdgjJRb9rXaVmTEcRLPdIZ678aHuRZYyF+bPmyW
 /bYQYQTte3OBuCDnE9ypN4/1AE84OOHVohGHCCBOB2wk8JfeYH9UBZhEzw7vyLxOimQO
 gTCw==
X-Gm-Message-State: AOAM530mXrLD3FhDAYj2fO1SM8oYM7Wq+E0NLiS1JCLfEwDfJNGdjt2m
 JVWvSIzx3rJ+SEWQjztQmaZOOuQ/Es42RVYn1GyPj+pAqes=
X-Google-Smtp-Source: ABdhPJzIPFQ4dxwLawQzAV54jJd8sPnN9VkMaBieOJymlzBGoY/jAcE1kFV1Jl1mpR+5pYPl3zFEZYfopONhXgLuKsA=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr3739673ioq.176.1613165944675; 
 Fri, 12 Feb 2021 13:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-6-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-6-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:38:24 -0800
Message-ID: <CAKmqyKNQHhwZfTvqEU8EzQQs2tXN5gbrWC6ooc6ERpYjS1gNhw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] docs: move generic-loader documentation into the
 main manual
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>, julien@xen.org,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 9:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> We might as well surface this useful information in the manual so
> users can find it easily. It is a fairly simple conversion to rst with
> the only textual fixes being QemuOps to QemuOpts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-6-alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
> v2
>   - fix whitespace
>   - update MAINTAINERS
> ---
>  docs/generic-loader.txt        |  92 --------------------------
>  docs/system/generic-loader.rst | 117 +++++++++++++++++++++++++++++++++
>  docs/system/index.rst          |   1 +
>  MAINTAINERS                    |   2 +-
>  4 files changed, 119 insertions(+), 93 deletions(-)
>  delete mode 100644 docs/generic-loader.txt
>  create mode 100644 docs/system/generic-loader.rst
>
> diff --git a/docs/generic-loader.txt b/docs/generic-loader.txt
> deleted file mode 100644
> index a9603a2af7..0000000000
> --- a/docs/generic-loader.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -Copyright (c) 2016 Xilinx Inc.
> -
> -This work is licensed under the terms of the GNU GPL, version 2 or later=
.  See
> -the COPYING file in the top-level directory.
> -
> -
> -The 'loader' device allows the user to load multiple images or values in=
to
> -QEMU at startup.
> -
> -Loading Data into Memory Values
> --------------------------------
> -The loader device allows memory values to be set from the command line. =
This
> -can be done by following the syntax below:
> -
> -     -device loader,addr=3D<addr>,data=3D<data>,data-len=3D<data-len>
> -                   [,data-be=3D<data-be>][,cpu-num=3D<cpu-num>]
> -
> -    <addr>      - The address to store the data in.
> -    <data>      - The value to be written to the address. The maximum si=
ze of
> -                  the data is 8 bytes.
> -    <data-len>  - The length of the data in bytes. This argument must be
> -                  included if the data argument is.
> -    <data-be>   - Set to true if the data to be stored on the guest shou=
ld be
> -                  written as big endian data. The default is to write li=
ttle
> -                  endian data.
> -    <cpu-num>   - The number of the CPU's address space where the data s=
hould
> -                  be loaded. If not specified the address space of the f=
irst
> -                  CPU is used.
> -
> -All values are parsed using the standard QemuOps parsing. This allows th=
e user
> -to specify any values in any format supported. By default the values
> -will be parsed as decimal. To use hex values the user should prefix the =
number
> -with a '0x'.
> -
> -An example of loading value 0x8000000e to address 0xfd1a0104 is:
> -    -device loader,addr=3D0xfd1a0104,data=3D0x8000000e,data-len=3D4
> -
> -Setting a CPU's Program Counter
> --------------------------------
> -The loader device allows the CPU's PC to be set from the command line. T=
his
> -can be done by following the syntax below:
> -
> -     -device loader,addr=3D<addr>,cpu-num=3D<cpu-num>
> -
> -    <addr>      - The value to use as the CPU's PC.
> -    <cpu-num>   - The number of the CPU whose PC should be set to the
> -                  specified value.
> -
> -All values are parsed using the standard QemuOps parsing. This allows th=
e user
> -to specify any values in any format supported. By default the values
> -will be parsed as decimal. To use hex values the user should prefix the =
number
> -with a '0x'.
> -
> -An example of setting CPU 0's PC to 0x8000 is:
> -    -device loader,addr=3D0x8000,cpu-num=3D0
> -
> -Loading Files
> --------------
> -The loader device also allows files to be loaded into memory. It can loa=
d ELF,
> -U-Boot, and Intel HEX executable formats as well as raw images.  The syn=
tax is
> -shown below:
> -
> -    -device loader,file=3D<file>[,addr=3D<addr>][,cpu-num=3D<cpu-num>][,=
force-raw=3D<raw>]
> -
> -    <file>      - A file to be loaded into memory
> -    <addr>      - The memory address where the file should be loaded. Th=
is is
> -                  required for raw images and ignored for non-raw files.
> -    <cpu-num>   - This specifies the CPU that should be used. This is an
> -                  optional argument and will cause the CPU's PC to be se=
t to
> -                  the memory address where the raw file is loaded or the=
 entry
> -                  point specified in the executable format header. This =
option
> -                  should only be used for the boot image.
> -                  This will also cause the image to be written to the sp=
ecified
> -                  CPU's address space. If not specified, the default is =
CPU 0.
> -    <force-raw> - Setting force-raw=3Don forces the file to be treated a=
s a raw
> -                  image.  This can be used to load supported executable =
formats
> -                  as if they were raw.
> -
> -All values are parsed using the standard QemuOps parsing. This allows th=
e user
> -to specify any values in any format supported. By default the values
> -will be parsed as decimal. To use hex values the user should prefix the =
number
> -with a '0x'.
> -
> -An example of loading an ELF file which CPU0 will boot is shown below:
> -    -device loader,file=3D./images/boot.elf,cpu-num=3D0
> -
> -Restrictions and ToDos
> -----------------------
> - - At the moment it is just assumed that if you specify a cpu-num then y=
ou
> -   want to set the PC as well. This might not always be the case. In fut=
ure
> -   the internal state 'set_pc' (which exists in the generic loader now) =
should
> -   be exposed to the user so that they can choose if the PC is set or no=
t.
> diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.=
rst
> new file mode 100644
> index 0000000000..6bf8a4eb48
> --- /dev/null
> +++ b/docs/system/generic-loader.rst
> @@ -0,0 +1,117 @@
> +..
> +   Copyright (c) 2016, Xilinx Inc.
> +
> +This work is licensed under the terms of the GNU GPL, version 2 or later=
.  See
> +the COPYING file in the top-level directory.
> +
> +Generic Loader
> +--------------
> +
> +The 'loader' device allows the user to load multiple images or values in=
to
> +QEMU at startup.
> +
> +Loading Data into Memory Values
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +The loader device allows memory values to be set from the command line. =
This
> +can be done by following the syntax below::
> +
> +   -device loader,addr=3D<addr>,data=3D<data>,data-len=3D<data-len> \
> +                   [,data-be=3D<data-be>][,cpu-num=3D<cpu-num>]
> +
> +``<addr>``
> +  The address to store the data in.
> +
> +``<data>``
> +  The value to be written to the address. The maximum size of the data
> +  is 8 bytes.
> +
> +``<data-len>``
> +  The length of the data in bytes. This argument must be included if
> +  the data argument is.
> +
> +``<data-be>``
> +  Set to true if the data to be stored on the guest should be written
> +  as big endian data. The default is to write little endian data.
> +
> +``<cpu-num>``
> +  The number of the CPU's address space where the data should be
> +  loaded. If not specified the address space of the first CPU is used.
> +
> +All values are parsed using the standard QemuOps parsing. This allows th=
e user
> +to specify any values in any format supported. By default the values
> +will be parsed as decimal. To use hex values the user should prefix the =
number
> +with a '0x'.
> +
> +An example of loading value 0x8000000e to address 0xfd1a0104 is::
> +
> +    -device loader,addr=3D0xfd1a0104,data=3D0x8000000e,data-len=3D4
> +
> +Setting a CPU's Program Counter
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The loader device allows the CPU's PC to be set from the command line. T=
his
> +can be done by following the syntax below::
> +
> +     -device loader,addr=3D<addr>,cpu-num=3D<cpu-num>
> +
> +``<addr>``
> +  The value to use as the CPU's PC.
> +
> +``<cpu-num>``
> +  The number of the CPU whose PC should be set to the specified value.
> +
> +All values are parsed using the standard QemuOpts parsing. This allows t=
he user
> +to specify any values in any format supported. By default the values
> +will be parsed as decimal. To use hex values the user should prefix the =
number
> +with a '0x'.
> +
> +An example of setting CPU 0's PC to 0x8000 is::
> +
> +    -device loader,addr=3D0x8000,cpu-num=3D0
> +
> +Loading Files
> +^^^^^^^^^^^^^
> +
> +The loader device also allows files to be loaded into memory. It can loa=
d ELF,
> +U-Boot, and Intel HEX executable formats as well as raw images.  The syn=
tax is
> +shown below:
> +
> +    -device loader,file=3D<file>[,addr=3D<addr>][,cpu-num=3D<cpu-num>][,=
force-raw=3D<raw>]
> +
> +``<file>``
> +  A file to be loaded into memory
> +
> +``<addr>``
> +  The memory address where the file should be loaded. This is required
> +  for raw images and ignored for non-raw files.
> +
> +``<cpu-num>``
> +  This specifies the CPU that should be used. This is an
> +  optional argument and will cause the CPU's PC to be set to the
> +  memory address where the raw file is loaded or the entry point
> +  specified in the executable format header. This option should only
> +  be used for the boot image. This will also cause the image to be
> +  written to the specified CPU's address space. If not specified, the
> +  default is CPU 0. <force-raw> - Setting force-raw=3Don forces the file
> +  to be treated as a raw image. This can be used to load supported
> +  executable formats as if they were raw.
> +
> +All values are parsed using the standard QemuOpts parsing. This allows t=
he user
> +to specify any values in any format supported. By default the values
> +will be parsed as decimal. To use hex values the user should prefix the =
number
> +with a '0x'.
> +
> +An example of loading an ELF file which CPU0 will boot is shown below::
> +
> +    -device loader,file=3D./images/boot.elf,cpu-num=3D0
> +
> +Restrictions and ToDos
> +^^^^^^^^^^^^^^^^^^^^^^
> +
> +At the moment it is just assumed that if you specify a cpu-num then
> +you want to set the PC as well. This might not always be the case. In
> +future the internal state 'set_pc' (which exists in the generic loader
> +now) should be exposed to the user so that they can choose if the PC
> +is set or not.
> +
> +
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 625b494372..cee1c83540 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -25,6 +25,7 @@ Contents:
>     usb
>     ivshmem
>     linuxboot
> +   generic-loader
>     vnc-security
>     tls
>     gdb
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ab6877dae6..774b3ca7a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1991,7 +1991,7 @@ M: Alistair Francis <alistair@alistair23.me>
>  S: Maintained
>  F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
> -F: docs/generic-loader.txt
> +F: docs/system/generic-loader.rst
>
>  Guest Loader
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> --
> 2.20.1
>
>

