Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FE358DB4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:49:24 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaea-0006FG-14
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaUt-0002dU-Dr
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:39:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaUr-0005u7-Pg
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:39:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p10so1604337pld.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RIkLetZ2UK/3CGxlNX5+aP98gYkUHMWQTaw+YY020jc=;
 b=qnO6Ez/GueiTe9AWHpWG4QnmeFykIAheEuMnJ1VE82Ho7Y+e7wFzsiQlERdsASHRBU
 Y5niy8Inv7OcSTyl5yp0mYvj4ZeANi4qBbJ4SHpXkX/04E+1EZmh6p6fHbbvqkt1YDhV
 q8S4O2JSU76r7eKFqBCMOgCazQvS8qldgKXr5nSi2FbKF829c9XBwTFsVB9guUbxMWVP
 oiCgVxGHLzB9Wk6XP3IKOjnsiJA55M4KeQcweuBpIywUH/2efpsJr1bO+TxpYXR/wpqd
 nq3A6MsjNGIm+icvJimPAK6sqho2MGPCv93mlUqEYu/muehKPnaM3JueSmweSnjTLTss
 bBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RIkLetZ2UK/3CGxlNX5+aP98gYkUHMWQTaw+YY020jc=;
 b=ThsykWdOjmpPdpJnIUxgqlaaj2tUXGfkha2jxIh9yPmkflFQragCcA0zG7kH+8JkK9
 p/el7tXluLpneGm0e4TrolpkwCliXL44l1wWOOEtQPWuBpwvTVYCSTl6sZ4aBPNnoJV2
 c3IZWQ6bAcvtNHOgv92srxvzeEzg4Eu2Uhi9aE1qdA9qKpOnpIBtUC1NWWuxk9S8va7s
 ZRff3E51lDTrK2ePwAJy4ypqlOSCebViVtmwpqA6twwgzlv0xjSuWqpSUyu+VnzistQc
 D1MSpg20phJ2DZGYxkknKUCQz63u8CxLOdqFZ1+0ug0wNCE4+jFCa/YCYEBAAtCfCS/7
 hJrQ==
X-Gm-Message-State: AOAM530g0B/YylAYlOYK9ulSO2RQ33QL6BqC04mfNbj5r3lqw4+SGg/H
 AKELoiW+YEYn1PYUL8EyrMV+Kg==
X-Google-Smtp-Source: ABdhPJwTmapJcAU/tF2t9vXgzzFyZqYyZxA9rdAwTlZD4MqzHBAqAWuiU2a7Qyq5tPNAOS4Xgru0Qg==
X-Received: by 2002:a17:90a:43a4:: with SMTP id
 r33mr10089153pjg.119.1617910760070; 
 Thu, 08 Apr 2021 12:39:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id gg22sm197488pjb.20.2021.04.08.12.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:39:19 -0700 (PDT)
Subject: Re: [PATCH v3 22/26] Hexagon (target/hexagon) circular addressing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-23-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <398f04f3-95d8-7370-a53a-6a0a9e4e4a5b@linaro.org>
Date: Thu, 8 Apr 2021 12:39:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-23-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> +static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
> +{
> +    /*
> +     * Section 2.2.4 of the Hexagon V67 Programmer's Reference Manual
> +     *
> +     *  The "I" value from a modifier register is divided into two pieces
> +     *      LSB         bits 23:17
> +     *      MSB         bits 31:28
> +     * The value is signed, so we do a sign extension
> +     *
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
> +    tcg_gen_shli_tl(result, result, 21);
> +    tcg_gen_sari_tl(result, result, 21);

I gave you the 3 line version last time:

(1) shift msb, signed, into position at bit 7,
(2) extract lsb,
(3) deposit into msb, overwriting the low 7 bits.

And anyway, those last two lines are tcg_gen_sextract.

With that changed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

