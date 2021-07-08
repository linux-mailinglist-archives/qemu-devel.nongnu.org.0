Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CD3BFA56
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:36:16 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TGK-0004GI-0z
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1TAv-00051g-7w
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1TAs-0000xb-Mt
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625747436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZ3ldMMVL2pTrIMANEEsZR/4o6C8jaxroWUH1K8RBWQ=;
 b=GWBhoYWriMx1RaZvovKO/ZO0qxzWI4fi4mIVxbh+3yBg4F9+aM0XJ/pZd8H5460QIyEmRz
 vaHssaCA+BjENv1HsLDq0/8OTMoPz672imz0jqY4fKrIJIXASV0VIQQTsLzZ9BZC1SiBbQ
 T6u5zdknDkNcBcZKiJliZNe7Xnm/d3Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-xY4gNxpfOKu3HI7CttYbxA-1; Thu, 08 Jul 2021 08:30:35 -0400
X-MC-Unique: xY4gNxpfOKu3HI7CttYbxA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so1864988wrq.21
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NZ3ldMMVL2pTrIMANEEsZR/4o6C8jaxroWUH1K8RBWQ=;
 b=NjH1f0n2YSNLHZcUY8D9TtV2Y/L+vZgmvx+xPQUb12XPpVeUtQw0bGseyJcMYzbthA
 uElN0YtL3N0dHSkB31UW7wMCRWgnSPjsE0pzwY+y+AkQ7EADXoTxf55AtOWwTRjxHQhu
 wlVUH+JKYJQA3oNySzbQrOnjl6dOotp0PnsVqxm+P9oBJ22DIcYwaI83vpGtf3284oAm
 GDeqQGFJBjKImOlmPslu2+CFWKRTssfcHSPbEJ4z8xJMYz0OR1jUh8S8FEHdtsuF+mnJ
 CaMDyDCoRDjcfyYUfOfUSw06Y4C2dLmB1wWtkcfrf5LKIu8F/6+W1jSmLMzN19V5Of3V
 wzcQ==
X-Gm-Message-State: AOAM531GAU3E1ef0J1c3I1wQfUb8qUfj5icox++ukshTBFBu2/phoMxZ
 Vw3GuYbTLDaBY59FANIIyK5MhNlm8HNWr1FGMIxnnR98bZtxjP/HI/jkiz/Ft151s4XfA+jztqr
 J36RaQr9BBP9Ohr4=
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr3244153wmh.89.1625747434568; 
 Thu, 08 Jul 2021 05:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDsV7TQI6HsnLlnB+4s8vaZXlo+fKnOfWBp78W3mzjXDdi+rjyobOFHlc/16WnGr34RM3vHQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr3244131wmh.89.1625747434360; 
 Thu, 08 Jul 2021 05:30:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n18sm7864996wms.3.2021.07.08.05.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 05:30:34 -0700 (PDT)
Subject: Re: [PATCH v2] remote/memory: Replace share parameter with ram_flags
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210708115157.6907-1-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c43f363c-7a5d-877d-8693-77df509b060e@redhat.com>
Date: Thu, 8 Jul 2021 14:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708115157.6907-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 1:51 PM, Yang Zhong wrote:
> Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
> qemu_ram_alloc_from_fd()")

Oops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/remote/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 472ed2a272..6e21ab1a45 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>          subregion = g_new(MemoryRegion, 1);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       RAM_SHARED, msg->fds[region],
>                                         sysmem_info->offsets[region],
>                                         errp);
>  
> 


