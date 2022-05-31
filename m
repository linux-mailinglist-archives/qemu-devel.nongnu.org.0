Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10F538A52
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 06:11:01 +0200 (CEST)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvtDg-0000rA-AU
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 00:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <juew@google.com>) id 1nvtBZ-0008LY-Hv
 for qemu-devel@nongnu.org; Tue, 31 May 2022 00:08:56 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <juew@google.com>) id 1nvtBU-0003P8-6o
 for qemu-devel@nongnu.org; Tue, 31 May 2022 00:08:49 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id u188so5693164vku.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 21:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQayHW7nNYqOEQz5hmBB6KPJg2gTvXgiY+h7JV2fOkA=;
 b=AhkwopzBYexwfn2wdNQMPMJvXNbZpx/ruTfmIJ9yD2VsaE1ZYWfX9bpQJzLLHU5F0c
 YegBb8BGCgPCOeSzLkcePOhvRMLjcQ4iwM86+QsGvjf/QeCOFb7YeXDW6oVuoNxPWmX4
 SuJSUpFZ74ab/Xw/MVYfwX0m/IelcBcAOFrEr32HW51K9Qi+HOdzT+2A6sA79em+2g+B
 0Ra12QVgC16zwJqqaZeJB0R+S2PHg4WyMF71Usm+EjWRTuGMeVgo9+4RlTIw0giMTPe2
 /LLbW0OlcgzsOkfmHQc5GsFGYIJnbAMMcH16tlLTjc782HDRRhklxnUoLIBrpd1oyc1P
 kB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQayHW7nNYqOEQz5hmBB6KPJg2gTvXgiY+h7JV2fOkA=;
 b=qxxwhFwjgJF5N7jAU3yQP91ZoobHHu6t3qmr+77u5IUz4XU7/xs929uvAoPPF0hn98
 cV7k9NdSdqZluH7+bqNrvnF1+D9uikCaO77rz5vEJyhLx7OQ24msTTdR7C4CEjMAyF0Z
 nBcpqPFdv3dtZLz5G6Yz8XGRHewFdfRK6Y+acFIv5EuDEPg6+ZEPN3VOiaOu1s2cNm7g
 gQfL3jSmvNhUV8q4qj/0jmkZyT4hvUYH94yaIKK9sGX2P6LR0AG5ic0Ph2I0nhzshH9n
 tRnObIBAMSiDTokRIIH+YvL0m9XYfp9w0kSaT3aCfBCQPd7so153h2IbMRqZceC+bydA
 iPOw==
X-Gm-Message-State: AOAM531bcxqVNTUne6jXwR/tVJsqDTLyAHf3PD/RkD0L9rjSD6SYEfDq
 bptBj57h8t5casOaLowmHr0gpsYGPQa5AqTJko446g==
X-Google-Smtp-Source: ABdhPJw95u2k3azfz3MpOt9MeKzDgrOacpezxikhMNtQ5znHiZNuct59dPoCLpIWEyjPgIdqi0Y7Z8P/sEm2Xl8Akvc=
X-Received: by 2002:a05:6122:7ca:b0:35c:966b:8729 with SMTP id
 l10-20020a05612207ca00b0035c966b8729mr2534363vkr.27.1653970122433; Mon, 30
 May 2022 21:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
 <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
 <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
 <4b0c3e37-b882-681a-36fc-16cee7e1fff0@bytedance.com>
 <YpTngZ5Qr0KIvL0H@xz-m1.local>
In-Reply-To: <YpTngZ5Qr0KIvL0H@xz-m1.local>
From: Jue Wang <juew@google.com>
Date: Mon, 30 May 2022 21:08:31 -0700
Message-ID: <CAPcxDJ5UMfpys8KyLQVnkV9BPO1vaubxbhc7f4XC_TdNO7jr7g@mail.gmail.com>
Subject: Re: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
To: Peter Xu <peterx@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>, 
 David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, jasowang@redhat.com, 
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, 
 =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= <naoya.horiguchi@nec.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=juew@google.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -96
X-Spam_score: -9.7
X-Spam_bar: ---------
X-Spam_report: (-9.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Mon, May 30, 2022 at 8:49 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, May 30, 2022 at 07:33:35PM +0800, zhenwei pi wrote:
> > A VM uses RAM of 2M huge page. Once a MCE(@HVAy in [HVAx,HVAz)) occurs, the
> > 2M([HVAx,HVAz)) of hypervisor becomes unaccessible, but the guest poisons 4K
> > (@GPAy in [GPAx, GPAz)) only, it may hit another 511 MCE ([GPAx, GPAz)
> > except GPAy). This is the worse case, so I want to add
> >  '__le32 corrupted_pages' in struct virtio_balloon_config, it is used in the
> > next step: reporting 512 * 4K 'corrupted_pages' to the guest, the guest has
> > a chance to isolate the other 511 pages ahead of time. And the guest
> > actually loses 2M, fixing 512*4K seems to help significantly.
>
> It sounds hackish to teach a virtio device to assume one page will always
> be poisoned in huge page granule.  That's only a limitation to host kernel
> not virtio itself.
>
> E.g. there're upstream effort ongoing with enabling doublemap on hugetlbfs
> pages so hugetlb pages can be mapped in 4k with it.  It provides potential
> possibility to do page poisoning with huge pages in 4k too.  When that'll
> be ready the assumption can go away, and that does sound like a better
> approach towards this problem.

+1.

A hypervisor should always strive to minimize the guest memory loss.

The HugeTLB double mapping enlightened memory poisoning behavior (only
poison 4K out of a 2MB huge page and 4K in guest) is a much better
solution here. To be completely transparent, it's not _strictly_
required to poison the page (whatever the granularity it is) on the
host side, as long as the following are true:

1. A hypervisor can emulate the _minimized_ (e.g., 4K) the poison to the guest.
2. The host page with the UC error is "isolated" (could be PG_HWPOISON
or in some other way) and prevented from being reused by other
processes.

For #2, PG_HWPOISON and HugeTLB double mapping enlightened memory
poisoning is a good solution.

>
> >
> > >
> > > I assume when talking about "the performance memory drops a lot", you
> > > imply that this patch set can mitigate that performance drop?
> > >
> > > But why do you see a performance drop? Because we might lose some
> > > possible THP candidates (in the host or the guest) and you want to plug
> > > does holes? I assume you'll see a performance drop simply because
> > > poisoning memory is expensive, including migrating pages around on CE.
> > >
> > > If you have some numbers to share, especially before/after this change,
> > > that would be great.
> > >
> >
> > The CE storm leads 2 problems I have even seen:
> > 1, the memory bandwidth slows down to 10%~20%, and the cycles per
> > instruction of CPU increases a lot.
> > 2, the THR (/proc/interrupts) interrupts frequently, the CPU has to use a
> > lot time to handle IRQ.
>
> Totally no good knowledge on CMCI, but if 2) is true then I'm wondering
> whether it's necessary to handle the interrupts that frequently.  When I
> was reading the Intel CMCI vector handler I stumbled over this comment:
>
> /*
>  * The interrupt handler. This is called on every event.
>  * Just call the poller directly to log any events.
>  * This could in theory increase the threshold under high load,
>  * but doesn't for now.
>  */
> static void intel_threshold_interrupt(void)
>
> I think that matches with what I was thinking..  I mean for 2) not sure
> whether it can be seen as a CMCI problem and potentially can be optimized
> by adjust the cmci threshold dynamically.

The CE storm caused performance drop is caused by the extra cycles
spent by the ECC steps in memory controller, not in CMCI handling.
This is observed in the Google fleet as well. A good solution is to
monitor the CE rate closely in user space via /dev/mcelog and migrate
all VMs to another host once the CE rate exceeds some threshold.

CMCI is a _background_ interrupt that is not handled in the process
execution context and its handler is setup to switch to poll (1 / 5
min) mode if there are more than ~ a dozen CEs reported via CMCI per
second.
>
> --
> Peter Xu
>

