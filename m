Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA761411DD8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:24:10 +0200 (CEST)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSN1W-00037u-0y
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMwk-0005gK-J0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:19:14 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMwj-0007o5-5F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:19:14 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so16907630pff.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=woJgHZi7N6rYoD2Ae814uyqjx/dO79FR/f7QzPar1zU=;
 b=LUTSNWWGPonY2AR2lbZFdBiL6VzSGuB/HkgjNi81XJqs50IOclOIjjsr4IIe/wew1e
 vg5kXLYk4kjDluSiWQdMfG2sHh90ONoZcPTic6u4PqWq+N1PGPyw55vzYVTx8+j66BVw
 S2X+vYgETkQp8LVl/ka8CqoA5VKFPiqphAUTpp5scqautH9Puw6GSUWtqKsM+eiZCQX4
 LZFxnxfdE1SOR8kB8pfSd53yiLO3ePyt+O00E7KkFtM9OMV5lTTN0FAB5js02ZCLpTJD
 a5T1klUjfMLQcS9VNi1BL3zqQnNp7l9ewr4A99Az+Z8EI1GhdMtDpIRJwaFXfqvpu8Wb
 Fq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=woJgHZi7N6rYoD2Ae814uyqjx/dO79FR/f7QzPar1zU=;
 b=JiV5Bv/QJfCIt6q0TTh3r1XhjePWiDTKW+piDzIDBtl38Bq5kjRE98JtK8lVtYhbI2
 BwMgM13yD/uifbdUGQ2XEb+Z6mNCqeYQgTpzzzUc60fbN50Xqxld44n3becC464nOlx1
 BVPJxVINEWUlDzdEMDqUv2kni7dIqb7bKjj0G44albPo5fjFOfDfMBNE+l63O0hqXgS1
 n+/ZeIokwk5V9oSs6zL8oMAiUGeoN3Y3ac5frrD+x9db/SxRhS/jx0YE1d66LSM/JB6O
 rkEIihGLwr4IwAC2omvrchWuzFt60pJpjEr4c8VfIKtteXVZoj+TFpGI6b4PebQsTxnc
 6ruQ==
X-Gm-Message-State: AOAM530+fw9ZoNTwO6/rhjUm2xYRvIy8ZWnF6/FQuT4F6XSnndF58iLW
 9w5pgyx8zKdJReCcrgVzvJb58wpqJXenyg==
X-Google-Smtp-Source: ABdhPJxZeejS/CYWKZToQiltKKPpoOQqBzbWCw/1bdo1c77XAb5mendfkESpxYy9nhSBJDokv39Jgw==
X-Received: by 2002:a63:8c50:: with SMTP id q16mr10820334pgn.315.1632158351677; 
 Mon, 20 Sep 2021 10:19:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q12sm368831pgv.26.2021.09.20.10.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:19:11 -0700 (PDT)
Subject: Re: [PATCH 26/30] tcg/loongarch: Implement tcg_target_init
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-27-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9e44d4a-8419-9eab-0650-98e51781076e@linaro.org>
Date: Mon, 20 Sep 2021 10:19:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-27-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static void tcg_target_init(TCGContext *s)
> +{
> +    tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
> +    if (TCG_TARGET_REG_BITS == 64) {
> +        tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
> +    }
> +
> +    tcg_target_call_clobber_regs = -1u;

In all 3 places, use your ALL_GENERAL_REGS constant.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

