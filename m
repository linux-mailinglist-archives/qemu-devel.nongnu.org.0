Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8F355EA3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:13:09 +0200 (CEST)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTtwa-0000Ff-9G
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTtvW-0008Fg-G6
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:12:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTtvS-0007Jq-70
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:12:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id l76so11441832pga.6
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zErCYgzDEcPRyDca4aUGChy0Z3v0wyAT6ePdr/VFRPU=;
 b=p9pQfGmYxVJ5hEEZVUCN0Rh6mdrltNAV055DEUAMEXIN2O+W5xYuUHvvtPTwGfqNWv
 mLnJwSpZFDcxHfvoujp7v6QiT8bhcARfVEEmMAS3IkcqF7yHQEZXI1OpPnEFYHlKfKfZ
 0oNQSRRCE7J4WJuMzIMvm5KNlRbxpMgZGTHgMV2l8LVX9jYgdYBm/6yFtLn4UnOA3dMv
 jZdiUt9blqPJkhpDhWS1+3mIuPb8alZOXKHYWMWd3xSBD2eatNQgPAhXnCwCieLLWYr6
 his9zU5+NfnXDEmDSQg3owkTbQ9yvJayUdPfZYrtEMYZS7WplrHV2/TjmRfTSJGQSKBi
 3lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zErCYgzDEcPRyDca4aUGChy0Z3v0wyAT6ePdr/VFRPU=;
 b=Q7ioCA7EgKrK3bUCcWZznw+VRrrBIPTmkcq/6B/HzWE8G6q3vAJDnhxWZ7t6yAevH1
 xdyupN0VzNioWzhbrN/5+paiYhuyRJpi6i9UcJU21Mgoqh5mkw8PpAkZaWXljc7HgBLa
 GZPNopgZrk4eZ2okDkX98b39TWM9ZrTbxLT41aEjm3jSkTuwugs6gQm6IxiZHfHnWLYM
 zDDi9kUuaWq0xLxhiwxSfG4RhJAhzP3HEXIisv5ifKxgrxJH9LHTshowdGs5rdJMWE+0
 kD+T2H9KwdlzCD1qpd+QqHCrhjyjWlg4s51HzbmSKWybfp4DIibVM1QXgrQ0ZcNQi9wv
 1Gnw==
X-Gm-Message-State: AOAM533K9BSUbvRJsM7awv7RrMZoltflF96YoZhGtQZaCWmWxQ++8qIA
 4fRGXeisL4ZMo1GM6Blyegm9kw==
X-Google-Smtp-Source: ABdhPJxjCvW0m2oGKsUCLUN4OMmiL7E/81TyvAZq275vXO9k3I2bfL1RvlMJx3/i15bY7YSB7dUOlw==
X-Received: by 2002:a65:4d49:: with SMTP id j9mr276237pgt.113.1617747116593;
 Tue, 06 Apr 2021 15:11:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e17sm20941pfv.207.2021.04.06.15.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:11:56 -0700 (PDT)
Subject: Re: [PATCH v2 17/21] Hexagon (target/hexagon) circular addressing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-18-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <365724a7-1013-e04a-43b1-dae87103fcd1@linaro.org>
Date: Tue, 6 Apr 2021 15:11:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-18-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> +static inline TCGv gen_read_reg(TCGv result, int num)

The unnecessary inlines are back, just after having removed them in patch 2.


> +#ifdef QEMU_GENERATE
> +static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
> +{
> +    /*
> +     * Section 2.2.4 of the Hexagon V67 Programmer's Reference Manual
> +     *
> +     *  The "I" value from a modifier register is divided into two pieces
> +     *      LSB         bits 23:17
> +     *      MSB         bits 31:28
> +     * At the end we shift the result according to the shift argument
> +     */
> +    TCGv msb = tcg_temp_new();
> +    TCGv lsb = tcg_temp_new();
> +
> +    tcg_gen_extract_tl(lsb, val, 17, 7);
> +    tcg_gen_extract_tl(msb, val, 28, 4);
> +    tcg_gen_movi_tl(result, 0);
> +    tcg_gen_deposit_tl(result, result, lsb, 0, 7);
> +    tcg_gen_deposit_tl(result, result, msb, 7, 4);
> +
> +    tcg_gen_shli_tl(result, result, shift);

This doesn't match

> +#define fREAD_IREG(VAL) \
> +    (fSXTN(11, 64, (((VAL) & 0xf0000000) >> 21) | ((VAL >> 17) & 0x7f)))

which has a sign-extension of the result.

     tcg_gen_extract_tl(lsb, val 17, 7);
     tcg_gen_sari_tl(msb, val, 21);
     tcg_gen_deposit_tl(result, msb, lsb, 0, 7);


r~

