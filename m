Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058043CFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:39:13 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmtM-0005qc-10
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfmiO-0002SI-Dr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:27:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfmiM-0005Zd-DZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:27:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id d10so5471674wrb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o/D5qtHptXthzXWbGJQgP4qnxn5j7AKAPg/d70R4Hp4=;
 b=WgSFp3UbjlzgK7llzt/xd6F2MmElqgU+DJt9xAmb9V6nDIdPb0bkizL0ahVI/NUk+I
 DmHLhArPqzI8ZKdLbJ4k4/B8tc1zjoms1seLmwCOOeP++56I5zsUJKi/doUrQV+bozZw
 z27CkXa2O3o8JftBpQLS08/L/Wb33zFQY4bR/QpGcbAcv6rMaeoWgCZF2XS82HDl6R83
 BH0cF0701urkXTt1P2vsQ5/q3zPc4bTgCTglH4spcINjvEzmYWG2+B4jvSeBo/mlfj86
 LjXiZCQ+M4gP38YbdMK1csTlxy7Otw7H6l/UQtmWnFWxG7mZYtK2rY0ks1gAzLZeT0f9
 x5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o/D5qtHptXthzXWbGJQgP4qnxn5j7AKAPg/d70R4Hp4=;
 b=FJVDd/Z59ubW1084MelmIIEoPs82U9KeO4//MRVa7VVm9Dq7NRGO8+xULzIdRZ2rsU
 aUaDQS3VkZEKmb6jEmOQikpPPsoaaJDxZCn4fRJj1J0eqvfyrMG44hDdbYChDyiHYBmq
 HsuMqycaz24GPxgtPkXrR4FWQA/uoeFZWBukGc3MOzuSU8WCQlZ+zEyI0Nnr03gys0Sa
 sX6gK69aevgILTDWfYQGWoHqRwhh9jYarjVw5rMxiyiObkcskiHEu4nSnEJXocC8iiBR
 NrIXMAaoijKGaH5XHbPlMH0rtu1u39ORMK+ivY1s2le9Q9itAUX9jEDjpV0Eo1EYsazA
 kK2Q==
X-Gm-Message-State: AOAM530D9bXYvHN8vAnEiDLM1fUzFnU1WwKaLbVIJrJDx2/xOVG9p5k8
 q0N9VCbB4VkygcFOiTtGhRI=
X-Google-Smtp-Source: ABdhPJzDi+1KfGN1QdEveMRWWNpCyjehErHzVaujnTt6sUWhGGgUe5klBeoG9aKfeVCpySH5/1E04A==
X-Received: by 2002:adf:a496:: with SMTP id g22mr42613810wrb.250.1635355668258; 
 Wed, 27 Oct 2021 10:27:48 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x21sm3996960wmc.14.2021.10.27.10.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 10:27:47 -0700 (PDT)
Message-ID: <1a83b087-8b12-a10f-8b0a-390eb71ac459@amsat.org>
Date: Wed, 27 Oct 2021 19:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 26/33] target/mips: Convert MSA ELM instruction format to
 decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-27-f4bug@amsat.org>
 <68ccd429-4878-51c9-ef31-331d57730c9c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <68ccd429-4878-51c9-ef31-331d57730c9c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 22:52, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> +static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm *a,
>> +                             void (*gen_msa_elm_df)(TCGv_ptr, TCGv_i32,
>> +                                                    TCGv_i32, TCGv_i32,
>> +                                                    TCGv_i32))
>> +{
>> +    TCGv_i32 twd;
>> +    TCGv_i32 tws;
>> +    TCGv_i32 tdf;
>> +    TCGv_i32 tn;
>> +    uint32_t df, n;
>> +
>> +    if (!df_extract(df_elm, a->df, &df, &n)) {
>> +        gen_reserved_instruction(ctx);
>> +        return true;
>> +    }
> 
> Again, I think this should happen before the access check.
> 
> You could even return false from these extractions, because they
> represent an invalid encoding for this instruction.  In a different
> context, there could be another grouped insn that matches.

Yes, you are correct.

