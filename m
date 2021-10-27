Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B376B43C0E8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 05:42:56 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfZq3-0002Kl-Qz
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 23:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfZok-0001ZX-T7
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:41:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfZoj-0007eH-9C
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:41:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso5029021wmc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 20:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=o/VUjPRP20xqIeo/7Z4PtzKf1LBvMF39qPqHQjfdxi0=;
 b=DB/H6vF5cGgCLOTOlVZc5x3hzryXR1roIXJlQo74H5mwPjj2UopwbhcYUrRKH8Arqk
 LlZTdjvC5RTYQiARNO1OkvEM2xel2xoKqCbZXxWM3aPP+VNBYYrHpmpOxhY219/BTH/M
 9Q7xEAuCU+D5Hdng/pmZzXHSrE0KkWGyAN4Qwp9tZ/v+ssIrs4Ac5kOcK923lpSWk7XK
 qICqZV2/Xec8mY7tFl2QexAyHA5kv4ZaFOidpLTsA47+3a+KsyXakhQKAQ/9Ds3pnnrT
 hsUVmSuSur/+0zVNncGHiXp40hO2E9ghgLm54Db8Mc7hQZJfx85iMCxELA9iWlH+Gopp
 3h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=o/VUjPRP20xqIeo/7Z4PtzKf1LBvMF39qPqHQjfdxi0=;
 b=qg7nyhGiNiNIqS748Wgs1SWyC5MIZoG33I+eaBBI1jww82kE1WeLkUe6jztMfocOdm
 Uo8l41JCOE+fynPu+TrlkFJHbBpNcUgcLTAjUqCHtzSopWu3rNUC/g858F+kLlawJSRR
 ixMIR3iN0N+6wEs5PdwG0DgZRbHvRAMtpWAJj3RAWJG73UW/CPKTU5mOnakRNzN8+TT8
 iqVebo1gTrj52LbpzRArD0EULzqhn0O/kjUDYXLFPZXj/GbAmGKtvWfok4ZEeIV7HEos
 tAZgwH9X7jUpuDud0bZarGdeSMNV/BKjmL7Tmnl8obaj7BDwcFSkvIa3n3YAQptYBPEM
 p4xw==
X-Gm-Message-State: AOAM532Azoc1PFcmOt2TR69uHESiUziIzps0PyTQ5IVZjmrOk3nJXDJL
 TmDMOOVS9WbThBBfOBpeEp6ikVLChko=
X-Google-Smtp-Source: ABdhPJzrSj78TwSh/jtbkosVWSiqVpIW1MfF5ll8oZt9ByVvkNln0HeoKS1BLvx+Qp3WrVq1+j1vBg==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr3010176wmp.43.1635306087087; 
 Tue, 26 Oct 2021 20:41:27 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v191sm2172734wme.36.2021.10.26.20.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 20:41:13 -0700 (PDT)
Message-ID: <58c4a298-4f22-c7f2-e754-3ac802c50ee2@amsat.org>
Date: Wed, 27 Oct 2021 05:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC
 hardware
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paul Burton <paulburton@kernel.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-3-f4bug@amsat.org>
 <bac271eb-bae1-d13f-5605-b82559222ef1@amsat.org>
In-Reply-To: <bac271eb-bae1-d13f-5605-b82559222ef1@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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

On 10/12/21 00:21, Philippe Mathieu-Daudé wrote:
> Hi Paul,
> 
> You are the maintainer of the Boston machine which is the
> only one using these peripherals; would you agree to be
> (co-)maintainer of these files?

I am going to respin this patch removing Paul name.

> On 10/4/21 11:25, Philippe Mathieu-Daudé wrote:
>> MIPS CPS and GIC models are unrelated to the TCG frontend.
>> Move them as new sections under the 'Devices' group.
>>
>> Cc: Paul Burton <paulburton@kernel.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  MAINTAINERS | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cfee52a3046..a5268ad0651 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -239,14 +239,8 @@ F: target/mips/
>>  F: configs/devices/mips*/*
>>  F: disas/mips.c
>>  F: docs/system/cpu-models-mips.rst.inc
>> -F: hw/intc/mips_gic.c
>>  F: hw/mips/
>> -F: hw/misc/mips_*
>> -F: hw/timer/mips_gictimer.c
>> -F: include/hw/intc/mips_gic.h
>>  F: include/hw/mips/
>> -F: include/hw/misc/mips_*
>> -F: include/hw/timer/mips_gictimer.h
>>  F: tests/tcg/mips/
>>  
>>  MIPS TCG CPUs (nanoMIPS ISA)
>> @@ -2271,6 +2265,22 @@ S: Odd Fixes
>>  F: hw/intc/openpic.c
>>  F: include/hw/ppc/openpic.h
>>  
>> +MIPS CPS
>> +M: Paul Burton <paulburton@kernel.org>
>> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> +S: Odd Fixes
>> +F: hw/misc/mips_*
>> +F: include/hw/misc/mips_*
>> +
>> +MIPS GIC
>> +M: Paul Burton <paulburton@kernel.org>
>> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> +S: Odd Fixes
>> +F: hw/intc/mips_gic.c
>> +F: hw/timer/mips_gictimer.c
>> +F: include/hw/intc/mips_gic.h
>> +F: include/hw/timer/mips_gictimer.h
>> +
>>  Subsystems
>>  ----------
>>  Overall Audio backends
>>
> 

