Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA943E6A4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:51:52 +0200 (CEST)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8d5-0004st-BL
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8Z8-0001QA-VS
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:47:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8Z5-0003EJ-Ue
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635439662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wnfchtjSCsjo51Tuxb0KQ+7SnPeLxk5IhbgoT2qClc=;
 b=T3uLica/G1yzBJjwzVaFY0H8FUH9ElmFhOmETcnm+TNNcXYRDHt7NNqLloYHJaylWT7p/w
 v8FH8B+sxvnlQu9t2SEk/GNuz13E54UXHjfBrtqkXPSla9/BvntWwDOAxHYEO2k4MakslF
 Eix5P+12ZZwcfaSrSHQKZFrtiwA2ND4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-4sQcjdb9MyScSH486LUyYQ-1; Thu, 28 Oct 2021 12:47:40 -0400
X-MC-Unique: 4sQcjdb9MyScSH486LUyYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso2882752wme.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2wnfchtjSCsjo51Tuxb0KQ+7SnPeLxk5IhbgoT2qClc=;
 b=qMxWsfj7BMJol1aMNmbSjuBPvyDZKxEk01Yv1Dq6SQWW2bp9FbyR3sdFt6T2L5Ls9Z
 4eVp1MJ6JrT7HAn03A+8BuoOCRMX5rw9cHoudcT6CTfiSKDdBDrTdfpY6fveB14P2yCX
 KPueWau8f+UNhvwazkOK1BzEqS/L+NaYVJae348ytg0NnwkZJ/JO6OKYVj56YpzKubuu
 +eZlOqmoc8zSx1YNuhvWBR2I0MP0cxz7TfQse7lM34o+ZfPG+iWbOFMCguAwQHvxqFag
 chTT8imBkjGIvs/PK7ySlWS+zR/rcJM8hmkrX7PGie14dRKF4g+N/yinQAxT8wAanhDR
 KKWg==
X-Gm-Message-State: AOAM531kuJ+iZhTHSUssrFTH6x2A2G5jL8vfC0j7F3CaHhQXKtrsK8uE
 17mFTflKYl6O8Ouart/P3CccX0UYRYbnVfjwmcwx5TTfdPKnHjXmT6XmGqcovhwH0y0mb482SMp
 ibKPUdtNuw1Gpgq8=
X-Received: by 2002:adf:ec03:: with SMTP id x3mr7221017wrn.281.1635439659857; 
 Thu, 28 Oct 2021 09:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzePAfAPcMXWuaF4dU1bxh+CHLfe7yZKU3nPGujv5TLVx9RizHdjoNsBhTaAaKsWcs0ueF0nQ==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr7220982wrn.281.1635439659674; 
 Thu, 28 Oct 2021 09:47:39 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l9sm3213498wms.40.2021.10.28.09.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:47:39 -0700 (PDT)
Message-ID: <1d7c3797-59cb-0021-8266-30dc7c2c907c@redhat.com>
Date: Thu, 28 Oct 2021 18:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/22] monitor: make hmp_handle_error return a boolean
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This turns the pattern
> 
>   if (err) {
>      hmp_handle_error(mon, err);
>      return;
>   }
> 
> into
> 
>   if (hmp_handle_error(mon, err);
>      return;
>   }
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/machine-hmp-cmds.c |  3 +--
>  include/monitor/hmp.h      |  2 +-
>  monitor/hmp-cmds.c         | 28 +++++++++++-----------------
>  3 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 76b22b00d6..c356783ab9 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -53,8 +53,7 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>      HotpluggableCPUList *saved = l;
>      CpuInstanceProperties *c;
>  
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 6bc27639e0..a2cb002a3a 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -16,7 +16,7 @@
>  
>  #include "qemu/readline.h"
>  
> -void hmp_handle_error(Monitor *mon, Error *err);
> +bool hmp_handle_error(Monitor *mon, Error *err);
>  
>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>  void hmp_info_version(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index bcaa41350e..9031cea881 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -62,11 +62,13 @@
>  #include <spice/enums.h>
>  #endif
>  
> -void hmp_handle_error(Monitor *mon, Error *err)
> +bool hmp_handle_error(Monitor *mon, Error *err)
>  {
>      if (err) {
>          error_reportf_err(err, "Error: ");
> +        return true;
>      }
> +    return false;
>  }

The usual pattern is to return false on error. Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


