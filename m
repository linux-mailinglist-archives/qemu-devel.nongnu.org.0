Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B753FC60
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:53:13 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWpj-00062N-LT
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyWFT-0002vf-Ba
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:15:43 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyWFN-0000uf-Dq
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:15:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id c18so7097401pgh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LcqUrbLLv9pourVUGYNlorfjZMqVl7gUhGIMxPivgys=;
 b=KwTr9Zf/05qn/3czBhylaFMhjtI3DO2FOaftAppnTzeZJY8pTcmWZytwFZ85WOnPV2
 3Uox9/uJSEmDEpzuPhhBQd/lFEuuiAcFCJQX4Obrc0mxkDDQHYcdB8zAPFIRB2SxfVJE
 pIuhz8ETeACA6YNCan1Ne9x3jDlJB9Ech2WWLhvjfr9s9spShOCt6bW/Meam3Ysq9cyT
 +zAA6ZMIqMRMfSfEqiJAPen5O6YRFQGr7hcZ60u8qtrcparoTPs10VSCI00RE4/4qqdf
 JtUoXotQGYBbAoW4ZRW3YsNyQUBnRBY8oj1pmsOvSBgqGZ9XodLt8Md27eGoXrHdpN9z
 sGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LcqUrbLLv9pourVUGYNlorfjZMqVl7gUhGIMxPivgys=;
 b=bp7uR88fuuZkf8SOf2F+bgj/EQ+ar+wUdn5Q/CCjDbG0Prq43RF4MHrGJBuy66jhG9
 +z4h1hgrBAf9WkJNGUVd6jK9V2sgK7bwyKyrA8uAbMlj2a75t00hxHo699/jq7maYEMw
 lh+URnr+e5YVeHTadXFL/K83OYL0asmEjyqsDXVka6x1LkE2TUHQbZeIFfld/0hP2LQw
 9iMta9sJthwxDKEkkbIrNqpNaf95lMngfVmw5rAPsjLV/m6KuLef3GjTDrCpnCCbs2OP
 Q/EX+7jN2jQzwUD8V7+bEunQ9dPKbis4gqXIQM9Oqd8Q+hVy/4NBg0APR/YzLdTuV0kF
 /mUg==
X-Gm-Message-State: AOAM533e0uhVb7jEde/JZJ6OM425aWAj85dvz6TgHC4VIlopO1apAvv4
 aEJE2eZjReN5h0VjgrsnBAs=
X-Google-Smtp-Source: ABdhPJwF7euhPbu6mznzPI/mjL/fBupYUrbeqn1YL+Sc0Abu2sUU6r5jFIDf4xE7do0ZNmx289d5HQ==
X-Received: by 2002:a63:90c9:0:b0:3fc:f0c9:d0f with SMTP id
 a192-20020a6390c9000000b003fcf0c90d0fmr22035338pge.608.1654596935852; 
 Tue, 07 Jun 2022 03:15:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 jh22-20020a170903329600b0015e8d4eb25bsm12096312plb.165.2022.06.07.03.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:15:35 -0700 (PDT)
Message-ID: <d0d8c975-9e85-adb0-8331-554d8b8fa30c@amsat.org>
Date: Tue, 7 Jun 2022 12:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] Hexagon (target/hexagon) make VyV operands use a unique
 temp
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220606222327.7682-1-tsimpson@quicinc.com>
 <20220606222327.7682-2-tsimpson@quicinc.com>
In-Reply-To: <20220606222327.7682-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/6/22 00:23, Taylor Simpson wrote:
> VyV operand is only used in the vshuff and vdeal instructions.  These
> instructions write to both VyV and VxV operands.  In the case where
> both operands are the same register, we need a separate location for
> VyV.  We use the existing vtmp field in CPUHexagonState.
> 
> Test case added in tests/tcg/hexagon/hvx_misc.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/hvx_misc.c    | 45 +++++++++++++++++++++++++++++++++
>   target/hexagon/gen_tcg_funcs.py |  9 +++----
>   2 files changed, 49 insertions(+), 5 deletions(-)

> +static void test_vshuff(void)
> +{
> +    /* Test that vshuff works when the two operands are the same register */
> +    const uint32_t splat = 0x089be55c;
> +    const uint32_t shuff = 0x454fa926;
> +    MMVector v0, v1;
> +
> +    memset(expect, 0x12, sizeof(MMVector));
> +    memset(output, 0x34, sizeof(MMVector));
> +
> +    asm volatile("v25 = vsplat(%0)\n\t"
> +                 "vshuff(v25, v25, %1)\n\t"
> +                 "vmem(%2 + #0) = v25\n\t"
> +                 : /* no outputs */
> +                 : "r"(splat), "r"(shuff), "r"(output)
> +                 : "v25", "memory");
> +
> +    /*
> +     * The semantics of Hexagon are the operands are pass-by-value, so create
> +     * two copies of the vsplat result.
> +     */
> +    for (int i = 0; i < MAX_VEC_SIZE_BYTES / 4; i++) {

Nitpicking, possibly 4 -> sizeof(v0.uw[0]).

> +        v0.uw[i] = splat;
> +        v1.uw[i] = splat;
> +    }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


