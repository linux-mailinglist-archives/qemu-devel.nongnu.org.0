Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0226C366
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 15:53:16 +0200 (CEST)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIXs3-0002q6-Ns
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 09:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIXrA-0002RA-LD
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 09:52:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kIXr9-0008TS-1G
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 09:52:20 -0400
Received: by mail-wr1-x444.google.com with SMTP id x14so6972945wrl.12
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8sW5cr/41cCmNzoYf61jU9R1aVXLS+FjN79KF0tXiZ8=;
 b=U+R25vh3e9hl6eKp6KKSyYUjZ6TMDuTm5Ht98Bcmo3xqTvRK6X8iAqjA4/M6cvnv1+
 PYTKn3Dht/VeYQYrnCYT7LQqcTL9i0glQDq0Dmzzd3SOH3//8Vc5E1z5TOSyUfbMHHPG
 WGMAGs+xU6He1+d8HCqr6Dy+wTLM8ezWYkcS97YHWiveJeuDYWn1HQzOTo2pAh+nDtXo
 FDf3knlfilnz9tVogI0nh35uj0JWsBYHhVliPM9ATJmq0MSP31X++CpP6dXWhxPeO5AJ
 9QbptRznBz+WU2JBAkibQbT7/RVCMFHKFUTjfI9RLJc+z5MtVBI4o/oELNIHRkfmyPC2
 q7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8sW5cr/41cCmNzoYf61jU9R1aVXLS+FjN79KF0tXiZ8=;
 b=QuueI4oQLtakAW9t+eHG65goET5oq9hMV3l2QdzUqzzIljf0xMhIZIdgLMHgtbL5zo
 u1X5MFejpmZUklHxbDN0Qu8bO27k/3YQU4JVZXbVjgiqXUoWoI3UXalJq+jxMJNQ79wd
 gj86iFk6UDq6aJq2fgZ9LGbKmp6LAQZNqYHei8+chUOSkcAEw5M2wcVYrU/lHRxGBMOu
 X+FXVMATE6jeuv6SRXRpszscBt4vzgTOg6YhIs6WLcFDWygLhD/jpm8vkRRLXAkurowY
 +z0Seo/kGLn+FgpB8TOrp3EwVPKGMFUJHRPODBAOFzpXJfprDNQz57NFkJezOv9QntdD
 A1nw==
X-Gm-Message-State: AOAM53282AERvBA3fWDMvSG6MTJ22k6obyzwb6Cdat5XpZ8qzQi3Hc5Z
 ajejIQy9pzTpD6NuYChZjm0=
X-Google-Smtp-Source: ABdhPJwqVA3jhKWXeyUNvF9PTO0lt8PCCxBPfXNRYEnVPQPFmcUVJPht3sXMUiVBXXEUD+mQ/pFHIg==
X-Received: by 2002:adf:e304:: with SMTP id b4mr25984830wrj.141.1600264337040; 
 Wed, 16 Sep 2020 06:52:17 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id d6sm33680271wrq.67.2020.09.16.06.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 06:52:16 -0700 (PDT)
Subject: Re: [PULL 7/8] gitlab: create a build-deprecated target
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200916122648.17468-1-alex.bennee@linaro.org>
 <20200916122648.17468-8-alex.bennee@linaro.org>
 <CAFEAcA_UEoe2H5zc=L1T3p31FoxKSfG0mRznN-68FQmGTp3+pg@mail.gmail.com>
 <87imcdzwh7.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d04bee00-624f-c48c-89a1-d5e6cbbddb76@amsat.org>
Date: Wed, 16 Sep 2020 15:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87imcdzwh7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.062,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/20 3:23 PM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Wed, 16 Sep 2020 at 13:27, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> These targets might be deprecated but we should keep them building
>>> before the final axe comes down. Lets keep them all in one place and
>>> don't hold up the CI if they do fail. They are either poorly tested or
>>> already flaky anyway.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>> Message-Id: <20200915134317.11110-8-alex.bennee@linaro.org>
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 72e8604579ee..f027b55aef15 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -254,6 +254,16 @@ build-clang:
>>>        ppc-softmmu s390x-softmmu arm-linux-user
>>>      MAKE_CHECK_ARGS: check
>>>
>>> +# These targets are on the way out
>>> +build-deprecated:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: debian-all-test-cross
>>> +    CONFIGURE_ARGS: --disable-docs --disable-tools --disable-system
>>> +    MAKE_CHECK_ARGS: check-tcg
>>> +    TARGETS: ppc64abi32-linux-user tilegx-linux-user
>>> +  allow_failure: true
>>
>> It's kind of awkward to have the CI config need to be updated when
>> we mark a config as deprecated. Can we have something so that
>> the CI just arranges to build all of the deprecated targets?
> 
> You mean a configure --enable-deprecated-targets?
> 
>>
>> (As demonstration, this list is missing unicore32, which is also
>> deprecated.)
> 
> That was fixed up in the next patch.
> 
>> Also, "allow_failure: true" seems wrong to me. These targets
>> are only deprecated, which means we promise that the feature
>> should still work (to whatever extent it already did) for the 2
>> releases in which it is deprecated. We want our CI to tell us
>> if it fails to compile or fails tests, because we would need to
>> fix those bugs for a release.

Should we stop building the ppc64abi32 target instead?

From c609274b853 ("docs/system/deprecated: mark
ppc64abi32-linux-user for deprecation"):

 The ppc64abi32 architecture has a number of issues which regularly
 trip up our CI testing and is suspected to be quite broken. For that
 reason the maintainers strongly suspect no one actually uses it.

> 
> I can revert that bit.
> 


