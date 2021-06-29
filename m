Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFD3B6DFC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:42:18 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly6Vl-0000Vx-F7
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly6Tl-00089d-QB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:40:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly6Tj-0005JB-Ni
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:40:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id g7so19591098wri.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9KBX9oKLvSi15HGp1j4qDcTqaSVJ6YzBTHOMiTBNoMM=;
 b=g+JqFYiYoSAAXp7se8JjdHdqg+5EI5CaYs5s0iVMZR5CKy572Fy344AC5ThblFHKdy
 9vafVP4Rq+vr60o/L82dVwck/DPMiTyyuHUbBfNQidARa5mwDlsNS2AA4s7s7Z7ilq4w
 NQU7BukSEAvtoqpm+woCWBUDk1dHqNh7sEx+0fSb+JA4rRHMOw13kWB6+4nufdGg46LW
 2OcZal8AU/llWMbM2Vx8zqJtxXamMkpNt0JLzf1C3qSJVnORKuOERQFzx+7x0dCv6/Ix
 Ba8QLAtud+8VWyAJ4et71bFlSlBMwYjPTu4uLUylyj35iBiXvFwW0zA921KDFyz4QKh3
 AEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9KBX9oKLvSi15HGp1j4qDcTqaSVJ6YzBTHOMiTBNoMM=;
 b=UqixAUHMHu4KTXz/RJWE7yxxx8yOQp14VxamlNqpDhSY8Aszx3fWtOessa2nEt6ST6
 lCyhRyXy8tq6hqrBhhzlO3OxOs9lXL0Owu3NrtQ1lfY5hc1sOsRIgldu+wqzl09Hon+O
 sL3ok6uv+e+F2qzBJAhBBDeTGnI90PoQD01cEhLu5Oi09EpE+obU66gg7+JiVZwv2OT/
 1TXUGdkhbx11IRxE/p1le1KNPGRvjy2MqWfZrUQvGLTYfdGtPee6jBhPTqiHMRfSFvuA
 83leSsz/CqjChusPGLsNuSuNklK0+X5iFY26/ZHvk1o29Yc04UZLNrLCj+YHruP4tkSC
 N8OA==
X-Gm-Message-State: AOAM533gd/IdVPehqA+f7JEnqcDZztG2YOgaCYOxb5ngVhbS5nY9OM8u
 hLDryehYRCSwTs1H8szvSh4=
X-Google-Smtp-Source: ABdhPJy+X0YjaiY03rqKaBQ/2rVVJCAyTiZBw2ePqP5TNFQSwpGS/XtwqQ3tir2vSV/7c40cbyqXbw==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr31442769wrt.296.1624945209952; 
 Mon, 28 Jun 2021 22:40:09 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t64sm15480533wma.44.2021.06.28.22.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 22:40:09 -0700 (PDT)
Subject: Re: [PATCH v2 00/28] target/mips: Explode 60% of the 32K-lines
 translate.c
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <ae2fd653-b326-6534-60ad-00bfafd63ff7@amsat.org>
Message-ID: <f9cfa1eb-7e2b-ecf4-a908-dee1f3be6220@amsat.org>
Date: Tue, 29 Jun 2021 07:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ae2fd653-b326-6534-60ad-00bfafd63ff7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 12:08 AM, Philippe Mathieu-Daudé wrote:
> On 11/23/20 9:44 PM, Philippe Mathieu-Daudé wrote:
>> Since v1:
>> - Addressed Richard review comments
>>
>> Patches missing review: 1,3,4,21,22,25
>>
>> Hi,
>>
>> This series, while boring, helps maintainability.
>>
>> I simply exploded 60% of the huge target/mips/translate.c,
>> reducing it from 32K lines of code to 13500.
>>
>> The small overhead in the diffstat is due to entries added in
>> MAINTAINERS and license boilerplate addition:
>> 20225 insertions(+), 19987 deletions(-)
>>
>> While being a massive diff, it is a no-brain review using
>> 'git-diff --color-moved=dimmed-zebra' which highlights very few
>> changes: #include and license lines.
>>
>> The exploded new layout, which allows more useful filtering
>> with the get_maintainer.pl script, is:
>>
>> - MIPS ISA, ASE and modules:
>>
>>  . isa-micromips_helper.h.inc
>>  . isa-nanomips_translate.c.inc
>>
>>  . ase-mips16e_translate.c.inc
>>
>>  . mod-dsp_helper.c
>>  . mod-dsp_helper.h.inc
>>  . mod-dsp_translate.c.inc
>>  . mod-msa_helper.h.inc
>>  . mod-msa_translate.c.inc
>>  . mod-msa_helper.c
>>  . mod-mt_helper.h.inc
>>
>> - MIPS Vendor Specific:
>>
>>  . vendor-loong-simd_helper.c
>>  . vendor-loong-ext_translate.c.inc
>>  . vendor-loong-simd_helper.h.inc
>>  . vendor-loong-simd_translate.c.inc
>>
>>  . vendor-tx-mmi_translate.c.inc
>>  . vendor-tx_translate.c.inc
>>
>>  . vendor-vr54xx_helper.c
>>  . vendor-vr54xx_helper.h.inc
>>  . vendor-vr54xx_translate.c.inc
>>
>>  . vendor-mxu_translate.c.inc
>>
>> There should be no logical code change (only code movement).
>>
>> The series is available at:
>>
>>   https://gitlab.com/philmd/qemu.git tags/mips_translate_explode-v2
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (28):
>>   target/mips: Use FloatRoundMode enum for FCR31 modes conversion
>>   target/mips: Extract FPU helpers to 'fpu_helper.h'
> 
> Patches 1 and 2 queued to mips-next.

Patch 14 now also queued.

