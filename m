Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F281D5687
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 18:50:39 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZdXi-0004xI-GR
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jZdWE-00036E-EO
 for qemu-devel@nongnu.org; Fri, 15 May 2020 12:49:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35842
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jZdWD-0007oK-4C
 for qemu-devel@nongnu.org; Fri, 15 May 2020 12:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589561344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gUcBtj9uiIye+I3jHTYHTKq7LwrL3ktU6ZuHzxtZwZM=;
 b=A9FH+Eqa9f3MP39dpSDvFzOMD3Tw/tDyztAbKCNJLeJIo0d0+k8y6LO8R5dYHWkQpwWho7
 gJNc6IXZV7qK+frYTxUS+0Ft2UzdwuSa+adGE4AaIf+tCmK9sACRT4m9eKMorsDcztpZJh
 VdHeb/FeNY00mI9vw5Hc9vAbGW7X2KQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-IbiU8CL6M4Wh7Tcfop4x0g-1; Fri, 15 May 2020 12:49:02 -0400
X-MC-Unique: IbiU8CL6M4Wh7Tcfop4x0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68020801504;
 Fri, 15 May 2020 16:49:01 +0000 (UTC)
Received: from [10.36.114.77] (ovpn-114-77.ams2.redhat.com [10.36.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445B962496;
 Fri, 15 May 2020 16:48:56 +0000 (UTC)
Subject: Re: [PATCH v1 10/17] virtio-mem: Paravirtualized memory hot(un)plug
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200506094948.76388-1-david@redhat.com>
 <20200506094948.76388-11-david@redhat.com> <20200515153714.GG2954@work-vm>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <c782acd6-e282-fb33-863c-965d1e27d3b6@redhat.com>
Date: Fri, 15 May 2020 18:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515153714.GG2954@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=205.139.110.61; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.05.20 17:37, Dr. David Alan Gilbert wrote:
> I'm not sure if it's possible to split this up; it's a bit big.

Functionality-wise, it's the bare minimum. I could split out handling of
all 4 request types, but they are only ~150-200 LOC. Not sure if that is
really worth the trouble. open for suggestions.

> It could also do with a pile of trace_ entries to figure out what it's
> doing.

Good idea, will add that with a patch on top.

[...]

>> +static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
>> +                                      uint64_t size, bool plug)
>> +{
>> +    const uint64_t offset = start_gpa - vmem->addr;
>> +    int ret;
>> +
>> +    if (!plug) {
>> +        if (virtio_mem_discard_inhibited()) {
>> +            return -EBUSY;
>> +        }
>> +        /* Note: Discarding should never fail at this point. */
>> +        ret = ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
>> +        if (ret) {
> 
> error_report ?


error_report("Unexpected error discarding RAM: %s",
	     strerror(-ret));
it is.

[...]

>> +    ret = ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb));
>> +    if (ret) {
>> +        /* Note: Discarding should never fail at this point. */
> 
> error_report?

dito

> 
>> +        return -EBUSY;
>> +    }
>> +    bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
>> +    vmem->size = 0;
>> +
>> +    virtio_mem_resize_usable_region(vmem, vmem->requested_size, true);
>> +    return 0;
>> +}

[...]

>> +static void virtio_mem_handle_request(VirtIODevice *vdev, VirtQueue *vq)
>> +{
>> +    const int len = sizeof(struct virtio_mem_req);
>> +    VirtIOMEM *vmem = VIRTIO_MEM(vdev);
>> +    VirtQueueElement *elem;
>> +    struct virtio_mem_req req;
>> +    uint64_t type;
>> +
>> +    while (true) {
>> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>> +        if (!elem) {
>> +            return;
>> +        }
>> +
>> +        if (iov_to_buf(elem->out_sg, elem->out_num, 0, &req, len) < len) {
>> +            virtio_mem_bad_request(vmem, "invalid request size");
> 
> Print the size.

Make sense, I'll probably get rid of virtio_mem_bad_request() and just
do the virtio_error() directly with additional paramaters.

> 
>> +            g_free(elem);
>> +            return;
>> +        }
>> +
>> +        if (iov_size(elem->in_sg, elem->in_num) <
>> +            sizeof(struct virtio_mem_resp)) {
>> +            virtio_mem_bad_request(vmem, "not enough space for response");
>> +            g_free(elem);
>> +            return;
>> +        }
>> +
>> +        type = le16_to_cpu(req.type);
>> +        switch (type) {
>> +        case VIRTIO_MEM_REQ_PLUG:
>> +            virtio_mem_plug_request(vmem, elem, &req);
>> +            break;
>> +        case VIRTIO_MEM_REQ_UNPLUG:
>> +            virtio_mem_unplug_request(vmem, elem, &req);
>> +            break;
>> +        case VIRTIO_MEM_REQ_UNPLUG_ALL:
>> +            virtio_mem_unplug_all_request(vmem, elem);
>> +            break;
>> +        case VIRTIO_MEM_REQ_STATE:
>> +            virtio_mem_state_request(vmem, elem, &req);
>> +            break;
>> +        default:
>> +            virtio_mem_bad_request(vmem, "unknown request type");
> 
> Could include the type .

Yes, will do!

[...]

>> +
>> +static int virtio_mem_pre_save(void *opaque)
>> +{
>> +    VirtIOMEM *vmem = VIRTIO_MEM(opaque);
>> +
>> +    vmem->migration_addr = vmem->addr;
>> +    vmem->migration_block_size = vmem->block_size;
> 
> You might look at VMSTATE_WITH_TMP could avoid you having the dummy
> fields.

Thanks, will have a look.

-- 
Thanks,

David / dhildenb


