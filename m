Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504569DB04
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:14:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMqu-0003Ul-5A; Tue, 21 Feb 2023 02:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMqr-0003Tv-UH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:14:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMqq-00034m-Dh
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:14:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id j2so3118681wrh.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0asInwIURkwvOIIu7rwjE/mHC2qRKTm48MlQxOIyIE=;
 b=EVhqAHBGdwzGV0989648blisOs36xHn2VCuaSXwCzLvMa2PJgJ5PCMtGm5S/tVAzCw
 GU41q3nmwqXIbcUuQVoueFeNP0/F5rtKULUy/HQ4PrU2d2apyrGjv7HYXjfkmB5wJdRF
 RIHO4W64m0qO4w++4l1Y070nI1DLopysLsOenhKz5vc2LYTh0l+xgQq6doasEFYubHu9
 K7XqZW/9VNDOQxipBQ/syi3WbijJuqEXUs3v2goD4fRsEJxMjrQva3vN8mCdXSuNcVys
 HQALWhyNROiQf9eOnBxlzvyY9Uh/JAgt9k85ECYAPFSUZTa6zr+2Dg7qPgmvgwB6w4e7
 VICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0asInwIURkwvOIIu7rwjE/mHC2qRKTm48MlQxOIyIE=;
 b=x+8sOqPBfZzp7eR8gPNi6EiB2/5ppINExysuJXP3CF2z9G9CtJRsQsbI6yaaWWziDD
 UhKrLJKXEEkaBdkBy1Rbmd7qbx4KGgHFLWz5n1ujxUVp0MENn6unzZCfrwghkDkTPcMJ
 7QUsFaEiyD4O6fz9F97FtK6k085VZZpqM9S8/sqLtn5bL/K6RZqJ5Gr2t0lHEtLirDBR
 g2OAjovWeGNxN6sStMfAl+cFdvDGVInfeSuwXJqUspKjkHQ2yCMjMxJonkpNZVz4rZuZ
 5EbavZviKvCoTCjEz0dd1jAU+mQ5hz14n/l0PSkKwbKrx1gQGffctYkkcnOTqr2ViqHQ
 ZEAA==
X-Gm-Message-State: AO0yUKVlOa4IorphaWq2j09IjDUbGRw5lzhRgChJqrujiAEIVawVI67/
 MDSCZ8D/HPfv2Vep12jHe0a9lQ==
X-Google-Smtp-Source: AK7set9kFXf/t8dHN1bi9z5o1KAWDqASXbr+aSq5VYMlDdR4eEuUbtM6N3v65RyOA6q0UFdbLjhNjg==
X-Received: by 2002:adf:f391:0:b0:2c6:66f1:3b5d with SMTP id
 m17-20020adff391000000b002c666f13b5dmr4778592wro.12.1676963650950; 
 Mon, 20 Feb 2023 23:14:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i16-20020adfefd0000000b002c552c6c8c2sm1613330wrp.87.2023.02.20.23.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:14:10 -0800 (PST)
Message-ID: <2bd7100d-5036-abbb-c020-8da79fb9711d@linaro.org>
Date: Tue, 21 Feb 2023 08:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/14] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 03:19, Richard Henderson wrote:
> The function is only used for aarch64, so move it to the
> file that has the other aarch64 gdbstub stuff.  Move the
> declaration to internals.h.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h       |   6 ---
>   target/arm/internals.h |   1 +
>   target/arm/gdbstub.c   | 120 -----------------------------------------
>   target/arm/gdbstub64.c | 118 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 119 insertions(+), 126 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


