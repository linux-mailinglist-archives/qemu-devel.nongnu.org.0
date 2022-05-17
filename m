Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF10529857
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 05:39:42 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqo3i-0001Ng-0j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 23:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqo2U-0000YC-Vw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:38:27 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nqo2S-0004gq-IT
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:38:26 -0400
Received: by mail-lj1-x229.google.com with SMTP id bx33so20295793ljb.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 20:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tjtSfvqjlQK6tfEdNF4izFvoDoh5J5i0APrR5oEvy7s=;
 b=AnTy6EfTwnMH7Q9dkKaHrIuZglD+pVXAiwHFXHS8Kf3IpOsBj537QdBnAcdhnW1m/A
 qH0BrCXhxf+ylxKI6WE22LQoDfEQt+YbUT0TbD6KF4MM5xJtFwgjNq4tnr1/jGiATb22
 0xl/TZLvnC3gUb29rC/UcxgF4amyFZrcx9ZH+GZr+BkadHyP6atLomMCn6lZB5ncaxUG
 i/yqeOjlyn0fgYy9qOMSObfhDZI5wy3kRMRDb8nrwjHCN4AHNXDNXGdJCeAfs5deI6WR
 G1C6lPbMfr1Ygx9/3dOe632MzCMXaKoxUYtC6TCf+5RXcmYhYAvlSr3aAYdYGpEwMwd6
 qBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=tjtSfvqjlQK6tfEdNF4izFvoDoh5J5i0APrR5oEvy7s=;
 b=gq5fCbo2motahcbWGZoK6LAxAtaUEQA8fstuTGIEyBdR6JqHAXPjt0kvtLLqXl5Ek9
 fUZyMvH+ygDmzfk/91oBqCTP+YHNCLyuqLe5ymoA5mbu7osf/1cLCV2DBkbUFpq/IDB7
 SWQ8aqDvayLOpU3JbJiyfxyZn5/UAng7hKORHp1FNHh+Cr055PRXLS61NhsPI2CX1TaH
 TVykV6Qhqpn+nK3AVo2HT+sjsoGtBtGJqgU2ATRJxNL9xZqsZnPIQWa72TNTL5XLg+ea
 sNibOW06vH4sVBsxcko/kEFDITUPMRcR6T2XVaJoCnlGehtwFh2FBw8/8mqY5T+pvFE6
 1/Cw==
X-Gm-Message-State: AOAM531h0syQw0e/eTi3OYUL02Dwn0++p41dEDLVURURuDFtBClP+vU5
 kCm0J+UFn0zHl4Temo/zi9x2Pmosud5ADja3pEozseUtP/E=
X-Google-Smtp-Source: ABdhPJzDsjO8lH66u+T7FIaAw9n1PeaBCE+38xyucKmzP1ON7OyevMlZ6dzhXXV0ctwL9uPDs4h9/zh3JEurrfRPXIM=
X-Received: by 2002:a05:651c:1791:b0:24b:1797:53b1 with SMTP id
 bn17-20020a05651c179100b0024b179753b1mr13637676ljb.269.1652758701767; Mon, 16
 May 2022 20:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
 <CAFP0Ok9vNmWLG+2Oxwk8PQ2pjEdL0RVd4mpVKcf2e9xm10gWKQ@mail.gmail.com>
 <CAFP0Ok-8zv1FFcwmP5pc6boWQB513bsTPX7B-VG5m6D48m2WYA@mail.gmail.com>
In-Reply-To: <CAFP0Ok-8zv1FFcwmP5pc6boWQB513bsTPX7B-VG5m6D48m2WYA@mail.gmail.com>
From: Karthik Poduval <karthik.poduval@gmail.com>
Date: Mon, 16 May 2022 20:38:10 -0700
Message-ID: <CAFP0Ok_w_gKWze_K0v6M+YCLAdjJKCRj=WEPLbHHXrPZtPbqfg@mail.gmail.com>
Subject: Re: QEMU 6.2.0: Segfault while calling address_space_init from
 emulated device
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=karthik.poduval@gmail.com; helo=mail-lj1-x229.google.com
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

Ok digging deeper, there was a compiler warning about a missing
prototype of get_system_memory but I never thought it would lead to
this sort of an issue. The fix now is pretty simple to include the
header where get_system_memory is defined.
https://github.com/qemu/qemu/commit/620dba22bf389c6f9b9f039ad01fc5e1365d821=
6

I always thought that compilers figured things out about function
prototypes but in this case it caused a very serious issue that almost
seemed like memory corruption. Lesson learned, never miss function
prototypes.

On Mon, May 16, 2022 at 8:31 PM Karthik Poduval
<karthik.poduval@gmail.com> wrote:
>
> I was able to get it to work with a workaround. After doing some gdb
> debugging it shows that the system_memory global was being populated
> before the m2m_scaler device was being initialized. Printing
> system_meory vs mr (argumet) to the crashing function shows the
> pointer value to be truncated.
>
> (gdb) p system_memory
>
> $1 =3D (MemoryRegion *) 0x555556ae16e0
>
> (gdb) p mr
>
> $2 =3D (MemoryRegion *) 0x56ae16e0
>
> (gdb)
>
> The following workaround resolves the issue for now. It accesses the
> system_memory global variable directly instead of getting it from the
> function get_system_memory.
> https://github.com/karthikpoduval/qemu/commit/00580c9f3c60a7d9c3bb43bc958=
9f76e663197e4
>
> On Mon, May 16, 2022 at 7:13 PM Karthik Poduval
> <karthik.poduval@gmail.com> wrote:
> >
> > Hi All,
> >
> > I still need help, any help would be greatly appreciated. Turned on
> > address sanitizers (config option --enable-sanitizers).
> > It pointed to a heap overflow in xilinx code.
> > SUMMARY: AddressSanitizer: heap-buffer-overflow
> > ../git/hw/dma/xlnx_csu_dma.c:722 in xlnx_csu_dma_class_init
> >
> > So disabled xilinx from the config.
> > diff --git a/configs/devices/aarch64-softmmu/default.mak
> > b/configs/devices/aarch64-softmmu/default.mak
> > index cf43ac8da1..cf8b98070e 100644
> > --- a/configs/devices/aarch64-softmmu/default.mak
> > +++ b/configs/devices/aarch64-softmmu/default.mak
> > @@ -3,6 +3,6 @@
> >  # We support all the 32 bit boards so need all their config
> >  include ../arm-softmmu/default.mak
> >
> > -CONFIG_XLNX_ZYNQMP_ARM=3Dy
> > -CONFIG_XLNX_VERSAL=3Dy
> > +CONFIG_XLNX_ZYNQMP_ARM=3Dn
> > +CONFIG_XLNX_VERSAL=3Dn
> >  CONFIG_SBSA_REF=3Dy
> >
> > Even after doing that the code still crashes at the same point. It
> > seems to be a memory curruption issue or else how can
> > get_system_address() function provide an incorrect pointer.
> > build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/image/home/kpod=
uval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linux/qemu-system-=
native/6.2.0-r0/recipe-sysroot-native/usr/bin/qemu-system-aarch64
> > -device virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
> > user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::2323-:23,tftp=3D/=
home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm=
64
> > -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device
> > virtio-rng-pci,rng=3Drng0 -drive
> > id=3Ddisk0,file=3D/home/kpoduval/workspace/yoe-master-kpoduval/build/tm=
p/deploy/images/qemuarm64/yoe-simple-image-qemuarm64-20220515002944.rootfs.=
ext4,if=3Dnone,format=3Draw
> > -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
> > usb-tablet -device usb-kbd  -machine virt -cpu cortex-a57 -smp 4 -m
> > 1024 -serial mon:stdio -serial null -nographic -device virtio-gpu-pci
> > -kernel /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/i=
mages/qemuarm64/Image--5.15.22+git0+2d38a472b2_7f685244af-r0.0-qemuarm64-20=
220306152158.bin
> > -append 'root=3D/dev/vda rw  mem=3D1024M ip=3Ddhcp console=3DttyAMA0
> > console=3Dhvc0  '
> > =3D=3D2004211=3D=3DWARNING: ASan doesn't fully support makecontext/swap=
context
> > functions and may produce false positives in some cases!
> > AddressSanitizer:DEADLYSIGNAL
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D2004211=3D=3DERROR: AddressSanitizer: SEGV on unknown address
> > 0x000000005300 (pc 0x55dfdc2b47fc bp 0x61a0000028e8 sp 0x7ffcf813edc0
> > T0)
> > =3D=3D2004211=3D=3DThe signal is caused by a READ memory access.
> >     #0 0x55dfdc2b47fb in memory_region_ref ../git/softmmu/memory.c:1790
> >     #1 0x55dfdc2b47fb in address_space_init ../git/softmmu/memory.c:300=
5
> >     #2 0x55dfdacba208 in m2m_scaler_realize ../git/hw/misc/m2m_scaler.c=
:288
> >     #3 0x55dfdc7fb1eb in device_set_realized ../git/hw/core/qdev.c:531
> >     #4 0x55dfdc807c50 in property_set_bool ../git/qom/object.c:2268
> >     #5 0x55dfdc80f5ff in object_property_set ../git/qom/object.c:1403
> >     #6 0x55dfdc819253 in object_property_set_qobject ../git/qom/qom-qob=
ject.c:28
> >     #7 0x55dfdc80feb5 in object_property_set_bool ../git/qom/object.c:1=
472
> >     #8 0x55dfdc7f9452 in qdev_realize_and_unref ../git/hw/core/qdev.c:3=
40
> >     #9 0x55dfda8c9adc in sysbus_create_varargs ../git/hw/core/sysbus.c:=
236
> >     #10 0x55dfdb24d87e in sysbus_create_simple
> > /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linu=
x/qemu-system-native/6.2.0-r0/git/include/hw/sysbus.h:104
> >     #11 0x55dfdb24d87e in create_m2m_scaler ../git/hw/arm/virt.c:1316
> >     #12 0x55dfdb24d87e in machvirt_init ../git/hw/arm/virt.c:2223
> >     #13 0x55dfda8bd006 in machine_run_board_init ../git/hw/core/machine=
.c:1187
> >     #14 0x55dfdc2c9f51 in qemu_init_board ../git/softmmu/vl.c:2656
> >     #15 0x55dfdc2c9f51 in qmp_x_exit_preconfig ../git/softmmu/vl.c:2746
> >     #16 0x55dfdc2d1425 in qemu_init ../git/softmmu/vl.c:3777
> >     #17 0x55dfda49c1fc in main ../git/softmmu/main.c:49
> >     #18 0x7f53e39ce57a
> > (/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/sysroots-uninat=
ive/x86_64-linux/lib/libc.so.6+0x2d57a)
> >     #19 0x7f53e39ce62f in __libc_start_main
> > (/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/sysroots-uninat=
ive/x86_64-linux/lib/libc.so.6+0x2d62f)
> >     #20 0x55dfda4d6f5d in _start
> > (/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-lin=
ux/qemu-system-native/6.2.0-r0/image/home/kpoduval/workspace/yoe-master-kpo=
duval/build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/recipe-sysroo=
t-native/usr/bin/qemu-system-aarch64+0x3b58f5d)
> >
> > AddressSanitizer can not provide additional info.
> > SUMMARY: AddressSanitizer: SEGV ../git/softmmu/memory.c:1790 in
> > memory_region_ref
> > =3D=3D2004211=3D=3DABORTING
> >
> > Any help would be greatly appreciated. Here is the link to the latest c=
ode.
> > https://github.com/karthikpoduval/qemu/tree/scaler-bringup
> >
> > On Sun, May 15, 2022 at 12:26 AM Karthik Poduval
> > <karthik.poduval@gmail.com> wrote:
> > >
> > > Hi All,
> > >
> > > I am trying to create a virtual mem2mem scaler device in QEMU (for th=
e
> > > purposes of writing a mem2mem driver tutorial). I created the mem2mem
> > > device as shown here.
> > > https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/misc/m2=
m_scaler.c
> > >
> > > I added this MMIO device to the arm virt.c (as shown here).
> > > https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/arm/vir=
t.c#L1306
> > >
> > > However while the device is getting created, there is a crash while
> > > launching QEMU.
> > > qemu-system-aarch64 -device
> > > virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
> > > user,id=3Dnet0,hostfwd=3Dtcp::2222-:22,hostfwd=3Dtcp::2323-:23,tftp=
=3D/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qem=
uarm64
> > > -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device
> > > virtio-rng-pci,rng=3Drng0 -drive
> > > id=3Ddisk0,file=3D/home/kpoduval/workspace/yoe-master-kpoduval/build/=
tmp/deploy/images/qemuarm64/yoe-simple-image-qemuarm64-20220515002944.rootf=
s.ext4,if=3Dnone,format=3Draw
> > > -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
> > > usb-tablet -device usb-kbd  -machine virt -cpu cortex-a57 -smp 4 -m
> > > 1024 -serial mon:stdio -serial null -nographic -device virtio-gpu-pci
> > > -kernel /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy=
/images/qemuarm64/Image--5.15.22+git0+2d38a472b2_7f685244af-r0.0-qemua
> > > rm64-20220306152158.bin -append 'root=3D/dev/vda rw  mem=3D256M ip=3D=
dhcp
> > > console=3DttyAMA0 console=3Dhvc0  '
> > >
> > > Upon running gdb, the stack trace looks like.
> > > Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation faul=
t.
> > > 0x0000555555d2f6d6 in memory_region_ref (mr=3D0x56becae0) at
> > > ../git/softmmu/memory.c:3005
> > > 3005        memory_region_ref(root);
> > > (gdb) bt
> > > #0  0x0000555555d2f6d6 in memory_region_ref (mr=3D0x56becae0) at
> > > ../git/softmmu/memory.c:3005
> > > #1  address_space_init (as=3D0x5555570f8bb8, root=3D0x56becae0,
> > > name=3D0x5555560a9620 "m2m-scaler-dma") at ../git/softmmu/memory.c:30=
05
> > > #2  0x0000555555e0d5c8 in object_initialize_with_type
> > > (obj=3Dobj@entry=3D0x5555570f8750, size=3Dsize@entry=3D1360,
> > > type=3Dtype@entry=3D0x555556a117d0) at ../git/qom/object.c:518
> > > #3  0x0000555555e0d719 in object_new_with_type (type=3D0x555556a117d0=
)
> > > at ../git/qom/object.c:733
> > > #4  0x0000555555e08e3a in qdev_new (name=3Dname@entry=3D0x5555560a95e=
b
> > > "m2m_scaler") at ../git/hw/core/qdev.c:153
> > > #5  0x000055555595cafa in sysbus_create_varargs
> > > (name=3Dname@entry=3D0x5555560a95eb "m2m_scaler", addr=3Daddr@entry=
=3D0) at
> > > ../git/hw/core/sysbus.c:234
> > > #6  0x0000555555adf1a1 in sysbus_create_simple (irq=3D<optimized out>=
,
> > > addr=3D0, name=3D0x5555560a95eb "m2m_scaler")
> > >     at /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x8=
6_64-linux/qemu-system-native/6.2.0-r0/git/include/hw/sysbus.h:104
> > > #7  create_m2m_scaler (vms=3D0x555556c31400) at ../git/hw/arm/virt.c:=
1317
> > > #8  machvirt_init (machine=3D0x555556c31400) at ../git/hw/arm/virt.c:=
2239
> > > #9  0x0000555555959929 in machine_run_board_init
> > > (machine=3D0x555556c31400) at ../git/hw/core/machine.c:1187
> > > #10 0x0000555555d3576f in qemu_init_board () at ../git/softmmu/vl.c:2=
656
> > > #11 qmp_x_exit_preconfig (errp=3D<optimized out>) at ../git/softmmu/v=
l.c:2746
> > > #12 qmp_x_exit_preconfig (errp=3D<optimized out>) at ../git/softmmu/v=
l.c:2739
> > > #13 0x0000555555d38f3b in qemu_init (argc=3D<optimized out>,
> > > argv=3D<optimized out>, envp=3D<optimized out>) at
> > > ../git/softmmu/vl.c:3777
> > > #14 0x000055555588e1bd in main (argc=3D<optimized out>, argv=3D<optim=
ized
> > > out>, envp=3D<optimized out>) at ../git/softmmu/main.c:49
> > >
> > > I was able to do the same thing in QEMU 5.1.0 do not know why this
> > > does not work in QEMU 6.2.0. Kindly help me resolve this issue. I wan=
t
> > > my device to have access to the entire system RAM (as thi emulated
> > > device can read input image from DDR scale it and write back the inpu=
t
> > > image to DDR so it needs to have access to the entire DDR memory).
> > >
> > > --
> > > Regards,
> > > Karthik Poduval
> >
> >
> >
> > --
> > Regards,
> > Karthik Poduval
>
>
>
> --
> Regards,
> Karthik Poduval



--=20
Regards,
Karthik Poduval

