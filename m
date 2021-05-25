Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1793D390000
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:30:53 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVGt-00077R-Eu
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llVBi-0003ci-PF
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:25:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llVBh-0003NJ-3t
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:25:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso10072658wmc.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wZG5CAmQb9j0CiHXl2cJtm4qqkSN3iwuojWZWKa5iF8=;
 b=KzpcuQu5GEcrMUU+FTkOytnWaGpv1W97OnHW6zXw7D61HcHBA0LtdYNVj8IqcVcqqC
 j+LwtGN0ToF1TTYwF18BAm7/L7vDxZ7ZgQO/3IXsLMKcR3yp4qIUVby/waP/NnVtNQBB
 7WMbdKnn6IW7ZEqQ2ZZ5wmZopYfvB43D4P86YJ3iYUSoA+vNiOlGiLb7Zz3nRvoFfJtz
 au1eSKQPwBztBw/+LsnpXds1Mui9QJybMf4lAg579Y9Me5udu4IBrBJJCTh+IWLCHtwC
 pozacXl37OWQnid3zNRHYQTIQ19ZH3EuHjkz+kn0mo6CO5rpab5pWPLBewwm4A43NgkJ
 fabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wZG5CAmQb9j0CiHXl2cJtm4qqkSN3iwuojWZWKa5iF8=;
 b=MBMLeASH9bK3pAHJvJGC4DTLaGs3GFCYoc/0pJVt3VvyoMpxVM/ntLLCPsXosz3OL9
 cOalHQfithJkkzKDE1lRqkfry5/7GUl3lT8sNb/BDK6zqWhoihnehI7JVjXV2i+74Iy8
 usN4G33mPB2AzvhP+x7c35QKLBZqEGej86puPPkSir9b0e9kv2Lbqs1CfbHgDS2IDMQZ
 QfRG8Zj1bTtDwR0HGxKAdXO7GcfuHBuh6YSzCItomfVoU/4Cjzcf5p63pOctw+wHaD0h
 zCd0r9Cr8hNsZ3CN0LAf2OjK7kizAFB/aFYaLC943YfaAgKSkqb+MlufmP2y4B418o/r
 tZ2w==
X-Gm-Message-State: AOAM533n2qMKQLzI3aerirTev6v9Ibxw6d7meEsjJsWfe4ZgP+yboxGq
 heyYQqOB5wTxQV/EYYS2vYo=
X-Google-Smtp-Source: ABdhPJzUD/7DzbmeC+ck3wMs7sjLmNi3nrFyZfxZCemswe27APRb533uuvDV59CBLvZqFV87xQjFIw==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr3296787wma.173.1621941927713; 
 Tue, 25 May 2021 04:25:27 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c206sm2443555wmf.12.2021.05.25.04.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 04:25:27 -0700 (PDT)
Subject: Re: [PATCH v1 3/8] gitlab: add special rule for the hexagon container
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-4-alex.bennee@linaro.org>
 <3f5c486a-2f67-8f65-ef7d-5877c69e2399@amsat.org>
Message-ID: <6c666ad7-828a-2d14-ebb4-98efd240d37d@amsat.org>
Date: Tue, 25 May 2021 13:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3f5c486a-2f67-8f65-ef7d-5877c69e2399@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 11:40 AM, Philippe Mathieu-Daudé wrote:
> On 5/20/21 7:42 PM, Alex Bennée wrote:
>> The hexagon container is always manually built but of course not
>> everyone will be building it themselves and pushing to their
>> registries. We still need to create a "local" registry copy for the
>> actual gitlab tests to run. We don't build it in this case, just pull
>> it across from the upstream registry. We disable this rule from
>> running on the qemu-project itself so it doesn't accidentally wipe out
>> our master copy.
>>
>> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>>
>> ---
>> v2
>>   - fix silly typo
>> ---
>>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>>  .gitlab-ci.yml              |  2 ++
>>  2 files changed, 29 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>> index 3fb3c14f06..088c7e68c3 100644
>> --- a/.gitlab-ci.d/containers.yml
>> +++ b/.gitlab-ci.d/containers.yml
>> @@ -101,6 +101,33 @@ armhf-debian-cross-container:
>>    variables:
>>      NAME: debian-armhf-cross
>>  
>> +# We never want to build hexagon in the CI system and by default we
>> +# always want to refer to the master registry where it lives.
>> +hexagon-cross-container:
>> +  image: docker:stable
>> +  stage: containers
>> +  except:
>> +    variables:
>> +      - $CI_PROJECT_NAMESPACE == 'qemu-project'
> 
> FYI Daniel said we should be consistent and use the 'rules:' syntax:
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg07308.html

Since our rule set default to 'always', this should be:

  rules:
    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
      when: always
    - when: never

