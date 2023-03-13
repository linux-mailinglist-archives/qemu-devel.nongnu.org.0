Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF886B71A0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbduS-0005eF-1a; Mon, 13 Mar 2023 04:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbduP-0005e1-WF
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:51:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbduO-0005We-E1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:51:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id ay8so2060164wmb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678697513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=flwII+CwwqwH9oZtNHAXLpGl94CyU5SId6qw+Vv6Sd4=;
 b=yKCcsczp45D7Y42PTVKctaNJXe3lWI9uRiytKrPeQOUaV+02tJn9p8QwPcp8EqssuF
 C0Jr4svNKhVqFRDQmqBmZhFVOEfHFXoIGl5LlmRpHfPqJROwt5GUFtCWU3MGHlRXsoHf
 w76EgW0CNv4A8XICEzQCRCPMC6sW6n2MUdbbf7OGnT0jsM7QlgQQxURh+9Teb6FyrgeT
 bqv1hxjCiEJfxU9N2mcNAZluLb78IlzCilvfFBiFk6G7MXorS4TiVxWZRw1qP2yHkh5Y
 Cz019usuZqZSMn4yGA9H8fIgPJsrXpx1+z4f9hOq12h+dIagXs73eOA7euMTDKFKRdI/
 ya3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678697513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=flwII+CwwqwH9oZtNHAXLpGl94CyU5SId6qw+Vv6Sd4=;
 b=tmiZTMVxlOyyuyDgJffTBmBO605cdnNuiCf0nszkQic43QJ7xED8OXPwMQHtzK8KQU
 M8dSZXFFO9Yrhaep2TB3opGLaMK+Mqh9RTUWClIwHE2FQ4l43I8EosyNmBEl4Q9+HHZF
 W1F+9SYqEvbLsFdGi0VE0JZyfx5ltGxcP5kRdpIbSoPYK6n43YZl4L4dlH8ubp8qiU2O
 hV48OIq/s8XyD0icDf7tlRDbQl35CYHI5bJP/SKmMSg6hCwQFs/SV7sfFvJSAKZDJITG
 eQeHbCqC1eQODsBhex1UdLgd0lxhZt3rMwcGgPzvmIPQINgqCN+KZL/J4jN96FZp+RHx
 IOwQ==
X-Gm-Message-State: AO0yUKULq4nllpWswY3q3AFjTJZIQUxmicyUVAm/ucwXGuvy2jI+P+eW
 cK+fdjZdOuvcm+I5T52QX+R9VQ==
X-Google-Smtp-Source: AK7set+kwO5csPxMNnPrQSNJSr3zvAUoX8xl8BTbhef1GEPp+HHMvez9ojuOxGy/AKxVdZV02/DB4w==
X-Received: by 2002:a05:600c:4509:b0:3eb:399d:ab28 with SMTP id
 t9-20020a05600c450900b003eb399dab28mr10028150wmo.37.1678697513239; 
 Mon, 13 Mar 2023 01:51:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o1-20020a05600c4fc100b003e2096da239sm9205305wmq.7.2023.03.13.01.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:51:52 -0700 (PDT)
Message-ID: <5f1e8a9e-d19b-c9c5-ed07-7393de520b36@linaro.org>
Date: Mon, 13 Mar 2023 09:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Simon Glass <sjg@chromium.org>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Pawe=c5=82_Po=c5=82awski?=
 <ppolawsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Palmer Dabbelt <palmer@rivosinc.com>
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
 <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
 <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 13/3/23 03:09, Bin Meng wrote:
> On Fri, Mar 10, 2023 at 9:50 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 10/3/23 14:38, Peter Maydell wrote:
>>> On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> When we introduced this Gitlab-CI job in commit 71920809ce
>>>> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
>>>> the naive plan was to have reproducible binaries by downloading
>>>> what this job would build, testing it and eventually committing
>>>> it. With retrospective, nothing happened 3 years later and this
>>>> job is just bitrotting:
>>>>
>>>>     Step 1/3 : FROM ubuntu:18.04
>>>>     18.04: Pulling from library/ubuntu
>>>>     mediaType in manifest should be
>>>>     'application/vnd.docker.distribution.manifest.v2+json' not
>>>>     'application/vnd.oci.image.manifest.v1+json'
>>>>
>>>> Remove this job to avoid wasting maintenance and CI ressources.
>>>
>>> Does the same thing hold for the opensbi job ?
>>
>> Cc'ing Bin, I have no idea.
>>
> 
> The OpenSBI job now builds fine. I have no preference on keeping vs.
> removing it.
> 
> I remember our previous goal was to create CI jobs for every pc-bios
> image but apparently that never happened.

Yes, and I don't see interest in the community (neither worry that
pc-bios/ images committed are built on each maintainer workstations).

If it isn't consumed by QEMU, then better remove that job and save
precious CI minutes. I presume OpenSBI itself is already tested
by its mainstream project.



