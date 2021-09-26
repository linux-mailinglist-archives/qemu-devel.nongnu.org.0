Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781F74186C4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 08:51:15 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUO0I-0003uO-0b
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 02:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUNxw-0002uj-KZ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 02:48:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUNxt-0005p1-L6
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 02:48:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so41095173wri.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 23:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lde7yebpO+1xpZKhUSBK6SEETn8FXTzfvJ4h7UjWZRc=;
 b=XPJfotuT3o175SzmgsDJYK7t5a1pUd40xSScpJkdbWVWyVr9CS1nR2FTvEnBpOJmKy
 7XYz8uziy2vPzQLCVKZFZL66g4BgJz8LGp+Fft1x16ObyHc0DKzHPUkkURMj5IV+MFI2
 m4UAKXyHYIP5J/RCTZ/5lu2gbu89tGD78+k79rXKaTN36RZaeHW1H4An9cudd3gE9UlZ
 9x2wX8Mcbdg430OKqUX3E9uxQK+r6/VppQ4IfleFkwV4zeBu3q6849SesSOFncwm7UwG
 nBEbouXHPuCC3Owmp7cUD0ahXJfgkHmpPjvH+Jz4Rw0WcS5JIxjRpIjFS48XH8ajWbNM
 juvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lde7yebpO+1xpZKhUSBK6SEETn8FXTzfvJ4h7UjWZRc=;
 b=r9lvjNFsfKbeOzG4xJJqEsJlFrVAnbLvMvf+2pCs8oYZv/w9aRaobB6PFc1Na33VJf
 DGCg9aXioKZchMzfD8NMukLYtMuzYKA27xTvwhIZIV9s+tWsuP+2GSn3fYZOvFgKSEP5
 wi2SUnx+BhPENfC2xVXcXiDE85wr62oWJeOxOgQtebkCzPojiqKigtXod7PTedUtD8vr
 xVyA4L7sg2sAfeZDWa9Vq0toZ+T2Qg1rGfIpa7OlGe9r6RG5y81w1z/ex7tWX5CwApzR
 jAsgUKY35TJlIHShCy7qu4giIsHFB8FGmcaMwOe/VQRUA7Ox9nk6qN7+trGdZhGhKI26
 CJWA==
X-Gm-Message-State: AOAM5317t6Y5HNL5DCDAee3PSLG+kXBR6ONI1fb9yVcDqzWt/uAjGZaB
 vTWANjLUaDcj0iYueHr2xoE=
X-Google-Smtp-Source: ABdhPJzqJvYj5pIzWz2/I7x9YrJPlpH63e4AXn5OaQe0ipXWiVT+Lvht4Cl5wJmr85XQu60xHl46cg==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr20226418wrr.332.1632638923192; 
 Sat, 25 Sep 2021 23:48:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c77sm13220683wme.46.2021.09.25.23.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 23:48:42 -0700 (PDT)
Message-ID: <0188fb06-d0f5-b196-ae90-a0b40120a1c1@amsat.org>
Date: Sun, 26 Sep 2021 08:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-10-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210925173032.2434906-10-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 19:30, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target.c.inc | 137 +++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)

> +static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
> +{
> +    if (ret == arg) {
> +        return true;
> +    }
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +    case TCG_TYPE_I64:
> +        /*
> +         * Conventional register-register move used in LoongArch is
> +         * `or dst, src, zero`.
> +         */
> +        tcg_out_opc_or(s, ret, arg, TCG_REG_ZERO);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return true;
> +}

> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +    /*
> +     * LoongArch conventionally loads 64-bit immediates in at most 4 steps,
> +     * with dedicated instructions for filling the respective bitfields
> +     * below:
> +     *
> +     *        6                   5                   4               3
> +     *  3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
> +     * +-----------------------+---------------------------------------+...
> +     * |          hi52         |                  hi32                 |
> +     * +-----------------------+---------------------------------------+...
> +     *       3                   2                   1
> +     *     1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> +     * ...+-------------------------------------+-------------------------+
> +     *    |                 hi12                |            lo           |
> +     * ...+-------------------------------------+-------------------------+
> +     *
> +     * Check if val belong to one of the several fast cases, before falling
> +     * back to the slow path.
> +     */

Lovely :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

