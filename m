Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C91BBE72
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 15:03:23 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTPtS-0007Dh-T3
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 09:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jTPrQ-0005ZU-Qx
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jTPqY-0001sV-R7
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:01:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26312
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jTPqY-0001qT-Bm
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 09:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588078820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/Zme28fDc4TBPVgXIs5zaugGjX1TXWH4nuHdF/QqDk=;
 b=FNiWCO3STEnQ01JiqYVcWGf4mak8ANGYLsgdVCKIyAmd3z4KwERis36iTxmql0VYnxsVp6
 IyFi3pPet4CJnBGpUJCKb75kxWZUYmrx9Z+9FosTIs6n5qXDxUwrBCdNq0MLJGJ9EAwQd2
 GKYvZq8W1cOmRYSMdTSkK/FFvx171Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-3DGRYV9rO8K9trvkfjMSgw-1; Tue, 28 Apr 2020 09:00:19 -0400
X-MC-Unique: 3DGRYV9rO8K9trvkfjMSgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 266F0464;
 Tue, 28 Apr 2020 13:00:18 +0000 (UTC)
Received: from [10.72.13.37] (ovpn-13-37.pek2.redhat.com [10.72.13.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9389B5D71E;
 Tue, 28 Apr 2020 13:00:05 +0000 (UTC)
Subject: Re: [PATCH 3/3] virtio-net: remove VIRTIO_NET_HDR_F_RSC_INFO compat
 handling
To: Cornelia Huck <cohuck@redhat.com>
References: <20200427102415.10915-1-cohuck@redhat.com>
 <20200427102415.10915-4-cohuck@redhat.com>
 <7f703bea-2cae-dcdc-71bd-9623c7db33ac@redhat.com>
 <20200428103407.12612838.cohuck@redhat.com>
 <85367d20-e4f5-6869-319e-2f60d2510130@redhat.com>
 <20200428111801.7422d95a.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b3fc42f1-65f9-9198-16fe-35f0ea7da338@redhat.com>
Date: Tue, 28 Apr 2020 21:00:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428111801.7422d95a.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/28 =E4=B8=8B=E5=8D=885:18, Cornelia Huck wrote:
> On Tue, 28 Apr 2020 16:58:44 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2020/4/28 =E4=B8=8B=E5=8D=884:34, Cornelia Huck wrote:
>>> On Tue, 28 Apr 2020 16:19:15 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>  =20
>>>> On 2020/4/27 =E4=B8=8B=E5=8D=886:24, Cornelia Huck wrote:
>>>>> VIRTIO_NET_HDR_F_RSC_INFO is available in the headers now.
>>>>>
>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>>> ---
>>>>>     hw/net/virtio-net.c | 8 --------
>>>>>     1 file changed, 8 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>>> index e85d902588b3..7449570c7123 100644
>>>>> --- a/hw/net/virtio-net.c
>>>>> +++ b/hw/net/virtio-net.c
>>>>> @@ -77,14 +77,6 @@
>>>>>        tso/gso/gro 'off'. */
>>>>>     #define VIRTIO_NET_RSC_DEFAULT_INTERVAL 300000
>>>>>    =20
>>>>> -/* temporary until standard header include it */
>>>>> -#if !defined(VIRTIO_NET_HDR_F_RSC_INFO)
>>>>> -
>>>>> -#define VIRTIO_NET_HDR_F_RSC_INFO  4 /* rsc_ext data in csum_ fields=
 */
>>>>> -#define VIRTIO_NET_F_RSC_EXT       61
>>>>> -
>>>>> -#endif
>>>>> -
>>>>>     static inline __virtio16 *virtio_net_rsc_ext_num_packets(
>>>>>         struct virtio_net_hdr *hdr)
>>>>>     {
>>>> I think we should not keep the those tricky num_packets/dup_acks.
>>> No real opinion here, patch 3 is only a cleanup.
>>>
>>> The important one is patch 1, because without it I cannot do a headers
>>> update.
>>
>> Yes, at least we should dereference segments/dup_acks instead of
>> csum_start/csum_offsets since the header has been synced.
> So what about:
>
> - I merge patch 1 and the header sync now (because I have a bunch of
>    patches that depend on it...)
> - We change virtio-net to handle that properly on top (probably best
>    done by someone familiar with the code base ;)


That's fine.

Thanks



