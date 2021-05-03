Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7D37132B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:48:02 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVBJ-0007Fx-3x
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldV8i-00069F-VQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:45:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldV8f-0007MX-1S
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:45:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id x5so4816796wrv.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qS5/h9gW026eR4/sVCW0yQpniD2leqjqTPdZSmNRv/M=;
 b=BIQeh7FGZ0Wn9DnoJkwbZSQgngHJNhpizCLgC3YC4noGm1eLFAqCHUeT0a0qGQbVQj
 7jbGAqN4Wle9XgbLL1m3dTAmIBZ+wRJVFDMI+s+EXrztwjfxXlEFXVqT2Ud7HhBcH8K3
 RQnXsg/AOXnBo4Fmgt90dRZOUW0DxsXarTQZyxnSFzXuXkm2auV4SOc/zqu74kx+9R0k
 sJN3hJg1jUnNA6lKST5fpuoXFbeOT4/FKaxG+HJ+s2BekGkJl/oFRwv2moev7YEWyBVj
 pweOtkyfo3jo2DZfIrty0832kasB1sIsNdeyBaZxroTyHoEjCKPQiN17SI15zrDVKdQ0
 jb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qS5/h9gW026eR4/sVCW0yQpniD2leqjqTPdZSmNRv/M=;
 b=DBs7nzjZ6kWIpafMmjXGCB+EJiSCiHmWmmDZP3AgeMYR5o+2P1iwwxRqQ/XQdQG2fI
 Jt4UhVPX2YqDcbjrPz9AmjvD3KIFvo0WvgkzABw+bdr9kkdNLGkuaGEWRzaQA+W4U152
 ygmvkK7BwodPQQsV1bo8jOITpvkMdCy+9x6ijINITkS0Bdv9izHXkkhzrO93jjGoGhzo
 pD78vHdfNgTK7pdisrrFCiH6GRpHi6J3lM8qd8ETZlOZW+kcbc1M9TldotsYyCEgNJAo
 V2pb2HZ9jU2LXtZevrMrK5Zc8RpDgZVyZQTO1TzDYJ/0uLNqg1Z1PwMntaTstRqw8u6+
 DikQ==
X-Gm-Message-State: AOAM530d6fgf+VstWlByfJDQnQisav7JckiXj2RQmulsvCTloxiVEdSw
 nnOKabF0TJzjyxFlIrSd2zA=
X-Google-Smtp-Source: ABdhPJyR4wPWJucYtN9J2IUUhV7kOEDlPh7e/becS1Dxn12y9/Fsj1g0X7QyHDpxmzh2p2mm2v+Q4A==
X-Received: by 2002:adf:e947:: with SMTP id m7mr24883227wrn.70.1620035111647; 
 Mon, 03 May 2021 02:45:11 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c2sm10704125wmr.22.2021.05.03.02.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:45:10 -0700 (PDT)
Subject: Re: [PATCH 04/15] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-5-f4bug@amsat.org>
 <4ade3b15-5f39-d319-0c3e-27f3c3cd39d5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11fdfed9-0b2a-52fc-5f7a-9a4fbd47873b@amsat.org>
Date: Mon, 3 May 2021 11:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4ade3b15-5f39-d319-0c3e-27f3c3cd39d5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:22 AM, Thomas Huth wrote:
> On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> 'extends' is an alternative to using YAML anchors
>> and is a little more flexible and readable. See:
>> https://docs.gitlab.com/ee/ci/yaml/#extends
>>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   .gitlab-ci.yml | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 11bda3abf33..07e5e737685 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -48,7 +48,7 @@ include:
>>       # Avoid recompiling by hiding ninja with NINJA=":"
>>       - make NINJA=":" $MAKE_CHECK_ARGS
>>   -.acceptance_template: &acceptance_definition
>> +.acceptance_test_job_template:
>>     cache:
>>       key: "${CI_JOB_NAME}-cache"
>>       paths:
>> @@ -111,7 +111,7 @@ acceptance-system-alpine:
>>     variables:
>>       IMAGE: alpine
>>       MAKE_CHECK_ARGS: check-acceptance
>> -  <<: *acceptance_definition
>> +  extends: .acceptance_test_job_template
> 
> FYI, I'm getting "YAML invalid" errors when adding this patch to my
> staging branch. I guess you cannot use extends twice in a job and you
> should extend the .acceptance_test_job_template from
> ..native_build_job_template instead.

I'm surprised because I tested/used that branch quite a lot.
Maybe a job using anchors got added meanwhile and I need to
rebase?

