Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D252A802
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:34:56 +0200 (CEST)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr09v-0003la-Jp
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr07a-00012h-Im
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:32:30 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr07Z-00048w-6A
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:32:30 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so3000315pjr.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UbVQ3zTyTM1eiTnFLg1yKt16bIne3S3edoW8Pw1M0Cg=;
 b=RvVuir7Jy/v6UoJt3zAZYnfEFlARTwmLD1BGYDinNEJEVvwzd1h17nqFSL/Wqu28YJ
 YGGkGI/+uirC0md6b47YAI6puEnh3fagQeq2g233KLQrYj2Vo2XLCGPZvoSd3oseP12Z
 3zmNuPxn1Vrb279zhuvPvrWWKKlYZCeh1gCmK9unJyhlxZddgLM+BVhsIEOw0ZieJANE
 py4BM40Kp63BJx6mUBXD77SYxfJBJ/Ffgzx5Wpelo6Bk7nyj0NS8wZhMP2pJCc2lORyb
 Tpjo57b6dPdkbH+JJUolq53fNiZMe7VkT2j1Ov/WWK+of5W7FNhOE07HaI6SAaiAP6MF
 cIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UbVQ3zTyTM1eiTnFLg1yKt16bIne3S3edoW8Pw1M0Cg=;
 b=NfAyetk/W/4/1Z7tZmGplQ68DIEs24kZqEipT4PgjswceC8syZ6xvmEQf0hGURhk7v
 c3b3gagHNdfL5AKdS/E8pBnqPRkR43Hz6Pw9BtvrYkw5Or6/CPo5DKJiFLCnSe4i2iEh
 xQStkS4W6ZErb+j3x6kyipSXqTUmcY1AH0SEyAnX3gLsuuKm58XD45PGq081b/+1QgGQ
 iXdzy19NT6tdXe9TRH+8ppKOd6WaqdWjxEWl0529H1SQCk3IXJYhk7rRwfQuRMqwz4Tv
 fR/b2/TEOLu11wsujj3n/mKqUJpO/jq7J+T8SpcWHdMBkH1B0fyTTDKA8BQAt76TwCzZ
 o7Tw==
X-Gm-Message-State: AOAM531fAWIEfC8A8R2nSnk0L6CqLNKE/BDAnlDZxXZY7ffLwmT7ES0t
 UTDDiEihxJtjj7siQeAMGNbKlw==
X-Google-Smtp-Source: ABdhPJyMSk/rJwLaCYpQUNFg0W6DsIGP/Eoi5sttsjJQxAnihjV/PV1U3ifNL4MvqaBFoLsCsFpA0g==
X-Received: by 2002:a17:902:bb85:b0:161:556f:7782 with SMTP id
 m5-20020a170902bb8500b00161556f7782mr16122133pls.10.1652805147692; 
 Tue, 17 May 2022 09:32:27 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a170902db0d00b0015e8d4eb2d2sm9481667plx.284.2022.05.17.09.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:32:27 -0700 (PDT)
Message-ID: <0742da80-16ca-d428-fe41-3502990658bf@linaro.org>
Date: Tue, 17 May 2022 09:32:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/12] target/ppc: use TCG_CALL_NO_RWG in BCD helpers
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Helpers of BCD instructions only access the VSRs supplied by the
> TCGv_ptr arguments, no globals are accessed.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

