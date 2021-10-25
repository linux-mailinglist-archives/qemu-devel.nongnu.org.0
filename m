Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F2439BFE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 18:47:12 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf37v-0006CO-PP
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 12:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf352-0004fx-Fj
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:44:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf34o-00083W-F0
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:44:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id s19so13853829wra.2
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oNzO4k03fno3JK6Qe1ntgahvdY0l1mWowojR9Rd/sCU=;
 b=eZLToUrzTbIhqwbKEH/lwR0ByH5U4ib6D9+d24kD77ZwKppKOpBm6gyqSPl2ljoD/+
 I1k5+n1b7FXXuc4V0ZLDuQrMdWw4zk8s/GcFYBc80I9QYz8d89vhF06SKR8Dcl4ecTN1
 7v8c5rWCOETtTGBDxalDOj8MrOeY+WlYcawuu6dSJF/WvMTKjsuSoKwkvt+3P826NvRv
 6CXB5xDPkqgQcVWfiElYmjMS0mQzvn3CEBfhyhlakQY+CjSPTZUS8sEoy9U9jp2qB5eH
 tc44n2eF7cVAZl9Pp+6OudIpTpfRGl5A5m+0fASaNpxrQ1Dfb7EJVht10srb5uT6cO1z
 xTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oNzO4k03fno3JK6Qe1ntgahvdY0l1mWowojR9Rd/sCU=;
 b=mZSdwGhrImRi1cQyZnG6aiXa1xL8+GQroBRxBp2+4m2v6PQJoyn/CJxs9qrQ0i3V39
 /WEu2hiDbRb6cK7J9IY9oC9yA/DF7uFSR2omoslu4fsIJQOKN3YU378vdamWt2wrmCAF
 9VYUTl0BK2TVrjV/FKHv4QJ6LYzGDWIbyDi/4rhpbNtPbPGlTDeU83Fn0yY76U/JFYRq
 YXppngT5C3evSpRSNKHy5Pl5TF4FipUDcjmYj3ihEHbiur3fhL4xX/TlaXzkr+XvOOIF
 dboB5TQjlLrLiY7Nnxjp6nZY78UIGEcYRLBnmfCOAdFYl07+27qNb2z3O/LgyyHx1JQZ
 fC7w==
X-Gm-Message-State: AOAM531eSAtUMVP+nxbK3AwMU4zH8Geoq3S3VzgGduEvxKrQwlNX3eMv
 yxPSEXd3pJRzVIuX2WcM0+E=
X-Google-Smtp-Source: ABdhPJxD+ABN8F9hUErYPGD0x/GLIa/IUIxPAuT2w8qmalrNOtj2Y5isPYogeMmfawrfh/ZI1UwjyQ==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr25249728wrd.63.1635180236268; 
 Mon, 25 Oct 2021 09:43:56 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t1sm19680160wre.32.2021.10.25.09.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 09:43:55 -0700 (PDT)
Message-ID: <d4ddd96f-a766-d03b-6884-c7d0d94c8cb1@amsat.org>
Date: Mon, 25 Oct 2021 18:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 17/33] target/mips: Convert MSA FILL opcode to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-18-f4bug@amsat.org>
 <05abb10d-25c6-3b39-dd43-cc269dc1dcb0@linaro.org>
 <2aed4407-9fd4-bcef-3e98-18446bcf3e94@amsat.org>
 <f6c6002b-c143-50c6-f849-5fb317a7ae76@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f6c6002b-c143-50c6-f849-5fb317a7ae76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 10/24/21 19:26, Richard Henderson wrote:
> On 10/24/21 9:44 AM, Philippe Mathieu-Daudé wrote:
>> On 10/24/21 07:04, Richard Henderson wrote:
>>> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>>>> Convert the FILL opcode (Vector Fill from GPR) to decodetree.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>    target/mips/tcg/msa.decode      |  2 ++
>>>>    target/mips/tcg/msa_translate.c | 40
>>>> +++++++++++++++++++++++----------
>>>>    2 files changed, 30 insertions(+), 12 deletions(-)
>>
>>>>    +static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
>>>> +{
>>>> +    TCGv_i32 twd;
>>>> +    TCGv_i32 tws;
>>>> +    TCGv_i32 tdf;
>>>> +
>>>> +    if (!check_msa_access(ctx)) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
>>>> +        /* Double format valid only for MIPS64 */
>>>> +        gen_reserved_instruction(ctx);
>>>> +        return true;
>>>> +    }
>>>
>>> I expect this reserved check should be above the MSA is disabled check,
>>> within check_msa_access.
>>>
>>>> +    twd = tcg_const_i32(a->wd);
>>>> +    tws = tcg_const_i32(a->ws);
>>>
>>> tcg_constant_i32.
>>
>> Hmm I am confused here, only 'df' is constant, 'ws' is GPR[$rs].
>> Since it is limited in [0,32[ and used read-only by the helper,
>> we can also pass it as constant?
> 
> What?  You're passing the constant ws to the helper, not the contents of
> the gpr -- that's what the helper is expecting.

OK got it now, thanks :)

