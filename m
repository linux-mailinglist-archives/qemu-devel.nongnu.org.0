Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6531B389
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 01:07:44 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBRQU-0002R6-Up
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 19:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRPj-00020H-20
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:06:55 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRPh-0002qZ-Ch
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:06:54 -0500
Received: by mail-pl1-x62b.google.com with SMTP id ba1so2777950plb.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xzckFo945M76e8PTEg3ChvoBzf5T61Q5hpaVIM5EJo=;
 b=Wd5JUyuiiL7bM8ayNCzjb9kiYU9iWhgFW7ReESDqESvB2rYJLlPLycXHmsbl20sQNx
 GIc6eTxHdxoYMI2KbirBejLDspXs7Zsw0tA4GYbbJ6yggz3aBAfSnFhvUm00FM39oYDM
 tYTdZbtF2BsqK4HEu5d/I0M7JPze7KJ2znZOYowaX9BKwoyz/OpUUsIpAoOiq0loZPWB
 vdIXWmJv4QzrKytB4OFEPSo5wx76HnOD8Z4+DVSGXS2QCvPqjnzgOGLmk8509Ke1Cj6h
 gr8LsiOPE0rPjfM0uWSmO+W6tNaFkwE1ukrPNJwNv9FW3j3oaZKaEKRoB4vFQlzWXSBu
 2zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xzckFo945M76e8PTEg3ChvoBzf5T61Q5hpaVIM5EJo=;
 b=kO0NFZmGv03ejxe3xEkzsT89fbR3C6OVPWzuYciy8Vl2Th3TLxH2eVsVgSoQV8bEZV
 Eblv+o7HveqHB1JJu/Ig8HlgczUnSt/tY3RU4/xllyUZnw+6VkilzPr+yc9w61rnxw0e
 TvJp+KPOz6HZue3aBSN/ikN27EU6SEeYrQgsRKYPRF+yCxxaNgpoRwtDl8IRFqXPHnNE
 a6w8njiJ3rHT2HyT6e5lm880uywz8sZz2HJh/1p96PP8Pbcs21AzicIauffWpQo8r9Uj
 ULCjSGu4qYAouOS3yUlh15w8kr+a6wwzKG5YsHHPN14Ew9Gh7IFLnaaWwDKkkAd5z8hx
 qPvA==
X-Gm-Message-State: AOAM532Rgz//EhmqSScDUoMEzRVkHYSvXguGoeYEA0ZvcOnVyQ7MiD6a
 m2i+7Uch5B54eWVQfXM1KhHKYg==
X-Google-Smtp-Source: ABdhPJxFTogPE6jKIAEQ03r/lOmHknufE7ZAbNNRpdVvEfd7Mi1Ff1Nq47C3qwANU/UDUlNq6/7nJA==
X-Received: by 2002:a17:902:694c:b029:e2:daa3:ca4a with SMTP id
 k12-20020a170902694cb02900e2daa3ca4amr12777946plt.80.1613347611743; 
 Sun, 14 Feb 2021 16:06:51 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 h20sm12764345pfv.164.2021.02.14.16.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 16:06:50 -0800 (PST)
Subject: Re: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebb86dcd-d89b-3901-3c59-08c6bfb3ed23@linaro.org>
Date: Sun, 14 Feb 2021 16:06:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)

Drop all the inline markup.  Let the compiler decide.  It also means we get
more consistent warnings for unused functions between gcc and clang (clang will
warn for unused inlines outside a header file, gcc will not).

Also, quite a few of these function are really way too big to want to inline.

> +{
> +    TCGv one = tcg_const_tl(1);
> +    TCGv zero = tcg_const_tl(0);
> +    TCGv slot_mask = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
> +                           val, hex_new_value[rnum]);
> +#if HEX_DEBUG
> +    /* Do this so HELPER(debug_commit_end) will know */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
> +                       one, hex_reg_written[rnum]);

This is a very complicated OR.

If you really want hex_reg_written = {0,1}, then change to

    tcg_gen_extract_tl(slot_mask, hex_slot_canceled, slot, 1);

otherwise, just let hex_reg_written be zero/non-zero, and or in the slot.

> +static inline void gen_log_pred_write(int pnum, TCGv val)
> +{
> +    TCGv zero = tcg_const_tl(0);
> +    TCGv base_val = tcg_temp_new();
> +    TCGv and_val = tcg_temp_new();
> +    TCGv pred_written = tcg_temp_new();
> +
> +    /* Multiple writes to the same preg are and'ed together */
> +    tcg_gen_andi_tl(base_val, val, 0xff);

Why is this here, rather than asserting that we never generate an out-of-range
value?

> +    tcg_gen_and_tl(and_val, base_val, hex_new_pred_value[pnum]);
> +    tcg_gen_andi_tl(pred_written, hex_pred_written, 1 << pnum);
> +    tcg_gen_movcond_tl(TCG_COND_NE, hex_new_pred_value[pnum],
> +                       pred_written, zero,
> +                       and_val, base_val);
> +    tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << pnum);

Except for HEX_DEBUG, why would we not know whether or not a predicate has been
written twice?  It seems like we shouldn't need hex_pred_written for the
non-debug case.


r~

