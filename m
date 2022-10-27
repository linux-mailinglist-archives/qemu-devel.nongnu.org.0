Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C421760F50B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:28:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo07H-0002eH-1B; Thu, 27 Oct 2022 06:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oo07E-00026n-2O
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:28:00 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oo06y-0008PH-Fo
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:27:59 -0400
Received: by mail-lf1-x12f.google.com with SMTP id g7so1847726lfv.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ht1qDbWjn1s/Tw8Yqm0aVlTSVNxYRnuUWU/s2QqT7o4=;
 b=i9fpSLzo5jMs1+PlsjmjCMb+bkUFi0v3Bacdvscp0fuYHO+3FGaxuBdH9ct3K7RBFW
 GOHO2JyUIW1XW5jN40lUo04IVtr6sii/DKrSh0WfspjvZb3qBHVd8hHkcE/+pQE5KgUT
 S2C3X4NjLiLtUUo2sU1/2YrB8+0hbHtyswI86zJlvJsldbkJ1TcRW77xj3Ekpg2FTn5F
 yLbrMrtYI7k8BF9mLNKwdIJf3ttus48z491adWnKD4QvBxh4IYkD7eHihmuxCq7D5Fig
 oDQgpPvQAoHoFBnco6A5aUUG8BlMm3axdurIL1eFAQNWMO59iSALUb8xpG0lZ7hWTkgh
 HBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ht1qDbWjn1s/Tw8Yqm0aVlTSVNxYRnuUWU/s2QqT7o4=;
 b=6i7x06NDjLUYH0y44L+rNq/YDchdTWUB7P90U6TRidcEkUZTtv6NeQY41CAOFYQVbd
 Gt3UeFijDz3ItspOADoDHDv40exgRx6tzD7MjkiRCiXHfKpgc1WnuQ2oEpDSUgrfL0Ze
 TmAXtapESd3/PMQjYjFki+W8wFP0xZgMGJwh4Bo1RsIiFxzp58YBV+ttyzyWKoavZlR9
 yRx8UicW8zKVtu72Cl4Ri2UT7vJ3wu9qwaA/mWR/HMifPmR4wHLhazgLEkRft3kHX/Do
 h/r0f6mK/BOJ6YUJRGQFjqxdpRO5K9PgPchNH0ThQ8kWby10TzqU3ZTJibn4/s3oSOuW
 QCyw==
X-Gm-Message-State: ACrzQf2QyYGmbvWd2h+/ksXOpNcp/Cb8DIOG05GzYxj1a49PQDPgx2ej
 86PsuONW1Gu2gAquJkYOE2BkaOw0ZSLtyrbg+oizQw==
X-Google-Smtp-Source: AMsMyM7ZrmnFdb+RDiq0D6Ba0YwSUUNSHZjttBJh/zpOd85NYIAHkkRHyIoh13rneHkuGCKm3HEm2TuLmTrwb52teuM=
X-Received: by 2002:a05:6512:3f8b:b0:492:d1ed:5587 with SMTP id
 x11-20020a0565123f8b00b00492d1ed5587mr19119426lfa.355.1666866462514; Thu, 27
 Oct 2022 03:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
In-Reply-To: <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Oct 2022 11:27:05 +0100
Message-ID: <CA+EHjTxzLDAW=MyfKFcL2cGQimw3bdVYePUgRw+=1+AbCQouUQ@mail.gmail.com>
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
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=tabba@google.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Tue, Oct 25, 2022 at 4:19 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
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

Reviewed-by: Fuad Tabba <tabba@google.com>

I have tested the V8 version of this patch on arm64/qemu, and
considering this hasn't changed:
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



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
>  ::
>
>      /* KVM_EXIT_NOTIFY */
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index f1ae45c10c94..fa60b032a405 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -300,6 +300,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_RISCV_SBI        35
>  #define KVM_EXIT_RISCV_CSR        36
>  #define KVM_EXIT_NOTIFY           37
> +#define KVM_EXIT_MEMORY_FAULT     38
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -538,6 +539,14 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID     (1 << 0)
>                         __u32 flags;
>                 } notify;
> +               /* KVM_EXIT_MEMORY_FAULT */
> +               struct {
> +#define KVM_MEMORY_EXIT_FLAG_PRIVATE   (1 << 0)
> +                       __u32 flags;
> +                       __u32 padding;
> +                       __u64 gpa;
> +                       __u64 size;
> +               } memory;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> --
> 2.25.1
>

