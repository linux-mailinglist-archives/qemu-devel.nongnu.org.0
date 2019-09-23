Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56FBBBAD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 20:36:21 +0200 (CEST)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCTC8-0001Ug-8E
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 14:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <incredible.tack@gmail.com>) id 1iCT8O-00089j-IQ
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <incredible.tack@gmail.com>) id 1iCT8N-00017o-6f
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:32:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <incredible.tack@gmail.com>)
 id 1iCT8M-000176-KH
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:32:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a11so15164612wrx.1
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d29nEeB5YOryZYGlPO9m05KJLr76l1/0Bo8CSidxGFE=;
 b=T2Z2WF5HXVcxv/cYhsuNu1iddHRgZJYqcyvjmtR8oy381mO1/sdFgyVcvmXp2ydyQq
 lz0C+1YtLZE4bpwc+XCGBrWbQDnby36n14lmm/Kkc4CaWLZ1RjCOnVLsIAxkgOaLUa6A
 SSIdxQo8UEUNZnrqIBmpb6SV9sLmpkCiOnUwiC8CYEO3da55gZLCbVR/c9ahSTGhQKJ3
 sn3KtpNMrTJOI0jXVC+TmuiPRlNE8wmB523rEOkQfLdebVSw7XPro8KplwAvxZjxqKx0
 bLAmYwSE/8QK5qMXFZyHC/Jwu/HM+C3F7xik23FojoZJ7JwpuL8QLbeCMX+8YXfn0l2Q
 fNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d29nEeB5YOryZYGlPO9m05KJLr76l1/0Bo8CSidxGFE=;
 b=c48zab1OJtTP2AAC3l1P7aCEx0TPUWxbxQUfccug6hdGIl1M2zqpXF678JwrIybs4R
 R0VrzgFkfzbJG3Ps+ZQ7KJz4/1N9jrDxTuYuLVYlLhsX/nNzwy6zf55h+KewWnynipKi
 Vy9F+L7ykEwXvN8Jb0W7Y/6ZIkn0EdeC+q+7Pff0uUeNMrNYOxEteMm7N5981L157Hk9
 WNHOggdPRtMqRE4IsvlK9Mbgi9mG5Zp3ql4wB5Z6YQf2nOFF1hh6TYbCvsdXGtva+Tfd
 8egeezM6NM9RtXD4l3bM+RTou0E/DKM07Cg6kCp+hQKlRGxMKr0CNz7YVoankX18GE2q
 /yKQ==
X-Gm-Message-State: APjAAAWZNF/qeXzP0bBIqBG4/0T9+/wS1pTvIumEPjEAwrme1Xlim5Wq
 Axti5oTaqHXh2ImwZ9Vahk2BUBE/wUUqqkuYhvG97mBX
X-Google-Smtp-Source: APXvYqz36W4x8nOOFj8gvIu8tKq8Tu4VPM8cFjMmwXJjNcy2RQjE8Lp9VnPVjvpgyYKcOOUm46fh1pNnDMBec0bjCY4=
X-Received: by 2002:adf:ee45:: with SMTP id w5mr629647wro.246.1569263544918;
 Mon, 23 Sep 2019 11:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHyh4xhYrUbK0aEJmKp3_kOJG2E+AQLMUjyf7_pXVJgbqgv5JA@mail.gmail.com>
 <20190923104245.GA2866@work-vm>
In-Reply-To: <20190923104245.GA2866@work-vm>
From: Jintack Lim <incredible.tack@gmail.com>
Date: Mon, 23 Sep 2019 11:32:13 -0700
Message-ID: <CAHyh4xiocOEqUxhL9LBuNxRHP1XQq5LT9j873KTUdv4CP_o+cQ@mail.gmail.com>
Subject: Re: Migration failure when running nested VMs
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 23, 2019 at 3:42 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Jintack Lim (incredible.tack@gmail.com) wrote:
> > Hi,
>
> Copying in Paolo, since he recently did work to fix nested migration -
> it was expected to be broken until pretty recently; but 4.1.0 qemu on
> 5.3 kernel is pretty new, so I think I'd expected it to work.
>

Thank you, Dave. What Paolo proposed make migration work!

> > I'm seeing VM live migration failure when a VM is running a nested VM.
> > I'm using latest Linux kernel (v5.3) and QEMU (v4.1.0). I also tried
> > v5.2, but the result was the same. Kernel versions in L1 and L2 VM are
> > v4.18, but I don't think that matters.
> >
> > The symptom is that L2 VM kernel crashes in different places after
> > migration but the call stack is mostly related to memory management
> > like [1] and [2]. The kernel crash happens almost all the time. While
> > L2 VM gets kernel panic, L1 VM runs fine after the migration. Both L1
> > and L2 VM were doing nothing during migration.
> >
> > I found a few clues about this issue.
> > 1) It happens with a relatively large memory for L1 (24G), but it does
> > not with a smaller size (3G).
> >
> > 2) Dead migration worked; when I ran "stop" command in the qemu
> > monitor for L1 first and did migration, migration worked always. It
> > also worked when I only stopped L2 VM and kept L1 live during the
> > migration.
> >
> > With those two clues, I guess maybe some dirty pages made by L2 are
> > not transferred to the destination correctly, but I'm not really sure.
> >
> > 3) It happens on Intel(R) Xeon(R) Silver 4114 CPU, but it does not on
> > Intel(R) Xeon(R) CPU E5-2630 v3 CPU.
> >
> > This makes me confused because I thought migrating nested state
> > doesn't depend on the underlying hardware.. Anyways, L1-only migration
> > with the large memory size (24G) works on both CPUs without any
> > problem.
> >
> > I would appreciate any comments/suggestions to fix this problem.
>
> Can you share the qemu command lines you're using for both L1 and L2
> please ?

Sure. I use the same QEMU command line for L1 and L2 except for cpu
and memory allocation.

This is the one for running L1, and I use smaller cpu and memory size for L2.
./qemu/x86_64-softmmu/qemu-system-x86_64 -smp 6 -m 24G -M
q35,accel=kvm -cpu host -drive
if=none,file=/vm_nfs/guest0.img,id=vda,cache=none,format=raw -device
virtio-blk-pci,drive=vda --nographic -qmp
unix:/var/run/qmp,server,wait -serial mon:stdio -netdev
user,id=net0,hostfwd=tcp::2222-:22 -device
virtio-net-pci,netdev=net0,mac=de:ad:be:ef:f2:12 -netdev
tap,id=net1,vhost=on,helper=/srv/vm/qemu/qemu-bridge-helper -device
virtio-net-pci,netdev=net1,disable-modern=off,disable-legacy=on,mac=de:ad:be:ef:f2:11
-monitor telnet:127.0.0.1:4444,server,nowait

> Are there any dmesg entries around the time of the migration on either
> the hosts or the L1 VMs?

No, I didn't see anything special in L0 or L1 kernel log.

> What guest OS are you running in L1 and L2?
>

I'm using Linux v4.18 both in L1 and L2.

Thanks,
Jintack

> Dave
>
> > Thanks,
> > Jintack
> >
> >
> > [1]https://paste.ubuntu.com/p/XGDKH45yt4/
> > [2]https://paste.ubuntu.com/p/CpbVTXJCyc/
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

