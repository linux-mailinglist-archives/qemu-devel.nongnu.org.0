Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8DD147DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 11:06:14 +0100 (CET)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuvqv-00047F-Pc
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 05:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuvpf-0002ea-DS
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:04:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuvpd-0000eM-Ob
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:04:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28795
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuvpd-0000e6-Ln
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 05:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579860293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALN8xT5kNKC8r5YVfSBSvOWu3WRfR02eB9Y0mr6SHxc=;
 b=HX8u381ONghqYfvIqAfUXjeD0lC+CiQ7IBcnu6SlAS5MtqHXU2TEjVgfDz+s9ZXulOsUWe
 zklWO4p+A+QnLNmF585AIH4LtGCzYRaqvqnf7yz4HAsTnzMIl9AP+vWpjAI+uy3tVJpV7F
 GY0O8AU61L7skF7dJBTs1KI3vsCue/E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-xBZKP_jTPoiiqgTyXYH8zg-1; Fri, 24 Jan 2020 05:04:33 -0500
Received: by mail-wm1-f69.google.com with SMTP id t17so440519wmi.7
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 02:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ewy6KQ+MWXO2rt78qPTnlhcYWm7Y5wnzJhR3Ety0fMc=;
 b=ENdtYYoIfmv9LRMtTu9FL1gSjMZ6vRxWYghbOmOkwygl/DyodDQb7z4JPxPBpbSF3+
 dG1qE+tN5BsQxBW8qXzQ/QY9J9Q6vCdtQfFvIHL2T8mE3r4EoxF+VIyL9o8hLXrJ0nCA
 maRtRpmCjSdOLE9AEZ6vHUDSHZ0vz5KwYcFE8golPx7mfR5NOncRUH3ju2V5hTziTnVM
 7sw+Jb6i/0+IirPCgUVi9Ty5W/7ADJ1rf7Qj7sG/Y3/f2c1Xd2SmoZz9mixbdJsOiBM8
 Y9NAX990ObpHO/DClots4MyTo+c7Pf3YM+I7EQgaXQIF+3BhunLyFphey72Hh5Fxj9Qq
 NStA==
X-Gm-Message-State: APjAAAUuV4I0ZSE7oE3NndoWeT/5EmUAtTq3F/JMFPvmiOUrpPc8x3BS
 fkv49SSWJj44fdOfSXN3ZmKRfveG4vuWMRc8NyJMdRDXJ0ZJfRvKfz3MSLLhtuZ4/bMjP0K1e5l
 NWqEwdhiK3xniYDQ=
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr3576351wrt.229.1579860271905; 
 Fri, 24 Jan 2020 02:04:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtRzM/I9oUEaj0DFgTOL1VYMcTYi4JyqFve28BAG1mUGNbLwXwBqFqY5EhUor+KqW3x8rsHQ==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr3576321wrt.229.1579860271632; 
 Fri, 24 Jan 2020 02:04:31 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id t5sm6615893wrr.35.2020.01.24.02.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 02:04:31 -0800 (PST)
Subject: Re: [PATCH] iscsi: Cap block count from GET LBA STATUS (CVE-2020-1711)
To: Peter Lieven <pl@kamp.de>, Felipe Franciosi <felipe@nutanix.com>
References: <B07CB62A-7860-4385-A6A4-4ECA211DBE42@nutanix.com>
 <9F93582E-139B-45B2-8630-FDD331F09DEF@kamp.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c00fc076-3a46-7a52-a539-66751fb2943a@redhat.com>
Date: Fri, 24 Jan 2020 11:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9F93582E-139B-45B2-8630-FDD331F09DEF@kamp.de>
Content-Language: en-US
X-MC-Unique: xBZKP_jTPoiiqgTyXYH8zg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Turschmid <peter.turschm@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>, P J P <ppandit@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/20 11:58 PM, Peter Lieven wrote:
>> Am 23.01.2020 um 22:29 schrieb Felipe Franciosi <felipe@nutanix.com>:
>>> On Jan 23, 2020, at 5:46 PM, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
>>>> On 1/23/20 1:44 PM, Felipe Franciosi wrote:
>>>> When querying an iSCSI server for the provisioning status of blocks (v=
ia
>>>> GET LBA STATUS), Qemu only validates that the response descriptor zero=
's
>>>> LBA matches the one requested. Given the SCSI spec allows servers to
>>>> respond with the status of blocks beyond the end of the LUN, Qemu may
>>>> have its heap corrupted by clearing/setting too many bits at the end o=
f
>>>> its allocmap for the LUN.
>>>> A malicious guest in control of the iSCSI server could carefully progr=
am
>>>> Qemu's heap (by selectively setting the bitmap) and then smash it.
>>>> This limits the number of bits that iscsi_co_block_status() will try t=
o
>>>> update in the allocmap so it can't overflow the bitmap.
>>>
>>> Please add:
>>>
>>> Fixes: CVE-2020-1711 (title of CVE if possible)
>>
>> I wasn't sure we had one yet. Kevin: can you do the needful in your bran=
ch?
>>
>>> Cc: qemu-stable@nongnu.org
>>
>> Yeah, that's there.
>>
>>>
>>>> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
>>>> Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
>>>> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>>>> ---
>>>> block/iscsi.c | 5 +++--
>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>> diff --git a/block/iscsi.c b/block/iscsi.c
>>>> index 2aea7e3f13..cbd57294ab 100644
>>>> --- a/block/iscsi.c
>>>> +++ b/block/iscsi.c
>>>> @@ -701,7 +701,7 @@ static int coroutine_fn iscsi_co_block_status(Bloc=
kDriverState *bs,
>>>>      struct scsi_get_lba_status *lbas =3D NULL;
>>>>      struct scsi_lba_status_descriptor *lbasd =3D NULL;
>>>>      struct IscsiTask iTask;
>>>> -    uint64_t lba;
>>>> +    uint64_t lba, max_bytes;
>>>>      int ret;
>>>>        iscsi_co_init_iscsitask(iscsilun, &iTask);
>>>> @@ -721,6 +721,7 @@ static int coroutine_fn iscsi_co_block_status(Bloc=
kDriverState *bs,
>>>>      }
>>>>        lba =3D offset / iscsilun->block_size;
>>>> +    max_bytes =3D (iscsilun->num_blocks - lba) * iscsilun->block_size=
;
>>>>        qemu_mutex_lock(&iscsilun->mutex);
>>>> retry:
>>>> @@ -764,7 +765,7 @@ retry:
>>>>          goto out_unlock;
>>>>      }
>>>> -    *pnum =3D (int64_t) lbasd->num_blocks * iscsilun->block_size;
>>>> +    *pnum =3D MIN((int64_t) lbasd->num_blocks * iscsilun->block_size,=
 max_bytes);
>>>>        if (lbasd->provisioning =3D=3D SCSI_PROVISIONING_TYPE_DEALLOCAT=
ED ||
>>>>          lbasd->provisioning =3D=3D SCSI_PROVISIONING_TYPE_ANCHORED) {
>>>
>>> What about this?
>>>
>>> -- >8 --
>>> diff --git a/block/iscsi.c b/block/iscsi.c
>>> index 2aea7e3f13..25598accbb 100644
>>> --- a/block/iscsi.c
>>> +++ b/block/iscsi.c
>>> @@ -506,6 +506,11 @@ iscsi_allocmap_update(IscsiLun *iscsilun, int64_t =
offset,
>>>     /* shrink to touch only completely contained clusters */
>>>     cl_num_shrunk =3D DIV_ROUND_UP(offset, iscsilun->cluster_size);
>>>     nb_cls_shrunk =3D (offset + bytes) / iscsilun->cluster_size - cl_nu=
m_shrunk;
>>> +    if (nb_cls_expanded >=3D iscsilun->allocmap_size
>>> +        || nb_cls_shrunk >=3D iscsilun->allocmap_size) {
>>> +        error_report("iSCSI invalid request: ..." /* TODO */);
>>> +        return;
>>> +    }
>>>     if (allocated) {
>>>         bitmap_set(iscsilun->allocmap, cl_num_expanded, nb_cls_expanded=
);
>>>     } else {
>>> ---
>>
>> I'm not sure the above is correct because (if I read this right)
>> nb_cls_* represents the number of clusters, not the last cluster.
>>
>> Personally, I would have the checks (or "trim"s) closer to where they
>> were issued (to fail sooner) and assert()s closer to bitmap (as no oob
>> accesses should be happening at this point). There were also
>> discussions about using safer (higher level) bitmaps for this. I'm
>> always in favour of adding all reasonable checks. :)
>=20
> I would add assertions that cl_num + nb_cls <=3D allocmap_size before eve=
ry set and clear.

The description starts with "A malicious guest in control of the iSCSI=20
server ..." so asserting (and killing the VM) doesn't seem correct... I=20
suppose the iSCSI protocol has some error to return for invalid requests.

Also shouldn't we report some warning in case of such invalid request?=20
So the management side can look at the 'malicious iSCSI server'?


