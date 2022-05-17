Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2E529734
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 04:15:36 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqmkI-0004TT-LZ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 22:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqmiF-0002lf-7G
 for qemu-devel@nongnu.org; Mon, 16 May 2022 22:13:27 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqmiB-00089W-M8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 22:13:26 -0400
Received: by mail-lf1-x134.google.com with SMTP id y32so28865690lfa.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 19:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=LOcp5dji3cOqNPDHtrWwGqJRd0thWWJJ2dDOWhAOaVM=;
 b=p9WBjNxfkc8hM5HdMsFLVuyy8Ml9UYMbLNBEf1HHbfFw444au7huF4In9FX5pVXgU0
 6i1nPZeOUsEw6YP2+zK2mfOg/nczPcYYLB8BDfhPQxiAplDP7y6lHPq5dX2M4yVSkGRx
 gn8dLnJ5zbN5DUvbtXkG5U98Ct/kogtUWg63suUtAyQ2r9101T69kJY7XE6ZaCYKtZo0
 ESXiHFY0DaQ59grTcyz3UejFTb+2DZLsQyaK7o7Fd3EsFLXeraiT2uMk3e1Mae57zMdp
 dRE0JeSOXMFUuYm3hH6Plm8hLzfICT92JdY4Lv/aLzl3gi+AeCzPS1tgOPqHyE37yKyo
 rGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=LOcp5dji3cOqNPDHtrWwGqJRd0thWWJJ2dDOWhAOaVM=;
 b=4qlFJkN772dWPhmRSVtVPFGbw1PwaOlQxBIJIhfng30XM1oAEUt0tOLCQhwoGRxG93
 hTBR0IZB7ZWKaIh26fjhCSHLfiEwZ4ix/nGuQOHGigNJ89zzb7IAWLDGPA9SvS2x0W5X
 oY/TSpvR8fhN/ajPp9XZy0eICRSsy5ox8Y3OgaOmYL0JSAjtP8r1V/qphkzvvo5gx+YJ
 bArZOMpU16UbrR0ZLnNJrvADNE8NrrKNgCmucFBCz7L4se9IKCvTC+Ceqjf/6s+77jpD
 h8NMDsA6OqX2XQJuDvA9hcQoc1lOdXLwBoHxmN3FhkFKucg3ux73r6GxvEkFEFTHooLe
 roJw==
X-Gm-Message-State: AOAM532Y3r3htkQ6ZpOxz4cCxTHfFl7mLTsYWwr9DMwwaW/7tLqL9th2
 yDbOuQ7NbYFiOYY6fjiGxPioL7o0QuwcmeP17IqUHgIQt8Y=
X-Google-Smtp-Source: ABdhPJyGO8opF6D9In+ia9HAdtC1vK8KcK6DpPaCdA4ywoo/jX2vv20rRaMZyVE7ExTiThvOF7+fyrSN2TJbfLr4nlw=
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id
 bq22-20020a056512151600b0044839b8d603mr15020329lfb.599.1652753593622; Mon, 16
 May 2022 19:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
In-Reply-To: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
From: Karthik Poduval <karthik.poduval@gmail.com>
Date: Mon, 16 May 2022 19:13:02 -0700
Message-ID: <CAFP0Ok9vNmWLG+2Oxwk8PQ2pjEdL0RVd4mpVKcf2e9xm10gWKQ@mail.gmail.com>
Subject: Re: QEMU 6.2.0: Segfault while calling address_space_init from
 emulated device
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=karthik.poduval@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi All,

I still need help, any help would be greatly appreciated. Turned on
address sanitizers (config option --enable-sanitizers).
It pointed to a heap overflow in xilinx code.
SUMMARY: AddressSanitizer: heap-buffer-overflow
../git/hw/dma/xlnx_csu_dma.c:722 in xlnx_csu_dma_class_init

So disabled xilinx from the config.
diff --git a/configs/devices/aarch64-softmmu/default.mak
b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da1..cf8b98070e 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -3,6 +3,6 @@
 # We support all the 32 bit boards so need all their config
 include ../arm-softmmu/default.mak

-CONFIG_XLNX_ZYNQMP_ARM=3Dy
-CONFIG_XLNX_VERSAL=3Dy
+CONFIG_XLNX_ZYNQMP_ARM=3Dn
+CONFIG_XLNX_VERSAL=3Dn
 CONFIG_SBSA_REF=3Dy

Even after doing that the code still crashes at the same point. It
seems to be a memory curruption issue or else how can
get_system_address() function provide an incorrect pointer.
build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/image/home/kpoduval=
/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linux/qemu-system-nati=
ve/6.2.0-r0/recipe-sysroot-native/usr/bin/qemu-system-aarch64
-device virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::2323-:23,tftp=3D/home=
/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm64
-object rng-random,filename=3D/dev/urandom,id=3Drng0 -device
virtio-rng-pci,rng=3Drng0 -drive
id=3Ddisk0,file=3D/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/de=
ploy/images/qemuarm64/yoe-simple-image-qemuarm64-20220515002944.rootfs.ext4=
,if=3Dnone,format=3Draw
-device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
usb-tablet -device usb-kbd  -machine virt -cpu cortex-a57 -smp 4 -m
1024 -serial mon:stdio -serial null -nographic -device virtio-gpu-pci
-kernel /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/image=
s/qemuarm64/Image--5.15.22+git0+2d38a472b2_7f685244af-r0.0-qemuarm64-202203=
06152158.bin
-append 'root=3D/dev/vda rw  mem=3D1024M ip=3Ddhcp console=3DttyAMA0
console=3Dhvc0  '
=3D=3D2004211=3D=3DWARNING: ASan doesn't fully support makecontext/swapcont=
ext
functions and may produce false positives in some cases!
AddressSanitizer:DEADLYSIGNAL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D2004211=3D=3DERROR: AddressSanitizer: SEGV on unknown address
0x000000005300 (pc 0x55dfdc2b47fc bp 0x61a0000028e8 sp 0x7ffcf813edc0
T0)
=3D=3D2004211=3D=3DThe signal is caused by a READ memory access.
    #0 0x55dfdc2b47fb in memory_region_ref ../git/softmmu/memory.c:1790
    #1 0x55dfdc2b47fb in address_space_init ../git/softmmu/memory.c:3005
    #2 0x55dfdacba208 in m2m_scaler_realize ../git/hw/misc/m2m_scaler.c:288
    #3 0x55dfdc7fb1eb in device_set_realized ../git/hw/core/qdev.c:531
    #4 0x55dfdc807c50 in property_set_bool ../git/qom/object.c:2268
    #5 0x55dfdc80f5ff in object_property_set ../git/qom/object.c:1403
    #6 0x55dfdc819253 in object_property_set_qobject ../git/qom/qom-qobject=
.c:28
    #7 0x55dfdc80feb5 in object_property_set_bool ../git/qom/object.c:1472
    #8 0x55dfdc7f9452 in qdev_realize_and_unref ../git/hw/core/qdev.c:340
    #9 0x55dfda8c9adc in sysbus_create_varargs ../git/hw/core/sysbus.c:236
    #10 0x55dfdb24d87e in sysbus_create_simple
/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linux/qe=
mu-system-native/6.2.0-r0/git/include/hw/sysbus.h:104
    #11 0x55dfdb24d87e in create_m2m_scaler ../git/hw/arm/virt.c:1316
    #12 0x55dfdb24d87e in machvirt_init ../git/hw/arm/virt.c:2223
    #13 0x55dfda8bd006 in machine_run_board_init ../git/hw/core/machine.c:1=
187
    #14 0x55dfdc2c9f51 in qemu_init_board ../git/softmmu/vl.c:2656
    #15 0x55dfdc2c9f51 in qmp_x_exit_preconfig ../git/softmmu/vl.c:2746
    #16 0x55dfdc2d1425 in qemu_init ../git/softmmu/vl.c:3777
    #17 0x55dfda49c1fc in main ../git/softmmu/main.c:49
    #18 0x7f53e39ce57a
(/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/sysroots-uninative/=
x86_64-linux/lib/libc.so.6+0x2d57a)
    #19 0x7f53e39ce62f in __libc_start_main
(/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/sysroots-uninative/=
x86_64-linux/lib/libc.so.6+0x2d62f)
    #20 0x55dfda4d6f5d in _start
(/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linux/q=
emu-system-native/6.2.0-r0/image/home/kpoduval/workspace/yoe-master-kpoduva=
l/build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroot-na=
tive/usr/bin/qemu-system-aarch64+0x3b58f5d)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: SEGV ../git/softmmu/memory.c:1790 in
memory_region_ref
=3D=3D2004211=3D=3DABORTING

Any help would be greatly appreciated. Here is the link to the latest code.
https://github.com/karthikpoduval/qemu/tree/scaler-bringup

On Sun, May 15, 2022 at 12:26 AM Karthik Poduval
<karthik.poduval@gmail.com> wrote:
>
> Hi All,
>
> I am trying to create a virtual mem2mem scaler device in QEMU (for the
> purposes of writing a mem2mem driver tutorial). I created the mem2mem
> device as shown here.
> https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/misc/m2m_sc=
aler.c
>
> I added this MMIO device to the arm virt.c (as shown here).
> https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/arm/virt.c#=
L1306
>
> However while the device is getting created, there is a crash while
> launching QEMU.
> qemu-system-aarch64 -device
> virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
> user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::2323-:23,tftp=3D/ho=
me/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm64
> -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device
> virtio-rng-pci,rng=3Drng0 -drive
> id=3Ddisk0,file=3D/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/=
deploy/images/qemuarm64/yoe-simple-image-qemuarm64-20220515002944.rootfs.ex=
t4,if=3Dnone,format=3Draw
> -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
> usb-tablet -device usb-kbd  -machine virt -cpu cortex-a57 -smp 4 -m
> 1024 -serial mon:stdio -serial null -nographic -device virtio-gpu-pci
> -kernel /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/ima=
ges/qemuarm64/Image--5.15.22+git0+2d38a472b2_7f685244af-r0.0-qemua
> rm64-20220306152158.bin -append 'root=3D/dev/vda rw  mem=3D256M ip=3Ddhcp
> console=3DttyAMA0 console=3Dhvc0  '
>
> Upon running gdb, the stack trace looks like.
> Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
> 0x0000555555d2f6d6 in memory_region_ref (mr=3D0x56becae0) at
> ../git/softmmu/memory.c:3005
> 3005        memory_region_ref(root);
> (gdb) bt
> #0  0x0000555555d2f6d6 in memory_region_ref (mr=3D0x56becae0) at
> ../git/softmmu/memory.c:3005
> #1  address_space_init (as=3D0x5555570f8bb8, root=3D0x56becae0,
> name=3D0x5555560a9620 "m2m-scaler-dma") at ../git/softmmu/memory.c:3005
> #2  0x0000555555e0d5c8 in object_initialize_with_type
> (obj=3Dobj@entry=3D0x5555570f8750, size=3Dsize@entry=3D1360,
> type=3Dtype@entry=3D0x555556a117d0) at ../git/qom/object.c:518
> #3  0x0000555555e0d719 in object_new_with_type (type=3D0x555556a117d0)
> at ../git/qom/object.c:733
> #4  0x0000555555e08e3a in qdev_new (name=3Dname@entry=3D0x5555560a95eb
> "m2m_scaler") at ../git/hw/core/qdev.c:153
> #5  0x000055555595cafa in sysbus_create_varargs
> (name=3Dname@entry=3D0x5555560a95eb "m2m_scaler", addr=3Daddr@entry=3D0) =
at
> ../git/hw/core/sysbus.c:234
> #6  0x0000555555adf1a1 in sysbus_create_simple (irq=3D<optimized out>,
> addr=3D0, name=3D0x5555560a95eb "m2m_scaler")
>     at /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64=
-linux/qemu-system-native/6.2.0-r0/git/include/hw/sysbus.h:104
> #7  create_m2m_scaler (vms=3D0x555556c31400) at ../git/hw/arm/virt.c:1317
> #8  machvirt_init (machine=3D0x555556c31400) at ../git/hw/arm/virt.c:2239
> #9  0x0000555555959929 in machine_run_board_init
> (machine=3D0x555556c31400) at ../git/hw/core/machine.c:1187
> #10 0x0000555555d3576f in qemu_init_board () at ../git/softmmu/vl.c:2656
> #11 qmp_x_exit_preconfig (errp=3D<optimized out>) at ../git/softmmu/vl.c:=
2746
> #12 qmp_x_exit_preconfig (errp=3D<optimized out>) at ../git/softmmu/vl.c:=
2739
> #13 0x0000555555d38f3b in qemu_init (argc=3D<optimized out>,
> argv=3D<optimized out>, envp=3D<optimized out>) at
> ../git/softmmu/vl.c:3777
> #14 0x000055555588e1bd in main (argc=3D<optimized out>, argv=3D<optimized
> out>, envp=3D<optimized out>) at ../git/softmmu/main.c:49
>
> I was able to do the same thing in QEMU 5.1.0 do not know why this
> does not work in QEMU 6.2.0. Kindly help me resolve this issue. I want
> my device to have access to the entire system RAM (as thi emulated
> device can read input image from DDR scale it and write back the input
> image to DDR so it needs to have access to the entire DDR memory).
>
> --
> Regards,
> Karthik Poduval



--=20
Regards,
Karthik Poduval

