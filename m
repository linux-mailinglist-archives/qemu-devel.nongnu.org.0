Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173CA35171A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:11:02 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0qS-0008WS-Jk
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS0nd-0007iq-DQ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS0nW-0000Wn-23
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617296877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxUv0PxvZPeCKYdpsOJZmVzWYVwCAz8pGvUljmMu424=;
 b=dz10e1pDaIuZoA4bSKWJ0tmMsSQaoL1hL0XqJ8V5UlLmwCdyvDcWwlnUeSRtETykMxV8Ov
 FjlgSn+l7upyeJGjq2b6+K5nupc8MIGWN4n/Dd9rDgPXLKggMsA3S4b8+vXu+m9dmQLgCL
 8BmvdqV/4n0k/6DKZWzZpyIp4QZu8XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-xJllKEO_MqOLobVGh_eapw-1; Thu, 01 Apr 2021 13:07:54 -0400
X-MC-Unique: xJllKEO_MqOLobVGh_eapw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA25800D53;
 Thu,  1 Apr 2021 17:07:53 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDBD51DCB;
 Thu,  1 Apr 2021 17:07:49 +0000 (UTC)
Subject: Re: [PATCH 1/2] iotests/231: Update expected deprecation message
From: Max Reitz <mreitz@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210401155211.2093139-1-ckuehl@redhat.com>
 <20210401155211.2093139-2-ckuehl@redhat.com>
 <b4276364-0eee-f244-1146-ee8ac1a01a59@redhat.com>
Message-ID: <f8741f0d-48b7-76cb-945e-3c5ede14fab4@redhat.com>
Date: Thu, 1 Apr 2021 19:07:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b4276364-0eee-f244-1146-ee8ac1a01a59@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 18:52, Max Reitz wrote:
> On 01.04.21 17:52, Connor Kuehl wrote:
>> The deprecation message changed slightly at some point in the past but
>> the expected output wasn't updated along with it; causing it to fail.
>> Fix it, so it passes.
>>
>> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>>   tests/qemu-iotests/231.out | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Uh, well, you know what, I can’t find any version where there was any 
> other output.  Even back in 66e6a735e97450ac50fcaf40f78600c688534cae, 
> where this test was introduced, I get this diff.
> 
> What’s going on there?

Okay.  So:

Jeff’s original patch[1] included the “Future versions may cease to 
parse...” part.  v1 of his subsequent pull request[2] did, too.  But 
v2[3] didn’t.  Looks like Markus made a comment on v4 of the patch, and 
then Jeff fixed up the patch in his branch, but didn’t change the test. 
  In any case it’s clear that the reference output was wrong all along.

About the “no monitors specified” part...  The only place where I can 
find “no monitors” is in Jeff’s patches to add this iotest.  I have no 
idea where that orignated from.

So:

Reviewed-by: Max Reitz <mreitz@redhat.com>


[1]
https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00282.html

[2]
https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00307.html

[3]
https://lists.nongnu.org/archive/html/qemu-block/2018-09/msg00592.html


