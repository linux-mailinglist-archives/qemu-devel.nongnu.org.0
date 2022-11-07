Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785D6203B1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBRC-0006Oy-L5; Mon, 07 Nov 2022 18:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBR2-0006J2-BW
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:21:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBQx-0000HZ-5J
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:21:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id j15so18432325wrq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IbTPmPNRvwS+hGcW/QJ6k3V6kwWSlEup8mGgIRaG5RA=;
 b=GuVd9/81rSQc1c1cUcVeDkNnDnJH6rgFyzutzGVEFyhQ+XFXSSwazLGU6PCzTgAWfF
 s1kopgkx8e21vagd6Ihrf6cUAwXI201GFISKMG5QQBGcipBDKbWiDi/LJ77OeJq5uNQv
 JHmnMCXLAiydiDefY6f6iRnU/3JaVfOQ7BUyxojdds32q1nDSXZ769eZpwxEtWbHKtNA
 HzUvT5IS1UnQ2nRiLyAWlj7ni4OCG84UHgEqKk4JcWlPaal8Srm0T60wJDLC0k4xVKKt
 IaH8bb49igBtjq2jKNjYkN02cPMOEAe3kfqz8eNlPR62IbrxTQKIG6T/0Mr3FhVyl1H9
 nOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbTPmPNRvwS+hGcW/QJ6k3V6kwWSlEup8mGgIRaG5RA=;
 b=OUIITMtKpVn1ycI0XzTNSN7Gl6RID/UYCyO9CZ5c1hYf0cJFTtCgLfollzEPBEOogH
 sC92q86Svg/NarN7uM6PAGIUKBcGilsVPHu6ONrBbrqIUXwyXiqCvr1MyV3ju19dEDzk
 B6zPIecXtz1jHv61BpzxG8qT1/h0oWPGMmsEtPitiHcnFruvREJzzQn9Tp9GUZTrrw+w
 HdstK2qH0MI4B74/BsYToHM3JPzVpiY232VNJRXvNkkbV/zw4PvJ78i0so+9wYqkN+Hk
 jcmyDbJH8cphoOJKiMCzAWflmEI72uw/NNodLP7z4Uj4XObENWLBVRQLtn20y6oFqblT
 u7fg==
X-Gm-Message-State: ACrzQf0kvLidphOucinpERljEENtlszKrgS4lvA9y+oj33Gctn1BQRoT
 WenYsc7yRWyzxHMvAOHZ2IbrFw==
X-Google-Smtp-Source: AMsMyM7TKVXeDtUXjB0wQlMuZHW+nw4sYN5whH/eA5wzM7zi8l0CU/YyxgZxT7oasfrzSTfpZCDJXg==
X-Received: by 2002:a5d:5257:0:b0:236:8a38:4e08 with SMTP id
 k23-20020a5d5257000000b002368a384e08mr32902237wrc.118.1667863295646; 
 Mon, 07 Nov 2022 15:21:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0022e3538d305sm10114584wri.117.2022.11.07.15.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:21:35 -0800 (PST)
Message-ID: <f7bdfadc-d1c6-be43-d898-4f3c381b1d64@linaro.org>
Date: Tue, 8 Nov 2022 00:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 0/3] MIPS system emulation miscellaneous fixes
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 31/10/22 14:25, Jiaxun Yang wrote:
> Hi all,
> 
> I was trying to build a MIPS VirtIO board[1] for QEMU that is able
> to work with all processors we support.
> 
> When I was bring up varoius CPUs on that board I noticed some issues
> with the system emulation code that I'm fixing in this series.
> 
> Thanks.
> 
> - Jiaxun
> [1]: https://gitlab.com/FlyGoat/qemu/-/tree/mips-virt
> 
> v2: Address review comments
> 
> Jiaxun Yang (3):
>    target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
>    target/mips: Cast offset field of Octeon BBIT to int16_t
>    target/mips: Disable DSP ASE for Octeon68XX

Queued to mips-fixes, thanks.

