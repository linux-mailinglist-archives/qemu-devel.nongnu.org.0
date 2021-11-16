Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C755E453873
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:24:47 +0100 (CET)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2CM-0008N9-3J
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:24:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mn2An-0007La-UT
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:23:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mn2Ak-0004Cx-71
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637083385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZDIeW74l9cIA9SJsJacxZVwHFafyEKEHkqkQAZlT1U=;
 b=eI4v407iMJXNEqUWIvdnzqyDxw14YiqtwqUvesBsEpqSxgQ2z3q3Qb5u699fZXWJnVNyoC
 KG7l1fUB+wuo7R/QOhzcg94RY8m7M0LHfU7iuHQ+M2WgI73beCGRpJLMyfRoIGbLfDKqmc
 ICpAPxP8YbyKSsu/escc/m+7hkq3PPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-RQz9f0BPOwq2px1Hjom-fw-1; Tue, 16 Nov 2021 12:23:01 -0500
X-MC-Unique: RQz9f0BPOwq2px1Hjom-fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA9310151EE;
 Tue, 16 Nov 2021 17:23:00 +0000 (UTC)
Received: from [10.39.194.244] (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78A745C3E0;
 Tue, 16 Nov 2021 17:22:47 +0000 (UTC)
Message-ID: <632a5f2e-3e5d-1ed7-e27f-82571e374043@redhat.com>
Date: Tue, 16 Nov 2021 18:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211116163309.246602-1-thuth@redhat.com>
 <YZPhHt4JFcz41YFJ@redhat.com>
 <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
In-Reply-To: <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2021 18.09, Philippe Mathieu-Daudé wrote:
> On 11/16/21 17:49, Daniel P. Berrangé wrote:
>> On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
>>> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
>>> be scheduled, so while the build test itself finishes within 60 minutes,
>>> the total run time of the jobs can be longer due to this waiting time.
>>> Thus let's increase the timeout on the gitlab side a little bit, so
>>> that these jobs are not marked as failing just because of the delay.
...>>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>>> index e7b25e7427..22d42585e4 100644
>>> --- a/.gitlab-ci.d/cirrus.yml
>>> +++ b/.gitlab-ci.d/cirrus.yml
>>> @@ -14,6 +14,7 @@
>>>     stage: build
>>>     image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>>>     needs: []
>>> +  timeout: 80m
>>>     allow_failure: true
>>>     script:
>>>       - source .gitlab-ci.d/cirrus/$NAME.vars
>>
>> Whether 80 or 100 minute, consider it
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> This pipeline took 1h51m09s:
> https://gitlab.com/qemu-project/qemu/-/pipelines/409666733/builds
> But Richard restarted unstable jobs, which probably added time
> to the total.
> 
> IIRC from a maintainer perspective 1h15 is the upper limit.
> 80m fits, 100m is over.

I think I agree ... I normally don't want to wait more than a little bit 
more than one hour, so 100 minutes feels too long already. We already have 
some 70m timeouts in other jobs, and one 80 minute timeout in 
.gitlab-ci.d/crossbuild-template.yml, so I'd say 80 minutes are really the 
upper boundary that we should use.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thank to all for your reviews!

  Thomas


