Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFB4A527
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 17:20:39 +0200 (CEST)
Received: from localhost ([::1]:58912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdFuY-0002wQ-Ip
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 11:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37079)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hdF83-0004KE-8i
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hdF7z-0007g7-G0
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:30:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hdF7v-0007Rg-7E; Tue, 18 Jun 2019 10:30:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F24830832C6;
 Tue, 18 Jun 2019 14:30:17 +0000 (UTC)
Received: from [10.10.121.147] (ovpn-121-147.rdu2.redhat.com [10.10.121.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAD9936FA;
 Tue, 18 Jun 2019 14:30:14 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190531163202.162543-1-vsementsov@virtuozzo.com>
 <20190531163202.162543-7-vsementsov@virtuozzo.com>
 <38975505-c3ed-982e-1875-5f6d650f01da@redhat.com>
 <cddfad9b-7bf0-8924-a07e-a2ca449e7722@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ba9fe8ee-f96a-9bab-9337-ec8937e0542b@redhat.com>
Date: Tue, 18 Jun 2019 10:30:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cddfad9b-7bf0-8924-a07e-a2ca449e7722@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 18 Jun 2019 14:30:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 6/9] block/qcow2-bitmap: do not remove
 bitmaps on reopen-ro
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/3/19 6:14 AM, Vladimir Sementsov-Ogievskiy wrote:
> 01.06.2019 3:06, John Snow wrote:
>>
>>
>> On 5/31/19 12:31 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> qcow2_reopen_bitmaps_ro wants to store bitmaps and then mark them all
>>> readonly. But the latter don't work, as
>>> qcow2_store_persistent_dirty_bitmaps removes bitmaps after storing.
>>> It's OK for inactivation but bad idea for reopen-ro. And this leads to
>>> the following bug:
>>>
>>> Assume we have persistent bitmap 'bitmap0'.
>>> Create external snapshot
>>>    bitmap0 is stored and therefore removed
>>> Commit snapshot
>>>    now we have no bitmaps
>>> Do some writes from guest (*)
>>>    they are not marked in bitmap
>>> Shutdown
>>> Start
>>>    bitmap0 is loaded as valid, but it is actually broken! It misses
>>>    writes (*)
>>> Incremental backup
>>>    it will be inconsistent
>>>
>>> So, let's stop removing bitmaps on reopen-ro. But don't rejoice:
>>> reopening bitmaps to rw is broken too, so the whole scenario will not
>>> work after this patch and we can't enable corresponding test cases in
>>> 255 iotests still. Reopening bitmaps rw will be fixed in the following
>>> patches.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/qcow2.h        |  3 ++-
>>>   block/qcow2-bitmap.c | 46 +++++++++++++++++++++++++++++---------------
>>>   block/qcow2.c        |  2 +-
>>>   3 files changed, 34 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/block/qcow2.h b/block/qcow2.h
>>> index 88a2030f54..4c8435141b 100644
>>> --- a/block/qcow2.h
>>> +++ b/block/qcow2.h
>>> @@ -734,7 +734,8 @@ Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
>>>                                                   Error **errp);
>>>   int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
>>>   int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
>>> -void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp);
>>> +void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>> +                                          bool release_stored, Error **errp);
>>>   int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
>>>   bool qcow2_can_store_new_dirty_bitmap(BlockDriverState *bs,
>>>                                         const char *name,
>>> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
>>> index fbeee37243..25b1e069a7 100644
>>> --- a/block/qcow2-bitmap.c
>>> +++ b/block/qcow2-bitmap.c
>>> @@ -1432,7 +1432,29 @@ fail:
>>>       bitmap_list_free(bm_list);
>>>   }
>>>   
>>> -void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
>>> +/*
>>> + * qcow2_store_persistent_dirty_bitmaps
>>> + *
>>> + * Stores persistent BdrvDirtyBitmap's.
>>> + *
>>
>> No apostrophe for plural's
> 
> I always do so, as it seems strange to me to append 's' to identifiers..
> Should I write it BdrvDirtyBitmaps? It sounds as some other identifier...
> 

This is a recurring problem with English. The term "CD's" is in common
usage for this reason, even though it's grammatically incorrect.
Honestly, I don't have an answer for you, but you could try to avoid it:

"Stores persistent BdrvDirtyBitmap objects"

It's clunkier, but it avoids adding a plural to an identifier. In marked
up text, it's not uncommon to see `BdrvDirtyBitmap`s, but that would
look silly here.

>>
>>> + * @release_stored: if true, release BdrvDirtyBitmap's after storing to the
>>> + * image. This is used in two cases, both via qcow2_inactivate:
>>> + * 1. bdrv_close: It's correct to remove bitmaps on close.
>>> + * 2. migration: If bitmaps are migrated through migration channel via
>>> + *    'dirty-bitmaps' migration capability they are not handled by this code.
>>> + *    Otherwise, it's OK to drop BdrvDirtyBitmap's and reload them on
>>> + *    invalidation.
>>> + *
>>> + * Anyway, it's correct to remove BdrvDirtyBitmap's on inactivation, as
>>> + * inactivation means that we lose control on disk, and therefore on bitmaps,
>>> + * we should sync them and do not touch more.
>>> + *
>>> + * Contrariwise, we don't want to release any bitmaps on just reopen-to-ro,
>>> + * when we need to store them, as image is still under our control, and it's
>>> + * good to keep all the bitmaps in read-only mode.
>>> + */
>>
>> I have to admit that 'Contrariwise' is not an everyday term for me. You
>> should keep it in here just for fun, in my opinion.
> 
> Ahaha, I've just used it in my previous reply.
> 
>>
>> Regarding "it's good to keep all the bitmaps in read-only mode":
>> More directly, keeping them read-only is correct because this is what
>> would happen if we opened the node readonly to begin with, and whether
>> we opened directly or reopened to that state shouldn't matter for the
>> state we get afterward.
> 
> Agree, this is better reasoning.
> 
>>
>>> +void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>>> +                                          bool release_stored, Error **errp)
>>>   {
>>>       BdrvDirtyBitmap *bitmap;
>>>       BDRVQcow2State *s = bs->opaque;
>>> @@ -1545,20 +1567,14 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs, Error **errp)
>>>           g_free(tb);
>>>       }
>>>   
>>> -    QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>>> -        /* For safety, we remove bitmap after storing.
>>> -         * We may be here in two cases:
>>> -         * 1. bdrv_close. It's ok to drop bitmap.
>>> -         * 2. inactivation. It means migration without 'dirty-bitmaps'
>>> -         *    capability, so bitmaps are not marked with
>>> -         *    BdrvDirtyBitmap.migration flags. It's not bad to drop them too,
>>> -         *    and reload on invalidation.
>>> -         */
>>> -        if (bm->dirty_bitmap == NULL) {
>>> -            continue;
>>> -        }
>>> +    if (release_stored) {
>>> +        QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>>> +            if (bm->dirty_bitmap == NULL) {
>>> +                continue;
>>> +            }
>>>   
>>> -        bdrv_release_dirty_bitmap(bs, bm->dirty_bitmap);
>>> +            bdrv_release_dirty_bitmap(bs, bm->dirty_bitmap);
>>> +        }
>>>       }
>>>   
>>>   success:
>>> @@ -1586,7 +1602,7 @@ int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp)
>>>       BdrvDirtyBitmap *bitmap;
>>>       Error *local_err = NULL;
>>>   
>>> -    qcow2_store_persistent_dirty_bitmaps(bs, &local_err);
>>> +    qcow2_store_persistent_dirty_bitmaps(bs, false, &local_err);
>>>       if (local_err != NULL) {
>>>           error_propagate(errp, local_err);
>>>           return -EINVAL;
>>> diff --git a/block/qcow2.c b/block/qcow2.c
>>> index f2cb131048..02d8ce7534 100644
>>> --- a/block/qcow2.c
>>> +++ b/block/qcow2.c
>>> @@ -2344,7 +2344,7 @@ static int qcow2_inactivate(BlockDriverState *bs)
>>>       int ret, result = 0;
>>>       Error *local_err = NULL;
>>>   
>>> -    qcow2_store_persistent_dirty_bitmaps(bs, &local_err);
>>> +    qcow2_store_persistent_dirty_bitmaps(bs, true, &local_err);
>>>       if (local_err != NULL) {
>>>           result = -EINVAL;
>>>           error_reportf_err(local_err, "Lost persistent bitmaps during "
>>>
>>
>> code:
>> Reviewed-by: John Snow <jsnow@redhat.com>
>>
>> (You can adjust the docs as you need to on further review, if any, and
>> keep that RB. --js)
>>
> 
> OK, thank you!
> 

I'll get back to the rest of this soon, it looks like you haven't gotten
review on the core block layer pieces, or maybe I've missed it if you have?

