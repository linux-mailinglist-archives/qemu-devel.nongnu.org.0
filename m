Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1862D3767
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:10:33 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmn3w-0007kf-Rq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn2e-0006oO-14
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:09:12 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:42863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn2c-0003QU-Dv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:09:11 -0500
Received: by mail-oo1-xc42.google.com with SMTP id x203so41100ooa.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Qer8eu5mUYP07M5r6JA6PBiam2XNaTG+nA7UbZekBQ=;
 b=OVaVRjtU1Fe/ZJDry/TNpZvLKng2cUy+CjBTvfSnHqbyqID3g/Jh8QxiBc97UmYLuB
 aeIyLK3ny0uEgx+UeLz1zmNU3XnJfX+JFGwQ8lNUbZQzKG9SgJFKR+CcwBRB9xWNpBXc
 dYzVDQcoXCgXaowsInyXpJIsAd0Vep5jy/qNN1BqjDnXWpGEVTsKb3kKHt9/vDGyoPMr
 69zFbwEuL6Hwbv31pc/Ocr5w3OIlNoQD8oW/RpyVzJE0QE9yaqsfJFmXuznnxvUB3QR2
 fNLe3No/Bv4muvYp7rIkwWZAO3zQVylkeFy9FC/b1dgZoUl6IQb9BGcNZLpC5jSZBaxs
 wVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Qer8eu5mUYP07M5r6JA6PBiam2XNaTG+nA7UbZekBQ=;
 b=aOgaFs6jnZRSX8f5NceFMDEipsL3fVG2QOBOUgs5QeWH0SwBWzF685XQzOcqKsIBvX
 JG/RCVai+RAVBrYsd05yz2iRmzuJauoVNYZJXkxEYYIb/yHLXn+TYXYpEd7AGUp7y7pk
 rUAMFTPuOP451g9ubJWbHURgZN0Zy6zD+VGHQfVy7EjGCxr1aYMJ0CwlzeXvRoLCy5J7
 u8a0tHRiHsxW61GH4rVfGjEruvkHlqCs8AEtIYXL6gVdNuM/kVzGmVPo8eEtn2EuoWti
 edDZS3ymRSFB1y0SqzORdpsHisKG0cOjgGudH01dyLeGGylqrr/IXyqkkFLwyTohBSd6
 Ng6g==
X-Gm-Message-State: AOAM530zcrCsJOPUoO34nGVkdf4fE+MqApKfKVFikv6J5sOGpoQUjCZI
 HeLEuFDmLJEySmTpUO00kltCmA==
X-Google-Smtp-Source: ABdhPJxW2aV2YLeQJqN9+P/syDVYmondBGpwq1k8geZhyARiu/3S3U6FdpSlt4Byy6l/E+9AnCfmTg==
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr460740ooy.64.1607472548404;
 Tue, 08 Dec 2020 16:09:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z6sm134139ooz.17.2020.12.08.16.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:09:07 -0800 (PST)
Subject: Re: [PATCH 01/13] !fixup "target/mips/translate: Add declarations for
 generic code"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1abd2fa-1a94-23e0-e8ac-37600abe20fb@linaro.org>
Date: Tue, 8 Dec 2020 18:09:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> Missed in previous "Convert MSA to decodetree" series.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 8 +++++++-
>  target/mips/translate.c | 4 ++--
>  2 files changed, 9 insertions(+), 3 deletions(-)

Ack.

r~

