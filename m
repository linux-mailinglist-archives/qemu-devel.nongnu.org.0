Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC526B7363
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbf01-0006nm-NA; Mon, 13 Mar 2023 06:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbezz-0006nO-Ch
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:01:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbezx-0002K3-Jk
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:01:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id p16so7478299wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678701704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33xRkMYqvcNoNQNKLYcfO7nyEmg6mDmvKeRMyFmaXFA=;
 b=F7WSWr0u3iwemaSRbrAgnNvwkBCCImJnn9uzQ2HRGLkbMQEEcVb2R+PULQzOZmJppm
 5udsAWxT1t1PCdVqFtx68jtHb9itzmJO7FuyKKzuXRrhGrwG3kueqZ6kfXn0/wrw8MKz
 1by9OvHY08VL8FYUWQQGVA4dcmPXbDLDtVS4HkqS3kxZkKO5HkO7Xr4nFsdHB2MdEXu4
 cja6pECE7AANf68Na5c+EbvXNhlF6IarDORXqp3TyA4RHt9LCXtNlz3+VN/2hyQBnXOC
 /RFMC7elsMr48MUGPH5IJIWJSR+E8Mq0jwBwCQ2Smj752wmxbiVB0e8iMIhVl8FMZ+Wm
 Jukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678701704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33xRkMYqvcNoNQNKLYcfO7nyEmg6mDmvKeRMyFmaXFA=;
 b=mR84Gh+RXte4xxXBZbwf34owPJBSTvAs9auEWVw0I/9VKLlZ92CSfq3v4Zn7q3X7X3
 FNle7NpUmh45tPvzCcJBTqJKs+9XN/EG2MISY34cLrLJtgtUjYZ7omwb7Hsehf5E6v8g
 2RotsEQ6eDbd9rxUDnrPBhFWDQC6ybS77FPuUbixolvNfOz0AdXFIIsHfQaIVr5o++QE
 yr7JJaxMunFye+W1q3JISv0SaKvB7iJPUhbFXCRyouAdC7YwQfrNybNedtv5zqrgp4f/
 nAbbyaB8QwupLNKzp7htGpxNs0JphML2TZmDU5r61SlRrMW7q/XU4QWWH06Jync086rS
 3xUg==
X-Gm-Message-State: AO0yUKXybViXaQWUEI6XXtplVKyYylxgtpJVRdb9NqGpp0036LAH5aTi
 whdZEcKVsbOMnNaPlmr7Pu2qNQ==
X-Google-Smtp-Source: AK7set9xDY52R+WY2ajkNepGwRrXhQGUvTtTcXlzfCLvNFrTF+yq/a8iAMMl2MaKqBh1CtGCrqRQ6A==
X-Received: by 2002:a05:600c:314c:b0:3ed:29db:cb77 with SMTP id
 h12-20020a05600c314c00b003ed29dbcb77mr196810wmo.25.1678701703913; 
 Mon, 13 Mar 2023 03:01:43 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg16-20020a05600c3c9000b003e9ded91c27sm10242579wmb.4.2023.03.13.03.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 03:01:43 -0700 (PDT)
Message-ID: <1600686e-a109-8ea4-4e1e-6844658150d8@linaro.org>
Date: Mon, 13 Mar 2023 11:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Simon Glass <sjg@chromium.org>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Pawe=c5=82_Po=c5=82awski?=
 <ppolawsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
 <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
 <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
 <5f1e8a9e-d19b-c9c5-ed07-7393de520b36@linaro.org>
 <CAEUhbmX1sO4YBbQZ3HtMh+LEtO0q68zxekXzCCsjG1xC=yS46w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAEUhbmX1sO4YBbQZ3HtMh+LEtO0q68zxekXzCCsjG1xC=yS46w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 13/3/23 10:35, Bin Meng wrote:
> Hi Philippe,
> 
> On Mon, Mar 13, 2023 at 4:51 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 13/3/23 03:09, Bin Meng wrote:
>>> On Fri, Mar 10, 2023 at 9:50 PM Philippe Mathieu-Daudé
>>> <philmd@linaro.org> wrote:
>>>>
>>>> On 10/3/23 14:38, Peter Maydell wrote:
>>>>> On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>>>
>>>>>> When we introduced this Gitlab-CI job in commit 71920809ce
>>>>>> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
>>>>>> the naive plan was to have reproducible binaries by downloading
>>>>>> what this job would build, testing it and eventually committing
>>>>>> it. With retrospective, nothing happened 3 years later and this
>>>>>> job is just bitrotting:
>>>>>>
>>>>>>      Step 1/3 : FROM ubuntu:18.04
>>>>>>      18.04: Pulling from library/ubuntu
>>>>>>      mediaType in manifest should be
>>>>>>      'application/vnd.docker.distribution.manifest.v2+json' not
>>>>>>      'application/vnd.oci.image.manifest.v1+json'
>>>>>>
>>>>>> Remove this job to avoid wasting maintenance and CI ressources.
>>>>>
>>>>> Does the same thing hold for the opensbi job ?
>>>>
>>>> Cc'ing Bin, I have no idea.
>>>>
>>>
>>> The OpenSBI job now builds fine. I have no preference on keeping vs.
>>> removing it.
>>>
>>> I remember our previous goal was to create CI jobs for every pc-bios
>>> image but apparently that never happened.
>>
>> Yes, and I don't see interest in the community (neither worry that
>> pc-bios/ images committed are built on each maintainer workstations).
>>
>> If it isn't consumed by QEMU, then better remove that job and save
>> precious CI minutes. I presume OpenSBI itself is already tested
>> by its mainstream project.
> 
> Not sure what does "consumed" here mean?
> 
> QEMU uses OpenSBI images on RISC-V machines by default.

QEMU repository allows building QEMU system binaries which 'consume'
the following (committed) files:
- pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
- pc-bios/opensbi-riscv64-generic-fw_dynamic.bin

We don't need to run the build-opensbi job to run QEMU: we use the
prebuilt images.

