Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F76320C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox55c-00080V-Ls; Mon, 21 Nov 2022 06:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox55S-0007wk-BC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:35:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox55Q-0005Y3-Gf
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:35:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l14so523866wrw.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ByHtPoB+P7/uH1wr4e3X4UYeEScZOfqXPAiucxdATp8=;
 b=sjSzqdWLBtvQ6hiwR1lRYNWjaJmOBMN5l6v1pjNeyiMKF7fJeEiz344kH2iLfvrqiR
 qemR1hhqRr/uTXkArjaieC/bcfhySa1VYXblfJnONr7LluVbyBmq7oLT20zOj8gayMuE
 n7DDq0J9xCSn6oEorgxlMCOQTse1UFROUgcimIMth1W8xku1mp7cs6gT6cWQI97XoUU7
 ZSBxJRQdOxknG9Ji2tmKZpabqOKzQpDv0Y8xImvzMbplsZnNnxBPH9CNeLoAlJ+omXZT
 42YvuFeXiDOrNR6EcSaEfrRiGK5xl/qm3T5HtRB2i4Vpig+d1sREDdhsqPhUtwGJLhq9
 9TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ByHtPoB+P7/uH1wr4e3X4UYeEScZOfqXPAiucxdATp8=;
 b=Yhy/i8cZbaDnuPBEgO+0R+yhS0W9kyt87SmMVT9tSkJR9lv19AVkdCQ1iMg0qReDGb
 Ean3w/PFLFFBFbjSJFDAdTHTjH5it3K0S42IglvyfgtEyN4y1SJifAS+FeiUA2aAyNap
 Jeq+wSfiofkdvhKhjJnTzY8BFTOd41u4iDU1qYe8ZRMs8yCfiSV7dZmHC+VdhvozhLnw
 5o/5jNItwvrRc2dKVOsTAmHoRp7P33qeElgPf5gpDMYIX09X9HFPQagwC8GRw+vVKaiC
 8vHoo4mfq6rLtcfjknIOU+vcF2USpismcWd8cmlW/nQTw+idSPG8G0Q5nIZRgYMacu1d
 bTTQ==
X-Gm-Message-State: ANoB5plbkZcGnO/zpzZL1yWvOcKzaz/pxF6naFh9ZTMhzaV4PfjRNvvC
 pXOrQE37n5l65eOR8xWvxBZ5UQ==
X-Google-Smtp-Source: AA0mqf7R8C9DC55+7v6/DaLR9OdftSxbDDkOMkIs3KW9sDZxZ63nyWBXpQHGR4EY4DA83rt4qXWY9w==
X-Received: by 2002:adf:dd81:0:b0:236:88a2:f072 with SMTP id
 x1-20020adfdd81000000b0023688a2f072mr10848719wrl.516.1669030538622; 
 Mon, 21 Nov 2022 03:35:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b002302dc43d77sm1909488wrw.115.2022.11.21.03.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:35:37 -0800 (PST)
Message-ID: <dcaf828f-5959-e49e-a854-632814772cc1@linaro.org>
Date: Mon, 21 Nov 2022 12:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/1] Dirty quota-based throttling of vcpus
Content-Language: en-US
To: Shivam Kumar <shivam.kumar1@nutanix.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, kvm@vger.kernel.org,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Anurag Madnawat <anurag.madnawat@nutanix.com>
References: <20221120225458.144802-1-shivam.kumar1@nutanix.com>
 <20221120225458.144802-2-shivam.kumar1@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221120225458.144802-2-shivam.kumar1@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 20/11/22 23:54, Shivam Kumar wrote:
> Introduces a (new) throttling scheme where QEMU defines a limit on the dirty
> rate of each vcpu of the VM. This limit is enfored on the vcpus in small
> intervals (dirty quota intervals) by allowing the vcpus to dirty only as many
> pages in these intervals as to maintain a dirty rate below the set limit.
> 
> Suggested-by: Shaju Abraham <shaju.abraham@nutanix.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Co-developed-by: Anurag Madnawat <anurag.madnawat@nutanix.com>
> Signed-off-by: Anurag Madnawat <anurag.madnawat@nutanix.com>
> Signed-off-by: Shivam Kumar <shivam.kumar1@nutanix.com>
> ---
>   accel/kvm/kvm-all.c       | 91 +++++++++++++++++++++++++++++++++++++++
>   include/exec/memory.h     |  3 ++
>   include/hw/core/cpu.h     |  5 +++
>   include/sysemu/kvm_int.h  |  1 +
>   linux-headers/linux/kvm.h |  9 ++++
>   migration/migration.c     | 22 ++++++++++
>   migration/migration.h     | 31 +++++++++++++
>   softmmu/memory.c          | 64 +++++++++++++++++++++++++++
>   8 files changed, 226 insertions(+)


>   void migrate_set_state(int *state, int old_state, int new_state);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bc0be3f62c..8f725a9b89 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -12,6 +12,7 @@
>    * Contributions after 2012-01-13 are licensed under the terms of the
>    * GNU GPL, version 2 or (at your option) any later version.
>    */
> +#include <linux/kvm.h>
>   
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
> @@ -34,6 +35,10 @@
>   #include "hw/boards.h"
>   #include "migration/vmstate.h"
>   #include "exec/address-spaces.h"
> +#include "hw/core/cpu.h"
> +#include "exec/target_page.h"
> +#include "migration/migration.h"
> +#include "sysemu/kvm_int.h"
>   
>   //#define DEBUG_UNASSIGNED
>   
> @@ -2869,6 +2874,46 @@ static unsigned int postponed_stop_flags;
>   static VMChangeStateEntry *vmstate_change;
>   static void memory_global_dirty_log_stop_postponed_run(void);
>   
> +static void init_vcpu_dirty_quota(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    uint64_t current_time = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
> +    cpu->kvm_run->dirty_quota = 1;
> +    cpu->dirty_quota_expiry_time = current_time;
> +}
> +
> +void dirty_quota_migration_start(void)
> +{
> +    if (!kvm_state->dirty_quota_supported) {

You are accessing an accelerator-specific variable in an 
accelerator-agnostic file, this doesn't sound correct.

You might introduce some hooks in AccelClass and implement them in
accel/kvm/. See for example gdbstub_supported_sstep_flags() and
kvm_gdbstub_sstep_flags().

> +        return;
> +    }
> +
> +    MigrationState *s = migrate_get_current();
> +    /* Assuming initial bandwidth to be 128 MBps. */
> +    double pages_per_second = (((double) 1e9) / 8.0) /
> +                                    (double) qemu_target_page_size();
> +    uint32_t nr_cpus;
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        nr_cpus++;
> +    }
> +    /*
> +     * Currently we are hardcoding this to 2. There are plans to allow the user
> +     * to manually select this ratio.
> +     */
> +    s->dirty_quota_throttle_ratio = 2;
> +    qatomic_set(&s->per_vcpu_dirty_rate_limit,
> +                pages_per_second / s->dirty_quota_throttle_ratio / nr_cpus);
> +
> +    qemu_spin_lock(&s->common_dirty_quota_lock);
> +    s->common_dirty_quota = 0;
> +    qemu_spin_unlock(&s->common_dirty_quota_lock);
> +
> +    CPU_FOREACH(cpu) {
> +        run_on_cpu(cpu, init_vcpu_dirty_quota, RUN_ON_CPU_NULL);
> +    }
> +}
> +
>   void memory_global_dirty_log_start(unsigned int flags)
>   {
>       unsigned int old_flags;
> @@ -2891,6 +2936,7 @@ void memory_global_dirty_log_start(unsigned int flags)
>       trace_global_dirty_changed(global_dirty_tracking);
>   
>       if (!old_flags) {
> +        dirty_quota_migration_start();
>           MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
>           memory_region_transaction_begin();
>           memory_region_update_pending = true;
> @@ -2898,6 +2944,23 @@ void memory_global_dirty_log_start(unsigned int flags)
>       }
>   }
>   
> +static void reset_vcpu_dirty_quota(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    cpu->kvm_run->dirty_quota = 0;
> +}
> +
> +void dirty_quota_migration_stop(void)
> +{
> +    if (!kvm_state->dirty_quota_supported) {
> +        return;
> +    }
> +
> +    CPUState *cpu;
> +    CPU_FOREACH(cpu) {
> +        run_on_cpu(cpu, reset_vcpu_dirty_quota, RUN_ON_CPU_NULL);
> +    }
> +}
> +
>   static void memory_global_dirty_log_do_stop(unsigned int flags)
>   {
>       assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> @@ -2907,6 +2970,7 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
>       trace_global_dirty_changed(global_dirty_tracking);
>   
>       if (!global_dirty_tracking) {
> +        dirty_quota_migration_stop();
>           memory_region_transaction_begin();
>           memory_region_update_pending = true;
>           memory_region_transaction_commit();


