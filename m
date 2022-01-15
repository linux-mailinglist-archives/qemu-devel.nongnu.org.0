Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E448F7C3
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 17:24:23 +0100 (CET)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8lqo-00014c-Et
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 11:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lpU-0000OA-50
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:23:00 -0500
Received: from [2a00:1450:4864:20::536] (port=38534
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8lpS-0002xW-JJ
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 11:22:59 -0500
Received: by mail-ed1-x536.google.com with SMTP id u21so46161806edd.5
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 08:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mhe9gmTZbZogqAKI5nmFQ8T41f3EqYf0kZyjfy9949w=;
 b=PsABbqjL+SbFXeDtcdPIMzdbMaSCrEV2V5cKSS4iNejK6KVpUtkshtzbShG/1KCn99
 Ymt0x2ra6rZOy2GEgHn9NNl7zBhYPOmyRuBB+0HA+YjNx1HYuiScz3TxRGOcW6di0AxY
 0siNu+hep66gMaXgPfndlEhJJCnBLicBjLQV6nAR6T2+ff10q9qsK+ZaDIxibPEtL7Cr
 mnB/EtZQd/3FhMSvmXIGjni+cJ7BmsnNUwBU4uvXEtlPjtz9l+w753NytqIJSiRexnmw
 YVH62wYw93CavQ12BYg7YxWKIj5XUfFJpHwOMpGkk23R+rQF0kZFpdK6w0wnRk2fcnI6
 AOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mhe9gmTZbZogqAKI5nmFQ8T41f3EqYf0kZyjfy9949w=;
 b=gUQ/LyrsorHiF8klNlQ7TsxVTFUKkV+HhPFIEPAsDbkQSzzL5FFRtAsTNZOC511FvX
 45grzm/bAhWRP6Gz9KIvEBDdJILalFuHxnFl8ncq+HHOjcyWj4bY7muaFedg9au2iGWs
 gWGRLXpw9fB/fODw0Q1slrSK5/sT1OBNoZuIHVk5MjQ0DL/14t8JuoCk7TLSLsmg+rxy
 dv4gYrvSof9YxanATMuzx3aRXQwMlG6y7TQLSGgG33Fm4KJvSg10srbDG5E8KSO7iD8B
 ctzbCKjRxAvpHuLx8V9Gq3UUQWj/NFI7tzLvuvv+Td+v8eKeJ06JN4xB0O8lqHmy/QD0
 Erfg==
X-Gm-Message-State: AOAM533dIMFxHhypqNZB9o6lUhwNSWAiMmiPIMIBwmKXp70DfsgayDC7
 fhRt7D8yWN6ecerDSUoEYh8=
X-Google-Smtp-Source: ABdhPJyiYGKGQQFBS955zi325JTt1GI1mcxr+moKZv9G9UNYUHcn9S4I/3eLGsmxr7HrXq9yArBvjQ==
X-Received: by 2002:a05:6402:1112:: with SMTP id
 u18mr13888328edv.150.1642263777131; 
 Sat, 15 Jan 2022 08:22:57 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id c12sm3645236edx.80.2022.01.15.08.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 08:22:56 -0800 (PST)
Message-ID: <4f7c1039-a602-fdc1-e5ad-0fab7100a917@redhat.com>
Date: Sat, 15 Jan 2022 17:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/3] Support fd-based KVM stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211119195153.11815-1-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/19/21 20:51, Mark Kanda wrote:
> v2: [Paolo]
> - generalize the interface
> - add support for querying stat schema and instances
> - add additional HMP semantic processing for a few exponent/unit
>    combinations (related to seconds and bytes)
> 
> This patchset adds QEMU support for querying fd-based KVM stats. The
> kernel support was introduced by:
> 
> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

Hi Mark,

sorry for the late review.  Fortunately there's very little that I'd change.

In particular:

* please change the callbacks to accept a NULL name and type, instead of 
having the "bool"/"const char *" pair.  You can probably benefit from a 
function to cutils.c like

     bool qemu_match_string(const char *value, const char *request) {
         return !request || g_str_equal(value, request);
     }

* please pass a single const struct to add_stats_callbacks, using GList 
so that the struct can be const.

Putting both together it would be something like:

typedef struct StatsCallbacks {
     char *name;
     StatsList *(*get_values)(StatsList *list, const char *name,
                            const char *type, Error **errp);
     StatsSchemaList *(*get_schemas)(StatsSchemaList *list,
                                     const char *name, Error **errp);
     StatsInstanceList *(*get_instances)(StatsInstanceList *list,
                                         Error **errp);
} StatsCallbacks;

Finally, please put everything in a new header include/monitor/stats.h, 
so that we can document everything and please it in docs/devel.  I can 
take care of that though.

Thanks,

Paolo

> 
> Mark Kanda (3):
>    qmp: Support for querying stats
>    hmp: Support for querying stats
>    kvm: Support for querying fd-based stats
> 
>   accel/kvm/kvm-all.c       | 399 ++++++++++++++++++++++++++++++++++++++
>   hmp-commands-info.hx      |  40 ++++
>   include/monitor/hmp.h     |   3 +
>   include/monitor/monitor.h |  27 +++
>   monitor/hmp-cmds.c        | 125 ++++++++++++
>   monitor/qmp-cmds.c        |  71 +++++++
>   qapi/misc.json            | 142 ++++++++++++++
>   7 files changed, 807 insertions(+)
> 


