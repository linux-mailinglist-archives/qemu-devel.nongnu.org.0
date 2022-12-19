Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B4650AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EAX-0005Ek-3W; Mon, 19 Dec 2022 06:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7EAU-0005EO-JN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:18:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7EAS-0000Nm-K8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:18:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso4474093wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOlHHeyeovrqHLGicyqvNOD34JvEyiUX7iWB4QCodPg=;
 b=fCiL2XI4L0QJ1Ax/5SmZaNVn7mXmYD5NVCDK1aYhJQB25KUY8PyTyiit+hQe/jDCiA
 ZfuZE/ebUo3vIfOqN0voEzK95J6g0KAG1Dxp07qzJh7OQI5vSwm6bYS6L1ZP4stlybn6
 BScaPcSaCbvMOnT9CI59zeTKvpC4F52lSjV+EAyDzysPmvc95eBeGTH0w3sI+SBLdO6f
 OfTnSkLylSRTowQhIOaovsSoQUt3MsZeOfmrNndpOLugaGKYD9UgicR8B6xEtONAIbSG
 LPJsCYNux6mh2qflBJCcl9tToeRLGvKkp4ZbldS7XmkdwYXMr30fQbvc9Gr7ShOd1OEW
 Vvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOlHHeyeovrqHLGicyqvNOD34JvEyiUX7iWB4QCodPg=;
 b=lhzrGx6Wlg+sEzF0VgXFrZqIlIaV/vgWCD9lh64gL2HpDla5ILWA3OCbbPEEw0XkeC
 e931e5d0SEF4U5TzR+yDVk1nGv8fviMbqtBoFF3UTmns+B5LZh6tryyOGpbjVhmWj1Ds
 rQiyKw8Abka5VEZTiVbhScpzeiG20HB5TJAFYLP0c76kHrXg5XeUqjYBqVg5k5S6Ytds
 R5IXXyhGrx93Zx31KEObGKUPc9YHhEuSxwzSe8jr9HCeaqe9wf0dSlxPAIFYe6+uwtsH
 elHLq/LL479e+pobgxPhQOrdWmczwzihCWCjDhEoVxyL+wkdh26t89EJIjIcVxAzn826
 bmmQ==
X-Gm-Message-State: AFqh2ko6X5wZHtl7tBaaCC97eyPbt7pM/0Cjqk708IJ6NDjxwU2uU35d
 3PMNS/IvB5HvgNL9vgqcQGTBBQ==
X-Google-Smtp-Source: AMrXdXuk24CVWkkYmIzl2XnAE1mJl4fval/EW9bVwH/oKU3/J2+GWTyBXbtv7K6bZMRtwh5hR33VQQ==
X-Received: by 2002:a05:600c:3d98:b0:3d3:5c7d:eded with SMTP id
 bi24-20020a05600c3d9800b003d35c7dededmr953220wmb.40.1671448726388; 
 Mon, 19 Dec 2022 03:18:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c290600b003cf5ec79bf9sm11540580wmd.40.2022.12.19.03.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 03:18:46 -0800 (PST)
Message-ID: <6a6266f5-02c6-c9cc-d9a6-e05841645e98@linaro.org>
Date: Mon, 19 Dec 2022 12:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
 <2f0247c5-0824-0157-94ed-10296ba7b5fa@linaro.org>
 <CAFEAcA82nb54j2t5dao-ADCsVBfWJF=fd42gsnjEU9V88i3Fkg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA82nb54j2t5dao-ADCsVBfWJF=fd42gsnjEU9V88i3Fkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 18:01, Peter Maydell wrote:
> On Sun, 18 Dec 2022 at 16:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 12/18/22 05:52, Peter Maydell wrote:
>>> On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>>>>
>>>> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>>>>
>>>>     Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://github.com/quic/qemu tags/pull-hex-20221216-1
>>>>
>>>> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
>>>>
>>>>     target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)
>>>
>>>
>>> Failed to build, s390x:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3492490152
>>>
>>> Program scripts/decodetree.py found: YES (/usr/bin/python3
>>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/scripts/decodetree.py)
>>> Program flex found: NO
>>> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found
>>> or not executable
>>>
>>> Can you get the CI requirements sorted out first, and then
>>> let me know when I can try re-merging this, please?
>>
>> Our s390x host won't be affected by any of the scripts,
>> it simply needs to be installed.

scripts/ci/setup/build-environment.yml need to be updated although.

>> Alex, can you please install flex + bison on s390x.ci.qemu.org?
> 
> Ah, if that's all we need to do, I have access for that. I'll
> install the packages and retry.
> 
> thanks
> -- PMM


