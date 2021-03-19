Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAE341A88
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:59:11 +0100 (CET)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCqU-0004Z7-Nh
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lNCom-0003If-3Z
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lNCok-0001sz-9m
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616151441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/g06Ltb4mpu6mLi4pBpR4hKMMqd5T3KFQ7bYqMp1vNQ=;
 b=Adwdy549rVOBactdsRdv3bon20PKVAE058CXXmutlp2jcplmCIoraw+NWOFzgLy16/Z3wF
 j/c/hoRSvX2jRyh/1FTI9JlspfOjSiuALT9RIMeMxQLf3FhJ+iQ9vczeTJHzwt75/e/2t4
 kQIbi6SVwnkCpoYckZM/Jxdx8gBwg74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-7yXhIhgMNC2uGeOAi7p6JA-1; Fri, 19 Mar 2021 06:57:19 -0400
X-MC-Unique: 7yXhIhgMNC2uGeOAi7p6JA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B9485B36A;
 Fri, 19 Mar 2021 10:57:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C4110013D6;
 Fri, 19 Mar 2021 10:57:16 +0000 (UTC)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
From: Max Reitz <mreitz@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
 <27c791b2-dcc0-6c98-d765-ac1b60b7af3d@vivier.eu>
 <0d55cabf-0fa0-f9fd-6436-de2e03422329@vivier.eu>
 <0b3cedb8-f40a-18fd-5030-a596afb9298d@redhat.com>
 <82f6dc3e-18bf-f90a-7e43-5568b319767c@redhat.com>
 <3bcc22b2-eb25-b0a0-f47b-72c747ca6f0a@redhat.com>
 <1a2a91a4-0425-0da9-482b-f46a6e17b6b0@redhat.com>
 <9743c786-e620-8e50-be7d-f0c38984e29e@vivier.eu>
 <fdfaff0c-39e1-909d-3421-84a03807f49b@redhat.com>
Message-ID: <5a660e21-264c-bfa0-f4ac-794488acd30d@redhat.com>
Date: Fri, 19 Mar 2021 11:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fdfaff0c-39e1-909d-3421-84a03807f49b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.03.21 11:51, Max Reitz wrote:
> On 19.03.21 11:50, Laurent Vivier wrote:
>> Le 19/03/2021 à 10:20, Max Reitz a écrit :
>>> On 19.03.21 07:32, Thomas Huth wrote:
>>>> On 18/03/2021 18.28, Max Reitz wrote:
>>>> [...]
>>>>>   From that it follows that I don’t see much use in testing 
>>>>> specific devices either.  Say there’s
>>>>> a platform that provides both virtio-pci and virtio-mmio, the 
>>>>> default (say virtio-pci) is fine
>>>>> for the iotests. I see little value in testing virtio-mmio as 
>>>>> well.  (Perhaps I’m short-sighted,
>>>>> though.)
>>>>
>>>> That's a fair point. But still, if someone compiled QEMU only with a 
>>>> target that only provided
>>>> virtio-mmio, the iotests should not fail when running "make check".
>>>> To avoid that we continue playing whack-a-mole here in the future, 
>>>> maybe it would be better to
>>>> restrict the iotests to the "main" targets only, e.g. modify 
>>>> check-block.sh so that the tests only
>>>> run with x86, aarch64, s390x and ppc64 ?
>>>
>>> Right, that would certainly be the simplest solution.
>>>
>>
>> The problem with that is we can't run the tests if target-list doesn't 
>> contain one of these targets.
> 
> Yes, but is that really a problem?

I should add: The thing is, I wouldn’t really call it a problem.  But 
still, as I said before somewhere in this thread, in theory we want to 
allow running the tests with every configuration.  It’s just that it’s a 
tradeoff between how much it helps and how much work it is to make them 
work.  (I gave s390 as an example, where effort was undertaken to make 
the iotests work.)

You’ve sent patches, so it seems you’re willing to invest the work. 
Sounds good to me, as long as we know it won’t rot.

Max


