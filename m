Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F523DD6D0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:19:25 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXqm-0001gQ-9G
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAXoy-0007GI-BN
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:17:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAXow-0005Ge-Ic
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:17:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso3602399wms.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2rRxgMyPozNRgg1x6qZT9yAqSeJCzx4sMp4tZ0Wxfvs=;
 b=QWECc/APlnDAhisnqKB9+cUY+RAfR/jnxK62gJERpUQeBRcI1WvLMlbjvmsf6+a1Fp
 idnK84IU3HRLvgKl3oyj0dSQPqEaL1cLT9CJpa1JUmMlQrFTiWK9vgOdcnoJSVXH0RtR
 Ojrmsv+BBFoohg7mH/FVATgAbbJuozk91R8PL87GPp3uyOzeay1pgLCimg8Fy2+z1NNq
 l14iYpRfQVy/O8nGRRp/8axC9dhLVIc4avDnrtvdMqW9VZycpvLF8kj8X0kyCGTo1gkn
 CQAcN+hY2fGkh8x/xfZaYjMJEnhF/sAZU56uCt4imGXKjJHUPRY91/XsVsCN01zWMbZM
 Vk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rRxgMyPozNRgg1x6qZT9yAqSeJCzx4sMp4tZ0Wxfvs=;
 b=arbaZHGk+W2Fyic3WvXexv4Lk9ItXkcaqKfOUleLZROFeUCJ4xGf6jAFjFm2j2rDz1
 z/uqM3gqT/plAn4C8LQhYEzOs7ezFyyLj0H8GwBpoYhePP430GQ8wnVMhVzmLwYPtcCF
 JNHUtS0AluoCpGL+nD4xsSTz0emG9zfFRZmLyhuxdZ8rOSFVuyYiC/yAA2IGLWuDF9oc
 Y9oqUWdHEphwKZnJotJhnFKDSv8+mqJdN7slAHGQaHAz71behQSuLWlKc0+t39U+oL6R
 OBABjUEaDod2NDj1VaudvbNS126D1/oRWWRGPFBv00BDhfSWik/CBL6JTI8tB37vEEwd
 G6sA==
X-Gm-Message-State: AOAM532LL0a07NavQRNmpcUqY3USNdFhH/BvE3XJwJitZXJuG9ZFO8/j
 H4XMj+vnbJhAsMwStCBXRlw=
X-Google-Smtp-Source: ABdhPJzAirCso0lgK6P9NSw4aAbp7kM2ykDxWbuwiN+C9aBO/2eo7C+HY0AYABm+YtD4iFTpGSEg4w==
X-Received: by 2002:a05:600c:3653:: with SMTP id
 y19mr17100508wmq.147.1627910249221; 
 Mon, 02 Aug 2021 06:17:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c15sm11420849wrx.70.2021.08.02.06.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:17:28 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] target/mips: Remove MOVZ/MOVN opcodes from
 Loongson 2E
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <20210731144155.2738493-1-f4bug@amsat.org>
 <47f2912c-4933-aa78-de1d-f85884fddded@amsat.org>
 <alpine.DEB.2.21.2108021412470.62025@angie.orcam.me.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0fa9bc3e-e057-5516-c234-6c98ca8f1a0e@amsat.org>
Date: Mon, 2 Aug 2021 15:17:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108021412470.62025@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 yangxiaojuan@loongson.cn, Song Gao <gaosong@loongson.cn>,
 Mark Shinwell <shinwell@codesourcery.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 2:18 PM, Maciej W. Rozycki wrote:
> On Mon, 2 Aug 2021, Philippe Mathieu-Daudé wrote:
> 
>>> Per the "Godson-2E User Manual v0.6", the Loongson 2E processor
>>> does not implement the MOVZ/MOVN instructions
>>
>> I'm confused because I can't find MOVZ/MOVN in the 2E manual and
>> the 2F explicits the difference. However looking at binutils,
>> these opcodes are also emited on the 2E:
>> https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=350cc38db21f1cd651a6d46687542a0fce5e0303;hp=569502941afa825c5278b320ccedeefc82e8ed0e
> 
>  I find the manual a bit messy.  It does say however:
> 
> "3.2.3 Instruction set mode
> 
> "Godson-2E processor implements a full feature MIPS III Instruction Set 
> Architecture (ISA) plus some MIPS IV ISA instructions, like paired single, 
> move condition and multiply add."
> 
>> Cc'ing Mark & Maciej in case they can enlighten me, and few
>> Loongson develeper in case they could check, because I don't
>> have 2E hardware to test.
> 
>  At least this trivial program:
> 
> int main(void)
> {
> 	asm volatile(".set push; .set mips4; movn $0,$0,$0; .set pop");
> 	return 0;
> }
> 
> does not trap on actual hardware.

Thank you very much for your time and testing!

> I may not be able to find time right 
> now for a more exhaustive test.

This is fine for me now, I'll add documentation to justify while the
the documentation doesn't describe MOVZ/MOVN, it mentions "implements
MIPS IV ISA instructions like move condition" so we assume they are,
also with your test not trapping.

Regards,

Phil.

