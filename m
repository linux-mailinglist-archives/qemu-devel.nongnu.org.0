Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5CF2EA0E0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:33:44 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZM7-00057W-LQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZIi-0003cx-K4
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:30:12 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZIg-0001dv-U0
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:30:12 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q22so17306820pfk.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TLUDCa07Zx01yRbNm5aS3FZ2iLpzJskWF/eE6BOOAIA=;
 b=waqb2DF+J5KKMcV/65j0kGUH9xP8TPgQA4EcmTF1KPHBdsyGqmDsHBtNy/tVJ7XXz0
 o7yi/MTzKsxEwKnEkdv+8L7fQtRIJ+gfvyZLZkW65tt4EIJuqEeDlu4DDOd8Hiju/oqI
 mtDHD6sr266b0lpiBigptDJ7ZZf+dXA7Ix41ZnLP0442OOADJFRJeZuBKwRBtdTv8kWE
 +R0bY/csY0fI6ULV13P6v+xYCIuy/TdfuL3bHyr09Lkj0ydLGylPibkL+SwYXHnGzzXT
 3cAIxyI02eyYaH8f2QsG5RhGUEcj/IMa3AsZkF3lwTzME7vnWgt+7JS/PksNoetqwHut
 uUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TLUDCa07Zx01yRbNm5aS3FZ2iLpzJskWF/eE6BOOAIA=;
 b=WrM+/yb9YNwY93P6X7IHhbyZGSgLNy1Pw51O/F/ClxjEIpejpoPuM9lpbZUZIvqlYj
 KzH8YSesOe77DZSaXE4jFFoK2NW1OwIe6nxrqqoTGO8fR5ZN8rNIsOz2GB4D3PEHDxdT
 /tnG/HDnLNKcpFHwqcQdMNDAtuOOZ8YLrXR2wovoffKFSIJSex2SU6+P89MismbTv5Rt
 TXPD0elMenEqbLsTPB475kNjA7RrsHxc7v0mFb3Tom4jTxBAjC7FOoWeYNPV6vQdsPSN
 a+94DCbxQXfhjBz2/L4WCaaQxVrCcPvqtgh7upCyfUg3rWvbr3RT5k1hrAgf0h4ZhNWG
 GFew==
X-Gm-Message-State: AOAM530j/N+btoTIXUVKqAbBd4cma32PhaTt8vFsafP49R2TUpZIDUwt
 p7hT/yR5F9xCQTw4Zol84uXjEQ==
X-Google-Smtp-Source: ABdhPJxsMQwssuWEjHXwFybMJSUB/yT7CAN9ZaTi8er5/ZP/0n002q0ASEpOcQOmfMmGPhwq63RS0g==
X-Received: by 2002:a62:cf02:0:b029:1a4:6899:618e with SMTP id
 b2-20020a62cf020000b02901a46899618emr45250781pfg.70.1609803009131; 
 Mon, 04 Jan 2021 15:30:09 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id p16sm410265pju.47.2021.01.04.15.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 15:30:08 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
Date: Mon, 4 Jan 2021 13:30:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104221154.3127610-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
> MIPS 64-bit ISA is introduced with MIPS3.
> 
> Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
> and the cpu_type_is_64bit() method to check if a CPU supports
> this ISA (thus is 64-bit).
> 
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.h       | 5 +++++
>  target/mips/mips-defs.h | 4 +++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

I still don't understand this as an alias, as opposed to a separate bit.
(ISA_MIPS3 | CPU_MIPS64R6) does not make sense, because R6 removes instructions.

But if this is an intermediate step,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

