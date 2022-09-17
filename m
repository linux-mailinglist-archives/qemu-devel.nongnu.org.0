Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D497C5BB715
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:10:23 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSu6-0005eP-UA
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZSmq-0000Pv-Tt
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:02:54 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZSmp-0000c5-5a
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:02:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id u9so54142400ejy.5
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=auufz+HQWEDWo2clPZpU7XkRaxfycBmugEzMp36Y96w=;
 b=UDexe7s+xOENFTpHddGqD2AjvpRpLboK5nDoAShvWphTD7d2fHzv8tVv8BmUiMTS4p
 j4s1K/WrU26MpdpapgGK34ENJxdESCQFaJIJAsWY51cCeOmYVxCIPpAIX8o3e3HVqKRJ
 gUH2l7NZDg7LYddxBgTkL7MbZW7LIVv7irCMY9ikbHatvnmV/OpEokp/Afqi1v12Opdt
 dIqvCWI4JgHC6nN8rPKhEP6/JBdzb6ljcgupp0C4zeGvtGme1vpYiruJHc+PL1ZV/s1W
 Ii2ZB/icprPHkm/RvbjDW1UkRZH1mmoyBd3WpfOgeydY3BThvNiWI5uX1XRVZFSi1zxJ
 dTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=auufz+HQWEDWo2clPZpU7XkRaxfycBmugEzMp36Y96w=;
 b=szaSnd7h7rW7QMlCWQc1fslktPQZpxgkupqEjHofSGAnPCkarFHlEIBrRK3wuT4R1X
 fNHaItrpCenxaVXpTTfxUxjw0qXMl++f2k/qRwE4ZrBuiicY2AzNdx6TMc3Z5SSxTvsg
 jMiscZLiyym8AiLuK29OOvVavhzpcOnv9M5kth/01d9BjfAs90/MPbVa2mxh427lcANk
 TyPWSbKbHks9PMRWBVjf62uqmTMlprdgpbb2wJCHAft9qW6btywCEH7Di+Hyz+XBXoA5
 KFpo8H4cLdqdHlrwVEbj0RnOYwHWXQJxiP616j3Y5XXGQGQ9+9/UhBu42rOlXZ1TCT0K
 ICLA==
X-Gm-Message-State: ACrzQf3gTWbmAVsQoTjsoOCgvJdvsMarg7eAf8cLy4G1QFRwKOi458H4
 jxy5TakMB2ZlufOHVZJOv6UzSA==
X-Google-Smtp-Source: AMsMyM5iYDm9c3DURpfTyxlVfDyqmKDTmopubae7yqvKCanTHjwkLSir12ZABXqduR1AdHoRcM1Olw==
X-Received: by 2002:a17:906:6a07:b0:77d:f99c:5ab8 with SMTP id
 qw7-20020a1709066a0700b0077df99c5ab8mr6063702ejc.544.1663401768435; 
 Sat, 17 Sep 2022 01:02:48 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090631c400b0073d6093ac93sm12087704ejf.16.2022.09.17.01.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 01:02:47 -0700 (PDT)
Message-ID: <0a809729-26ad-5d71-b849-cf008ece4a87@linaro.org>
Date: Sat, 17 Sep 2022 10:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org
References: <mhng-5d39306a-7bd0-493f-8364-5ae9e921ec97@palmer-ri-x1c9>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <mhng-5d39306a-7bd0-493f-8364-5ae9e921ec97@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/22 14:52, Palmer Dabbelt wrote:
>> Though, honestly, I've had patches to add the required barriers sitting around for the
>> last few releases, to better support things like x86 on aarch64.  I should just finish
>> that up.
> 
> I can just do that for the RISC-V TSO support?  Like the cover letter says that was my 
> first thought, it's only when I found the comment saying not to do it that I went this way.

My patches inject the barriers automatically by the tcg optimizer, rather than by hand, 
which is what the comment was trying to discourage.  Last version was

https://lore.kernel.org/qemu-devel/20210316220735.2048137-1-richard.henderson@linaro.org/


r~

