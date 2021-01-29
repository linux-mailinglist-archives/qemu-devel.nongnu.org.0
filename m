Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA7308C09
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:59:52 +0100 (CET)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Y3j-0003th-7l
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l5Y19-0001bI-JA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:57:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l5Y16-0000QQ-M7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611943027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4WbaOoqge5Q2TugOwpgUsR8G2GTosj+AT4A+cogFj4=;
 b=GiRtibv7ZY6Xm5C/z96n0U0B4BUDSvqIZbrFOOQrmT/SBDfr2a9A3scS/RSxXfGdKscwFr
 JMm3m/qB24FM2N+fOxhMe6qjvW3KX6k4HVQ9Mgn3U6B797bD9pHoaij8pdkV1e2LgoXrrs
 DUmuEJmW6DRC7UKiKThRWgCpRQ8MRVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-D9kG-xwVMqm5qq4QvQAxbA-1; Fri, 29 Jan 2021 12:57:05 -0500
X-MC-Unique: D9kG-xwVMqm5qq4QvQAxbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E788107ACF6;
 Fri, 29 Jan 2021 17:57:04 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F79060CC4;
 Fri, 29 Jan 2021 17:57:03 +0000 (UTC)
Subject: Re: [PATCH] iotests/297: pylint: ignore too many statements
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210128200417.303775-1-vsementsov@virtuozzo.com>
 <7490fbd7-90d0-c1b9-172e-5d507453bf1a@virtuozzo.com>
 <20210129095018.GB10888@merkur.fritz.box>
From: John Snow <jsnow@redhat.com>
Message-ID: <d090331e-33d7-925d-e59e-420e9a39a5a2@redhat.com>
Date: Fri, 29 Jan 2021 12:57:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129095018.GB10888@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 4:50 AM, Kevin Wolf wrote:
> Am 28.01.2021 um 21:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 28.01.2021 23:04, Vladimir Sementsov-Ogievskiy wrote:
>>> Ignore two complains, which now lead to 297 failure on testenv.py and
>>> testrunner.py.
>>>
>>> Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
>>> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>
>> Forget to note:
>>
>> I don't add exclusions to pylintrc intentionally, as I think these
>> warnings are reasonable, and it's good that vim ALE show them.. Still,
>> adding them to pylintrc works too if you prefer.
> 
> I would have disabled the warning completely because I don't think
> length in lines is a good measure for code quality. But if we think that
> these warnings are in fact reasonable, then we should fix them and not
> just disable them partially.
> 
> It's the same reason why we have -Werror enabled. If you leave warnings
> around without any intention to fix them, the useful warnings will drown
> in the masses of intentionally ignored ones.
> 
> Kevin
> 

It's at least a sniff test. There are extremely valid reasons for many 
of the "warnings" to be suppressed, but usually you should have to 
consciously justify it, I think.

Vladimir put the suppression in pylintrc under the "Temporary" section 
for v2, which I think is appropriate, so I gave it my R-B.

--js


