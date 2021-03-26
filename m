Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0A34A398
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:02:49 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiMi-000853-97
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPiKx-0007Wr-MH
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:00:59 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPiKt-00043d-5b
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:00:59 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l15so5218090ybm.0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tpl38654LEgMRzbKVvpPVurC5IKSoiXn3vDxa6T4QPg=;
 b=PNFnPcnVVZcBckZc9roQNaYuTHyv2ABaPpsC8NWGo5dQbFdupbnD6vPXCDPVk3p6iq
 Bg2V0QbhDeUoGkwwOk4iPM4n57v/0oyAJA23o3TCISrwwfK0sY9ClmWaCeuht2ZHUsh7
 bttzJC7AdYsyoI5dfYHv05vEMkIl8nMdxQUdt751NRhVOblHUmteLOvztKDfjhl2OMvt
 FNO/SkGyECvYyfZSYaSiqiVT9c72FcgdHP3tFXJMDCqZLHtTMqbnMwdhYGmMrEd4wntP
 9uwkGwh466Y3YCQ+NsslqaOLfEw9TFxpHwgy24h9vnPLqD160J3tx4jliM45ho6RynJw
 RFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tpl38654LEgMRzbKVvpPVurC5IKSoiXn3vDxa6T4QPg=;
 b=NZx1zDLTip36XqDT9XvEOcCdoiuJxJ8lnBFThGkhSjSgPhyAveR5HMpoCM6/OH/oxs
 cPjUSIgxq7BSp/KY29GbqDJilmrexacddx30m7ha1QUS0s0HTqpUC4XdanyasAdS4DAU
 iajtn+qUYU84woKwb18udDsser+33J2376fc+cOWrubrx5fRpWo75CjnSXKCEEP0OCA6
 tqQHZowOigBO5oMsChTjXtkIRzqQNC5H90Bpspqk+asrSJiH8c/A4x+cLkGc9heigUmg
 y+6HMiZ3Ag0FtGlAJZADLhEglpB7QudI5k9E97H6yzsf9VrMwb1kIiAIVvcIPuxZlQtJ
 gq8Q==
X-Gm-Message-State: AOAM533Xiv5l/9x3Fniz1U+dVVs6nTCjtdzzrHb21Djyh2ho6OlS2uuK
 Neie6CYtdTReQGNvMiVRg6EEkFxCItmIObpwYBg=
X-Google-Smtp-Source: ABdhPJz0NzdDBCMWGZdIJBVX2lyTBdj5mO7+kUMmElzwEKIZKP6ANrgIlIURtjK5ifdM0XiG5ltrM/la/mBQ1UJwzmQ=
X-Received: by 2002:a25:bd8:: with SMTP id 207mr19907127ybl.387.1616749253786; 
 Fri, 26 Mar 2021 02:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
 <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
 <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
In-Reply-To: <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Mar 2021 17:00:42 +0800
Message-ID: <CAEUhbmVp_b4K=0WsaUGsXtHPqZTmn-rZYdcNsGMnRcCHdJjnNA@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 4:49 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/26 =E4=B8=8B=E5=8D=884:21, BALATON Zoltan =E5=86=99=E9=
=81=93:
> > On Fri, 26 Mar 2021, Howard Spoelstra wrote:
> >> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>
> >>> Hi Howard,
> >>>
> >>> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell
> >>> <peter.maydell@linaro.org> wrote:
> >>>>
> >>>> (adding the relevant people to the cc list)
> >>>>
> >>>> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> When running qemu-system-ppc with Mac OS guest, the guest crashes
> >>>>> when
> >>>>> using a tap network connection. Openvpn 2.4.9-I601-win10 is install=
ed
> >>>>> with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
> >>>>> with the default ethernet connection. It gets activated when I star=
t
> >>>>> qemu.
> >>>>>
> >>>>> To reproduce, compile qemu-system-ppc from current source and run:
> >>>>>
> >>>>> qemu-system-ppc.exe ^
> >>>>> -L pc-bios ^
> >>>>> -M mac99 ^
> >>>>> -m 128 ^
> >>>>> -sdl -serial stdio ^
> >>>>> -boot c ^
> >>>>> -drive file=3DC:\Mac-disks\9.2.img,format=3Draw,media=3Ddisk ^
> >>>>> -device sungem,netdev=3Dnetwork01 -netdev
> >>>>> tap,ifname=3DTapQemu,id=3Dnetwork01
> >>>>>
> >>>>> I bisected to the commit below. Thanks for looking into this.
> >>>
> >>> Thanks for reporting.
> >>>
> >>> Can you please provide some further information:
> >>>
> >>> 1. Does "-net user" work on Windows?
> >>> 2. If running QEMU under Linux, does "-net tap" or "-net user" work?
> >>>
> >>> Regards,
> >>> Bin
> >>
> >> Hello Bin,
> >>
> >> Thanks for getting back to me. I forgot to mention that reverting the
> >> above patch restores functionality. And that other applications using
> >> the same tap device work correctly.
> >> In answer to your questions:
> >>
> >> 1. Yes, slirp works on Windows 10 with this setup.
> >> 2. Yes, in Linux both tap and slirp work.
> >>
> >> My Windows build is done with a fully up to date msys2 installation.
> >>
> >> I tried to debug in Windows:
> >> (gdb) run
> >> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bios
> >> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
> >> "file=3DC:\Mac-disks\9.2-usb-pci-ddk.img,format=3Draw,media=3Ddisk" -d=
evice
> >> "sungem,netdev=3Dnetwork01" -netdev "tap,ifname=3DTapQemu,id=3Dnetwork=
01" -S
> >> [New Thread 13304.0x1f00]
> >> [New Thread 13304.0x2f84]
> >> [New Thread 13304.0x3524]
> >> [New Thread 13304.0x2b8c]
> >> [New Thread 13304.0x368c]
> >> [New Thread 13304.0x3668]
> >> [New Thread 13304.0xf4c]
> >> [New Thread 13304.0x49c]
> >> [New Thread 13304.0x1d4c]
> >> [New Thread 13304.0x7fc]
> >> [Thread 13304.0x7fc exited with code 0]
> >> [New Thread 13304.0x357c]
> >> [New Thread 13304.0x7c0]
> >> [New Thread 13304.0x3564]
> >> [New Thread 13304.0x26f4]
> >> [New Thread 13304.0x2f68]
> >>
> >> Program received signal SIGSEGV, Segmentation fault.
> >> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.dl=
l
> >> (gdb) bt
> >> #0  0x00007ffb9edea991 in ?? () from
> >> c:\qemu-master-msys2\libglib-2.0-0.dll
> >> #1  0x000800000480bf50 in ?? ()
> >> Backtrace stopped: previous frame inner to this frame (corrupt stack?)
> >> (gdb)
> >>
> >> Even before I could attach to the process.
> >
> > If you run QEMU under gdb you don't have to attach to it but to get a
> > meaningful backtrace you should configure and compile QEMU with
> > --enable-debug (this will make it run slower so not recommended
> > normally but for debugging that would be needed). If the stack is
> > really corrupted then you may not get a useful backtrace or it may be
> > a problem with gdb on Windows. I've found that gdb on Windows works
> > for simple things but could give bad results for more complex stuff.
> > WinDbg may be better but it's harder to use (needs some registry
> > change I think to enable core dumps then you could open and analyze
> > core dumps with it or it should be able to run command directly but I
> > don't know how that works).
> >
> > Another idea: maybe you could check other threads in gdb. Not sure if
> > that would reveal anything but may worth a try. I think the commands
> > you need are "info threads" and "apply all bt" or something similar.
> >
> > Regards,
> > BALATON Zoltan
> >
>
> It looks to me the patch tires to recycle a temporary buffer to tap threa=
d.
>
> Please try to attached fix to see it if works.

Yep, good catch, thanks! This patch looks correct to me.

Regards,
Bin

