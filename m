Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FAC410577
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:31:46 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWhF-0007W8-Ng
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWfG-0006kB-Dx
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:29:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRWfE-0001f5-Tf
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:29:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id d6so19095651wrc.11
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2UGkGTVf3XdY2MLxODODzC1bLQbsnsFlLtiWf19vMKY=;
 b=aT5Vkm+pgS9VHgF5/Fx0yXRfGnBSOiV9pCwLBiwiX686yutIEY2OG1iU2cvWoDII8M
 EwKJy6hZmxi7vAfN8yIAzF3oEM3k46z6I1Nyo8gc57Zo+NaSZNWtaqyJRJvevSnDsMm0
 pf6+k3MzNwzdhDIi84blagxd3Xk7zqwKqMjnPoEyMFHSLPhP+IlDiDf6+FTFaEP8uHft
 3ebT2am5t4IgzcPA4UVSkDQPG2g9rtUW8J+EAW8Nzh0A2JqlTgYbyCyLwAoo4KT+kAnd
 mlrkZKDz3vXdPMaKBhcAGlcJBv4yPx6WgES6MXpX3VveF3Yav0OOkqmdrp8MSaVdeX77
 buRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2UGkGTVf3XdY2MLxODODzC1bLQbsnsFlLtiWf19vMKY=;
 b=lQyF0o7At+aVIrmkCxXzwVliD6NnfB6cjXB5QXM6ObUgyy3ftkvYUpek6z6x2dDXHw
 B17sprjOVoSxlw8+/Xctq66oZkuI+Mlcfo3KMelympTBtyRyXippEwpO7Hyb4AiXKobY
 Gzr2soEKDv3jS5oBtoLHtfYjZw+9QrmWrTpMy9aNkcCvlB2GjpipCIeEoOivfMqMlTTz
 Q20gOxwDWNu//lwmzGFgPdHMZt1OBK6/nPtiAXTJaML/k90htvLbf6I3nLAwfmDHimDq
 9eYjIL/U7cUDUSV0gm8QffK+sy4siUvpvkyDRgT8XUrlYQ9hqZTdgaRTJZSFgHr2REop
 2iHg==
X-Gm-Message-State: AOAM532FmoHznXelOKpYeF/++XI/yL3wt2sC9ytPQHR8hYoQxbtQh/Gk
 OWWfa9iqkvHGGgcBhY5gmnk=
X-Google-Smtp-Source: ABdhPJw2kAx6ZLSGeutinF0NuHJbN7eL0UgCnOJ8KpS0sGtvSINv2LxGEMk//AKBk8ALggnr9uN24w==
X-Received: by 2002:adf:f207:: with SMTP id p7mr17109232wro.166.1631957378567; 
 Sat, 18 Sep 2021 02:29:38 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r129sm9251207wmr.7.2021.09.18.02.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 02:29:37 -0700 (PDT)
Message-ID: <01de4f7f-dff3-3f27-dead-de4599f209a4@amsat.org>
Date: Sat, 18 Sep 2021 11:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH-for-6.1] target/mips: Check nanoMIPS DSP MULT[U]
 accumulator with Release 6
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210727083043.1504402-1-f4bug@amsat.org>
 <2ac421d3-d462-0bb2-dbf5-c8ae56eef075@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2ac421d3-d462-0bb2-dbf5-c8ae56eef075@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 18:38, Richard Henderson wrote:
> On 7/26/21 10:30 PM, Philippe Mathieu-Daudé wrote:
>> Per the "MIPS Architecture Extension: nanoMIPS32 DSP TRM" rev 0.04,
>> MULT and MULTU opcodes:
>>
>>    The value of ac selects an accumulator numbered from 0 to 3.
>>    When ac=0, this refers to the original HI/LO register pair of the
>>    MIPS32 architecture.
>>
>>    In Release 6 of the MIPS Architecture, accumulators are eliminated
>>    from MIPS32.
>>
>> Ensure pre-Release 6 is restricted to HI/LO registers pair.
>>
>> Fixes: 8b3698b2947 ("target/mips: Add emulation of DSP ASE for
>> nanoMIPS - part 4")
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/mips/tcg/nanomips_translate.c.inc | 6 ++++++
>>   1 file changed, 6 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, applied to mips-next.

