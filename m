Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2276016F6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:10:16 +0200 (CEST)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVV9-0003Bk-PB
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1okVQt-0007ES-Ph
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:05:52 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1okVQs-0000ZE-2m
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:05:51 -0400
Received: by mail-lj1-x231.google.com with SMTP id a25so15193991ljk.0
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tpLbF7MUjfgdwKeolFrKwUGGJvkFHEynVfhNRIRYzO0=;
 b=cTXJI0UBOdBxXG2IHW1rqIDOvBkglMHN1TS3v9u/Mg6E19sNCf3CHq90Ltlb8bjRuV
 uwZxsI3QP9DlzIDrz8Ff7f9zknZmBhB2m3pkIj381yHasQYOvkpoqdJncN9JKC2twFC8
 ShVufGPOkpE2dB+4eCyihCzXtxWBY+X/y95BOpw7uAHWW2nmY6ScgSdvp0Pxz6khfbyi
 YxhW1XKkSTezSkUawIx5/j0VpvJshXk6TJGUrtcsbKTwNFF6pKmyHcosQZh7T9atBa+E
 fdb7oqoR8tN6oS+MAKpeLCi//GJfCoW515YxPGh6OzLSq2gny6eetjefpyJ4o3QbBEiq
 9V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tpLbF7MUjfgdwKeolFrKwUGGJvkFHEynVfhNRIRYzO0=;
 b=uRlc9dEI5r3X69BiSnFzVjeZT6CHGx0YWDTI+ta9GuDSYjxD9HDglaZTTo5HOP4oDJ
 ZnCA0o6LAehrzTW5CZ/OArUHrIBk2zG5dKZl5dql3TNAyNR+N/gox4buVtXcUEbwp1w+
 00sVVUI64OXaxXV/F0kS+9zRWe4fthzOYIX3ar43E3knVmPNtKRjv/UClJS8Q0biDgK3
 ffi6fG/XXqxZePEAy3m9irq6zdV8lMQZXTeXylaUbDgI+SbjPQhy+r33s52fZaLOBKha
 MUAG0givYcY39fP3kqT8lv/Ml8I9El1tCeYDpPa/2VNTFMtvLP0YiWVWGmnqURL1IWcJ
 nZQw==
X-Gm-Message-State: ACrzQf3sqBOZ00rcGh15vyXnutV+skQeDMns9GeNdhfXQG9hFFwfNHSS
 B4f3BtBYd5tTX8HqWLblNiWPhIAOHRKbiouveUJIYA==
X-Google-Smtp-Source: AMsMyM4AkQi9c7U3RtdWYwjcZCizC5KFrocAewLyWt0H2WuNks4/hroyUpSgGTZ2Szy1PxqSxcVc8+OpiywAfS+j4K8=
X-Received: by 2002:a05:651c:20d:b0:26f:bc4c:f957 with SMTP id
 y13-20020a05651c020d00b0026fbc4cf957mr4763341ljn.199.1666033547017; Mon, 17
 Oct 2022 12:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
 <20221013133457.GA3263142@chaop.bj.intel.com>
 <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
 <20221017145856.GB3417432@chaop.bj.intel.com>
In-Reply-To: <20221017145856.GB3417432@chaop.bj.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Oct 2022 20:05:10 +0100
Message-ID: <CA+EHjTyiU230am0cuWc7xBBirGocPWGmyqCskhTytA10xpigYQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=tabba@google.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

Hi,

> > > Using both private_fd and userspace_addr is only needed in TDX and other
> > > confidential computing scenarios, pKVM may only use private_fd if the fd
> > > can also be mmaped as a whole to userspace as Sean suggested.
> >
> > That does work in practice, for now at least, and is what I do in my
> > current port. However, the naming and how the API is defined as
> > implied by the name and the documentation. By calling the field
> > private_fd, it does imply that it should not be mapped, which is also
> > what api.rst says in PATCH v8 5/8. My worry is that in that case pKVM
> > would be mis/ab-using this interface, and that future changes could
> > cause unforeseen issues for pKVM.
>
> That is fairly enough. We can change the naming and the documents.
>
> >
> > Maybe renaming this to something like "guest_fp", and specifying in
> > the documentation that it can be restricted, e.g., instead of "the
> > content of the private memory is invisible to userspace" something
> > along the lines of  "the content of the guest memory may be restricted
> > to userspace".
>
> Some other candidates in my mind:
> - restricted_fd: to pair with the mm side restricted_memfd
> - protected_fd: as Sean suggested before
> - fd: how it's explained relies on the memslot.flag.

All these sound good, since they all capture the potential use cases.
Restricted might be the most logical choice if that's going to also
become the name for the mem_fd.

Thanks,
/fuad

> Thanks,
> Chao
> >
> > What do you think?
> >
> > Cheers,
> > /fuad
> >
> > >
> > > Thanks,
> > > Chao
> > > >
> > > > Cheers,
> > > > /fuad

