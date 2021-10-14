Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48042D33F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:08:22 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mauqj-0001bl-Cy
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maupQ-0000nX-SQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maupN-0003yv-LS
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634195216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJANSlQNYSr42a0JYwrW20MXhNDMQ/ZUQC39lRQONjA=;
 b=FKvnw7chcVvnjd3W32rd6IfT81lnr5iH8MStgSgUJq05y4gog+D0tyHvF80Yw455Lmd+eM
 Q0lWAZgJHdGpKhhcym2w85oAYwJ2ufrbNnaK5KU08g59q1lkAKS0FY2d2iVubycFl6+5aO
 5yMAahdPewdT/X3mS4nyA6z6B4gQ50Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-K1gJWvvtP8m6XGGyy1Ft6w-1; Thu, 14 Oct 2021 03:06:53 -0400
X-MC-Unique: K1gJWvvtP8m6XGGyy1Ft6w-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so3809206wrc.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 00:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zJANSlQNYSr42a0JYwrW20MXhNDMQ/ZUQC39lRQONjA=;
 b=vkUxLvUlNjKHb4YgCXFyow5p2aysemoi7E3BsuMUoXyXc34q7tVzomkIKkzTQmCVUB
 Gkh4Uz0Vdk2i+8AWC2qjMwAF6MQ5/yVuUxC1pSFXlYr1gk8FJwm7uSjYWeiyl00msNGW
 Gqu4lAXsSH3fQ3vNKihlGmZjJTSJm+GQVT7dv18+da+9eWMMNPwZqxBkxDX35TR2GzGK
 dVhdKFXJW6C+8r6RCrksHcix447/xM3Jj5khVqEQ/sedZkl5Zu8R9YZVpTbeUPWDW2pA
 i1quCq8v/njwETgxXQYWsiyppvKZFA7ulQQWVz+K74k3W0VhoDkisk2vYN+uTbCodu2q
 HBIg==
X-Gm-Message-State: AOAM533N9p5P9zaOCDop0F0nV8N7thyPT8EBN3dL9Ly9ch2QZQNUelEF
 CoTmXvaVuVDVrKVL4yjpcN8xyW0TrYkyPfS0yJUxKurcct4eOfqLhsct24loxOB34uOGzlOf3x3
 bBz2M7ZANwOfIY20=
X-Received: by 2002:adf:b604:: with SMTP id f4mr4656381wre.111.1634195212425; 
 Thu, 14 Oct 2021 00:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiBFgZmwxUET+qDoM9KVQszJG7a880TGIkOFMx7lCYOwuT555NFkoPs2QpE4FTGT1UbIDo8Q==
X-Received: by 2002:adf:b604:: with SMTP id f4mr4656361wre.111.1634195212217; 
 Thu, 14 Oct 2021 00:06:52 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c694e.dip0.t-ipconnect.de. [91.12.105.78])
 by smtp.gmail.com with ESMTPSA id
 o12sm1578725wrv.78.2021.10.14.00.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 00:06:51 -0700 (PDT)
Message-ID: <9391f500-70be-26cf-bcfc-591d3ee84d4e@redhat.com>
Date: Thu, 14 Oct 2021 09:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
References: <20211012183832.62603-1-david@redhat.com>
 <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
 <76ec743d-afb5-dea5-6c54-2180d176ca1a@redhat.com>
 <20211014052918.GB21284@raphael-debian-dev>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211014052918.GB21284@raphael-debian-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.10.21 07:29, Raphael Norwitz wrote:
> On Wed, Oct 13, 2021 at 11:51:24AM +0200, David Hildenbrand wrote:
>> On 13.10.21 11:48, Stefan Hajnoczi wrote:
>>> On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
>>>> We end up not closing the file descriptor, resulting in leaking one
>>>> file descriptor for each VHOST_USER_REM_MEM_REG message.
>>>>
>>>> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
>>>> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
>>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: Coiby Xu <coiby.xu@gmail.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>   subprojects/libvhost-user/libvhost-user.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
>>>> index bf09693255..bb5c3b3280 100644
>>>> --- a/subprojects/libvhost-user/libvhost-user.c
>>>> +++ b/subprojects/libvhost-user/libvhost-user.c
>>>> @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>>>>           vu_panic(dev, "Specified region not found\n");
>>>>       }
>>>> +    close(vmsg->fds[0]);
>>>
>>> Does anything check that exactly 1 fd was received? For example,
>>> vu_set_log_fd_exec() does:
>>>
>>>    if (vmsg->fd_num != 1) {
>>>        vu_panic(dev, "Invalid log_fd message");
>>>        return false;
>>>    }
>>>
>>> I think that's necessary both to make vhost-user master development
>>> easier and because fds[] is not initialized to -1.
> 
> Ack - will add that.
> 
>>
>> Similarly, vu_add_mem_reg() assumes exactly one was sent AFAIKS.
> 
> Ack
> 
>>
>> If we panic, do we still have to call vmsg_close_fds() ?
>>
> 
> I think so. What else will close the FDs?
> 
> AFAICT a vu_panic does not imply that the overall process has to die if that's
> what you mean. What if one process is exposing multiple devices and only one of
> them panics?

So IIUC, you'll send some patches to tackle the fd checks?

While at it, we might want to simplify VHOST_USER_REM_MEM_REG. 
I have a patch there that needs tweaking to cover the point Stefan raised
regarding duplicate ranges. We might want to do the memmove within the loop
instead and drop the "break" to process all elements.


commit 34d71b6531c74a61442432b37e5829a76a7017c5
Author: David Hildenbrand <david@redhat.com>
Date:   Tue Oct 12 13:25:43 2021 +0200

    libvhost-user: Simplify VHOST_USER_REM_MEM_REG
    
    Let's avoid having to manually copy all elements. Copy only the ones
    necessary to close the hole and perform the operation in-place without
    a second array.
    
    Signed-off-by: David Hildenbrand <david@redhat.com>

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 7b0e40256e..499c31dc68 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -796,10 +796,8 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
 
 static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
-    int i, j;
-    bool found = false;
-    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
+    int i;
 
     DPRINT("Removing region:\n");
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
@@ -811,28 +809,27 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     DPRINT("    mmap_offset      0x%016"PRIx64"\n",
            msg_region->mmap_offset);
 
-    for (i = 0, j = 0; i < dev->nregions; i++) {
-        if (!reg_equal(&dev->regions[i], msg_region)) {
-            shadow_regions[j].gpa = dev->regions[i].gpa;
-            shadow_regions[j].size = dev->regions[i].size;
-            shadow_regions[j].qva = dev->regions[i].qva;
-            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
-            shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
-            j++;
-        } else {
-            found = true;
+    for (i = 0; i < dev->nregions; i++) {
+        if (reg_equal(&dev->regions[i], msg_region)) {
             VuDevRegion *r = &dev->regions[i];
             void *m = (void *) (uintptr_t) r->mmap_addr;
 
             if (m) {
                 munmap(m, r->size + r->mmap_offset);
             }
+            break;
         }
     }
 
-    if (found) {
-        memcpy(dev->regions, shadow_regions,
-               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
+    if (i < dev->nregions) {
+        /*
+         * Shift all affected entries by 1 to close the hole at index i and
+         * zero out the last entry.
+         */
+        memmove(dev->regions + i, dev->regions + i + 1,
+               sizeof(VuDevRegion) * (dev->nregions - i - 1));
+        memset(dev->regions + dev->nregions - 1, 0,
+               sizeof(VuDevRegion));
         DPRINT("Successfully removed a region\n");
         dev->nregions--;
         vmsg_set_reply_u64(vmsg, 0);



On a related note, I proposed in a RFC series to increase the memslot count:

https://lkml.kernel.org/r/20211013103330.26869-1-david@redhat.com

-- 
Thanks,

David / dhildenb


