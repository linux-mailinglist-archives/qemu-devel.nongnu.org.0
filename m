Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDF604AA7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:09:29 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAhE-0006Is-5I
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1olAbG-0007cj-Fa
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:03:20 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1olAb3-0008BS-6o
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:03:06 -0400
Received: by mail-lf1-x130.google.com with SMTP id o12so20130183lfq.9
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8uws4B5WgtxEQQPonRBN7dDm57mj+TMYZwg9NWMF6uE=;
 b=GNoRQIq9JKVsi3NBMOHtxRxaA+HyiSRxEbQwKROCIdQN7YeQVvkeCL/tBfTJ0rFShS
 wLv+OMed6GKtlzQERAvDIH0fS9RwWNLH1iDzg8iIFUBsQUCTCUR56HEIdBHp5w6KeZ+i
 ed0p1SeRI6LjurmDyBxbuv8clbnocReb3YyBgtI/ebogw01dMtsK7A/KD1lbcyPsqtH5
 TaWyyc8eNama/1dRhNwUMQO8P85tBb+QCcPLfYt81cuF60S21NuSTt9ENjFqtPiqHbYW
 QbAZcIWW265YqQ7fQmjB0etPPuYGAVxyYuBBwAInvDjayuW/S/xhDX/aqG8lWy7/HjYu
 bNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uws4B5WgtxEQQPonRBN7dDm57mj+TMYZwg9NWMF6uE=;
 b=FoodzPXLatWJ6o7oh0JujMXKHpd1lFE+0sSDsUV3Ho0X5FmqMEbmKgGNvChY/uWfrs
 pKbzQ22/QdXDa2oDvl2nJkg7kG02eEFSTm9Flhw6rvb0M0JPP1cmJVMUiYa4QCuO+6AJ
 PK3h3a3UI/PE9KTR98xRu84NOIovhnu4zlGi50E9LDUQnsg1hSbmNSk/MrJPKmrzx2GZ
 oLw336LyTiEuukeu88i+jNJBDasyqDFGIp0Qx38MYtF22nbFSSpunuwUEFCRxlNZ+beS
 uNWN7uo795ebVoOx7ToWV7mCu+Np7rAw2AshyvNgkZtl8VTRwm4axrpYElf17sKrDDMr
 c0rg==
X-Gm-Message-State: ACrzQf3yBtswJe9i7qb8Y/4a50WX5c/WkM8MogZI9PK6ygNfj0D/Yq2E
 GbKJHVnKyZgnDNaZP6OQbakVpZ2xtD8a+L5YXH4PdA==
X-Google-Smtp-Source: AMsMyM73/Iz2UA6hD6VnKREmVWKox8T+CDDwCUSlKn0rjft7dc92r9M4EXDXMPFumhxI7Ld+a4+gjwQViVOGvFn4W+A=
X-Received: by 2002:a05:6512:4cb:b0:4a2:25b6:9e73 with SMTP id
 w11-20020a05651204cb00b004a225b69e73mr3205357lfq.30.1666191778897; Wed, 19
 Oct 2022 08:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-6-chao.p.peng@linux.intel.com>
 <CA+EHjTxukqBfaN6D+rPOiX83zkGknHEQ16J0k6GQSdL_-e9C6g@mail.gmail.com>
 <20221012023516.GA3218049@chaop.bj.intel.com>
 <CA+EHjTyGyGL+ox81=jdtoHERtHPV=P7wJub=3j7chdijyq-AgA@mail.gmail.com>
 <Y03UiYYioV+FQIpx@google.com> <20221019132308.GA3496045@chaop.bj.intel.com>
In-Reply-To: <20221019132308.GA3496045@chaop.bj.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 19 Oct 2022 16:02:22 +0100
Message-ID: <CA+EHjTytCEup0m-nhnVHsuQ1xjaCxXNHO_Oxe+QbpwqaewpfKQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] KVM: Register/unregister the guest private memory
 regions
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
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
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=tabba@google.com; helo=mail-lf1-x130.google.com
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

> > > This sounds good. Thank you.
> >
> > I like the idea of a separate Kconfig, e.g. CONFIG_KVM_GENERIC_PRIVATE_MEM or
> > something.  I highly doubt there will be any non-x86 users for multiple years,
> > if ever, but it would allow testing the private memory stuff on ARM (and any other
> > non-x86 arch) without needing full pKVM support and with only minor KVM
> > modifications, e.g. the x86 support[*] to test UPM without TDX is shaping up to be
> > trivial.
>
> CONFIG_KVM_GENERIC_PRIVATE_MEM looks good to me.

That sounds good to me, and just keeping the xarray isn't really an
issue for pKVM. We could end up using it instead of some of the other
structures we use for tracking.

Cheers,
/fuad

> Thanks,
> Chao
> >
> > [*] https://lore.kernel.org/all/Y0mu1FKugNQG5T8K@google.com

