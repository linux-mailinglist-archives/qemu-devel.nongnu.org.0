Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387594AAC9C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 22:06:42 +0100 (CET)
Received: from localhost ([::1]:42656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGSGW-0002sy-SE
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 16:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGSFK-00026W-RP
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 16:05:26 -0500
Received: from [2a00:1450:4864:20::435] (port=40816
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGSFJ-00009g-11
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 16:05:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id s18so17758433wrv.7
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 13:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ikzjW9b7PUqvYV1AwH+dsfVXwCOwuV18VpPP3htuoiw=;
 b=lvZUn9VoX+386cMVvc8i8TuXnba0Ciz1SVV7+RQqrG8aM+jYVsOX3QxuDIrmFofHAu
 E4ZYwBpY/ZRoLtr7DISmjjNwxvcvhfsHf9LRE5C7cpVxCogvZIrEmj3M137PZN+v0xh+
 ZaUc0XWIQzOLai+MxlBZ59Y6qLC5PNWy8mCudg2TG6nHHJGYY2sBpFP8AujDZjZyJKq9
 JjEL6X/iFR3p+h6xYbH6KdUOZe4+gz+lHpfQrM+2c86BIlbwNZveushs5CQaaygr2DIU
 9MzRxEYHD5an6nX1IHtehhPPQbbZAW0PaViaCssj/0DTezmsZOecxrHTuJOkVf8DyKdj
 cosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ikzjW9b7PUqvYV1AwH+dsfVXwCOwuV18VpPP3htuoiw=;
 b=j0h+OpMXHojzBWOJAccnA8/yMIH0fgvmBy4q5gSr6djBKhc8H4WMFmisIE9Dy2MBHi
 lLxlZPVi19kv6bp/hqIwpog8PMT9X8haKQRBtHR3DM/xmM+cNcC/pz2cMGt3SFz2Hbuq
 7LshVSkr/eOWr8XO4o9r3n9J/T2w8/XoTlya+fR9k9UlYyv6Zt7ZW4Jp+1/bL9scwB2E
 x9d5J7W77FDKCIb6Ea/BAn7pZRM1nWk6IJtw9pKRc1CmvwaqP0T1qdGHs3qbQ2z/E/oE
 CVtPiOG0ptmpaqh6oyVK0/95JL9F5hXAbQXArFkBkmcDHd+Qzc+AzRkDI2YoSKkO+w1A
 raKQ==
X-Gm-Message-State: AOAM5328nOxnDBS1NCHAuoq6lq9S0g35RxNt0Wxis+4TmbiAr9Cf5gsp
 5yc5/mov0Cz461rBKStSqBuBqx7QjyaMc4IlURXAoA==
X-Google-Smtp-Source: ABdhPJx571HcGLEQ/JUm/i7lm2e395HcolZzSgsSb0ejHQQSQr2U3q5syn5yqVAQuhgSr+/i81fuOO3BuutKBGooa6I=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr4356831wry.319.1644095123375; 
 Sat, 05 Feb 2022 13:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
 <20220205072452-mutt-send-email-mst@kernel.org>
 <CAFEAcA-RJ8OkwaXWx=bRHJCDoWrQvZbdSEuuyz1j9ZFod0kcfg@mail.gmail.com>
 <20220205124235-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220205124235-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 21:05:12 +0000
Message-ID: <CAFEAcA_kbt0HOp=8w--ZR9g+EgZvownyrbWYseSxuArd1g4CBw@mail.gmail.com>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 at 17:42, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Feb 05, 2022 at 01:31:17PM +0000, Peter Maydell wrote:
> > On Sat, 5 Feb 2022 at 12:25, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sat, Feb 05, 2022 at 11:07:33AM +0000, Peter Maydell wrote:
> > > > Fails to compile for 32-bit, Windows and macos because of format
> > > > string issues in hmp-cmds.c. Here's a sample job with the errors:
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/2058116754593a84174b0
> >
> > > Just re-pushed with a fixup patch. Can you try again pls?
> >
> > Tag still seems to be pointing at 593a84174b0 ?

>
> my bad. pushed a the tag now.

Please can you squash fixes into the offending commits rather than
adding a fixup patch at the end? Otherwise it breaks bisection.

There are also further build failures. On Windows:
https://gitlab.com/qemu-project/qemu/-/jobs/2058536550

In file included from ../hw/acpi/erst.c:16:
/builds/qemu-project/qemu/include/qemu/osdep.h:76: error:
"__USE_MINGW_ANSI_STDIO" redefined [-Werror]
76 | #define __USE_MINGW_ANSI_STDIO 1
|
In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/corecrt.h:10,
from /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10,
from /usr/i686-w64-mingw32/sys-root/mingw/include/sys/types.h:13,
from ../hw/acpi/erst.c:12:
/usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:435: note: this
is the location of the previous definition
435 | #define __USE_MINGW_ANSI_STDIO 0 /* was not defined so it should be 0 */
|

This is because erst.c is incorrectly including other header files
before osdep.h.

On msys2, some dubious casting:

https://gitlab.com/qemu-project/qemu/-/jobs/2058536622

../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
| ^
../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
| ^
../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
| ^
cc1.exe: all warnings being treated as errors

On the build-tsan and build-cfi-x86_64 jobs and also on macos
(this is a "clang is pickier than gcc about unused functions" one):
https://gitlab.com/qemu-project/qemu/-/jobs/2058536617
https://gitlab.com/qemu-project/qemu/-/jobs/2058536571

../tests/qtest/erst-test.c:91:20: error: unused function 'out_reg64'
[-Werror,-Wunused-function]
static inline void out_reg64(ERSTState *s, unsigned reg, uint64_t v)
^

On build-system-centos, a link failure:
https://gitlab.com/qemu-project/qemu/-/jobs/2058536558

libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
`qmp_decode_features':
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
collect2: error: ld returned 1 exit status

thanks
-- PMM

