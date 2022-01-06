Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1224864AB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 13:58:23 +0100 (CET)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SLV-0005tZ-RM
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 07:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5SCF-0005ph-6a; Thu, 06 Jan 2022 07:48:47 -0500
Received: from [2a00:1450:4864:20::42d] (port=37483
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5SCD-0007ET-HN; Thu, 06 Jan 2022 07:48:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t26so4564708wrb.4;
 Thu, 06 Jan 2022 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nQRhi6uY4FjUecCyfvd5i7+Dy+gYl7NZ33tT32kA3f0=;
 b=NxkSo4SJM1JRFQryDqfL41wj5PiyLWTEqxwAv8BN/0duODWmwJ9dN/WB2CWp+nBoe6
 +zF+WZpVzuVhy1tzKR7Du1bD/r3Dc5V6O0HsWz9KcN24AQzyCHrnJTCyvBryLz8jq9Tu
 /kI4sxIPDa/5oK2zMcQbtV69XaXbjLxHhMyeKnT6qkVbB+2p7s5wfM+5NU4iKxctZ+bI
 dw36EJH0s4IbgndAc6+P5X6Ht/XQLaC8oHI5UaVO2lhynCwv3jo6JMVKxJrAHGE5+XI8
 iakEzTnlge7e9aFb5tXDJn0ko7j3QUuBhV4vpsulSfXSjwlF6yWXXcWM3C1mXQsPz0d/
 tM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nQRhi6uY4FjUecCyfvd5i7+Dy+gYl7NZ33tT32kA3f0=;
 b=VuzjT/rr7NUCyzfgsIl6EozfjZJtZMJKdsr1xLqJzPVGSApPNpwaFCX8D62cjv3UhS
 y55Sj3D0Gy+FtcG0UGUCmUvzCboNz3zQ9LCmmVjkOE9+DdqZRXOKSDW6neo0FR7YmyyK
 iawyH7qQywNX7eH3Q5kM8glEloFbKis99sEO/bv8PJmh1Fcn+EeqX7RfFQpa34EfAaMy
 xTuqFs0RHhJJJjVE4QFnlmcdGZ6uCsCG8R74KWhrkOTtJUAjJ3kC9ka0CCrBejVyDzI5
 FlzzhLAT6clBZVLuhbGwxq+NlkEhyRNK6K0jOwWyoTvv95//iNXRs9+yolngTCERNtjL
 +sDg==
X-Gm-Message-State: AOAM532XPEOr1uo/RxDinzPMU7KxJgs58occ7sYkbOXocib9GWKQ1NKs
 1HQJqjTF4nfUV6UancYNJv4=
X-Google-Smtp-Source: ABdhPJzeUQO1fMuUlSSG0NsDS3OD4XIzCFvZkFBliGH+x/zGJDnHejpzsC1HRxzSKEfZkVNrCKHpOA==
X-Received: by 2002:a5d:5849:: with SMTP id i9mr49847642wrf.148.1641473323206; 
 Thu, 06 Jan 2022 04:48:43 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id j39sm1783740wms.0.2022.01.06.04.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 04:48:42 -0800 (PST)
Message-ID: <e5738c98-0915-1e17-d7a8-5fb22ec11ec1@amsat.org>
Date: Thu, 6 Jan 2022 13:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PULL 0/2] SD/MMC patches for 2022-01-04
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104075412.2088859-1-f4bug@amsat.org>
 <8f7366dc-59c6-e0e7-d9b1-33523ed6d87b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8f7366dc-59c6-e0e7-d9b1-33523ed6d87b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 19:42, Richard Henderson wrote:
> On 1/3/22 11:54 PM, Philippe Mathieu-Daudé wrote:
>> The following changes since commit 
>> b5a3d8bc9146ba22a25116cb748c97341bf99737:
>>
>>    Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu 
>> into staging (2022-01-03 09:34:41 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/sdmmc-20220104
>>
>> for you to fetch changes up to d666c7b529c503381a714b97d2e174848b5aad8d:
>>
>>    hw/sd: Add SDHC support for SD card SPI-mode (2022-01-04 08:50:27 
>> +0100)
>>
>> ----------------------------------------------------------------
>> SD/MMC patches queue
>>
>> - Add SDHC support for SD card SPI-mode (Frank Chang)
>>
>> ----------------------------------------------------------------
>>
>> Frank Chang (1):
>>    hw/sd: Add SDHC support for SD card SPI-mode
>>
>> Philippe Mathieu-Daudé (1):
>>    hw/sd/sdcard: Rename Write Protect Group variables
>>
>>   hw/sd/sd.c | 48 +++++++++++++++++++++++++++++-------------------
>>   1 file changed, 29 insertions(+), 19 deletions(-)
>>
> 
> Lots of failures of the form
> 
> ../hw/sd/sd.c:842:33: error: 'SDState' {aka 'struct SDState'} has no 
> member named 'wp_groups'; did you mean 'wp_group_bits'?
>    842 |         if (test_bit(wpnum, sd->wp_groups)) {
>        |                                 ^~~~~~~~~
>        |                                 wp_group_bits
> 

I am really sorry for having wasted your time this way... I was in the
middle of migrating my workstation and posted the non-rebased branch :(

I'll take extra care this doesn't happen again.

Regards,

Phil.

