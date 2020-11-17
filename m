Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112422B6F58
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:52:24 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf71b-0006Mq-2A
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6yk-0003tq-Bh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:49:26 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6yh-0003L9-HY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:49:26 -0500
Received: by mail-pg1-x541.google.com with SMTP id f18so16715589pgi.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6ctsSCZMjCrByMSuJXot4T8FKJH0MWJYSoG5YbEthMA=;
 b=rL3AArEm+qHPPgYMmjWki6CKXvKpms2BomJh7L3eeHrDwo3R4VEj8QrtMq73e7tAQe
 ETd4C51VKcH703dhzN4Xv+Yvo+Fj0ob5OhBPDxAU7UOE4WEeBB3Sw5WngRZSTkmkfOmv
 Ie1861K6+Jnx8OxT7TgjaLV6+slbRHVT4sOJaPx8DvnCcm/7AlXMaQg966Z301JIecZI
 O/gPEba6NP/vGsUMtIYEY51/vd8LsmvF8RUhN4yQ7IG4b8c7zJoH6TWT5/FWuu17mtW2
 gzq0Wsl8C95i69mPncPL+BjifC5kecO/PzXbkcuPDIPli3XY1KGtwiCCJRiN7NXWZr10
 FQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ctsSCZMjCrByMSuJXot4T8FKJH0MWJYSoG5YbEthMA=;
 b=hZ5X7BCPVs4/ogwyMEQMysu/FwSRyokInr7BT7Iu65wlrWloVT3mMzNTYBKeMqepmZ
 EdQsMtw+moS7ar08bBCzhM37eY5a9glohIXKSiO/kuqZuYtaK1t5ueNGdiJrvdQsZIN5
 DRPRmidAll8+vgsJ3jvAoYKzh5m2S/l+dtiThT+5MBDEF0IwDylxir+7l4Ftjy75zgzG
 1cLis3RnIN0s7/m9Y+Ovagl4FhjqBLSZPRZ0BnsVSsOxnxZwGtnukZo5kGZeLMBMnjdV
 OvmjKS/Vq4fgPrqjBKGnSH085vHy0e0WKxrNIH5RbVzdmJeEWESw6c7kChLeInBPl5nB
 2oOA==
X-Gm-Message-State: AOAM531D/idXUq4YEhljGZrvVPsYsJm2voWGxhOVzaufhu8RqQqQOfPU
 6IPqGAH9TN2yBW1zsnx8uL/j+eKm8Ri7cA==
X-Google-Smtp-Source: ABdhPJywjDWRJMA3Kggcy2OEgDrzV8hjBAQDdRp7mn+c64sijRC9ELnJz9G4acZI0/egg8SEzuL55g==
X-Received: by 2002:a63:5262:: with SMTP id s34mr4895123pgl.382.1605642562067; 
 Tue, 17 Nov 2020 11:49:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i16sm21969207pfr.183.2020.11.17.11.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:49:21 -0800 (PST)
Subject: Re: [PATCH 11/15] target/arm: Use new FPCR_NZCV_MASK constant
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8e915de-5f72-ff58-f9a6-d7bcba9ede18@linaro.org>
Date: Tue, 17 Nov 2020 11:49:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/16/20 8:08 AM, Peter Maydell wrote:
> We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
> in the previous commit; use it in a couple of places in existing code,
> where we're masking out everything except NZCV for the "load to Rt=15
> sets CPSR.NZCV" special case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


