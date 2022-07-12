Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F81572764
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:37:20 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMdD-0005WM-Fr
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUv-0005Yb-AA
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUt-0004qD-UR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p27-20020a05600c1d9b00b003a2f36054d0so54069wms.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tJLH0iiB6vx7LUlOf6DXrfJgBZgIPvlfSr1z2g9ifao=;
 b=NrTOmsjBInFAVQENyzADraf1csoCJ+TFumB65yA6L1WCG7IeSkiZPnGyVu8rfuJY+j
 QawBoaP764B0jxI7jR1m5XIf2QtOTEqKGKKdyoUVXhBQYdugZqy3Rirttd+NpYvXJ5aq
 A1a04a45QA6h6OOCilk4dMg8fZNWdnpv/M58dZJFATzZCJAsy0PWf2hJ55qTwsazcrzb
 BfDr7gwL+yJ9tdNpeS7bbTuXbUKkMk4uodQ+fgd1MLl0+v2JjAVy4+TRtGmwllHMtK73
 l3GXbyOl4Q8kewoWovonbhtOIkRF/MPmYiLm1gBHkxojlGty4frFD1duCFdwXbBoIP1Z
 /wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tJLH0iiB6vx7LUlOf6DXrfJgBZgIPvlfSr1z2g9ifao=;
 b=fuQ7ABgatORoDWUEnMEQLnhlwJ3h3Atkf93BDXeGjw8A2kurXp3pyoPlJIhjkr+O+g
 zlkw8ZfhZ3TpIT1kP82t8f3rRe4Pi6DL/AtbDeJ92rKy9p5bn8htUgZnuvOKD90X4+5j
 fOorq6KaoOw5/dvXEDzVsBoQST4gcvro3wPSr5UiBsPRfjPNZA8zZLA2MxmIGQmchMOP
 YaUQ2Mq38/6ig/Dj2bI1lH8hF8UsRqPeh30xyRmNVXhFBe1b8fDnXR1ohajEfD4IKK2K
 xnaQtPEJsJLbPbdH12UbUX5FFZGoUX4n7pgsyGFOCqPFJPVZpPp7KD/HvgfKr5A0UsMQ
 y/QA==
X-Gm-Message-State: AJIora9N6bBQkUrxmFVg1gsMZofnAtrRTT44g+o0vhccpHK2bPirTHU5
 7bBUjHfwrH88Z+YJgWiIL2M=
X-Google-Smtp-Source: AGRyM1uB+NYclEiDvz1H/OMuqF/ZPlAcHIBa2T1nc16LImNghJ4bdEafxy4IXTBBjWhKqvg4QlFHzQ==
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id
 d3-20020a05600c3ac300b003a045b67efbmr5833278wms.183.1657657723296; 
 Tue, 12 Jul 2022 13:28:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a04962ad3esm3348793wmb.31.2022.07.12.13.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:42 -0700 (PDT)
Message-ID: <a64988e2-1a78-7365-abc2-40335ed803d6@amsat.org>
Date: Tue, 12 Jul 2022 22:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/8] target/mips: Create report_fault for semihosting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-2-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
> The UHI specification does not have an EFAULT value,
> and further specifies that "undefined UHI operations
> should not return control to the target".
> 
> So, log the error and abort.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 33 ++++++++++++++----------------
>   1 file changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

