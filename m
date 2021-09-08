Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EF403884
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:04:34 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvNZ-0002HK-48
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNvKc-0001EO-9f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNvKZ-0007Gy-Dl
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631098886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1uhn9UzenJCpYbirWeCjsYPolszuJ5AYQ1XiUcuJUG4=;
 b=iyx4QJ81VEimUu32cczId0hHVjJRlXt5Hdw3aNmHWy0KNbzxYS+JJYe5et5Cd1q2PlZAi6
 RYW2hvjUQfeq91Fzul8oMFwCZSa1VMhwNxZKb+RTchVYnoaB2MBl6oPhNqE56OXpXbMJu3
 PKC/0zv2wdwGBVjY0/qEbAhz1T4x6jc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ATGe82VnOOqtJ_7Ab3lxuQ-1; Wed, 08 Sep 2021 07:01:24 -0400
X-MC-Unique: ATGe82VnOOqtJ_7Ab3lxuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso800488wma.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 04:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1uhn9UzenJCpYbirWeCjsYPolszuJ5AYQ1XiUcuJUG4=;
 b=cAmbhSL9isuR6xDlTTMq7KFCDdsE3EatmBJd7ihL7L/eMlsrVzHquA2eH889yfD+Xe
 zn4/vRQWnVn4N4T8npYl+thFU+uJrbCXHhUUZUX2TE/rNpcYcloeEzOl/CDjuUlgNcaJ
 0jtob1HFbZzSRsG/Di6wcSrB6rRWbOYgkX7ZAeBabdfYCddDfgNIW/s+JyenSZHr5ibm
 Dm+ElmbFu4CLZH2W++xTn+lkeGlHFokHQr7k+kHutG4toRuHcWfCbazENraAloUc+A0N
 Fd6xR0yaWn+EJByUMXvQdopQk5AmeHQOSpghxdZaAEDPnfVSWudt9RmjI7ICbFg2tc+k
 pKsQ==
X-Gm-Message-State: AOAM5326YbgWQMuXc0G00JLc/YJv8nPIAH6HaNVwN+RpH/zuQMzEw4zi
 VrF5yunXzeG8xoGAhL7DnLi29crYdeE4JvjhkxYnO0hv1X/QscJkGOy3sT36cRqu0EzBSnfAGT+
 dh5jIS2OL4uK6o1E=
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr3057188wmq.194.1631098883618; 
 Wed, 08 Sep 2021 04:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzICf4WPYBnm+qV2ZIy8RHVJNSeRgZnjLaZsaGbFzc37+C/luucN7D2LyP1Dl2J1HgNtVJ9VQ==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr3057159wmq.194.1631098883381; 
 Wed, 08 Sep 2021 04:01:23 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c3sm1901168wrd.34.2021.09.08.04.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 04:01:22 -0700 (PDT)
Subject: Re: [PATCH 5/5] monitor: rewrite 'info registers' in terms of
 'x-query-registers'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-6-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5634ab12-23b4-d2dd-fe7a-3a595ddc9e32@redhat.com>
Date: Wed, 8 Sep 2021 13:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908103711.683940-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 12:37 PM, Daniel P. Berrangé wrote:
> Now that we have a QMP command 'x-query-registers', the HMP counterpart
> 'info registers' can be refactored to call the former.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  monitor/misc.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966870..f0b94c3084 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -67,6 +67,7 @@
>  #include "block/block-hmp-cmds.h"
>  #include "qapi/qapi-commands-char.h"
>  #include "qapi/qapi-commands-control.h"
> +#include "qapi/qapi-commands-machine.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "qapi/qapi-commands-qom.h"
> @@ -301,23 +302,29 @@ int monitor_get_cpu_index(Monitor *mon)
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
>      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> -    CPUState *cs;
> +    bool has_cpu = !all_cpus;
> +    int64_t cpu = 0;
> +    Error *local_err = NULL;
> +    g_autoptr(RegisterInfo) info = NULL;
>  
> -    if (all_cpus) {
> -        CPU_FOREACH(cs) {
> -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
> -            cpu_dump_state(cs, NULL, CPU_DUMP_FPU);

And once all targets are converted we can remove cpu_dump_state().


