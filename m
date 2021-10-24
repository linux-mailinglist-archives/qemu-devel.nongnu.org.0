Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED4438AB4
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 18:45:57 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1megdA-0001kH-3k
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 12:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megbS-000167-ND
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 12:44:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megbQ-00065F-IR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 12:44:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id e4so8185948wrc.7
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cYcTnYWafKdjEt42FzzT1J3Z+YD23eDexYgL0Dla03k=;
 b=QG83nD2iDl5GNOWkMC5EI+ioWh+Dw3KyToDNlF6JSb4qOCGhH9tE3Q8f3k/p5Vkgaf
 fp12U76FlHkJT/aMg/4li4F36WVoGfwpF04kIRyfp75RsUGQ+zWRkoE7g8kg3RQCQt7Q
 RuU5hrdqt+8g2qwacsfrvJuqPsN0aKnfQGo+SvK1hhPxTEcQbPggF1wshAITO8FinUhM
 tCkqvMTb6Pj2qWiFyGRMeyyd3k4CE8iLhd4yyWksdNWToy29E7BcUD9Gjr1LFXwBK6J/
 GwQICFHOq67IaL7ixx2LlszWRvfuDokBi+l+CgOMaBM4y23+tU4EU1xOiDo6+lHHXIpz
 doYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cYcTnYWafKdjEt42FzzT1J3Z+YD23eDexYgL0Dla03k=;
 b=viJD8Jh5mZy60DNnjfeQPINLolIGaMkhxalSqqlm282pLP1fskFNbIO3HOfiUjO3hc
 6cRS5NIr6xlRT58nHskQoGXwMZTkKY+ynV6jCc91E0UeJhOstuo/GkbQIJw19R1oTtf7
 7KUje6bdJ+WFIElHQLfDPhzWmYGgd0YDpoxIbzbgiSb7a29U+zTBbKHGdyS1CgJKbS78
 IcTvEx5dgPLJ2Q2eI9ur9YKxQtC9NoWiX7DDJ8WC38nRrS+r6jQV8xomvmw2WMHh4PeG
 4iUaAHVFdblaWypIIbq+TLSe0/nnfudJrVw57WTDDC8fOGWkoE3HDu2QRRqJbgPUKvx+
 VfNA==
X-Gm-Message-State: AOAM532f2ARYZfqmFiOWuZ2l7x5xwRV6DEC3mv8okSEgQYkNmYLf0WZE
 5+gzJZojiEJ+HursOMonq9M=
X-Google-Smtp-Source: ABdhPJz5rg3RjGC249TlXBvrE2WKheKdgrLtPyv3b16gH80lKEixSUupcR+TZS3w+43+kRlvwRar5w==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr16666669wri.421.1635093845708; 
 Sun, 24 Oct 2021 09:44:05 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j9sm2015207wms.39.2021.10.24.09.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 09:44:05 -0700 (PDT)
Message-ID: <2aed4407-9fd4-bcef-3e98-18446bcf3e94@amsat.org>
Date: Sun, 24 Oct 2021 18:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 17/33] target/mips: Convert MSA FILL opcode to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-18-f4bug@amsat.org>
 <05abb10d-25c6-3b39-dd43-cc269dc1dcb0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <05abb10d-25c6-3b39-dd43-cc269dc1dcb0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
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

On 10/24/21 07:04, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> Convert the FILL opcode (Vector Fill from GPR) to decodetree.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/tcg/msa.decode      |  2 ++
>>   target/mips/tcg/msa_translate.c | 40 +++++++++++++++++++++++----------
>>   2 files changed, 30 insertions(+), 12 deletions(-)

>>   +static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
>> +{
>> +    TCGv_i32 twd;
>> +    TCGv_i32 tws;
>> +    TCGv_i32 tdf;
>> +
>> +    if (!check_msa_access(ctx)) {
>> +        return false;
>> +    }
>> +
>> +    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
>> +        /* Double format valid only for MIPS64 */
>> +        gen_reserved_instruction(ctx);
>> +        return true;
>> +    }
> 
> I expect this reserved check should be above the MSA is disabled check,
> within check_msa_access.
> 
>> +    twd = tcg_const_i32(a->wd);
>> +    tws = tcg_const_i32(a->ws);
> 
> tcg_constant_i32.

Hmm I am confused here, only 'df' is constant, 'ws' is GPR[$rs].
Since it is limited in [0,32[ and used read-only by the helper,
we can also pass it as constant?

