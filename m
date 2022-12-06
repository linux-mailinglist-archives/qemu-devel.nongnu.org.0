Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F68643DC7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Sex-0007vt-38; Tue, 06 Dec 2022 02:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Seq-0007uP-Ps
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:46:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Seo-0007xG-Lo
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:46:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so22176810wrw.13
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xy52E4C/J4BmWJlqk+jAj47dY/iy/fo5PUEuVNuRo9Y=;
 b=BePe11jOw/LwRbebzbqBhvOLOtxgJAx1v5FEqMcWdqKf5YlQGM/DaUkbn7dQKloVpn
 mxGPfmDMFVFrNrOjBV9rD1FDtWzw0LsTkHtxfcXPVVMwNAb/3HU9roN81W/LlKW2VO7v
 bvq9DAkc103dtu2as4bWNKb0xKIkIhnW0d+sRYPnGSFGd/siNkHzKOusTAdtgJqGwHoF
 82Roca60DsRDxwGU02LsaX15H6r8BxuFpvVZJcEewfEvoW/EWO95uVyRC455M53+NGLf
 KQIVB8aIB5iMHLmtOJYua4xonfydmPtcd8MHDUCe4CJu4glHTXxTTZnPEWx75ICyQnuw
 3RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xy52E4C/J4BmWJlqk+jAj47dY/iy/fo5PUEuVNuRo9Y=;
 b=vJg5jodrM3NDKT4V816yft1Jx+aojLiYZMIXq9fTq+Yo5zImDz3QVyt04hjFoieIFz
 v4M0qDOOI+/ryewtjWMbwyxNOg1dnKGVq4xVacf4XD1YcSbrhwHmco49fB/bWJnc5dWM
 Kz3f3m6Qp04qGHX2kjptKpflaIe/j9I+OfU4y9tP4FRc51LuW9w2p0W/Y9MBB/OzU55Q
 qK+L18kTiMja9PBqMX/+hOhKXhfOIJh0OVn2eeYC4WlM+7xAPr6Op5T2S6Gix14Nc+I4
 RTD/FlcPZx08vIqsbAMlLS/Um1j2MPp1Pw1uk4m8/eOQwTlBS8dfGyf/XnAp4uliaCfS
 mJvw==
X-Gm-Message-State: ANoB5pnIDlZBwvYJ7V3XeVJRvEma+rADkyoqR3+aX+WVp68SkH5fCx4r
 WuumRNOU9aSXqIvoB0V24a5Bjw==
X-Google-Smtp-Source: AA0mqf7uK/PbcJGf9FBN6w3NpBZuoqrgQExaFPcvtdC2vfte1n+qzILdbE4T9zAsGUXNvcpRfGe/NA==
X-Received: by 2002:a5d:5187:0:b0:242:5ef:ce32 with SMTP id
 k7-20020a5d5187000000b0024205efce32mr30790571wrv.260.1670312784765; 
 Mon, 05 Dec 2022 23:46:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he9-20020a05600c540900b003b492753826sm19604728wmb.43.2022.12.05.23.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:46:24 -0800 (PST)
Message-ID: <735538c0-9064-c0a1-86c8-100fbe4f3b08@linaro.org>
Date: Tue, 6 Dec 2022 08:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 21/22] tcg/riscv: Introduce OPC_NOP
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:17, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



