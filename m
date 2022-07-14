Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B359E5757F8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:19:49 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC87Y-0004oI-Ks
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC861-0002gL-JH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:18:13 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC85z-0006SI-70
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:18:12 -0400
Received: by mail-io1-xd36.google.com with SMTP id l24so2675015ion.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1OUSiWWsXRgDs0vH3JIAKa+MmMDxu2DXxYSPaWhhAR8=;
 b=MND0zs3KiQAX408pS6OBiy3R8JKu95kR+Xr1E9CKQmQxghxao+6tbMXd1GPy4zygbQ
 D+UdLqbSqUCkCSAbxTPEjVeQArj8++H2kbevD19gSRikVbneBwvGyolcQlajNyftZNXm
 ztBosvoGl6Gkuv5lRfcXO+UWbdTOi0TgrCPTysTTsYDoUykx0Bmu5ew/F5GZy1AomArZ
 6Lt/CG8tXWoDFuPnR7sEDpCm6F1XE+ORPGjqaa8XSjM7d8HTkppQUCLO6LeygTe3JsKz
 XEZ4VjozmsdsGJSpwLgqjrrnlq1AQ15YFdpoVRS/ksqxYAFm4K2r5qD2cYYwnSDkDo5g
 augA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OUSiWWsXRgDs0vH3JIAKa+MmMDxu2DXxYSPaWhhAR8=;
 b=jHdjU9cCa8IljQVKlw18U46uI3jMj01i7A8BmK4n9cFUeyPWDwOqiY8mXYe3CaKNqq
 lYFFGMJhOqt+xbek3yU/noRofaenY9N/JRaePeR1c/6ibOYtnyU9uQLEQ9HIBWiP8ydM
 5FJZC1ttdQcdy3y6gCsuwr5tPr+gqXr0wr4bGcQ/ElDUojZdJOQRxXB0ot8LUp3/gL53
 VQD5YBW5tYAbVfxphC7Ll25+AOeAhKATktQWJI8moGI76yB0rZsShLM9WekbLeiTRbYA
 B+vfc1b1EYTbDcf3XFfBS33u+voZq+j+U2bcA4aAErzODBRu/fkSys5L+IFINbebVFqO
 BVDg==
X-Gm-Message-State: AJIora/zL7/SbhG06692aHNfLenZY5sJq3Ny1DtnzXWwgjQRnUYmqlVq
 8Q/Eti9VufDLZ/59DVtJydabfQ==
X-Google-Smtp-Source: AGRyM1uVbUL4m8K0pjkpgsFOvI5u+s6Cx6fN5rCsaVWNl8BaRGSD3mff9kxC+UbSs03Q9J3sCJtHTw==
X-Received: by 2002:a05:6638:16cb:b0:33f:8871:1b5c with SMTP id
 g11-20020a05663816cb00b0033f88711b5cmr5403629jat.11.1657840689979; 
 Thu, 14 Jul 2022 16:18:09 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d80c2000000b0066952cfe3e2sm1334117ior.39.2022.07.14.16.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:18:09 -0700 (PDT)
Message-ID: <c92cc8a2-ea12-3fa6-f086-7aebbb02507e@linaro.org>
Date: Fri, 15 Jul 2022 04:48:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/7] target/arm: Calculate mask/base_mask in
 get_level1_table_address()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/14/22 18:52, Peter Maydell wrote:
> In get_level1_table_address(), instead of using precalculated values
> of mask and base_mask from the TCR struct, calculate them directly
> (in the same way we currently do in vmsa_ttbcr_raw_write() to
> populate the TCR struct fields).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

