Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC78C2C4294
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 16:06:13 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khwN2-0004iL-QY
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 10:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khwLJ-0003LP-UB
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khwLH-0002F1-P6
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5HOULYmKsyX12R2e4P2/c4Ia0CmhGXadwQuZRV4DDc=;
 b=DCQ951mCGsRI2/2NCd0njrb7LoSQoGqd5Of8uzU6/Px/EzHHzKeMMOZM2nMB+jBzd+8+ON
 I4tCDVZn3FyueLUuvyddrHDafrSVPWamxiw8ZYQmSFSYx9EH4pW30NStYxsqBqGrYf+1pl
 sesYBhNrF9EX2Wb0BAhBMBSjPIh3doU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-5gHCP2xAO0q2iDRRTb1O2A-1; Wed, 25 Nov 2020 10:04:18 -0500
X-MC-Unique: 5gHCP2xAO0q2iDRRTb1O2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1FBC8145E0;
 Wed, 25 Nov 2020 15:04:16 +0000 (UTC)
Received: from [10.36.112.131] (ovpn-112-131.ams2.redhat.com [10.36.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0583519D61;
 Wed, 25 Nov 2020 15:04:08 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
 <20201125145659.00004b3e@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <b83a1914-16ae-4f1a-318f-59920ecf17e2@redhat.com>
Date: Wed, 25 Nov 2020 16:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125145659.00004b3e@Huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Ah. I'd missed that quirk around MAX_ORDER.  It's also true of ARM64 with
> 4k pages.  As you can probably guess I'd forgotten to recompile my 4k test
> kernel after adding that particular check. :(
> 
> Ah well. Given we are already in a situation where adding 2MiB doesn't actually
> do anything useful, I guess it's not really a problem to merrily let the host
> add less than the guest can make use of.  So we allow adding any multiple of
> 2MiB but reality is the guest isn't going to use anything other than 512MiB
> chunks.

Right, and the host can observe the change not happening when not
aligned to 512 MB. There are plans for a virtio-mem extension for the
guest to present a status - e.g., why the requested size cannot be
achieved (requested size not alignment, usable region too small,
ENOMEM/EBUSY when unplugging, ...).

[...]

>>>
>>> 4K guest on 64K host seems fine and no such limit is needed - though there
>>> may be performance issues doing that.  
>>
>> Yeah, if one is lucky to get one of these 512 MiB huge pages at all :)
> 
> Not too hard on my 1TB test system that's running nothing much else, but agreed it
> won't be trivial more generally.

Hehe, right ! (... and here I am, testing with 64GB machines ... :) )

It's more of an issue in the guest to get 512 MB without ZONE_MOVABLE to
unplug ... especially with smaller VMs.

> 
>>
>>>
>>> 64k guest on 4k host with 512MiB block size seems fine.
>>>
>>> If there are any places anyone thinks need particular poking I'd appreciate a hint :)  
>>
>> If things seem to work for now, that's great :) Thanks!
>>
> Cool.  I'll run a few more comprehensive tests then send out the
> trivial patch to enable the kernel option + v2 of the qemu support.

Perfect, thanks!

-- 
Thanks,

David / dhildenb


