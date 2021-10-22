Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62C437C61
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:59:08 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyot-00041k-CS
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdySo-00079S-Rs
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdySm-0007lD-W2
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:18 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so3567707pjb.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+qdx7TQBz0OHzu/+r/S2nWFPVbG1MWWPDrN/PubMRyc=;
 b=s7XxUUKk3t7FWtdJLbjQiFeBiTpEXNwGVCjSDdOceFxN/FvR2MzM5ht2e4BQHc4Or9
 QcON+DxRFGIIrY7QcZkLGuFmnbKn+RU9HNsT0KjAyLc38bjYHAvvC4iDHGvo6d3+z5Nt
 336DeGKUuEF802w06ds90fE1jDAbrXj+hBDUs8TdP/wRmxUwHsc33YS20NURIye7Ro/G
 PXJNXPU3tMiUUSbDeKh980ZS9skw5kUbs0B+NYI74Hrpa6+Y0VdJi5gMbOgmRdsaXV9/
 nuJzoVH8sKriCDtsNTlcFPTvYZZTzUwEJLhM1OhMAD9hVg+kdnO7WvDdCnarE+Qthi3c
 91dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+qdx7TQBz0OHzu/+r/S2nWFPVbG1MWWPDrN/PubMRyc=;
 b=kQavbEoBclAwXcraZYQN5qQLhHmdjc/W/2kkaICeBVSJkiA37IVlpUHguYluKnR9af
 7rYjBuAMWtgbCU1eGYvcQyOS2v9zr7yAfvNVLbp/4/DsRWjiUB1PNM0232jyuX/TEMtb
 VGLDihUk0UnNBD4u3kJWjuytA9cmOyi8gBLGlqDtZR1BkuW9MzhM700pTg1QgAaKxVk0
 Cna3ZtREGD0LHw9n0vuqpw56g3uTAp3ELmsmsVo9WZuOa66z/QkpG2RY6wUk71yyzyoI
 nUGKJaTAZQ0WkOCpj5oVab7J7pSbaSx6IsmyZU3qxYtd5lWp3b/eu1TAQ8cFQunuHLuf
 rNiA==
X-Gm-Message-State: AOAM531HuG2VYyK88GqK08aIiaZrCzInKP9WiIpaSvNxkOpx3GGQNdG6
 XNtrCQFFSqMvlgj3khVOKhyO7fZJOVqRYw==
X-Google-Smtp-Source: ABdhPJw41bmG+OWsBEkk0boM0wc+EALw2y2rhKgVLSGSpcZeMSHuJb3kPyWj2jV4Yaf7eeqctahyvQ==
X-Received: by 2002:a17:903:18c:b0:13f:255:9dca with SMTP id
 z12-20020a170903018c00b0013f02559dcamr1315229plg.37.1634924175172; 
 Fri, 22 Oct 2021 10:36:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u12sm3888409pfi.217.2021.10.22.10.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 10:36:14 -0700 (PDT)
Subject: Re: [PULL 0/3] aspeed queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211022075730.484692-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01b5e7fc-3310-532b-8607-5bd6867d7773@linaro.org>
Date: Fri, 22 Oct 2021 10:36:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022075730.484692-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 12:57 AM, Cédric Le Goater wrote:
> The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20211022
> 
> for you to fetch changes up to b12fa6118f4d838d19720ec6476a1666a1b43474:
> 
>    speed/sdhci: Add trace events (2021-10-22 09:52:17 +0200)
> 
> ----------------------------------------------------------------
> Aspeed patches :
> 
> * New fp5280g2-bmc board (John)
> * Small cleanup in Aspeed SMC model (Cedric)
> 
> ----------------------------------------------------------------
> Cédric Le Goater (2):
>        aspeed/smc: Use a container for the flash mmio address space
>        speed/sdhci: Add trace events
> 
> John Wang (1):
>        aspeed: Add support for the fp5280g2-bmc board
> 
>   include/hw/ssi/aspeed_smc.h |  2 +-
>   hw/arm/aspeed.c             | 74 +++++++++++++++++++++++++++++++++++++++++++++
>   hw/sd/aspeed_sdhci.c        |  5 +++
>   hw/ssi/aspeed_smc.c         | 11 ++++---
>   hw/sd/trace-events          |  4 +++
>   5 files changed, 91 insertions(+), 5 deletions(-)

Applied, thanks.

r~


