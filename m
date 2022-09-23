Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B65E7E5C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:27:48 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkah-0001dG-PJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1obkUA-0002mT-7Z
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:21:05 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1obkU8-0007fw-21
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:21:01 -0400
Received: by mail-lf1-x12d.google.com with SMTP id a3so782223lfk.9
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=buJ2Vw0w3M4WrtI5/DU3oXsQobrkkmx9rFyElDeN7mE=;
 b=e4OQSAjFu3gpxUO4Unn7HPTzW4khEaeLVPKzk0HjIO1WzfoYTIkCo/F1RYrvwR66SF
 JwCMt5XxADhIKzoYXxMVuOAC/AuI4zxQZgSxUcFBjf8hrr2yXlfmAMcitgt6vZxhWH7Z
 +VIcwj2/Ns3wteLBkCd1UIvA6lB5eXh/e73AYfVmUkfoy7XbWsS6Q2HYL5D+SrhsOsPZ
 qOl0jP48UI31PUrNDZzwE9j3uXZ/4o/lWYfvXhojlsVXKd3GrscU+YcreZEHR9zMjYjf
 xc0uDmUYT7UwO9Q1pGoCLduSZHAasvlCEIMiRTg83bldOSofpAYj2YT99ZO5jc8hyvkT
 Y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=buJ2Vw0w3M4WrtI5/DU3oXsQobrkkmx9rFyElDeN7mE=;
 b=lgqqOXsjaPuRpPv9oo1ll3e+FjUVU59XhzVxrGUnNssTzflkfRuhaQ1VwZi73D6pcI
 2Oan+PSTEtOQtHK70nRobtydgNygxPlWWR/x3j7erdu9qM8wxAJ9NjEOQcD3aNiUxlmA
 c6wOqTIKs2QMtwc60TiM8lKQtRcu6qV3r7pZfAaNN0Qg8DYpI3J2iuLloCueFFhSfciq
 Z/mS1I+jiKjmTjN+CEKdwPZQlGfALByZ+z+MDalysd/y91Q5xnAOXp2KcXddKxOu0NNh
 E5ro+hH+FsL+qd6GvqfkbYlbacw8RvAE2ESOA3V9X5qpm4Cy3IHdqaFlpengTKfrdvnI
 tvvw==
X-Gm-Message-State: ACrzQf0hABUnF3FOr/Fsbi7ebFdB18Or3f37Qjuce01fuxKfQF1uk6oH
 TjGzpOUad3zgxJ0SXgg9SCgyDWCnq5lotCJ1uy6L5g==
X-Google-Smtp-Source: AMsMyM7tQgOI6niyU5IXyfNHgsog0iDYl0WXgb5yVh7a8oMMnxo4TbbSeRkhbm4RLcMIb8opCLgiEX29WHKjDwAENJs=
X-Received: by 2002:a05:6512:b85:b0:499:202a:bde9 with SMTP id
 b5-20020a0565120b8500b00499202abde9mr3630798lfv.550.1663946457534; Fri, 23
 Sep 2022 08:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <DS0PR11MB63734D4DF4C4F368805EC97DDC4E9@DS0PR11MB6373.namprd11.prod.outlook.com>
 <Yyy8Pp0Y4NRzIzNw@google.com>
 <20220923005319.wkzpl36uailh4zbw@box.shutemov.name>
In-Reply-To: <20220923005319.wkzpl36uailh4zbw@box.shutemov.name>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 23 Sep 2022 16:20:21 +0100
Message-ID: <CA+EHjTy+2JG_=Xw5ojwZAW6+3Nr4-4a8YCBxWN5PmAhh7jjT+A@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Lutomirski, Andy" <luto@kernel.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>, 
 "david@redhat.com" <david@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>, 
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, 
 "Hocko, Michal" <mhocko@suse.com>, Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=tabba@google.com; helo=mail-lf1-x12d.google.com
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

On Fri, Sep 23, 2022 at 1:53 AM Kirill A . Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Thu, Sep 22, 2022 at 07:49:18PM +0000, Sean Christopherson wrote:
> > On Thu, Sep 22, 2022, Wang, Wei W wrote:
> > > On Thursday, September 15, 2022 10:29 PM, Chao Peng wrote:
> > > > +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> > > > +                  int *order)
> > >
> > > Better to remove "order" from this interface?
> >
> > Hard 'no'.
> >
> > > Some callers only need to get pfn, and no need to bother with
> > > defining and inputting something unused. For callers who need the "order",
> > > can easily get it via thp_order(pfn_to_page(pfn)) on their own.
> >
> > That requires (a) assuming the pfn is backed by struct page, and (b) assuming the
> > struct page is a transparent huge page.  That might be true for the current
> > implementation, but it most certainly will not always be true.
> >
> > KVM originally did things like this, where there was dedicated code for THP vs.
> > HugeTLB, and it was a mess.  The goal here is very much to avoid repeating those
> > mistakes.  Have the backing store _tell_ KVM how big the mapping is, don't force
> > KVM to rediscover the info on its own.
>
> I guess we can allow order pointer to be NULL to cover caller that don't
> need to know the order. Is it useful?

I think that would be useful. In pKVM we don't need to know the order,
and I had to use a dummy variable when porting V7.

Cheers,
/fuad


> --
>   Kiryl Shutsemau / Kirill A. Shutemov

