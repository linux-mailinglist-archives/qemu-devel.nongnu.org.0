Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1036527FAD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:29:38 +0200 (CEST)
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqW6j-0005e6-Mr
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqW2s-0003Vx-QR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqW2r-00017E-2P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652689536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnB5cM5yJF59ZFsYIhkU8o76ZGZ7SiBiXu6EvlKlJR8=;
 b=if0SW5q6KBg3qBaDovdtJOwizG1yTh3/Dlc5Wu52AG/ImTrg50OfysLGmHc9/b3JlVJTjJ
 4t0O+8+V43O54TVmEknm8x3o+MgVnfkO2phXTyE83XrFXxrAynUDm6a8KszQewHGXjL34m
 wfslGOqdTAKlxjrFzrvTIegD6WGe3rY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-nf5nKFNnPCe04A3ObFJQbg-1; Mon, 16 May 2022 04:25:34 -0400
X-MC-Unique: nf5nKFNnPCe04A3ObFJQbg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so3701009wrg.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 01:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bnB5cM5yJF59ZFsYIhkU8o76ZGZ7SiBiXu6EvlKlJR8=;
 b=mVBle8Piz0PMZSTkQ2BDLT5gWNLyBgUiYAP+SAE18QZHub47IO5b4mSrpfLdjKfzAt
 9gf0HLZ5UMoMcNaQdIqL8tY+6L14D2LKIrM/Blyn86px6cC9uUKoqhQ3nYj/bD+Hoz58
 EnF5B+JPBxyb7EFRS0D12s/HxqrDk8CB32c6s5Azv4qsdJXZggNpKzOdJYvZ3XgCqHcz
 3FerI8Og1fEzxdT1/id4cgAyG5YbVTP2ZGgx8f5VWT5CdK5txNBLgBwQTB0YHtJSeLhH
 Xxt0n2u/QwZG9LevJiWSR6x7KTNAv6V8cmnwqnLgDtx0C22WqKkTRXuAvVl85XsQYrAh
 k7YA==
X-Gm-Message-State: AOAM532szfMdlse+mbjbp48d1RPntO6ao38U2xvCIEKtoVltSs5m8pv9
 jP9UAKT0YrSumq2p63IZ8UXLm0OOA63U9EHV3GsCD+JujKVzxzSiCmoQgo0eL69hq8DF0WVTDGQ
 TNVkW+COSZTN/B+A=
X-Received: by 2002:adf:fc4c:0:b0:20a:d9d4:5f30 with SMTP id
 e12-20020adffc4c000000b0020ad9d45f30mr12975193wrs.578.1652689533595; 
 Mon, 16 May 2022 01:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV4XR1giJ8D3OwFzcfoBj5jiFCaZjuB+eZscBdboMF+/l8+tnkNgDYZO26MGOKwWXsdowFmA==
X-Received: by 2002:adf:fc4c:0:b0:20a:d9d4:5f30 with SMTP id
 e12-20020adffc4c000000b0020ad9d45f30mr12975171wrs.578.1652689533364; 
 Mon, 16 May 2022 01:25:33 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-142.web.vodafone.de.
 [109.43.178.142]) by smtp.gmail.com with ESMTPSA id
 k20-20020adfb354000000b0020d110bc39esm195941wrd.64.2022.05.16.01.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 01:25:32 -0700 (PDT)
Message-ID: <c792737d-d68f-ed56-26ac-bac418dec0ba@redhat.com>
Date: Mon, 16 May 2022 10:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH] gitlab-ci: Switch the 'check-patch' & 'check-dco'
 jobs to use python-container
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220503203621.243153-1-thuth@redhat.com>
 <YnJDZp809F14a0DB@redhat.com>
 <e3fe483b-f304-38af-bbfb-a65b2f350843@redhat.com>
 <YnJFd8D11TAsjx9o@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnJFd8D11TAsjx9o@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2022 11.20, Daniel P. Berrangé wrote:
> On Wed, May 04, 2022 at 11:18:30AM +0200, Thomas Huth wrote:
>> On 04/05/2022 11.12, Daniel P. Berrangé wrote:
>>> On Tue, May 03, 2022 at 10:36:21PM +0200, Thomas Huth wrote:
>>>> The 'check-patch' and 'check-dco' jobs only need Python and git for
>>>> checking the patches, so it's not really necessary to use a container
>>>> here that has all the other build dependencies installed. By installing
>>>> "git" in the python container, we can use this light-weight container
>>>> for these jobs instead.
>>>
>>> Our python container is far from light-weight....
>>>
>>> $ time podman pull registry.gitlab.com/qemu-project/qemu/qemu/python
>>>
>>> real	1m52.717s
>>> user	1m32.327s
>>> sys	0m19.453s
>>>
>>> vs
>>>
>>> $ time podman pull python:3.8-alpine
>>>
>>> real	0m4.509s
>>> user	0m3.780s
>>> sys	0m1.052s
>>>
>>>
>>> It is quicker to use the alpine python container and then just
>>> install 'git' on every job, than it is to use the pre-built
>>> qemu python container
>>>
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    Mark as RFC since I'm not sure whether we want to have "git" in
>>>>    the python container or not?
>>>>
>>>>    .gitlab-ci.d/static_checks.yml         | 8 ++++----
>>>>    tests/docker/dockerfiles/python.docker | 1 +
>>>>    2 files changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
>>>> index 5e955540d3..0e080bd0a0 100644
>>>> --- a/.gitlab-ci.d/static_checks.yml
>>>> +++ b/.gitlab-ci.d/static_checks.yml
>>>> @@ -1,8 +1,8 @@
>>>>    check-patch:
>>>>      stage: build
>>>> -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>>>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>>>      needs:
>>>> -    job: amd64-centos8-container
>>>> +    job: python-container
>>>>      script:
>>>>        - .gitlab-ci.d/check-patch.py
>>>>      variables:
>>>> @@ -15,9 +15,9 @@ check-patch:
>>>>    check-dco:
>>>>      stage: build
>>>> -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>>>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>>>      needs:
>>>> -    job: amd64-centos8-container
>>>> +    job: python-container
>>>>      script: .gitlab-ci.d/check-dco.py
>>>>      variables:
>>>>        GIT_DEPTH: 1000
>>>
>>> IOW this is sufficient:
>>>
>>>     image: python:3.8-alpine
>>>     needs: []
>>>     before_script:
>>>       - apk update
>>>       - apk add git
>>>     script: ./gitlab-ci.d/check-dco.py
>>>
>>>
>>> I expect the same would work for check-patch.py container
>>
>> ... or would it make sense to switch tests/docker/dockerfiles/python.docker
>> to use alpine instead of fedora?
> 
> That could work too

I just tried it, and it did not work out as expected: The 
check-python-pipenv job needs a more sophisticated environment than the 
alpine container can provide easily (e.g. it still needs python-3.6), so I 
updated my patch with your idea instead and used the python:alpine container 
as a base there now.

  Thomas


