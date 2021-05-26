Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E7391F2F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:33:26 +0200 (CEST)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyLN-0001aZ-2A
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llyAB-0002yb-MJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llyA9-0002W0-PO
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622053309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nq+omrtOGIn9LacvXjgNHK1VZgI2yT0RVus11DCH6Qo=;
 b=grcL/sIhxv2mn3mJF18Rt2CZG2EJe326ouf6xaPO2c5PI+sXeC4sAoxQAtbI8dsdqP8Uit
 FUpzFAEr8nmAlNNDunE7X9dcVxMQffOPGKSV/NOJD9aEM3DzmcWn4lsZ5ZJAtrjMEvCfHp
 ykOvKnAqq6jBMoQhbBBzfmq55jKHwGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-XdC1qvwSPIuCcqBdl8vIdw-1; Wed, 26 May 2021 14:21:47 -0400
X-MC-Unique: XdC1qvwSPIuCcqBdl8vIdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036991051EAB;
 Wed, 26 May 2021 18:21:43 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A70F019D9D;
 Wed, 26 May 2021 18:21:34 +0000 (UTC)
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com> <874kep33xp.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <0ceaccaa-b520-e545-d47d-be5f3aba353b@redhat.com>
Date: Wed, 26 May 2021 14:21:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <874kep33xp.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 11:32 AM, Alex Bennée wrote:
> 
> John Snow <jsnow@redhat.com> writes:
> 
>> Add a python container that contains just enough juice for us to run the python
>> code quality analysis tools.
>>
>> Base this container on fedora, because fedora has very convenient
>> packaging for testing multiple python versions.
>>
>> Add two tests:
>>
>> check-python-pipenv uses pipenv to test a frozen, very explicit set of
>> packages against our minimum supported python version, Python 3.6. This
>> test is not allowed to fail.
>>
>> check-python-tox uses tox to install the latest versions of required
>> python dependencies against a wide array of Python versions from 3.6 to
>> 3.9, even including the yet-to-be-released Python 3.10. This test is
>> allowed to fail with a warning.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   .gitlab-ci.d/containers.yml            |  5 +++++
>>   .gitlab-ci.yml                         | 26 ++++++++++++++++++++++++++
>>   tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
>>   3 files changed, 49 insertions(+)
>>   create mode 100644 tests/docker/dockerfiles/python.docker
>>
>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>> index 765408ae274..05ebd4dc11d 100644
>> --- a/.gitlab-ci.d/containers.yml
>> +++ b/.gitlab-ci.d/containers.yml
>> @@ -242,3 +242,8 @@ amd64-opensuse-leap-container:
>>     extends: .container_job_template
>>     variables:
>>       NAME: opensuse-leap
>> +
>> +python-container:
>> +  extends: .container_job_template
>> +  variables:
>> +    NAME: python
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index f718b61fa78..cc2a3935c62 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -789,6 +789,32 @@ check-patch:
>>       GIT_DEPTH: 1000
>>     allow_failure: true
>>   
>> +
>> +check-python-pipenv:
>> +  stage: test
>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>> +  script:
>> +    - cd python
>> +    - make venv-check
>> +  variables:
>> +    GIT_DEPTH: 1000
> 
> A GIT_DEPTH of 1000 seems rather arbitrary - why not 1 (or 3)? Do the
> tools actually care about diff history?
> 

Just copy-pasted from other check jobs nearby. I'll set it to 1.

>> +  needs:
>> +    job: python-container
>> +
>> +
>> +check-python-tox:
>> +  stage: test
>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>> +  script:
>> +    - cd python
>> +    - make check-tox
>> +  variables:
>> +    GIT_DEPTH: 1000
>> +  needs:
>> +    job: python-container
>> +  allow_failure: true
>> +
>> +
>>   check-dco:
>>     stage: build
>>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>> diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
>> new file mode 100644
>> index 00000000000..56d88417df4
>> --- /dev/null
>> +++ b/tests/docker/dockerfiles/python.docker
>> @@ -0,0 +1,18 @@
>> +# Python library testing environment
>> +
>> +FROM fedora:latest
>> +MAINTAINER John Snow <jsnow@redhat.com>
>> +
>> +# Please keep this list sorted alphabetically
>> +ENV PACKAGES \
>> +    gcc \
>> +    make \
>> +    pipenv \
>> +    python3 \
>> +    python3-pip \
>> +    python3-tox \
>> +    python3-virtualenv \
>> +    python3.10
>> +
>> +RUN dnf install -y $PACKAGES
>> +RUN rpm -q $PACKAGES | sort > /packages.txt
> 
> 
> Otherwise seems OK to me:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

Thanks :)


