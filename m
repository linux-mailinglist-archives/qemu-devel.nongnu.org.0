Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169C44D3B4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:03:31 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5zV-0001BO-KF
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:03:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml5xh-0000Nx-Pl
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml5xf-0001BK-E7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636621293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeSlpDQmSvAi+4cJ4dWgDhQuGwfmgsy4XSgnInmx6DQ=;
 b=GsGjD1XyiPBFZZMEoIqOTVallvQSFAgdmS1R9rBUuG8ateb8JFOYg5PP3Jg8zag14a/2Lz
 XHFW1g9o9MGXwoHcRY7CyvMXpRjdQ8nK9/z59+R6fKQe1VKaB+dUkjZXDvW6mczP0GAs5l
 E6VYFI5NseWRE96ZhQDo8Uut6Ne65BA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-JTBVwJwTMOKhhOERfNZNKA-1; Thu, 11 Nov 2021 04:01:32 -0500
X-MC-Unique: JTBVwJwTMOKhhOERfNZNKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so1510712wma.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 01:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=eeSlpDQmSvAi+4cJ4dWgDhQuGwfmgsy4XSgnInmx6DQ=;
 b=OTEYxZADbqrRkrFqcm9IOG+P0+/EyyWuIFGyVYgfGvwOKXnXsVID2qIjF8URLwW2qV
 r0S66CiDQ3QTctU2XcK0SYTCKctTXscReVzYqo0SP8jPTD8givCePhea7EFNs/ZzYF01
 SxZT8mDuqot+jcDFkrrDJjEiEbDIYSTP/azC/Ecgi8VEuoRBLQgbyAIZW7MW/Xxu0E+3
 qYzb90sBdEcTTPrZSuIVz1cj/9dzz2hzltlN03mo0psxCuYC02IAEXlisiKWg5mHKHwL
 d54NmYvRC7UmKg8g2lRPcefqG38T0l5elGHnm9Jq+B3LTA+Bz2wcvuaAT5MFDN/l0F1/
 7mEg==
X-Gm-Message-State: AOAM5322leyxFbGH/OsORIwquCgtviicVgYQKu7NGGRXhBabTqZxv1AK
 IlCRIf0lGsPAof2QjzAIqAuvZy1/STDerrYEpZIANQW6ol9FgAI3JSOP95q6I0xhVr5oV1iywSR
 sg0EEx/oQmrys7Q0=
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr24367079wms.103.1636621291130; 
 Thu, 11 Nov 2021 01:01:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm2WbG/lbBsh2fTF5VRegrw9G68giZP3XQ3k3XkBL/5skXNyVmhiFTJO7LViS7bQrVvMcuyw==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr24367034wms.103.1636621290761; 
 Thu, 11 Nov 2021 01:01:30 -0800 (PST)
Received: from [192.168.3.132] (p4ff23ee8.dip0.t-ipconnect.de. [79.242.62.232])
 by smtp.gmail.com with ESMTPSA id e7sm2760377wrg.31.2021.11.11.01.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 01:01:30 -0800 (PST)
Message-ID: <13499d9f-652b-ea75-4ad7-32a347297a55@redhat.com>
Date: Thu, 11 Nov 2021 10:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211110204528.1378524-1-farman@linux.ibm.com>
 <20211110204528.1378524-3-farman@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v3 2/2] s390x: Implement the USER_SIGP_BUSY capability
In-Reply-To: <20211110204528.1378524-3-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.11.21 21:45, Eric Farman wrote:
> With the USER_SIGP capability, the kernel will pass most (but not all)
> SIGP orders to userspace for processing. But that means that the kernel
> is unable to determine if/when the order has been completed by userspace,
> and could potentially return an incorrect answer (CC1 with status bits
> versus CC2 indicating BUSY) for one of the remaining in-kernel orders.
> 
> With a new USER_SIGP_BUSY capability, userspace can tell the kernel when
> it is started processing a SIGP order and when it has finished, such that
> the in-kernel orders can be returned with the BUSY condition between the
> two IOCTLs.
> 
> Let's use the new capability in QEMU.

This looks much better. A suggestion on how to make it even simpler below.

>      }
>      si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
> @@ -375,6 +378,10 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
>          return SIGP_CC_BUSY;
>      }
>  
> +    if (s390_cpu_set_sigp_busy(dst_cpu) == -EBUSY) {
> +        return SIGP_CC_BUSY;
> +    }


I'd assume we want something like this instead:

--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -355,6 +355,12 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
     }
 }
 
+static bool sigp_dst_is_busy(S390CPU *dst_cpu)
+{
+    return dst_cpu->env.sigp_order != 0 ||
+           s390_cpu_set_sigp_busy(dst_cpu) == -EBUSY;
+}
+
 static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
                                   uint64_t param, uint64_t *status_reg)
 {
@@ -369,7 +375,7 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
     }
 
     /* only resets can break pending orders */
-    if (dst_cpu->env.sigp_order != 0 &&
+    if (sigp_dst_is_busy(dst_cpu) &&
         order != SIGP_CPU_RESET &&
         order != SIGP_INITIAL_CPU_RESET) {
         return SIGP_CC_BUSY;




But as raised, it might be good enough (and simpler) to
special-case SIGP STOP * only, because pending SIGP STOP that could take
forever and is processed asynchronously is AFAIU the only real case that's
problematic. We'll also have to handle the migration case with SIGP STOP,
so below would be my take (excluding the KVM parts from your patch)



diff --git a/slirp b/slirp
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0-dirty
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ccdbaf84d5..6ead62d1fd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -114,7 +114,7 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
     DeviceState *dev = DEVICE(s);
 
     scc->parent_reset(dev);
-    cpu->env.sigp_order = 0;
+    s390_cpu_set_sigp_busy(cpu, 0);
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 
     switch (type) {
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 37a076858c..d4ad2534a5 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -41,6 +41,14 @@ static int cpu_post_load(void *opaque, int version_id)
         tcg_s390_tod_updated(CPU(cpu), RUN_ON_CPU_NULL);
     }
 
+    /*
+     * Make sure KVM is aware of the BUSY SIGP order, reset it the official
+     * way.
+     */
+    if (cpu->env.sigp_order) {
+        s390_cpu_set_sigp_busy(cpu, cpu->env.sigp_order);
+    }
+
     return 0;
 }
 
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 1a178aed41..690cadef77 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -402,6 +402,7 @@ void s390x_translate_init(void);
 
 
 /* sigp.c */
+void s390_cpu_set_sigp_busy(S390CPU *cpu, uint8_t sigp_order);
 int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);
 void do_stop_interrupt(CPUS390XState *env);
 
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 51c727834c..9640267124 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -27,6 +27,33 @@ typedef struct SigpInfo {
     uint64_t *status_reg;
 } SigpInfo;
 
+void s390_cpu_set_sigp_busy(S390CPU *cpu, uint8_t sigp_order)
+{
+    /*
+     * For now we only expect one of these orders that are processed
+     * asynchronously, or clearing the busy order.
+     */
+    g_assert(sigp_order == SIGP_STOP || sigp_order == SIGP_STOP_STORE_STATUS ||
+             !sigp_order);
+    if (kvm_enabled()) {
+        /*
+         * Note: We're the only ones setting/resetting a CPU in KVM busy, and
+         * we always update the state in KVM when updating the state
+         * (cpu->env.sigp_order) in QEMU.
+         */
+        if (sigp_order)
+            kvm_s390_vcpu_set_sigp_busy(cpu);
+        else
+            kvm_s390_vcpu_reset_sigp_busy(cpu);
+    }
+    cpu->env.sigp_order = sigp_order;
+}
+
+static bool s390x_cpu_is_sigp_busy(S390CPU *cpu)
+{
+    return cpu->env.sigp_order != 0;
+}
+
 static void set_sigp_status(SigpInfo *si, uint64_t status)
 {
     *si->status_reg &= 0xffffffff00000000ULL;
@@ -119,7 +146,7 @@ static void sigp_stop(CPUState *cs, run_on_cpu_data arg)
         s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
     } else {
         /* execute the stop function */
-        cpu->env.sigp_order = SIGP_STOP;
+        s390_cpu_set_sigp_busy(cpu, SIGP_STOP);
         cpu_inject_stop(cpu);
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
@@ -137,7 +164,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
 
     switch (s390_cpu_get_state(cpu)) {
     case S390_CPU_STATE_OPERATING:
-        cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
+        s390_cpu_set_sigp_busy(cpu, SIGP_STOP_STORE_STATUS);
         cpu_inject_stop(cpu);
         /* store will be performed in do_stop_interrup() */
         break;
@@ -369,7 +396,7 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
     }
 
     /* only resets can break pending orders */
-    if (dst_cpu->env.sigp_order != 0 &&
+    if (s390x_cpu_is_sigp_busy(dst_cpu) &&
         order != SIGP_CPU_RESET &&
         order != SIGP_INITIAL_CPU_RESET) {
         return SIGP_CC_BUSY;
@@ -485,7 +512,7 @@ void do_stop_interrupt(CPUS390XState *env)
     if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
     }
-    env->sigp_order = 0;
+    s390_cpu_set_sigp_busy(cpu, 0);
     env->pending_int &= ~INTERRUPT_STOP;
 }
 


We can optimize in s390_cpu_set_sigp_busy() to not trigger an ioctl
if not necessary based on the old value of env->sigp_order. Only the
migration path needs some tweaking then.

-- 
Thanks,

David / dhildenb


