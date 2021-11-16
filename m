Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC845314B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:51:18 +0100 (CET)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwzc-0001aN-TO
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwxv-0000VD-I6
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:49:31 -0500
Received: from [2a00:1450:4864:20::32f] (port=46030
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwxt-0002go-Cd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:49:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2158430wme.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BJrJfxnJ/KU6BBoNr7DAjB9FE/ABAsT+sDfrkNC55UU=;
 b=ncc3mm8Igng9gpasSzRW1QPIzIp//Vi3g2svmMlXc1/Goe2WE1X8p7rXturJye7yDd
 NYFIM92tvPm9qIrfAvuKQhi7ycq36wSjMVSaAwRGGuX4YEIhzWWuNYuM8waBWMuWG8up
 Qi5s/PYC1NcH84kRpi2bqOptbhwRttbqKfwVoH8EM3AknLuXr/vHB1dsvEFlgEM1PdlZ
 tULha4AZZTCpVyiJdHy7EkaQ4eG/zOQt/VcUXijrqfyMUoXYDgjA+GV4LTU6VxrvnnIa
 mpV0q5jMCIClC4TehyG+yy+YDGMQnA1ocdsC/u3hVW6w5coqjoD6hOqlAPFuA5FWqiYI
 mLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BJrJfxnJ/KU6BBoNr7DAjB9FE/ABAsT+sDfrkNC55UU=;
 b=r++l50I3fXNkj4pqWoLGM6LMFJ2A1fYJQgNTl8EZnPVDxn1irVdjjKGJc77Qpdgkj4
 1nHHrt3eygXqSQ7UqHj10NvbJTE1qjb8gzToPGF5W48qnr0uaxdLt1EvptV55P0mk3wL
 Hp7RBG8O3RuW5p1tIg/GjPxP37ViHMcb2IGHfzbzYItT5gTM7Tt1mQlOv6OCtv6+5oWk
 vL6xBh55dhaztKeoRVol2EKkhbmkH/vaMKEf/MWdLeYfsTCW8LP9n1nj6CjnZ86ARJCX
 DPU0LxscxGhOcmKpw20B//hH8Oea5NBNNMpbtWVJ5bTENhY/YWImikf+4ZzraN9ruPDE
 VLmw==
X-Gm-Message-State: AOAM530oRXQw1BU7ZZPwTXJWgbLx9GmFc7ESktyIatRjL2wO62mV5W6g
 syX/tD4zSIgTfkL1eCc5vYGAeYuD4etyowy7K2w=
X-Google-Smtp-Source: ABdhPJyuhRVKdwABmw1klU2eeUQsdWx6jdy7v6oBls66rBCsH4Oy93+SDu7Le3DWZ+4MuW2xhIdO0g==
X-Received: by 2002:a1c:19c5:: with SMTP id 188mr7227114wmz.145.1637063367015; 
 Tue, 16 Nov 2021 03:49:27 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id 9sm22453945wry.0.2021.11.16.03.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:49:26 -0800 (PST)
Subject: Re: [PULL 0/4] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211115201946.327770-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45740150-98bf-e4b0-9ffb-5ce06a42c0d4@linaro.org>
Date: Tue, 16 Nov 2021 12:49:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115201946.327770-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/15/21 9:19 PM, Peter Maydell wrote:
> Hi; some minor changes for 6.2, which I think can be classified
> as bug fixes and are OK for this point in the release cycle.
> (Wouldn't be the end of the world if they slipped to 7.0.)
> 
> -- PMM
> 
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211115-1
> 
> for you to fetch changes up to 1adf528ec3bdf62ea3b580b7ad562534a3676ff5:
> 
>    hw/rtc/pl031: Send RTC_CHANGE QMP event (2021-11-15 18:53:00 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Support multiple redistributor regions for TCG GICv3
>   * Send RTC_CHANGE QMP event from pl031
> 
> ----------------------------------------------------------------
> Eric Auger (1):
>        hw/rtc/pl031: Send RTC_CHANGE QMP event
> 
> Peter Maydell (3):
>        hw/intc/arm_gicv3: Move checking of redist-region-count to arm_gicv3_common_realize
>        hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when nb_redist_regions > 1
>        hw/intc/arm_gicv3: Support multiple redistributor regions
> 
>   include/hw/intc/arm_gicv3_common.h | 14 ++++++++--
>   hw/intc/arm_gicv3.c                | 12 +-------
>   hw/intc/arm_gicv3_common.c         | 56 ++++++++++++++++++++++++--------------
>   hw/intc/arm_gicv3_kvm.c            | 10 ++-----
>   hw/intc/arm_gicv3_redist.c         | 40 +++++++++++++++------------
>   hw/rtc/pl031.c                     | 10 ++++++-
>   hw/rtc/meson.build                 |  2 +-
>   7 files changed, 83 insertions(+), 61 deletions(-)

Applied, thanks.


r~

