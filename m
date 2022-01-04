Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5AF48480D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:47:58 +0100 (CET)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oqi-0006dD-QL
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:47:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4olo-0004ir-Iy
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:42:52 -0500
Received: from [2607:f8b0:4864:20::532] (port=39678
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4olm-0007nY-Ic
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:42:52 -0500
Received: by mail-pg1-x532.google.com with SMTP id r5so33465367pgi.6
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ot6Nx2cVYV/W0iISRCylRh2b8aJnq7ZsC7/tBrFNoX4=;
 b=OsAodV5VccMsOFhyTchQQTmsS0ApdHdW6Q5H/s8z4v9HDBrZrxz4FEHq7Mg6t9BArb
 f0dZ4tML8WvCjR9V1qQu1jmOd2HT0rN1L6ClaCRIpTtieKrTU/7m1vb+ZLX5DD7G4oI2
 NTfrCyEM4izCY3w/4P5jTl8TMWFRs3UauuxtAJv9T8SwKlasvCgbxsgrAG6sq/nH26fX
 fRYvuwMMLACDGPRd26BGYE0B1ecGge33dHwDaK8DWg+Z4MMi62T5QND9zHJ2xjQFWu9d
 ChY+S58SJ8fZ6cISFu4BpkfTTto4a83BQresHekp912OxINI1zU4wVMNpPye9tiHxuSs
 8RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ot6Nx2cVYV/W0iISRCylRh2b8aJnq7ZsC7/tBrFNoX4=;
 b=T4upoyA83ZdNYBtqoTrZ8cJ3t2FOGVKH1LE/Cso3O2MCzfo9+xXmRhk3S/gqxW9mTL
 DGr81AFm6lq9bOAe4Iy03+vB89HhIYygv6h7AjC9O8tqYUDyXblyygaNUD3og4pJRSK7
 sCnNZmpThDqeVMoejUqCgvRllu2iClBfaVhPfRvcBr1wJcZwI7s91hJOH1xBbV/2/OzQ
 WHA6hI0acGVpCFcmqvmh/P6ux59StJaRc4tD/38ZCfVQvyvcgp75N4mxmGWqEC41s3+n
 Ce17KRYD2sLJq71XsrPJGDrd4EGOU0w24vxkM50j2ENW1cCLHCgZbwcJqpk3W5+mz1qu
 0p2A==
X-Gm-Message-State: AOAM533I11CDexOVS7iZIJRuyXqMuFO/yyL4xF0QjY+nuwhKzrxMum7B
 3rcxaIftphHVlq1Em8vqbnbCMg==
X-Google-Smtp-Source: ABdhPJwljpx6mjf9hYgpUi7lY291R2d3FsOrHjzvpi1wp6UMEhZ3wwMhnGABWPd4dQb+P2bpfLkvAA==
X-Received: by 2002:a05:6a00:2189:b0:4bc:3def:b662 with SMTP id
 h9-20020a056a00218900b004bc3defb662mr27578775pfi.5.1641321769283; 
 Tue, 04 Jan 2022 10:42:49 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id o11sm43683217pfu.150.2022.01.04.10.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:42:49 -0800 (PST)
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-04
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104075412.2088859-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f7366dc-59c6-e0e7-d9b1-33523ed6d87b@linaro.org>
Date: Tue, 4 Jan 2022 10:42:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104075412.2088859-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 11:54 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:
> 
>    Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/sdmmc-20220104
> 
> for you to fetch changes up to d666c7b529c503381a714b97d2e174848b5aad8d:
> 
>    hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:27 +0100)
> 
> ----------------------------------------------------------------
> SD/MMC patches queue
> 
> - Add SDHC support for SD card SPI-mode (Frank Chang)
> 
> ----------------------------------------------------------------
> 
> Frank Chang (1):
>    hw/sd: Add SDHC support for SD card SPI-mode
> 
> Philippe Mathieu-Daudé (1):
>    hw/sd/sdcard: Rename Write Protect Group variables
> 
>   hw/sd/sd.c | 48 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 29 insertions(+), 19 deletions(-)
> 

Lots of failures of the form

../hw/sd/sd.c:842:33: error: 'SDState' {aka 'struct SDState'} has no member named 
'wp_groups'; did you mean 'wp_group_bits'?
   842 |         if (test_bit(wpnum, sd->wp_groups)) {
       |                                 ^~~~~~~~~
       |                                 wp_group_bits


r~

