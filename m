Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D199945EBE4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:48:45 +0100 (CET)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYma-0005MO-Km
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYlD-0004gl-Iu
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:47:19 -0500
Received: from [2a00:1450:4864:20::42a] (port=42619
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYlB-0006p6-VW
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:47:19 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c4so17684477wrd.9
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3WR8LwSK5IKPN7CAvFshtwb7fILAdtuvIsALRhUl2xA=;
 b=osrv69yLhXh2+Y00Jnj1+pwZk/k/xyowobL7XrquAnsKlSsM4rflfDxrG/7v/AQWj6
 Hwtxg2xzOZR9x//ol+5W3q55hpbOHI7BgVJvyVsgZylMoqtICbBmnTbk9PN0PRzidUpA
 z4YZ8BoSmAXedrntUnoCf3oiFSfDYwBapIa4Lh7pBlWMS53zDHcu/aDVtIMsOIJRD6RV
 EffAwAMlC1OID0P+qHJIp6CyDAx4ZIkkpjKVEBu2Pqcq/zmyBGolnPxYJKfdgHN2F7Wn
 QLruVcZTOS6PBD+ypaCtcOWvG6mHjr/m+svt94GNKblt2TmK8Erfr5pvjP485GGvo6Hs
 hMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3WR8LwSK5IKPN7CAvFshtwb7fILAdtuvIsALRhUl2xA=;
 b=7dcMswgp1rrBSpvENpoplZ6NLqZgBgfdDjAFjXnVpMZVsG7vCDedLc6TP8gIXIwoeL
 m+upzkuwvjvdaP3lIIMVIHaQBivoRhmNTmDCPxrtDkU31/O3Vi5F8IUZ3axr9mCNmZBo
 KYqZYX5xvdVN1cioJVh96lDhwO9TqzlZjk26An+W2N52YNPxd+CuwZQLQTuQ+gTR2ox/
 JLqEkDAqcUPNl+9iYuDyHgpgX6p9QwbNxD32BQcP1lsuBkElOsfT/cuOg0nW5GIhQjfX
 BwVu9q72oGeymt5UbSEDqt3z03Yr7YeHBRRWY0h35gTrWZetSgljfDRy+BoBtW/LsI9K
 edqQ==
X-Gm-Message-State: AOAM533jP4YlpejtmqwY91v14uvUOYCcTBgbExliatpKknI08+RJU6ZD
 HOSYGt/86yxUisVcKt8sqSNcBA==
X-Google-Smtp-Source: ABdhPJydczVDgjmG+lTvMJXFU84GPSaPtCXssFwuVdRxd4lobwGzcM+MG8n5c/JMaNWiwGSwl42/gA==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr13491329wrr.177.1637923636435; 
 Fri, 26 Nov 2021 02:47:16 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id s8sm5364063wro.19.2021.11.26.02.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:47:16 -0800 (PST)
Subject: Re: [PATCH v2 1/3] linux-user: Move target_signal.h generic
 definitions to generic/signal.h
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-2-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf27f124-4144-9717-9533-39c797db1bde@linaro.org>
Date: Fri, 26 Nov 2021 11:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637893388-10282-2-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 3:23 AM, Song Gao wrote:
> No code change
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   linux-user/aarch64/target_signal.h    | 18 ------------------
>   linux-user/arm/target_signal.h        | 18 ------------------
>   linux-user/cris/target_signal.h       | 18 ------------------
>   linux-user/generic/signal.h           | 16 ++++++++++++++++
>   linux-user/hexagon/target_signal.h    | 11 -----------
>   linux-user/i386/target_signal.h       | 18 ------------------
>   linux-user/m68k/target_signal.h       | 18 ------------------
>   linux-user/microblaze/target_signal.h | 18 ------------------
>   linux-user/nios2/target_signal.h      | 16 ----------------
>   linux-user/openrisc/target_signal.h   | 23 -----------------------
>   linux-user/ppc/target_signal.h        | 18 ------------------
>   linux-user/riscv/target_signal.h      | 12 ------------
>   linux-user/s390x/target_signal.h      | 15 ---------------
>   linux-user/sh4/target_signal.h        | 18 ------------------
>   linux-user/x86_64/target_signal.h     | 18 ------------------
>   linux-user/xtensa/target_signal.h     | 17 -----------------
>   16 files changed, 16 insertions(+), 256 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

