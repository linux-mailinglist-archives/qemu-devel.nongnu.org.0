Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1612EA835
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:08:12 +0100 (CET)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwjG7-0003Zv-Ex
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjE0-00032g-VI
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:06:01 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjDz-0008SO-0F
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 05:06:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t16so35568633wra.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOvpOPSOmxf/KWrkznTXkp5PpXqxotiSFQy7w6rx7hk=;
 b=n/vY/Fj5N1QIYCl35fmFQTMeFykisK67bnpGk4Lo03hFk3Rz3apDR3C667hnl4IMNi
 WPsidPXHI8/B2sCqbcaa/dHUwqwqznd9UpOAXmW0h4h1/ZG5Uf2JLm/AAfaFBpZQfJPK
 d04DgURXpcvoMnLYtvd07aLVrw04cPgmwWg6Vz4QVEZRPmzBYm+38iYqmlBCzWHRpqpM
 9GlwIEgx5VCop2774WE/HT5dNVdT3xVJbR2fQKJROCOZerY2Z9Tju//riOW49DzugUOF
 NWjcvnVrLVVXqYr4jk3e3y2pZq5WDb3LgDIcI4+mnwNzQOUFTOifNftqpDwnUTEdd//M
 58/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOvpOPSOmxf/KWrkznTXkp5PpXqxotiSFQy7w6rx7hk=;
 b=GsaNO/jGuO9UsgvbwFO/r3zdC8yL/s5GxCJyi/GEhf9qgWv2a6/v+uvSeAputI5P/P
 B4lEnyn6PBB4jjC+nKJmbxtEmBqZXfPXOOq42X4o2ZKOoHDyShCnM8wFHVbMUmZqdIYI
 MCX9hpmcwBFm/wQddvAafGBbgBxyL3ikChCXBUzJQd/i1H/B2alfLnzEUQYgyFPEpb83
 uHC7ro7UPED/tDwQHwGtPrnwYXCJc/4/paunARNsy9w4N8pW1LQfIDjxb9X/7dLyX8Ha
 zk/8ZqU0wFi+gnDXC+i8w0xZl6lDvo1DT3yGNGkqgo3RODD0w0ZzC+rIPPJV+4wSKqY3
 SM+g==
X-Gm-Message-State: AOAM530V1ZX7SmmlhU6kDMK0Q9B9LB8gXFWwfa/cvAVvHn5VlRuf/8gj
 M+2qAZHS/Vo94YGuEsNOO3k=
X-Google-Smtp-Source: ABdhPJxQMj3rdaHIXuRMZj5WvqHmuLSyZJdxQt5grv3s0WQ8VbaQPKAquYH542Kk6vf3/g6CY1mFVA==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr83557534wrt.337.1609841157520; 
 Tue, 05 Jan 2021 02:05:57 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s13sm3396776wmj.28.2021.01.05.02.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:05:56 -0800 (PST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
 <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
Message-ID: <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
Date: Tue, 5 Jan 2021 11:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Richard,

On 1/5/21 9:34 AM, Philippe Mathieu-Daudé wrote:
> On 1/5/21 12:30 AM, Richard Henderson wrote:
>> On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
>>> MIPS 64-bit ISA is introduced with MIPS3.
>>>
>>> Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
>>> and the cpu_type_is_64bit() method to check if a CPU supports
>>> this ISA (thus is 64-bit).
>>>
>>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  target/mips/cpu.h       | 5 +++++
>>>  target/mips/mips-defs.h | 4 +++-
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> I still don't understand this as an alias, as opposed to a separate bit.
>> (ISA_MIPS3 | CPU_MIPS64R6) does not make sense, because R6 removes instructions.

Well, FWIW (ISA_MIPS3 | CPU_MIPS64R6) is what we currently have:

#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)

#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)

#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)

#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)

#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)

#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)

#define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)

#define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)

So CPU_MIPS64R6 -> CPU_MIPS64R5 -> CPU_MIPS64R3 -> CPU_MIPS64R2
 -> CPU_MIPS64 -> CPU_MIPS5 -> CPU_MIPS4 -> CPU_MIPS3 -> ISA_MIPS3

This patch doesn't make it worst :)

> I now understand your concern.
> 
> I based the decodetree logic on the R6 ISA manual, decoding the
> bits from the more recent feature (a leaf) to the root, following
> this tree:
> https://images.anandtech.com/doci/8457/MIPS%20ISA%20Evolution.JPG
> (2.3 Evolution of the Architecture).
> 
> Also "2.1 Historical Perspective":
> 
>   In the MIPS IIITM ISA, 64-bit integers and addresses were added
>   to the instruction set. [...]
>   The MIPS32 Release 6 ISA maintains backward-compatibility, with
>   the exception of a few rarely used instructions, though the use
>   of trap-and-emulate or trap-and-patch; all pre-Release 6 binaries
>   can execute under binary translation. [...]
>   The MIPS64 Architecture is based on the MIPS V ISA and is backward
>   compatible with the MIPS32 Architecture.
> 
>> But if this is an intermediate step,
> 
> As this isn't planned as intermediate step, I'll try to keep
> CPU_MIPS64 as a separate bit and post the result.

I'm not sure it is worth the effort, as I plan to check each ISA /
ASE bit from the CP0_ConfigX bits (similarly target/arm/ does), so
these definitions should disappear eventually.

I.e. for the MSA ASE see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg767523.html

 /* Check presence of MSA implementation */
 static inline bool ase_msa_available(CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }

Might I keep your R-b tag for this patch (eventually improving the
commit description with some of the info added in this mail) and
keep going?

Thanks,

Phil.

