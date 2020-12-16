Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E292DC709
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:25:03 +0100 (CET)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcQ2-0007D6-NN
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcG0-0000FG-CY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:40 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcFy-0008BN-Si
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:40 -0500
Received: by mail-oi1-x22e.google.com with SMTP id q205so16062729oig.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yybpfQcfsKwePG8fCR8ImG4nR502Fx4Y2fJs0LsbUhA=;
 b=bewFiDfG42/UqrZSgWAOcMCEvmxPGoCOstZXvAxCuEy7zimaQSyRsJiJz9fhtYbcJC
 YuA4zSTAS8ztpcZkEyZbwkAnG5AfOSgk7RytlhNkPyRmkwCnAwXTMHTev7TE523NpPck
 kgZtDIllmQtW2Q6sZXt8mAcfOp01VAbsGJUgwCtUNqrHMkHkd37mE3yiaSStlXiJdEv3
 aCKgdp4XuE6cxLGgZejAoz0bsu5cGkdFbvBk9huoD7bVLeXkPUePgX5M6yHVapaM8BZG
 vA8FuUO/OgRmIg73zgrDAerlNZD2C8psPGv0F4UQELtfqW4TPLQB7oxMLstHBqMlxjW4
 mUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yybpfQcfsKwePG8fCR8ImG4nR502Fx4Y2fJs0LsbUhA=;
 b=gPo1u3QJNeE5vswykVFfhwuOHoKSVOYNROUj43OO50yejcMtYlw5n4U2TzhIMsv2x9
 fGW6BCqHc043IVuWdnPZRDGCgHsGI+jFOQigIVm/z2DVQ+vNh3cVm+kLqXlhyKFn6KMy
 OUz/lI6RcgzDkB1SedufZIpnO1C+hW9KH2gCG3sbWCnSmpWmCS16m6tSy+d1bKB0yIAt
 VjPeWsmNATkV+X+g7sHlOnenCJp8LebriXfWs6gz+8hwazbcSjTsHLD0npbrGVbUDU2U
 fqMpySZpYpU5TsRVN23LhYkQ/LywEhCnkW6ADGBQsOaLrhYnrjWo5xnsi1MyKatK4HaZ
 FtNQ==
X-Gm-Message-State: AOAM532VzuK5ZgsMKVG3fjag+WuswCrrIrKq9vxGVtWYm/64/rhdlT+5
 no8733K3qZxz2Jg7HhNbSgRMMA==
X-Google-Smtp-Source: ABdhPJwai/yftds1flG/NUseL5u6Jw1GaE2NiWAj2bQEQ13zOwTcj4/Zas+EzE0oaj7T7zXK6mdhxg==
X-Received: by 2002:a05:6808:2cb:: with SMTP id
 a11mr2840555oid.93.1608146077857; 
 Wed, 16 Dec 2020 11:14:37 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 8sm661264otq.18.2020.12.16.11.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:14:37 -0800 (PST)
Subject: Re: [PATCH v2 10/12] target/mips/mips-defs: Rename ISA_MIPS32R3 as
 ISA_MIPS_R3
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44a1039d-a99d-5e01-a937-b92ba943f25b@linaro.org>
Date: Wed, 16 Dec 2020 13:14:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> The MIPS ISA release 3 is common to 32/64-bit CPUs.
> 
> To avoid holes in the insn_flags type, update the
> definition with the next available bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


