Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C96C15FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGzn-0003v5-FK; Mon, 20 Mar 2023 11:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGzk-0003uv-95
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:00:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGzi-0006B7-4A
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:00:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m2so10655166wrh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679324416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PombwltuzV7Ef45PIeeCiVJxcKlB3/jEZ4P6YMl/cLw=;
 b=uoDooxlEsOGjpJlJzEdAmPL25NTahxw2gwfkGaRN7tFAEccGCeNTzQG40ce9zvzgrl
 rnZ1u5EHMIPS2uABnebH5WD/aCZWT5QrkVjnHOpWQEWc60cLc3z0jMPbgxhFdUI8Q6GC
 58X26HZU5tKTDMKjpmwGwr3lceZZkOlOXZaZTdmwU/9c1crpefkKmre1u9BckxeyDhhp
 YeEgnZ6aN9HJDMLF3fa+0G0m0aj5MdHW89wX3WDgIbTw6ipoeyXC6jFeCdMlr42frozp
 a5HJm0w45iFHjVxW+ty0pJ7w1mMuY//v3GuT2A7CfoC0CFbNtIYGJ5UDP+9uMqf2u0tf
 iarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679324416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PombwltuzV7Ef45PIeeCiVJxcKlB3/jEZ4P6YMl/cLw=;
 b=YR+PE16FzfaA1xenRuxvB3jfuW7E4VESWkGdGhx0phpqmMruBlid/t7DTXpHbcTGc5
 qRMr9QirkJTt+v7L3a1TOULeU3PsZjPW5c6LNLI4751hXg+tjrUF3ukw0j+BxLbvT0se
 gFuW9+HQ7VLKg77hNrQVp81de/Qt4FA7Y3W8ROuK1ug/nLMvCd1aMyLFHkJFu91yN29T
 4yVu8qFnpzhndgTeNzkjPWHAiqHoeqi0HrAgPQb9UkEkqQ5oH9DBrfvTCNkNbI28knuS
 8m5qHPPXeHgKm3oYWdzhXq7OyfRVmoIzaEEvwYUH4X3lEPhhp6nh51EYyYDk2kYl8elw
 7jXg==
X-Gm-Message-State: AO0yUKXxzS45HLjql0F2JORJ4pICO9QNjRvlsUUT9JPnVxBwMUUsSySl
 edlNBY9GPYL5TkTw3LddQ1xF2Q==
X-Google-Smtp-Source: AK7set8n8hz8ZsjOjFqizp7eHfKEMtrRxgPTxql4cRV36aFyNoTs6xrdqdqTwKRMwMzly7c2MNkG4w==
X-Received: by 2002:adf:ef0e:0:b0:2cf:ee6b:36aa with SMTP id
 e14-20020adfef0e000000b002cfee6b36aamr14558355wro.64.1679324416370; 
 Mon, 20 Mar 2023 08:00:16 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020adffa8a000000b002ce3d3d17e5sm9198061wrr.79.2023.03.20.08.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:00:15 -0700 (PDT)
Message-ID: <b641d439-c772-b3e5-1c22-268acaa2cf6b@linaro.org>
Date: Mon, 20 Mar 2023 16:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 00/31] various fixes (testing, plugins, gitdm)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <CAFEAcA-f=tDQqmisqaJQxwYjgYOv+1XbCUDcaZkH_Jikt1iYNg@mail.gmail.com>
 <ZBhqd7uyT0X6tRK7@redhat.com>
 <59d95542-c706-bb81-568d-372a4bf3e210@linaro.org>
 <ZBh0KPhu0rYbxTfE@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBh0KPhu0rYbxTfE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 20/3/23 15:56, Daniel P. Berrangé wrote:
> On Mon, Mar 20, 2023 at 03:43:07PM +0100, Philippe Mathieu-Daudé wrote:
>> On 20/3/23 15:15, Daniel P. Berrangé wrote:
>>> On Mon, Mar 20, 2023 at 01:42:46PM +0000, Peter Maydell wrote:
>>>> On Sat, 18 Mar 2023 at 11:46, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>>
>>>>> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
>>>>>
>>>>>     Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-170323-4
>>>>>
>>>>> for you to fetch changes up to 4f2c431acd43d0aa505494229d05fa343762f272:
>>>>>
>>>>>     qtests: avoid printing comments before g_test_init() (2023-03-17
>>>>>     17:50:19 +0000)
>>>>>
>>>>> You can see my CI run on the branch here:
>>>>>
>>>>>     https://gitlab.com/stsquad/qemu/-/pipelines/810271620
>>>>>
>>>>> The failures:
>>>>>
>>>>>     FreeBSD's time out on a migration test
>>>>>     Centos8 Stream because my private runner needs more disk space
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Misc fixes for 8.0 (testing, plugins, gitdm)
>>>>>
>>>>>     - update Alpine image used for testing images
>>>>>     - include libslirp in custom runner build env
>>>>>     - update gitlab-runner recipe for CentOS
>>>>>     - update docker calls for better caching behaviour
>>>>>     - document some plugin callbacks
>>>>>     - don't use tags to define drives for lkft baseline tests
>>>>>     - fix missing clear of plugin_mem_cbs
>>>>>     - fix iotests to report individual results
>>>>>     - update the gitdm metadata for contributors
>>>>>     - avoid printing comments before g_test_init()
>>>>>
>>>>
>>>> This seems to consistently fail an avocado test on the
>>>> centos-stream-8-x86_64 job:
>>>> (21/51) tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
>>>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit
>>>> code: 1\n Command: ./qemu-system-x86_64 -display none -vga none
>>>> -chardev socket,id=mon,fd=17 -mon chardev=mon,mode=control -machine
>>>> x-remote -nodefaults -device lsi53c895a,id=lsi1 -object x-remote-o...
>>>> (0.10 s)
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3962028269
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3965134190
>>>>
>>>>
>>>>
>>>> The iotests also don't seem to pass on the OpenBSD VM after this;
>>>> which test fails varies from run to run but the common factor
>>>> is a complaint about running out of disk space:
>>>
>>> This must be caused by the change in the way we register the
>>> iotests with meson, as I don't see any other interesting changes
>>> in this series.
>>
>> See "05/31 gitlab: update centos-8-stream job", now we call
>> 'make check-avocado' instead of
>> scripts/ci/org.centos/stream/8/x86_64/test-avocado.
> 
> I was referring to Peter's comment about the OpenBSD Vms showing
> failures wrt out of disk space. That won't be connected to any
> change to the centos 8 job

): I really need more coffee


