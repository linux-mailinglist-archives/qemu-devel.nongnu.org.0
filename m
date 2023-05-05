Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7A6F86FC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:46:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyYG-0001JB-4C; Fri, 05 May 2023 12:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hTJVZAYKCmgYKGTPIMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--seanjc.bounces.google.com>)
 id 1puyYE-0001Ix-6e
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:44:58 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hTJVZAYKCmgYKGTPIMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--seanjc.bounces.google.com>)
 id 1puyYC-0008OL-Dh
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:44:57 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-24e3f2bff83so1041515a91.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 09:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683305094; x=1685897094;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=9+i6WgJAJzJlKXvdjrc4sB18Bds1WwkbYsWdLgSqVp4=;
 b=5NLcQWofuV/YkKQ6oScIEQc8lVhhA2L4HU7CAnLH03mX0Px3HVPbbRo2D6swL6bYVC
 DUB3fcT4XujkVxCNaKYJ+P/Z7sNnX421VReM55ms1qzD5WRQCvJ/Kix0mSSaYy6Vuguo
 DWnNHQWNURLtT+6bY0K/Qi8QSq5fb73IsidEyosi5bDvhPv4lQKLP/WCp19+1EjcQYkT
 2ZZ09LoscjMPBSeU10UZCNvLYrLZpvQ7Vt2oUZW3pPlG97XC7fwgw982zXDkvUJKrQ1i
 ngUKTQDZ0x71ie0DU+LnkH+jsC1SnJHoK6gBPF+WpYtjUSRSNwRS6UiypPvCgognd0bl
 qZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683305094; x=1685897094;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9+i6WgJAJzJlKXvdjrc4sB18Bds1WwkbYsWdLgSqVp4=;
 b=Uj1nWH6oYsAc8xwXGLtXgJpBmOj68MRCc0srPO2lqgxnKaZBVfFO/tpX9cdy7OEk7o
 O1FaYPRlrgFNzOEK/3Y8UPNzjaZyRBKn49QL4sv9KYypRrBgjqRHiSlfl8NE04qbezoB
 skVAUfyY+wWdO8upgqljHG1oOPNHoiNfKExhoKa+WileU4D5173Z5JeJDOfF2woIcXx/
 X7rVgIRiVWnkO+goBr2iir1TzDUUG2dR2f1n8ZJ4gSl1gdILd0MwdFymu+COcb8StpnN
 XMVEHXP8YCnfPS4nLdi8MQB/9ezS3aWxySzNh2rxeHD+Sbf5yW6jW68WKrZe/9Jnz44r
 B+9g==
X-Gm-Message-State: AC+VfDypVflG1vJpYQI+rfGwNmj45+geLJsCuTtoRiQ2HMAmYgD46iVs
 xTXxe9Pba+e06d/o5CvnhpKK7tUz4kY=
X-Google-Smtp-Source: ACHHUZ6aankmXvB8085gNTlbF2PCEyPixSX1tutA3Hp2uz+l8puQYKdMvvxlOn7gLaJGVxpHKJ9HgVKK2Lk=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0b:b0:24e:2787:405d with SMTP id
 w11-20020a17090aea0b00b0024e2787405dmr607921pjy.5.1683305093970; Fri, 05 May
 2023 09:44:53 -0700 (PDT)
Date: Fri, 5 May 2023 09:44:52 -0700
In-Reply-To: <20230505152046.6575-5-mic@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-5-mic@digikod.net>
Message-ID: <ZFUyhPuhtMbYdJ76@google.com>
Subject: Re: [PATCH v1 4/9] KVM: x86: Add new hypercall to set EPT permissions
From: Sean Christopherson <seanjc@google.com>
To: "=?iso-8859-1?Q?Micka=EBl_Sala=FCn?=" <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>, 
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, 
 Liran Alon <liran.alon@oracle.com>, 
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>, 
 "Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
 "=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>, 
 Zahra Tarkhani <ztarkhani@microsoft.com>, 
 "=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, 
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
 virtualization@lists.linux-foundation.org, x86@kernel.org, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3hTJVZAYKCmgYKGTPIMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--seanjc.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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

On Fri, May 05, 2023, Micka=EF=BF=BDl Sala=EF=BF=BDn wrote:
> Add a new KVM_HC_LOCK_MEM_PAGE_RANGES hypercall that enables a guest to
> set EPT permissions on a set of page ranges.

IMO, manipulation of protections, both for memory (this patch) and CPU stat=
e
(control registers in the next patch) should come from userspace.  I have n=
o
objection to KVM providing plumbing if necessary, but I think userspace nee=
ds to
to have full control over the actual state.

One of the things that caused Intel's control register pinning series to st=
all
out was how to handle edge cases like kexec() and reboot.  Deferring to use=
rspace
means the kernel doesn't need to define policy, e.g. when to unprotect memo=
ry,
and avoids questions like "should userspace be able to overwrite pinned con=
trol
registers".

And like the confidential VM use case, keeping userspace in the loop is a b=
ig
beneifit, e.g. the guest can't circumvent protections by coercing userspace=
 into
writing to protected memory .

