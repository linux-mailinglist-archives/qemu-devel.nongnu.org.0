Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E192E2CA364
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:03:24 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5JT-0008TJ-UQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5Hb-0007Vm-Ss
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:01:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5Ha-00051x-9e
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:01:27 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so2632426wml.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tfOZg2leuzNMH91HB6vcEDxpMsntimCMXk6iW9QpREU=;
 b=QtPg8Q97ejwy6sIH7hDMSnQhrhu6IY2p0W34NLetfEF+JYr6Y05dFSTSTGBkV3yGW1
 rJHYU1pSqmLgYLQmqonp5JqbsFXX3pHhp3OF0E8Uml2jzQibdmxbFiZO+ieU1XPRW7dn
 c3djzA211BgaP8kbU1XR/9/S2xkegjc87/ycbA/hSiM2Y329zA8DydmqzSl5TLZHOyUK
 0IbzqZK1jt8HLu+gqQsl2MSI2B9xXy5Qe6Jxz2yxq4aVcqXJep8HusZuGvWEAOqVJUtQ
 AU0YCpTYEnITKRXAvQa32OE8lA41RBOxpW5W4+Cw2by3YZHVvrcrllJ6VpszryYbHTeB
 ObHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tfOZg2leuzNMH91HB6vcEDxpMsntimCMXk6iW9QpREU=;
 b=pHX3VCLPaF9SRProXUPRrsb08jvXl88N+kBeZTulzDUgAlRBK0nth6kdhLGfdsEzm9
 hag/PEnzothegeJQAuFkQ5qqUG/OgWZYG5kB3vnHaKkWWVe+V7Ci8ASsPVqfXapOpz49
 aWU8aYkKYvouylqniPuxu5l5KIMrFj91m8JC485TwlvWR8S1F1Qa4zIq+BLEnTk6S+L8
 Q55zUkDXOwW6csQyRAi0yDVglHZ9GCubteJAtBsNe2LMnBVj9QjyabOBDpvzaha2Zkui
 L7h8bgBzGUczpW/MNgiV0lJHdGrzVUI0tIMcnlLP4OsDjbhtKy4lMN5Gmc/1jO3L2GZG
 +dJg==
X-Gm-Message-State: AOAM532L4JVyCqmLx2rO/wiaKNeWWuyUwXQOb+GqqY4niM+IOSDMdHTh
 uHg+y8taG9lQ2qLxzM9EOAA=
X-Google-Smtp-Source: ABdhPJxKB4LjWEIJJB4mdU99B6N2RgecAms8fRHalfliQvFFlAjAiJOGQhmXUO9bhxDog7UNIWT5sw==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr2480158wmj.42.1606827684495; 
 Tue, 01 Dec 2020 05:01:24 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id m4sm2694547wmi.41.2020.12.01.05.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:01:23 -0800 (PST)
Subject: Re: [PATCH 2/2] linux-user: Add support for MIPS Loongson 2F/3E
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201201083951.2745111-1-f4bug@amsat.org>
 <20201201083951.2745111-3-f4bug@amsat.org>
 <CAAdtpL4koHjJrbW+HyykN34YtYH45SXyiUs9OaSVnJsN1cCdsA@mail.gmail.com>
Message-ID: <b5f182e9-46d5-07fe-60b7-5230036df297@amsat.org>
Date: Tue, 1 Dec 2020 14:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4koHjJrbW+HyykN34YtYH45SXyiUs9OaSVnJsN1cCdsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 9:45 AM, Philippe Mathieu-Daudé wrote:
> On Tue, Dec 1, 2020 at 9:40 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Userland EFL binaries using Longsoon SIMD instructions have the

Well I'll respin to fix the EFL -> ELF typo.

>> HWCAP_LOONGSON_MMI bit set. Binaries compiled for Longsoon 3E
>> have the HWCAP_LOONGSON_EXT bit set for the LQ / SQ instructions.
>>
> 
> Eventually I can respin with references:
> 
> 2F since 8e2d5831e4b ("target/mips: Legalize Loongson insn flags").
> 3E since af868995e1b ("target/mips: Add Loongson-3 CPU definition").
> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/elfload.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 17371f8b8cd..be82fcb2c0a 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -1012,6 +1012,8 @@ static uint32_t get_elf_hwcap(void)
>>
>>      GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
>>      GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
>> +    GET_FEATURE(ASE_LMMI, HWCAP_LOONGSON_MMI);
>> +    GET_FEATURE(ASE_LEXT, HWCAP_LOONGSON_EXT);
>>
>>  #undef GET_FEATURE
>>
>> --
>> 2.26.2
>>
> 

