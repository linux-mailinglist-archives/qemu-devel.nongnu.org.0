Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149961E529
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 18:56:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjsY-0007UE-Kd; Sun, 06 Nov 2022 12:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjsW-0007Ty-8Y
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:56:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjsU-0002tV-Q5
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:56:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id h9so13357842wrt.0
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZB67AOMK9vNRIH/RL+0B5RyOeHSZBkGuemFInf1SKzE=;
 b=AfnkJrbsCsCoEiL1XJH5Cy9suAG+Y/btPKgp7LBOh2mCYGRmDMHDC1PYkGH9Ebd2Xm
 y8Lf2OOiZT7uen8wD2vdU8ahuVn/dLBg8uR7vp/8c9EOW/yzVP7ip5wVbGVpTrwTVEZJ
 XOf/ubarEFHqwtfx3oD2zR6s8R/V4ArkqBlyzxIx2kQvYOfOWqxFrySbTUc9Y5GrS6Cr
 pD5nvW9HFhi4fyckK9saW8wJmY+NB4VJd5a9xO3LAy2ITeNwDnQLqZLKvcJBGcswJpsf
 FJ6d/mkZKwKK1txS+D2cVMrBGGUpojWVQj2c8hhfn2b/TiocJj3NSqO5WJGCpoEoPY53
 /C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZB67AOMK9vNRIH/RL+0B5RyOeHSZBkGuemFInf1SKzE=;
 b=DxE2MIFh14Z3YaW+zx2/hBSV8Z5U807y82Muxv0klJgXpZRWqjRE6ea9P3dONdl3Ik
 Vi1hl5OJbCQgtq7nsFtifxVDzE2EJ3ZRxWPhooEkWpCcrv9GhGH494HbxyAJXrEyA3D4
 T1w1OIlNEqMZkgpVuLzR2WSXUJdH7JFZfnI3s0DQZvpwH5BrhYyEbgQSIgPQIFi8QVO5
 EVi7Qju41coh/TfvG0m0UTsxcc3wDns1rWvwqJlezy2RuQ/Fd8SuLUDSgZtR5lSkFDXW
 MS6C1SLqH7F3pnhtIoYCwtF0vgKi/NA5rK3C/HYchDxiKvdQMP3zdNcSKtjPXD48ndzq
 q7Fw==
X-Gm-Message-State: ACrzQf0nwDKr8i09EBbElwyR5OsUeYCgZAcTU5/EzV7HY5CGfOsvFIXl
 hwP1Xk15UNhisXiCDdJUyeCt0Q==
X-Google-Smtp-Source: AMsMyM7Wbb/QmEJ09kst1jCYI5aKKH4OQTRegjgir+aLXPPuJj4jKxkbKL6p1yDan7VB1HDhAuNP7Q==
X-Received: by 2002:a5d:654d:0:b0:235:197d:72d1 with SMTP id
 z13-20020a5d654d000000b00235197d72d1mr28604360wrv.680.1667757372697; 
 Sun, 06 Nov 2022 09:56:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d59c1000000b0023c508a1c24sm5070135wry.26.2022.11.06.09.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 09:56:12 -0800 (PST)
Message-ID: <d95e20e6-ee2c-df1e-95f3-1519aae0d49a@linaro.org>
Date: Sun, 6 Nov 2022 18:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 5/6] tcg: Move TCG_TARGET_HAS_direct_jump init to
 tb_gen_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 6/11/22 03:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/translate-all.c | 10 ----------
>   tcg/tcg.c                 | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


