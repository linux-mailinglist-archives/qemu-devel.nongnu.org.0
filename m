Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0C407E89
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:19:26 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSCT-00029s-G0
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSAq-0000bJ-Ok
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:17:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSAm-0008Ec-Mr
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:17:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso4876654pjh.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDwdKSztzvw/mJ8+cfh141ZmqmdeC+LdcUu1PpiqVcI=;
 b=IJ2ihAS26j9XEvUoJMMnLOloKNHoy3d9X7WSzHwCX+IBXTIHsN0XCIVW1bl3bgmeVX
 FD3NaQzoR3bwps82a29LVkbxT0DeZHzp/TnHMuDyB/dw2SIatqlNIAqtcUdI97PFmKw1
 eIw/LVWRPhw/qmMrA57BPd4wd/xZ9wmuKBsWxpr4xUr+fmaqaUBSohjAu7IR0iuqrs5e
 wITweySkvQ9XlaDkV7Pjl0hHCgEXCJ+TOS8f2oBZUHsWhSlDnxANG5ByvzNn7ZPDzuR+
 Be7mhYppd4oYs2YDYvWMHKRgFU7f8fKt84R+HDU3CJ0dDStZU7+E5C20izyKIEVq8OPU
 n4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDwdKSztzvw/mJ8+cfh141ZmqmdeC+LdcUu1PpiqVcI=;
 b=KvYFDq+LxxvAC5MemM34uMtnrA6Opt3JOiBJOncCoYThd0ypnBhNvCMg7JXytyhUB3
 P0prKGB6RdOvhRk/amlWToy0317TZYuOx+q/qAEenz3E7VfhAI612TWOjKHARjJOddc/
 VWnP7Dkvr7luh/6aaSsOR09BfIa8LLsV5W5eUGsBvrWrTZUh74WR+HcatalMuyZQML4Q
 v6JwgzgAEIjX/16stYtf5Y51jKHTDOLt+4yza90Ctad4A8rj5BtpxOynwAqArDhz9F9y
 v3L5uZhtagw/pkZ0vsRgds7Wkp9JteBcHbZHUwBfuBsJC8qVQPZwreF0j86BoM1Fab5m
 vMVw==
X-Gm-Message-State: AOAM532jPtEj3FM0y7kQO0pRquVq/RxP97EhJeThwVeinw2ii4w+IOCN
 Wy6kI2ze7PHF85E59+kyXMf8Xw==
X-Google-Smtp-Source: ABdhPJxqMZpIFIBwxudPIL4OwaV05N6T6uWs+3I1Le4EWxZ6nvDV/kDc4vpU2OlH55eQfgN2SBqRfA==
X-Received: by 2002:a17:90a:3e08:: with SMTP id
 j8mr8219888pjc.208.1631463459059; 
 Sun, 12 Sep 2021 09:17:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y1sm5094657pga.50.2021.09.12.09.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:17:38 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] linux-user: Split loader-related prototypes into
 loader.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48a2bf95-3ed6-daef-c0cb-bdc7b90ccacb@linaro.org>
Date: Sun, 12 Sep 2021 09:17:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> Split guest-binary loader prototypes out into a new header
> loader.h which we include only where required.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/loader.h    | 59 ++++++++++++++++++++++++++++++++++++++++++
>   linux-user/qemu.h      | 40 ----------------------------
>   linux-user/elfload.c   |  1 +
>   linux-user/flatload.c  |  1 +
>   linux-user/linuxload.c |  1 +
>   linux-user/main.c      |  1 +
>   linux-user/signal.c    |  1 +
>   linux-user/syscall.c   |  1 +
>   8 files changed, 65 insertions(+), 40 deletions(-)
>   create mode 100644 linux-user/loader.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

