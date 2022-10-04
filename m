Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A405F43C2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 14:59:03 +0200 (CEST)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhVn-0006Gp-1f
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 08:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ofhGy-0005SZ-2G; Tue, 04 Oct 2022 08:43:44 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ofhGw-0007JT-7O; Tue, 04 Oct 2022 08:43:43 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id 63so14480363vse.2;
 Tue, 04 Oct 2022 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=O84cBZmZfCzcJTwVOjasDjaUS+ZFthw0UZhObuIqO1g=;
 b=MxgfihQZWKB2v2ZQaSfSy3iQxKhyqHNs0DOVqq7PtPqmcC9zSC0/ewvznxw7Ochm53
 j3bES9UJScmU8lHsj2AKGzoCicadf/Qot8m/UvOL9+L2CYdhm1AoTeYzGr2apTVKXn9z
 Y5J51MCKT3yyQI6d1HbPCU+L0A+tTJ1llTaJDVDYig1V7ynC/k5paeQeJr2nHAm9l2IL
 2Lh8+PdSm4jtLxNTAfIjnsOhNec+EL7/GmbZtpuNRtyqWNXBYxapWTDTvzqBTAhVXbO/
 /rT+0JNx/zeDN/zUZKn4A66fH5xNcA/xBfTvTeilGrZSrj7GQnvVvXURkWrm98Lnnxyp
 97Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=O84cBZmZfCzcJTwVOjasDjaUS+ZFthw0UZhObuIqO1g=;
 b=eIBen+pIeoCr5bxaS1f1c08SHCLuNZum4HGLya8+AAyX8lts8lUxqiOJJFBBbw+ttK
 zStLVBhZwtZ1ykjb87Wj6JjHlUBZlB3fXDRRUjY5TVYwZeaZt1duOLnprDxdEWIKujbe
 gBbWuxKs5BEIlDJ8vuR+pl7Pk2dpM3XI4MrAoG8ebd42hR7PhYt0vPPQm1IK2ozqhTmz
 eNxUKHlaLAXE1WB0KvgieD4ellBhnY3tNPzdZxwzkvzD+b0TMfBZ0fwXmnHEpCCHgSDK
 75pHOwL1Tt31kva9LMSMTpLAKTVMroJANKzJvyxKVC+uE+3OEcCLEW57d3+f0HjLBs1I
 3bfA==
X-Gm-Message-State: ACrzQf09XvjTqs1y8dn/7Fg6l9qYzrx7dcxO59UZlat7DDAO+K9dxrQ6
 Pt0hmxflB7MJxRFFPEUZNK4=
X-Google-Smtp-Source: AMsMyM6AeXtKEr6vXI/vsByg/6oYq2KpYBN559U5sTvOuBeWhxgKcR2+ZedLBgqZh0O5N+99Cy6Tvg==
X-Received: by 2002:a67:ecd2:0:b0:3a6:c6f0:a493 with SMTP id
 i18-20020a67ecd2000000b003a6c6f0a493mr554961vsp.64.1664887419913; 
 Tue, 04 Oct 2022 05:43:39 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.97.158])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a1f2a0d000000b003aa4b3660a9sm3951025vkq.4.2022.10.04.05.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 05:43:38 -0700 (PDT)
Message-ID: <ba62aabc-0023-c5e6-d156-67d027bb6ff3@gmail.com>
Date: Tue, 4 Oct 2022 09:43:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 00/13] ppc/e500: Add support for two types of flash,
 cleanup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.449,
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

Hey,

On 10/3/22 18:27, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 3/10/22 22:31, Bernhard Beschow wrote:
>> Cover letter:
>> ~~~~~~~~~~~~~
>>
>> This series adds support for -pflash and direct SD card access to the
>> PPC e500 boards. The idea is to increase compatibility with "real" firmware
>> images where only the bare minimum of drivers is compiled in.
> 
>> Bernhard Beschow (13):
>>    hw/ppc/meson: Allow e500 boards to be enabled separately
>>    hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx
>>    docs/system/ppc/ppce500: Add heading for networking chapter
>>    hw/ppc/e500: Reduce usage of sysbus API
>>    hw/ppc/mpc8544ds: Rename wrongly named method
>>    hw/ppc/mpc8544ds: Add platform bus
>>    hw/ppc/e500: Remove if statement which is now always true
> 
> This first part is mostly reviewed and can already go via your
> ppc-next queue.

We're missing an ACK in patch 6/13:

hw/ppc/mpc8544ds: Add platform bus

I'll need some time to understand what's been doing there to provide my own
R-b. Or you can toss a R-b there :D


Thanks,


Daniel



> 
>>    hw/block/pflash_cfi01: Error out if device length isn't a power of two
>>    hw/ppc/e500: Implement pflash handling
>>    hw/sd/sdhci-internal: Unexport ESDHC defines
>>    hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>>    hw/sd/sdhci: Implement Freescale eSDHC device model
>>    hw/ppc/e500: Add Freescale eSDHC to e500 boards
> 
> This second part still need work. I can take it via the sdmmc-next
> queue.
> 
> Regards,
> 
> Phil.

