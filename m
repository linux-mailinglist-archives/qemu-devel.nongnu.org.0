Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FA34A1FF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:42:18 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgAi-0000lB-V9
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPg8t-0000AV-Na
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:40:23 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPg8r-0002Wl-O7
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 02:40:23 -0400
Received: by mail-oi1-x231.google.com with SMTP id d12so4706000oiw.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2tPvoiOyFYmG1E446ar9VKpqxfwhwekKrth2b1MDMPI=;
 b=HUlj9EEI3wMSSqdxGqAbMfwmDHCBDW3B2IDV6JbjW4SHNC+gwzlNaOync4A98rb2Ow
 jbRAhZ6nlT9SONDFdEjgd1BLLWnjfbglPbzLtrVbuT/sghUPSU7tlqNNdIKk6fbulNk6
 YMUxQx7lc97pRvXaIMT1hE1epMUSSfgje9Sf6tIfpkdHXsUmwEMM7/QFusaV2tr4xB9Q
 YaEa+5KkRE64miZiWvFyIggkdsPa6kN+txv7XwkVT0jAPQlLPoYeyGOB1W2DIRnyow9D
 g2TFwbAu0mejIs9G27Lj7yOfvk60g8V7jp6nBuOZ1Kak5/WKIaFDALaJxyfu35Jelzqj
 R4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tPvoiOyFYmG1E446ar9VKpqxfwhwekKrth2b1MDMPI=;
 b=msIan79z4ELCCFKBdFr9spWcqT1ruQd6qZbSWAQr6xnpPDaoLPBFkFDLzvioyjmtnc
 FlB7P2uJDt76lSF1J1M5jh72j8bxcmxPgK9ZNIJ50YJ9H5QQBnmxT2y03KGYuqc1P3s2
 Ky1fuYOZE9EorOEl+4O+QZH7DSw+SXcS8J7e1XuvI87uvhASKB5Nea+ErltRcKuhU/pT
 pcKAfUYOlIuvNCoE4hGrqa72F/3hPVrRP4L1GCDCVk5hIr/I1pwe8PxtryPVhfPgXiOP
 FclSxc7WGSGUCNSVxWbMetcCmqNIwz/4bKzGN/nYicqf49Ar97msoLzqhbkDeQ0VRkow
 2+Jw==
X-Gm-Message-State: AOAM532xqrEC7xMal82PidPBf+WdGotA9Ocf8WVFytVDeT8KXo6e3+31
 DfVl5PY+mMolldkx/miy/EUD5KyJVmlzHyrCjrA=
X-Google-Smtp-Source: ABdhPJxdxKVA7edX2PYYDViQhKyaZXIMIRG8twxoLkExV5tS1lRz/ywKKjiQhzsIUwRvdYTgx2ghEWoIueLBznwopN0=
X-Received: by 2002:aca:5d82:: with SMTP id r124mr8674738oib.59.1616740820196; 
 Thu, 25 Mar 2021 23:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
In-Reply-To: <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 26 Mar 2021 07:40:09 +0100
Message-ID: <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x231.google.com
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

On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Howard,
>
> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > (adding the relevant people to the cc list)
> >
> > On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > When running qemu-system-ppc with Mac OS guest, the guest crashes when
> > > using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
> > > with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
> > > with the default ethernet connection. It gets activated when I start
> > > qemu.
> > >
> > > To reproduce, compile qemu-system-ppc from current source and run:
> > >
> > > qemu-system-ppc.exe ^
> > > -L pc-bios ^
> > > -M mac99 ^
> > > -m 128 ^
> > > -sdl -serial stdio ^
> > > -boot c ^
> > > -drive file=C:\Mac-disks\9.2.img,format=raw,media=disk ^
> > > -device sungem,netdev=network01 -netdev tap,ifname=TapQemu,id=network01
> > >
> > > I bisected to the commit below. Thanks for looking into this.
>
> Thanks for reporting.
>
> Can you please provide some further information:
>
> 1. Does "-net user" work on Windows?
> 2. If running QEMU under Linux, does "-net tap" or "-net user" work?
>
> Regards,
> Bin

Hello Bin,

Thanks for getting back to me. I forgot to mention that reverting the
above patch restores functionality. And that other applications using
the same tap device work correctly.
In answer to your questions:

1. Yes, slirp works on Windows 10 with this setup.
2. Yes, in Linux both tap and slirp work.

My Windows build is done with a fully up to date msys2 installation.

I tried to debug in Windows:
(gdb) run
Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
-M mac99 -m 128 -sdl -serial stdio -boot c -drive
"file=C:\Mac-disks\9.2-usb-pci-ddk.img,format=raw,media=disk" -device
"sungem,netdev=network01" -netdev "tap,ifname=TapQemu,id=network01" -S
[New Thread 13304.0x1f00]
[New Thread 13304.0x2f84]
[New Thread 13304.0x3524]
[New Thread 13304.0x2b8c]
[New Thread 13304.0x368c]
[New Thread 13304.0x3668]
[New Thread 13304.0xf4c]
[New Thread 13304.0x49c]
[New Thread 13304.0x1d4c]
[New Thread 13304.0x7fc]
[Thread 13304.0x7fc exited with code 0]
[New Thread 13304.0x357c]
[New Thread 13304.0x7c0]
[New Thread 13304.0x3564]
[New Thread 13304.0x26f4]
[New Thread 13304.0x2f68]

Program received signal SIGSEGV, Segmentation fault.
0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
(gdb) bt
#0  0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dll
#1  0x000800000480bf50 in ?? ()
Backtrace stopped: previous frame inner to this frame (corrupt stack?)
(gdb)

Even before I could attach to the process.

Best,
Howard

