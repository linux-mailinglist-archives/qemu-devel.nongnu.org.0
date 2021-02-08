Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE3313852
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:44:15 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98hy-0005vk-Jl
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l92ex-0006vC-I6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:16:48 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l92eo-0004Er-4D
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:16:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id g10so16217972wrx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HT+FSxCcCHvoAX4vCs+7KSGDR3k885dWpose2DGZgIY=;
 b=nsF/K4SSDNPZBSlbr9v6j/xOzUF4NHIO28RRvcvP1CXpYuCbjSBrEQdeoEtEuV/GvP
 srvlc83IbNI8ohBEswXodzaOdGhoWXqJ4+6FCwgaG+z6Gn3klf+KCzYpzZMHEjhAJIRo
 ZLDugZI4mL7rj4Nf0hlmkCYregWD4MW5BmCAzv4pFTkLzsB2zwdTRWeJuPZq8xI5FsiA
 qgLrVGVi7UGK1w7nm+bYqtel5kRLBjF4WLD0YCs51RLPcpiJej+Sz+SxNcRLCsuLJ4E0
 XdM32mTKpcSoKRS0MnX4g55qABeYgBh3yw3ry645FN+T6V5DtvcsTiUNnSTN0vfOgZVB
 KYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HT+FSxCcCHvoAX4vCs+7KSGDR3k885dWpose2DGZgIY=;
 b=llvHfB9nvv5EWzdRFY8qmOt/LIJ9HzsDaqk7UaErFppsa5WvMbw9Soq5auHI17RBeX
 LXPDYJ9uSTiKwCs/iy7AXu7BlaqSNyE6pORyUavJ51GzgDswxO+3Pbcpzm6tb79vS7v7
 XlLGKYrv6L00tOxB9qvNFNzObbujjcrMpOZmb7QQ01k6C8LpPVfDWv2MqvIGvSOOrRKI
 MaizE63KC8l6gAUpPZ/5DvLpE9ed8M1i9bvHOKE9vGilwopGuoiPrMPq3FEsRbZsZwyG
 V43t/4FzNx/WgI8QNIAIM1dbb+UfGJVJDJ/mieVbSzzieJKVUuxl7zIEBGniQkn0sZLD
 GIVA==
X-Gm-Message-State: AOAM532UnDL9Nqz0gccj3L46NwkJr4g5rV+JQLoHO2khjtyQYGQa4Jxx
 EnvKWfEn7zQ+e+ZpOMYmUy8=
X-Google-Smtp-Source: ABdhPJx2njMfmL4rDn0UYsJEDn04qQBXxSHMv+8yanVyAaCJeYy8BUu7yncq6FRt2CU/7R2qcqAkdQ==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr18849153wri.237.1612775780912; 
 Mon, 08 Feb 2021 01:16:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p1sm1768601wru.86.2021.02.08.01.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:16:20 -0800 (PST)
Subject: Re: [PATCH v2] travis-ci: Disable C++ on Aarch64 container
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210206200537.2249362-1-f4bug@amsat.org>
 <29f38036-9acd-abf4-1a75-5a4ac54273a6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4304f273-2320-e302-f8ca-b72fb69061b5@amsat.org>
Date: Mon, 8 Feb 2021 10:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <29f38036-9acd-abf4-1a75-5a4ac54273a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 2/8/21 6:54 AM, Thomas Huth wrote:
> On 06/02/2021 21.05, Philippe Mathieu-Daudé wrote:
>> Travis-CI seems to have enforced memory limit on containers,
>> and the 'GCC check-tcg' job started to fail [*]:
>>
>>    [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
>>    FAILED: libcommon.fa.p/disas_nanomips.cpp.o
>>    {standard input}: Assembler messages:
>>    {standard input}:577781: Warning: end of file not at end of a line;
>> newline inserted
>>    {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
>>    {standard input}: Error: open CFI at the end of file; missing
>> .cfi_endproc directive
>>    c++: fatal error: Killed signal terminated program cc1plus
>>    compilation terminated.
> 
> If disabling C++ "fixes" the issue, ok ...
> Otherwise, we should maybe rather limit the amount of parallel jobs
> there instead? (i.e. compiling with "make -j1" in the worst case?)

I exhausted my Travis-CI credits (frankly I don't plan to pay for it
with my own money). If the project expects developers to use Travis-CI,
we should think at some way to buy credits and give them to developers
on demand? [Cc'ing Stefan]

I tried to do my best to reproduce by limiting the amount of RAM, but
I don't know how to replicate Travis-CI hardware speed to match the 1h
time limit (the AArch64 hardware I have access to is certainly
different).

I'm happy with any patch (directly removing this job if it is not cared
of?) as long it silences the failure reports we get on IRC on each
merge.

Regards,

Phil.

