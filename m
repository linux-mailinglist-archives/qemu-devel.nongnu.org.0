Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91B3E1CED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:43:53 +0200 (CEST)
Received: from localhost ([::1]:47506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjHU-0000ya-PQ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1mBjGl-0000GF-NC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:43:07 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hiharryharryharry@gmail.com>)
 id 1mBjGk-0007Qo-5S
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:43:07 -0400
Received: by mail-lf1-x129.google.com with SMTP id bq29so13332231lfb.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+ShchKoXJ5rpWNwI2utssqiWL+MXARNqEb8ZW+Us6o=;
 b=RU5+5gvUiGNAF8RGeG6xZ8DV/G300KTFXqDzTX9vfbZMgQaaeM1riCQapdTkEH0Bi3
 1q55XAD1MjRaJKHhKrDHGv89t4obkQdlGI2FYrRwIcGvfJgJ9oORpcPt/+WOwgQRoWpE
 Jx/9zzaevvYoAPDYTrBsMErXVnD3i5ughdwWZT1TO4Lpr3/HewizzMi8DeUvRLnXeJes
 8jk6VLPSTnPJ4NGbZ932fhnqZchipXaN4SYjRTd/psn+bhPBSsqpehShetyi14OZOdXx
 UvevwZOh1utPk9nGqu9bJtRRySiWMQs6W8kMUCrU8+dRPlnL4t/0r9plP7cSZjFwjQcx
 6uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+ShchKoXJ5rpWNwI2utssqiWL+MXARNqEb8ZW+Us6o=;
 b=fzHWLrSgiBD3BjFG7gkgDHHKJRCDODpHwa5+MIlW61CQNJVYTX2y5QO4tvu6CK2RHG
 iPOGeQ2C1exOrudi5RHqqDwW78c6rsegM0TZNcDYhAzw3BZOJeDRqOJIetzmGOZGUXLd
 dz4MB1utw0aGB18kBhmDZl0HFmYmZ8qJbzLW/S7h6Y5PjCccGLJWnwpbHggN9A4sZUvN
 mlctHTIi9wRvZbcoGqlWJ6b3wREQAmq5cNmLXz8yRUjNJOzqnWIdIEuGUIMmtule8MsT
 eVVJc4KPxURYx0+ojd0uhsqXL2XyLfE3mwsV2Oje3Q+Hx4qq/W9yizSRjRLLepsZvh4j
 Q2kg==
X-Gm-Message-State: AOAM531allqTQgsrRpy3mvTx7on1eBuCYTDlD4AXUR31UVHX9AFwdCGt
 h343ndxNr1bNLtNTLv9Lb0+EqWZUqdHAmHc6dxM=
X-Google-Smtp-Source: ABdhPJwx+VlOnM11q0yv4UYGoZImxBKMvt7gwtzkafrKt8ZPxg6VkBT29T5gD2fslkJSR/soot3gDdrV3e0JTVd44es=
X-Received: by 2002:a05:6512:3b20:: with SMTP id
 f32mr5024335lfv.279.1628192583222; 
 Thu, 05 Aug 2021 12:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
 <YPC1lgV5dZC0CyG0@google.com>
 <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
 <YPiLBLA2IjwovNCP@google.com>
 <CA+-xGqP7=m47cLD65DhTumOF8+sWZvc81gh+04aKMS56WWkVtA@mail.gmail.com>
 <YQG3jg9kSqfzmbPB@google.com>
In-Reply-To: <YQG3jg9kSqfzmbPB@google.com>
From: harry harry <hiharryharryharry@gmail.com>
Date: Thu, 5 Aug 2021 14:42:51 -0500
Message-ID: <CA+-xGqN68MY9Zt0z9ST7GF8=YB=kvMLxGPZpBeGq3knLf9itcw@mail.gmail.com>
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=hiharryharryharry@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, mathieu.tarral@protonmail.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sean, understood with many thanks!

Good luck,
Harry

On Wed, Jul 28, 2021 at 3:01 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Jul 28, 2021, harry harry wrote:
> > Sean, sorry for the late reply. Thanks for your careful explanations.
> >
> > > For emulation of any instruction/flow that starts with a guest virtual address.
> > > On Intel CPUs, that includes quite literally any "full" instruction emulation,
> > > since KVM needs to translate CS:RIP to a guest physical address in order to fetch
> > > the guest's code stream.  KVM can't avoid "full" emulation unless the guest is
> > > heavily enlightened, e.g. to avoid string I/O, among many other things.
> >
> > Do you mean the emulated MMU is needed when it *only* wants to
> > translate GVAs to GPAs in the guest level?
>
> Not quite, though gva_to_gpa() is the main use.  The emulated MMU is also used to
> inject guest #PF and to load/store guest PDTPRs.
>
> > In such cases, the hardware MMU cannot be used because hardware MMU
> > can only translate GVAs to HPAs, right?
>
> Sort of.  The hardware MMU does translate GVA to GPA, but the GPA value is not
> visible to software (unless the GPA->HPA translation faults).  That's also true
> for VA to PA (and GVA to HPA).  Irrespective of virtualization, x86 ISA doesn't
> provide an instruction to retrive the PA for a given VA.
>
> If such an instruction did exist, and it was to be usable for a VMM to do a
> GVA->GPA translation, the magic instruction would need to take all MMU params as
> operands, e.g. CR0, CR3, CR4, and EFER.  When KVM is active (not the guest), the
> hardware MMU is loaded with the host MMU configuration, not the guest.  In both
> VMX and SVM, vCPU state is mostly ephemeral in the sense that it ceases to exist
> in hardware when the vCPU exits to the host.  Some state is retained in hardware,
> e.g. TLB and cache entries, but those are associated with select properties of
> the vCPU, e.g. EPTP, CR3, etc..., not with the vCPU itself, i.e. not with the
> VMCS (VMX) / VMCB (SVM).

