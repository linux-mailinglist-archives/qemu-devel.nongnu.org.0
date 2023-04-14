Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CB6E294F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 19:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnN9w-0006JY-4A; Fri, 14 Apr 2023 13:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Row5ZAYKCm0dPLYUNRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--seanjc.bounces.google.com>)
 id 1pnN9u-0006JF-BN
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 13:24:26 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Row5ZAYKCm0dPLYUNRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--seanjc.bounces.google.com>)
 id 1pnN9s-00027p-GF
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 13:24:25 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 81-20020a251854000000b00b8f5b60b760so5601452yby.19
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681493062; x=1684085062;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1suTIWWaXvrjwoXvee3hiPz1nCSIoJ8zBj0cMHmSI7Y=;
 b=ikLyr+8Xr+H5vM/bYsln0btIfSDwhlyv3SopCKg3euLB29KjQafs0AtMmmr4T9EIfJ
 vIPC9xf1NxKqXFWckbIj0WVo4SgvKsPOQl1cOwpgB/XV40BLqns/ryvTGzxH0hPTIol7
 xarcJ0GqxJFOJTIObBYAoUoAUl0iAOmFpm7/8rkUekiKozgid1NlTMyN45x5pS33IxKE
 d8HkpLc19gk/5O6gbpIr0ZptEhH2xIi2xu1OHofuLnINm9CQonnrWxwWMzsJ6C8Y+skF
 MUVvqijzMdtqQ30NGAKrF5+eZpQbbmVeMtcc7lOWf3BPP1QJqZGJHkM9DCvCxyboG1b4
 logA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681493062; x=1684085062;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1suTIWWaXvrjwoXvee3hiPz1nCSIoJ8zBj0cMHmSI7Y=;
 b=CTJzzKARz6PQCubpJWkjNd4ScweZNWAoqHGWT/cLOoVbD4ZQw5MvxSYNP9GWm2o/Qr
 R9lX/avmTqt619byDpvn6d1W4BA8FNmLY7S4+Nfxz4mLVfpSTyXPJXe1BREg2YbY9PU1
 ocdGz3rV+KXv+iWgYfw6yJrEj4d9zXdYWlECxkTsJvaFWH+NQ6y2q6ttazPuO5T6dQyQ
 Z4A9hhkYCZq8qpsxgqt8Z2Le+kHPMUGDPtEOzCBjMfQ0ZMnvVAf2mH8pM6jX4DqiS0Dp
 jAmHyfjCUAKUOIrWapPXwAnwovkLixXekgZHnGw7a58KMev5qWFCUdGxkRw8ehpOk7B1
 6V1w==
X-Gm-Message-State: AAQBX9fHkwTsTl+fDrN099M1kmwhR/yZPopSAKVYSbOdouKakHUfP9LI
 iaY0N6OwxoaPem9O8hUVGl84QkkIxkM=
X-Google-Smtp-Source: AKy350bMntOiUpabNyzZrQez/ekmQ/pO8bA95EPMaEz7NgDSS6qOH/7lua5qHB9B+z+FW4OM+ZLtRc32bN4=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b621:0:b0:54c:bf7:1853 with SMTP id
 u33-20020a81b621000000b0054c0bf71853mr4241791ywh.6.1681493062225; Fri, 14 Apr
 2023 10:24:22 -0700 (PDT)
Date: Fri, 14 Apr 2023 17:24:20 +0000
In-Reply-To: <ZDjzpKL9Omcox991@dhcp22.suse.cz>
Mime-Version: 1.0
References: <cover.1681430907.git.ackerleytng@google.com>
 <ZDjzpKL9Omcox991@dhcp22.suse.cz>
Message-ID: <ZDmMRAZYgLJ+x4l9@google.com>
Subject: Re: [RFC PATCH 0/6] Setting memory policy for restrictedmem file
From: Sean Christopherson <seanjc@google.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, qemu-devel@nongnu.org, aarcange@redhat.com, 
 ak@linux.intel.com, akpm@linux-foundation.org, arnd@arndb.de, 
 bfields@fieldses.org, bp@alien8.de, chao.p.peng@linux.intel.com, 
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, jlayton@kernel.org, 
 jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com, 
 kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, luto@kernel.org, 
 mail@maciej.szmigiero.name, michael.roth@amd.com, mingo@redhat.com, 
 naoya.horiguchi@nec.com, pbonzini@redhat.com, qperret@google.com, 
 rppt@kernel.org, shuah@kernel.org, steven.price@arm.com, tabba@google.com, 
 tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz, 
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com, 
 x86@kernel.org, yu.c.zhang@linux.intel.com, muchun.song@linux.dev, 
 feng.tang@intel.com, brgerst@gmail.com, rdunlap@infradead.org, 
 masahiroy@kernel.org, mailhol.vincent@wanadoo.fr
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Row5ZAYKCm0dPLYUNRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--seanjc.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Apr 14, 2023, Michal Hocko wrote:
> On Fri 14-04-23 00:11:49, Ackerley Tng wrote:
> > 3. A more generic fbind(): it seems like this new functionality is
> >    really only needed for restrictedmem files, hence a separate,
> >    specific syscall was proposed to avoid complexities with handling
> >    conflicting policies that may be specified via other syscalls like
> >    mbind()
> 
> I do not think it is a good idea to make the syscall restrict mem
> specific.

+1.  IMO, any uAPI that isn't directly related to the fundamental properties of
restricted memory, i.e. isn't truly unique to restrictedmem, should be added as
generic fd-based uAPI.

> History shows that users are much more creative when it comes
> to usecases than us. I do understand that the nature of restricted
> memory is that it is not mapable but memory policies without a mapping
> are a reasonable concept in genereal. After all this just tells where
> the memory should be allocated from. Do we need to implement that for
> any other fs? No, you can safely return EINVAL for anything but
> memfd_restricted fd for now but you shouldn't limit usecases upfront.

I would even go a step further and say that we should seriously reconsider the
design/implemenation of memfd_restricted() if a generic fbind() needs explicit
handling from the restricted memory code.  One of the goals with memfd_restricted()
is to rely on the underlying backing store to handle all of the "normal" behaviors.

