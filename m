Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D63A3FC213
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 07:11:32 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKw3W-00019f-Ac
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 01:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKw26-0000LP-96
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:10:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKw24-0007Xi-Fk
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:10:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso1081442pjh.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 22:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+nvbEZTv+aUf63SANfhK6BSV2Q32ulVZKPJPeCH2lIc=;
 b=drgs7DJTXzrrev1JM8gdRuOt/PL6DvSBVhsUl6o9NYhybzm+WwAs/KHunBEEPpTBRM
 /9RN7eHhuHw9w0tnbYVEXbxL6sRB1q8JqEG9B42M4EVZeV4Yrr7GUWdZksmJXktuLBMi
 +41I8Do08IYw5qxm/Wy8tearqMWG+TEVwb004MLK4bPlbSWBK8VDCpN7i/mGujqcBB6+
 0ARcnE7YgkDcy3F3qDDtSNhHHndRekX8TlvIrXu1Ue/vNxi6z+qczzjkwb5ix4ItqIvl
 tcf96i/EQLaicwvX18XgxejwgEEi/Z1mdRR2ByT65/9PnyI8vpcF3naK9hqiWEZi44sJ
 OT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+nvbEZTv+aUf63SANfhK6BSV2Q32ulVZKPJPeCH2lIc=;
 b=mYigU06/hfrs6VxORrSwmOqQ2+NFfV5dzLuj1RqoVMyTmyUjboDYbo+fF98BQqqcLa
 qVVaRXr8QOJWXurNfjuX7fGJUada8QZhay182JIph/oPnatXRv7oi26jCmUpZQxpBQHx
 w0UeegAe7VAdTZrCOoNYpxlkBnbOKeo7W8agxfDbT77M3zfcY/wlapG3LccAHlH3A9jf
 xfWe6V7wvoF5AxmSetpRhQMwlmlqaD8saLA/uUWSTPl6YRZBhpx53VoVts7RFyFgbYWA
 JESeTQar4DqBaghYhuF45+7Cvfk3AdbHqBqZ7A5vwhEXebCiPxp77OoBrs0XlPteuRc3
 9OqA==
X-Gm-Message-State: AOAM533iXZLBB99dZ/cDzY35Ee4XR3ZQKuHPmJzS0/vsDVg6JfJXZYYk
 Yx4xOD2tfwfwZsK88NZZ3Xeojw==
X-Google-Smtp-Source: ABdhPJxJ/DvlQjyubdo3VgrYBzMuwDVB66dqs6Jkm5gAHE7i8G9AnD6He8DmQcEZYg0wq/AE6DYlzQ==
X-Received: by 2002:a17:90b:ec8:: with SMTP id gz8mr994898pjb.41.1630386598620; 
 Mon, 30 Aug 2021 22:09:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id v6sm9102738pfu.0.2021.08.30.22.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 22:09:58 -0700 (PDT)
Subject: Re: [PATCH 0/8] RISC V partial support for 128-bit architecture
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liuzhiwei <zhiwei_liu@c-sky.com>
References: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cca8020d-2cce-0978-9f67-9c71a1345b36@linaro.org>
Date: Mon, 30 Aug 2021 22:09:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org, alistair.francis@wdc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> This series of patches aims at adding partial 128-bit support to the riscv
> target, following the (unratified) RV128I specification, Chapter 7 of
> riscv-spec document dated 20191214.
> It provides support for all user integer (I) instructions and for an M
> extension which follows the definition of the 32 and 64-bit specifications.

So... I think that this patch set ought to coordinate with the patches to support UXL. 
Both this and UXL require adjustments to almost every operation, both widening and 
narrowing the effects of the operation.

I think that we're going to need to adjust the primary helpers.
E.g. the current

static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void (*func)(TCGv, TCGv, TCGv))

which supports only one implementation, is going to need to expand to

static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void (*fn32)(TCGv, TCGv, TCGv),
                       void (*fn64)(TCGv, TCGv, TCGv),
                       void (*fn128)(TCGv, TCGv, TCGv
                                     TCGv, TCGv, TCGv))

with the is_32bit, is_128bit check done inside the helper.  Similarly with gen_unary, and 
possibly gen_shift.

Sometimes the fn32 and fn64 operand will be the same, e.g. add, where the 32-bit to 64-bit 
sign-extension is done during the writeback.  But sometimes, e.g. mulhu, we will need 
separate implementations for each.

We should rename the current helper, with one operand, gen_logical, indicating it is clear 
that the operation is bitwise and one tcg function covers all widths.


r~

