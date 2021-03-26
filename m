Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78634A2E4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:02:05 +0100 (CET)
Received: from localhost ([::1]:32778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhPv-0002vj-Iy
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPhN3-0001ht-OP
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:59:05 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:45769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPhMz-0000EZ-IS
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:59:05 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso1100458ooq.12
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJjAercYJ2WZsZMbkqEUW2kWbPjxvpis7QoIsOJMscs=;
 b=W34BJ296zgZApLYobYu5zetO7Ka6k8/TeI/UpPLErahjOkB9wTLeL2CRtaS4bu9NnI
 UoGgWIAFQTYapRghDEAxQQaB/mqHkPkHTawByT5FF3bpsbenpCoO1kEyfiGq65jwuloh
 RxsntXpCmeyIsoKS/Rl/mg6OMQsKruTvahHmFbVit4f0+/PSfPVU3xG3WCEl5YS+8BbE
 04STYTUSLIm1uhPg4MxnfzVzhlHGIyLFjjrn2gFzqpXgmBgY0Qb3/B4pp4Y4S+J8C0lV
 x1Yg0QjnWWMJs1OK/ZimNWLmwL93pq6yNkbTMFUqa47LOSFsxd7jrQlndWE7Ipyk43Rh
 hhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJjAercYJ2WZsZMbkqEUW2kWbPjxvpis7QoIsOJMscs=;
 b=EUHtgocH7csmZzo6x1kKfgzGVF2R8txOxYvysq7p/nfrlIm9Ci9rFLnVLSe6bsHXwg
 RuNW3qUxhiuI/dFryo8vkZfsDx//hjtOZiAF008KYq6Y2+NXI2ZQIdMmUDYUBysmc53Q
 l9SGXApQxEl2f5AfG1+2He7CN5yh+w7a8bvRBtbGUpmm6t1MwY6lOGvUNnlDjqGm4+Qw
 1oELoPtAPbpsxpMbYAI0+TJcae2w5IXfuM0rtW3TOafSqVNsLi0I/a2OW/XJ2UfI3cJD
 IMbJ43hnWHpUwGHwCF6ST07YDVYlfKgnLUPjH/y+1nS4mr7eeuD5ORUPDIMow4RTTb9c
 mLlQ==
X-Gm-Message-State: AOAM531aGuh2BqsCf7pxQBV8oroLYi2Klh8gS5WeU9ipVu1MRr/vMsm4
 VC/PkxtxDUy7R0/DdB9KhI9KxKPsed9jvU9DwOU=
X-Google-Smtp-Source: ABdhPJzzGqeU/ISjYsGf80ydwGi+GWedJiX4E6ZJ0K6wCwvPd0Ir+R30kWESU25CHF7ucP/bucp0y4jKD0nl/EBw1Fw=
X-Received: by 2002:a4a:2747:: with SMTP id w7mr10418586oow.11.1616745539728; 
 Fri, 26 Mar 2021 00:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
In-Reply-To: <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 26 Mar 2021 08:58:48 +0100
Message-ID: <CABLmASH-dcW5ec+3KU2t3DqzAD_vWvOqyJF4FurvnJ68PMMaNA@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc2c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,
(I forgot to reply to all....)

> > In answer to your questions:
> >
> > 1. Yes, slirp works on Windows 10 with this setup.
> > 2. Yes, in Linux both tap and slirp work.
>
> Thanks! Just to be clear, the above testing was performed with commit
> 969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7, right?
>

Yes, the test is based on current master, so including that commit.
As said, reverting it restores tap functionality in Windows.

> >
> > My Windows build is done with a fully up to date msys2 installation.
> >
> > I tried to debug in Windows:
> > (gdb) run
> > Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
> > -M mac99 -m 128 -sdl -serial stdio -boot c -drive
> > "file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=disk" -device
> > "sungem,netdev=network01" -netdev "tap,ifname=TapQemu,id=network01" -S
> > [New Thread 13304.0x1f00]
> > [New Thread 13304.0x2f84]
> > [New Thread 13304.0x3524]
> > [New Thread 13304.0x2b8c]
> > [New Thread 13304.0x368c]
> > [New Thread 13304.0x3668]
> > [New Thread 13304.0xf4c]
> > [New Thread 13304.0x49c]
> > [New Thread 13304.0x1d4c]
> > [New Thread 13304.0x7fc]
> > [Thread 13304.0x7fc exited with code 0]
> > [New Thread 13304.0x357c]
> > [New Thread 13304.0x7c0]
> > [New Thread 13304.0x3564]
> > [New Thread 13304.0x26f4]
> > [New Thread 13304.0x2f68]
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
> > (gdb) bt
> > #0  0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
> > #1  0x000800000480bf50 in ?? ()
> > Backtrace stopped: previous frame inner to this frame (corrupt stack?)
> > (gdb)
> >
> > Even before I could attach to the process.
>
> Is QEMU crashed, or the MacOS guest crashed?

Well, that is an interesting question.
qemu-system-ppc -M mac99 uses openbios and it crashes while still in
the openbios window just when it tries to boot the hd.
Besides Mac OS 9.2, I now also tried booting a Mac OS X 10.3 image and
it crashes just the same.

Tracing the default sungem network device shows:

C:\qemu-master-msys2>qemu-system-ppc.exe -L pc-bios -M mac99 -m 128
-sdl -serial stdio -boot c -drive
file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=
disk -device sungem,netdev=network01 -netdev
tap,ifname=TapQemu,id=network01 -trace "sung*"
sungem_reset Full reset (PCI:1)
sungem_rx_reset RX reset
sungem_tx_reset TX reset
sungem_reset Full reset (PCI:1)
sungem_rx_reset RX reset
sungem_tx_reset TX reset
sungem_rx_mac_disabled Check RX MAC disabled
sungem_rx_mac_disabled Check RX MAC disabled
sungem_rx_mac_disabled Check RX MAC disabled
sungem_mmio_mac_read MMIO mac read from 0x80 val=0x3456
sungem_mmio_mac_read MMIO mac read from 0x84 val=0x12
sungem_mmio_mac_read MMIO mac read from 0x88 val=0x5254

>> =============================================================
>> OpenBIOS 1.1 [Mar 16 2021 08:16]
>> Configuration device id QEMU version 1 machine id 1
>> CPUs: 1
>> Memory: 128M
>> UUID: 00000000-0000-0000-0000-000000000000
>> CPU type PowerPC,G4
milliseconds isn't unique.

Best,
Howard

