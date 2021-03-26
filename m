Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3634AC38
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:03:52 +0100 (CET)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPowB-0001qr-BL
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPorR-0005tr-Rz
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:58:57 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lPorP-0007ap-Vy
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:58:57 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so5640791otq.8
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pisrF/o1fUObV4913yamW7kNvo/R5udMETA/QVGTGy8=;
 b=DQwg8N3NISDkC0Zzj/HBxWzPtG1TfBPheBxYscATRXiNUUqrmiIYRTGKu3rYmyEUt7
 t3y7wWSWhScbfnxK4wT9voIug6f4dJJg5xzKXXh/d5SFKPYr5S4b2zMoUIChrTSlyxNW
 UT5SaHM0HfQrobCUr7DMvVT8XwsCeMZrVGlaQaYtxvgXE1ktwEjeH/+nMhck9o09XDSy
 sM1yfAOunx2KLEDE8PsOTQ/ng+NzppxksAOqJ6LJ0436jedoVcmtAN6RYnsIZ3CmXTP+
 a3oB8PH18n6X6Nhq4NRYN6gKhaIh/u98yQfJ98rsFcMYFL48/7ebgzuidxJKI0yt5qe2
 rsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pisrF/o1fUObV4913yamW7kNvo/R5udMETA/QVGTGy8=;
 b=H/KMh4ze6qtowwoq3o/aEhj7uZOBhObqBbQK8MvDV5daV6iMvWhKUCApq+g+4s409b
 kKo6vMwvtMx6mGVhVVj5BspFyWRtH4cYczCZAgNeErClqQy9rE7NEX2jAApXbb0piWlU
 HGm5v5b1LQFbWD/KpImIoj6AFqGsa2ZLKqb6wAEj3sRRK3DAMZNeeKG2VqCjQ+0aZmjB
 vB43tyxrIfWom0CfXeOoJcG9zTHJ9jCDFaxGPzMOBjWD6LmXZi+wsqtSGrGcnYDKg1bQ
 kek5kask4/Z/vA3NzPWrVzDZab4QfLKHsJ4+SGJrj7CV2QpeJBVzll1lxad4KtyxRE1K
 BHRg==
X-Gm-Message-State: AOAM532HljEHx7CYNlwGuCNsQVALVnEtDFeXb0S/A43FLqALzJEYjl56
 lOubSupTqoJCdtU87hEZXxCOgGF8c0JwaMF4NfU=
X-Google-Smtp-Source: ABdhPJyE5U/YqW4EZ/JyIQtrS5nnyekUqAXw8COOILl0IzDEZm/u7GBaSwRapT4Vmz8tVuRw32SgygnfFBo9VYNjdxE=
X-Received: by 2002:a05:6830:15d2:: with SMTP id
 j18mr12518152otr.75.1616774334772; 
 Fri, 26 Mar 2021 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
 <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
 <CAEUhbmUPrEkHdZ_msyr94PQJtVqSXVFGg5C_7Ybo590J7mTw1A@mail.gmail.com>
 <CABLmASGi-W=92XR27Cn6+QCkhhwFUVMqaJcpd6A8x=ZYV86HuA@mail.gmail.com>
 <c63a699d-9419-5a87-269b-476ef0a5b587@eik.bme.hu>
 <6271eee3-d1fa-2a54-48a6-51f4aa592642@redhat.com>
 <CAEUhbmVp_b4K=0WsaUGsXtHPqZTmn-rZYdcNsGMnRcCHdJjnNA@mail.gmail.com>
In-Reply-To: <CAEUhbmVp_b4K=0WsaUGsXtHPqZTmn-rZYdcNsGMnRcCHdJjnNA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 26 Mar 2021 16:58:42 +0100
Message-ID: <CABLmASEp+uvibhH1bEqxLkGFdrKqhHOCXUso2tY-UNprT1+W4w@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x32e.google.com
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

On Fri, Mar 26, 2021 at 10:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Mar 26, 2021 at 4:49 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/3/26 =E4=B8=8B=E5=8D=884:21, BALATON Zoltan =E5=86=99=E9=
=81=93:
> > > On Fri, 26 Mar 2021, Howard Spoelstra wrote:
> > >> On Fri, Mar 26, 2021 at 2:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >>>
> > >>> Hi Howard,
> > >>>
> > >>> On Fri, Mar 26, 2021 at 1:35 AM Peter Maydell
> > >>> <peter.maydell@linaro.org> wrote:
> > >>>>
> > >>>> (adding the relevant people to the cc list)
> > >>>>
> > >>>> On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com=
>
> > >>>> wrote:
> > >>>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> When running qemu-system-ppc with Mac OS guest, the guest crashes
> > >>>>> when
> > >>>>> using a tap network connection. Openvpn 2.4.9-I601-win10 is insta=
lled
> > >>>>> with TAP-Windows 9.24.2. A tap connection called TapQemu is bridg=
ed
> > >>>>> with the default ethernet connection. It gets activated when I st=
art
> > >>>>> qemu.
> > >>>>>
> > >>>>> To reproduce, compile qemu-system-ppc from current source and run=
:
> > >>>>>
> > >>>>> qemu-system-ppc.exe ^
> > >>>>> -L pc-bios ^
> > >>>>> -M mac99 ^
> > >>>>> -m 128 ^
> > >>>>> -sdl -serial stdio ^
> > >>>>> -boot c ^
> > >>>>> -drive file=3DC:\Mac-disks\9.2.img,format=3Draw,media=3Ddisk ^
> > >>>>> -device sungem,netdev=3Dnetwork01 -netdev
> > >>>>> tap,ifname=3DTapQemu,id=3Dnetwork01
> > >>>>>
> > >>>>> I bisected to the commit below. Thanks for looking into this.
> > >>>
> > >>> Thanks for reporting.
> > >>>
> > >>> Can you please provide some further information:
> > >>>
> > >>> 1. Does "-net user" work on Windows?
> > >>> 2. If running QEMU under Linux, does "-net tap" or "-net user" work=
?
> > >>>
> > >>> Regards,
> > >>> Bin
> > >>
> > >> Hello Bin,
> > >>
> > >> Thanks for getting back to me. I forgot to mention that reverting th=
e
> > >> above patch restores functionality. And that other applications usin=
g
> > >> the same tap device work correctly.
> > >> In answer to your questions:
> > >>
> > >> 1. Yes, slirp works on Windows 10 with this setup.
> > >> 2. Yes, in Linux both tap and slirp work.
> > >>
> > >> My Windows build is done with a fully up to date msys2 installation.
> > >>
> > >> I tried to debug in Windows:
> > >> (gdb) run
> > >> Starting program: c:\qemu-master-msys2\qemu-system-ppc.exe -L pc-bio=
s
> > >> -M mac99 -m 128 -sdl -serial stdio -boot c -drive
> > >> "file=3DC:\Mac-disks\9.2-usb-pci-ddk.img,format=3Draw,media=3Ddisk" =
-device
> > >> "sungem,netdev=3Dnetwork01" -netdev "tap,ifname=3DTapQemu,id=3Dnetwo=
rk01" -S
> > >> [New Thread 13304.0x1f00]
> > >> [New Thread 13304.0x2f84]
> > >> [New Thread 13304.0x3524]
> > >> [New Thread 13304.0x2b8c]
> > >> [New Thread 13304.0x368c]
> > >> [New Thread 13304.0x3668]
> > >> [New Thread 13304.0xf4c]
> > >> [New Thread 13304.0x49c]
> > >> [New Thread 13304.0x1d4c]
> > >> [New Thread 13304.0x7fc]
> > >> [Thread 13304.0x7fc exited with code 0]
> > >> [New Thread 13304.0x357c]
> > >> [New Thread 13304.0x7c0]
> > >> [New Thread 13304.0x3564]
> > >> [New Thread 13304.0x26f4]
> > >> [New Thread 13304.0x2f68]
> > >>
> > >> Program received signal SIGSEGV, Segmentation fault.
> > >> 0x00007ffb9edea991 in ?? () from c:\qemu-master-msys2\libglib-2.0-0.=
dll
> > >> (gdb) bt
> > >> #0  0x00007ffb9edea991 in ?? () from
> > >> c:\qemu-master-msys2\libglib-2.0-0.dll
> > >> #1  0x000800000480bf50 in ?? ()
> > >> Backtrace stopped: previous frame inner to this frame (corrupt stack=
?)
> > >> (gdb)
> > >>
> > >> Even before I could attach to the process.
> > >
> > > If you run QEMU under gdb you don't have to attach to it but to get a
> > > meaningful backtrace you should configure and compile QEMU with
> > > --enable-debug (this will make it run slower so not recommended
> > > normally but for debugging that would be needed). If the stack is
> > > really corrupted then you may not get a useful backtrace or it may be
> > > a problem with gdb on Windows. I've found that gdb on Windows works
> > > for simple things but could give bad results for more complex stuff.
> > > WinDbg may be better but it's harder to use (needs some registry
> > > change I think to enable core dumps then you could open and analyze
> > > core dumps with it or it should be able to run command directly but I
> > > don't know how that works).
> > >
> > > Another idea: maybe you could check other threads in gdb. Not sure if
> > > that would reveal anything but may worth a try. I think the commands
> > > you need are "info threads" and "apply all bt" or something similar.
> > >
> > > Regards,
> > > BALATON Zoltan
> > >
> >
> > It looks to me the patch tires to recycle a temporary buffer to tap thr=
ead.
> >
> > Please try to attached fix to see it if works.
>
> Yep, good catch, thanks! This patch looks correct to me.
>
> Regards,
> Bin

Hi,

While the patch applies, it will not compile:

../net/tap-win32.c: In function 'tap_win32_send':
../net/tap-win32.c:697:18: error: assignment to 'uint8_t' {aka
'unsigned char'} from 'uint8_t *' {aka 'unsigned char *'} makes
integer from pointer without a cast [-Werror=3Dint-conversion]
  697 |         orig_buf =3D buf;
      |                  ^
../net/tap-win32.c:707:42: error: passing argument 2 of
'tap_win32_free_buffer' makes pointer from integer without a cast
[-Werror=3Dint-conversion]
  707 |         tap_win32_free_buffer(s->handle, orig_buf);
      |                                          ^~~~~~~~
      |                                          |
      |                                          uint8_t {aka unsigned char=
}
../net/tap-win32.c:590:44: note: expected 'uint8_t *' {aka 'unsigned
char *'} but argument is of type 'uint8_t' {aka 'unsigned char'}
  590 |                                   uint8_t *pbuf)
      |                                   ~~~~~~~~~^~~~


Best,
Howard

