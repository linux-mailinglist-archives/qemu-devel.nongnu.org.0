Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93194184768
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 14:05:48 +0100 (CET)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCk0Z-0007up-LD
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 09:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imbrenda@linux.ibm.com>) id 1jCjwY-0001IP-I7
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imbrenda@linux.ibm.com>) id 1jCjwW-00076B-W4
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:01:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60096
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imbrenda@linux.ibm.com>)
 id 1jCjwW-000759-Qi
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:01:36 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DCpWUA052261
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 09:01:36 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yqyhj7xdw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 09:01:36 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <imbrenda@linux.ibm.com>;
 Fri, 13 Mar 2020 13:01:33 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Mar 2020 13:01:31 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02DD1Upd51577064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 13:01:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AC85A4065;
 Fri, 13 Mar 2020 13:01:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB762A405F;
 Fri, 13 Mar 2020 13:01:29 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.9.63])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Mar 2020 13:01:29 +0000 (GMT)
Date: Fri, 13 Mar 2020 13:57:28 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v9 06/15] s390x: Add SIDA memory ops
In-Reply-To: <20200311132151.172389-7-frankja@linux.ibm.com>
References: <20200311132151.172389-1-frankja@linux.ibm.com>
 <20200311132151.172389-7-frankja@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031313-0016-0000-0000-000002F079F0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031313-0017-0000-0000-00003353EDA9
Message-Id: <20200313135728.7ca6ac62@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130066
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 09:21:42 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Protected guests save the instruction control blocks in the SIDA
> instead of QEMU/KVM directly accessing the guest's memory.
> 
> Let's introduce new functions to access the SIDA.
> 
> Also the new memops are available with KVM_CAP_S390_PROTECTED, so
> let's check for that.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h        |  7 ++++++-
>  target/s390x/kvm.c        | 25 +++++++++++++++++++++++++
>  target/s390x/kvm_s390x.h  |  2 ++
>  target/s390x/mmu_helper.c | 14 ++++++++++++++
>  4 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 1d17709d6e10b5e0..035427521cec2528 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -823,7 +823,12 @@ int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr
> laddr, uint8_t ar, void *hostbuf, #define
> s390_cpu_virt_mem_check_write(cpu, laddr, ar, len)   \
> s390_cpu_virt_mem_rw(cpu, laddr, ar, NULL, len, true) void
> s390_cpu_virt_mem_handle_exc(S390CPU *cpu, uintptr_t ra); -
> +int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void
> *hostbuf,
> +                       int len, bool is_write);
> +#define s390_cpu_pv_mem_read(cpu, offset, dest, len)    \
> +        s390_cpu_pv_mem_rw(cpu, offset, dest, len, false)
> +#define s390_cpu_pv_mem_write(cpu, offset, dest, len)       \
> +        s390_cpu_pv_mem_rw(cpu, offset, dest, len, true)
>  
>  /* sigp.c */
>  int s390_cpu_restart(S390CPU *cpu);
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index eec0b92479465b9c..cdcd538b4f7fb318 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -154,6 +154,7 @@ static int cap_ri;
>  static int cap_gs;
>  static int cap_hpage_1m;
>  static int cap_vcpu_resets;
> +static int cap_protected;
>  
>  static int active_cmma;
>  
> @@ -346,6 +347,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>      cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
>      cap_vcpu_resets = kvm_check_extension(s,
> KVM_CAP_S390_VCPU_RESETS);
> +    cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
>  
>      if (!kvm_check_extension(s, KVM_CAP_S390_GMAP)
>          || !kvm_check_extension(s, KVM_CAP_S390_COW)) {
> @@ -846,6 +848,29 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr,
> uint8_t ar, void *hostbuf, return ret;
>  }
>  
> +int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
> +                       int len, bool is_write)
> +{
> +    struct kvm_s390_mem_op mem_op = {
> +        .sida_offset = offset,
> +        .size = len,
> +        .op = is_write ? KVM_S390_MEMOP_SIDA_WRITE
> +                       : KVM_S390_MEMOP_SIDA_READ,
> +        .buf = (uint64_t)hostbuf,
> +    };
> +    int ret;
> +
> +    if (!cap_mem_op || !cap_protected) {
> +        return -ENOSYS;
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_S390_MEM_OP, &mem_op);
> +    if (ret < 0) {
> +        error_report("KVM_S390_MEM_OP failed: %s", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
>  /*
>   * Legacy layout for s390:
>   * Older S390 KVM requires the topmost vma of the RAM to be
> diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
> index 0b21789796d7c462..9c38f6ccce83e39e 100644
> --- a/target/s390x/kvm_s390x.h
> +++ b/target/s390x/kvm_s390x.h
> @@ -19,6 +19,8 @@ void kvm_s390_vcpu_interrupt(S390CPU *cpu, struct
> kvm_s390_irq *irq); void kvm_s390_access_exception(S390CPU *cpu,
> uint16_t code, uint64_t te_code); int kvm_s390_mem_op(S390CPU *cpu,
> vaddr addr, uint8_t ar, void *hostbuf, int len, bool is_write);
> +int kvm_s390_mem_op_pv(S390CPU *cpu, vaddr addr, void *hostbuf, int
> len,
> +                       bool is_write);
>  void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code);
>  int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
>  void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index 0be2f300bbe4ac8b..7d9f3059cd502c49 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -474,6 +474,20 @@ static int translate_pages(S390CPU *cpu, vaddr
> addr, int nr_pages, return 0;
>  }
>  
> +int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void
> *hostbuf,
> +                       int len, bool is_write)
> +{
> +    int ret;
> +
> +    if (kvm_enabled()) {
> +        ret = kvm_s390_mem_op_pv(cpu, offset, hostbuf, len,
> is_write);
> +    } else {
> +        /* Protected Virtualization is a KVM/Hardware only feature */
> +        g_assert_not_reached();
> +    }
> +    return ret;
> +}
> +
>  /**
>   * s390_cpu_virt_mem_rw:
>   * @laddr:     the logical start address

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>


