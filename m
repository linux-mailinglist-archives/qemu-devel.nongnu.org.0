Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0922465F551
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 21:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDX0t-0005zN-2a; Thu, 05 Jan 2023 15:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1pDX0m-0005y2-Lw
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:38:53 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1pDX0k-0004YU-1B
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:38:51 -0500
Received: by mail-qt1-x829.google.com with SMTP id h21so30935130qta.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 12:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5R84gnDXIcZCl3q1uuKNVrzE7JF/GewA0GD7Joj4Tac=;
 b=JTqD02qzpNL7au3Z3GUF4Xu2ARxubYVglZyPFMGjd5IBB76X21fyAUfGvELrmmzFik
 QzBJjZBaZ6aZe7oTAlxNCti0+kLpAukE+qZM7LrpHVjgAMiyLgJZ2+98YW1K5vKsRoVw
 2umAOw9diVB8LQA7BnZCONR8pssadQA3XE8f0al71RlaiMm7wUNlcWpSs5hmEzVyjqeM
 eYv5U34leRc2bqLAihlC18sqPCveW9G6816ZQccg0Z2ovOthL6yQhQkI0guVnNH8iTu7
 dG6eqdfXW1bD1DNzwo+oob/r+0lWSVvlcjXTltffxVApLthVRgT5BHTNgmHgdLEzU0KX
 YdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5R84gnDXIcZCl3q1uuKNVrzE7JF/GewA0GD7Joj4Tac=;
 b=OyogqMYqHKizoi8H6Wuou/Y+07IARETqGRzf+lVzxUPqCFz1kmSVLRCLN29abdtSkM
 uOqg+oUk5bN5J5ZIgyaBEeAPqFawwIoChjqcBxMQuiQ3mU67gMlmM6WpE41hRFkqgMi1
 QLOt11N3CyRKDrn0uvzVlX2v9NHK141mWSPGD8iAIxsl0Hh9HwIS480rR1Qb5cMcKh7H
 HE/9Y7ibmbTV+kQc3I3fuhmw3XmDGsxcdl6lpemtEeMc7xejwQ8JuXCatfC8dp7wZumw
 3pxr0suPpWkVQ4oEKfAZikZ333KRtKw46NrWXFJAkVfrncTvksAOkS9wxaRCIFbEB8kN
 sfpg==
X-Gm-Message-State: AFqh2krhU1HtzSKtWgZLIRplA0DH2umTON9aMDUqYRy/CsRtdsxgtSon
 Ox92n2Q7TtkAXwDuf8Rfl6k9rslq9e0FOiGmBYm48Q==
X-Google-Smtp-Source: AMrXdXsO9CWfLwOzPVqYnAJucA/qVRf1ChKGrluQUWC1ROk0zrv6560/2Dre8nwP8Lxgkk7sOMhP2BMCSX8GFdVvZpI=
X-Received: by 2002:ac8:5e0c:0:b0:3ab:754e:f0b3 with SMTP id
 h12-20020ac85e0c000000b003ab754ef0b3mr2062105qtx.583.1672951121587; Thu, 05
 Jan 2023 12:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
In-Reply-To: <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 5 Jan 2023 12:38:30 -0800
Message-ID: <CAGtprH_pbSo1HeEFUEB6ZZxm-=NEw+nLZ6ZVvr76=9BeX=AHPA@mail.gmail.com>
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=vannapurve@google.com; helo=mail-qt1-x829.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 1, 2022 at 10:20 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> +#ifdef CONFIG_HAVE_KVM_RESTRICTED_MEM
> +static bool restrictedmem_range_is_valid(struct kvm_memory_slot *slot,
> +                                        pgoff_t start, pgoff_t end,
> +                                        gfn_t *gfn_start, gfn_t *gfn_end)
> +{
> +       unsigned long base_pgoff = slot->restricted_offset >> PAGE_SHIFT;
> +
> +       if (start > base_pgoff)
> +               *gfn_start = slot->base_gfn + start - base_pgoff;

There should be a check for overflow here in case start is a very big
value. Additional check can look like:
if (start >= base_pgoff + slot->npages)
       return false;

> +       else
> +               *gfn_start = slot->base_gfn;
> +
> +       if (end < base_pgoff + slot->npages)
> +               *gfn_end = slot->base_gfn + end - base_pgoff;

If "end" is smaller than base_pgoff, this can cause overflow and
return the range as valid. There should be additional check:
if (end < base_pgoff)
         return false;


> +       else
> +               *gfn_end = slot->base_gfn + slot->npages;
> +
> +       if (*gfn_start >= *gfn_end)
> +               return false;
> +
> +       return true;
> +}
> +

