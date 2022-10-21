Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D760753C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:42:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpUI-0008R9-4Y
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:42:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpHM-00033q-5Y
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpGr-0001gD-Gn
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:29:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpGo-0006bi-Fr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:28:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so4672502wme.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtApQPBba67T6VtiGE56SH2SSr+yy3OWuL916E9NjEU=;
 b=byxs82yinuHIraTMN90KKug+HqC88oTyuz6cDEyUJ2BFGFm37zJEltMr+AefHd9v/6
 KSd7OWYwxwXkU1KggUYLMZs32Et7d44wWEJVj0xWUF84wqPUlY6W7VMLhOKmvh9fkaB+
 g4VLxHIgV61HTXIPazn74twIp/3SeDW6y7/LZOBJR7RsYjm1mh5xLesVXnZBHklD/Ly4
 Bv7iA9Ft+6E+y4GU8HCj5BdkC4RKZDLrJgjeZcHe2/8e/eUc+eVdkwwIcqX0TarzkkaI
 aFi+ViC+G2sRQ3zRSZniRQL6Pp0+a9IgCXRbRI0xBSCdJW0uhAL+wvKAdjGS3g0PtKdQ
 Xy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtApQPBba67T6VtiGE56SH2SSr+yy3OWuL916E9NjEU=;
 b=KBwgwx0XgGEGYWwdIIQTLVcAGWO1tVOAp8I1wxuDGvLveaKIEOdHlmdSft1x0SzJWf
 yU/7iyBWW2K/CaiT95TlAyaG8USMZbBV5W8PzlLRwynsK5l/pHAATBBQAiJWIUprAkVz
 nUSU+HXOU0OvH7Zw2SGNEyN4C0syzS5//XK+aOieeEKEABDERQG1fKN/ikGG0lkSsJQK
 pGi+fFcUseE+3WNoIm1MfII7rEFlJ2GriUcyMbAzhGdOpXOKzlNSQJDg01QDyOFLWZDh
 9scCD4cBHfeS896OgwUyfUpnMbbZ8Oi+EbWO/hf3ZvnAHXAjeHt1pHAWYXAxLyB4T9v5
 YAyg==
X-Gm-Message-State: ACrzQf3qRaI1TIHb02zplNXLFiIGJY1lOK5oE2EvtfSi8lPdPVs6q0Os
 womrYl35GdLd2AsDmnqeOSL1NQ==
X-Google-Smtp-Source: AMsMyM76VHB9/lAqGrpcotIwZbDW16m4qm4m07nKeuzry8p/Pi4gN86XmmSF8PcGkDkGlUxM1QEW6A==
X-Received: by 2002:a05:600c:474a:b0:3c7:6df:4493 with SMTP id
 w10-20020a05600c474a00b003c706df4493mr8868949wmo.44.1666348132060; 
 Fri, 21 Oct 2022 03:28:52 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c3b0e00b003b4fe03c881sm2389400wms.48.2022.10.21.03.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:28:51 -0700 (PDT)
Message-ID: <d2d6639f-2f6f-edfc-2a3f-45e1aded4d07@linaro.org>
Date: Fri, 21 Oct 2022 12:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 17/36] tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with
 TCG_TARGET_CALL_ARG_I64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021071549.2398137-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 09:15, Richard Henderson wrote:
> For 32-bit hosts when TCG_TARGET_CALL_ALIGN_ARGS was set, use
> TCG_CALL_ARG_EVEN.  For 64-bit hosts, TCG_TARGET_CALL_ALIGN_ARGS
> was silently ignored, so always use TCG_CALL_ARG_NORMAL.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.h     |  2 +-
>   tcg/arm/tcg-target.h         |  2 +-
>   tcg/i386/tcg-target.h        |  1 +
>   tcg/loongarch64/tcg-target.h |  2 +-
>   tcg/mips/tcg-target.h        |  3 ++-
>   tcg/riscv/tcg-target.h       |  6 +++++-
>   tcg/s390x/tcg-target.h       |  1 +
>   tcg/sparc64/tcg-target.h     |  1 +
>   tcg/tci/tcg-target.h         |  5 +++++
>   tcg/tcg.c                    |  6 ++++--
>   tcg/ppc/tcg-target.c.inc     | 21 ++++++++-------------
>   11 files changed, 30 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


