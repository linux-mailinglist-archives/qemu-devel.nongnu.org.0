Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7131BFA5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:47:15 +0100 (CET)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBh1l-0003BS-Rs
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgzY-0002ZT-9L
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:44:56 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgzW-0003TC-QT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:44:55 -0500
Received: by mail-pj1-x102d.google.com with SMTP id e9so4245963pjj.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NEclFU1SRq0AzwXnjxFtjDwyqPRFjoq+mgTN1xFuvnE=;
 b=pKgqUBMTjjw4eDBVCRhcAhcIE4FrPmYIQm8w2Th542I5Z5cKuLax737qNXf6nlyio/
 y/KYAd/8iAlQuRrcUIKg+eP2qp6uneQf0N10RN5zg2p/jSDs1KiNhNh849dCtg65B35q
 dSJKRHkcO8bFdQ6fghMcRHk1ZdY2hU36LSUDccxdTfj7vKXkmM1r5MnH8CgDW/ybVPKF
 poaIymek17tS7MuSq5dcwVPdFrBhfPtpUw8EfVp7ZI8ShQ+3f/4yKoEoIT/LfIuFN9Hu
 L9jOKKglKq9llrgvaKT0SV6xJebXEbvQ2KFDgMvF8iPrlfLKE9GbPCd3yNAtaIRi3vsz
 HfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEclFU1SRq0AzwXnjxFtjDwyqPRFjoq+mgTN1xFuvnE=;
 b=Wjdd9o1OP01VICvZPjq3Uvq3oJ2ee3b4I9DwWuiGq8U9eANX0mOqciwi8XiGbFQhBC
 lvo1rpg1oPKKXCTeck6JiiS0qbDQR72VPoE45E8iIqAO+98B1xLcIyGfBs4FWVqd2iYk
 vAwzhvKWviU4xXZ5WaJ/m+EJ7HvGVm+wG53q8KIbUtkRMQWby6S9AhSB/4+EBL6W8Gf1
 4em9e8Dz8EwoMbFNlqle65SFKyRbomRI/c9s8Z3R91vmsg2XLt6FWWw4c4hT+7xvtyxi
 MW8h5QkhdzwY67U5I79CbahyZUFtkzqNvFrsefOKiqwLaY+2TcAEvarivt4uFqtxxXwP
 SMNw==
X-Gm-Message-State: AOAM530lMpv5+4bffZRl7dB0jWxN7W7PkMF/Jbmh3a1RUPihuX1/al3e
 tEsrJfy4MwNR0H9gxgG7d45vJw==
X-Google-Smtp-Source: ABdhPJwB2J6AZgYfPjsWZHytiqAPT/3MXp0FXHFAIMoKHfBUodhP3G/XMxobHtgxleCp1cEyXQisPQ==
X-Received: by 2002:a17:902:9a49:b029:df:fab8:384 with SMTP id
 x9-20020a1709029a49b02900dffab80384mr16244796plv.37.1613407492989; 
 Mon, 15 Feb 2021 08:44:52 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 12sm18252034pjm.28.2021.02.15.08.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:44:52 -0800 (PST)
Subject: Re: [RFC PATCH 17/42] target/mips/tx79: Introduce PEXTUW (Parallel
 Extend Upper from Word)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da28d921-ac5a-28d7-af0f-e6e5d23986fc@linaro.org>
Date: Mon, 15 Feb 2021 08:44:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], bx, ax, 32, 32);
> +    tcg_gen_shri_i64(bx, bx, 32);
> +    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, bx, 0, 32);

I think you should pull this out as a helper:

void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b);

since you'll re-use this for PEXTLW.


r~

