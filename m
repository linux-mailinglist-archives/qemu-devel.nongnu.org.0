Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8F4C05C6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:08:48 +0100 (CET)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfD5-0006TW-Af
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:08:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfBo-0005lC-NV
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:07:28 -0500
Received: from [2607:f8b0:4864:20::531] (port=42821
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfBn-0008K5-3d
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:07:28 -0500
Received: by mail-pg1-x531.google.com with SMTP id d16so18369520pgd.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K23yEvifHiMnfm4m17erX0MAURBZ7J4Sj08XByCymoM=;
 b=PTmri1VJGxNRiN5GCPmMt+vf6IIej9IF3lPZAjgAdaR+0XvSHJE0XrmZSN5SlJCXct
 ix7YSjLHCJ1mDdkf75aIR4Ce8QsZsO7X5yQArPIButwS5PCHlpWlXn3hAY3F+7ciA2qc
 t6k49dMlZK9MHBdTjBYpUriPedeT7MeNRnAxXSe86JL2ApDar1piYAT+C1Cs4s/zqMvI
 rCvFUrmM7cPTntoIGFnvwWtfSCz5GsnUQv7bWwT/KomxCGpjqbZZFNjTv5IUf2sxwtEw
 8vE2Odurn6FVnCV6eDDHPRk+cZ2xhlD7nFlTfc23Q8EwbaW88si5cTBJKlmkFMQZB65f
 yxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K23yEvifHiMnfm4m17erX0MAURBZ7J4Sj08XByCymoM=;
 b=mu+TLjkZt3EThd2ajhlESJekZ5s0XJjPd+7uMYKbSOT2WGIypEw8mOS1UdH6pNXsyU
 sinK3HZ3gMJsG2XxRF0toQ2zz+/EK81Kbjg7UYwnuSA3yF8sl9SHHFF29OpY2D+CFohP
 wHtA1OuuqS3PdMdmsLozFxdQ+vHrPLYyxh4YDxr1Cf7CrjgYV4Fj6BAxMywR/yM+c+Gs
 dV9TKFsEivJTFu/sB1KKFnPqeTMcIYRUHrILOrGwWam1pQWwSMYtMYVxSJpo8ACbwC17
 Ez2v3sIl0hYE7DEBcjUs7tp1XHc56Iphsacxah2bYqXlIX5DsbWwAZBco6Wendtm/EP8
 dExQ==
X-Gm-Message-State: AOAM532jl/BbjJe83G+Z2mucrohgR3hsMpVQuC1SMh2AV1QmULAPmY6X
 5j3iRIg8qkic90EV6+YNU5bZIw==
X-Google-Smtp-Source: ABdhPJwL9xQLzsZ7QzZqA/Bs4EPOkgpMcZVbUIqnMtKZNjJ4VHTeyVr7kGL6JUZqZrDhMS/5d8CraA==
X-Received: by 2002:aa7:9253:0:b0:4e1:53d4:c2c6 with SMTP id
 19-20020aa79253000000b004e153d4c2c6mr27195467pfp.62.1645574845412; 
 Tue, 22 Feb 2022 16:07:25 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id q20sm858988pgk.91.2022.02.22.16.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:07:24 -0800 (PST)
Message-ID: <2f09af00-0907-a72e-7b72-c3b5234f6f0b@linaro.org>
Date: Tue, 22 Feb 2022 14:07:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 36/47] target/ppc: Implement xvtlsbb instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-37-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-37-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +        tcg_gen_and_i64(tmp, mask, xb);
> +        tcg_gen_movcond_i64(TCG_COND_EQ, all_true, tmp,
> +                            mask, all_true, zero);
> +
> +        tcg_gen_andc_i64(tmp, mask, xb);
> +        tcg_gen_movcond_i64(TCG_COND_EQ, all_false, tmp,
> +                            mask, all_false, zero);

I would unroll this and use fewer conditions.

     t0 = mask & xb[0]
     t1 = mask & xb[1]

     o2 = t0 | t1
     a2 = t0 & t1

     o2 = (o2 == 0) << 1
     a2 = (a2 == mask) << 3
     crf = o2 | a2


r~

