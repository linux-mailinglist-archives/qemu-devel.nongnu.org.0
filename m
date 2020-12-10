Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466772D5379
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 06:53:25 +0100 (CET)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knEtH-0002nn-OO
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 00:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knEsE-0002Kq-Vw
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 00:52:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knEsB-00053v-B4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 00:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607579533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceKKNvxYviG2X0UPfYdcj5wxl44tfOyTD+m0qI2h8HI=;
 b=Z3vXZGGtgovHTCP1Dv0ISx6NhTJpH9SqMIMc1YaphNGYUq5eJERI/bOlfvggurjxRkwmWh
 r3seQSVHIVqlChEBKvVBs045Gue99NWZGBvYSRxfxlG5AQCcin7QsFee66Zbi+KSbsMx41
 A40Um+vaUYirG/H3o4CfB+pYBUu0c8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-aOJfVOJFOeuOVnMh5bGzLA-1; Thu, 10 Dec 2020 00:52:11 -0500
X-MC-Unique: aOJfVOJFOeuOVnMh5bGzLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0130559;
 Thu, 10 Dec 2020 05:52:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5B86064B;
 Thu, 10 Dec 2020 05:51:54 +0000 (UTC)
Subject: Re: [PATCH v1 6/6] gitlab: add --without-default-features build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
 <20201209170059.20742-7-alex.bennee@linaro.org>
 <0d1a0b59-ecbc-208f-8eb7-0aa323930cd9@redhat.com> <878sa6de19.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <10ef3cb1-21fd-3653-9772-ad93fdc487e1@redhat.com>
Date: Thu, 10 Dec 2020 06:51:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <878sa6de19.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/2020 19.32, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 09/12/2020 18.00, Alex Bennée wrote:
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>  .gitlab-ci.yml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 878d114d40..f87584ca8f 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -441,6 +441,13 @@ build-without-default-devices:
>>>      IMAGE: debian-amd64
>>>      CONFIGURE_ARGS: --without-default-devices --disable-user
>>>  
>>> +build-without-default-features:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: centos8
>>> +    CONFIGURE_ARGS: --without-default-devices --without-default-features --disable-user
>>> +    MAKE_CHECK_ARGS: check-unit
>>
>> I wonder whether we'd rather want to check without
>> "--without-default-devices" here to see whether all code compiles fine with
>> "--without-default-features" ... ?
> 
> Yeah at the moment the full-fat without everything doesn't achieve much.
> So how about I swap the IMAGE around with the previous build and drop
> the --without-default-devices?

Sounds like a plan, thanks!

 Thomas


