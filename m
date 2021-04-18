Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755AC363736
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 20:54:44 +0200 (CEST)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCZ9-0003ES-F8
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 14:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCVV-0001vE-1X
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:50:57 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCVS-0006W5-7G
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:50:56 -0400
Received: by mail-qt1-x833.google.com with SMTP id u8so24565727qtq.12
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p1XIp6U2CkwWFGeo2FcyPdI2xD5/VsQhH3cCZlHL16w=;
 b=tVJgtvmlit2C+66IrDUVi/iRbJbIqBkgJrWk5drcTzaVmAmyTRSy8K+5NwVFbQ3lHI
 Ttv5xOvNNm9/LIZJ9oAtdiZsAoVIoyIFjFHdhrVHcN3R+qP5MmA/br9/Kx7quFQsR5Lz
 FKPxRQOjZwMdi5wKJp5A8jgxL3GEk31XcEXXlhRLR0ea8dposN1OJ5J+d1OwoAIDPvgi
 wObKwc70Xt2ikRKqg6cJAkusHlFvNpKK4rfR8gcuK9wAZmMXJonW0cIZxSH27kgg1MMY
 NH3OugVTdd7ItpUrw3dOApy/vv0HlJK3G7r/fBNxNDwYuv8daFd9YTCo9o481AkyhCg/
 l70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p1XIp6U2CkwWFGeo2FcyPdI2xD5/VsQhH3cCZlHL16w=;
 b=Xp39Btu5Ww8nzqPD1Pxi0LcgA5iwqWMqOlVIpkTJoJePirdkyeGm7L9DInIx3VpEql
 MDyNbTVVprLFkRqaLbGMILlEHOT5d6vAlUViWbzRjl+5poDOxFuKvFf480D1IEgoOG4h
 65zxlnMC1BjRJjumt4NrR+/w6zxg2Oeu6viQK8GjpNRi6XiOT4ZrWDkviBesKhD2HEXt
 hLXjGgpZ6U75VR6RdVL5g5TZ6LBWREEwenNBG26t9Zu968trVjZzDtPQRWvnKfTS7IC4
 oz7tckUk25zq+0iWUZHrTtCXhILpiTDaKtqZsnoBFe2V6g7MQn7Yekx2itLbayeRj+bI
 lyNw==
X-Gm-Message-State: AOAM533PHPHPpZEkOzGP61ppEZ6J6gsSXNjloCZb9xELgsGq4Mvs2mia
 cQH1uKDzz+R0B4tVJO2T9grKuA==
X-Google-Smtp-Source: ABdhPJwQBJ7P0NenLxWz09cj8UyOlEtwnkS4JzMoei4CA7tu6dXeXRP/zBSxxKOwyq4pzMbdEWuw+g==
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr8579751qts.355.1618771853048; 
 Sun, 18 Apr 2021 11:50:53 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id m29sm259913qkm.101.2021.04.18.11.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 11:50:52 -0700 (PDT)
Subject: Re: [PATCH 01/26] target/mips: Simplify meson TCG rules
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c8729a92-e168-c69d-a3e8-f553dbac918b@linaro.org>
Date: Sun, 18 Apr 2021 11:50:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> We already have the mips_tcg_ss source set for TCG-specific files,
> use it for mxu_translate.c and tx79_translate.c to simplify a bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/meson.build | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

