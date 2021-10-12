Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE14429E09
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:52:40 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBeQ-00011x-ME
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maBcP-0008IK-WB
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maBcN-0002ty-6r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634021430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACM0OOYXwflAR1QnCKkH9JiEkl+SkC3OG4dWDTqkC7o=;
 b=W0f9TsLyWHF3/qM6OzrItBC8WCLoxZvQ6urnGncOx/nnIvaT/dhPB/A4oDKtHFKKf4emss
 ZgrGewFxkwPyII3Q9l7PZz34NUzyJGrEvFmZdjt0raOp8aMgviU6VwFsH2jy4ctNmuUl4t
 jdWi9SNlqsJsIlIOI8ZxSi5DXFR6dHQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-STQpnJGUPPGuQh14dJHnEw-1; Tue, 12 Oct 2021 02:50:28 -0400
X-MC-Unique: STQpnJGUPPGuQh14dJHnEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so14959330wrc.21
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ACM0OOYXwflAR1QnCKkH9JiEkl+SkC3OG4dWDTqkC7o=;
 b=8Bb+ByXRW20KOH1Wf3wOJjM3OLL9Ftg5tNmDs6wzbtb4th/t0UQjs6zuuQTS6jSZsC
 lEySBM7+YVp4PD3qyKzfUoE/3GARjpVyKXp3FxcJrbseVwcUFELBvfMYsTEojXvZLyeT
 YawQ+akS3Qjcn/uqE0Vhi32Eq6d4CH374gfdy7CnSthbmKypai2Jh1OoHDOWhhDEqGCd
 ZkWIu/Y3ZXXJ6fvCWnzO5dgWjLr1u033XaL8CHN9AN0UGmXbTLX/vT6i9Mu+rl0EEcYB
 PDLa9KAQqB5nJHsRb5trMDTCrhxPIM4Q81vfU+YZlJ8zpN9l++ESNPNUDLqYqFcO0xPm
 7qLQ==
X-Gm-Message-State: AOAM533RhOreadJ45aXFmb2iUcSOJFQSjVafv2mFKEFuWCfHp4OAGXkr
 b6nux5eg0lpbwK2Kl9A/xVeduJet1lFfoJH79t3hL70cfI/2Ko0oWuQPaC3decunfDYSmVPq0Dy
 LcHZle1ovT3adxnM=
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr29197988wry.249.1634021426913; 
 Mon, 11 Oct 2021 23:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylwDBIIWHhLlfFrNFBj0Dm9w/l2ui719wjKAOmkMPxqivCR4HrykaxlpXCZh20URmpwG1frg==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr29197973wry.249.1634021426723; 
 Mon, 11 Oct 2021 23:50:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a12.dip0.t-ipconnect.de. [91.12.106.18])
 by smtp.gmail.com with ESMTPSA id
 g25sm10096524wrc.88.2021.10.11.23.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 23:50:26 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
Date: Tue, 12 Oct 2021 08:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.10.21 00:17, Philippe Mathieu-Daudé wrote:
> On 10/11/21 23:21, Richard Henderson wrote:
>> On 10/11/21 10:45 AM, David Hildenbrand wrote:
>>>    /**
>>>     * memory_region_is_mapped: returns true if #MemoryRegion is mapped
>>> - * into any address space.
>>> + * into another #MemoryRegion directly. Will return false if the
>>> + * #MemoryRegion is mapped indirectly via an alias.
>>
>> Hmm.  I guess.  It kinda sorta sounds like a bug, but I don't know the
>> interface well enough to tell.
> 
> I tend to agree there is a generic issue with aliases, see:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg732527.html
> then
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg799622.html
> "memory: Directly dispatch alias accesses on origin memory region"
> 
> The API description looks OK to me, I'd rather change the
> implementation... Maybe we need a MR_ALIAS_FOREACH() macro?
> 

The API description regarding "address spaces" is certainly not
correct.

The question is if we care about aliases for
memory_region_is_mapped() for aliases. Anything that relies on ->container
is problematic when the target region is mapped via aliases -- see the cover
letter.

Before sending this patch, I had

commit 71d15e90d513327c90d346ef73865d2db749fbba
Author: David Hildenbrand <david@redhat.com>
Date:   Thu Oct 7 11:25:18 2021 +0200

     memory: make memory_region_is_mapped() succeed when mapped via an alias
     
     memory_region_is_mapped() currently does not return "true" when a memory
     region is mapped via an alias. Let's fix that by adding a
     "mapped_via_alias" counter to memory regions and updating it accordingly
     when an alias gets (un)mapped.
     
     I am not aware of actual issues, this is rather a cleanup.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 75b4f600e3..93d0190202 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -728,6 +728,7 @@ struct MemoryRegion {
      const MemoryRegionOps *ops;
      void *opaque;
      MemoryRegion *container;
+    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
      Int128 size;
      hwaddr addr;
      void (*destructor)(MemoryRegion *mr);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3bcfc3899b..1168a00819 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                 hwaddr offset,
                                                 MemoryRegion *subregion)
  {
+    MemoryRegion *alias;
+
      assert(!subregion->container);
      subregion->container = mr;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+       alias->mapped_via_alias++;
+    }
      subregion->addr = offset;
      memory_region_update_container_subregions(subregion);
  }
@@ -2561,9 +2566,14 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
  void memory_region_del_subregion(MemoryRegion *mr,
                                   MemoryRegion *subregion)
  {
+    MemoryRegion *alias;
+
      memory_region_transaction_begin();
      assert(subregion->container == mr);
      subregion->container = NULL;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+       alias->mapped_via_alias--;
+    }
      QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
      memory_region_unref(subregion);
      memory_region_update_pending |= mr->enabled && subregion->enabled;
@@ -2660,7 +2670,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
  
  bool memory_region_is_mapped(MemoryRegion *mr)
  {
-    return mr->container ? true : false;
+    return !!mr->container || mr->mapped_via_alias;
  }
  
  /* Same as memory_region_find, but it does not add a reference to the



But then, I do wonder if we should even care.

-- 
Thanks,

David / dhildenb


