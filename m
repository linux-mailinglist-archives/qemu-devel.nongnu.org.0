Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212B6A6B7C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:13:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKNf-0004oF-UU; Wed, 01 Mar 2023 06:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXKNd-0004nh-ML
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:12:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXKNb-0001KJ-Vc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:12:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id bw19so12773862wrb.13
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677669134;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rT6IJCO3G307IPuUraDVeTgC8PNfnzvDlRI9ACh49Fo=;
 b=ez3drqodTX/aFYqZUm56pCCX7E/3YzIBibsJXxPjIdyJmM0tMjuaFcCpynM6pPYzc7
 L2ARxsd0ZNp9R+OtKJ/X1vNiO++/aQc3nJ9h7DWUvY08M37+eEDykAsCt4YCz4jBt/La
 2jXdK3DPC59FnIeE7lwc6wiYM3m7b1v9UhhYYrAN50kYgTbaKvyShRgFo1HCeuWLBWg4
 7+POwxU4SC1+kFPNF+XdPuYfF5gn2RgzIKFYXuaiZsMxFmgyqU/Dwhkrw7jM3HSUx4oT
 uPW/2mVKnB7auPXOPCEoYZC6pcjqnlXWG9iV91VpjaT4he1ozIfD3kvFPFCuCGP2rXvj
 5iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677669134;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rT6IJCO3G307IPuUraDVeTgC8PNfnzvDlRI9ACh49Fo=;
 b=eVBT3VeOcu7BgR0HKFQLPycJxEIW/KgnNOz0EJ8OQujgqszRXbmJOjSUeBwfM/9OAa
 orwHKFDUlcBbIZBcFkWuAFZ5sGpLollFuve2pKQiZlrAGCoQ824fjn2RfYUdRrCt9wfH
 YLTuZwk7368uPZ9RDYxM61PFNe01Cfo4hI/yhrRFeY+snz7dYzdlB+LzPGDmpV1iMPFi
 zrGLxu8GttBsMsxLIazEVMJqMYcPKQbcLSr9783n7/X1IWBVEPf/X0X0qumi9Dj49ajV
 H0zfl1AXQhCb+nN9Qu+fmZo9d3dAgZ2SYWTWEucrDzAr5ODYebg3TncQObvQYQqIJ0XP
 2Shw==
X-Gm-Message-State: AO0yUKWVkiUvLC70Qt8yuK6yQ8H4f2sdyL38gRPh+acw1JeolF5nk2ae
 xoQihlaLc06deB3C3NP8cyALkg==
X-Google-Smtp-Source: AK7set+uHsjBX3Q1JVkiWf2Dob+iKQ0YFlTixrP4GUZQSpzVKQ8GGmw08SEHmQbvaf9RMxj5DWZGmA==
X-Received: by 2002:a5d:4842:0:b0:2c7:1c4e:1d11 with SMTP id
 n2-20020a5d4842000000b002c71c4e1d11mr4161150wrs.63.1677669134285; 
 Wed, 01 Mar 2023 03:12:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfe90c000000b002c3f9404c45sm12303097wrm.7.2023.03.01.03.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 03:12:13 -0800 (PST)
Message-ID: <5cf7b03b-d297-de3f-9787-f9f7905b6a9f@linaro.org>
Date: Wed, 1 Mar 2023 12:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
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
 <20230228190653.1602033-25-alex.bennee@linaro.org>
 <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com> <871qm8eqt0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qm8eqt0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/3/23 10:57, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 28/02/2023 20.06, Alex Bennée wrote:
>>> This test is exceptionally heavyweight (nearly 330s) compared to the
>>> two (both endians) TuxRun baseline tests which complete in under 160s.
>>> The coverage is slightly reduced but a more directed test could make
>>> up the difference.
>>> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
>>> Overall coverage rate:
>>>     lines......: 9.6% (44110 of 458817 lines)
>>>     functions..: 16.5% (6767 of 41054 functions)
>>>     branches...: 6.0% (13395 of 222634 branches)
>>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
>>> Overall coverage rate:
>>>     lines......: 11.6% (53408 of 458817 lines)
>>>     functions..: 18.7% (7691 of 41054 functions)
>>>     branches...: 7.9% (17692 of 224218 branches)
>>> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED
>>> is
>>> specified by the user.
>>
>> The explanation sounds somewhat implausible to me.
>> AVOCADO_TIMEOUT_EXPECTED should be for jobs where we are not sure
>> whether the job really finishes in time, e.g. when compiling QEMU with
>> debug flags enabled, and not for jobs that simply run a little bit
>> longer (in the latter case, it would be enough to simply bump the
>> timeout setting a little bit if necessary). So did you check whether
>> you really run into timeout issues here when compiling QEMU with debug
>> flags?
> 
> Ahh I realise now that I was running into the timeout because it was a
> gcov build. I'll drop the AVOACADO_TIMEOUT_EXPECTED bit for now.
> 
>>
>> Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't
>> need GITLAB_CI anymore, since we certainly don't set
>> AVOCADO_TIMEOUT_EXPECTED in the gitlab CI.

Correct we won't run AVOCADO_TIMEOUT_EXPECTED on GitLab CI.
Note however GITLAB_CI and AVOCADO_TIMEOUT_EXPECTED are not orthogonal.
See docs/devel/testing.rst:

AVOCADO_TIMEOUT_EXPECTED
...
   Even though the timeout can be set by the test developer, there
   are some tests that may not have a well-defined limit of time
   to finish under certain conditions. For example, tests that take
   longer to execute when QEMU is compiled with debug flags.
   Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` variable has been
   used to determine whether those tests should run or not.

GITLAB_CI
   A number of tests are flagged to not run on the GitLab CI.
   Usually because they proved to the flaky or there are constraints
   on the CI environment which would make them fail.

Personally I run the Avocado tests on a daily basis without
AVOCADO_TIMEOUT_EXPECTED, but certainly set it before posting
a pull request.

