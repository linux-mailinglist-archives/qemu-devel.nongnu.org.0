Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE043E9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:56:01 +0200 (CEST)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCRM-00039R-A6
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCP6-0002Rz-4V
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:53:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCP4-0001JV-Jj
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 16:53:39 -0400
Received: by mail-wr1-x436.google.com with SMTP id e4so12368941wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g1rJtXWuQA5OerL3ofebb1LytvSntMRzGzYmGHmLDmM=;
 b=pUI7VPchduwc2CN5HMlfiHOWRVmNPqBSfkKrktANX+n21KM3g31HchJXip2n8I1ySj
 UF8yXpywY/VZictRAFy9j8thWwY+fCV400Zog9riM0HpsmT+PkUD+rAvdhxHenMoqB2D
 98Jp/uRltE0JAd9GrEUm74f52y0SCvfnXPh/FEVEdRBmY38hUVLY2DP9lNHnAfjG3emm
 kQJnZZrK2qEtzL+5Afufcl0BU8zPonBn+S6adV3tEAUs0M1AYleEB28wEorxiWwyIqAd
 QbbPL9ixJ/Isj353cJXc7iuQRZdIyuTVa77ITG+a/cUKrccI4KDGVI7oWzOjHrzhQvo8
 utlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g1rJtXWuQA5OerL3ofebb1LytvSntMRzGzYmGHmLDmM=;
 b=oG+GKTWpJ3BrfgPQHTQiKO8QJCBmcZ5T/GucaTSi8gngofaWts8Tp8xOkWyO3R28kE
 MiCO4MhaNHadiJtxjdXP0hc8NKTrSA/FhKB2cxU+2m1+8DuOyrSILKdnYucs5bu0C7mB
 kIFh0y5ATNUvI5m++OqWfrs/uUEDKi4wbTRDoBh+VT67eHsGT/LqVVDEtcyRtuPPjmR8
 PaOd+pXpsJtjthyj38hgHWxczTeSPMWPQazgqidWJ9xfaLg5Wk8JFzfYCuPpIiqHZqpU
 Ho5XMM+pzo+5De1CYXvcJCiDaH2KTEN2KT8gRsTfUshLQrnV3wj9VOoNREpVppe1L+EM
 7s+Q==
X-Gm-Message-State: AOAM531XnzWwoPweFpmzYiiRfIThDnY9HUWWBSh+VuRzKpVMkAIwneF/
 0Thm3bqFbdCG3trbpZ8+dnY=
X-Google-Smtp-Source: ABdhPJyTJYZwGKZOMTTPLtJbDfbOk690QLCTU19fuFibWwXOApIkmioyvVIzuAvk8rYQt76t+SjSbw==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr8616820wrw.319.1635454416841; 
 Thu, 28 Oct 2021 13:53:36 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r4sm3896738wrp.26.2021.10.28.13.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 13:53:36 -0700 (PDT)
Message-ID: <922cb711-8032-af53-db4e-bbb17fb806b3@amsat.org>
Date: Thu, 28 Oct 2021 22:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 04/32] target/mips: Use dup_const() to simplify
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-5-f4bug@amsat.org>
 <2df200f6-8961-ec07-1df6-fbaa83997f95@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2df200f6-8961-ec07-1df6-fbaa83997f95@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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

On 10/27/21 21:06, Richard Henderson wrote:
> On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
>> +    uint64_t eval_big = dup_const(df, 0x80);
>>       TCGv_i64 t0 = tcg_temp_new_i64();
>>       TCGv_i64 t1 = tcg_temp_new_i64();
>> -    switch (df) {
>> -    case DF_BYTE:
>> -        eval_zero_or_big = 0x0101010101010101ULL;
>> -        eval_big = 0x8080808080808080ULL;
>> -        break;
>> -    case DF_HALF:
>> -        eval_zero_or_big = 0x0001000100010001ULL;
>> -        eval_big = 0x8000800080008000ULL;
>> -        break;
>> -    case DF_WORD:
>> -        eval_zero_or_big = 0x0000000100000001ULL;
>> -        eval_big = 0x8000000080000000ULL;
>> -        break;
>> -    case DF_DOUBLE:
>> -        eval_zero_or_big = 0x0000000000000001ULL;
>> -        eval_big = 0x8000000000000000ULL;
> 
> The conversion is incorrect for eval_big.
> The conversion creates e.g.
> 
>     0x0080 0080 0080 0080
> not
>     0x8000 8000 8000 8000

Oops...

> You'd have to do something like
> 
>     uint64_t eval_one = dup_const(df, 1);
>     uint64_t eval_big = eval_one << ((8 << df) - 1);

Nice :)

