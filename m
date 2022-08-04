Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D17589734
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:55:02 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJSsv-0002gK-Bf
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSpm-0007bi-53
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSpk-00065D-15
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659588703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcHP+68lh8+C9ZaO+frEp98LbX3Zf9AssaIImDkohO0=;
 b=JVlPVxm+LwJKIHc67NGDQ42F+TGhqSIvCFt60jRchIHHt5Iausa7paq6068glq75C3c6kN
 M6k+IY+lds+jfu5i8BPbmIrKIlYD/MhJpQl1LrfdpO0ThsonY7RjxbrXNJxTOnpkRpLcKc
 0ZHu40VEPwiL/k1IhOalq0nwpNnto7c=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-fei-COLFMdWg6R0cGVhaJg-1; Thu, 04 Aug 2022 00:51:42 -0400
X-MC-Unique: fei-COLFMdWg6R0cGVhaJg-1
Received: by mail-pf1-f197.google.com with SMTP id
 f9-20020a056a0022c900b0052e0e9cb3b2so2270619pfj.16
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jcHP+68lh8+C9ZaO+frEp98LbX3Zf9AssaIImDkohO0=;
 b=3NbYy3KAQH1687OZeeGgL9ugtjPJOK8c6YgGFzXv2cl/aUYqmdZJZxyBF3kXNDO3sZ
 jcclpbtPfwTwT+vVUaJlYXbEZR/gcWZMtfZlwPPHZ+Cul7UDil14c6LnSW533PZXIxJO
 1vSUOJVvNaISm1cdeq/4bwpaRmb97YRPWz57EqoiFltLdG13Nxc9RwMYRdWULYYN958s
 Hy3GMBC/0KalbxD2lQ5Zm/rBPl0B+E5I3H/WkSHkGhnNT6Bsbi9OkyJrYqn2IkKTQvFL
 5Ni2OuWzB+Avl7bZtKKdniu83M0nYrCgbSiKpjuxIk+WltomStu3pnfkCs9qhxgmaU1w
 9Jsg==
X-Gm-Message-State: ACgBeo3vhu4g0/1pxTLbFjnO0aJLkxc7o1RbDCe9/Lm6aY9O4v5dYHLM
 9GRUCAdcOW9CNHCyM7RxTgzq33rw8Z4xVYKOc71ZpsivQ13e7PbpvPHg1tml64Ml08G3G+Zw0RT
 dfz5sNmlhkED5pTw=
X-Received: by 2002:a17:90b:17c8:b0:1f5:4724:981f with SMTP id
 me8-20020a17090b17c800b001f54724981fmr83423pjb.205.1659588700866; 
 Wed, 03 Aug 2022 21:51:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wsABm511o3NkdOg7NowZsS1CDx4KpdhNxIUxL8eb9DDK0hP/xcibhkO4Hbc9IMp65ealqww==
X-Received: by 2002:a17:90b:17c8:b0:1f5:4724:981f with SMTP id
 me8-20020a17090b17c800b001f54724981fmr83398pjb.205.1659588700549; 
 Wed, 03 Aug 2022 21:51:40 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa79ed2000000b0052ad49292f0sm8050511pfq.48.2022.08.03.21.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:51:39 -0700 (PDT)
Message-ID: <e34cd9ee-ccb3-8447-28f1-9500b9f0a106@redhat.com>
Date: Thu, 4 Aug 2022 12:51:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] vdpa: do not save failed dma maps in SVQ iova tree
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220802143908.274364-1-eperezma@redhat.com>
 <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
 <CAJaqyWe0uxicTKOzM9Yp5PV6diTBFSKX2m8BVqckrMTD7dctYg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWe0uxicTKOzM9Yp5PV6diTBFSKX2m8BVqckrMTD7dctYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/3 16:12, Eugenio Perez Martin 写道:
> On Wed, Aug 3, 2022 at 10:09 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Tue, Aug 2, 2022 at 10:39 PM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> If a map fails for whatever reason, it must not be saved in the tree.
>>> Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.
>>>
>>> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
>>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 3ff9ce3501..e44c23dce5 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>>>   static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>                                              MemoryRegionSection *section)
>>>   {
>>> +    DMAMap mem_region = {};
>>>       struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
>>>       hwaddr iova;
>>>       Int128 llend, llsize;
>>> @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>
>>>       llsize = int128_sub(llend, int128_make64(iova));
>>>       if (v->shadow_vqs_enabled) {
>>> -        DMAMap mem_region = {
>>> -            .translated_addr = (hwaddr)(uintptr_t)vaddr,
>>> -            .size = int128_get64(llsize) - 1,
>>> -            .perm = IOMMU_ACCESS_FLAG(true, section->readonly),
>>> -        };
>> Nit: can we keep this part unchanged?
>>
> We can, but that implies we should look for iova again at fail_map
> tag. If you are ok with that I'm fine to perform the search again.


I meant something like:

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 9a2daef7e3..edf40868e3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -232,11 +232,15 @@ static void 
vhost_vdpa_listener_region_add(MemoryListener *listener,
                               vaddr, section->readonly);
      if (ret) {
          error_report("vhost vdpa map fail!");
-        goto fail;
+        goto fail_unmap;
      }

      return;

+fail_unmap:
+    if (v->shadow_vqs_enabled) {
+        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+    }
  fail:
      /*
       * On the initfn path, store the first error in the container so we

Thanks


>
>> Thanks
>>
>>> +        int r;
>>>
>>> -        int r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
>>> +        mem_region.translated_addr = (hwaddr)(uintptr_t)vaddr,
>>> +        mem_region.size = int128_get64(llsize) - 1,
>>> +        mem_region.perm = IOMMU_ACCESS_FLAG(true, section->readonly),
>>> +
>>> +        r = vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
>>>           if (unlikely(r != IOVA_OK)) {
>>>               error_report("Can't allocate a mapping (%d)", r);
>>>               goto fail;
>>> @@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>>>                                vaddr, section->readonly);
>>>       if (ret) {
>>>           error_report("vhost vdpa map fail!");
>>> -        goto fail;
>>> +        goto fail_map;
>>>       }
>>>
>>>       return;
>>>
>>> +fail_map:
>>> +    if (v->shadow_vqs_enabled) {
>>> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
>>> +    }
>>> +
>>>   fail:
>>>       /*
>>>        * On the initfn path, store the first error in the container so we
>>> --
>>> 2.31.1
>>>


