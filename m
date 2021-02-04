Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979430EE09
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:09:48 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Zhz-00041d-JI
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Zgd-00030P-7E
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Zga-0000ER-Ip
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612426099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajdIuBY7qLwaiYy9fQHuQLlYo7B6ok2yNF6vmJbi3Ps=;
 b=Hsbth5VucsS3TZeTS4KtJoQngJWYbJTBp4b/jV9hT3ouRBrHclYUsvmDW+3u+pixmchBr5
 5fDZBg2bmq6j95B5FXGgzeOnkPJRyVKiOlqi2rif6opvoBVhNFMzhLl+NWJFH3J3psrK+f
 2Z2n0EWKqDIwZgnHbpSEVTo/u+0CWjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-7SsNLlBcMNe07ocyq1ZZtg-1; Thu, 04 Feb 2021 03:08:16 -0500
X-MC-Unique: 7SsNLlBcMNe07ocyq1ZZtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67FA107ACFA;
 Thu,  4 Feb 2021 08:08:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8520110016FA;
 Thu,  4 Feb 2021 08:08:14 +0000 (UTC)
Subject: Re: gitlab containers are broken
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
Date: Thu, 4 Feb 2021 09:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 07.27, Richard Henderson wrote:
> On 2/3/21 8:03 PM, Thomas Huth wrote:
>> On 04/02/2021 00.04, Richard Henderson wrote:
>>> Something has gone wrong with the building of the containers
>>> in gitlab, because *all* off them are installing Alpine Linux.
>>>
>>> https://gitlab.com/rth7680/qemu/-/jobs/1006336396#L155
>>
>> I think that's ok ... the output about alpine that you see there is just the
>> output from the container that builds the final container. Later you can see
>> some "yum install" lines in that output, too, that's where the CentOS container
>> gets build. And the final compilation job runs on CentOS, too:
>>
>>   https://gitlab.com/rth7680/qemu/-/jobs/1006336699#L35
>>
>> (look for the string "Red Hat" there)
> 
> Hmm.  Is there any way to get the full output of the container build?  At
> present it's being truncated:
> 
> #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
> 
> 
> In particular, I'm trying to add a new test, and I have added libffi-devel.i686
> to the fedora-i386-cross.docker file, but then the actual build fails because
> the libffi header file is missing.
> 
> I know you may need the actual patch to comment, but pointers to how to debug
> this sort of failure are welcome.

I don't have a clue, all that container magic has been done by Daniel 
initially - maybe he can help (now on CC:) ...

  Thomas


