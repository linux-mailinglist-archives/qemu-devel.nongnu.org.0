Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7110C433
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 08:06:04 +0100 (CET)
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaDsI-0006wq-PL
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 02:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaDpR-0005Gl-OW
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:03:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iaDnh-000090-Br
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:01:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60064
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iaDnZ-0008SD-I5
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574924465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eJlNdahEoofeza6LDygy8rzANSkgKv4iOjJrKqay5g=;
 b=Aut6OsEXX8qxkTIOMjUQNKBMSHKN7d2WCZvsLhG2wEMtFQT8ISNTQfPXxgr8yyhWMRiiSP
 YMjpHLfOim/zppcCqNpayLttaxQe9l+8VrM6YtyMN3bgHKNuvOdrazK+T5HZit5auVW9LS
 wTGBaaGgzocdkKeVY/DmZo6IBBhI4kU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-TcDC9LZlPpOm4yFavnWsPw-1; Thu, 28 Nov 2019 02:01:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC409107ACC9;
 Thu, 28 Nov 2019 07:01:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0521560BE1;
 Thu, 28 Nov 2019 07:00:55 +0000 (UTC)
Subject: Re: [PATCH v4 3/6] s390x: Move initial reset
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191127175046.4911-1-frankja@linux.ibm.com>
 <20191127175046.4911-4-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a49ea81f-7275-3d4b-a1e5-5f8c666ea127@redhat.com>
Date: Thu, 28 Nov 2019 08:00:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127175046.4911-4-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TcDC9LZlPpOm4yFavnWsPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2019 18.50, Janosch Frank wrote:
> Let's move the intial reset into the reset handler and cleanup
> afterwards.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/cpu-qom.h |  2 +-
>   target/s390x/cpu.c     | 44 ++++++++++++++++--------------------------
>   target/s390x/cpu.h     |  2 +-
>   target/s390x/sigp.c    |  2 +-
>   4 files changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
> index f3b71bac67..6f0a12042e 100644
> --- a/target/s390x/cpu-qom.h
> +++ b/target/s390x/cpu-qom.h
> @@ -36,6 +36,7 @@ typedef struct S390CPUDef S390CPUDef;
>   
>   typedef enum cpu_reset_type {
>       S390_CPU_RESET_NORMAL,
> +    S390_CPU_RESET_INITIAL,
>   } cpu_reset_type;
>   
>   /**
> @@ -62,7 +63,6 @@ typedef struct S390CPUClass {
>       void (*parent_reset)(CPUState *cpu);
>       void (*load_normal)(CPUState *cpu);
>       void (*reset)(CPUState *cpu, cpu_reset_type type);
> -    void (*initial_cpu_reset)(CPUState *cpu);
>   } S390CPUClass;
>   
>   typedef struct S390CPU S390CPU;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 67d6fbfa44..55e2d1fe7b 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -94,6 +94,23 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
>       s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>   
>       switch (type) {
> +    case S390_CPU_RESET_INITIAL:
> +        /* initial reset does not clear everything! */
> +        memset(&env->start_initial_reset_fields, 0,
> +               offsetof(CPUS390XState, end_reset_fields) -
> +               offsetof(CPUS390XState, start_initial_reset_fields));
> +
> +        /* architectured initial value for Breaking-Event-Address register */
> +        env->gbea = 1;
> +
> +        /* architectured initial values for CR 0 and 14 */
> +        env->cregs[0] = CR0_RESET;
> +        env->cregs[14] = CR14_RESET;
> +
> +        /* tininess for underflow is detected before rounding */
> +        set_float_detect_tininess(float_tininess_before_rounding,
> +                                  &env->fpu_status);
> +       /* fall through */
>       case S390_CPU_RESET_NORMAL:
>           env->pfault_token = -1UL;
>           env->bpbc = false;
> @@ -101,32 +118,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
>       default:
>           g_assert_not_reached();
>       }
> -}
> -
> -/* S390CPUClass::initial_reset() */
> -static void s390_cpu_initial_reset(CPUState *s)
> -{
> -    S390CPU *cpu = S390_CPU(s);
> -    CPUS390XState *env = &cpu->env;
> -
> -    s390_cpu_reset(s, S390_CPU_RESET_NORMAL);
> -    /* initial reset does not clear everything! */
> -    memset(&env->start_initial_reset_fields, 0,
> -        offsetof(CPUS390XState, end_reset_fields) -
> -        offsetof(CPUS390XState, start_initial_reset_fields));
> -
> -    /* architectured initial values for CR 0 and 14 */
> -    env->cregs[0] = CR0_RESET;
> -    env->cregs[14] = CR14_RESET;
> -
> -    /* architectured initial value for Breaking-Event-Address register */
> -    env->gbea = 1;
> -
> -    env->pfault_token = -1UL;
> -
> -    /* tininess for underflow is detected before rounding */
> -    set_float_detect_tininess(float_tininess_before_rounding,
> -                              &env->fpu_status);
>   
>       /* Reset state inside the kernel that we cannot access yet from QEMU. */
>       if (kvm_enabled()) {

You're doing the if (kvm_enabled()) now also for S390_CPU_RESET_NORMAL 
... is that OK? It's doing an KVM_S390_INITIAL_RESET ioctl(), so that 
sounds suspicious to me. Don't you have to add a check for type != 
S390_CPU_RESET_NORMAL here?

  Thomas


