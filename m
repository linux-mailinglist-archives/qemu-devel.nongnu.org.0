Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297251168F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:14:05 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgYV-0008DS-NO
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njgV6-0006DF-4u
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:10:32 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njgV3-0000GX-NE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:10:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id e23so1680580eda.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CCVJne9bsILDKrIVN15JVGTnOCM5P57l3si/Rl82zzA=;
 b=RiL9w8CKfHvwwBfhOiYayVX8kGngcXEkv54Smd2fupT1hB3598ErQSeYx1Vljq+NCJ
 KinhQ10fiRYXoEBIpnJZ9aNiL3qj0IQIKlnHIrvlzlyKXDYillo5COr41y9f6D0bLIPc
 1xmXApz4tvx9UOrbcRPG0mgpMjaBQGTXdoovAKM7gzVi3x+vaoEMTFV3V2Qcm3bbtElJ
 DKq9XZavbGMLWqSMc3fVYN/9865CqOi3Iq9HQd+JaQcXRyVqabcdvNlsWhG4mEniwv4U
 XXdC31/L5fPrPbofFcSc3chb13k/Yg2hIl5aMNWvuqO+wC6yPpmQRTFyf1nxKMcyrUDw
 s/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CCVJne9bsILDKrIVN15JVGTnOCM5P57l3si/Rl82zzA=;
 b=ZqkZp09kwhnkP5o02YqgFz+XCB8BAO4njgQ5mSpK61FtIc/l4Qjp4eU1DjTEzVdAqF
 Ia8KCVR/vsBz/OW/K2m+G/Wt1/29VQaSZuFdT2XPsgS8iFTHms4ZZAX8KDVRPIWaCe5n
 jkldV8lcDFBq8httRfGp55a2YmYHVW4+v/InyCLIyof3TqbP8lRycVCOBh/e9yhqI6Zx
 hl6UikWS88Up8iRR+GsBXLvjqbJO+tpsD+Lq6CWZ9w66+4LQ0c20YlDrl9D7NNl3O1Am
 TV8ZtNSTMn3wywXZjQlyzx06kUTMm7EwYwrP2TB+7NE2TbAhSOnJH8QXu39kz24zlPwf
 z/og==
X-Gm-Message-State: AOAM532JoppExowW+/XvDzmEXsSN5f2i1HORxLzj/WJ94Cw99nNgD42w
 eryo9wHcObqOKKOsG96fmaw=
X-Google-Smtp-Source: ABdhPJz84sMB9Cg9GpKFqGkzTe5QAWQGlz1RWOCq6zdTfKSqFX9Phr8ELWHvYdQKrjqJiwSLsjcv/w==
X-Received: by 2002:a05:6402:42cb:b0:425:d34f:e8ca with SMTP id
 i11-20020a05640242cb00b00425d34fe8camr22759759edc.126.1651061428062; 
 Wed, 27 Apr 2022 05:10:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 hh4-20020a170906a94400b006f37c3f476bsm5382317ejb.139.2022.04.27.05.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 05:10:27 -0700 (PDT)
Message-ID: <de802fd6-94f9-f6ab-c25b-249720c2b98d@redhat.com>
Date: Wed, 27 Apr 2022 14:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com> <YmkKsQ9rFh+Ydfsu@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmkKsQ9rFh+Ydfsu@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 11:19, Dr. David Alan Gilbert wrote:
>> { "return": [
>>       { "provider": "kvm",
>>         "stats": [
>>            { "name": "max_mmu_page_hash_collisions", "value": 0 },
>>            { "name": "max_mmu_rmap_size", "value": 0 },
>>            { "name": "nx_lpage_splits", "value": 148 },
> 
> Is there any hierarchy to the naming or is it just a big flat name
> space?

Within KVM no, but there is a hierarchy of provider->stat.

>>      { "provider": "kvm",
>>        "target": "vm",
>>        "stats": [
>>          { "name": "max_mmu_page_hash_collisions",
>>             "unit": "none",
>>             "base": 10,
>>             "exponent": 0,
>>             "type": "peak" },
>>          ... ]
>>      },
> 
> Is there some way to reset the peak or cumulative values?

Not yet, but the plan is to allow pwrite for peak and cumulative 
statistics, and possibly for histograms as well.  Alternatively it could 
be a ioctl.  Indecision about write support is also the reason why mmap 
is not allowed yet.

Paolo

> Dave
> 
>>      { "provider": "xyz",
>>        "target": "vm",
>>        "stats": [ ... ]
>>      }
>> ] }
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   include/monitor/stats.h |  33 +++++++
>>   monitor/qmp-cmds.c      |  71 +++++++++++++++
>>   qapi/meson.build        |   1 +
>>   qapi/qapi-schema.json   |   1 +
>>   qapi/stats.json         | 192 ++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 298 insertions(+)
>>   create mode 100644 include/monitor/stats.h
>>   create mode 100644 qapi/stats.json
>>
>> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
>> new file mode 100644
>> index 0000000000..89552ab06f
>> --- /dev/null
>> +++ b/include/monitor/stats.h
>> @@ -0,0 +1,33 @@
>> +/*
>> + * Copyright (c) 2022 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef STATS_H
>> +#define STATS_H
>> +
>> +#include "qapi/qapi-types-stats.h"
>> +
>> +typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target, Error **errp);
>> +typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>> +
>> +/*
>> + * Register callbacks for the QMP query-stats command.
>> + *
>> + * @stats_fn: routine to query stats:
>> + * @schema_fn: routine to query stat schemas:
>> + */
>> +void add_stats_callbacks(StatRetrieveFunc *stats_fn,
>> +                         SchemaRetrieveFunc *schemas_fn);
>> +
>> +/*
>> + * Helper routines for adding stats entries to the results lists.
>> + */
>> +void add_stats_entry(StatsResultList **, StatsProvider, const char *id,
>> +                     StatsList *stats_list);
>> +void add_stats_schema(StatsSchemaList **, StatsProvider, StatsTarget,
>> +                      StatsSchemaValueList *);
>> +
>> +#endif /* STATS_H */
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 5e7302cbb9..97825b25fa 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -35,6 +35,7 @@
>>   #include "qapi/qapi-commands-control.h"
>>   #include "qapi/qapi-commands-machine.h"
>>   #include "qapi/qapi-commands-misc.h"
>> +#include "qapi/qapi-commands-stats.h"
>>   #include "qapi/qapi-commands-ui.h"
>>   #include "qapi/type-helpers.h"
>>   #include "qapi/qmp/qerror.h"
>> @@ -43,6 +44,7 @@
>>   #include "hw/acpi/acpi_dev_interface.h"
>>   #include "hw/intc/intc.h"
>>   #include "hw/rdma/rdma.h"
>> +#include "monitor/stats.h"
>>   
>>   NameInfo *qmp_query_name(Error **errp)
>>   {
>> @@ -426,3 +428,72 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
>>   
>>       return human_readable_text_from_str(buf);
>>   }
>> +
>> +typedef struct StatsCallbacks {
>> +    StatRetrieveFunc *stats_cb;
>> +    SchemaRetrieveFunc *schemas_cb;
>> +    QTAILQ_ENTRY(StatsCallbacks) next;
>> +} StatsCallbacks;
>> +
>> +static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
>> +    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
>> +
>> +void add_stats_callbacks(StatRetrieveFunc *stats_fn,
>> +                         SchemaRetrieveFunc *schemas_fn)
>> +{
>> +    StatsCallbacks *entry = g_new(StatsCallbacks, 1);
>> +    entry->stats_cb = stats_fn;
>> +    entry->schemas_cb = schemas_fn;
>> +
>> +    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
>> +}
>> +
>> +StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
>> +{
>> +    StatsResultList *stats_results = NULL;
>> +    StatsCallbacks *entry;
>> +
>> +    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
>> +        entry->stats_cb(&stats_results, filter->target, errp);
>> +    }
>> +
>> +    return stats_results;
>> +}
>> +
>> +StatsSchemaList *qmp_query_stats_schemas(Error **errp)
>> +{
>> +    StatsSchemaList *stats_results = NULL;
>> +    StatsCallbacks *entry;
>> +
>> +    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
>> +        entry->schemas_cb(&stats_results, errp);
>> +    }
>> +
>> +    return stats_results;
>> +}
>> +
>> +void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
>> +                     const char *qom_path, StatsList *stats_list)
>> +{
>> +    StatsResult *entry = g_new0(StatsResult, 1);
>> +    entry->provider = provider;
>> +    if (qom_path) {
>> +        entry->has_qom_path = true;
>> +        entry->qom_path = g_strdup(qom_path);
>> +    }
>> +    entry->stats = stats_list;
>> +
>> +    QAPI_LIST_PREPEND(*stats_results, entry);
>> +}
>> +
>> +void add_stats_schema(StatsSchemaList **schema_results,
>> +                      StatsProvider provider, StatsTarget target,
>> +                      StatsSchemaValueList *stats_list)
>> +{
>> +    StatsSchema *entry = g_new0(StatsSchema, 1);
>> +
>> +    entry->provider = provider;
>> +    entry->target = target;
>> +    entry->stats = stats_list;
>> +    QAPI_LIST_PREPEND(*schema_results, entry);
>> +}
>> diff --git a/qapi/meson.build b/qapi/meson.build
>> index 656ef0e039..fd5c93d643 100644
>> --- a/qapi/meson.build
>> +++ b/qapi/meson.build
>> @@ -46,6 +46,7 @@ qapi_all_modules = [
>>     'replay',
>>     'run-state',
>>     'sockets',
>> +  'stats',
>>     'trace',
>>     'transaction',
>>     'yank',
>> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> index 4912b9744e..92d7ecc52c 100644
>> --- a/qapi/qapi-schema.json
>> +++ b/qapi/qapi-schema.json
>> @@ -93,3 +93,4 @@
>>   { 'include': 'audio.json' }
>>   { 'include': 'acpi.json' }
>>   { 'include': 'pci.json' }
>> +{ 'include': 'stats.json' }
>> diff --git a/qapi/stats.json b/qapi/stats.json
>> new file mode 100644
>> index 0000000000..7454dd7daa
>> --- /dev/null
>> +++ b/qapi/stats.json
>> @@ -0,0 +1,192 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=python
>> +#
>> +# Copyright (c) 2022 Oracle and/or its affiliates.
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +##
>> +# = Statistics
>> +##
>> +
>> +##
>> +# @StatsType:
>> +#
>> +# Enumeration of statistics types
>> +#
>> +# @cumulative: stat is cumulative; value can only increase.
>> +# @instant: stat is instantaneous; value can increase or decrease.
>> +# @peak: stat is the peak value; value can only increase.
>> +# @linear-hist: stat is a linear histogram.
>> +# @log-hist: stat is a logarithmic histogram.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum' : 'StatsType',
>> +  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
>> +
>> +##
>> +# @StatsUnit:
>> +#
>> +# Enumeration of unit of measurement for statistics
>> +#
>> +# @bytes: stat reported in bytes.
>> +# @seconds: stat reported in seconds.
>> +# @cycles: stat reported in clock cycles.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum' : 'StatsUnit',
>> +  'data' : [ 'bytes', 'seconds', 'cycles' ] }
>> +
>> +##
>> +# @StatsProvider:
>> +#
>> +# Enumeration of statistics providers.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum': 'StatsProvider',
>> +  'data': [ ] }
>> +
>> +##
>> +# @StatsTarget:
>> +#
>> +# The kinds of objects on which one can request statistics.
>> +#
>> +# @vm: the entire virtual machine.
>> +# @vcpu: a virtual CPU.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum': 'StatsTarget',
>> +  'data': [ 'vm', 'vcpu' ] }
>> +
>> +##
>> +# @StatsFilter:
>> +#
>> +# The arguments to the query-stats command; specifies a target for which to
>> +# request statistics, and which statistics are requested from each provider.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'StatsFilter',
>> +  'data': { 'target': 'StatsTarget' } }
>> +
>> +##
>> +# @StatsValue:
>> +#
>> +# @scalar: single uint64.
>> +# @list: list of uint64.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'alternate': 'StatsValue',
>> +  'data': { 'scalar': 'uint64',
>> +            'list': [ 'uint64' ] } }
>> +
>> +##
>> +# @Stats:
>> +#
>> +# @name: name of stat.
>> +# @value: stat value.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'Stats',
>> +  'data': { 'name': 'str',
>> +            'value' : 'StatsValue' } }
>> +
>> +##
>> +# @StatsResult:
>> +#
>> +# @provider: provider for this set of statistics.
>> +# @qom-path: QOM path of the object for which the statistics are returned
>> +# @stats: list of statistics.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'StatsResult',
>> +  'data': { 'provider': 'StatsProvider',
>> +            '*qom-path': 'str',
>> +            'stats': [ 'Stats' ] } }
>> +
>> +##
>> +# @query-stats:
>> +#
>> +# Return runtime-collected statistics for objects such as the
>> +# VM or its vCPUs.
>> +#
>> +# The arguments are a StatsFilter and specify the provider and objects
>> +# to return statistics about.
>> +#
>> +# Returns: a list of StatsResult, one for each provider and object
>> +#          (e.g., for each vCPU).
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'command': 'query-stats',
>> +  'data': 'StatsFilter',
>> +  'boxed': true,
>> +  'returns': [ 'StatsResult' ] }
>> +
>> +##
>> +# @StatsSchemaValue:
>> +#
>> +# Schema for a single statistic.
>> +#
>> +# @name: stat name.
>> +#
>> +# @type: kind of statistic, a @StatType.
>> +#
>> +# @unit: base unit of measurement for the statistics @StatUnit.
>> +#
>> +# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
>> +#        Only present if @exponent is non-zero.
>> +#
>> +# @exponent: exponent for the multiple of @unit that the statistic uses
>> +#
>> +# @bucket-size: Used with linear-hist to report the width of each bucket
>> +#               of the histogram.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'StatsSchemaValue',
>> +  'data': { 'name': 'str',
>> +            'type': 'StatsType',
>> +            '*unit': 'StatsUnit',
>> +            '*base': 'int8',
>> +            'exponent': 'int16',
>> +            '*bucket-size': 'uint32' } }
>> +
>> +##
>> +# @StatsSchema:
>> +#
>> +# Schema for all available statistics for a provider and target.
>> +#
>> +# @provider: provider for this set of statistics.
>> +#
>> +# @target: kind of object that can be queried through this provider.
>> +#
>> +# @stats: list of statistics.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'StatsSchema',
>> +  'data': { 'provider': 'StatsProvider',
>> +            'target': 'StatsTarget',
>> +            'stats': [ 'StatsSchemaValue' ] } }
>> +
>> +##
>> +# @query-stats-schemas:
>> +#
>> +# Return the schema for all available runtime-collected statistics.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'command': 'query-stats-schemas',
>> +  'data': { },
>> +  'returns': [ 'StatsSchema' ] }
>> -- 
>> 2.35.1
>>
>>


