Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256F3E7C11
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:22:53 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTaf-0008KL-0C
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDTXp-00038o-6x
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDTXn-0002IC-Ex
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vCB0HKYvGdP6U4rUoQZKA/b6W58k//vsD0Ak002UOY=;
 b=bXRPlUFR8B/2X1d3tLSsRbMKVkmYKLtCiWELjtJmh6Lw3z5LRiIVb+LHbODIerMCBshIeL
 C7fhxhaSM2PAT5waklWOMrbEJNIx1oiU+siQFzU4dS46dRMHg68cezoA+zKuE2X3UfKOd6
 nEKI1ndfPV146mYzUAubG+g3K9YqUwI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Vi62DdNJMZO1VzH-lDlxMQ-1; Tue, 10 Aug 2021 11:19:53 -0400
X-MC-Unique: Vi62DdNJMZO1VzH-lDlxMQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i6-20020a05600c3546b029025b0d825fd2so1106340wmq.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vCB0HKYvGdP6U4rUoQZKA/b6W58k//vsD0Ak002UOY=;
 b=M1/xACOpagWhM6kAyPeKg/Xhxl6t576WPZwsm1SASfOnKaF4pZStYODXIISZVAsjtZ
 9lfGdapOAn8fm131uxpDCUTUox4Yf4FKo/SyYyHXEi4zlhDQBb0smxlHLYcno2v+8C6d
 6qitx4PStXq9dtBqacCdZNmTm1N8Dc388PEI+jUk+3oTtdnj39mcWsInNXI74XtCluas
 VB57COoAKilfZDcXQu93XAnVNJCnJMwzbAPm4eapHvD7BBY4iS7uBun2+qSufHt38CHC
 FYHJXOqxjRcvbSJmQkbvtKfzsaOKXcz7pxd6UPRQamfhnSOUdIFVL+shUp7T1+pLtMmC
 KC2A==
X-Gm-Message-State: AOAM533K31cY84C/Xbz8vJlFRX4C9mjn16sdzMvuS571C1QWcmyUtwu0
 hA7au829dkYhKOYGzWwWO1WWhNdABASch4zl3GnSfffb2a/pNisYSUHFFNucW3e+Ky3kQtFdJqv
 RxBmgRZ+5lDSp9PI=
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr22920284wmi.110.1628608792399; 
 Tue, 10 Aug 2021 08:19:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydQSSFoGjgzeAqmpF+y7wjG4FpsQTeawGT3KZuezHgUFSGWDqX5LqKDVG/ZDGncDswhifvOg==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr22920270wmi.110.1628608792241; 
 Tue, 10 Aug 2021 08:19:52 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u5sm6639583wrr.94.2021.08.10.08.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:19:51 -0700 (PDT)
Subject: Re: [PATCH] vl: fix machine option containing underscores
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, pbonzini@redhat.com
References: <20210810131228.2332728-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e73e1083-5506-5a63-4938-fb249a55ccac@redhat.com>
Date: Tue, 10 Aug 2021 17:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810131228.2332728-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Paolo/Markus

On 8/10/21 3:12 PM, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"),
> keyval_dashify() replaces all underscores with dashes in machine
> options. As a result the machine option "default_bus_bypass_iommu",
> which was introduced in the same release (c9e96b04fc19 6d7a85483a06), is
> not recognized:
> 
> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> 
> Before that commit, dashification was only applied temporarily within
> machine_set_property() to check the legacy options. Restore that
> behavior by explicitly checking for aliases of these options instead of
> transforming all machine options.
> 
> Fixes: d8fb7d0969d5 ("vl: switch -M parsing to keyval")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> My first take was renaming default_bus_bypass_iommu, since it's the only
> machine option with underscores, but then we'd want to rename
> bypass_iommu as well for consistency and update all the docs. I prefer
> this but don't mind either way.
> ---
>  softmmu/vl.c | 56 +++++++++++++++++++---------------------------------
>  1 file changed, 20 insertions(+), 36 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5ca11e7469..3d3aa35279 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1660,41 +1660,25 @@ static int object_parse_property_opt(Object *obj,
>      return 0;
>  }
>  
> -/* *Non*recursively replace underscores with dashes in QDict keys.  */
> -static void keyval_dashify(QDict *qdict, Error **errp)
> +static const char *find_option_alias(QDict *qdict, const char *key,
> +                                     const char *alias, const char **value)
>  {
> -    const QDictEntry *ent, *next;
> -    char *p;
> -
> -    for (ent = qdict_first(qdict); ent; ent = next) {
> -        g_autofree char *new_key = NULL;
> -
> -        next = qdict_next(qdict, ent);
> -        if (!strchr(ent->key, '_')) {
> -            continue;
> -        }
> -        new_key = g_strdup(ent->key);
> -        for (p = new_key; *p; p++) {
> -            if (*p == '_') {
> -                *p = '-';
> -            }
> -        }
> -        if (qdict_haskey(qdict, new_key)) {
> -            error_setg(errp, "Conflict between '%s' and '%s'", ent->key, new_key);
> -            return;
> -        }
> -        qobject_ref(ent->value);
> -        qdict_put_obj(qdict, new_key, ent->value);
> -        qdict_del(qdict, ent->key);
> +    *value = qdict_get_try_str(qdict, key);
> +    if (*value) {
> +        return key;
> +    }
> +    *value = qdict_get_try_str(qdict, alias);
> +    if (*value) {
> +        return alias;
>      }
> +    return NULL;
>  }
>  
>  static void qemu_apply_legacy_machine_options(QDict *qdict)
>  {
> +    const char *key;
>      const char *value;
>  
> -    keyval_dashify(qdict, &error_fatal);
> -
>      /* Legacy options do not correspond to MachineState properties.  */
>      value = qdict_get_try_str(qdict, "accel");
>      if (value) {
> @@ -1702,27 +1686,27 @@ static void qemu_apply_legacy_machine_options(QDict *qdict)
>          qdict_del(qdict, "accel");
>      }
>  
> -    value = qdict_get_try_str(qdict, "igd-passthru");
> -    if (value) {
> +    key = find_option_alias(qdict, "igd-passthru", "igd_passthru", &value);
> +    if (key) {
>          object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), "igd-passthru", value,
>                                     false);
> -        qdict_del(qdict, "igd-passthru");
> +        qdict_del(qdict, key);
>      }
>  
> -    value = qdict_get_try_str(qdict, "kvm-shadow-mem");
> -    if (value) {
> +    key = find_option_alias(qdict, "kvm-shadow-mem", "kvm_shadow_mem", &value);
> +    if (key) {
>          object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kvm-shadow-mem", value,
>                                     false);
> -        qdict_del(qdict, "kvm-shadow-mem");
> +        qdict_del(qdict, key);
>      }
>  
> -    value = qdict_get_try_str(qdict, "kernel-irqchip");
> -    if (value) {
> +    key = find_option_alias(qdict, "kernel-irqchip", "kernel_irqchip", &value);
> +    if (key) {
>          object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kernel-irqchip", value,
>                                     false);
>          object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), "kernel-irqchip", value,
>                                     false);
> -        qdict_del(qdict, "kernel-irqchip");
> +        qdict_del(qdict, key);
>      }
>  }
>  
> 


