Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525A2D7771
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:10:56 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knj8I-0005Lv-QC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knj6C-0004B1-2c
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:08:44 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knj6A-0003OC-9v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:08:43 -0500
Received: by mail-oi1-x244.google.com with SMTP id l207so9940269oib.4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D57fR+ir+lu1+wjbbn+AQXIgrdY9n+/i0XxdBP/3kf8=;
 b=M3tuPdOOQaQfIITI+pfq/hpCVyojvb7XbtF80CUZzh+QmV5rkcoGihM+nVL1i3Dsh0
 /M4EevSpdVwhcKYl37L7c+KkNkI+Za2l1JCyUcDKWArjlguzFFLxmlV0Nr2Kbl8LFncn
 nfxLUkSZryvjaeAp97C1gTdqNQSYeiaKZO0237QbjBVjzjBaAzJpS3GlWFr5H2bwFLiC
 zKgEXPXLDAIoYlGEWfNtkdMloENFnI/C+TLakHK9bTAFloj0XOdNq0bcOBVlrkAYaxx4
 WIIL6iREuckYYR/5RBi454uACCtFZj0q8TtHt74D1wHp6Osetj6H/2kcSfLUfGZTvO/v
 rBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D57fR+ir+lu1+wjbbn+AQXIgrdY9n+/i0XxdBP/3kf8=;
 b=UkNtZ8wxFlcAARGQ/Flz2sPL8JYLgBapJV0eqq1SX7lN2NVgKOrm5NKZ6TS3f+DrCy
 lp1Y73uFnUwmRk4FqD8ICmNtv6+op3aU6idkomQDFfh1unv5S2Dmha1i5xM8BAAedQys
 +qbVyY2fUXilfbouBVrkjC500iT3UNmJ1hPt2BXxCw6V+ACWaQM8ZnPTMB0pjHnzh/8s
 z6SiTmUH8Jqc3rp3r+aSvcqg3vmHEU009P1Ca/773wNyluf/ADHVHCVKVsCi6xzlW4WE
 iYt8OnHmle0G6rn0g5G1A3UfHEaw1wqfnkT+dSK1/AyO84/YEXVBm+aiZpsUtX8gSas1
 4b0g==
X-Gm-Message-State: AOAM531CR/xeI6UcuSaAM6AzQ4IduOaviS89f8fveotkHbMXA5MoIQMa
 3HdfUs9fvMv2Ew4eimQwFbeDcA==
X-Google-Smtp-Source: ABdhPJxSzLnCoMsVU74BzniqNSzkrkO6koEBO9uZpZ99wg2D0ECfZ6NjK2b66UKaz0lAVeukFoxKIg==
X-Received: by 2002:aca:4ed3:: with SMTP id c202mr8904881oib.95.1607695721123; 
 Fri, 11 Dec 2020 06:08:41 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v123sm1811888oie.20.2020.12.11.06.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 06:08:40 -0800 (PST)
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
Date: Fri, 11 Dec 2020 08:08:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211051359.3231-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 11:13 PM, Rebecca Cran wrote:
> Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
> feature for ARMv8.4. Since virtual machine execution is largely
> nondeterministic, it's implemented as a NOP.

Alternately, or additionally, TCG is outside of the security domain (only
hardware accelerators like KVM are inside), and so we may implement this as a NOP.

> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.h           | 20 +++++++++++++-
>  target/arm/helper.c        | 28 +++++++++++++++++++-
>  target/arm/internals.h     |  6 +++++
>  target/arm/translate-a64.c | 14 ++++++++++
>  4 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 4c9cbfbd9975..862be662cef7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -269,6 +269,7 @@ typedef struct CPUARMState {
>      uint32_t NF; /* N is bit 31. All other bits are undefined.  */
>      uint32_t ZF; /* Z set if zero.  */
>      uint32_t QF; /* 0 or 1 */
> +    uint32_t DIT; /* 0 or 1 */

You don't need to add this.  Leave the DIT bit in uncached_cpsr.

> +++ b/target/arm/translate-a64.c
> @@ -1696,6 +1696,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          tcg_temp_free_i32(t1);
>          break;
>  
> +    case 0x1a: /* DIT */
> +        if (!dc_isar_feature(aa64_dit, s)) {
> +            goto do_unallocated;
> +        }
> +        if (crm & 1) {
> +            set_pstate_bits(PSTATE_DIT);
> +        } else {
> +            clear_pstate_bits(PSTATE_DIT);
> +        }
> +        t1 = tcg_const_i32(s->current_el);
> +        gen_helper_rebuild_hflags_a64(cpu_env, t1);
> +        tcg_temp_free_i32(t1);
> +        break;

You don't need to rebuild hflags, because the implementation of DIT is a nop.
All you need is to record the pstate change.  You may wish to add a comment
here about that, reminding the reader.


r~

