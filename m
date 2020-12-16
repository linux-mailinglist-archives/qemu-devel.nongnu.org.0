Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899982DBF20
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:01:48 +0100 (CET)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUZ1-00023P-HV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUWY-0000da-RF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:59:14 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUWW-0000i5-SL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:59:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id e25so2026914wme.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lzxWfptX4BKMRnrPgmvlCAhfzeZueon8Z3MF5SLFZEE=;
 b=cZecBOVDcIAJcBNHKfUDrWzrwFzo1Ri01V3J4FCJbe1sZYodiOxt065aRGRm9c20kE
 OANI5ydHhk0fersfRdn6Q6g7zhpDGPdqbFwnQm+L+2iUqdNxeGhmKbv6cNaUzt7zENEY
 5I21dRsnazqR6z9MKB6IjCzaa3CHJlRrG05llU9nPuXhz57aDaU38yISimJ3zwU3BQ8A
 YjQZn7najPsBMfgwB2StrCcEO6PSt8NWnqTdN14fZUZI+qfYLPEZ/9dhKRW7//0tpFiz
 YdJBXdTQ637+tylKToFLfvHAh4CKB1gwjSTW2hsBowSDL0rAQny0BNtkAwAf184meMdQ
 FMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lzxWfptX4BKMRnrPgmvlCAhfzeZueon8Z3MF5SLFZEE=;
 b=GIJYX+w8ldAcylRnb6UsMIM2TYjFizotkGAifPHdvElpAqD3qD5y9cXurEAqZPfYjg
 gj71KgELUOqPL8tndlOccCkPfrzmK7SQh2AfaOEWp86+Kd/DohrjHXl+nvcvzfpq0HjN
 /s5Q+Vilvumu4CaUznfNnyGLVo2ihtqJFS+29UiajCmTL/hAusJN27qHtXyPuFG/DXAe
 NZK5hIRBbVG3lvqzejr6j2py+r7OBiMWOhE7QbmB8B3XjVq3g2w2NNMkiuFz4ptC6W4o
 Ur/ea5wV5Vgs+FwSH3PZf8foh8ZLlMZ/hsr7R5uXz004pSEFbefWE+PHIDXXIDsB+tlt
 pQOw==
X-Gm-Message-State: AOAM533PYnMjLCq24QM8svJ05lVht/fhvktBF4ZrSC2egraL7S/+YdSR
 emubZc4NVhsGbFN+oYyQDmE=
X-Google-Smtp-Source: ABdhPJwMbMjvF+SQtZUWn90z1HMQr34dUeTi7uDzMvGRdaq1MTs0DkRZ02Evh3UHUq6MTI0JHu0jxg==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr2750496wmc.186.1608116351362; 
 Wed, 16 Dec 2020 02:59:11 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h29sm2632534wrc.68.2020.12.16.02.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 02:59:10 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
 <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
 <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
 <5977d0f5-7e62-5f8a-d4ec-284f6f1af81d@amsat.org>
Message-ID: <c969a2ab-95bc-8a83-6d59-0037ba725c2a@amsat.org>
Date: Wed, 16 Dec 2020 11:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5977d0f5-7e62-5f8a-d4ec-284f6f1af81d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 11:50 AM, Philippe Mathieu-Daudé wrote:
> On 12/16/20 4:14 AM, Jiaxun Yang wrote:
>> 在 2020/12/16 上午10:50, Jiaxun Yang 写道:
>>>
>>>
>>> TBH I do think it doesn't sounds like a good idea to make 32-bit
>>> and 64-bit different. In fact ISA_MIPS32R6 is always set for targets
>>> with ISA_MIPS64R6.
>>>
>>> We're treating MIPS64R6 as a superset of MIPS32R6, and ISA_MIPS3
>>> is used to tell if a CPU supports 64-bit.

I suppose you are talking about the CPU definitions
(CPU_MIPS32R6/CPU_MIPS64R6).

> 
> Which is why I don't understand why they are 2 ISA_MIPS32R6/ISA_MIPS64R6
> definitions.

My comment is about the ISA definitions:

#define ISA_MIPS32        0x0000000000000020ULL
#define ISA_MIPS32R2      0x0000000000000040ULL
#define ISA_MIPS64        0x0000000000000080ULL
#define ISA_MIPS64R2      0x0000000000000100ULL
#define ISA_MIPS32R3      0x0000000000000200ULL
#define ISA_MIPS64R3      0x0000000000000400ULL
#define ISA_MIPS32R5      0x0000000000000800ULL
#define ISA_MIPS64R5      0x0000000000001000ULL
#define ISA_MIPS32R6      0x0000000000002000ULL
#define ISA_MIPS64R6      0x0000000000004000ULL

> 
>>>
>>> FYI:
>>> https://commons.wikimedia.org/wiki/File:MIPS_instruction_set_family.svg
>>
>> Just add more cents here...
>> The current method we handle R6 makes me a little bit annoying.
>>
>> Given that MIPS is backward compatible until R5, and R6 reorganized a lot
>> of opcodes, I do think decoding procdure of R6 should be dedicated from
>> the rest,
>> otherwise we may fall into the hell of finding difference between R6 and
>> previous
>> ISAs, also I've heard some R6 only ASEs is occupying opcodes marked as
>> "removed in R6", so it doesn't looks like a wise idea to check removed
>> in R6
>> in helpers.
> 
> I'm not sure I understood well your comment, but I also find how
> R6 is handled messy...
> 
> I'm doing this removal (from helper to decoder) with the decodetree
> conversion.
> 
>> So we may end up having four series of decodetrees for ISA
>> Series1: MIPS-II, MIPS32, MIPS32R2, MIPS32R5 (32bit "old" ISAs)
>> Series2: MIPS-III, MIPS64, MIPS64R2, MIPS64R5 (64bit "old" ISAs)
>>
>> Series3: MIPS32R6 (32bit "new" ISAs)
>> Series4: MIPS64R6 (64bit "new" ISAs)
> 
> Something like that, I'm starting by converting the messier leaves
> first, so the R6 and ASEs. My approach is from your "series4" to
> "series1" last.
> 
> Regards,
> 
> Phil.
> 

