Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543796738B4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU8o-0006cM-LQ; Thu, 19 Jan 2023 07:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIU8m-0006Xg-Cp
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:35:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIU8j-0007cp-Vu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:35:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so2721588wmq.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G759XjHotxBmkEFBsVgdOmKG6oeAu6tQI5DaentPAtE=;
 b=MahV4wzYgphoHXT4RIAyZ6kF0nrqFrNC7fGc0mBcPozd4xwv/pTAPaBYqENH7hzVzf
 Jz6lNPzTRHTT64j4dkhFM5HG4YbLQ7fX1kZWG6DRic7KNsFLgP8v43PLHzp/E0xHW0pB
 uatbI5MT8xCMteVyw7xnw1bZURkcYr1vzC7WuIqsQpo23fKMQ7ok47bJHJqSvTkvm7IF
 wmwyqyI/ZemVH1aTY7znbAnFEjkweXWiez6SEGF+eEr066qnAz93XE2TzqdIr96BCEhx
 Ku7srwC+/GYISCtcQ28hA4j7CaUEdMaqSjZ8n6lV8hY6eFOxnmNrfUM9R+uLCiP7ACv/
 sqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G759XjHotxBmkEFBsVgdOmKG6oeAu6tQI5DaentPAtE=;
 b=mneSjjq6+ggLOLzswsR03NBFQvPR6ymcKJLK7S9JqROkUtfgxObYWZC3Sh+WLPGwHW
 KTgHSE5b0uHKwpLyf3ejyXAVUR45psexq4pGkOggVJc/FPZumIvzAE1KDIPe3fyLxfi4
 sh/Z42ol200GBVKnBrneZe4IrOGVaVOdfZBZJn2lkT609FAfhRAMvdZUU9d7ZA3flOB7
 c/ysYFCGY5SqYZUAcWB80ycHed8Wnn0XPkHLpBOX163YzKqim2cjnNlwvMlVdIrvDDTh
 mgq6xebreiABH1IGC+/uw2OOjGSuoTZvtLkJz9cJ/A5Ruc4R3HJXPMNJF/WG7oBcZq/Z
 JVxA==
X-Gm-Message-State: AFqh2kpfW/LL8urSauCdxAo7kQwbsiNaoMSMcvM/daUaeTxzRLWYZH/d
 d62r2NDDTbsVd3hiS4wUh7/sig==
X-Google-Smtp-Source: AMrXdXvDTTfl0uW5AMHs9RgqxO3y3yKSgOW4o94yqwvAPtOsbtsBUWpiXC1UQSFbVgD7fzyNWlCukw==
X-Received: by 2002:a7b:cd9a:0:b0:3d3:5d69:7aa5 with SMTP id
 y26-20020a7bcd9a000000b003d35d697aa5mr10130733wmj.25.1674131732270; 
 Thu, 19 Jan 2023 04:35:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d04e4ed873sm5826487wmp.22.2023.01.19.04.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:35:31 -0800 (PST)
Message-ID: <854dadfe-e98e-bacb-2ee8-01f53ed8798d@linaro.org>
Date: Thu, 19 Jan 2023 13:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.

> Reproducers:
> 
> $ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest 
> -monitor stdio
> QEMU 7.2.50 monitor - type 'help' for more information
> (qemu) gva2gpa 0
> **
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
> should not be reached
> Bail out! 
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
> should not be reached
> Abort trap: 6
> 
>      frame #4: 0x0000000101fdd6cc 
> libglib-2.0.0.dylib`g_assertion_message_expr + 116
>      frame #5: 0x0000000100360ce0 
> qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>, 
> secstate=<unavailable>) at helper.c:2495:5
>      frame #6: 0x000000010035f7f4 
> qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>) 
> at helper.c:2514:16
>      frame #7: 0x00000001002d17ec 
> qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>, 
> addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
>      frame #8: 0x00000001003c660c 
> qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0, 
> qdict=<unavailable>) at misc.c:714:12
This problem was previously fixed by this series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html
In particular by this patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

Since all issues have been identified:
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


