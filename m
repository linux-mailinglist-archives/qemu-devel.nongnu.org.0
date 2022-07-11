Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB356D22C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 02:27:55 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAhHG-0006cW-1B
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 20:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAhFt-00056w-Fq
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 20:26:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAhFr-0005qJ-LG
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 20:26:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id s21so3499049pjq.4
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 17:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E4yoE21hPRVvYNN/ohZUk69+0+UqiouEl4e2T64QHh0=;
 b=FcMR1t7X2e7wUGigLJXfftKZ1PcMwTdV/GWSQYCDbHHBjf82nR3xxIhAefPjtFJc9w
 ymJHkueqLxlUlgkXc6Rm/JnTS/hpYDZvLhUHXebO51M4q4tkpoNrbFCloWx1YYJaNL8P
 HFKswATIL8+5QAtnniqE96fxuIlpzeC1CbzRJbVqebCmRERhoI24Zac1qbuFxPmdB0Ii
 WnOX6sYD709XPHgGfDdzkZv6g9r0orIv4EYyc/GD2nX6Jh0MuXMu8Sk8S8imhR23l5Jr
 /6i2FAJEXSRUkjBgcFPpzVVVyeNvSK4EHYDOguo8lfvvb4sjfuPYbtqCmeUcDxso6iKO
 idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E4yoE21hPRVvYNN/ohZUk69+0+UqiouEl4e2T64QHh0=;
 b=PFJr/StNDLjiwDQUIYubNxI/YRmFBrdIZueZGUwJGEGfcQEJuzB/cKX9hmwGnzs90N
 dYEXfMujtDMezUGgFTGAZXWXG3cZLWt4nfZ1db7ByH27eMIVjd9MdbUJP2dnmB9L5JP+
 otXIX+H6M7fjfKVe2qSYcsgKPz2p4iQQwSMJzpQsFr6lun6lJKMe82CornQlLbe+7c1X
 S+RFoNGMVKtx81X+MmNFLk37icU6aPMzlqFNZr9V8tJuiaPSAu1FZYzlPzBHaomuQ1e+
 A057Oi5NLTVbZd2Ym6AloAGy3luokLYQvPrcqATydfagI8ZmzOtNrPWgNG4StqlovhT6
 SdJA==
X-Gm-Message-State: AJIora/z0P9QDjfTfPzV9ZnC+fH+DYmaGVR4LPb8TVLOYRFjOrXDON/4
 k7kPJiJ8utLSV9Xll+lUnp2yRS3Tn0jNJNVghEM=
X-Google-Smtp-Source: AGRyM1t5wnynfm/UxB/C1SQ0vas1slCansQy9Vxm86RKsXKVqYq07K1HM025aa4cFhOpD8673UaQhlzYGaktP7VbrvI=
X-Received: by 2002:a17:902:e5d1:b0:16b:ece4:79e6 with SMTP id
 u17-20020a170902e5d100b0016bece479e6mr16371894plf.83.1657499185521; Sun, 10
 Jul 2022 17:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
In-Reply-To: <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 10:25:59 +1000
Message-ID: <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Jul 8, 2022 at 7:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Alistair,
>
> On 7/8/22, Alistair Francis <alistair23@gmail.com> wrote:
>
> >> > but I think that's just the way things go unfortunately.
> >
> > Hmm... That's a pain. So there is a bug in older kernels where they
> > won't boot if we specify this?
> >
> > Can you point to the fixes?
>
> Actually, in trying to reproduce this, I don't actually think this is
> affected by those old random.c bugs.
>
>
> >> As for your 5.8 issue, I've been trying to reproduce that to understand
> >> more about it, but I'm unable to. I've been trying with
> >> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
> >> possible in testing this out you were testing the wrong branch? Anyway,
> >> it'd be nice to get this queued up...
> >
> > Hmm... you can't reproduce it?
>
> No, I can't, and I'm now no longer convinced that there *is* a bug.
> Can you try to repro again and send me detailed reproduction steps?

I just checked again and I can confirm it is this patch that causes
the regression.

This is the command line:

qemu-system-riscv64 \
-machine virt -m 64M \
-cpu rv64,mmu=false \
-serial mon:stdio -serial null -nographic \
-append "root=/dev/vda rw highres=off  console=ttyS0 mem=1G ip=dhcp
earlycon=sbi" \
-device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
user,id=net0 \
-object rng-random,filename=/dev/urandom,id=rng0 -device
virtio-rng-device,rng=rng0 \
-smp 1 -d guest_errors \
-kernel ./images/qemuriscv64/nommu-Image \
-drive id=disk0,file=./images/qemuriscv64/nommu-rootfs.ext2,if=none,format=raw \
-device virtio-blk-device,drive=disk0 -bios none

You can access the images from:
https://nextcloud.alistair23.me/index.php/s/a2zrtbT7DjdTx9t

Alistair

>
> Thanks,
> Jason

