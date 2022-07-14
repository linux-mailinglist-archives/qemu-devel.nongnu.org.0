Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8B5757FC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:22:20 +0200 (CEST)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC89z-0008Mk-QX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC881-0005cm-2r
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:20:17 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC87o-0007a1-Ad
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:20:15 -0400
Received: by mail-io1-xd35.google.com with SMTP id p81so2708027iod.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujzJGsnIWmO79bhjItobanY98BfnQMWeEqz1KoZF76M=;
 b=DtvD/NwSv8fEo2z+Awg/TcP3WG6llLGByIGrPMD6UpMhGfr9yOwi1phFLin9WkGqJJ
 7hCd3fBp4KgTJxA9I2piHGVCJg1Ljv1VM37QlhrXQdUWWZt8xkvTvyIKEk5gvrGBw5Pp
 7wKTk6EYC/T/2ill8S+rXjx+5UKsPcn4ntC0HGZYl4WycVGS9UUfvi0W+YmTrEjrozCl
 UJlWjwEjBKjki1TpUjoA6AK9AmS97w7Pjr684qnt8P7i45rORRKaykurn9XQr1tEJhd/
 pfEN7RbQpEHsvONGdudFu2jFXQh6lu4EoJHH0XLPHfjH6ziW7RmVxdMKJHblV5pkrdcE
 Qa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujzJGsnIWmO79bhjItobanY98BfnQMWeEqz1KoZF76M=;
 b=IthyJkwwtaaAqmsiT4wZm1b/dqGAIljKboRxyV3rZjjxyiqLXS1EZy2qkgh4ImnMtH
 SXIIe2pEWg5ZAQl8DkHdFU9SBKvy88bFR/P/P9ZPIQ2mFtNWib9/CdDLL5EobNz9suly
 6dFre5zhTCG5zBss+fcK2aQv1eV7si7kZIVZokzqguTaihKk+7SdQe86sKrgYHFB4nRF
 IIpCwM6SwWCXvcf3gTnowRB8JFgKjH5VL51lWPVlRaGB9WkTp9fdE0SyRAJuwrAcBFUq
 BYWogoKDPDh1Gpfy/GURBcO3MUYFlhafrBObD168y3O2/l5oRvicwLPjHEXkAKe3mhm4
 qylQ==
X-Gm-Message-State: AJIora8ETk777BqHOEIxyjyGriIoVJvgRjzyf7glbHdnqzB82gYBcg6L
 Nwdq9bIZZDMqM9EP0uhT0zkb8EV3xw4r+BET
X-Google-Smtp-Source: AGRyM1sy54392HpYLwv04IBc/u223xDopiEJOE0u2Mee/FFpnzZlJrnYxD174VezSjoQdI1ggu4Wbg==
X-Received: by 2002:a02:2a4e:0:b0:33e:e3c8:35c2 with SMTP id
 w75-20020a022a4e000000b0033ee3c835c2mr6327179jaw.170.1657840803142; 
 Thu, 14 Jul 2022 16:20:03 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 u75-20020a02234e000000b0033f4a1114a6sm1244389jau.178.2022.07.14.16.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:20:02 -0700 (PDT)
Message-ID: <c09faa4c-d0d8-e589-1955-c674441f4b6e@linaro.org>
Date: Fri, 15 Jul 2022 04:49:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] target/arm: Fix big-endian host handling of VTCR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/14/22 18:53, Peter Maydell wrote:
> We have a bug in our handling of accesses to the AArch32 VTCR
> register on big-endian hosts: we were not adjusting the part of the
> uint64_t field within TCR that the generated code would access.  That
> can be done with offsetoflow32(), by using an ARM_CP_STATE_BOTH cpreg
> struct, or by defining a full set of read/write/reset functions --
> the various other TCR cpreg structs used one or another of those
> strategies, but for VTCR we did not, so on a big-endian host VTCR
> accesses would touch the wrong half of the register.
> 
> Use offsetoflow32() in the VTCR register struct.  This works even
> though the field in the CPU struct is currently a struct TCR, because
> the first field in that struct is the uint64_t raw_tcr.
> 
> None of the other TCR registers have this bug -- either they are
> AArch64 only, or else they define resetfn, writefn, etc, and
> expect to be passed the full struct pointer.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

