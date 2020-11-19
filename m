Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77F2B9BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:10:15 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqFx-0006rg-VL
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpv4-00050Z-TN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:48:38 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpv1-0007vA-LB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:48:38 -0500
Received: by mail-pg1-x536.google.com with SMTP id m9so5190263pgb.4
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ozcEOC1vYyR+6p6ytPPVJ515i3v1poVJa1Vs5noNEv8=;
 b=uZoi2vUGTd+PWsRfjCcVQ5M3lEtiCmvEf0m3IlKs94mROXYOi3/eOjaemoY8FLae4Y
 eEHgwFjrYWn6HQ6twJX+PYnwNzT7QdeUIXmqpZaQc4qSTBybJ/HvG3llfck2JMgNZS4n
 gNdXWDWMoSIRyF/F/9T5XssTZOIduuxqsE6gDVR2dj0iX1vxYvtVaSDgfrtT9SUhMvY+
 lVnjy2hrdCXjUsvvquQk9kUEM+GqRle4C85esryn6NVdXZG1z+SyHK7zwey8aKMNMlVC
 rjhdL6T36IH+q6scvaWrIf+KYGBTQg8aQiXAlJZPIkHmVz1F5XNwGp282zvNp/qUPOtC
 vnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozcEOC1vYyR+6p6ytPPVJ515i3v1poVJa1Vs5noNEv8=;
 b=WUFhWihVicQGNlHIXUdVgIYNJGrVcBPcX4PROq/pe+jkaxfTObU0ervzkkDNWdKHxH
 WLU7Zo3ndJUY09Isu0z6zd8gXBwJGb7fpR71GDyA0MIaAyIFje2FaaiNBkXsY0puzy/h
 UDUWH38zvlOd4Dl1Zjl6QCyKArs7zJMJFSKMIMehAOUfANw1QzxrxM5+24LXwCrk0hes
 qgMtsaKUSqFSIHiMk4Hk4VXwP9GmwltHZvfCCLUDaCRcHPcrtVhhrnQ32OcK4zdnE9km
 URoa92MICDQyMeLUh6g7iuCamtBPVtQGfjwnklwZKhYKB4k68ttyBp93Ci2jCeQXuERV
 GJqg==
X-Gm-Message-State: AOAM530idhTa7fth1tmFF4XGYGqq/M7hJTnkzvALKvOC1vV27OvntHDs
 JWmp6jBY9rRxbq8YyOB3OgMfZg==
X-Google-Smtp-Source: ABdhPJwS0rNYwDP5R4IBfQS+q0od9Aco7ZIM2JQQ7pKKdmEUlhue9AlxoYVtabWkht62lkyNGFHR3w==
X-Received: by 2002:a63:e25:: with SMTP id d37mr14011915pgl.191.1605815313082; 
 Thu, 19 Nov 2020 11:48:33 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g15sm623365pfk.184.2020.11.19.11.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:48:32 -0800 (PST)
Subject: Re: [RFC 07/15] target/riscv: rvb: sign-extend instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61fa0e22-33d3-00ed-fdfe-9bf4f4e0bde0@linaro.org>
Date: Thu, 19 Nov 2020 11:48:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

