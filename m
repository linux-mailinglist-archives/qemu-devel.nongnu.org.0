Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EC171BFA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 15:07:37 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JpA-0000Qi-W7
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 09:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j7Jny-0008Ly-W5
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:06:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j7Jnw-0003J3-U3
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:06:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43163
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j7Jnw-0003Hp-Ql
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582812380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bdy95lwPUl5iZC6YjrohuCJ+9V8mmgjADD9Kt36iwJM=;
 b=Rmkq/R4wo2MQRbWJwOa2oJ9ru/2swIDefA1lQ8turmwLEBmIGDLZ9bJN5ZqZj3HUeC8YCM
 eeK1ZWyak7UPggo61oSWsA1vl1eaYNpVE6tfCdlIIeejx2d9RsAajWA3KpU599UgnGAm3/
 j6y6rKQM7Q+pHJpG6tYCfpmzmVCgaQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-TuQ1PPTQPouecLkCtqGPLA-1; Thu, 27 Feb 2020 09:06:13 -0500
X-MC-Unique: TuQ1PPTQPouecLkCtqGPLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41520802701;
 Thu, 27 Feb 2020 14:06:12 +0000 (UTC)
Received: from [10.3.116.57] (ovpn-116-57.phx2.redhat.com [10.3.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF0AE5DD63;
 Thu, 27 Feb 2020 14:06:11 +0000 (UTC)
Subject: Re: [PATCH v1 6/8] iotests: add "compression type" for test output
 matching
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
 <20200227072953.25445-7-dplotnikov@virtuozzo.com>
 <8003b87c-0d0d-6b00-0065-0b227ec97221@virtuozzo.com>
 <2e55b711-4af0-b1a0-8736-6391d81db8ab@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8af94036-a62b-7730-a61f-c63a06a6ea5d@redhat.com>
Date: Thu, 27 Feb 2020 08:06:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2e55b711-4af0-b1a0-8736-6391d81db8ab@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/20 4:09 AM, Vladimir Sementsov-Ogievskiy wrote:
> 27.02.2020 13:04, Vladimir Sementsov-Ogievskiy wrote:
>> 27.02.2020 10:29, Denis Plotnikov wrote:
>>> Affected tests: 049, 060, 061, 065, 144, 182, 242, 255
>>>
>>> After adding the compression type feature for qcow2, the compression 
>>> type
>>> is reported on image quering.
>>>
>>> Add the corresponding values of the "compression type" for the tests' 
>>> output
>>> matching.
>>
>> And this and the following patch.
>>
>> Ideally, patch should not break any iotests. This means that all 
>> iotest updates
>> should be merged to the patch which changes their output. Probably, 
>> you can split
>> behavior-changing patch, to reduce iotest-updates per patch, but 
>> anyway, big patch
>> with a lot of iotests updates is better than patch which breaks iotests.
> 
> Or we can try to reduce behavior changes in case of zlib:
> 
> - keep header small in case of zlib, not adding zero field

No, I don't see the point in doing that.  It makes maintenance harder to 
try to minimize the header, for no gain (older images parse the larger 
header just fine).

> - don't add feature table entry, if compress type is zlib
> - don't report compression type on quering, if it is zlib
> 
> - then, all iotests output will be saved. And, then, if we need, we can 
> change
> these theree points one-by-one, updating iotests outputs. But I doubt 
> that we
> really need it, compatible behavior seems good enough.
> 

[by the way, replying to this series is painful, since den@vrtuozzo.com 
is not a valid email address]

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


