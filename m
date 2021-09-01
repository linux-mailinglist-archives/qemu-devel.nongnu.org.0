Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA13FE0FC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:12:19 +0200 (CEST)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTmc-0004bW-Ef
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTlf-0003BT-Qc
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTle-0004Nz-CR
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630516277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9B7gfTC6qOcig/q1llT1UAEMVz4wMrt8GESi/Qozfrw=;
 b=YZAWAtEoSk1ie3UvYRkf3XQcBY/kHCoxk9miVPXPptxwcUexfjdqm3Yeko/IASmHZzvIRg
 QmDaBVmRYYVETFsJGgGtCb47pGPpnoLPJqc1E6Hr3SY/7g7ldlpalfo7dWaYuuhtxbOOAE
 +m1/4E91qQpdOpnNOf9mTP//QsGYZEg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-g08wLQcNMHaNKZlRUWKYcA-1; Wed, 01 Sep 2021 13:11:14 -0400
X-MC-Unique: g08wLQcNMHaNKZlRUWKYcA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso137383wrw.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 10:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9B7gfTC6qOcig/q1llT1UAEMVz4wMrt8GESi/Qozfrw=;
 b=AegB/CDuIs5tD5Rsyb74WkQDTINU6s/gmlqeW3lKqD/mw5nVB9JV471f4cK3FG8sz9
 Wfz6pJWKSCHhG/kJKIDaTBeGlNYsRGtbV9Sbmq4YeLwCjloaH40Bgk7ctyObz7gZdxUU
 rK9fjaJ7vTb4Z5u8kGT/3zUiuSWEbikDcPpmGBVvEbIQ817q0g4Q5q/q/DmTxRsZYL5s
 p6QdLHCD4ebKGo+5wBMeYoMq5dtLA40i7b8Ifw+g0OgideGXWLLIU65MuHcUTJlB3pIE
 jiCpBQzTdp33L3g1LTowqz6ag/fGAIL5zy2NgSBEbFDt7P9N/j477Hhp31AIO4JcAfbe
 FBwg==
X-Gm-Message-State: AOAM532JKOyRLvoVSaUiiilgAPaX2xLV41kUyXSF/D5fCu09xePTbDUk
 5AHZKgGzjoMK5UJrOaTdBsRu8oWNjqD5XMJ/RXEg+X2/+YlrElO44qBgOKq8fmVS6xWZwui/L5b
 nvG8Nc6od0lFDbkA=
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr497090wmc.148.1630516273712; 
 Wed, 01 Sep 2021 10:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHpZd8GHH67reu+kltnpAXkFMTQzIrCw4lVUQgnuoRlaqUzcRl4DplC7ojiN29V7Pb++5GtQ==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr497066wmc.148.1630516273522; 
 Wed, 01 Sep 2021 10:11:13 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
 by smtp.gmail.com with ESMTPSA id k1sm47623wrz.61.2021.09.01.10.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 10:11:12 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] memory: Extract mtree_info_as() from mtree_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-3-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6623ad05-5e50-cadf-7486-22bfc41ff13e@redhat.com>
Date: Wed, 1 Sep 2021 19:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 18:19, Philippe Mathieu-Daudé wrote:
> While mtree_info() handles both ASes and flatviews cases,
> the two cases share basically no code. Split mtree_info_as()
> out of mtree_info() to simplify.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   softmmu/memory.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 3eb6f52de67..5be7d5e7412 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3284,18 +3284,12 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
>       g_hash_table_unref(views);
>   }
>   
> -void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
> +static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
>   {
>       MemoryRegionListHead ml_head;
>       MemoryRegionList *ml, *ml2;
>       AddressSpace *as;
>   
> -    if (flatview) {
> -        mtree_info_flatview(dispatch_tree, owner);
> -
> -        return;
> -    }
> -
>       QTAILQ_INIT(&ml_head);
>   
>       QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> @@ -3316,6 +3310,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>       }
>   }
>   
> +void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
> +{
> +    if (flatview) {
> +        mtree_info_flatview(dispatch_tree, owner);
> +    } else {
> +        mtree_info_as(dispatch_tree, owner, disabled);
> +    }
> +}
> +
>   void memory_region_init_ram(MemoryRegion *mr,
>                               Object *owner,
>                               const char *name,
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

I'd just have squashed that into #1.

-- 
Thanks,

David / dhildenb


