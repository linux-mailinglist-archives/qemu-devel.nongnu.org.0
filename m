Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1B2DC6FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:23:11 +0100 (CET)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcOE-0005JZ-Oj
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcGI-0000PK-LB
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:58 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcGG-0008Bq-EF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:58 -0500
Received: by mail-ot1-x332.google.com with SMTP id 11so24157940oty.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W10rRnm1k82w4OkK8ezeR3A4eCbFB+SarrdOvdV3rag=;
 b=ERy/+XRfCKTFFxDcbCzwu51poFX9u+oVrtSG7E6iYSQ2k95Gbjg+yFCBg1vEktIp1p
 OWUQ+tdhBIBIm3X6fB/xFKcLA4OkSeLCxCeW98dSMMYzJW4RxqWnGzcrZKY+o6IwSfTU
 g3MA7khJhswcAyaJ/wtfFb+MhouVea6OZ8qsGG5MS0QyEr9zfhg04JQtifGZMp8UoQOZ
 AxElc2xNbzh5g7SR2nlK24oc7RCrIZiWzweBdz9z682ZwtQ+7B3GGIRa9dlEcFH9rJHi
 nH9O7DgWwIXCYw/fTYVSzDdGzgXkimOpMvlud7VvDBWgNj6BpohQjOxzNJQxtUv0mMsD
 YfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W10rRnm1k82w4OkK8ezeR3A4eCbFB+SarrdOvdV3rag=;
 b=TTZMP26V9+WYeWVf9V9q+fQ4Z6LoEGCBbT9qf17wAhm2sI9cw3sCALC7wJvxOpFDp6
 DsNArmQBsBujQdQWlfIAghOlR7d3GCBk1S2M2/exE3Gp5XLQMoQ9t3TXZOfZjFLKPLUI
 STrdq4ajMg4Y25fCyumNR3Z6ahlYJi0X3N4lIsgrQd0AMrhe4rOA4962Ryw2nWU0oaJs
 LVLtt9XdHgyNL4CngzQ9bHdwihqENp6PyXdYTSElWuOBj55X6e4EulRCTnljFXC+Q9i9
 FslOO1WQ380wEBnMrDDqf0SkWQdLied+AZp7hxKsL0mMfVsXeUx8uXBJdXntLPc4vO7x
 QZRQ==
X-Gm-Message-State: AOAM533g5IOQbByvLH/BecNR3svl7LFJKvw8zNqf1Cp0+z4brlMU91/8
 eYLKqqUGPs45yMhKA7te1ux+lA==
X-Google-Smtp-Source: ABdhPJxRzudAPBizbAtpLumRpqtMlnvKVS8gYxNPg3+e2nVNfTnpVCyebrekC5dbtV2zAsn88mMOOA==
X-Received: by 2002:a9d:63cd:: with SMTP id e13mr27412999otl.37.1608146094739; 
 Wed, 16 Dec 2020 11:14:54 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z63sm642974otb.20.2020.12.16.11.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:14:54 -0800 (PST)
Subject: Re: [PATCH v2 11/12] target/mips/mips-defs: Rename ISA_MIPS32R5 as
 ISA_MIPS_R5
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <626fa992-4bfc-38fc-b885-369817341813@linaro.org>
Date: Wed, 16 Dec 2020 13:14:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
> The MIPS ISA release 5 is common to 32/64-bit CPUs.
> 
> To avoid holes in the insn_flags type, update the
> definition with the next available bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 4 ++--
>  target/mips/translate.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


