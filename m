Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE936331A70
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:53:08 +0100 (CET)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOkN-0002a7-QC
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJOer-00077S-VA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:47:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJOeq-0003Ty-9i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:47:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id a18so13115188wrc.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 14:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x4v3jbnlupJOQXfZm9pZekuZRHU1NrM2RhPEMNXr4Wc=;
 b=uNGPTHIGX32tn4dvYq/+dyINtQCo+s0zs6ojG/7vipzqNdB7ez9fntP5pPClHI6b0w
 ugUCshagYYcWP9ujCgDLPOYa1oOcsehDLMGBre0wLr4dIgdcl/3j0zYyXGHD0MCKY3/+
 DxEWw9QdzAO1JSJryF0sq1ny3SXj+pN9d+xVhtoBoFpGbIg/vAAH6dD4XrGX18eJZd1W
 uIwE6uXkzeILYwKp8F32plJLoswar7tnAuUCk58kmVj3rqnpkGQMg4SbnTvfnrf8sMY8
 sXg5DsoGtm2wJIjq8e6WhiOFIZqDJ7CCG6Uxq7oHxLcqHUwgucD96vH2hoxzCd+DLD61
 Es1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x4v3jbnlupJOQXfZm9pZekuZRHU1NrM2RhPEMNXr4Wc=;
 b=oErqRp1+/XXV4c579hvNlC7C0BOZfEX0Tl6dMruFQKoymKs2cfploNQdBPxfMNAWgT
 eGncOqALekMuhBzfK9z3Eb3w0MdrXIO0H81mbdfxreDL377d4MSjuJhEVTGTlBgumfqw
 tqHXrLvRqDy+5Z58oIw4OYDACO7UBkqx9gQGK1iQnVHQ+DPAHubcrrRwgLUg300kHkcs
 9fd2XMh+tuWyQEo/j1CTG2bpQ4kJ2GzcRwivR3ITwcKFBIgKVn8tnJXKeNH6d0iZqMHJ
 xh063gZkOmptg4vWqDOCXpXJ0zrPmBbIyg2gA614wozho+S/uwBRLPrPZegz5+dH3N1r
 eWcg==
X-Gm-Message-State: AOAM5331o8fxgJmAjNPh8poGtw/hJQ0sZ9kHAmdMDrIZv0LF72Edxp/M
 MAEQtXdUTITN6pQODp7zOnU=
X-Google-Smtp-Source: ABdhPJxDTO2xRKSDXWXkPUqf5f0gF/0ZYQ2wTn2DsJro5aMoBS28vvaX2ZuKT+fWkhliTRC23HAP5Q==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr25158514wrp.182.1615243642757; 
 Mon, 08 Mar 2021 14:47:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm950865wmh.39.2021.03.08.14.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 14:47:22 -0800 (PST)
Subject: Re: [PATCH v6 0/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210308212501.650740-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7e31656-b6c0-5f5b-27b7-ac047fc28e70@amsat.org>
Date: Mon, 8 Mar 2021 23:47:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308212501.650740-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 3/8/21 10:24 PM, Laurent Vivier wrote:
> The Quadra 800 machine is very limited to run linux, it manages
> only 1 GiB of memory and only some specific interfaces.
> 
> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFIS=
> H-VIRTUAL-HARDWARE.TXT
> 
> The machine is created with 128 virtio-mmio busses, and they can
> be used to add serial console, GPU, disk, NIC, HID, ...
> 
> This series re-use the goldfish-rtc implemented for RISCV, and
> adds the two others based on the goldfish specs, the kernel driver
> and android simulator ones.
> 
> The machine can manage up to 3.2 GiB of memory, not because of an hardware
> limitation but because the kernel crashes after this value.
> 
> Simply configure qemu with:
> 
>     .../configure --target-list=3Dm68k-softmmu
> 
> To run the machine you need a modified kernel you can find here:
> 
>     https://github.com/vivier/linux/tree/m68k-virt
> 
> You need to compile the kernel with:
> 
>     make virt_defconfig
>     make vmlinux
> 
> The disk must be installed using the q800 machine because the debian installer
> doesn't want to be used with a kernel that is not the one on the ISO.
> 
> And then you can run the machine with something like:
> 
> qemu-system-m68k -M virt \
>   -m 3399672K \
>   -chardev stdio,signal=3Doff,mux=3Don,id=3Dchar0 \
>   -mon chardev=3Dchar0,mode=3Dreadline \
>   -kernel vmlinux \
>   -append "console=3Dhvc0 root=3D/dev/vda2" \
>   -blockdev node-name=3Dsystem,driver=3Dfile,filename=3Ddebian-10.0.qcow2 \
>   -blockdev node-name=3Ddrive0,driver=3Dqcow2,file=3Dsystem \
>   -device virtio-blk-device,drive=3Ddrive0 \
>   -serial chardev:char0 \
>   -device virtio-net-device,netdev=3Dhostnet0 \
>   -netdev bridge,id=3Dhostnet0,br=3Dvirbr0 \
>   -device virtio-rng-device \
>   -device virtio-serial-device \
>   -device virtio-gpu-device \
>   -device virtconsole,chardev=3Dchar0 \
>   -device virtio-keyboard-device \
>   -device virtio-mouse-device
> 
> if you want to use Goldfish-tty for the console rather than virtconsole, you
> can add "console=3DttyGF".
> 
> To start the debian-installer, you can try by adding:
> 
>   -device virtio-scsi-device \
>   -blockdev node-name=3Ddebian10,driver=3Dfile,filename=3Ddebian-10.0.0-m68k-=
> NETINST-1.iso \
>   -blockdev node-name=3Dcdrom0,driver=3Draw,file=3Ddebian10 \
>   -device scsi-cd,drive=3Dcdrom0 \
>   -initrd installer-m68k/20200315/images/cdrom/initrd.gz
> 
> ISO:    https://cdimage.debian.org/cdimage/ports/snapshots/2020-10-12/debian-=
> 10.0.0-m68k-NETINST-1.iso
> initrd: https://cdimage.debian.org/cdimage/ports/debian-installer/2020-10-12/=
> m68k/debian-installer-images_20200315_m68k.tar.gz
> 
> v6:
>   m68k-virt-ctrl:
>       Renamed to virt-ctrl to be generic
>       Add a simple specs document

Thanks for this document! Series LGTM.

I tested doing:

qemu$ docker run -it --rm -v $PWD:$PWD -w $PWD -v /tmp:/tmp -u 0
--network host registry.gitlab.com/qemu-project/qemu/qemu/debian-m68k-cross
# apt-get update
# apt-get install flex bison libssl-dev
# git clone https://github.com/vivier/linux.git
# cd linux
# git checkout m68k-virt
# make O=build ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- virt_defconfig
# make O=build ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- vmlinux -j8

[    0.000000] Linux version 5.11.0-rc5-00002-g8a00b8b1edb (root@x1w)
(m68k-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
Debian) 2.31.1) #1 Mon Mar 8 22:27:19 UTC 2021

I also tested the Goldfish-tty:

[    1.390000] printk: console [ttyGF0] enabled
[    1.390000] printk: console [ttyGF0] enabled
[    1.390000] printk: bootconsole [early_gf_tty0] disabled
[    1.390000] printk: bootconsole [early_gf_tty0] disabled

So:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Don't you want to share a preinstalled qcow2 image like Aurelien?

https://people.debian.org/~aurel32/qemu/

Also, do you plan to add functional testing later?

Regards,

Phil.

