Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED9624EE8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 01:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otHnt-0000w3-C1; Thu, 10 Nov 2022 19:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otHnn-0000vr-Se
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:21:47 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otHnl-0000tY-QF
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:21:47 -0500
Received: by mail-qk1-x72a.google.com with SMTP id v8so2203701qkg.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 16:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5aLWdTXA9dXDsR37bDwRROX4YnoOt+iPce2jf+lRtqA=;
 b=YQ7s9W/fhLZ01iFn0E6QrQup2G90pweKB0R2JaQYwWk889IzU6s+rZKrLKA7p8Ug/m
 Q6U4UTd4kRy091Yo8yvXUCL6v61mMq7KiVsk4Cd6PkRrdqMtYBLusuqK93Q9Si/YzaGP
 KwIokIkbaz5CVYDJNuWNWnKptyGcJkhjTZvKpbXWkLSKHuFExVknv+Vl7GtSiS/Mygc5
 qjU21oKXnhTe3nFPavHtxII1raHYPPlmC+X610E7Ix3Elkb1Z1GyAb/DtkDXK2+500Ic
 rfiD3dCuZvJvddyoUGE+62r9kGYrCFCNqzduRaMj3Sq2+OFmTwjousAbAa76duteJ3Ie
 0Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5aLWdTXA9dXDsR37bDwRROX4YnoOt+iPce2jf+lRtqA=;
 b=vA95KPifmp+dlkV7Sa9fxUv04dsc5aituqlT86JkPy/GvnKqruFaJk5JrbNftEb2gE
 Nn5L0l8q4kII++goEa4JvCPcAbKNAy/+KYk/evWs5GQc+28uA6ZyinhKXJg+6RJ/bJst
 slIg0Yuk5H0tqmQ/mOYnW4/lqht+RXbTsZJy+pqgmRZVvKMu0kngvrSRdKGpGAIuKqVQ
 fmXk8wyt8lnphNGOrXp7JvAMldwhvUyIh3BVGNfXbxkJJrBmUV390Vx9idKwR00+eAUA
 S86pvtvFadr/5HDxR3Spo0IZ1lHpSzDO1oD/bnWv/ty7op98s7FOAEaTh3De0Fjngdn5
 n26g==
X-Gm-Message-State: ACrzQf18OBaH8TuinbjvGD0KwVhyp1BVDZ0es9C54gRtJc3rZky91VFq
 9L2BEz3U8+dzY/MO/GQYNP4xn+4TOsPbsWSt/B8=
X-Google-Smtp-Source: AMsMyM6Z+OUM7zHEKdxBql7Vo6Kth3GLgU+MpF7B9eQ76dtn0ju7pCo4eaGunnXa8PMChAmY7VhNsPlKQyS+ZwOpqQM=
X-Received: by 2002:a37:6897:0:b0:6ec:537f:3d94 with SMTP id
 d145-20020a376897000000b006ec537f3d94mr2395205qkc.376.1668126103412; Thu, 10
 Nov 2022 16:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
 <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
 <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
 <CAA8xKjW0JR-zs+YY5ui+KDhp9yY3AhzmwDaRrCY0GS7kaE2Z+w@mail.gmail.com>
 <CAEUhbmWj=4f8Kn3WLHZFz_LzDoU_yBW7mhvC_mR7Be6JdMFC1A@mail.gmail.com>
 <CAA8xKjV9siB7KCs=Dn9xpoyB74T-YfJmWrq6FA=G48ZsWj4qUA@mail.gmail.com>
In-Reply-To: <CAA8xKjV9siB7KCs=Dn9xpoyB74T-YfJmWrq6FA=G48ZsWj4qUA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Nov 2022 08:21:32 +0800
Message-ID: <CAEUhbmWoKK3i88P5m=vFfBCX-==5s1Ua3OQM0cNWWyKvHQzzqA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Siqi Chen <coc.cyqh@gmail.com>, qemu-devel@nongnu.org, philmd@linaro.org, 
 bin.meng@windriver.com, XRivenDell@outlook.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 2:51 AM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> On Wed, Nov 9, 2022 at 5:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Nov 9, 2022 at 6:10 PM Mauro Matteo Cascella
> > <mcascell@redhat.com> wrote:
> > >
> > > On Wed, Nov 9, 2022 at 10:45 AM Siqi Chen <coc.cyqh@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > >This reproducer does not crash my QEMU. Am I missing anything?
> > > > I submitted the reproducer. Because the overflow is only one byte, =
it may not be detected by the host's heap allocator.  Do you compile your q=
emu with sanitizer?  This is my build configuration: "./configure --target-=
list=3Dx86_64-softmmu --enable-sanitizers"
> > >
> > > Right, you need to recompile QEMU with ASAN support. This is an
> > > excerpt of the stack trace:
> >
> > Is this documented somewhere? Is fuzzing.rst the right doc for this
> > feature? Looking at fuzzing.rst it says --enable-sanitizers is
> > optional.
>
> Not sure it's documented somewhere, this is how I usually compile:
>
> $ ../configure --target-list=3Dx86_64-softmmu --enable-sanitizers
> --extra-cflags=3D-g3 \
>  --enable-kvm --disable-tcg --enable-debug --enable-debug-info --disable-=
werror

Thanks, --disable-werror makes the build pass and I can reproduce this issu=
e.

I can prepare a patch to improve the doc with the build instructions.

>
> Then just run the PoC using ./x86_64-softmmu/qemu-system-x86_64 should
> do the trick.
>
> > Turning on --enable-sanitizers makes the build fail:
> >
> > FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
> > cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p
> > -Isubprojects/libvduse -I../subprojects/libvduse
> > -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2=
 -g
> > -fsanitize=3Dundefined -fsanitize=3Daddress -U_FORTIFY
> > _SOURCE -D_FORTIFY_SOURCE=3D2 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOU=
RCE
> > -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
> > -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> > -Wold-style-declaration -W
> > old-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> > -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> > -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> > -Wno-missing-include-dirs -Wn
> > o-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> > -D_GNU_SOURCE -MD -MQ subprojects/libvduse/libvduse.a.p/libvduse.c.o
> > -MF subprojects/libvduse/libvduse.a.p/libvduse.c.o.d -o
> > subprojects/libvduse/libvduse.a
> > .p/libvduse.c.o -c ../subprojects/libvduse/libvduse.c
> > In file included from /usr/include/string.h:495,
> > from ../subprojects/libvduse/libvduse.c:24:
> > In function =E2=80=98strncpy=E2=80=99,
> > inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../subprojects/libvd=
use/libvduse.c:1312:5:
> > /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
> > =E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destinat=
ion size
> > [-Werror=3Dstringop-truncation]
> > 106 | return __builtin___strncpy_chk (__dest, __src, __len, __bos (__de=
st));
> > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > I am using GCC 9.4 on Ubuntu 20.04
> >
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D39159=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on add=
ress
> > > 0x615000022880 at pc 0x55b023db5fe1 bp 0x7fffeeef1650 sp
> > > 0x7fffeeef1648
> > > WRITE of size 1 at 0x615000022880 thread T0
> > >     #0 0x55b023db5fe0 in sdhci_write_dataport ../../hw/sd/sdhci.c:562
> > >     #1 0x55b023dc1cc7 in sdhci_write ../../hw/sd/sdhci.c:1216
> > >     #2 0x55b024521e01 in memory_region_write_accessor ../../softmmu/m=
emory.c:492
> > >     #3 0x55b0245222ab in access_with_adjusted_size ../../softmmu/memo=
ry.c:554
> > >     #4 0x55b02452ff15 in memory_region_dispatch_write
> > > ../../softmmu/memory.c:1514
> > >     #5 0x55b024568c67 in flatview_write_continue ../../softmmu/physme=
m.c:2814
> > >     #6 0x55b02456908d in flatview_write ../../softmmu/physmem.c:2856
> > >     #7 0x55b024569a74 in address_space_write ../../softmmu/physmem.c:=
2952
> > >     #8 0x55b02457a63c in qtest_process_command ../../softmmu/qtest.c:=
538
> > >     #9 0x55b02457ef97 in qtest_process_inbuf ../../softmmu/qtest.c:79=
6
> > >     #10 0x55b02457f089 in qtest_read ../../softmmu/qtest.c:808
> > >     #11 0x55b0249d4372 in qemu_chr_be_write_impl ../../chardev/char.c=
:201
> > >     #12 0x55b0249d4414 in qemu_chr_be_write ../../chardev/char.c:213
> > >     #13 0x55b0249db586 in fd_chr_read ../../chardev/char-fd.c:72
> > >     #14 0x55b02466ba5b in qio_channel_fd_source_dispatch
> > > ../../io/channel-watch.c:84
> > >     #15 0x7f88093af0ae in g_main_context_dispatch
> > > (/lib64/libglib-2.0.so.0+0x550ae)
> > >     #16 0x55b024c5ff14 in glib_pollfds_poll ../../util/main-loop.c:29=
7
> > >     #17 0x55b024c600fa in os_host_main_loop_wait ../../util/main-loop=
.c:320
> > >     #18 0x55b024c603f3 in main_loop_wait ../../util/main-loop.c:596
> > >     #19 0x55b023fcca21 in qemu_main_loop ../../softmmu/runstate.c:726
> > >     #20 0x55b023679735 in qemu_main ../../softmmu/main.c:36
> > >     #21 0x55b023679766 in main ../../softmmu/main.c:45
> > >     #22 0x7f8808728f5f in __libc_start_call_main (/lib64/libc.so.6+0x=
40f5f)
> > >     #23 0x7f880872900f in __libc_start_main_impl (/lib64/libc.so.6+0x=
4100f)
> > >     #24 0x55b023679644 in _start (./qemu-system-x86_64+0x20f2644)
> > >

Regards,
Bin

