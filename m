Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBA5330AB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 20:50:03 +0200 (CEST)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntZbW-0005Y3-8N
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 14:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntZWZ-0003WR-3q
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntZWV-0002Nr-Bs
 for qemu-devel@nongnu.org; Tue, 24 May 2022 14:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653417888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a9949aUu/KdelWyF0tY2WZylYGmC+BPcuPRwpqbhw28=;
 b=WD8vpSe3Z9qpIuPjxZOFYwbE4OitCh0ezDwSwZdZmo5TgAcRY9jW4I/S89RXIj6VIlTlWT
 4IDQfUn9Ag3zMW1ciAXIzLfKEBeJjss8auTzhKjaK2h5Zf8WMO/DRbOQUFLddyVkxwDMrj
 Jjl/OKfyWKVTaOywQPB6+ogNvTOvlZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-MLnSGm8PME6eCjUvOEUBkQ-1; Tue, 24 May 2022 14:44:47 -0400
X-MC-Unique: MLnSGm8PME6eCjUvOEUBkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso1685484wmb.5
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 11:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a9949aUu/KdelWyF0tY2WZylYGmC+BPcuPRwpqbhw28=;
 b=NhQ5iRYaxIfxb85TsYn/EvCCOlCNH8aGX8pemPbCxCJcvsDdJJe5wSorVjB2ayGUHE
 tXnfnwI1fVv8nR7oDh00R4xKfFYF4zpzAkIDvNy2DoRnnLjxH7SLl5GH7HUIrkbQzABX
 8QDkpbWwEFgOgK2wBm5ovUdEqW+lq7e6kBjr6hIMQfpoDpZU4hMmPbmC5BPSVejdyb6w
 21XlJFseSIOfMrsWSq5Xv3Bbhf05H8QebjqInwKS03j0C1kTYSMIYGyUfFlc+IqsL+pE
 r8fWsI3fSwTHmNtGzTOUPZ2oP+1E7d00HDHqttU9BTtJBW9WeB6W2bvi+eqGnpV1ddZf
 rNEg==
X-Gm-Message-State: AOAM5310cqyRMmfl21e39R1tKRyJNh/jy32sxkVvAUshdkSIsIPr6FLr
 MJ3b3WB9zuHZa7wupAdld0mrXBKnS8SKk7w3LUGgDhrMROZ9PDrRdRg8UCw/QGzdRUB30dzHH2q
 HB0gbRLnS9A/EVo8=
X-Received: by 2002:adf:ed01:0:b0:20c:c137:aaeb with SMTP id
 a1-20020adfed01000000b0020cc137aaebmr23978649wro.638.1653417885084; 
 Tue, 24 May 2022 11:44:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyewU6a2M4vsdnE8xn5R1avqc0eAppam99pgSHSx7SVVen1NwdIAiGumCSxWZ0HswhapUXoLQ==
X-Received: by 2002:adf:ed01:0:b0:20c:c137:aaeb with SMTP id
 a1-20020adfed01000000b0020cc137aaebmr23978634wro.638.1653417884735; 
 Tue, 24 May 2022 11:44:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g1-20020a7bc4c1000000b0039736892653sm12259wmk.27.2022.05.24.11.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 11:44:44 -0700 (PDT)
Date: Tue, 24 May 2022 19:44:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 2/8] kvm: Support for querying fd-based stats
Message-ID: <Yo0nmQkmuYtSnjP4@work-vm>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090058.1195767-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516090058.1195767-3-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
> 
> Add support for querying fd-based KVM stats - as introduced by Linux kernel
> commit:
> 
> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")
> 
> This allows the user to analyze the behavior of the VM without access
> to debugfs.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 403 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/stats.json     |   2 +-
>  2 files changed, 404 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 32e177bd26..6a6bbe2994 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -47,6 +47,7 @@
>  #include "kvm-cpus.h"
>  
>  #include "hw/boards.h"
> +#include "monitor/stats.h"
>  
>  /* This check must be after config-host.h is included */
>  #ifdef CONFIG_EVENTFD
> @@ -2310,6 +2311,9 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
>  
> +static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp);
> +static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
> +
>  static int kvm_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -2638,6 +2642,10 @@ static int kvm_init(MachineState *ms)
>          }
>      }
>  
> +    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
> +        add_stats_callbacks(query_stats_cb, query_stats_schemas_cb);
> +    }
> +
>      return 0;
>  
>  err:
> @@ -3697,3 +3705,398 @@ static void kvm_type_init(void)
>  }
>  
>  type_init(kvm_type_init);
> +
> +typedef struct StatsArgs {
> +    union StatsResultsType {
> +        StatsResultList **stats;
> +        StatsSchemaList **schema;
> +    } result;
> +    Error **errp;
> +} StatsArgs;
> +
> +static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
> +                                    uint64_t *stats_data,
> +                                    StatsList *stats_list,
> +                                    Error **errp)
> +{
> +
> +    StatsList *stats_entry;
> +    Stats *stats;
> +    uint64List *val_list = NULL;

A comment here something like:
/* Only add stats that we understand */  ?
> +    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
> +    case KVM_STATS_TYPE_CUMULATIVE:
> +    case KVM_STATS_TYPE_INSTANT:
> +    case KVM_STATS_TYPE_PEAK:
> +    case KVM_STATS_TYPE_LINEAR_HIST:
> +    case KVM_STATS_TYPE_LOG_HIST:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
> +    case KVM_STATS_UNIT_NONE:
> +    case KVM_STATS_UNIT_BYTES:
> +    case KVM_STATS_UNIT_CYCLES:
> +    case KVM_STATS_UNIT_SECONDS:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
> +    case KVM_STATS_BASE_POW10:
> +    case KVM_STATS_BASE_POW2:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    /* Alloc and populate data list */
> +    stats_entry = g_new0(StatsList, 1);
> +    stats = g_new0(Stats, 1);
> +    stats->name = g_strdup(pdesc->name);
> +    stats->value = g_new0(StatsValue, 1);;
> +
> +    if (pdesc->size == 1) {
> +        stats->value->u.scalar = *stats_data;
> +        stats->value->type = QTYPE_QNUM;
> +    } else {
> +        int i;
> +        for (i = 0; i < pdesc->size; i++) {
> +            uint64List *val_entry = g_new0(uint64List, 1);
> +            val_entry->value = stats_data[i];
> +            val_entry->next = val_list;
> +            val_list = val_entry;
> +        }
> +        stats->value->u.list = val_list;
> +        stats->value->type = QTYPE_QLIST;
> +    }
> +
> +    stats_entry->value = stats;
> +    stats_entry->next = stats_list;

Can all that use QAPI_LIST_PREPEND?

> +    return stats_entry;
> +}
> +
> +static StatsSchemaValueList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
> +                                                 StatsSchemaValueList *list,
> +                                                 Error **errp)
> +{
> +    StatsSchemaValueList *schema_entry = g_new0(StatsSchemaValueList, 1);
> +    schema_entry->value = g_new0(StatsSchemaValue, 1);
> +
> +    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
> +    case KVM_STATS_TYPE_CUMULATIVE:
> +        schema_entry->value->type = STATS_TYPE_CUMULATIVE;
> +        break;
> +    case KVM_STATS_TYPE_INSTANT:
> +        schema_entry->value->type = STATS_TYPE_INSTANT;
> +        break;
> +    case KVM_STATS_TYPE_PEAK:
> +        schema_entry->value->type = STATS_TYPE_PEAK;
> +        break;
> +    case KVM_STATS_TYPE_LINEAR_HIST:
> +        schema_entry->value->type = STATS_TYPE_LINEAR_HISTOGRAM;
> +        schema_entry->value->bucket_size = pdesc->bucket_size;
> +        schema_entry->value->has_bucket_size = true;
> +        break;
> +    case KVM_STATS_TYPE_LOG_HIST:
> +        schema_entry->value->type = STATS_TYPE_LOG2_HISTOGRAM;
> +        break;
> +    default:
> +        goto exit;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
> +    case KVM_STATS_UNIT_NONE:
> +        break;
> +    case KVM_STATS_UNIT_BYTES:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_BYTES;
> +        break;
> +    case KVM_STATS_UNIT_CYCLES:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_CYCLES;
> +        break;
> +    case KVM_STATS_UNIT_SECONDS:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_SECONDS;

Had you considered making these UNIT_SECONDS, I'm just thinking there
are probably other interfaces that parse things with units.

> +        break;
> +    default:
> +        goto exit;
> +    }
> +
> +    schema_entry->value->exponent = pdesc->exponent;
> +    if (pdesc->exponent) {
> +        switch (pdesc->flags & KVM_STATS_BASE_MASK) {
> +        case KVM_STATS_BASE_POW10:
> +            schema_entry->value->has_base = true;
> +            schema_entry->value->base = 10;
> +            break;
> +        case KVM_STATS_BASE_POW2:
> +            schema_entry->value->has_base = true;
> +            schema_entry->value->base = 2;
> +            break;
> +        default:
> +            goto exit;
> +        }
> +    }
> +
> +    schema_entry->value->name = g_strdup(pdesc->name);
> +    schema_entry->next = list;
> +    return schema_entry;
> +exit:
> +    g_free(schema_entry->value);
> +    g_free(schema_entry);
> +    return list;
> +}
> +
> +/* Cached stats descriptors */
> +typedef struct StatsDescriptors {
> +    char *ident; /* 'vm' or vCPU qom path */
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    QTAILQ_ENTRY(StatsDescriptors) next;
> +} StatsDescriptors;
> +
> +static QTAILQ_HEAD(, StatsDescriptors) stats_descriptors =
> +    QTAILQ_HEAD_INITIALIZER(stats_descriptors);
> +
> +static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd,
> +                                                Error **errp)
> +{
> +    StatsDescriptors *descriptors;
> +    const char *ident;
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    size_t size_desc;
> +    ssize_t ret;
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        ident = StatsTarget_str(STATS_TARGET_VM);
> +        break;
> +    case STATS_TARGET_VCPU:
> +        ident = current_cpu->parent_obj.canonical_path;
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    QTAILQ_FOREACH(descriptors, &stats_descriptors, next) {
> +        if (g_str_equal(descriptors->ident, ident)) {
> +            return descriptors;
> +        }
> +    }
> +
> +    descriptors = g_new0(StatsDescriptors, 1);
> +
> +    /* Read stats header */
> +    kvm_stats_header = g_malloc(sizeof(*kvm_stats_header));
> +    ret = read(stats_fd, kvm_stats_header, sizeof(*kvm_stats_header));
> +    if (ret != sizeof(*kvm_stats_header)) {
> +        error_setg(errp, "KVM stats: failed to read stats header: "
> +                   "expected %zu actual %zu",
> +                   sizeof(*kvm_stats_header), ret);
> +        return NULL;
> +    }
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Read stats descriptors */
> +    kvm_stats_desc = g_malloc0_n(kvm_stats_header->num_desc, size_desc);
> +    ret = pread(stats_fd, kvm_stats_desc,
> +                size_desc * kvm_stats_header->num_desc,
> +                kvm_stats_header->desc_offset);
> +
> +    if (ret != size_desc * kvm_stats_header->num_desc) {
> +        error_setg(errp, "KVM stats: failed to read stats descriptors: "
> +                   "expected %zu actual %zu",
> +                   size_desc * kvm_stats_header->num_desc, ret);
> +        g_free(descriptors);
> +        return NULL;
> +    }
> +    descriptors->kvm_stats_header = kvm_stats_header;
> +    descriptors->kvm_stats_desc = kvm_stats_desc;
> +    descriptors->ident = g_strdup(ident);
> +    QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
> +    return descriptors;
> +}
> +
> +static void query_stats(StatsResultList **result, StatsTarget target,
> +                        int stats_fd, Error **errp)
> +{
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    StatsDescriptors *descriptors;
> +    g_autofree uint64_t *stats_data = NULL;
> +    struct kvm_stats_desc *pdesc;
> +    StatsList *stats_list = NULL;
> +    size_t size_desc, size_data = 0;
> +    ssize_t ret;
> +    int i;
> +
> +    descriptors = find_stats_descriptors(target, stats_fd, errp);
> +    if (!descriptors) {
> +        return;
> +    }
> +
> +    kvm_stats_header = descriptors->kvm_stats_header;
> +    kvm_stats_desc = descriptors->kvm_stats_desc;
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Tally the total data size; read schema data */
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +        size_data += pdesc->size * sizeof(*stats_data);
> +    }
> +
> +    stats_data = g_malloc0(size_data);
> +    ret = pread(stats_fd, stats_data, size_data, kvm_stats_header->data_offset);
> +
> +    if (ret != size_data) {
> +        error_setg(errp, "KVM stats: failed to read data: "
> +                   "expected %zu actual %zu", size_data, ret);
> +        return;
> +    }
> +
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        uint64_t *stats;
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +
> +        /* Add entry to the list */
> +        stats = (void *)stats_data + pdesc->offset;
> +        stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
> +    }
> +
> +    if (!stats_list) {
> +        return;
> +    }
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        add_stats_entry(result, STATS_PROVIDER_KVM, NULL, stats_list);
> +        break;
> +    case STATS_TARGET_VCPU:
> +        add_stats_entry(result, STATS_PROVIDER_KVM,
> +                        current_cpu->parent_obj.canonical_path,
> +                        stats_list);
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void query_stats_schema(StatsSchemaList **result, StatsTarget target,
> +                               int stats_fd, Error **errp)
> +{
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    StatsDescriptors *descriptors;
> +    struct kvm_stats_desc *pdesc;
> +    StatsSchemaValueList *stats_list = NULL;
> +    size_t size_desc;
> +    int i;
> +
> +    descriptors = find_stats_descriptors(target, stats_fd, errp);
> +    if (!descriptors) {
> +        return;
> +    }
> +
> +    kvm_stats_header = descriptors->kvm_stats_header;
> +    kvm_stats_desc = descriptors->kvm_stats_desc;
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Tally the total data size; read schema data */
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +        stats_list = add_kvmschema_entry(pdesc, stats_list, errp);
> +    }
> +
> +    add_stats_schema(result, STATS_PROVIDER_KVM, target, stats_list);
> +}
> +
> +static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
> +{
> +    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> +    Error *local_err = NULL;
> +
> +    if (stats_fd == -1) {
> +        error_setg(&local_err, "KVM stats: ioctl failed");
> +        error_propagate(kvm_stats_args->errp, local_err);
> +        return;
> +    }
> +    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
> +                kvm_stats_args->errp);
> +    close(stats_fd);
> +}
> +
> +static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
> +{
> +    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> +    Error *local_err = NULL;
> +
> +    if (stats_fd == -1) {
> +        error_setg(&local_err, "KVM stats: ioctl failed");

Maybe error_setg_errno ?

> +        error_propagate(kvm_stats_args->errp, local_err);
> +        return;
> +    }
> +    query_stats_schema(kvm_stats_args->result.schema, STATS_TARGET_VCPU, stats_fd,
> +                       kvm_stats_args->errp);
> +    close(stats_fd);
> +}
> +
> +static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
> +{
> +    KVMState *s = kvm_state;
> +    CPUState *cpu;
> +    int stats_fd;
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +    {
> +        stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +        if (stats_fd == -1) {
> +            error_setg(errp, "KVM stats: ioctl failed");
> +            return;
> +        }
> +        query_stats(result, target, stats_fd, errp);
> +        close(stats_fd);
> +        break;
> +    }
> +    case STATS_TARGET_VCPU:
> +    {
> +        StatsArgs stats_args;
> +        stats_args.result.stats = result;
> +        stats_args.errp = errp;
> +        CPU_FOREACH(cpu) {
> +            run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
> +        }
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +}
> +
> +void query_stats_schemas_cb(StatsSchemaList **result, Error **errp)
> +{
> +    StatsArgs stats_args;
> +    KVMState *s = kvm_state;
> +    int stats_fd;
> +
> +    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +    if (stats_fd == -1) {
> +        error_setg(errp, "KVM stats: ioctl failed");
> +        return;
> +    }
> +    query_stats_schema(result, STATS_TARGET_VM, stats_fd, errp);
> +    close(stats_fd);
> +
> +    stats_args.result.schema = result;
> +    stats_args.errp = errp;
> +    run_on_cpu(first_cpu, query_stats_schema_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
> +}
> diff --git a/qapi/stats.json b/qapi/stats.json
> index f0656a6435..382223e197 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -51,7 +51,7 @@
>  # Since: 7.1
>  ##
>  { 'enum': 'StatsProvider',
> -  'data': [ ] }
> +  'data': [ 'kvm' ] }
>  
>  ##
>  # @StatsTarget:
> -- 
> 2.36.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


