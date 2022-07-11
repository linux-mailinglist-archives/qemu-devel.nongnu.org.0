Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0AA56D36B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 05:39:24 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAkGY-0001Fy-N9
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 23:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAkEE-0008GY-D4
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 23:37:01 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAkEC-0002Aw-J1
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 23:36:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v21so881070plo.0
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=onm+ZAGhmbqRf+G+a6I1Pg46hcPW9F7CyAaQuCpOSSU=;
 b=kX+RWqPljbiWLIr2rQvaY996K6Vauz4tvAD8oY5OHB0qbL8xrqUvx9DkBm8KkvxswD
 v7RNXr6/l5vXO0P28svXuxVRg8eMjqiEsOxvfzc7b3EKTiB26Y8Rj4yCMtmc2/TLm+66
 n0H1eF8Xg3Yo105o+ve8nJpT3HF4tZ3nVL8k5yOb5n+WWXJIXQRrToEkyIW1u2HHK2zc
 8LcE6n/33OKf7wAlBtiSpBmQ4PDNHZbYrINY86BqOQCEQ9z8bigu2bQt21psyI+FSRSB
 XUArcbZN15y6KRFajz/7ofznOd0brF2gx8seB3nf64yF0esryNVrwMjydm4Bq4QrruOz
 qxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onm+ZAGhmbqRf+G+a6I1Pg46hcPW9F7CyAaQuCpOSSU=;
 b=iKozFNKdNzBD/d51opjbIsXcDSrWa5ZQmhZzxUoY/eeMPEqp3ozUPicjezgShcM9K4
 6niirUKyZWILVWIs8N9ZFXlUeWZ/U5VbBU/yZUXb5dwnm9ciAllNonxd49GO4t3NkSMr
 TBWl5h/CkSYADZmcvK9nWXqr2jq138rCeDBwEl1TxB0gxlHy0o6Itk8wTx/yLXRZEhNW
 yeHqtQUbPm3IJuco4rmTsTKv857s3QbQHETLw1opZzv1Q6UDsGeKJNaYCyKZF/h7MHWg
 YwC6R2S++YPlPbuAT48iyNyXrOpAeIrzgz2ectGNOSD6IZxEkbQpidQ2u1AI13bTwa5A
 xT2Q==
X-Gm-Message-State: AJIora+VH3hgo1c8TBNbVZxMJ9zs7H8W9pysD/rW/RouTnqFP8F1UTnC
 SRuKhPRLCzZP6TIqCO4t/f+VS6d8+YjRunvJgIo=
X-Google-Smtp-Source: AGRyM1sPoFKN9SsggFMyS60OyMKEdIiKE7KOLveWm1mfOnFVQRMuhtax5C2amqJqDg3SKh65dwleYmOt5IiAhBHGs4Y=
X-Received: by 2002:a17:903:2290:b0:16c:33f5:a978 with SMTP id
 b16-20020a170903229000b0016c33f5a978mr9730686plh.121.1657510614995; Sun, 10
 Jul 2022 20:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
 <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
 <CAKmqyKOJFz7i5sORoZ4sbjeLg_=b3=Nim6zfPRK0Dp1w29KfSQ@mail.gmail.com>
 <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
In-Reply-To: <CAHmME9qqOVhKOiCc=UVZcj07GwGFcBJB6UdOY5LXpFpy9GA=Rg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 13:36:28 +1000
Message-ID: <CAKmqyKM16Hjwu1kQgvk-18bSszRKTTvpP7oeZx=hwP-m-KsL-w@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
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

On Mon, Jul 11, 2022 at 10:28 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 7/11/22, Alistair Francis <alistair23@gmail.com> wrote:
> > On Fri, Jul 8, 2022 at 7:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>
> >> Hi Alistair,
> >>
> >> On 7/8/22, Alistair Francis <alistair23@gmail.com> wrote:
> >>
> >> >> > but I think that's just the way things go unfortunately.
> >> >
> >> > Hmm... That's a pain. So there is a bug in older kernels where they
> >> > won't boot if we specify this?
> >> >
> >> > Can you point to the fixes?
> >>
> >> Actually, in trying to reproduce this, I don't actually think this is
> >> affected by those old random.c bugs.
> >>
> >>
> >> >> As for your 5.8 issue, I've been trying to reproduce that to
> >> >> understand
> >> >> more about it, but I'm unable to. I've been trying with
> >> >> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
> >> >> possible in testing this out you were testing the wrong branch?
> >> >> Anyway,
> >> >> it'd be nice to get this queued up...
> >> >
> >> > Hmm... you can't reproduce it?
> >>
> >> No, I can't, and I'm now no longer convinced that there *is* a bug.
> >> Can you try to repro again and send me detailed reproduction steps?
> >
> > I just checked again and I can confirm it is this patch that causes
> > the regression.
> >
> > This is the command line:
> >
> > qemu-system-riscv64 \
> > -machine virt -m 64M \
> > -cpu rv64,mmu=false \
> > -serial mon:stdio -serial null -nographic \
> > -append "root=/dev/vda rw highres=off  console=ttyS0 mem=1G ip=dhcp
> > earlycon=sbi" \
> > -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
> > user,id=net0 \
> > -object rng-random,filename=/dev/urandom,id=rng0 -device
> > virtio-rng-device,rng=rng0 \
> > -smp 1 -d guest_errors \
> > -kernel ./images/qemuriscv64/nommu-Image \
> > -drive
> > id=disk0,file=./images/qemuriscv64/nommu-rootfs.ext2,if=none,format=raw \
> > -device virtio-blk-device,drive=disk0 -bios none
> >
> > You can access the images from:
> > https://nextcloud.alistair23.me/index.php/s/a2zrtbT7DjdTx9t
> >
>
> Thanks. Can you send the kernel . config too?

Unfortunately I don't have it, it should just be the 5.8 no MMU defconfig though

Alistair

>
> Jason

