Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9866291202
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 15:25:46 +0200 (CEST)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTmDR-0004bg-VY
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 09:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1kTmCD-00048a-3U
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 09:24:29 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1kTmCB-0007bo-Dq
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 09:24:28 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eea689ab
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uGCG7KNtg2p4bchOTMYLEyZNL+g=; b=QxUmPA
 mGKLUxw8T3WCFlV0XpwpKEj0fsH9rWxbR1s8qeVdIsVRxoYn0Qu7i3QvXemqb6UA
 fYbrwB8JGevznVpLa00KYO2fmQHumHJuYSy6jjVhji4gR/LlzFNK2Wou7HV+gLy+
 4KwI/h+xMMZGKOvyk2K3FbVosThwTVJEPa790gKKGbaiKnXIAdlQfLQBSVFaoe5I
 +6tnhlM1Gu53be2m6+cDvU6p4wJrwXfJ9FtzAC01yf+CsaTu+b75RVlQapwM4Ggk
 AyT7iGA+0UDknsRX9CBK0IqkEMLCEHce1RMYcRDtm6J+7dy+5XEcZezQ61gjqzI6
 zOhO/QG1w5i5FQug==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9056c5d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Sat, 17 Oct 2020 12:50:26 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id k6so7426851ior.2
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 06:24:21 -0700 (PDT)
X-Gm-Message-State: AOAM532Me3FWkdYT1UASn/oDk9wZjQzkl+LPLEp4IHHJc0060LZwrPC7
 wzh5SuCOh735bXNxfHEOfSutP8Fh6bMP7hoIhgM=
X-Google-Smtp-Source: ABdhPJyVxZDidiJqmIZbWDt23iI4Qy6FrajshbbcrzIpyjI66H8R1XUYjnt0B8/rT53Orh6wpTDpZ4jH9cVkio72wDE=
X-Received: by 2002:a05:6638:f03:: with SMTP id
 h3mr5867605jas.36.1602941059429; 
 Sat, 17 Oct 2020 06:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
 <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
 <20201017033606.GA14014@1wt.eu>
 <CAG48ez0x2S9XuCrANAQbXNi8Jjwm822-fnQSmr-Zr07JgrEs1g@mail.gmail.com>
 <6CC3DB03-27BA-4F5E-8ADA-BE605D83A85C@amazon.com>
 <CAG48ez1ZtvjOs2CEq8-EMosPCd_o7WQ3Mz_+1mDe7OrH2arxFA@mail.gmail.com>
 <20201017053712.GA14105@1wt.eu>
 <CAG48ez1h0ynXfGap_KiHiPVTfcB8NBQJ-2dnj08ZNfuhrW0jWA@mail.gmail.com>
 <20201017064442.GA14117@1wt.eu>
 <CAG48ez3pXLC+eqAXDCniM0a+5yP2XJODDkZqiUTZUOttCE_LbA@mail.gmail.com>
In-Reply-To: <CAG48ez3pXLC+eqAXDCniM0a+5yP2XJODDkZqiUTZUOttCE_LbA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 17 Oct 2020 15:24:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9qHGSF8w3DoyCP+ud_N0MAJ5_8zsUWx=rxQB1mFnGcu9w@mail.gmail.com>
Message-ID: <CAHmME9qHGSF8w3DoyCP+ud_N0MAJ5_8zsUWx=rxQB1mFnGcu9w@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=192.95.5.64; envelope-from=Jason@zx2c4.com;
 helo=mail.zx2c4.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 09:24:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 "Weiss, Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Pavel Machek <pavel@ucw.cz>, Colm MacCarthaigh <colmmacc@amazon.com>,
 Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Biggers <ebiggers@kernel.org>, "Singh, Balbir" <sblbir@amazon.com>,
 bonzini@gnu.org, "Graf \(AWS\), Alexander" <graf@amazon.de>, oridgar@gmail.com,
 "Catangiu, Adrian Costin" <acatan@amazon.com>,
 Andy Lutomirski <luto@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Willy Tarreau <w@1wt.eu>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After discussing this offline with Jann a bit, I have a few general
comments on the design of this.

First, the UUID communicated by the hypervisor should be consumed by
the kernel -- added as another input to the rng -- and then userspace
should be notified that it should reseed any userspace RNGs that it
may have, without actually communicating that UUID to userspace. IOW,
I agree with Jann there. Then, it's the functioning of this
notification mechanism to userspace that is interesting to me.

There are a few design goals of notifying userspace: it should be
fast, because people who are using userspace RNGs are usually doing so
in the first place to completely avoid syscall overhead for whatever
high performance application they have - e.g. I recall conversations
with Colm about his TLS implementation needing to make random IVs
_really_ fast. It should also happen as early as possible, with no
race or as minimal as possible race window, so that userspace doesn't
begin using old randomness and then switch over after the damage is
already done.

I'm also not wedded to using Microsoft's proprietary hypervisor design
for this. If we come up with a better interface, I don't think it's
asking too much to implement that and reasonably expect for Microsoft
to catch up. Maybe someone here will find that controversial, but
whatever -- discussing ideal designs does not seem out of place or
inappropriate for how we usually approach things in the kernel, and a
closed source hypervisor coming along shouldn't disrupt that.

So, anyway, here are a few options with some pros and cons for the
kernel notifying userspace that its RNG should reseed.

1. SIGRND - a new signal. Lol.

2. Userspace opens a file descriptor that it can epoll on. Pros are
that many notification mechanisms already use this. Cons is that this
requires syscall and might be more racy than we want. Another con is
that this a new thing for userspace programs to do.

3. We stick an atomic counter in the vDSO, Jann's suggestion. Pros are
that this is extremely fast, and also simple to use and implement.
There are enough sequence points in typical crypto programs that
checking to see whether this counter has changed before doing whatever
operation seems easy enough. Cons are that typically we've been
conservative about adding things to the vDSO, and this is also a new
thing for userspace programs to do.

4. We already have a mechanism for this kind of thing, because the
same issue comes up when fork()ing. The solution was MADV_WIPEONFORK,
where userspace marks a page to be zeroed when forking, for the
purposes of the RNG being notified when its world gets split in two.
This is basically the same thing as we're discussing here with guest
snapshots, except it's on the system level rather than the process
level, and a system has many processes. But the problem space is still
almost the same, and we could simply reuse that same mechanism. There
are a few implementation strategies for that:

4a. We mess with the PTEs of all processes' pages that are
MADV_WIPEONFORK, like fork does now, when the hypervisor notifies us
to do so. Then we wind up reusing the already existing logic for
userspace RNGs. Cons might be that this usually requires semaphores,
and we're in irq context, so we'd have to hoist to a workqueue, which
means either more wake up latency, or a larger race window.

4b. We just memzero all processes' pages that are MADV_WIPEONFORK,
when the hypervisor notifies us to do so. Then we wind up reusing the
already existing logic for userspace RNGs.

4c. The guest kernel maintains an array of physical addresses that are
MADV_WIPEONFORK. The hypervisor knows about this array and its
location through whatever protocol, and before resuming a
moved/snapshotted/duplicated VM, it takes the responsibility for
memzeroing this memory. The huge pro here would be that this
eliminates all races, and reduces complexity quite a bit, because the
hypervisor can perfectly synchronize its bringup (and SMP bringup)
with this, and it can even optimize things like on-disk memory
snapshots to simply not write out those pages to disk.

A 4c-like approach seems like it'd be a lot of bang for the buck -- we
reuse the existing mechanism (MADV_WIPEONFORK), so there's no new
userspace API to deal with, and it'd be race free, and eliminate a lot
of kernel complexity.

But 4b and 3 don't seem too bad either.

Any thoughts on 4c? Is that utterly insane, or does that actually get
us somewhere close to what we want?

Jason

