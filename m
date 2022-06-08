Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F7543CFF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:39:06 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz1WD-0000i8-UM
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nz1Ui-00088K-Ae
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:37:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nz1Ug-00005L-MP
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:37:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id q18so18484767pln.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wh6/XuxZPZUDwyzy5Eh7VeXfArKnNs6YeEjpbWE+j5g=;
 b=ZAG/K6D48l0KrmmRn1p2FTmiQngI/15yOkQ8MG3uOIp2K2v36XwQ2z8ZERlay6GUnj
 f6Sg6s8FFS/vw4GmKlcbDU92NrHn2K9bSARE4ICPUYhAVS3ymvr75ETolLgVKsl3A513
 oscCyM1WP/DK5242tikPCpr2E/rKOv00sX5olq99qElwq471NkYsjKcAWArALuZx2UmC
 CgiqYG3dwPpKqe4lLXhreFySMsEDe8d4kPNvglQIKziVC1KrNkNXJk21EPdQMbqcRvJ6
 v8IdnFTEPtFo6VDq8R+YkUgfipwAH1spS4CjC2hG/IiGlAv6nPBHFnuhil0CZaWyp+5b
 sSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wh6/XuxZPZUDwyzy5Eh7VeXfArKnNs6YeEjpbWE+j5g=;
 b=PpF30EweMO4KfD8IUQxUiToumtmcQNVYDIrH2eRIgEDZ7AzzXeLW2MFpWzJXn/wdMk
 NH8bsnV2kOjQntA+TfyLqmXoL2qk47hqL+J25xmvg8rBILJ5QKUvC6w+afly7hsFDjuR
 Rph4dZUpas6gzdwJVmRrlbWDyrSwMVq5coLnM60+ggMzZnSm8mQjXbQ00xiWSHUEbt1f
 57x4bw1vwMF1OWN2xPCDktt108dggL6DPZdvb+2ixV44TL97OXxS2fTDPpcSA1fzeOSJ
 ZuuD5EBX0b59TUVUKykjNkZZOLv8Ph2RrZJXimzzq26zQhzol54pxrmnOFvlStBd2xOv
 yV8w==
X-Gm-Message-State: AOAM530IEf4UeRwhtJVBpiQZMWjphumA0a2Tk0gA+lxj7vdi2dkf0FCK
 X0dWWuTablS2mtpKuhh73+PlP1R31d3PgENJswjksw==
X-Google-Smtp-Source: ABdhPJyfhv1kDe3gJcgewOBnTs26+Uc6YFkqzaIMBY+Sas+MZKd5jC6EwNSmICRKaXBZxv4CUZaYAZlNhfXBPpTEGHU=
X-Received: by 2002:a17:902:f710:b0:15f:165f:b50b with SMTP id
 h16-20020a170902f71000b0015f165fb50bmr36739481plo.158.1654717048302; Wed, 08
 Jun 2022 12:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
In-Reply-To: <20220608021820.GA1548172@chaop.bj.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 8 Jun 2022 12:37:17 -0700
Message-ID: <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Marc Orr <marcorr@google.com>, kvm list <kvm@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86 <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
 Andi Kleen <ak@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=vannapurve@google.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

...
> With this patch series, it's actually even not possible for userspace VMM
> to allocate private page by a direct write, it's basically unmapped from
> there. If it really wants to, it should so something special, by intention,
> that's basically the conversion, which we should allow.
>

A VM can pass GPA backed by private pages to userspace VMM and when
Userspace VMM accesses the backing hva there will be pages allocated
to back the shared fd causing 2 sets of pages backing the same guest
memory range.

> Thanks for bringing this up. But in my mind I still think userspace VMM
> can do and it's its responsibility to guarantee that, if that is hard
> required. By design, userspace VMM is the decision-maker for page
> conversion and has all the necessary information to know which page is
> shared/private. It also has the necessary knobs to allocate/free the
> physical pages for guest memory. Definitely, we should make userspace
> VMM more robust.

Making Userspace VMM more robust to avoid double allocation can get
complex, it will have to keep track of all in-use (by Userspace VMM)
shared fd memory to disallow conversion from shared to private and
will have to ensure that all guest supplied addresses belong to shared
GPA ranges.
A coarser but simpler alternative could be to always allow shared to
private conversion with unbacking the memory from shared fd and exit
if the VMM runs in double allocation scenarios. In either cases,
unbacking shared fd memory ideally should prevent memory allocation on
subsequent write accesses to ensure double allocation scenarios are
caught early.

Regards,
Vishal

