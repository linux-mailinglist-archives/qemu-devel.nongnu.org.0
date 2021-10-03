Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34E4201C8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:51:31 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX1to-0002qH-Ky
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1s7-0001pB-U0
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:49:43 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX1s6-0004Cn-Cm
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:49:43 -0400
Received: by mail-qk1-x72b.google.com with SMTP id c7so13968984qka.2
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M91z5v70wHS7VArRzRTVyH//ezWD81i/uXEnwcHJ4/g=;
 b=KIK13XeR4xxN5gstRXX1EXpRvtu7R9jqlR9CnZlAKMybPXNwCHtRYTtALNuvQ36+wI
 A+WShItV6TEh6hrJeVDnts9UfwMTZRanh/rfa2NuTVD8Yl7NbfSI57DofFXvFx5UOdBY
 PV8ox1MOhXB7wV9CMmYguQ3zh83/cSAfu5XPkb3yzE3vbpvgROUE7PdNCobuEuqSym/l
 9Y8B9TauTizvpZbW1r8ltAlQxhLHWdkc1AotZYEKNzfGyLlx/OTKMc+qtqesmYA1T8ah
 TZUPqC5aQuVSS4nT9O+GPHSBYibYmOTnB/UE6e12A6RvTo2ehcnFVpIECRQquIKeVN7M
 axxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M91z5v70wHS7VArRzRTVyH//ezWD81i/uXEnwcHJ4/g=;
 b=l67lr+MLuMGHQswI6c6acj4++XpB3fMENhskPtJCGxLn7M6ORZ75t9vIBq7Tg7+LCK
 6zU5s6PcO0/7qO0/zZq2qYTvC6oFjIAlE889y6/Bb/BRTF92subxRrRq+P73FdNfgncd
 BdqCcRje8m49ADL9xss+O9J3R6ZQwI5ZiBfQeeEjmxzTp2GnIYBR5OcUalz1UziXexFD
 aOFOl1iFOPGw4rM6gA54GTIOEG5CmF03MAwjGK6otf1NnJ08epaVlNINrqtsOIksrIcz
 Zi13raGZRpme8xpEEsyYIdSVZye97nWKXfoBSxlLEmO/JuCr3kAol/Acg6cWmbEapqRm
 xmyg==
X-Gm-Message-State: AOAM532xvzm56R0bsK3Ojs4FfpeYYjFLV3cBSExzKGvyBUGGzuel45DK
 C3xdT4gDYRXzp1CFUOQ92IJS/w==
X-Google-Smtp-Source: ABdhPJzCsqiJfYKK468M1yu9LaP0mB/iFP5e/JK2F2/SYFJjGnDo19lo7EOGO/Qoyp50OTXKAqg39w==
X-Received: by 2002:ae9:ed48:: with SMTP id c69mr5974303qkg.424.1633268981314; 
 Sun, 03 Oct 2021 06:49:41 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b65sm6034176qkc.46.2021.10.03.06.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:49:40 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/nios2: Replace load_zero() by zero constant in
 DisasContext
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002233054.3575646-1-f4bug@amsat.org>
 <20211002233054.3575646-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8dfb8f4-c464-3513-7171-09f8437bc7ae@linaro.org>
Date: Sun, 3 Oct 2021 09:49:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002233054.3575646-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 7:30 PM, Philippe Mathieu-Daudé wrote:
> Instead of using a temporary for $zero, keep a reference to the
> constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/nios2/translate.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

