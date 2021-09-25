Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC3418299
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:20:44 +0200 (CEST)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8Xi-0004mp-VD
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8VJ-00046E-6u
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:18:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8VH-0002o3-Py
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:18:12 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so36147606wrc.11
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LypeGPp8QAdCL5YoG/WZpaTyANEXyGruv5251F8melQ=;
 b=UjYAf1aq8kwYNxq7+8/slx9GtoeDiIoi8I3CSfjainbt1pHG/Ka2h7Xr8XYmRzIs+a
 PdahywxdRO0QrNtPZco9rU+mp1cKrupVeNRc4sjOkcrDw+CAa2Emj1BJkmFijVXWI4kI
 a3yScs+hrv589JNeIfs5fvAzvIR/4Yec0yqJkP/PmHeUDjFAHpPiD+bWFLumVSlU3Ccj
 JJJL5tYo09+1sVfIvGAM3S6p8Ll9wIkOlcUMx0BCuzFq6ZO88ZuLWUWJciVn78mUeXpO
 R3jlXF/I2yd+DQMk3HAICdY7yIMzNQrMo42B5pFDrY78GuGihD4Cg6uk2qgNmjZ1BhGT
 Cz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LypeGPp8QAdCL5YoG/WZpaTyANEXyGruv5251F8melQ=;
 b=DfeIm4/obQNGRYsBrQyIfOwp/7tzP1FsDrAHJWxLUJJ58ISsVsMjpuHtbVWhChcRb+
 C7MxGlIYlz3PAq0+mkp6zeBdoZIzN23emhEOL57poi8cM+x+15B0LxGlsoCpfxrvA8rm
 P/Zrvd0ObmyQBCTsBnbDnxG5u29Vw8azXCVLPrkG/49rXrFRVOusizS7Dp47qI7jtJ2t
 4zC8VNvpoabxtTS0CCqzLtnLALIDS/13jq2qarrFtCxdI+vajn4Zut/kZkYwCPrq7zHG
 PnAGB+jQ+pUhGvDraOHz4VgGIoDike2RBxJqJfZ05hsMbKvo+lEhxd/8m86ZGSkUhVwi
 pijg==
X-Gm-Message-State: AOAM530+RLuEpVvqM2nZ+NwOwivNfUe64MFUtkZ+FmhbkjYlz64MzW5d
 tegpbmkZVohS57QDUc4KNl0=
X-Google-Smtp-Source: ABdhPJzrehEMqelF9NvOjHo53fMQMKXazau+ZfhlRoEHGmnp0k0Ie0S40AX3BNWMJ2y/tYwJAZ844w==
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr16872401wre.161.1632579490184; 
 Sat, 25 Sep 2021 07:18:10 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v17sm1235503wro.34.2021.09.25.07.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:18:09 -0700 (PDT)
Message-ID: <dd51b970-5ec9-1fcb-ce4f-ef2db9298e81@amsat.org>
Date: Sat, 25 Sep 2021 16:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 16/30] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr
 ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-17-git@xen0n.name>
 <f9afab7f-5c45-121c-42cb-a032cc341d8c@amsat.org>
 <403754f2-b313-8350-23a4-f21d806a9da1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <403754f2-b313-8350-23a4-f21d806a9da1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 16:09, Richard Henderson wrote:
> On 9/25/21 6:05 AM, Philippe Mathieu-Daudé wrote:
>>> +    case INDEX_op_shl_i32:
>>> +        if (c2) {
>>
>> Why can't we use:
>>
>>                 tcg_debug_assert(a2 <= 0x1f);
>>                 tcg_out_opc_slli_w(s, a0, a1, a2);
>>
>> ?
> 
> Because tcg/optimize.c can produce out-of-range values.
> We have this same masking in tcg/sparc/ starting as far back as 
> 1fd95946657.
> 
> Officially, the tcg backend generator must accept this, with UNSPECIFIED 
> behaviour. Generally, such out-of-range shifts will be followed by a 
> conditional move that overwrites the undefined result.  The tcg backend 
> is not allowed to trap or assert.

Ah now I understand, TIL again :) Thanks.

So for this patch:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

