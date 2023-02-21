Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C169DF07
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQyz-0008V7-00; Tue, 21 Feb 2023 06:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQyv-0008SV-GH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:38:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQyt-0007hQ-VS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:38:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so2848190wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwascBkMHH3kGWQhH+ps8nqxtQscUT5IKDX2knEM3bE=;
 b=XjHJQdLIkKxVPF9SN70eUtP/qu6pgps3tY15NC3P0dS80MUfej99K6GHRSyb+8/lm0
 2lBl5zRFozudIbqo5jF7jBObYYtjZTK4Y2QrApWIR0PifFw1Zc/OC84WEAa5XAMXT1KF
 e/kpZxvKnkvR8qFrkwsTd2/4DORV7+0jeiN+EW+t3jh7HVRTxZXbGUz3eW0fIn7M0tSI
 PoMAwRt7N+d9DhjvYbB9dvHGX3fbAKBn/Aihte2SX+h3Kb0n2NBjlZ0MVr0fsRTrBNqv
 CUuS6zeh47kkCCanS8a+aPt2SOEkI7F8B8JHqjLDWqP6rPdOdZfxCvUutlXiML4nOtw5
 Ntew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwascBkMHH3kGWQhH+ps8nqxtQscUT5IKDX2knEM3bE=;
 b=WB6AHGgZ/RENGdTtSnsf2Nmnmca0OqvIAp9cscZNbBf9KHd1M66+cRCwHWoNX2QK57
 HjpbBIS2JDTV88XI+qg/FX1noZF/lh/IO0mNeHfgT0wExP7MVFG/kw6y6KKn6JSO5xd/
 W7FtQdGOY/PEjiWwxoLb+Dk/ZxKZ6xkaJpll8iXjW9daHx2/a2iUf6B7AVlnxKYDAZeB
 0/xjhCAp6hdsRBO/EOJPeHV/Ddalg4GshrQgbjC0kHOTeS+gVxJh9UMI6iOe0paDhbaT
 1W1UeX4BihkbbQVCXEh4lovAyFd7en+u9QXIHJ7950ndcstqY34ilW+aEN120ur9uiHk
 qM+w==
X-Gm-Message-State: AO0yUKXm/GI2fpbJCzjWQgKn9Lsw+Yc10KGHDkW09mENO3Lq6rdg1U+e
 1NSb6TqrbEBJw/Z1em8S/1F0Gw==
X-Google-Smtp-Source: AK7set+oEz+0ZqpDN5AhuQgKmIkCEo/eAgBAfzHXX02a7+nN4eULLy0dwfSWSWhlHQ12JFd4FpgN4A==
X-Received: by 2002:a05:600c:907:b0:3dc:573c:6601 with SMTP id
 m7-20020a05600c090700b003dc573c6601mr3256996wmp.36.1676979526110; 
 Tue, 21 Feb 2023 03:38:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r5-20020a1c2b05000000b003ddf2865aeasm4544557wmr.41.2023.02.21.03.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:38:45 -0800 (PST)
Message-ID: <0caee59e-2459-3cc8-1b31-39c54a2a59ed@linaro.org>
Date: Tue, 21 Feb 2023 12:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
 <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
 <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 11:50, Richard Henderson wrote:
> On 2/21/23 00:42, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 11:01, Richard Henderson wrote:
>>> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>>>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>>>> they could be shared.
>>>
>>> They are not.  ARM has Secure EL0, or secure user mode.
>>
>> Oh, I misunderstood this field with user-emulation then (I tried
>> commenting it and my TCG/HVF build succeeded).
>>
> 
> target/arm/ptw.c:2853:    result->f.attrs.user = regime_is_user(env, 
> mmu_idx);
> 
> So... it shouldn't have built?

Eh correct... I guess I wasn't sitting in a directory with ARM target
selected when I tried that 🤦

../../hw/misc/armv7m_ras.c:19:15: error: no member named 'user' in 
'struct MemTxAttrs'
     if (attrs.user) {
         ~~~~~ ^



