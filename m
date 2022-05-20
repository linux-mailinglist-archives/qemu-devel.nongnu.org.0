Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC552F36E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:52:45 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns7jw-0000o8-Bf
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns7iU-0008Sb-LC
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:51:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns7iS-0003hh-N4
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:51:14 -0400
Received: by mail-pl1-x633.google.com with SMTP id w3so1443073plp.13
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tr3xl0rCiYgQXSFd1VPGsG9CD17YIe/PxaCpmjeUE+A=;
 b=mu7Q0wG5+8a6jQqhiwz56ueHFPzWanlS4Xd/ca8guVbe7tGSPtG3x4hTjFwibawJE0
 lGgAc6Olf/pIu2t7dqJsQN71b+HnxREptpGq3QIcrOCEiWXfrGxbqZf/ISCPPhhcOnkK
 BpyxDHbJkFiX34mBsYLrpEJ5/J4KJeoJuDku01irW8IMJF7zQP/I3RrqkKvTp2BFtvDd
 toXRgjbX0tEDAgUa5EWK0kyzf9EBw1mTlxWXgyOak4Dun0YtTztvmJ9kYuyEch+BP2EU
 wMNGSdaibbWD2d3JoOgixL5atGkBWxideYjvqS6Pb6MTheZ+eWz1bcSBnN/RKqmKg+TF
 vRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tr3xl0rCiYgQXSFd1VPGsG9CD17YIe/PxaCpmjeUE+A=;
 b=6V2xKNibY+5RSQ8c5aW0A+NvE3KQY0LyWdywmfA3SvhVbjgjluh7UC+3dBqHQtuRO/
 weJVrmftwD1FbkO/XjZxQmpc5BJ07WivkWnH+45yLuX0by1COl5qePFOH5bVWbOcMS5w
 LFn1WAPxaOeU+Euj3dNqMMO7nNwVYYevwxl1OYdkADEnF5Mnnb/GCswYgDTItjVHStyZ
 HN+IdJix0hTPCTK6kd2nnT8yuWbSvXUpdZ8yQe5LUGFn0aWqAfi/lP5TGuz7/nA4KSLo
 Dcj8M6H7RwN22XLQ36zrvOXfXXCggLVW84bvpDCyN6L08vvYEmtDr2sp3LRWWZ8vKRAg
 kVDg==
X-Gm-Message-State: AOAM531Fuut14VJpdIjQsNvPOyZp/gIDwxL4HToYVOPkrRrHYkNpvqK9
 Bcxl0gN5PYGDjwwzIs0J9cnrdg==
X-Google-Smtp-Source: ABdhPJwBKNdP9YjaI207CnUaBYoaSzbwmgC+dWmZx02yMacXipw4FsvFkm8VOwmRUcSgOKk+BxDE4A==
X-Received: by 2002:a17:90a:6487:b0:1df:7e0f:c93e with SMTP id
 h7-20020a17090a648700b001df7e0fc93emr12892684pjj.77.1653072671004; 
 Fri, 20 May 2022 11:51:11 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 cp25-20020a056a00349900b0050dc76281c0sm2056197pfb.154.2022.05.20.11.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 11:51:10 -0700 (PDT)
Message-ID: <f7b77aaa-66be-fea9-a785-da16e97e6621@linaro.org>
Date: Fri, 20 May 2022 11:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
 <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
 <CAFEAcA9JjSy2BE5FHaGY+JVRX7QHQnA43i=sRndtADfBE1yWuw@mail.gmail.com>
 <ffc1a4f6-5ef5-291e-c7aa-b392d4beffe6@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ffc1a4f6-5ef5-291e-c7aa-b392d4beffe6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/22 23:22, Thomas Huth wrote:
> On 19/05/2022 13.55, Peter Maydell wrote:
>> On Thu, 19 May 2022 at 07:32, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 18/05/2022 18.12, Richard Henderson wrote:
>>>> On 5/18/22 02:04, Thomas Huth wrote:
>>>>>    Hi Richard!
>>>>>
>>>>> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
>>>>>
>>>>>     Merge tag 'for_upstream' of
>>>>> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16
>>>>> 16:31:01 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
>>>>>
>>>>> for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
>>>>>
>>>>>     capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> * Remove Ubuntu 18.04 containers (not supported anymore)
>>>>> * Improve the cleanup of the QEMU binary in case of failing qtests
>>>>> * Update the Windows support statement
>>>>> * Remove the capstone submodule (and rely on Capstone of the distros instead)
>>>>
>>>> Fails centos-stream-8-x86_64 test,
>>>>
>>>> Run-time dependency capstone found: NO (tried pkgconfig)
>>>> ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/2473935684
>>>
>>> That's a custom runner ... who has access to that one? Cleber? Stefan? I
>>> didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...
>>
>> The 'Runner' string on the web page says:
>> "(Managed by Red Hat - willianr/clebergnu)"
> 
> Willian left, Cleber seems to be currently away from keyboard ... but I found someone who 
> has access, so capstone-devel should hopefully be there now.
> 
> Richard, could you please re-try to merge the pull request?

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



