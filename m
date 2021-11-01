Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7E441A00
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:35:59 +0100 (CET)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUfW-0002OF-Hz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUd8-00085R-23
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:33:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUd6-0003LA-3R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:33:29 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v17so27436228wrv.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mckMPTkCyS4Zk3UbqEVoxVZHUCeSUmL0hEXx+XAMNhk=;
 b=jU8QIqQxVbtRTCCqOzxmTgkSonv9r+kQ4Cfk10z3FiLTpV+OyXyGByZHVBBfVA0g5Q
 0DV1X7A7aq/rfydbix217HyJvcQvAaV0aSEQ8L3oxTNVn0lvteUmde6I8o27IY1Ugy4h
 M78/n74O+i4sC1hqBDkaeQ//YEh68KDl9wtfgjpjMkUuFpn8fpUBIpYmOuM0Y+DtN2WY
 3voZvkL6Mikf0/lNbC0EWPU2UyXYZ7ugUDo53+t9fFfxiwA0H/HTiMTVt8SHrcDR4dqT
 mj6QdkSRnpI6dbsFEE5yQrfdOJFuYweT9j2Rj571g0Sa+MoJH7+RvWhX1GLmBDFc/LbT
 Ai2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mckMPTkCyS4Zk3UbqEVoxVZHUCeSUmL0hEXx+XAMNhk=;
 b=Xqxw3lh1I2Sn5beATTyw8HHtXPS7TPx9yqlque/wM/c+2r7L4KgNUeOMZo0PuSVk60
 Q78ikEY1Wmh5lOkccUFmJg563BpGeZ61J8tEN6CGXuPk7VGlxw131nyIaa2ypDSpvtwD
 crIqZKJmj+Z1tmDAsD5uA86x67XH5FUripNBnaxMsUQ7yaaAZ3mYDlYWwccngg0mMQVA
 bCQ4VhArOuez53IWcSVTzUhyV/OSJSnZRSfYf+o5h7QNOO2omK1wB8Qa15S19dhtMW4F
 aV7MsXcXSrOrfrSf10rCnbkGXNYAXzOcRrFs5luvnvRxwAPlBFQU+c9O/jqkN2/tFfiM
 LSQg==
X-Gm-Message-State: AOAM531e0Bdu4oKY1hQztLww0CEROTahig6CEqHJ9pEipPWJz0IZzUrY
 55wN2BXSqKQ7Ac8QQgCjBmM=
X-Google-Smtp-Source: ABdhPJw9e7gNMVtGoIR/HDdtwaKmfiVhePsBDQHIqGuBsY6UNCUhDw6VM7vD8R1kYK4e6XeFVvCUZw==
X-Received: by 2002:a5d:5504:: with SMTP id b4mr27276969wrv.307.1635762806461; 
 Mon, 01 Nov 2021 03:33:26 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z8sm7370009wrh.54.2021.11.01.03.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:33:25 -0700 (PDT)
Message-ID: <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
Date: Mon, 1 Nov 2021 11:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/31/21 17:43, Taylor Simpson wrote:
> Tests for
>     packet semantics
>     vector loads (aligned and unaligned)
>     vector stores (aligned and unaligned)
>     vector masked stores
>     vector new value store
>     maximum HVX temps in a packet
>     vector operations
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  tests/tcg/hexagon/hvx_misc.c      | 469 ++++++++++++++++++++++++++++++++++++++
>  tests/tcg/hexagon/Makefile.target |   2 +
>  2 files changed, 471 insertions(+)
>  create mode 100644 tests/tcg/hexagon/hvx_misc.c

> +static void test_load_tmp(void)
> +{
> +    void *p0 = buffer0;
> +    void *p1 = buffer1;
> +    void *pout = output;
> +
> +    for (int i = 0; i < BUFSIZE; i++) {
> +        /*
> +         * Load into v12 as .tmp, then use it in the next packet
> +         * Should get the new value within the same packet and
> +         * the old value in the next packet
> +         */
> +        asm("v3 = vmem(%0 + #0)\n\t"
> +            "r1 = #1\n\t"
> +            "v12 = vsplat(r1)\n\t"
> +            "{\n\t"
> +            "    v12.tmp = vmem(%1 + #0)\n\t"
> +            "    v4.w = vadd(v12.w, v3.w)\n\t"
> +            "}\n\t"
> +            "v4.w = vadd(v4.w, v12.w)\n\t"
> +            "vmem(%2 + #0) = v4\n\t"
> +            : : "r"(p0), "r"(p1), "r"(pout)
> +            : "r1", "v12", "v3", "v4", "v6", "memory");
> +        p0 += sizeof(MMVector);
> +        p1 += sizeof(MMVector);
> +        pout += sizeof(MMVector);
> +
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 4; j++) {
> +            expect[i].w[j] = buffer0[i].w[j] + buffer1[i].w[j] + 1;
> +        }
> +    }
> +
> +    check_output_w(__LINE__, BUFSIZE);
> +}

This test fails guest-tests:

tests/tcg/hexagon/hvx_misc.c:111:21: error: unknown register name 'v12'
in asm
            : "r1", "v12", "v3", "v4", "v6", "memory");
                    ^
tests/tcg/hexagon/hvx_misc.c:362:9: note: expanded from macro 'TEST_VEC_OP2'
        VEC_OP2(ASM, EL, p0, p1, pout); \
        ^

