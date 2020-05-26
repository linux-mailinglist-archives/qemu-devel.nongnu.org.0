Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C619F3D6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 12:49:31 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLPJq-000150-GT
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 06:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1jLPJ5-0000az-EP
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 06:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1jLPJ4-0000DO-3f
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 06:48:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1jLPJ3-0000D3-VK
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 06:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586170121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W5ANCArgeCX58sOWfbrW5bwqTAoju/NRWCqq/JHxePE=;
 b=f/EaFgO5L7hpvRQrR0JMsB0s0DW005D64ft+yt6q/wmutN0Mx+5RG/gIhEAegFx2qoZSwY
 n4tN6dNrCbtNVa0Ax0gS+pMVlKGZCb6bLXLvjss4m1YWH/7NHtDEWTnUu9mauP4BMeZsxf
 Q5JpUO6yZ71bWuyJKIGDpAkiDT0gLZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-8UdoudFTNdWNQICYstbKJg-1; Mon, 06 Apr 2020 06:48:37 -0400
X-MC-Unique: 8UdoudFTNdWNQICYstbKJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7457B1005513;
 Mon,  6 Apr 2020 10:48:36 +0000 (UTC)
Received: from [10.36.114.88] (ovpn-114-88.ams2.redhat.com [10.36.114.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9106492D57;
 Mon,  6 Apr 2020 10:48:34 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] s390x/s390-virtio-ccw: Fix build on systems
 without KVM
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>
References: <20200406100158.5940-1-borntraeger@de.ibm.com>
 <20200406100158.5940-2-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <87eb8a33-644d-372c-2041-892076234825@redhat.com>
Date: Mon, 6 Apr 2020 12:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406100158.5940-2-borntraeger@de.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.20 12:01, Christian Borntraeger wrote:
> linux/kvm.h is not available on all platforms. Let us move
> s390_machine_inject_pv_error into pv.c as it uses KVM structures.
> Also rename the function to s390_pv_inject_reset_error.
> 
> While at it, ipl.h needs an include for "exec/address-spaces.h"
> as it uses address_space_memory.
> 
> Fixes: 49fc3220175e ("s390x: protvirt: Support unpack facility")
> Reported-by: Bruce Rogers <brogers@suse.com>
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/ipl.h             |  1 +
>  hw/s390x/pv.c              | 11 +++++++++++
>  hw/s390x/s390-virtio-ccw.c | 12 +-----------
>  include/hw/s390x/pv.h      |  3 +++
>  4 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
> index 89b3044d7a..53cc9eb5ac 100644
> --- a/hw/s390x/ipl.h
> +++ b/hw/s390x/ipl.h
> @@ -14,6 +14,7 @@
>  #define HW_S390_IPL_H
>  
>  #include "cpu.h"
> +#include "exec/address-spaces.h"
>  #include "hw/qdev-core.h"
>  
>  struct IPLBlockPVComp {
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index d3333d6e13..68dbc022d0 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -13,8 +13,10 @@
>  
>  #include <linux/kvm.h>
>  
> +#include "cpu.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
> +#include "hw/s390x/ipl.h"
>  #include "hw/s390x/pv.h"
>  
>  static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
> @@ -100,3 +102,12 @@ void s390_pv_unshare(void)
>  {
>      s390_pv_cmd_exit(KVM_PV_VM_UNSHARE_ALL, NULL);
>  }
> +
> +void s390_pv_inject_reset_error(CPUState *cs)
> +{
> +    int r1 = (cs->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
> +    CPUS390XState *env = &S390_CPU(cs)->env;
> +
> +    /* Report that we are unable to enter protected mode */
> +    env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
> +}
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index b268907395..45292fb5a8 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -45,7 +45,6 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/balloon.h"
>  #include "hw/s390x/pv.h"
> -#include <linux/kvm.h>
>  #include "migration/blocker.h"
>  
>  static Error *pv_mig_blocker;
> @@ -390,15 +389,6 @@ out_err:
>      return rc;
>  }
>  
> -static void s390_machine_inject_pv_error(CPUState *cs)
> -{
> -    int r1 = (cs->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
> -    CPUS390XState *env = &S390_CPU(cs)->env;
> -
> -    /* Report that we are unable to enter protected mode */
> -    env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
> -}
> -
>  static void s390_pv_prepare_reset(S390CcwMachineState *ms)
>  {
>      CPUState *cs;
> @@ -484,7 +474,7 @@ static void s390_machine_reset(MachineState *machine)
>          run_on_cpu(cs, s390_do_cpu_reset, RUN_ON_CPU_NULL);
>  
>          if (s390_machine_protect(ms)) {
> -            s390_machine_inject_pv_error(cs);
> +            s390_pv_inject_reset_error(cs);
>              /*
>               * Continue after the diag308 so the guest knows something
>               * went wrong.
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index c6cb360f2f..522ca6a04e 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -13,6 +13,7 @@
>  #define HW_S390_PV_H
>  
>  #ifdef CONFIG_KVM
> +#include "cpu.h"
>  #include "hw/s390x/s390-virtio-ccw.h"
>  
>  static inline bool s390_is_pv(void)
> @@ -41,6 +42,7 @@ int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
>  void s390_pv_perf_clear_reset(void);
>  int s390_pv_verify(void);
>  void s390_pv_unshare(void);
> +void s390_pv_inject_reset_error(CPUState *cs);
>  #else /* CONFIG_KVM */
>  static inline bool s390_is_pv(void) { return false; }
>  static inline int s390_pv_vm_enable(void) { return 0; }
> @@ -50,6 +52,7 @@ static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) {
>  static inline void s390_pv_perf_clear_reset(void) {}
>  static inline int s390_pv_verify(void) { return 0; }
>  static inline void s390_pv_unshare(void) {}
> +static inline void s390_pv_inject_reset_error(CPUState *cs) {};
>  #endif /* CONFIG_KVM */
>  
>  #endif /* HW_S390_PV_H */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


