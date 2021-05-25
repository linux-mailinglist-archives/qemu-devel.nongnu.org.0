Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA8390A8E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:35:11 +0200 (CEST)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldle-0007b6-8t
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lldk7-0006Fa-Df
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lldk5-0001jD-8d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621974812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9C8fAlrxfFMeDRg0lAsAyyv285SB5V4r4GWeJW7QQQs=;
 b=hBOFRq9CwUmP/nNHtu26c5wkuKAxst127MIalG8IAsqtJpVKvldhCOrwCeB+f88rN969en
 YpfSCIO5GhAglpe9DvKMuXGVGsRL9VXoISMZJ3yVBTdQ0B47tFmUHdaIyuUYkBJ1/UPAoZ
 XFtqFAUhKyAATHjKBSyuocKD8dUl5/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-mz2adLkXO7q8eqxYrJ16Iw-1; Tue, 25 May 2021 16:33:28 -0400
X-MC-Unique: mz2adLkXO7q8eqxYrJ16Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B95A79EC1;
 Tue, 25 May 2021 20:33:27 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A871100AE43;
 Tue, 25 May 2021 20:33:17 +0000 (UTC)
Subject: Re: [PATCH v6 24/25] gitlab: add python linters to CI
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-25-jsnow@redhat.com>
 <YK1WT2b69BZVN1Kw@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <d226c20a-3c3a-1a35-a06d-9c41fc260270@redhat.com>
Date: Tue, 25 May 2021 16:33:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK1WT2b69BZVN1Kw@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 3:55 PM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:40PM -0400, John Snow wrote:
>> Add python3.6 to the fedora container image: we need it to run the
>> linters against that explicit version to make sure we don't break our
>> minimum version promise.
>>
>> Add pipenv so that we can fetch precise versions of pip packages we need
>> to guarantee test reproducability.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   .gitlab-ci.yml                         | 12 ++++++++++++
>>   tests/docker/dockerfiles/fedora.docker |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index dcb6317aace..a371c0c7163 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -779,6 +779,18 @@ check-patch:
>>       GIT_DEPTH: 1000
>>     allow_failure: true
>>   
>> +
>> +check-python:
>> +  stage: test
>> +  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
>> +  script:
>> +    - cd python
>> +    - make venv-check
>> +  variables:
>> +    GIT_DEPTH: 1000
>> +  needs:
>> +    job: amd64-fedora-container
>> +
>>   check-dco:
>>     stage: build
>>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
>> index 915fdc1845e..6908d69ac37 100644
>> --- a/tests/docker/dockerfiles/fedora.docker
>> +++ b/tests/docker/dockerfiles/fedora.docker
>> @@ -84,6 +84,7 @@ ENV PACKAGES \
>>       numactl-devel \
>>       perl \
>>       perl-Test-Harness \
>> +    pipenv \
>>       pixman-devel \
>>       python3 \
>>       python3-PyYAML \
>> @@ -93,6 +94,7 @@ ENV PACKAGES \
>>       python3-pip \
>>       python3-sphinx \
>>       python3-virtualenv \
>> +    python3.6 \
> 
> I personally would prefer having a different container image for this
> job.  Because it would:
> 
> 1. Be super simple (FROM fedora:33 / dnf -y install python3.6 pipenv)
> 2. Not carry all this unnecessary baggage
> 3. Not risk building QEMU with Python 3.6 (suppose the ./configure
>     probe changes unintentionally)
> 
> But, AFAICT there is no precedent in requiring new images for
> different types of checks.  So, unless someone else complains loudly,
> I'm OK with this.
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Hm....

I'll try. You're right that it would make the pipeline a lot simpler 
because it'd have less cruft.

but thank you for the R-B in the meantime ;)

--js


