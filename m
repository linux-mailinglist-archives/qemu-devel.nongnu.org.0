Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC222C6C83
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 21:22:00 +0100 (CET)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kikFj-00078H-05
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 15:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kikEd-0006fZ-IL
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 15:20:51 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jannh@google.com>) id 1kikEb-0002L7-1f
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 15:20:51 -0500
Received: by mail-lf1-x142.google.com with SMTP id s27so8631773lfp.5
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wq5aPWBOYfgE0ikLgKOb/75PgZgI1EkZa0hkLcr2E6E=;
 b=LIRHhHFIkM/Wpdo44zJO/nUYNrS+gJ0aecPyjsSYd8yPt5l7XJsEgxH6VluvZ0l2c8
 SxkO84qW52Zqb3ZiSgF1lDgqzBV+MlcdgFO3ZowglCYgd+BRmFg17FEnlLafGdblK5s/
 B3QPELYXQKnl2eFyB+OjIbaxgEFtKKGHdr8XwYWm3WPMSSRAPPhdzcrwFHF+Z9+4GLDh
 qeBz/MGtUfU/PYmoBosJRa8XkQ4ACohZRg7L17a0lN10TaXaWR+qqvoYi1QWNBpX7P4C
 L+CeuduU0Y40aOHEfYkSzUJUpJHJtMDynlFnqLlaOH1tlUe6LxUwKpbUA3YkNI+Mk5wH
 CfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wq5aPWBOYfgE0ikLgKOb/75PgZgI1EkZa0hkLcr2E6E=;
 b=fdX7Igp4v/7z6CoHn9bbxmLnWM/LRdqp5no+JaUewAjThxdeVvd5VHooXPPfslVtaB
 lG5+Gp+p16Q9fJxpk8oX1i5sdeI5iGsRj9GsCfM4mmoGxnX4KGzbswDC70eMfMmecwhT
 H0UkO+uhQcMPfpT5qdiqMbB2h9RssYE+t3yER2Ead1RMKsTokFtDXBcwYXUjWAOFsX2r
 bC84IvN4CNUZuff2XlkWgSgrnhGLfHSvlYOqOSAq37pLr/ACTWST+lKfSovTClXOM/qG
 ScbYmL71EFdsRyK4PxtNp3+9e8LTOAZ4gA4BRs3Eig/KfqwX8XSrUxtLzMFbkQcxC1tH
 Vz2A==
X-Gm-Message-State: AOAM53334LCBLKUZ5QnICE6Kse8bXdxo+CfCqEqOvii94iUuGrRQIK5l
 MpReRYPAvTWI8kKVbN3R1rSyWjM5KVV9/h2RDt1WVg==
X-Google-Smtp-Source: ABdhPJyiw7lwgD7IoK6mA6mBXxN3hEsO6avakTr/7wyhqC2uMw7qd0GXA+MXPFHMDZckGCqsV53ONzvSTrdB21Gj/Ek=
X-Received: by 2002:a19:8c13:: with SMTP id o19mr4194624lfd.573.1606508446532; 
 Fri, 27 Nov 2020 12:20:46 -0800 (PST)
MIME-Version: 1.0
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
 <CAG48ez13ZAAOVmA89PRKRqr9UezV2_bj8Q6_6sSPzcqfzbsuQQ@mail.gmail.com>
 <e4acbcdb-7ee4-5dfb-ffbf-19eb49cef9c6@amazon.com>
In-Reply-To: <e4acbcdb-7ee4-5dfb-ffbf-19eb49cef9c6@amazon.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 27 Nov 2020 21:20:19 +0100
Message-ID: <CAG48ez2akv0pGSt084sNHtESbjJNXpx=Ko86JEsyZM24+5zLqw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc: "Graf (AWS), Alexander" <graf@amazon.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Willy Tarreau <w@1wt.eu>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, 
 Andy Lutomirski <luto@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>, 
 "Woodhouse, David" <dwmw@amazon.co.uk>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Singh, Balbir" <sblbir@amazon.com>, 
 "Weiss, Radu" <raduweis@amazon.com>, "oridgar@gmail.com" <oridgar@gmail.com>, 
 "ghammer@redhat.com" <ghammer@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Qemu Developers <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Linux API <linux-api@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 "areber@redhat.com" <areber@redhat.com>, 
 Pavel Emelyanov <ovzxemul@gmail.com>, Andrey Vagin <avagin@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
 "gil@azul.com" <gil@azul.com>, "asmehra@redhat.com" <asmehra@redhat.com>, 
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=jannh@google.com; helo=mail-lf1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 8:04 PM Catangiu, Adrian Costin
<acatan@amazon.com> wrote:
> On 27/11/2020 20:22, Jann Horn wrote:
> > On Fri, Nov 20, 2020 at 11:29 PM Jann Horn <jannh@google.com> wrote:
> >> On Mon, Nov 16, 2020 at 4:35 PM Catangiu, Adrian Costin
> >> <acatan@amazon.com> wrote:
> >>> This patch is a driver that exposes a monotonic incremental Virtual
> >>> Machine Generation u32 counter via a char-dev FS interface that
> >>> provides sync and async VmGen counter updates notifications. It also
> >>> provides VmGen counter retrieval and confirmation mechanisms.
> >>>
> >>> The hw provided UUID is not exposed to userspace, it is internally
> >>> used by the driver to keep accounting for the exposed VmGen counter.
> >>> The counter starts from zero when the driver is initialized and
> >>> monotonically increments every time the hw UUID changes (the VM
> >>> generation changes).
> >>>
> >>> On each hw UUID change, the new hypervisor-provided UUID is also fed
> >>> to the kernel RNG.
> >> As for v1:
> >>
> >> Is there a reasonable usecase for the "confirmation" mechanism? It
> >> doesn't seem very useful to me.
>
> I think it adds value in complex scenarios with multiple users of the
> mechanism, potentially at varying layers of the stack, different
> processes and/or runtime libraries.
>
> The driver offers a natural place to handle minimal orchestration
> support and offer visibility in system-wide status.
>
> A high-level service that trusts all system components to properly use
> the confirmation mechanism can actually block and wait patiently for the
> system to adjust to the new world. Even if it doesn't trust all
> components it can still do a best-effort, timeout block.

What concrete action would that high-level service be able to take
after waiting for such an event?

My model of the vmgenid mechanism is that RNGs and cryptographic
libraries that use it need to be fundamentally written such that it is
guaranteed that a VM fork can not cause the same random number /
counter / ... to be reused for two different cryptographic operations
in a way visible to an attacker. This means that e.g. TLS libraries
need to, between accepting unencrypted input and sending out encrypted
data, check whether the vmgenid changed since the connection was set
up, and if a vmgenid change occurred, kill the connection.

Can you give a concrete example of a usecase where the vmgenid
mechanism is used securely and the confirmation mechanism is necessary
as part of that?

> >> How do you envision integrating this with libraries that have to work
> >> in restrictive seccomp sandboxes? If this was in the vDSO, that would
> >> be much easier.
>
> Since this mechanism targets all of userspace stack, the usecase greatly
> vary. I doubt we can have a single silver bullet interface.
>
> For example, the mmap interface targets user space RNGs, where as fast
> and as race free as possible is key. But there also higher level
> applications that don't manage their own memory or don't have access to
> low-level primitives so they can't use the mmap or even vDSO interfaces.
> That's what the rest of the logic is there for, the read+poll interface
> and all of the orchestration logic.

Are you saying that, because people might not want to write proper
bindings for this interface while also being unwilling to take the
performance hit of calling read() in every place where they would have
to do so to be fully correct, you want to build a "best-effort"
mechanism that is deliberately designed to allow some cryptographic
state reuse in a limited time window?

> Like you correctly point out, there are also scenarios like tight
> seccomp jails where even the FS interfaces is inaccessible. For cases
> like this and others, I believe we will have to work incrementally to
> build up the interface diversity to cater to all the user scenarios
> diversity.

It would be much nicer if we could have one simple interface that lets
everyone correctly do what they need to, though...

