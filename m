Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2A2DC6FD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:21:34 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcMf-0003ew-F9
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcEo-0007Gz-Ck
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:26 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcEk-00085k-Jd
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:26 -0500
Received: by mail-ot1-x334.google.com with SMTP id w3so24133130otp.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ei3MUj/RduF+dyo1hCP4eEEUHs50EUYohD5R59mg+K8=;
 b=s6M1YVzBYKDfyfc0GoQqlFjKUdTFG8Kj9R/kOrawKucgXc+mbsnk366l/aH0jMV2L2
 faPX7qoWP2y1mAe6nGnsjXJeCop8M4QKYbbVcjIC/6CirchLdOqSh/HDIiYvXvqR3PvL
 HfPdLiCbmP7umQ39swGruhlQg9egyTGCtVg/fAcbOAwwJnpGzmFeDoH99Yffq9iHj6I2
 o9xWifOkDGGARTNhI7xlQnVffrG0uwBJMMpdld20/jluHCWlUN070JsBF5XC8ULU/7gr
 COtEjQfq6JiNFwgFobbLOrdVa4llaimy9r2GbjKVVjzEad91K7RiabJM0YhvalMavUFr
 ZasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ei3MUj/RduF+dyo1hCP4eEEUHs50EUYohD5R59mg+K8=;
 b=ijwtGbc7Oj+nY261NF8duVTtJ40CnfFhXHqz/Hk6+QXE99hKKsVtlZobHS7d1lGPUa
 KBoaAoUVXlNMv+7jKVUXH1wuTo43zewlxZFVKF3RUVDEbwOIwLa+6F5x4qeDz8QHJz4l
 m4s1sl81prTcLAlPMQ5Z7RzwSGia2bXfdpnlA3IXTidcZ3qnMADRKjBiwg0UdTxvka2G
 4gQasgNvTj1cPOjmFPmHbJDifWoal22EzQXdXKGkL1EQcPL9XK4QKNW6jf6zSRX4VrIG
 0CaMvwf9izL5AfjRU6gJeKwYB+bR00EbrOjOACHGx4H2YlfAOg9pI7N1mbczrB3VLXXG
 Y87w==
X-Gm-Message-State: AOAM5333YeeDxN3A+4HgB8ODqomCneYXhN8u9+qKd54g2CCdrE/I3kE6
 R8huVMLUlEQ7f8958zLRtN+nbA==
X-Google-Smtp-Source: ABdhPJyx9Tici+/LjPcGE+rqtLPAaEUSly53ybiwb95caSUIBNjOBe1bDD4G3pyiLgfSoE+K7wi58A==
X-Received: by 2002:a9d:5c4:: with SMTP id 62mr21664127otd.34.1608146001458;
 Wed, 16 Dec 2020 11:13:21 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l21sm663703otd.0.2020.12.16.11.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:13:20 -0800 (PST)
Subject: Re: [PATCH v2 06/12] target/mips/mips-defs: Use ISA_MIPS32R5
 definition to check Release 5
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ceda05c-92b1-d34d-68dd-a96afbd87d39@linaro.org>
Date: Wed, 16 Dec 2020 13:13:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
> Use the single ISA_MIPS32R5 definition to check if the Release 5
> ISA is supported, whether the CPU support 32/64-bit.
> 
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R5 in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


