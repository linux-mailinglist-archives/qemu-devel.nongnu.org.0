Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152662300F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnnO-0004WD-FG; Wed, 09 Nov 2022 11:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1osnn5-0004Sc-PI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:19:14 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1osnn0-0005R0-AB
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:19:02 -0500
Received: by mail-qt1-x831.google.com with SMTP id cg5so10588179qtb.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9HfPpwNXa4Qy+v8OLzjPt7izXA0nvywGhlFvlRBh6g=;
 b=DJbl2X07Ch197aKSpRCQ5D1gB0kfB6CCHJ5Lk81/ma5MWfrizzH0bgpN6Z2/8dyU4g
 lBwyD2DeuDsetBnD9aW0L7h2J7leBhxMnf9ZXBgLSIvknqborVOtgwloO1he1eImNifM
 +AwB9S7easWu1vO6J7BBLUhmrsVeBTKm1+yCq73Ka2rN2AMx0w6Q3vQRuMWrMw9y2lLj
 A75EN6245x4AsO8bPyRSB7AmKqYkWsR+PzkLBTetdx5BKFytczLqKNp2j4qyAjfOAdWU
 I56QL4d/8pDz9gkVtZt7fL/BuzQOSV7OvsJdFd+khVnimsao/EB0sn/VtH8jg2KZ0Oqk
 8i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9HfPpwNXa4Qy+v8OLzjPt7izXA0nvywGhlFvlRBh6g=;
 b=VtgYxUnplh+Ch/k1tZSPAJQYS2o0mVFbi+osxrQFO/KMa9PTLLiG3I4BYAcXSjRexA
 wFlHap24f6v9+etGqQO3BEWV24IJlA+XphEARjjrpo7mZgFalv9/rEbVsZeZi7dnbX65
 UxsR6e2GNvFWnZcwvAv/ujmtUNCEV2l0uPB1ZFslrS8xNl3a7gvwqCwaLk/me8tRH0Po
 ONFU8Euvgn4QlCWsRj88jdWOLUt7H5WRze8HmLJFreh90kTSVJ1+64Knq7zaNQYfV94O
 Ln86dDmxZgUJTRWWw9FeunmdLoWmrtV3uS3CS/bZIBClDhF0iOl0z/5PbMNkCaxVNBqs
 HyUw==
X-Gm-Message-State: ANoB5plv1/mfFeZA7LtSqqDdpoSUOPgETz+HXx1wvTCfBjaRGGNz9zvf
 uKZ2nTpvqy+jOJSzh1E2wPij6apB0RlqVciio/8=
X-Google-Smtp-Source: AA0mqf7rZhAgexw7MHN+7wwapMZhSYu8j9H7wH3Wghj3ZHci7XrMXUJjrVs3AmWfw9YMI4ZqT5a7yCgMvSyFrkotcvg=
X-Received: by 2002:a05:622a:4cf:b0:3a5:a2b7:3765 with SMTP id
 q15-20020a05622a04cf00b003a5a2b73765mr8182069qtx.334.1668010736979; Wed, 09
 Nov 2022 08:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
 <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
 <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
 <CAA8xKjW0JR-zs+YY5ui+KDhp9yY3AhzmwDaRrCY0GS7kaE2Z+w@mail.gmail.com>
In-Reply-To: <CAA8xKjW0JR-zs+YY5ui+KDhp9yY3AhzmwDaRrCY0GS7kaE2Z+w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Nov 2022 00:18:45 +0800
Message-ID: <CAEUhbmWj=4f8Kn3WLHZFz_LzDoU_yBW7mhvC_mR7Be6JdMFC1A@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Siqi Chen <coc.cyqh@gmail.com>, qemu-devel@nongnu.org, philmd@linaro.org, 
 bin.meng@windriver.com, XRivenDell@outlook.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x831.google.com
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

On Wed, Nov 9, 2022 at 6:10 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> On Wed, Nov 9, 2022 at 10:45 AM Siqi Chen <coc.cyqh@gmail.com> wrote:
> >
> > Hi,
> >
> > >This reproducer does not crash my QEMU. Am I missing anything?
> > I submitted the reproducer. Because the overflow is only one byte, it m=
ay not be detected by the host's heap allocator.  Do you compile your qemu =
with sanitizer?  This is my build configuration: "./configure --target-list=
=3Dx86_64-softmmu --enable-sanitizers"
>
> Right, you need to recompile QEMU with ASAN support. This is an
> excerpt of the stack trace:

Is this documented somewhere? Is fuzzing.rst the right doc for this
feature? Looking at fuzzing.rst it says --enable-sanitizers is
optional.

Turning on --enable-sanitizers makes the build fail:

FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p
-Isubprojects/libvduse -I../subprojects/libvduse
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g
-fsanitize=3Dundefined -fsanitize=3Daddress -U_FORTIFY
_SOURCE -D_FORTIFY_SOURCE=3D2 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -W
old-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
-Wno-missing-include-dirs -Wn
o-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-D_GNU_SOURCE -MD -MQ subprojects/libvduse/libvduse.a.p/libvduse.c.o
-MF subprojects/libvduse/libvduse.a.p/libvduse.c.o.d -o
subprojects/libvduse/libvduse.a
.p/libvduse.c.o -c ../subprojects/libvduse/libvduse.c
In file included from /usr/include/string.h:495,
from ../subprojects/libvduse/libvduse.c:24:
In function =E2=80=98strncpy=E2=80=99,
inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../subprojects/libvduse/=
libvduse.c:1312:5:
/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destination =
size
[-Werror=3Dstringop-truncation]
106 | return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest))=
;
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

I am using GCC 9.4 on Ubuntu 20.04

>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D39159=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address
> 0x615000022880 at pc 0x55b023db5fe1 bp 0x7fffeeef1650 sp
> 0x7fffeeef1648
> WRITE of size 1 at 0x615000022880 thread T0
>     #0 0x55b023db5fe0 in sdhci_write_dataport ../../hw/sd/sdhci.c:562
>     #1 0x55b023dc1cc7 in sdhci_write ../../hw/sd/sdhci.c:1216
>     #2 0x55b024521e01 in memory_region_write_accessor ../../softmmu/memor=
y.c:492
>     #3 0x55b0245222ab in access_with_adjusted_size ../../softmmu/memory.c=
:554
>     #4 0x55b02452ff15 in memory_region_dispatch_write
> ../../softmmu/memory.c:1514
>     #5 0x55b024568c67 in flatview_write_continue ../../softmmu/physmem.c:=
2814
>     #6 0x55b02456908d in flatview_write ../../softmmu/physmem.c:2856
>     #7 0x55b024569a74 in address_space_write ../../softmmu/physmem.c:2952
>     #8 0x55b02457a63c in qtest_process_command ../../softmmu/qtest.c:538
>     #9 0x55b02457ef97 in qtest_process_inbuf ../../softmmu/qtest.c:796
>     #10 0x55b02457f089 in qtest_read ../../softmmu/qtest.c:808
>     #11 0x55b0249d4372 in qemu_chr_be_write_impl ../../chardev/char.c:201
>     #12 0x55b0249d4414 in qemu_chr_be_write ../../chardev/char.c:213
>     #13 0x55b0249db586 in fd_chr_read ../../chardev/char-fd.c:72
>     #14 0x55b02466ba5b in qio_channel_fd_source_dispatch
> ../../io/channel-watch.c:84
>     #15 0x7f88093af0ae in g_main_context_dispatch
> (/lib64/libglib-2.0.so.0+0x550ae)
>     #16 0x55b024c5ff14 in glib_pollfds_poll ../../util/main-loop.c:297
>     #17 0x55b024c600fa in os_host_main_loop_wait ../../util/main-loop.c:3=
20
>     #18 0x55b024c603f3 in main_loop_wait ../../util/main-loop.c:596
>     #19 0x55b023fcca21 in qemu_main_loop ../../softmmu/runstate.c:726
>     #20 0x55b023679735 in qemu_main ../../softmmu/main.c:36
>     #21 0x55b023679766 in main ../../softmmu/main.c:45
>     #22 0x7f8808728f5f in __libc_start_call_main (/lib64/libc.so.6+0x40f5=
f)
>     #23 0x7f880872900f in __libc_start_main_impl (/lib64/libc.so.6+0x4100=
f)
>     #24 0x55b023679644 in _start (./qemu-system-x86_64+0x20f2644)
>

Regards,
Bin

