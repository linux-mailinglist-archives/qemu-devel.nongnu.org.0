Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC18638BDD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZOZ-0002er-RB; Fri, 25 Nov 2022 09:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyZOS-0002ar-VC
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyZOI-0001MM-H5
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id n3so6946396wrp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1vjEImn7YRgoKYsdL4hflF8VmfVA9LtNLf3Z/lLxARM=;
 b=FjZqw3WIRI4+MyVS1PN5LBz79kOCr3V3hLvYx/RW/wUMUA+Jrzgc+pH29PrkrvqJj7
 5F6yr0HXVtnBnLVUre7OmySa5CeWQyRL8VaO7ANhNDmnAvoLeRmmjtsliVkwDIIvnbEU
 8v1Vwwdiicd++fh8Y5PLFmY745ocN8x4uWIO4ybYeYvhojJ61ErXyZMuCnRcWAhsW3A+
 KcMFVaOX4Gl9kUyLIi0gpJxWWay7J235Q6TJQCsFDa3Xp6/5kyNFH5q52qyIhcPh9fB5
 +95EAFCEHl6fViC4MZ+gqkjj/vaBj2p0tAqqqHI16H2V1MImbObY1Uyw1tilQzBpjMon
 PKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vjEImn7YRgoKYsdL4hflF8VmfVA9LtNLf3Z/lLxARM=;
 b=HIoBpiD9HpBloR2oNZbt+4Wg2/24M4Sk7wHc2wmRvKSSDB9mp3ibaNASmhy8g+WPO4
 to109IOt02Hp5Wl4UYFqTW20cksR0Jl/Xklcy09MilmqaGwclr7rFZu2T5yHm0Bl3LVS
 jy43Ugs5nw7OnafLUHzQDVRe2SA0+J4ekEiVbQP6v40v1jaEVcM05KSaQ7gTVuIA+Znx
 j8RwpMuP8XWkjD2/msSUhqTVjcknvJs1f6k8j8I0fJhHU3V1pJIrtdSuVR/Qxx7qT31m
 B58RbDdqG4s2111jC/Vi0NSk+OynAWyz4ZS+0yCc+U3TkQW7GHsDbID4AfL9g2uuQOZc
 hbKw==
X-Gm-Message-State: ANoB5pmctuZWffFO68QKPCHqeZj69IGg01z13SIrWNprKME4OAqy7vbE
 ecHZA/X+vVV5wMMQ3QZbQ8HLRQ==
X-Google-Smtp-Source: AA0mqf7ezk7fnI/V1hK/Rq0CXVGBdQzwJZbKRX1Wt094HQFfWUsHayoX/bEp8qLVBAs1qIztJ4mPwA==
X-Received: by 2002:a05:6000:1b8a:b0:241:e737:2d7c with SMTP id
 r10-20020a0560001b8a00b00241e7372d7cmr9911801wru.523.1669385355653; 
 Fri, 25 Nov 2022 06:09:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adfd4d0000000b00238df11940fsm3826892wrk.16.2022.11.25.06.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 06:08:45 -0800 (PST)
Message-ID: <67add016-b743-1728-d1fb-e0502609b6db@linaro.org>
Date: Fri, 25 Nov 2022 15:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] e1000e: Remove pending interrupt flags
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20221125140242.56158-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125140242.56158-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 25/11/22 15:02, Akihiko Odaki wrote:
> They are duplicate of running throttling timer flags and incomplete as
> the flags are not cleared when the interrupts are fired or the device is
> reset.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.h |  2 --
>   hw/net/e1000e.c      |  3 ---
>   hw/net/e1000e_core.c | 19 +++----------------
>   hw/net/trace-events  |  2 --
>   4 files changed, 3 insertions(+), 23 deletions(-)

> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index 7523e9f5d2..459b12407a 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -630,12 +630,9 @@ static const VMStateDescription e1000e_vmstate = {
>           VMSTATE_E1000E_INTR_DELAY_TIMER(core.tidv, E1000EState),
>   
>           VMSTATE_E1000E_INTR_DELAY_TIMER(core.itr, E1000EState),
> -        VMSTATE_BOOL(core.itr_intr_pending, E1000EState),
>   
>           VMSTATE_E1000E_INTR_DELAY_TIMER_ARRAY(core.eitr, E1000EState,
>                                                 E1000E_MSIX_VEC_NUM),
> -        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
> -                           E1000E_MSIX_VEC_NUM),
>   
>           VMSTATE_UINT32(core.itr_guest_value, E1000EState),
>           VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,

IIUC any changes to the VMState imply changing its version:
https://www.qemu.org/docs/master/devel/migration.html#versions

