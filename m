Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D23232DB42
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:39:32 +0100 (CET)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHukt-00044S-2e
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuaI-0004EG-7C; Thu, 04 Mar 2021 15:28:38 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuaE-0001zh-KP; Thu, 04 Mar 2021 15:28:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so29098136wry.2;
 Thu, 04 Mar 2021 12:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lFimeZLHMurbSfvOsDD2cBbK0HMsSrqkwP6mxLyV41o=;
 b=lMrl5ICjaV1XfrIhUMV3kSzo+qobGbpJIBQFDGtznc9TTfMZVrhHwnr9vgLJYVh7vD
 +Q4/xxgO0pJ/6QSqlVCQMcgW9rTECDsY8E9YVIrBlH4uBI8KOe4km2GEwfMz0FivvVj5
 uqUOTJ01XKWcnT0EntDaoJOvy1S6XN8kuQ//jANHkhC1613vkW+/5QD28Nl5bFXOkCWb
 GOIqIQ+gwgeeqz5iOvz+mSFDrBGYwwcxLCrI1Qy6n8kEHOlADci3brO+5Jv2xY2Wb9HP
 Dfs9aXFVKixwWjorgmCJNH9qyRE1jmpSd349BI55rTXlaQ0teZMMwye7qPSi/nV8rR46
 vM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFimeZLHMurbSfvOsDD2cBbK0HMsSrqkwP6mxLyV41o=;
 b=JkebaH/mXIeFZCqYtpVzXhVoALS93GX5KilUA6Fi/z9/+CRHlN+SXglUdLzl68KJ5e
 j0KsOaiqNqun4OhQmHMRjnLirXM/K631GZzO9MZUBhlxIrxEs8LL810pGBrNbjyrtUUL
 G2GHZsCCvUfGAzXOJzy2KFoXmGq6r/wsEWCxQNGLosmxdmbV0yRzY99wOYkeEx9GsWJh
 eoS6yHI8pOc14nbLKWBYpX7RsVgTCUbkBjYZWJ5JlyuY600sinHuYkCeA2FdvN1Is4K6
 GLi4nMosccra5yJ/VDVYIE+dfF1fYtv+fgUaHB7SmzD3YOW8ZijVlF9Q10tmbBpw5foc
 nHHA==
X-Gm-Message-State: AOAM532HYffOHB1+vzE0T2gePC9uHRQp4r45Gu3sLW9b9X/xl9tF0hUA
 auelKR3zWr6ItpSTH+QfX2+4WKVT330=
X-Google-Smtp-Source: ABdhPJwHDh+b+LEXxJGZJHDUZdiMX2337D+XgyfmlPcQG2phr/QI8V2Lbr1rETCdqidIyCCCBBQB1g==
X-Received: by 2002:adf:e582:: with SMTP id l2mr5856280wrm.207.1614889706628; 
 Thu, 04 Mar 2021 12:28:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j4sm743632wmo.10.2021.03.04.12.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:28:26 -0800 (PST)
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <69dd6aa2-40c0-6d12-0f6d-2ee3fe1f68c7@amsat.org>
Date: Thu, 4 Mar 2021 21:28:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Peter Maydell wrote:
> Add brief documentation of the new mps3-an547 board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/mps2.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

