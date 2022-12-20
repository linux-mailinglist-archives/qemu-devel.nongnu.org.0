Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD376528C8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:13:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7krm-0003nu-GX; Tue, 20 Dec 2022 17:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7krh-0003nF-FS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:13:37 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7krf-0007hN-CZ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:13:37 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bj12so32493314ejb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 14:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35sWt8/4t2iUKDXuQyBC93/MNEdTxM6KSY3gWPGKezY=;
 b=LjmiFNbHGrLucu2eH3n4menDSxLRFu2GqI2RtFOiylwSrZdge8PdGNtynB7+/2Xqqb
 hc8NIseq4uA8U+GxTF1lZknN4G+Gy2CMqQxL+IVip1RnVz1Oau08mPEH/Rfit7GQTUs/
 y94ATklx16/pe70eaz9fcw5Q8YUp6OY/ITPicZRVx2nH/LZD02IOW7c3k1eKOafrBccr
 /1O5CvueY+xCdemZtTC8QQo9gKfp9eD270dubGBj7IjnsjDpwvfhDU6OtOMauPOW/dHN
 TXMeaSMxpPlyMBDE8y18um9piEtdq6EFsQ4aA4uNMWHaVBAsnp+ABXcFV5XbPJQEhl9U
 igYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35sWt8/4t2iUKDXuQyBC93/MNEdTxM6KSY3gWPGKezY=;
 b=c9mQCll090QywpGAjVML8vru4zufEsY9M/7rshuG6c/6nO4Ekh5iblC51b23gKLBNN
 9ivgq0qSUCLHfz17mD5Dzo8fu2vZW2yIfD3Y+XjqYDjJvDGQPORIczYXSl0xKAJAGha9
 XseO7hpvQA7ANuJDtXzodpk+XiC5JVeBtBbg9VE1bExVlRuUXtaKLTR4VAYzfX+6SwD3
 tD1Rhyu4ifyDDCDumk67/Pa3GHkUOz5loTOcdYewOwmUstTwZjHWlSbj8shwNS9RiXl/
 +4rYjPFEKrkMKZgaoPszG9EiS/Y8PUZ8rfGU6EAKP4ww1Ij3orvKohlyu/YoCOtL1/9h
 Si8g==
X-Gm-Message-State: ANoB5pkG8Topv2xf6t0jjV0PNM2UNd+RRqMar9FSVpQiPUQmMfY5Lzzn
 8vfTWtD+dolaKyJw+sLyTvzmXA==
X-Google-Smtp-Source: AA0mqf7w+o7KWh6ECyhvZUPUOc/NfDOVhqZp5Q+PRLUIB06rzhO03m8q8RwlREJEyLkH5cT7Nv1rIQ==
X-Received: by 2002:a17:906:a852:b0:7c0:e0d8:9500 with SMTP id
 dx18-20020a170906a85200b007c0e0d89500mr38586219ejb.75.1671574413581; 
 Tue, 20 Dec 2022 14:13:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a1709061e4200b007b839689adesm6242049ejj.166.2022.12.20.14.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 14:13:33 -0800 (PST)
Message-ID: <e7450c62-5132-72d3-97d8-6bcde5e27c37@linaro.org>
Date: Tue, 20 Dec 2022 23:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PULL 00/15] ppc queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
 <CAFEAcA_52bvonP4YN1tr-W3x6rpRyJZe9jfw76yxw6SDyRzmZw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_52bvonP4YN1tr-W3x6rpRyJZe9jfw76yxw6SDyRzmZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 22:34, Peter Maydell wrote:
> On Tue, 20 Dec 2022 at 13:53, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:

> This fails 'make check'; I think the sdhci changes have
> broken the npmcm7xx-sdhci device:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3504313175
> 
> 46/106 ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read:
> assertion failed: (!memcmp(rmsg, msg, len)) ERROR
> 46/106 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test ERROR 1.67s
> killed by signal 6 SIGABRT

5218b3960738a6da041aa6f54ac4b37566311cca is the first bad commit
commit 5218b3960738a6da041aa6f54ac4b37566311cca
Author: Philippe Mathieu-Daudé <philmd@linaro.org>
Date:   Tue Nov 1 23:29:32 2022 +0100

     hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
@@ -14,2898 +14,914 @@
  sdcard_reset
  sdcard_reset
  sdhci_set_inserted card state changed: insert
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084202f value 0x1 
size 1 name 'sdhci'
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084202f value 0x1 
size 4 name 'sdhci'
  sdhci_set_inserted card state changed: insert
-sdhci_access wr8: addr[0x002f] <- 0x00000001 (1)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842030 value 0x0 
size 1 name 'sdhci'
-sdhci_access wr8: addr[0x0030] <- 0x00000000 (0)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084202c value 0x7 
size 2 name 'sdhci'
-sdhci_access wr16: addr[0x002c] <- 0x00000007 (7)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842004 value 0x0 
size 2 name 'sdhci'
-sdhci_access wr16: addr[0x0004] <- 0x00000000 (0)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842006 value 0x0 
size 2 name 'sdhci'
-sdhci_access wr16: addr[0x0006] <- 0x00000000 (0)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842008 value 0x0 
size 4 name 'sdhci'
+sdhci_access wr32: addr[0x002f] <- 0x00000001 (1)
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842030 value 0x0 
size 4 name 'sdhci'
+sdhci_access wr32: addr[0x0030] <- 0x00000000 (0)
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084202c value 0x7 
size 4 name 'sdhci'
+sdhci_access wr32: addr[0x002c] <- 0x00000007 (7)
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842004 value 0x0 
size 4 name 'sdhci'
+sdhci_access wr32: addr[0x0004] <- 0x00000000 (0)
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842006 value 0x0 
size 4 name 'sdhci'
+sdhci_access wr32: addr[0x0006] <- 0x00000000 (0)
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842008 value 0x0 
size 4 name 'sdhci'
  sdhci_access wr32: addr[0x0008] <- 0x00000000 (0)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084200c value 0x0 
size 2 name 'sdhci'
-sdhci_access wr16: addr[0x000c] <- 0x00000000 (0)
-memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084200e value 
0x3700 size 2 name 'sdhci'
+memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084200c value 0x0 
size 4 name 'sdhci'

Apparently we aren't modeling some bus translator on the NPCM7xx.

Daniel, I apologize. Could you respin without the "hw/sd/sdhci:
MMIO region is implemented in 32-bit accesses" patch?

Thanks,

Phil.

