Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B86BB22
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 13:10:51 +0200 (CEST)
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnhpj-00027K-4o
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 07:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38771)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hnhpT-0001T2-6v
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 07:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hnhpR-00028D-A1
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 07:10:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45654)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hnhpP-00026S-FE; Wed, 17 Jul 2019 07:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C38683082E23;
 Wed, 17 Jul 2019 11:10:30 +0000 (UTC)
Received: from [10.36.117.65] (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E75741001B18;
 Wed, 17 Jul 2019 11:10:21 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190717084255.17173-1-david@redhat.com>
 <20190717054727-mutt-send-email-mst@kernel.org>
 <5a5d6f86-04f2-4e61-473c-d8a4b0ed5045@redhat.com>
 <5d50ddb0-b1ac-0bd1-6466-6e605b804809@redhat.com>
 <20190717070323-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <737c3d80-b9e1-6280-a6e6-f7aee139a3b9@redhat.com>
Date: Wed, 17 Jul 2019 13:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717070323-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 17 Jul 2019 11:10:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.1] virtio-balloon: fix QEMU crashes
 on pagesize > BALLOON_PAGE_SIZE
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.07.19 13:06, Michael S. Tsirkin wrote:
> On Wed, Jul 17, 2019 at 12:17:57PM +0200, David Hildenbrand wrote:
>> On 17.07.19 12:04, David Hildenbrand wrote:
>>> On 17.07.19 11:57, Michael S. Tsirkin wrote:
>>>> On Wed, Jul 17, 2019 at 10:42:55AM +0200, David Hildenbrand wrote:
>>>>> We are using the wrong functions to set/clear bits, effectively touching
>>>>> multiple bits, writing out of range of the bitmap, resulting in memory
>>>>> corruptions. We have to use set_bit()/clear_bit() instead.
>>>>>
>>>>> Can easily be reproduced by starting a qemu guest on hugetlbfs memory,
>>>>> inflating the balloon. QEMU crashes. This never could have worked
>>>>> properly - especially, also pages would have been discarded when the
>>>>> first sub-page would be inflated (the whole bitmap would be set).
>>>>>
>>>>> While testing I realized, that on hugetlbfs it is pretty much impossible
>>>>> to discard a page - the guest just frees the 4k sub-pages in random order
>>>>> most of the time. I was only able to discard a hugepage a handful of
>>>>> times - so I hope that now works correctly.
>>>>>
>>>>> Fixes: ed48c59875b6 ("virtio-balloon: Safely handle BALLOON_PAGE_SIZE <
>>>>>                      host page size")
>>>>> Fixes: b27b32391404 ("virtio-balloon: Fix possible guest memory corruption
>>>>>                      with inflates & deflates")
>>>>> Cc: qemu-stable@nongnu.org #v4.0.0
>>>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>>>> Cc: David Gibson <david@gibson.dropbear.id.au>
>>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>  hw/virtio/virtio-balloon.c | 10 ++++------
>>>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>>>>> index e85d1c0d5c..669067d661 100644
>>>>> --- a/hw/virtio/virtio-balloon.c
>>>>> +++ b/hw/virtio/virtio-balloon.c
>>>>> @@ -94,9 +94,8 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>>>>>          balloon->pbp->base = host_page_base;
>>>>>      }
>>>>>  
>>>>> -    bitmap_set(balloon->pbp->bitmap,
>>>>> -               (ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
>>>>> -               subpages);
>>>>> +    set_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
>>>>> +            balloon->pbp->bitmap);
>>>>>  
>>>>>      if (bitmap_full(balloon->pbp->bitmap, subpages)) {
>>>>>          /* We've accumulated a full host page, we can actually discard
>>>>> @@ -140,9 +139,8 @@ static void balloon_deflate_page(VirtIOBalloon *balloon,
>>>>>           * for a guest to do this in practice, but handle it anyway,
>>>>>           * since getting it wrong could mean discarding memory the
>>>>>           * guest is still using. */
>>>>> -        bitmap_clear(balloon->pbp->bitmap,
>>>>> -                     (ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
>>>>> -                     subpages);
>>>>> +        clear_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
>>>>> +                  balloon->pbp->bitmap);
>>>>>  
>>>>>          if (bitmap_empty(balloon->pbp->bitmap, subpages)) {
>>>>>              g_free(balloon->pbp);
>>>>
>>>> I also started to wonder about this:
>>>>
>>>>     if (!balloon->pbp) {
>>>>         /* Starting on a new host page */
>>>>         size_t bitlen = BITS_TO_LONGS(subpages) * sizeof(unsigned long);
>>>>         balloon->pbp = g_malloc0(sizeof(PartiallyBalloonedPage) + bitlen);
>>>>         balloon->pbp->rb = rb;
>>>>         balloon->pbp->base = host_page_base;
>>>>     }
>>>>
>>>> Is keeping a pointer to a ram block like this safe? what if the ramblock
>>>> gets removed?
>>>>
>>>
>>> David added
>>>
>>> if (balloon->pbp
>>>     && (rb != balloon->pbp->rb ) ...
>>>
>>> So in case the rb changes (IOW replaced - delete old one, new one
>>> added), we reset the data.
>>>
>>> After a ram block was deleted, there will be no more deflation requests
>>> coming in for it. This should be fine I guess.
> 
> I think it might happen that an old dangling pointer happens
> to match a newly allocated one.
> I think we really should just cache all data we want to take into account
> and compare that.

That's true. I think just remembering and comparing the GPA base address
would be sufficient.

However, I don't consider this here to trigger easily. We would need
some crazy memory unplug+replug going on while using the balloon. So I
assume we can just rework this part after 4.1

-- 

Thanks,

David / dhildenb

