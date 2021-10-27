Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467C343C1CD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:43:41 +0200 (CEST)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfamq-0007Bh-7l
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfalW-0006T8-Cd
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:42:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfalU-0008PD-G7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:42:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d13so1818495wrf.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i+RvLcioqyZge6E/ZtYfti7CRhrbbFUhUiC71Py2Gbw=;
 b=a2235nMSnvhl6oUaUSdxCCtZyby0CwAqoHgv4OdGAPFOKZlZaAlJj7RWOkyXshlB15
 7h4QL3fnnlXQIFhZaLaHvr8I1Y3B9YmuasTpI9LApoHysVEZRjsNGZCikTasELtFzyYb
 XLz3suj/MgTmmwGaGjXjJMjb1ff8ArcFXYHOVvR9vQszeDMeZ0mj184Vgy832JU12Xds
 8yuPyKP1kMz/UCmbCYD4gO1isEqdDb3dJj8woLL9VoM2Qm/QAvLSHd6nMYrtGPuk96Dr
 a8MMo5m1mesg0vkB0JfDQJE7YZPsoz0RvW8vUiiR8AUHdwgPn7VgJkYX/rgUVxLgxFcv
 dYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i+RvLcioqyZge6E/ZtYfti7CRhrbbFUhUiC71Py2Gbw=;
 b=qfRi2IxMm9CapwQSEsX6blrfEyka14C1G0/pMZ3X+W/m0fOw833bwlEqIQ4crgcwUU
 pV46c8qoES1ToRsqx0hgL4JJHfmbvHJGASLgn8xFCDRV47NZnhla8zako3HShmH+0v84
 aPr/gLWkkhPV89tANBezxJPIevPdf7ps5oTtER7MntGr0hwIoU70TcyfYw1aN4xxrPYp
 fbzQoApy13ErV9YpBOHzjKdlEmA08B7K/Ac3kMofudrQsDY7+5LLsR2KCxYiN953Z7jr
 hKOWWbLFKbVWIcx1mw+HrVxxta0e2eiRLeTiDFH3gi5I09RktD6eGVjTSisFPmG05ZOa
 Pm6Q==
X-Gm-Message-State: AOAM530YswFLy5hlKugkBZq3uCjsCnVoCS8uPTESuben8SQnlcx2D9Ej
 QVyOAU2V5W9p7MpNOduk7/k=
X-Google-Smtp-Source: ABdhPJygUwDYiSDJZ0C2qM+TZu1vdhwXh/JKyZfExcsQzaqnmCrK6a2QHxtqY23hGmM3oVBpw5YFIQ==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr34417291wru.121.1635309734948; 
 Tue, 26 Oct 2021 21:42:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v185sm2306940wme.35.2021.10.26.21.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:40:43 -0700 (PDT)
Message-ID: <2e025148-5840-50ef-3a2c-14930700073e@amsat.org>
Date: Wed, 27 Oct 2021 06:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/avr: Optimize various functions using extract
 opcode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211003142142.3674844-1-f4bug@amsat.org>
 <f366b3e5-cf3d-d2b7-b7ef-3ec79568a164@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f366b3e5-cf3d-d2b7-b7ef-3ec79568a164@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/3/21 17:24, Richard Henderson wrote:
> On 10/3/21 10:21 AM, Philippe Mathieu-Daudé wrote:
>> When running the scripts/coccinelle/tcg_gen_extract.cocci
>> Coccinelle semantic patch on target/avr/, we get:
>>
>>    [DBG] candidate at target/avr/translate.c:228
>>    [DBG] candidate at target/avr/translate.c:266
>>    [DBG] candidate at target/avr/translate.c:885
>>    [DBG] candidate at target/avr/translate.c:924
>>    [DBG] candidate at target/avr/translate.c:962
>>
>> Manually inspect and replace combinations of (shri, andi)
>> opcodes by the extract opcode.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/avr/translate.c | 16 +++++-----------
>>   1 file changed, 5 insertions(+), 11 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Do you mind taking this patch via tcg-next?

