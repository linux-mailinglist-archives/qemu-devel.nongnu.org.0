Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275C6A6AF8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:42:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJtz-0004As-SD; Wed, 01 Mar 2023 05:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJtx-00045R-81
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:41:37 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJtt-0003Oq-Ve
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:41:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id az36so8238064wmb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677667292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ox2O2OK4aGI1BMllSXrqC/7z82S+aWOv7xmHwuOpN9Q=;
 b=m37rx2y9i3lVaNOMCAyMa03HMk8N6BhAIvXqeALWeMFCKD3g/9i115DosgX01kLCOe
 UI3php34U1JVTHFNJO/ZqN3Ace6ZRH7Jfp9+rkoRKQobzMksQskx5qMv8WVuwhQy3J79
 Sfcoqr1DDBB3h/xKNS0cZ4jAqgXBaxZJdEcNg1u8FlEuL2qfoah6JhyWl2JCXSIkKemQ
 cdfbVfZfH77P1E4sZVmWDYrh1vBffad8jyf94nex905l0u148PpA6kwu4CRYhRXeDX25
 EBgzR2Kmcsodvs0wda2fg9Hk5B9fwkrV+uYGnfcCEpJX2AkCXpbSmHJwRK6a3thi1wsZ
 qvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677667292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ox2O2OK4aGI1BMllSXrqC/7z82S+aWOv7xmHwuOpN9Q=;
 b=4izPoTdIvGT4FHRLMsfx8rG5pHWLJDv8wmFJM0mKUhs6ozYnO1Y6n/EYX9pLQ8sc6P
 kpy7JCCSh87mFGAXNCXFdsfU6l4KpmoDeeJjN/S1sxb2qGjHYJmIt+aKPYQEdTWS7FSA
 okaE4tOVS5Z0owWWeppRaathKEHoz4jJepWntW/pLsphuBNXEfPta+nzOzGO2OAIoylJ
 6y0Nnj4ae1i8PobrPIjs76Q17xiowbgezZxdgxHlXg/xJdhk+Zu0ebN4saoR7UHj1vOE
 AiLO5b3ypWn+T6ePCVBubsfFhtjB7ZBRvioKmEXLgwdFSEuRFXL67xK3JMMEBvORnrcd
 4jRw==
X-Gm-Message-State: AO0yUKWDFfrNDtEyDaDW97EGuF1lYUt2h2hfkKwta1fCKCQaWs2cZyBN
 m/hrA0/yZnPH8I8CuFT+m8nRXg==
X-Google-Smtp-Source: AK7set9vDR3SdaGOC1yPodzAbyAFrlrQrUT+VUQiEf1VjNUrmHjmEtOAbPY2OSdLDBUfqxZpFLoIfw==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:e7e7:a2f9 with SMTP id
 o5-20020a05600c4fc500b003eae7e7a2f9mr4932789wmq.13.1677667292350; 
 Wed, 01 Mar 2023 02:41:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003e20fa01a86sm16635528wms.13.2023.03.01.02.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:41:31 -0800 (PST)
Message-ID: <d2513416-4378-f107-9fbc-d55f3640df5a@linaro.org>
Date: Wed, 1 Mar 2023 11:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
 <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org> <87wn40dc48.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87wn40dc48.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 11:00, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 1/3/23 07:51, Thomas Huth wrote:
>>> On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
>>>> On 28/2/23 20:06, Alex Bennée wrote:
>>>>> To avoid lots of copy and paste lets deal with artefacts in a
>>>>> template. This way we can filter out most of the pre-binary object and
>>>>> library files we no longer need as we have the final binaries.
>>>>>
>>>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>>>> we bring that into the template as well.
>>>>>
>>>>> As an example the build-system-ubuntu artefacts before this patch
>>>>> where around 1.3 GB, after dropping the object files it comes to 970
>>>>> MB.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>    .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>>>    .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>>>    2 files changed, 46 insertions(+), 51 deletions(-)
>>>>
>>>> This is still kludging the fact that 'make check-qtest' rebuild
>>>> the world even if QEMU binaries are present.
>>> Did you try? ... if so, that would kill even more CI minutes, i.e.
>>> it would IMHO be a show-stopper for this patch.
>>
>> I remember we had to pass all build/ otherwise calling 'make
>> check-qtest check-tcg' would rebuild the same binaries, it it
>> was pointless to split the jobs in 2 stages. I might have missed
>> when that was fixed.
>>
>> I haven't tried, however I see in Alex job:
>>
>> $ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=/ s/.*=//
>> p' build/config-host.mak)
>> sed: can't read build/config-host.mak: No such file or directory
>> $ cd build
>> /bin/bash: line 144: cd: build: No such file or directory
>> ERROR: Job failed: exit code 1
>>
>> https://gitlab.com/stsquad/qemu/-/jobs/3847747769
> 
> That was an older run of the job where I thought the skip path would
> merge from the template. In the end I've just include git-submodules in
> all the build aretfacts instead of just for alpine.
> 
> It ran fine:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/3849512854

Indeed:
https://gitlab.com/stsquad/qemu/-/jobs/3849512800/artifacts/browse/build/

So a good improvement, but I'd prefer having a stricter "only include
what we need" policy rather than "exclude what we don't". The former
will catch missing additions, while the later won't notice until someone
spend time excluding pointless files manually again.

