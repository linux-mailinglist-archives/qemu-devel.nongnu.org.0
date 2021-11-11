Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE2844D74B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:34:47 +0100 (CET)
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAE2-0002B1-6P
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlACh-0000w8-MM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:33:23 -0500
Received: from [2a00:1450:4864:20::336] (port=39812
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlACg-0008Ho-5M
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:33:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2000317wmr.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xy9QmXY4FJXN0tiO3ErMA3xf5N0FsvM0NMcg7Jp9BA=;
 b=cxSHsx8re1wg7wkhp5SNdkXqZWwn5rGaMlaXgr46J/mf2QTUieH4ZpicnLWtCj/DuA
 hffYBO4/Mx36bxrTgOzvnBnlbLiOD9d0ec2SASlDVnl4rVrWbioWwZ2THLlHabuEIfsc
 cCqms03nwui2APuPx9nrAHaq53jFzJwlfqMp5qJA7qD5fQXV/sWnBeidmet5iPR/jNXp
 zngqnJr61KpRXqU/63m/MHzb6HrWQrvWcdQrVQ9bNgCmIstIN/2Un4tl5GwVoADV0wR3
 QpmCi8eBNViPMbWzwNw7x04RF7kKEPAEAgtfE02R7QndwKszA2FIE+vsHkhYOtlJnljk
 d0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xy9QmXY4FJXN0tiO3ErMA3xf5N0FsvM0NMcg7Jp9BA=;
 b=QZjSRq5c7mYytOJqHlPvNhAjzEChj1Ny+0frzyn7TcLpKBE4vl6+P/dfHOnMsHjVnd
 QVeu9eWTOfrqn5FdUCnOjH2Nmgtj04INafmAlO5i+R0SC5pQSMinD5t9wn+ZIzoIFvSz
 vjuftu+dk5yLDkJ5jaoJ7vXGgZtI9qPI2TNJvupfLD5kLMMx6tq1l+98r2hmmQrTUyQC
 5h2d+ntCqEp+H3ihhJAFrI8q28WerbjNVDiQ0vHw2gZiXOg0vlp4iPm1UQdnTxeh0fZo
 MYb7l3iZfGu3v1N5CM2D25wNmKUdn6UQgRju1Sx8Z419SkgBqeRdFb2dKWaeKmaECNXq
 0pIA==
X-Gm-Message-State: AOAM532f8g+xgV8LL1yxM7fHn7jxxT36oGDuEBdEvgVCPZAyeMkSJ34L
 tJ0lZ6/I5Mam8Bm8Vl0VDJb3iA==
X-Google-Smtp-Source: ABdhPJxvzUAwDEK3M5E0vSyzqtGTooCH2gTKnG3JSjTXGbSCkgpA/pWsvj3F7cF5K8Xhl6v5uXwMEw==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr8062264wmd.143.1636637600626; 
 Thu, 11 Nov 2021 05:33:20 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id s13sm9247455wmc.47.2021.11.11.05.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 05:33:20 -0800 (PST)
Subject: Re: [RFC PATCH v2 02/30] target/loongarch: Add CSR registers
 definition
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <200cebb2-83a0-b3b0-3dfc-3c39f975f930@linaro.org>
Date: Thu, 11 Nov 2021 14:33:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> @@ -179,12 +181,22 @@ static void loongarch_cpu_reset(DeviceState *dev)
>       LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>       LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
>       CPULoongArchState *env = &cpu->env;
> +    uint64_t data;
>   
>       lacc->parent_reset(dev);
>   
>       env->fcsr0_mask = 0x1f1f031f;
>       env->fcsr0 = 0x0;
>   
> +    /* Set direct mapping mode after reset */
> +    data = FIELD_DP64(0, CSR_CRMD, PLV, 0);
> +    data = FIELD_DP64(data, CSR_CRMD, IE, 0);
> +    data = FIELD_DP64(data, CSR_CRMD, DA, 1);
> +    data = FIELD_DP64(data, CSR_CRMD, PG, 0);
> +    data = FIELD_DP64(data, CSR_CRMD, DATF, 1);
> +    data = FIELD_DP64(data, CSR_CRMD, DATM, 1);
> +    env->CSR_CRMD = data;

This is not all that is listed in 6.3 Reset.


r~

