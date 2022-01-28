Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFA49F1E5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:34:01 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDI1Q-0008W0-1x
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHzZ-000743-08
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:32:05 -0500
Received: from [2607:f8b0:4864:20::1035] (port=33286
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHzW-0000ze-Oh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:32:03 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so6420401pjl.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FPkNNZeahEEH3UPvcmIleRojm0EA/KN7k/E1JhaM9wg=;
 b=PdTJQKaPzLEy3TNYBKPinwe1XUWaqqpSqWsTil1jlw5HImSaPcIztQBvUOuulLnBL2
 gIqIZGqTqyRPfmCHH2ogiO/bK5hiuOEwMnoN9LS8l3A1e876QcCeIY+6HBYzH7vRkJ0k
 CgnrecQUi9Fx7Q4ILTLbUx49LwevChAuwAB0QQKe7bzHyEcAPCMEK+rg1Vi5+P9CQ8v7
 qWr+Nbh8x6DsWLpHIhb9qEVeAIic4H9/+yhlsxD1Swx27Z6JzIc7dmuxuFpNCZxHkdKM
 aLrBq9v1nreUyGdQglzqu3eVDez4e96HCAq9Aa2Qks+jHw3BGzZF8TPRSWLQnYRF6RoB
 9c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FPkNNZeahEEH3UPvcmIleRojm0EA/KN7k/E1JhaM9wg=;
 b=nSLFlgXh8Bu988MgFxl8bzv27drONweVp08lwCSTsiENN89GIQxzwzTHCHU8JQQfEj
 ByzoRy1ky+OXK//BUiIY7Yr48mZ5JToj+vmWsWk20js7dN/AcEPuli8RpbTQ4Pkk/f4X
 V90D1j4nkJcdNHZ8NcnFxxx2dYy8s23aAeNMFVKGBcZ6ZRnTVBEIOvWTO6t++pzA2hnu
 jrEZoPu4GrEWcnZ02Mw7iFfuVVCWiuICb+Kgt53PYzqtgl8LGTiNeeg2Hx66/5aqijQM
 GosZo7NA4RUmG0UYb+HZTG0SB5S7Udm+3mJqynzs4Utdk4Q0qW4G2lpZc+6QXGnZxwTl
 LYPA==
X-Gm-Message-State: AOAM532QlWwVCw71d7kXaP19l14sZNuGRcmt/PR1g9McZsBCr9Y9WGrI
 KwJ/xQ3K9/Xz9RDMX2L6/kr78w==
X-Google-Smtp-Source: ABdhPJzRAPVK3LwWF+fkuWvS9hMMUFfVt56Pipz6mNc2GofTHqVf4l/yM2VnKnopoLyDg9LqG0JCFg==
X-Received: by 2002:a17:902:b215:: with SMTP id
 t21mr6842539plr.73.1643340720463; 
 Thu, 27 Jan 2022 19:32:00 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id f2sm7197414pfj.6.2022.01.27.19.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:32:00 -0800 (PST)
Message-ID: <9ee60c84-54b2-4f28-c74a-ae9bba526889@linaro.org>
Date: Fri, 28 Jan 2022 14:31:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/14] hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI
 for unimplemented registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS has a bank of 8 GITS_BASER<n> registers, which allow the
> guest to specify the base address of various data tables.  Each
> register has a read-only type field indicating which table it is for
> and a read-write field where the guest can write in the base address
> (among other things).  We currently allow the guest to write the
> writeable fields for all eight registers, even if the type field is 0
> indicating "Unimplemented".  This means the guest can provoke QEMU
> into asserting by writing an address into one of these unimplemented
> base registers, which bypasses the "if (!value) continue" check in
> extract_table_params() and lets us hit the assertion that the type
> field is one of the permitted table types.
> 
> Prevent the assertion by not allowing the guest to write to the
> unimplemented base registers. This means their value will remain 0
> and extract_table_params() will ignore them.
> 
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

