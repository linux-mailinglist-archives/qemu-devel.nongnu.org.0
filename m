Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405E585764
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:41:49 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZc3-0006wf-RN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZaG-0005Qm-8J
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:39:56 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZaE-00088q-GB
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:39:55 -0400
Received: by mail-pl1-x633.google.com with SMTP id d3so5856237pls.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJSS3W0KkWa7/lfldHgscIn4YqzTGynq7Iwcq6a1bY4=;
 b=FzBt2c6zOFYmBR4pipFBip0q9zt3pi0PuXqq1BU3m9uv8qahoHSIsAhfKQ969qMv6d
 oj45YLAa0FNpxgofka1qRwnNYiiwLe3hD8YBXNBAaOuPvDbZbw/Gu+vGWPr+StoIyD74
 P8alsFHss1yC+QtRwPL26Vy9dRpl5rc8fr4azMAVJMu65a36zJUcsUyoVvQWhOp6esvh
 37AriQez0x8rNPe80OEstSbXAxm0YdHgNg6WO9/qhUBmosBsyWTh5Elxxg7Be+x+gTE+
 TruNUSiyPrmuM1nlSHxVBfu+FQGkCnSVxKjJYpu6Gk2Iohuzt61jesfvWc2l3FCRui7e
 VmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJSS3W0KkWa7/lfldHgscIn4YqzTGynq7Iwcq6a1bY4=;
 b=cHrCEg2tpxhTF4IVX1XiOt8kvtluQedBVCkAVtG6u/8mLoRuniEY2rZLjb3BCR/RZj
 sTKttyMlMEJmEMiVzQlZlx0qo/EY8W+VE2mi9D0fsNdivUpXAA2ZDOX9D0ilF6eNJCK/
 yWvo9aAMFUt3/kgNMvYbmmEhiaSgLxcm6nhaM3jVsGsn5gEnzcYEGOJLb4tuBwSKYMDH
 PJCJCfmcLlQeDbzLVhlG8kANLEdhWxxWng+SAt6neMr4ZC9UmMbJ1qspAUgKdLvgOWiy
 lfoZ8b7c+9nMH77N1+JZo/Lv1TuhH8P1UXVBfUknSPlEMat0fE3KK67ULSGANuUa3P7c
 HwCw==
X-Gm-Message-State: ACgBeo1aC6O55SJwsgIpICF/Bp2oK36bH0iZN7RgeRp80Fz7ytjS2WGp
 SrHPNhqnruOeyaUK2+S4oFEvoA==
X-Google-Smtp-Source: AA6agR5nHalAT+HGu1I0mSvaoNE4cspxztpyF2NWiiDhymhiP8DhbUm4of3nUXJk+K5EyHd/B6kRcw==
X-Received: by 2002:a17:90a:ead3:b0:1f3:366d:5005 with SMTP id
 ev19-20020a17090aead300b001f3366d5005mr5549752pjb.1.1659137992414; 
 Fri, 29 Jul 2022 16:39:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 127-20020a620585000000b0052516db7123sm3448759pff.35.2022.07.29.16.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 16:39:51 -0700 (PDT)
Message-ID: <edca0c3d-e7d5-6797-03cb-56fc7d955925@linaro.org>
Date: Fri, 29 Jul 2022 16:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/11] goldfish_rtc: Add big-endian property
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup@brainfault.org>,
 Laurent Vivier <laurent@vivier.eu>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220729230117.3768312-1-shorne@gmail.com>
 <20220729230117.3768312-4-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729230117.3768312-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/29/22 16:01, Stafford Horne wrote:
> Add a new property "big-endian" to allow configuring the RTC as either
> little or big endian, the default is little endian.
> 
> Currently overriding the default to big endian is only used by the m68k
> virt platform.  New platforms should prefer to use little endian and not
> set this.
> 
> Cc: Laurent Vivier<lvivier@redhat.com>
> Reviewed-by: Anup Patel<anup@brainfault.org>
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
> Since v2:
>   - Added Reviewed-by
>   - Changed from enum property to boolean as suggested by Richard

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

