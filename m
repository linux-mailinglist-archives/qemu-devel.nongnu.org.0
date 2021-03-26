Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CC34A232
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:53:36 +0100 (CET)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgLf-0004Wb-Fi
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPgJo-0003Bx-F2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:51:43 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPgJk-00019J-NS
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:51:40 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w8so4877712ybt.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0KgpzAY6iohIZ9BrVmXDa3GXo6XDAI5IdUHrv9PAYQ=;
 b=vMDxNXPQljuFGfDGah8pToF8z7TTnZDuyOztSWLfo8xzNvOofEL7g2jC5+98kV7WFg
 0dzWgvyCFKym0cuRoVpJPd2OmiR9W+uz3NBVdPSC3mL0rBALjOEVrvObsXgJD2zPdg7/
 FfTisEGadXaMZYBa0GzFC0KGSlLO5l1FtroCGs4d/a0V2zhJSCVm4dVEkrSu4CgdmA35
 LFSI+goB98zqVhYyxz9FjfGHZFOCqoFXsismKmYjyPpHB0SdOfu9RsTumh/7Z1XeRgbV
 Me1fKW/EHXngTktAmJe5bqFkWeStfj03MJR6ld1RDbLrudmstO1beg9rT7lqfs90pNtP
 TuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0KgpzAY6iohIZ9BrVmXDa3GXo6XDAI5IdUHrv9PAYQ=;
 b=TZMZ+QHEwY7ImoydOvJBWxRraWeJ+lo3TM8UnrgMbzA5/0iLttohsvNbesy5vMoIsL
 t3XN2E57QYEj+OCcqca9UTSQzcX0Tx6RVzPVAnfCJhSw/beBQu0Jmwi5kvpVvQTRaahf
 Q22el496Jk9q5ztqh8l1Aire5uT4VACJHJUECPiA7DxMMPRmnxdLCPC3yM4+quuyZZjf
 eZw1gEtYOTh5vPnFQlskhFOB4wISjGHgJft6uI+byZpZoy9pmmTV6MEqdjFgXFje0cY3
 sZ3uPrkRxUImMYM58GWfrz5WUL3EWSrqVyCtZIVqGvIp238V5EZqqtQz95mCHMRwOooV
 LkwQ==
X-Gm-Message-State: AOAM530XLdNqSm53p7hB0ArjoAx/aL+FY1uuYhi2Lxu+tnSm6W+n1+0M
 mSajXtJxlsQTCqRSyz1jovy0qJxwAc/v1fw2f24=
X-Google-Smtp-Source: ABdhPJx0WOiQvuT8nYi6fUE+/Nmgg/zbRDdEqx2Q5LbnzoLDXNiKdSLSP2vVyTFezwRkBobkiPrQcfnZ3rByebsXmR0=
X-Received: by 2002:a25:ed0a:: with SMTP id k10mr18708684ybh.152.1616741495651; 
 Thu, 25 Mar 2021 23:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
In-Reply-To: <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Mar 2021 14:51:23 +0800
Message-ID: <CAEUhbmUadyjCPpo3QOLo5TzcrDn9qzO71GQLD7cwrL-QdDvHgQ@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Howard,

On Fri, Mar 26, 2021 at 2:40 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Howard,
> >
> > On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > (adding the relevant people to the cc list)
> > >
> > > On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > When running qemu-system-ppc with Mac OS guest, the guest crashes when
> > > > using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
> > > > with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
> > > > with the default ethernet connection. It gets activated when I start
> > > > qemu.
> > > >
> > > > To reproduce, compile qemu-system-ppc from current source and run:
> > > >
> > > > qemu-system-ppc.exe ^
> > > > -L pc-bios ^
> > > > -M mac99 ^
> > > > -m 128 ^
> > > > -sdl -serial stdio ^
> > > > -boot c ^
> > > > -drive file=C:\Mac-disks\9.2.img,format=raw,media=disk ^
> > > > -device sungem,netdev=network01 -netdev tap,ifname=TapQemu,id=network01
> > > >
> > > > I bisected to the commit below. Thanks for looking into this.
> >
> > Thanks for reporting.
> >
> > Can you please provide some further information:
> >
> > 1. Does "-net user" work on Windows?
> > 2. If running QEMU under Linux, does "-net tap" or "-net user" work?
> >
> > Regards,
> > Bin
>
> Hello Bin,
>
> Thanks for getting back to me. I forgot to mention that reverting the
> above patch restores functionality. And that other applications using
> the same tap device work correctly.
> In answer to your questions:
>
> 1. Yes, slirp works on Windows 10 with this setup.
> 2. Yes, in Linux both tap and slirp work.

Thanks! Just to be clear, the above testing was performed with commit
969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7, right?

>
> My Windows build is done with a fully up to date msys2 installation.
>
> I tried to debug in Windows:
> (gdb) run
> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
> "file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=disk" -device
> "sungem,netdev=network01" -netdev "tap,ifname=TapQemu,id=network01" -S
> [New Thread 13304.0x1f00]
> [New Thread 13304.0x2f84]
> [New Thread 13304.0x3524]
> [New Thread 13304.0x2b8c]
> [New Thread 13304.0x368c]
> [New Thread 13304.0x3668]
> [New Thread 13304.0xf4c]
> [New Thread 13304.0x49c]
> [New Thread 13304.0x1d4c]
> [New Thread 13304.0x7fc]
> [Thread 13304.0x7fc exited with code 0]
> [New Thread 13304.0x357c]
> [New Thread 13304.0x7c0]
> [New Thread 13304.0x3564]
> [New Thread 13304.0x26f4]
> [New Thread 13304.0x2f68]
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
> (gdb) bt
> #0  0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
> #1  0x000800000480bf50 in ?? ()
> Backtrace stopped: previous frame inner to this frame (corrupt stack?)
> (gdb)
>
> Even before I could attach to the process.

Is QEMU crashed, or the MacOS guest crashed?

Regards,
Bin

