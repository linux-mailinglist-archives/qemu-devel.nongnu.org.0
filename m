Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6B339F97
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:43:20 +0100 (CET)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8II-0001UW-W6
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Ed-0007NO-H9
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:39:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Ec-0007T1-3l
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:39:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so17673689wml.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rKIffZwLYLhoyJkvgX/2wEPbt6wK7AaOZzGat+4GuF8=;
 b=g7GwFNjs/sLyh/OQfdI2BCy9V+21VbE142bx0QKLQ50gXAQfJGQlMFjZstl5EYzxWW
 kpVneH1wqvlB5SCzdPXJZ3KoBmbKN88InvNCo1nT3fyE686qaVrTC9NV8zAT7bPsAJGf
 ufA6siw+PZOksFeRYGYCTz+HkEAptO6RzvcIeq228fd0Y/DtThFv9UsPVvwcgbAvlVgv
 D9a7PNSQKya6xq9rhNWqQIN0y6ClMfg+Yfgr70s3IwA+KLDZuPaK8sgJBXnfj8r0Igri
 X4+7mkSGyOyljYrf2gZuTu/ZpaMcbRnky0KrIrttHmOBPSG2fYRX4WYp9KMElx1xsCNE
 ySAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rKIffZwLYLhoyJkvgX/2wEPbt6wK7AaOZzGat+4GuF8=;
 b=PRv0mBytxBTBTYv18AU0Big8Pga+aOawya22Fn45oGEmV+/npnhqVh1S49ZXM//5xm
 x1J+IP+9aJgW3Xeg4y/7QS4+9dMTMkulvdDptZgERAeH4JmSyEC4pFb46Ya397Az37e7
 GEOWOQYwM0G1nt2hG7/GuiIlCsMXRzk+DxsfxZ8hnH6fMCmZhAwuHMU57eAsobH2RMGS
 UDd5m5H+QQ/wnqGTba4RIlnWcCYIABslEnzndJbH/lCQ1seE6dmKffBpPEAJmzX0ZRPq
 9M13Nz7pf2k7/QmB+26IsZY8v6/tKt8w9JOwCd8ghIfz9ThbqiCRVOTDAqxmrqx/zgqO
 BS2A==
X-Gm-Message-State: AOAM532vnnCT15VAhZfrqtCf9nuDLpTQs6ZjFvwE3PFSO+zGrUTsRV0l
 jehQNxWwr6I3cx3zGTqyWow=
X-Google-Smtp-Source: ABdhPJx8TVnLBYtB0lZW4CiNiRx7vhPslGMF1aySznVcMZ3FnoXHYmNOghap/SZ6dQQis4EvXIWNKA==
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr18489987wmc.74.1615657168688; 
 Sat, 13 Mar 2021 09:39:28 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u3sm12642508wrt.82.2021.03.13.09.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:39:28 -0800 (PST)
Subject: Re: [PATCH 11/26] accel/tcg: Rename tcg_init to tcg_init_machine
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <095ce03c-b3c3-9408-309e-da0bb57ca28b@amsat.org>
Date: Sat, 13 Mar 2021 18:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> We shortly want to use tcg_init for something else.
> Since the hook is called init_machine, match that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-all.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

