Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7368E4C05AA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 00:57:23 +0100 (CET)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMf22-000466-B6
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 18:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMf10-00031H-NQ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:56:18 -0500
Received: from [2607:f8b0:4864:20::429] (port=40642
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMf0y-0006oc-V5
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:56:18 -0500
Received: by mail-pf1-x429.google.com with SMTP id z15so7915466pfe.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e+IiydRQko5ZfaVSzUVlD9Tt37eqM6Jo9IBAyCTLhZA=;
 b=BFvSWhig8nIFwiJafl7tnBDVRDdI9MroLU29P/64n+BRJdmXOWNpxDxiQjF2pg9IMv
 FmhTnk+DTZyaqhN+H81CcMsHVTnWOl9F/NSfCpFhrkUCLKFShmRuTfEvUcGQEsZg7A8K
 wftqyfCmcL3MdAZYiNGWxTa51T2yTlEvIrOTspZX65ozduQjsvYX/AZ/HiEhphjh+x7X
 cffoWlE94oePd0w2WT0+m/REV61hMhKYJV372dNC9EqB2Tj1LF6+v9IZcYOlXhL6QlTu
 bUTpkb1JfMtPdQknPs7myHecgFP/jbTQSGSsOnp7IsN813tQkcjz7OV8cXHEpmlo/CAj
 Tawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+IiydRQko5ZfaVSzUVlD9Tt37eqM6Jo9IBAyCTLhZA=;
 b=ySd+UOtm685Q3By/x6e23Bopi6SA+oUfdDH6G2EYQmy4e+218x1RF1DZv0pv/yDF8s
 0zZEgaE8e4k0+E938QO+EqyhAJPkub+nFKq0/zlhOT0FbbGOvFjrk4mo/OrOc0kBTaNQ
 5PsraaueeP54sXFj3nXhNpGwRhg2Sw+r5ukTHaUGem/UnrnjHRvx6aY0E522oa/tqbiY
 sBvCcawO4ZkzAJuibi2rzk+xCj33laZXzrgQfCD4yW/xOfu4vTpuUWxVDp/BIz8agc5A
 noFltygfdQlsCZVTihL3CjkXS89cghJ29CcDFe/s1NvXPlkF87S/gbLTURshe0ZfsJ2i
 QDrg==
X-Gm-Message-State: AOAM530HwAbyWtF3OuSj95PlPIX9qu+C65e30iEAyLHw0qC4+iFiu/C8
 IINP2SyLV+0zimh7tzA8zVv1eg==
X-Google-Smtp-Source: ABdhPJyzUhQxuy27SMU8+21/ZwFWqspLDvAEtCdtbmyudKSGGrANQhShHbt0QeSLnjkGFux+ITn6hw==
X-Received: by 2002:a63:4d60:0:b0:36c:8803:b92d with SMTP id
 n32-20020a634d60000000b0036c8803b92dmr21587004pgl.179.1645574175606; 
 Tue, 22 Feb 2022 15:56:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v10sm19273510pfu.38.2022.02.22.15.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:56:15 -0800 (PST)
Message-ID: <9a9b87a4-9f91-56d8-d9f8-0e3cb818b991@linaro.org>
Date: Tue, 22 Feb 2022 13:56:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 35/47] target/ppc: implement
 xs[n]maddqp[o]/xs[n]msubqp[o]
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-36-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-36-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.0 instuctions:
> xsmaddqp[o]: VSX Scalar Multiply-Add Quad-Precision [using round to Odd]
> xsmsubqp[o]: VSX Scalar Multiply-Subtract Quad-Precision [using round
>               to Odd]
> xsnmaddqp[o]: VSX Scalar Negative Multiply-Add Quad-Precision [using
>                round to Odd]
> xsnmsubqp[o]: VSX Scalar Negative Multiply-Subtract Quad-Precision
>                [using round to Odd]
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 42 +++++++++++++++++++++++++++++
>   target/ppc/helper.h                 |  9 +++++++
>   target/ppc/insn32.decode            |  4 +++
>   target/ppc/translate/vsx-impl.c.inc | 25 +++++++++++++++++
>   4 files changed, 80 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

