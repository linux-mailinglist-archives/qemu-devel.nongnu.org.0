Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A8468690
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:34:40 +0100 (CET)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYvm-0002Ek-Rz
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYuP-0001KH-U6
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:33:13 -0500
Received: from [2a00:1450:4864:20::42b] (port=38620
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYuN-0006RK-QJ
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:33:13 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q3so12815908wru.5
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=voJjhZ95Za2iZcq8zbajuDDmKni+tKit8dbhyvGTFtU=;
 b=GSPQ//NpdtNX4PUAfZOg6d/3j9M03v0tgw5IyptYPPRsbG7OoGraVpzhDIN/v8352d
 rHZ4XLMF0z52NFVmIB04anfn7MQE/bxX1fWF96+80huoGGwp35194FFb5ioklF5ztPWo
 STGLPULMKhVvoubPGCeTpxdECC65R5YlWAKuHkGSx+YMWQKglWSwoiisRypVseKj4zcf
 R+Pw0HqDKO/jK0EZs39nqjimXaEaQKeaxdBig1gylUuM9K2ofY10JPsSppKp5Df+GDZ7
 9XL3F7u+d2eJ3escBZIHhc70X9/H8JFxBbL02UjIUlF+msdXSoM7AWCk3JgIGvrYAv7Y
 5Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=voJjhZ95Za2iZcq8zbajuDDmKni+tKit8dbhyvGTFtU=;
 b=HQ7vTZM7qfLRraeZOmo/wsv//4tz5yWKSjp745l9ccvU9b2gnHrYlFSJ3vO2wltCcG
 TYQam/dx5y6/7oJNpYSIAKMvHtGFq/9B805p4kbYE+jMcUThgDqQp1JODuBYalYnk3R5
 Zm9lZt6w+OZBwggKGtv/iGBFUSnVvzQttStVjYlTEJIc7rLSWHLU4Xp840p5+T5yBPxb
 Eb7E7TyGV+rtYnrsWMUiEEunlBxTTnUMGs0N4eqqQV+BiC47FPOtjs2Br+2fxcMDF4Vc
 eV0XxIWyFRjNa89R23XHqcJJgXJVVM/XpVeskHz7j2ERBXMJkvCj/+5y89Q61f2oHGGT
 BDHg==
X-Gm-Message-State: AOAM533UR/cN7TUqL2Swrw5cNn/63yYGgNtkGf19Fr+XuiyxHpTbfdWk
 ZCk7m4f6/WVzzLz7gKUunqTLPExL/oV2QA==
X-Google-Smtp-Source: ABdhPJzJFx7Uu8Ac1d96LzXRVo5mjOyuT8T60FAktihPa8IzYeuhAovKVIzrUvNTKJH0LfSptvKgpA==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr30480373wrx.236.1638639189968; 
 Sat, 04 Dec 2021 09:33:09 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id g19sm8956009wmg.12.2021.12.04.09.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:33:09 -0800 (PST)
Message-ID: <08166842-7f45-2c50-214d-d4076475177a@amsat.org>
Date: Sat, 4 Dec 2021 18:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 24/26] target/loongarch: Add target build suport
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-25-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-25-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> This patch adds build loongarch-linux-user target support.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                  |  2 +-
>  target/loongarch/meson.build | 19 +++++++++++++++++++
>  target/meson.build           |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 target/loongarch/meson.build

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

