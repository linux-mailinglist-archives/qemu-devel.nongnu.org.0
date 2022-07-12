Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D637E572758
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:34:38 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMab-0008VO-Vs
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUo-0005Ti-3Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUl-0004pk-8L
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id o4so12765921wrh.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gL8x9uZuIlu9PysBtxO5Ec7KlznPr6v02QdAFrUtKSI=;
 b=dUZwkSIE1W9aeELtsIcR7QGrr/n2aoWCdX7f0PpHtrrmu3/Tm+cn3NssMbdlLcGZaL
 NSmC4BRwJ6I6KrqO9TMapL3/jM+1AiyhV8ChJlcb9xoxMe3QdOOsnsCV9u2+4ZiNyTBV
 +988GXVusTNNXyrC4LhWj/Ytu/4j4tarX/akBcoAE2m41RoUW+Z6G6Rih2S+90jf1cVs
 NGfHoJ1JDyHaNzRd6U3eZzEVxvHhu4IugddiCnugVnNbFCepO3p9cYZPHUO+fEIdNiFn
 2ZM0nkcwCrdjy8//5R5s7daIzKId11cAPjEbVltqi/qkCYD+jY/GQsfLlo1NfQ3rTuEs
 RKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gL8x9uZuIlu9PysBtxO5Ec7KlznPr6v02QdAFrUtKSI=;
 b=0EsSgyeN27dXFWEbWRXeAFM+YoVgAsn/DCZiEmC/ItB2KBa/li8WEVpqg9KFuRPyaF
 gt0sSyCOMZUetw6mughtL2j5YBvcb1vlKHkN7aXljDhkJuOzocor+ZS9kWKHN3NnfSQd
 BxP4pB+C3/VF9HdTRbCbO0w1pg3Bele6BgMV7zpHcvD5w67IbcKjk+pSJbdGGgvP1Sey
 n0w+mIHiOjRvKEuGUBhJXle8cPmTfVtancXbu1GrHTbC5lSMYgnPkV86Q+TAS3JwBNwY
 /6rsdWXfA84nZzYNXltBQt/4W/2DX8khaC+sSrJocAYWOg+MOZhpxaA97qQsvfsgP5PN
 MrDQ==
X-Gm-Message-State: AJIora/LV9Xt3SJYo/vyK6IpRZe4p0XMcu5wjpXIL0M3MPviVZLgTtul
 LuI2oaq7pOITqTVW65kfkaPnv6IqcuKeulYP
X-Google-Smtp-Source: AGRyM1sbYBYYePlef77iF13qZYxl4een/1oSAMUYcPn2/6opPRwZCLJNEez+Ult2Iyh1gDEdD7iIUw==
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr23952662wrp.86.1657657714597; 
 Tue, 12 Jul 2022 13:28:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adff18a000000b0021bae66362esm9033265wro.58.2022.07.12.13.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:34 -0700 (PDT)
Message-ID: <ccd73fc7-a848-bb88-a96a-83a8c5a44d50@amsat.org>
Date: Tue, 12 Jul 2022 22:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 3/8] target/mips: Use semihosting/syscalls.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-4-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/6/22 13:16, Richard Henderson wrote:
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 219 +++++++++++++----------------
>   1 file changed, 95 insertions(+), 124 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

