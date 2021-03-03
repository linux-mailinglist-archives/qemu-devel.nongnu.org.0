Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190832B8C3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:56:51 +0100 (CET)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSvi-0006EF-I7
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHSuX-0005EK-Cm
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:55:37 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lHSuV-00058B-Et
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:55:37 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o7-20020a05600c4fc7b029010a0247d5f0so2988467wmq.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yoAR+L0Tj4yAFYS358tNA4EJPbFhu9En+l+UkzqdpTo=;
 b=IOibCOcsnSeJ/008U/XXIH/DQVFdTtDjqb0qWyTNhC/pNQySEhGRWIRlak74Jmin31
 gRVlV3HgG/nlfNHF4VmFZUnpTaQlYOX2jga9IsDPuP/OMYKjWT14r4JbXHebgsgfDH7z
 t5fPtGruDzbnSZTUABj85VNaLt/xaUyJA2f7ya5eUxuuVDk3RadouJcNOFr8MCRFWUlp
 y0f7Zj4SJz3L9hC/+6yExXOjcZh/4pSCtVojZMvGSzdx1130MeLl51MltfWjKNKlPvyo
 UbequpLVCRd0fWCyFgLj2eOKZLp9KgBHVoNuhfOvuE+03lW+89hzCPVeh9R0qX9rvKJp
 OruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=yoAR+L0Tj4yAFYS358tNA4EJPbFhu9En+l+UkzqdpTo=;
 b=guSZ0Xlj8dGlPnNcniaHuhM8ri0TGfb9UziotjSXADLxlVQZCmrQdk1NqLC6II7xmq
 zJN9JLcXqa2OwHRfQmr2QgKz0M7N93Q8yuDjWtExuONNjY49ibNfZzaPW0cbzjWhis0L
 S2+nfIjyeuhLUJBJ4v5aNhdLRI3IT3L7QQF/SsGBxcbW89N36Aqv7grTVW8wsPfpUkvl
 N7rJdhZWaW4I8uMBpZVUTNMi1iLe0ry9HeHzbWskTlYWnAHioXtGlfs9jQ83oc1sOldN
 c8FncxGbpRo9BinRwJlpicPbbOK7Bgi49B7kJzS6w9giiyJLyfLjpHON1arif8TC3r+u
 9zhw==
X-Gm-Message-State: AOAM533Pu4evQR7g5M2a4/PU5U6qmkL2OtFUrs08Ur/P7qNzmNGlMwa7
 6tA1iPqrysf5jIOYfHC9+xeeRg==
X-Google-Smtp-Source: ABdhPJyMWS0SbXw/peentuTh34Uz3GCKCXDU80FHGTVoCaU5wQOAHhRHx0RMqVnFUU9G1Cy2UWliFA==
X-Received: by 2002:a05:600c:3590:: with SMTP id
 p16mr9249086wmq.108.1614783333502; 
 Wed, 03 Mar 2021 06:55:33 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id l6sm15915553wrm.71.2021.03.03.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 06:55:32 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 31fd932e;
 Wed, 3 Mar 2021 14:55:32 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/3] migration/ram: Optimize ram_save_host_page()
In-Reply-To: <1e7cda11-7189-491b-9d2c-bfc1926f2b69@huawei.com>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
 <20210301082132.1107-4-jiangkunkun@huawei.com> <m2k0qoliok.fsf@dme.org>
 <1e7cda11-7189-491b-9d2c-bfc1926f2b69@huawei.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 03 Mar 2021 14:55:31 +0000
Message-ID: <m2eegwl21o.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::329;
 envelope-from=dme@dme.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-03 at 19:47:20 +08, Kunkun Jiang wrote:

> On 2021/3/3 16:56, David Edmondson wrote:
>> On Monday, 2021-03-01 at 16:21:32 +08, Kunkun Jiang wrote:
>>
>>> Starting from pss->page, ram_save_host_page() will check every page
>>> and send the dirty pages up to the end of the current host page or
>>> the boundary of used_length of the block. If the host page size is
>>> a huge page, the step "check" will take a lot of time.
>>>
>>> This will improve performance to use migration_bitmap_find_dirty().
>> This is cleaner, thank you.
>>
>> I was hoping to just invert the body of the loop - something like
>> (completely untested):
> Sorry for my misunderstanding.

No, I explained myself poorly.

> I will improve it in the next version.
>> do {
>>    int pages_this_iteration =3D 0;
>>
>>    /* Check if the page is dirty and, if so, send it. */
>>    if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>>      pages_this_iteration =3D ram_save_target_page(rs, pss, last_stage);
>>      if (pages_this_iteration < 0) {
>>        return pages_this_iteration;
>>      }
>>
>>      pages +=3D pages_this_iteration;
>>
>>      /*
>>       * Allow rate limiting to happen in the middle of huge pages if
>>       * the current iteration sent something.
>>       */
>>      if (pagesize_bits > 1 && pages_this_iteration > 0) {
>>        migration_rate_limit();
>>      }
> I missed the case that the value of pages_this_iteration is 0. =F0=9F=98=
=85

I don't think that your version was wrong, because it returned early
from the loop if there were no candidate pages.

>>    }
>>    pss->page =3D migration_bitmap_find_dirty(rs, pss->block, pss->page);
>>   } while ((pss->page < hostpage_boundary) &&
>>            offset_in_ramblock(pss->block,
>>                               ((ram_addr_t)pss->page) << TARGET_PAGE_BIT=
S));
>> /* The offset we leave with is the min boundary of host page and block */
>> pss->page =3D MIN(pss->page, hostpage_boundary) - 1;
>
> Best Regards.
>
> Kunkun Jiang
>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>> ---
>>>   migration/ram.c | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index 3a9115b6dc..a1374db356 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageS=
earchStatus *pss,
>>>       int tmppages, pages =3D 0;
>>>       size_t pagesize_bits =3D
>>>           qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>>> +    unsigned long hostpage_boundary =3D
>>> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>>>       unsigned long start_page =3D pss->page;
>>>       int res;
>>>=20=20=20
>>> @@ -2002,7 +2004,7 @@ static int ram_save_host_page(RAMState *rs, PageS=
earchStatus *pss,
>>>       do {
>>>           /* Check the pages is dirty and if it is send it */
>>>           if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page))=
 {
>>> -            pss->page++;
>>> +            pss->page =3D migration_bitmap_find_dirty(rs, pss->block, =
pss->page);
>>>               continue;
>>>           }
>>>=20=20=20
>>> @@ -2012,16 +2014,16 @@ static int ram_save_host_page(RAMState *rs, Pag=
eSearchStatus *pss,
>>>           }
>>>=20=20=20
>>>           pages +=3D tmppages;
>>> -        pss->page++;
>>> +        pss->page =3D migration_bitmap_find_dirty(rs, pss->block, pss-=
>page);
>>>           /* Allow rate limiting to happen in the middle of huge pages =
*/
>>>           if (pagesize_bits > 1) {
>>>               migration_rate_limit();
>>>           }
>>> -    } while ((pss->page & (pagesize_bits - 1)) &&
>>> +    } while ((pss->page < hostpage_boundary) &&
>>>                offset_in_ramblock(pss->block,
>>>                                   ((ram_addr_t)pss->page) << TARGET_PAG=
E_BITS));
>>> -    /* The offset we leave with is the last one we looked at */
>>> -    pss->page--;
>>> +    /* The offset we leave with is the min boundary of host page and b=
lock */
>>> +    pss->page =3D MIN(pss->page, hostpage_boundary) - 1;
>>>=20=20=20
>>>       res =3D ram_save_release_protection(rs, pss, start_page);
>>>       return (res < 0 ? res : pages);
>>> --=20
>>> 2.23.0
>> dme.

dme.
--=20
Too much information, running through my brain.

