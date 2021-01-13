Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310862F4ECC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:32:13 +0100 (CET)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi84-0005FE-6U
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzhwA-0002pR-DD
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzhw7-0002e0-Ax
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610551187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKrsytn2j+V5ww9QeU4E4x3uuzpX6a1GgF/MLRt5Kaw=;
 b=VP/1Rkof3cwDRF9xK9ZAf3sUaGK/vX4Fpj1NDwhghxEz537k75MIDdeTcDWlI87bJgOjuG
 BoxfL/fyNI+Q2hT6IrApUDT47Js5pAKzaPOUxDmhXNeKSInG1FijZmYLKVz7wbN+TcOVFp
 PPK21Z6XRaxhPLNJQZE5parMJ9/ttdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-VOzmcZ-DPHuQZvRoe67HLw-1; Wed, 13 Jan 2021 10:19:46 -0500
X-MC-Unique: VOzmcZ-DPHuQZvRoe67HLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EAD19CC03;
 Wed, 13 Jan 2021 15:19:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-103.ams2.redhat.com
 [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E29EF60D08;
 Wed, 13 Jan 2021 15:19:43 +0000 (UTC)
Subject: Re: [PATCH 0/7] iotests/129: Fix it
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <746f2be4-4093-fcff-fddb-60b0cae74c31@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e2d3fd8e-f138-c37f-8b63-be3aa9ff31be@redhat.com>
Date: Wed, 13 Jan 2021 16:19:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <746f2be4-4093-fcff-fddb-60b0cae74c31@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 15:31, Vladimir Sementsov-Ogievskiy wrote:
> 13.01.2021 17:06, Max Reitz wrote:
>> Hi,
>>
>> There are some problems with iotests 129 (perhaps more than these, but
>> these are the ones I know of):
>>
>> 1. It checks @busy to see whether a block job is still running; however,
>>     block jobs tend to unset @busy all the time (when they yield).
>>     [Fixed by patch 3]
>>
>> 2. It uses blockdev throttling, which quite some time ago has been moved
>>     to the BB level; since then, such throttling will no longer affect
>>     block jobs.  We can get throttling to work by using a throttle filter
>>     node.
>>     [Fixed by patch 4]
>>
>> 3. The mirror job has a large buffer size by default.  A simple drain
>>     may lead to it making significant process, which is kind of
>>     dangerous, because we don’t want the job to complete.
> 
> Not quite clear to me. iotest 129 wants to mirror 128M of data. Mirror by
> default will have 1M chunk size and maximum of 16 parallel requests. So 
> with
> throttling (even if throttling can't correctly handle parallel requests)
> we will not exceed 16M of progress.. Why we need limiting buffer size?

It does exceed 16M of progress; without the limit, I generally see 
something between 16M and 32M.

Now, that still is below 128M, but it’s kind of in the same magnitude. 
I don’t feel comfortable with that, especially given it’s so easy to 
limit it to much less (buf_size=64k makes the job proceed to 128k).

Also, maybe the default is increased in the future.  Increasing the 
chunk size by 4 would mean that it might be possible to reach 128M.

I find not relying on the default better.

Max


