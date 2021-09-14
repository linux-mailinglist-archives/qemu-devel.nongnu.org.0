Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876E40AF8B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:49:07 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8o6-000535-2I
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8iz-0006vA-By
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:43:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8Ym-0003Vn-Ff
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:33:17 -0400
Received: by mail-pj1-x102a.google.com with SMTP id v19so6209989pjh.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eb22XOSOdJqdvikbbk+l420pIwVA9VF62/Z13qOVSMo=;
 b=T3ILWHzE6N3syhMCE+b1GbC/CDOK3iiCzjRicU/5jSsXAFeAzDpSFnbZvWquqTjT3V
 XOdnWY8U1sFEwRWxmMvIUQRsqEOw1b0pNRzymTqmYzgNpIT3cjBrr6r2aQLHkQrUrW8N
 sY98fj+4oTL7A60lYklQr8uVdCS673u3uFXh54DRAIAFELch4s6SDaXuMsj/JJ3Po9y0
 BmEz51YX06KQhbDrg7sawleG9fCx8zEBz3C11FX3kVXvleTR8LiPIltSbHW/mfpX2ar0
 kqB0u1BlTUrgiHjM7SPzevielDR1vUGm3Uptk/8Xwle4ozmfIhy79LkD7xZqhQmO1zYy
 9snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eb22XOSOdJqdvikbbk+l420pIwVA9VF62/Z13qOVSMo=;
 b=KbePVWxYGbUYIMKUiKyNicFDWghoigBsrcupqaONSu65tYhLtywGZa1BFj+VMO/kDz
 2nuLMUCsqAuFlSWSWya7Bjt+0jRxZWd3UarT9xXPGL/NiQKwL2kxOhtDiPPv6zkwHIyj
 w+3CUJuFDY2JW1xLfvEKfFrCVbosfgd8zBIQVROFeIb0EmLB84JjHRmGejFv2FqKUU1a
 P1Ywcs/PzEm3rSKlKC1BjJs6/QUGBiDPmuV+APzZficBro/5lSe+z+wW/hjU4sDl8IFi
 q2ZwqHR7hpSSD0iXAhaUjm156qlTHBeLTTaxQd4+mcuDMFgJtktEihTAVAfXZ5Agehk3
 3oBA==
X-Gm-Message-State: AOAM531BNODx2e3SZnD8JDwwRXpuFcQQRQxyR+UKllIuIbWHfF5DE1li
 rL0lxkvl2Qyms+jZoy95mcEMtw==
X-Google-Smtp-Source: ABdhPJz/hIe4DBaXqdgAL+sWs/7UZCtXTg1/VRMJ5oefwur5tzCE1zWy/y5pL6vGie2++XsSfdGjsQ==
X-Received: by 2002:a17:90a:aa85:: with SMTP id
 l5mr2158846pjq.107.1631626394939; 
 Tue, 14 Sep 2021 06:33:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g3sm12360721pgf.1.2021.09.14.06.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:33:14 -0700 (PDT)
Subject: Re: [PATCH v5 05/21] target/loongarch: Add fixed point shift
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-6-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ddb298ea-f198-8836-b6c2-fee1f7eec0da@linaro.org>
Date: Tue, 14 Sep 2021 06:33:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-6-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement fixed point shift instruction translation.
> 
> This includes:
> - SLL.W, SRL.W, SRA.W, ROTR.W
> - SLLI.W, SRLI.W, SRAI.W, ROTRI.W
> - SLL.D, SRL.D, SRA.D, ROTR.D
> - SLLI.D, SRLI.D, SRAI.D, ROTRI.D
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

