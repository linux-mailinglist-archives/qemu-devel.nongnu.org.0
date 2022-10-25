Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BE60D09E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:30:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLp5-0006qM-WF; Tue, 25 Oct 2022 11:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLp3-0006pj-Na
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:26:33 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onLp1-0005oI-OX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:26:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id f193so11831882pgc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f0Fk+0/Amw7nskzxgUFtOOx5Md+yUa8AJYsojRyR41E=;
 b=at2Vihq0ZysdnRIAuOMyqUBdq1/FFvX63hDc58gBWKAYTaAmkdYraFO/pRcQUDSDYE
 0fkDw3uZaS0h9nyoTmESSO/FjPD1QqpECPNASv+D/6l+zaxAf+VJn/1HbEpmn5RksRqM
 Kzp2cehpcT91+FjF962CIIiyPLseroHnn8m58E8xAwNn8/VzQz0SjVNwnMGfPlyntwWG
 1v+JEBR3ZSQGmfEMYXT1afvMpcQP3UQ/MndzyKc736Oi9OUW1NIyDDMvB7aFBM+fsgL1
 HkgjZvE5tmNi+7E1mPJH+qwH0v1PNDsMYQONw16TaTIl5SmDaOKIjaZzxn0BT619gx8g
 +GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f0Fk+0/Amw7nskzxgUFtOOx5Md+yUa8AJYsojRyR41E=;
 b=yL5MS+EJ4Zw3EMuEZ+0bXKii/k86UoSU/UAM/EmwJM7EtVRYOKd3+85Eo7l2wcOPaf
 TeDFJJkveWphgU0fXCACYCXJ0NiBn4NVvlQwM23sqMATkvHAqW8VTFH5Sfv65ec4ss9T
 VOyDJll6F+IaL+Y9m+xmMgFxbEBCZ98PgJMJo50VTqQ6p12LzmyHlK1EpyOiJvUICN8J
 D/UX5YClqRKHzT+jDXCwM+Po1jIM1KY4DDPiAul6jmww/XDJKi36Z0uBT4u2HV7N+86S
 qAv2EnEkNlyTApsV89hhFF55PH3E0ZGMv29M/T+NQnfbvHSAOO7ruxtJ7oohJIe8I76H
 ZECQ==
X-Gm-Message-State: ACrzQf1r7RbibQMHt2TiGXhqPPpe7YgGeAXHuPZ5yCh+UG2BiMlOa2SF
 AK1Oon0IRpuH0UN3JoSZDxo4wraTvrZ3I84wNOVstQ==
X-Google-Smtp-Source: AMsMyM7S5IISqnVExEMx/Y/NdDoxoi+mPZLZks2JQtwFF+Q9Vn8DzGWDrBRBdHkSKruNqn9cxFFTv641nHc01V+gClk=
X-Received: by 2002:a63:1d5a:0:b0:46e:d157:39ef with SMTP id
 d26-20020a631d5a000000b0046ed15739efmr17120402pgm.231.1666711590299; Tue, 25
 Oct 2022 08:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
In-Reply-To: <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 16:26:18 +0100
Message-ID: <CAFEAcA-=Sc9Sc4oLq13HAFW49ZBw8u6DtN7bf_vjVYX_AAaKSg@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, 
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 16:21, Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> This new KVM exit allows userspace to handle memory-related errors. It
> indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> The flags includes additional information for userspace to handle the
> error. Currently bit 0 is defined as 'private memory' where '1'
> indicates error happens due to private memory access and '0' indicates
> error happens due to shared memory access.
>
> When private memory is enabled, this new exit will be used for KVM to
> exit to userspace for shared <-> private memory conversion in memory
> encryption usage. In such usage, typically there are two kind of memory
> conversions:
>   - explicit conversion: happens when guest explicitly calls into KVM
>     to map a range (as private or shared), KVM then exits to userspace
>     to perform the map/unmap operations.
>   - implicit conversion: happens in KVM page fault handler where KVM
>     exits to userspace for an implicit conversion when the page is in a
>     different state than requested (private or shared).
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  Documentation/virt/kvm/api.rst | 23 +++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |  9 +++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index f3fa75649a78..975688912b8c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6537,6 +6537,29 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>
> +::
> +
> +               /* KVM_EXIT_MEMORY_FAULT */
> +               struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE (1 << 0)
> +                       __u32 flags;
> +                       __u32 padding;
> +                       __u64 gpa;
> +                       __u64 size;
> +               } memory;
> +
> +If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the VCPU has
> +encountered a memory error which is not handled by KVM kernel module and
> +userspace may choose to handle it. The 'flags' field indicates the memory
> +properties of the exit.
> +
> + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
> +   private memory access when the bit is set. Otherwise the memory error is
> +   caused by shared memory access when the bit is clear.
> +
> +'gpa' and 'size' indicate the memory range the error occurs at. The userspace
> +may handle the error and return to KVM to retry the previous memory access.
> +

What's the difference between this and a plain old MMIO exit ?
Just that we can specify a wider size and some flags ?

-- PMM

