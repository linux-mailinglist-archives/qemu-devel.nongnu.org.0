Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528196C1519
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGjC-00053R-Tz; Mon, 20 Mar 2023 10:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGjB-00053E-Am
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:43:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGj9-0007Vp-EP
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:43:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m2so10598430wrh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679323390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZPZ2Ul/xLALEcydn01Wst22/fs8Ot99Eqe/wsxQD1lg=;
 b=rxsBaFXwVowHU+lpcW5iQfq/o6Yn2VIMOeI0ZFdXACi1DCxnG/Ca4AboB6K2adTYoS
 eB1lZMkAQj+cbFtOrCE5USNhD9nATNOShyoJ8stNQTeMt7jX77r+bbY/GGjsVkcPERFY
 OoR56KCbFi3Bzgo+shySeyueutXZ8i1Xn3JErE31u9kbcw5VgHOSPqi91fqC49/6AFNO
 9ByPlNPgIngjjzjCNRDh6NzBG8a9G4rNwiuxL9ha6wcVw0FBTEpmSn+HxhKIHgs3lb2K
 hCVmD5BYSkCGyB1Fab7QICVNI2awGre7nbA5swPjIyYlIJywfofLt/kUuHZY/x/aUeWl
 FSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPZ2Ul/xLALEcydn01Wst22/fs8Ot99Eqe/wsxQD1lg=;
 b=BR+oZrCs7SPXRZm/pgPv/YOW1Lb3Wfx8Z3m9MgvaVXNXUJGhFbxXu4H/2eTQB7nhpe
 +v9YwuUHnhEPL3+AiGmaUz57030rGhemfCHvm7KgYOIAtNoVS6MELNWoX+glHgC2cR7C
 P3ZexFASAF5VY6/5VPYGiCUcVvX7PTWxRNtPMids5KWP4X4xVo8CcyCcnQJwBQNYvsKm
 ZkCHmr9jWdOwmy/oMBxoqZCwSkfS8DCCTUPvzrFS8+ztFr4qSixdrQfWA/CArKSRotK6
 EzmUfg6VKxypwDzeIPgXyThqo0hkMzDh8qVGr7trt79oVstcU55BIsosVZGBNMLlbNOn
 bXJA==
X-Gm-Message-State: AO0yUKVd/JSvlcg24655oTfRKzaoYmBTuJwQqaJIo04BC33P9JZqRRN9
 35uLvrgp6OHDrPWiOjNZhIorhg==
X-Google-Smtp-Source: AK7set9KsiOzZTr54N/873ewcdhZKqTCbtExdDVOhR4iaU5ubXjdgmusbKG4ghf69nQoWsZGvBdQgQ==
X-Received: by 2002:adf:edce:0:b0:2c3:dd81:49ad with SMTP id
 v14-20020adfedce000000b002c3dd8149admr14900494wro.33.1679323389791; 
 Mon, 20 Mar 2023 07:43:09 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm9158190wrd.77.2023.03.20.07.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:43:09 -0700 (PDT)
Message-ID: <59d95542-c706-bb81-568d-372a4bf3e210@linaro.org>
Date: Mon, 20 Mar 2023 15:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 00/31] various fixes (testing, plugins, gitdm)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
 <ZBhqd7uyT0X6tRK7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBhqd7uyT0X6tRK7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 15:15, Daniel P. Berrangé wrote:
> On Mon, Mar 20, 2023 at 01:42:46PM +0000, Peter Maydell wrote:
>> On Sat, 18 Mar 2023 at 11:46, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
>>>
>>>    Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4
>>>
>>> for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:
>>>
>>>    qtests: avoid printing comments before g_test_init() (2023-03-17
>>>    17:50:19 +0000)
>>>
>>> You can see my CI run on the branch here:
>>>
>>>    https://gitlab.com/stsquad/qemu/-/pipelines/810271620
>>>
>>> The failures:
>>>
>>>    FreeBSD's time out on a migration test
>>>    Centos8 Stream because my private runner needs more disk space
>>>
>>> ----------------------------------------------------------------
>>> Misc fixes for 8.0 (testing, plugins, gitdm)
>>>
>>>    - update Alpine image used for testing images
>>>    - include libslirp in custom runner build env
>>>    - update gitlab-runner recipe for CentOS
>>>    - update docker calls for better caching behaviour
>>>    - document some plugin callbacks
>>>    - don't use tags to define drives for lkft baseline tests
>>>    - fix missing clear of plugin_mem_cbs
>>>    - fix iotests to report individual results
>>>    - update the gitdm metadata for contributors
>>>    - avoid printing comments before g_test_init()
>>>
>>
>> This seems to consistently fail an avocado test on the
>> centos-stream-8-x86_64 job:
>> (21/51) tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit
>> code: 1\n Command: ./qemu-system-x86_64 -display none -vga none
>> -chardev socket,id=mon,fd=17 -mon chardev=mon,mode=control -machine
>> x-remote -nodefaults -device lsi53c895a,id=lsi1 -object x-remote-o...
>> (0.10 s)
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3962028269
>> https://gitlab.com/qemu-project/qemu/-/jobs/3965134190
>>
>>
>>
>> The iotests also don't seem to pass on the OpenBSD VM after this;
>> which test fails varies from run to run but the common factor
>> is a complaint about running out of disk space:
> 
> This must be caused by the change in the way we register the
> iotests with meson, as I don't see any other interesting changes
> in this series.

See "05/31 gitlab: update centos-8-stream job", now we call
'make check-avocado' instead of 
scripts/ci/org.centos/stream/8/x86_64/test-avocado.

Per commit d7c2e2b3f4 ("Jobs based on custom runners: add CentOS
Stream 8"):

   The components of this custom job are:

     I) OS build environment setup code:

        - additions to the existing "build-environment.yml" playbook
          that can be used to set up CentOS/EL 8 systems.

        - a CentOS Stream 8 specific "build-environment.yml" playbook
          that adds to the generic one.

    II) QEMU build configuration: a script that will produce binaries
        with features as similar as possible to the ones built and
        packaged on CentOS stream 8.

   III) Scripts that define the minimum amount of testing that the
        binaries built with the given configuration (point II) under the
        given OS build environment (point I) should be subjected to.

Is this host machine (hackbox) installed exactly as per
build-environment.yml?

> At a high level we have four scenarios we're testing
> 
>   qcow2 + quick
>   raw  + slow
>   qed + thorough
>   vmdk + thorough
>   vpc + thorough
> 
> Previously each scenario was serialized wrt other scenarios, but
> within a scenario things run in parallel. So we could have more
> parallelization than we did in the past.
> 
> They were also serialized wrt any other tests QEMU runs.
> 
> IIUC, we skip any 'slow' and 'thorough' tests by default
> 
>    add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
>    add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
>    add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
> 
> 
> so in practice we should only be runing the qcow2 + quick
> tests, not the raw/qed/vmdk/vpc tests.
> 
> So the change in parallelism is that we can potentially run the
> block I/O tests in parallel with unit tests. Maybe parallel with
> avocado tests too, I'm not sure ?

