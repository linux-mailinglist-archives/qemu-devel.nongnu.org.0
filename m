Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C461031B5CF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 09:09:08 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBYwN-0006un-LF
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 03:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBYvK-0006TB-Vg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:08:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBYvF-000480-Vg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:08:00 -0500
Received: by mail-wr1-x435.google.com with SMTP id n4so4823130wrx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+T0Bi/rjwhQvDqbGHJWKkMz7es55liCQYgJVv3XOhY=;
 b=e7v5oZI7VbU3OTJw2BOCHtvB4xJv+/VmOF8pzg9bPwENnYUQMnvLdkSZXoxxAt7fSS
 x/Yi6mHh+2pPtKb2EfgimTgEGw5fVUN4JPi25qFXCaxfhiwl74cM+FdcNdvREw9WsfCt
 AaTC/RvijBAx/4OWc+4JMfgJen0IV2qtpMtUvdxAc4os2sn5nk6zthjymANxLHbKZmwR
 A2OKUtzeHN+GpBdlgbhJCwof6k8Z8ShNbi/Y7UqiihwqIf+HTRFzrYxsBfuKHJiKsJYk
 Gow8apxCKrPHxEdqwAQsEBco05kHOKmJkmmy5Pjxv4sLO32WzK3DmWq+x6U6fJ8IAOGC
 QEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+T0Bi/rjwhQvDqbGHJWKkMz7es55liCQYgJVv3XOhY=;
 b=Ep/OXq1JYDaeWKfWB+XIU0DdYXoYVueTpUCJwaZSLpmQBHI1miliklDn4e31ZDTuro
 /FoNzbXsZ/l17GVgtal1EPHdeTfliyZD5iC66e28rT90xiHdLSCABdA+oOh97wCP1i9g
 saNPJCJr50fkMHhWHPFIO6pxrPsE8GyYn0247krkHBgZqcq3CnB7Rgqzcelq0UljqNg7
 xJWYWTZ4tOVGzTcP2LyqS68Aw8NFGCvZREt/4cWmH256eHuzelD66SPJvvwhZp6HuCSf
 09DMgAnXdV+2/qTn+uZbA6VeqgOIEobKEst+pdLuX0O6Vw2lDQMIxZNrOUVAXy/7zXxd
 JJ2w==
X-Gm-Message-State: AOAM5312/2NTLB1OniV/1HDgoYhNEqoxYXctFYFYy/2d+0zcQFF4NtyA
 eHa5YD6ns+QNsL7cjxR6kfA=
X-Google-Smtp-Source: ABdhPJxTB7MlV0Rtx3xFv1e8f6aL24LgdftaCdMQXsYSNxwVjynj2cVSnen15AoB7volYwOaEv4cLw==
X-Received: by 2002:adf:e809:: with SMTP id o9mr17468109wrm.137.1613376476195; 
 Mon, 15 Feb 2021 00:07:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c62sm24068254wme.16.2021.02.15.00.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 00:07:55 -0800 (PST)
Subject: Re: [RFC PATCH 37/42] gitlab-ci: Add job to test the MIPS r5900o32el
 target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-38-f4bug@amsat.org>
 <e0d29976-8ee5-a24f-cbcf-50e49a230091@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19776a9c-ed00-1d96-17d1-9fb3be71ba45@amsat.org>
Date: Mon, 15 Feb 2021 09:07:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e0d29976-8ee5-a24f-cbcf-50e49a230091@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 6:31 AM, Thomas Huth wrote:
> On 14/02/2021 18.59, Philippe Mathieu-Daudé wrote:
>> Add a job to build the MIPS r5900o32el (linux-user) target
>> and run the TCG tests.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitlab-ci.yml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 28a83afb914..7d7559416e3 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -622,6 +622,18 @@ build-without-default-features:
>>          
>> --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
>>
>>       MAKE_CHECK_ARGS: check-unit
>>   +build-r5900-user:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: fedora
> 
> Don't you have to use the new gentoo-mipsr5900el-cross image to get the
> cross-compiler?

Yes you are right. I split this in 2 hoping [*] we can make the TCG
testing optional (as the gentoo cross container image):

build-user-r5900:
  <<: *native_build_job_definition
  variables:
    IMAGE: fedora
    CONFIGURE_ARGS: --disable-tools --disable-docs --disable-blobs
--enable-debug-tcg
    TARGETS: r5900o32el-linux-user
  artifacts:
    expire_in: 2 days
    paths:
      - build

check-user-r5900:
  <<: *native_test_job_definition
  needs:
    - job: build-user-r5900
      artifacts: true
    - job: mipsr5900el-gentoo-cross-container
  variables:
    IMAGE: fedora
    MAKE_CHECK_ARGS: run-tcg-tests-r5900o32el-linux-user

[*] currently 'needs' is limited:

  If "needs:" is set to point to a job that is not instantiated
  because of "only/except" rules or otherwise does not exist,
  the pipeline is not created and a YAML error is shown.

(See https://docs.gitlab.com/ee/ci/yaml/README.html#needs)

Regards,

Phil.

