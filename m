Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2A10EB7D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 15:23:49 +0100 (CET)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibmc8-0004Fy-3n
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 09:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1ibmaa-0003fF-To
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1ibmaY-00045J-6p
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:22:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49106
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1ibmaY-00045A-2h
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575296528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MdpcPgHbQ9llT439APuSCnlczpCMkbEL9M6+DXvkhOo=;
 b=U4gNDakPNaI7HIEeIykmzFwyLbcaTLXWXXdZ6H0XSWviZeP3t9/wdIWYAEg7Twv9qIl7KM
 F58nn4pItrJa4lJpzNQ+cluwBFDub4hifD1E4CXZnu3dpNnXXeJPlvmQXrb127IxtRpJMK
 bPP3pAMhxS93Mc5g7D6erNL/lVTfX6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-dUUsuYrOOxiFbP7WvgUccw-1; Mon, 02 Dec 2019 09:22:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1786E107ACC4;
 Mon,  2 Dec 2019 14:22:06 +0000 (UTC)
Received: from [10.36.117.49] (ovpn-117-49.ams2.redhat.com [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FEF267648;
 Mon,  2 Dec 2019 14:22:04 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] s390x: Add missing vcpu reset functions
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191202140146.3910-1-frankja@linux.ibm.com>
 <20191202140146.3910-3-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAj4EEwECACgFAljj9eoCGwMFCQlmAYAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE3eEPcA/4Na5IIP/3T/FIQMxIfNzZshIq687qgG
 8UbspuE/YSUDdv7r5szYTK6KPTlqN8NAcSfheywbuYD9A4ZeSBWD3/NAVUdrCaRP2IvFyELj
 xoMvfJccbq45BxzgEspg/bVahNbyuBpLBVjVWwRtFCUEXkyazksSv8pdTMAs9IucChvFmmq3
 jJ2vlaz9lYt/lxN246fIVceckPMiUveimngvXZw21VOAhfQ+/sofXF8JCFv2mFcBDoa7eYob
 s0FLpmqFaeNRHAlzMWgSsP80qx5nWWEvRLdKWi533N2vC/EyunN3HcBwVrXH4hxRBMco3jvM
 m8VKLKao9wKj82qSivUnkPIwsAGNPdFoPbgghCQiBjBe6A75Z2xHFrzo7t1jg7nQfIyNC7ez
 MZBJ59sqA9EDMEJPlLNIeJmqslXPjmMFnE7Mby/+335WJYDulsRybN+W5rLT5aMvhC6x6POK
 z55fMNKrMASCzBJum2Fwjf/VnuGRYkhKCqqZ8gJ3OvmR50tInDV2jZ1DQgc3i550T5JDpToh
 dPBxZocIhzg+MBSRDXcJmHOx/7nQm3iQ6iLuwmXsRC6f5FbFefk9EjuTKcLMvBsEx+2DEx0E
 UnmJ4hVg7u1PQ+2Oy+Lh/opK/BDiqlQ8Pz2jiXv5xkECvr/3Sv59hlOCZMOaiLTTjtOIU7Tq
 7ut6OL64oAq+uQINBFXLn5EBEADn1959INH2cwYJv0tsxf5MUCghCj/CA/lc/LMthqQ773ga
 uB9mN+F1rE9cyyXb6jyOGn+GUjMbnq1o121Vm0+neKHUCBtHyseBfDXHA6m4B3mUTWo13nid
 0e4AM71r0DS8+KYh6zvweLX/LL5kQS9GQeT+QNroXcC1NzWbitts6TZ+IrPOwT1hfB4WNC+X
 2n4AzDqp3+ILiVST2DT4VBc11Gz6jijpC/KI5Al8ZDhRwG47LUiuQmt3yqrmN63V9wzaPhC+
 xbwIsNZlLUvuRnmBPkTJwwrFRZvwu5GPHNndBjVpAfaSTOfppyKBTccu2AXJXWAE1Xjh6GOC
 8mlFjZwLxWFqdPHR1n2aPVgoiTLk34LR/bXO+e0GpzFXT7enwyvFFFyAS0Nk1q/7EChPcbRb
 hJqEBpRNZemxmg55zC3GLvgLKd5A09MOM2BrMea+l0FUR+PuTenh2YmnmLRTro6eZ/qYwWkC
 u8FFIw4pT0OUDMyLgi+GI1aMpVogTZJ70FgV0pUAlpmrzk/bLbRkF3TwgucpyPtcpmQtTkWS
 gDS50QG9DR/1As3LLLcNkwJBZzBG6PWbvcOyrwMQUF1nl4SSPV0LLH63+BrrHasfJzxKXzqg
 rW28CTAE2x8qi7e/6M/+XXhrsMYG+uaViM7n2je3qKe7ofum3s4vq7oFCPsOgwARAQABiQIl
 BBgBAgAPBQJVy5+RAhsMBQkJZgGAAAoJEE3eEPcA/4NagOsP/jPoIBb/iXVbM+fmSHOjEshl
 KMwEl/m5iLj3iHnHPVLBUWrXPdS7iQijJA/VLxjnFknhaS60hkUNWexDMxVVP/6lbOrs4bDZ
 NEWDMktAeqJaFtxackPszlcpRVkAs6Msn9tu8hlvB517pyUgvuD7ZS9gGOMmYwFQDyytpepo
 YApVV00P0u3AaE0Cj/o71STqGJKZxcVhPaZ+LR+UCBZOyKfEyq+ZN311VpOJZ1IvTExf+S/5
 lqnciDtbO3I4Wq0ArLX1gs1q1XlXLaVaA3yVqeC8E7kOchDNinD3hJS4OX0e1gdsx/e6COvy
 qNg5aL5n0Kl4fcVqM0LdIhsubVs4eiNCa5XMSYpXmVi3HAuFyg9dN+x8thSwI836FoMASwOl
 C7tHsTjnSGufB+D7F7ZBT61BffNBBIm1KdMxcxqLUVXpBQHHlGkbwI+3Ye+nE6HmZH7IwLwV
 W+Ajl7oYF+jeKaH4DZFtgLYGLtZ1LDwKPjX7VAsa4Yx7S5+EBAaZGxK510MjIx6SGrZWBrrV
 TEvdV00F2MnQoeXKzD7O4WFbL55hhyGgfWTHwZ457iN9SgYi1JLPqWkZB0JRXIEtjd4JEQcx
 +8Umfre0Xt4713VxMygW0PnQt5aSQdMD58jHFxTk092mU+yIHj5LeYgvwSgZN4airXk5yRXl
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <d17ee6d1-9fd6-89b1-9520-abc619777a65@redhat.com>
Date: Mon, 2 Dec 2019 15:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191202140146.3910-3-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: dUUsuYrOOxiFbP7WvgUccw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, mihajlov@linux.ibm.com,
 qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.12.19 15:01, Janosch Frank wrote:
> Up to now we only had an ioctl to reset vcpu data QEMU couldn't reach
> for the initial reset, which was also called for the clear reset. To
> be architecture compliant, we also need to clear local interrupts on a
> normal reset.
> 
> Because of this and the upcoming protvirt support we need to add
> ioctls for the missing clear and normal resets.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/cpu.c       | 14 ++++++++++++--
>  target/s390x/kvm-stub.c  | 10 +++++++++-
>  target/s390x/kvm.c       | 42 ++++++++++++++++++++++++++++++++--------
>  target/s390x/kvm_s390x.h |  4 +++-
>  4 files changed, 58 insertions(+), 12 deletions(-)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 829ce6ad54..906285888e 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -139,8 +139,18 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
>      }
>  
>      /* Reset state inside the kernel that we cannot access yet from QEMU. */
> -    if (kvm_enabled() && type != S390_CPU_RESET_NORMAL) {
> -        kvm_s390_reset_vcpu(cpu);
> +    if (kvm_enabled()) {
> +        switch (type) {
> +        case S390_CPU_RESET_CLEAR:
> +            kvm_s390_reset_vcpu_clear(cpu);
> +            break;
> +        case S390_CPU_RESET_INITIAL:
> +            kvm_s390_reset_vcpu_initial(cpu);
> +            break;
> +        case S390_CPU_RESET_NORMAL:
> +            kvm_s390_reset_vcpu_normal(cpu);
> +            break;
> +        }
>      }
>  }
>  
> diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
> index 5152e2bdf1..c4cd497f85 100644
> --- a/target/s390x/kvm-stub.c
> +++ b/target/s390x/kvm-stub.c
> @@ -83,7 +83,15 @@ void kvm_s390_cmma_reset(void)
>  {
>  }
>  
> -void kvm_s390_reset_vcpu(S390CPU *cpu)
> +void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
> +{
> +}
> +
> +void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
> +{
> +}
> +
> +void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
>  {
>  }
>  
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index ad6e38c876..7a2ec8b9f8 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -151,6 +151,7 @@ static int cap_s390_irq;
>  static int cap_ri;
>  static int cap_gs;
>  static int cap_hpage_1m;
> +static int cap_vcpu_resets;
>  
>  static int active_cmma;
>  
> @@ -342,6 +343,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>      cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>      cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
> +    cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
>  
>      if (!kvm_check_extension(s, KVM_CAP_S390_GMAP)
>          || !kvm_check_extension(s, KVM_CAP_S390_COW)) {
> @@ -403,20 +405,44 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>      return 0;
>  }
>  
> -void kvm_s390_reset_vcpu(S390CPU *cpu)
> +static void kvm_s390_reset_vcpu(S390CPU *cpu, unsigned long type)
>  {
>      CPUState *cs = CPU(cpu);
>  
> -    /* The initial reset call is needed here to reset in-kernel
> -     * vcpu data that we can't access directly from QEMU
> -     * (i.e. with older kernels which don't support sync_regs/ONE_REG).
> -     * Before this ioctl cpu_synchronize_state() is called in common kvm
> -     * code (kvm-all) */
> -    if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
> -        error_report("Initial CPU reset failed on CPU %i", cs->cpu_index);
> +    /*
> +     * The reset call is needed here to reset in-kernel vcpu data that
> +     * we can't access directly from QEMU (i.e. with older kernels
> +     * which don't support sync_regs/ONE_REG).  Before this ioctl
> +     * cpu_synchronize_state() is called in common kvm code
> +     * (kvm-all).
> +     */
> +    if (kvm_vcpu_ioctl(cs, type)) {
> +        error_report("CPU reset failed on CPU %i", cs->cpu_index);
>      }
>  }
>  
> +void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
> +{
> +    kvm_s390_reset_vcpu(cpu, KVM_S390_INITIAL_RESET);
> +}
> +
> +void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
> +{
> +    if (!cap_vcpu_resets) {
> +        kvm_s390_reset_vcpu(cpu, KVM_S390_INITIAL_RESET);
> +    } else {
> +        kvm_s390_reset_vcpu(cpu, KVM_S390_CLEAR_RESET);
> +    }
> +}
> +
> +void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
> +{
> +    if (!cap_vcpu_resets) {
> +        return;
> +    }
> +    kvm_s390_reset_vcpu(cpu, KVM_S390_NORMAL_RESET);

if (cap_vcpu_resets) {
    kvm_s390_reset_vcpu(cpu, KVM_S390_NORMAL_RESET);
}

saves one LOC ;)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


