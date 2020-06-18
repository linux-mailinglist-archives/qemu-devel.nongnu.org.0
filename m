Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32221FF861
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:00:07 +0200 (CEST)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlwxS-0002Oj-Q6
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jlww5-00012h-JZ
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 11:58:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48933
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jlww3-0004EW-Jj
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 11:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592495918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LRzZFzvYaGAcEyDN9JsW7qiUulelBqtnazG51h2lMxM=;
 b=ENH3ovPuyWCWoiJ0qvAuaA89W3WlH7kgqtv8sFCkbKZvYnXfpFzGdIMS/W4Fuhq+yKdHW4
 UU2FhPa77bBpPemMuxVHvONBn3UkOE07NmUW5IRxgzChXyAccs26VxzMP5j2j6fYUPlT/p
 bW/bIqbCXuXZh9foD0eE6LGEJwfFJEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Ea_3KxHhMSaxVu3JHkcEiw-1; Thu, 18 Jun 2020 11:58:36 -0400
X-MC-Unique: Ea_3KxHhMSaxVu3JHkcEiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00ACA8015CE;
 Thu, 18 Jun 2020 15:58:35 +0000 (UTC)
Received: from [10.36.114.105] (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074A95DA73;
 Thu, 18 Jun 2020 15:58:28 +0000 (UTC)
Subject: Re: [PATCH v25 QEMU 3/3] virtio-balloon: Replace free page hinting
 references to 'report' with 'hint'
To: Alexander Duyck <alexander.duyck@gmail.com>
References: <20200527041212.12700.60627.stgit@localhost.localdomain>
 <20200527041414.12700.50293.stgit@localhost.localdomain>
 <CAKgT0UdPC1s0c-wqsNc4x8DeZhtZQVMmLArWQ=Z345Mkof650Q@mail.gmail.com>
 <4f37c184-cf62-5711-a737-925533b52d73@redhat.com>
 <CAKgT0Udmxjx66hEhDyqWS1wBkAfEf_hht8FZAOuh3NMDOAOR3w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <aea3b6e6-f653-dd0c-5e17-d0c948a6af4b@redhat.com>
Date: Thu, 18 Jun 2020 17:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKgT0Udmxjx66hEhDyqWS1wBkAfEf_hht8FZAOuh3NMDOAOR3w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.06.20 17:14, Alexander Duyck wrote:
> On Thu, Jun 18, 2020 at 5:54 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 13.06.20 22:07, Alexander Duyck wrote:
>>> On Tue, May 26, 2020 at 9:14 PM Alexander Duyck
>>> <alexander.duyck@gmail.com> wrote:
>>>>
>>>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>>
>>>> In an upcoming patch a feature named Free Page Reporting is about to be
>>>> added. In order to avoid any confusion we should drop the use of the word
>>>> 'report' when referring to Free Page Hinting. So what this patch does is go
>>>> through and replace all instances of 'report' with 'hint" when we are
>>>> referring to free page hinting.
>>>>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>>> ---
>>>>  hw/virtio/virtio-balloon.c         |   78 ++++++++++++++++++------------------
>>>>  include/hw/virtio/virtio-balloon.h |   20 +++++----
>>>>  2 files changed, 49 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>>>> index 3e2ac1104b5f..dc15409b0bb6 100644
>>>> --- a/hw/virtio/virtio-balloon.c
>>>> +++ b/hw/virtio/virtio-balloon.c
>>>
>>> ...
>>>
>>>> @@ -817,14 +817,14 @@ static int virtio_balloon_post_load_device(void *opaque, int version_id)
>>>>      return 0;
>>>>  }
>>>>
>>>> -static const VMStateDescription vmstate_virtio_balloon_free_page_report = {
>>>> +static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
>>>>      .name = "virtio-balloon-device/free-page-report",
>>>>      .version_id = 1,
>>>>      .minimum_version_id = 1,
>>>>      .needed = virtio_balloon_free_page_support,
>>>>      .fields = (VMStateField[]) {
>>>> -        VMSTATE_UINT32(free_page_report_cmd_id, VirtIOBalloon),
>>>> -        VMSTATE_UINT32(free_page_report_status, VirtIOBalloon),
>>>> +        VMSTATE_UINT32(free_page_hint_cmd_id, VirtIOBalloon),
>>>> +        VMSTATE_UINT32(free_page_hint_status, VirtIOBalloon),
>>>>          VMSTATE_END_OF_LIST()
>>>>      }
>>>>  };
>>>
>>> So I noticed this patch wasn't in the list of patches pulled, but that
>>> is probably for the best since I believe the change above might have
>>> broken migration as VMSTATE_UINT32 does a stringify on the first
>>> parameter.
>>
>> Indeed, it's the name of the vmstate field. But I don't think it is
>> relevant for migration. It's and indicator if a field is valid and it's
>> used in traces/error messages.
>>
>> See git grep "field->name"
>>
>> I don't think renaming this is problematic. Can you rebase and resent?
>> Thanks!
> 
> Okay, I will.
> 
>>> Any advice on how to address it, or should I just give up on renaming
>>> free_page_report_cmd_id and free_page_report_status?
>>>
>>> Looking at this I wonder why we even need to migrate these values? It
>>> seems like if we are completing a migration the cmd_id should always
>>> be "DONE" shouldn't it? It isn't as if we are going to migrate the
>>
>> The *status* should be DONE IIUC. The cmd_id might be relevant, no? It's
>> always incremented until it wraps.
> 
> The thing is, the cmd_id visible to the driver if the status is DONE
> is the cmd_id value for DONE. So as long as the driver acknowledges
> the value we could essentially start over the cmd_id without any
> negative effect. The driver would have to put down a new descriptor to
> start a block of hinting in order to begin reporting again so there
> shouldn't be any risk of us falsely hinting pages that were in a
> previous epoch.
> 
> Ugh, although now looking at it I think we might have a bug in the
> QEMU code in that the driver could in theory force its way past a
> "STOP" by just replaying the last command_id descriptor and then keep
> going. Should be a pretty easy fix though as we should only allow a
> transition to S_START if the status is S_REQUESTED/

Ugh, ...

@MST, you might have missed that in another discussion, what's your
general opinion about removing free page hinting in QEMU (and Linux)? We
keep finding issues in the QEMU implementation, including non-trivial
ones, and have to speculate about the actual semantics. I can see that
e.g., libvirt does not support it yet.

-- 
Thanks,

David / dhildenb


