Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740ED34B452
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 06:15:26 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ1ID-0000JU-4a
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 01:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lQ1Gq-000811-4S
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 01:14:00 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lQ1Go-0003wg-68
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 01:13:59 -0400
Received: by mail-oi1-x229.google.com with SMTP id m13so7815741oiw.13
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 22:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YHYfDKvJn8XqMaEn8ZeVLCY33Ve+m6+eIvw7WqsMN7o=;
 b=NhuF63o6AMCTYM7pV6ST9k3TtWfqwnJTWBTA/zR7vwMmjshik/PVxRFE269mCRRwbK
 fqsGdsBGFdYeST0if7C+kR04pCisJXiSNgJs5Ao5oCS4cHBbBwhm/ylSubrHv+1w3NE2
 FoEN/Rd2SCQaKhuCi9ZSK5jo6bJ56dMhZcUHQGvisMhJhhQr3QDb7r+rBrxt6zg4ZORt
 lt9ELaUTUQtuzXrAtMrQ9XMt5IPOXx8rHQW+Az4ZpC08Pqf6TOGiAtDEBpjzfWGWPcjS
 C7FbXghiEJqY4zGQaDF/8OTR25kz/QnR2We2yKdL9lRpyvaXduTNsgpLJ684h8WFHvgf
 DzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YHYfDKvJn8XqMaEn8ZeVLCY33Ve+m6+eIvw7WqsMN7o=;
 b=IrrCRUE4SizfNn+VKoIn0BQUx35oUMb4MgoIhYGfLfZWkjLlxvz9pEDdpXwVeZHxRY
 b7AGdjb0GeWseWb5D0KduVvkpl0OppeiiP22Ua7Y6pCtWiZIC28+yDZ0ZMYq/iXzJYVb
 R22DhqFozyafjSnWE4AFgh+c2BAvcv9dtJg8KQGdmIy7vjuJ5h8orJrm1mtvPrx0tkJX
 vYkDIj899+mvytQQJ2RViwLCii50BJnfEPhfHL1VwcabpmxCs571rNyLkB7VeqGJYJdC
 3p+4dJwKx1cLZBB9qmVhjxRPOevFDgSklypkcKBo1cEOx7R4/yovYz5/PIBbmQNOYmE2
 DT/Q==
X-Gm-Message-State: AOAM533CDfkKkZA0mXmRw45IefPAOdOByAts4VDhus/AtC+DYGEQ+XLa
 SiRqNG2NEq4jUeQ4TUBlI6NI6VcsWb+ND/KAYf4=
X-Google-Smtp-Source: ABdhPJzxqQGvDf4FQ3R7srxKUgugMRVvftUilEUz1brJ2nHCssC9Rr8xejTZYu4+Y6O4IVJtZQVamo5XU4F24T7FUG8=
X-Received: by 2002:a05:6808:f12:: with SMTP id
 m18mr11660895oiw.62.1616822036466; 
 Fri, 26 Mar 2021 22:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
 <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
 <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
 <CAEUhbmVp_b4K=0WsaUGsXtHPqZTmn-rZYdcNsGMnRcCHdJjnNA@mail.gmail.com>
 <CABLmASEp+uvibhH1bEqxLkGFdrKqhHOCXUso2tY-UNprT1+W4w@mail.gmail.com>
 <d2d16d3e-9620-26aa-c5c-407a9940934d@eik.bme.hu>
In-Reply-To: <d2d16d3e-9620-26aa-c5c-407a9940934d@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 27 Mar 2021 06:13:44 +0100
Message-ID: <CABLmASGv4drfs9kUsgxO2b2p39u1oS6KLgM2pxQQaO7D81uWZA@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x229.google.com
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
 Bin Meng <bmeng.cn@gmail.com>, qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 8:54 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Fri, 26 Mar 2021, Howard Spoelstra wrote:
> > On Fri, Mar 26, 2021 at 10:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Fri, Mar 26, 2021 at 4:49 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>
> >>>
> >>> =E5=9C=A8 2021/3/26 =E4=B8=8B=E5=8D=884:21, BALATON Zoltan =E5=86=99=
=E9=81=93:
> >>>> On Fri, 26 Mar 2021, Howard Spoelstra wrote:
> >>>>> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> >>>>>>
> >>>>>> Hi Howard,
> >>>>>>
> >>>>>> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell
> >>>>>> <peter.maydell@linaro.org> wrote:
> >>>>>>>
> >>>>>>> (adding the relevant people to the cc list)
> >>>>>>>
> >>>>>>> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.co=
m>
> >>>>>>> wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> When running qemu-system-ppc with Mac OS guest, the guest crashe=
s
> >>>>>>>> when
> >>>>>>>> using a tap network connection. Openvpn 2.4.9-I601-win10 is inst=
alled
> >>>>>>>> with TAP-Windows 9.24.2. A tap connection called TapQemu is brid=
ged
> >>>>>>>> with the default ethernet connection. It gets activated when I s=
tart
> >>>>>>>> qemu.
> >>>>>>>>
> >>>>>>>> To reproduce, compile qemu-system-ppc from current source and ru=
n:
> >>>>>>>>
> >>>>>>>> qemu-system-ppc.exe ^
> >>>>>>>> -L pc-bios ^
> >>>>>>>> -M mac99 ^
> >>>>>>>> -m 128 ^
> >>>>>>>> -sdl -serial stdio ^
> >>>>>>>> -boot c ^
> >>>>>>>> -drive file=3DC:\Mac-disks\9.2.img,format=3Draw,media=3Ddisk ^
> >>>>>>>> -device sungem,netdev=3Dnetwork01 -netdev
> >>>>>>>> tap,ifname=3DTapQemu,id=3Dnetwork01
> >>>>>>>>
> >>>>>>>> I bisected to the commit below. Thanks for looking into this.
> >>>>>>
> >>>>>> Thanks for reporting.
> >>>>>>
> >>>>>> Can you please provide some further information:
> >>>>>>
> >>>>>> 1. Does "-net user" work on Windows?
> >>>>>> 2. If running QEMU under Linux, does "-net tap" or "-net user" wor=
k?
> >>>>>>
> >>>>>> Regards,
> >>>>>> Bin
> >>>>>
> >>>>> Hello Bin,
> >>>>>
> >>>>> Thanks for getting back to me. I forgot to mention that reverting t=
he
> >>>>> above patch restores functionality. And that other applications usi=
ng
> >>>>> the same tap device work correctly.
> >>>>> In answer to your questions:
> >>>>>
> >>>>> 1. Yes, slirp works on Windows 10 with this setup.
> >>>>> 2. Yes, in Linux both tap and slirp work.
> >>>>>
> >>>>> My Windows build is done with a fully up to date msys2 installation=
.
> >>>>>
> >>>>> I tried to debug in Windows:
> >>>>> (gdb) run
> >>>>> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bi=
os
> >>>>> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
> >>>>> "file=3DC:\Mac-disks\9.2-usb-pci-ddk.img,format=3Draw,media=3Ddisk"=
 -device
> >>>>> "sungem,netdev=3Dnetwork01" -netdev "tap,ifname=3DTapQemu,id=3Dnetw=
ork01" -S
> >>>>> [New Thread 13304.0x1f00]
> >>>>> [New Thread 13304.0x2f84]
> >>>>> [New Thread 13304.0x3524]
> >>>>> [New Thread 13304.0x2b8c]
> >>>>> [New Thread 13304.0x368c]
> >>>>> [New Thread 13304.0x3668]
> >>>>> [New Thread 13304.0xf4c]
> >>>>> [New Thread 13304.0x49c]
> >>>>> [New Thread 13304.0x1d4c]
> >>>>> [New Thread 13304.0x7fc]
> >>>>> [Thread 13304.0x7fc exited with code 0]
> >>>>> [New Thread 13304.0x357c]
> >>>>> [New Thread 13304.0x7c0]
> >>>>> [New Thread 13304.0x3564]
> >>>>> [New Thread 13304.0x26f4]
> >>>>> [New Thread 13304.0x2f68]
> >>>>>
> >>>>> Program received signal SIGSEGV, Segmentation fault.
> >>>>> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0=
.dll
> >>>>> (gdb) bt
> >>>>> #0  0x00007ffb9edea991 in ?? () from
> >>>>> c:\qemu-master-msys2\libglib-2.0-0.dll
> >>>>> #1  0x000800000480bf50 in ?? ()
> >>>>> Backtrace stopped: previous frame inner to this frame (corrupt stac=
k?)
> >>>>> (gdb)
> >>>>>
> >>>>> Even before I could attach to the process.
> >>>>
> >>>> If you run QEMU under gdb you don't have to attach to it but to get =
a
> >>>> meaningful backtrace you should configure and compile QEMU with
> >>>> --enable-debug (this will make it run slower so not recommended
> >>>> normally but for debugging that would be needed). If the stack is
> >>>> really corrupted then you may not get a useful backtrace or it may b=
e
> >>>> a problem with gdb on Windows. I've found that gdb on Windows works
> >>>> for simple things but could give bad results for more complex stuff.
> >>>> WinDbg may be better but it's harder to use (needs some registry
> >>>> change I think to enable core dumps then you could open and analyze
> >>>> core dumps with it or it should be able to run command directly but =
I
> >>>> don't know how that works).
> >>>>
> >>>> Another idea: maybe you could check other threads in gdb. Not sure i=
f
> >>>> that would reveal anything but may worth a try. I think the commands
> >>>> you need are "info threads" and "apply all bt" or something similar.
> >>>>
> >>>> Regards,
> >>>> BALATON Zoltan
> >>>>
> >>>
> >>> It looks to me the patch tires to recycle a temporary buffer to tap t=
hread.
> >>>
> >>> Please try to attached fix to see it if works.
> >>
> >> Yep, good catch, thanks! This patch looks correct to me.
> >>
> >> Regards,
> >> Bin
> >
> > Hi,
> >
> > While the patch applies, it will not compile:
> >
> > ../net/tap-win32.c: In function 'tap_win32_send':
> > ../net/tap-win32.c:697:18: error: assignment to 'uint8_t' {aka
> > 'unsigned char'} from 'uint8_t *' {aka 'unsigned char *'} makes
> > integer from pointer without a cast [-Werror=3Dint-conversion]
> >  697 |         orig_buf =3D buf;
> >      |                  ^
> > ../net/tap-win32.c:707:42: error: passing argument 2 of
> > 'tap_win32_free_buffer' makes pointer from integer without a cast
> > [-Werror=3Dint-conversion]
> >  707 |         tap_win32_free_buffer(s->handle, orig_buf);
> >      |                                          ^~~~~~~~
> >      |                                          |
> >      |                                          uint8_t {aka unsigned c=
har}
> > ../net/tap-win32.c:590:44: note: expected 'uint8_t *' {aka 'unsigned
> > char *'} but argument is of type 'uint8_t' {aka 'unsigned char'}
> >  590 |                                   uint8_t *pbuf)
> >      |                                   ~~~~~~~~~^~~~
>
> Patch missing a * from this line:
>
> +    uint8_t *buf, orig_buf;
>
> should be
>
> +    uint8_t *buf, *orig_buf;
>
> Regards,
> BALATON Zoltan

Hi all,

Together with that * from Zoltan, this patch restores tap networking in Win=
dows.

Thanks!

So:
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>

