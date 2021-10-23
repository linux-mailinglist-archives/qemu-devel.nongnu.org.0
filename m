Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC854380FA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 02:32:56 +0200 (CEST)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me4xz-0004kM-VN
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 20:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4wF-0003t5-Bk
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:31:07 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4wD-0006PW-Sb
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:31:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id d9so5058541pfl.6
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 17:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5nBS8zBCltESbnab6HkNV8AzUeMRU+TTQkwzcmKCZNM=;
 b=bAPIFTky7vHR6vaNspDvzqZqxVsPqdom2LUQK8jp2MdfQ39qfhTjvPxSzShHl4iLEA
 6U9WSlo/oqWnN1e15bTpzf8mG+kl+k9iPT38M7Sc93LxV2hRkhK/cR7POU5J+XpoVgtS
 y53Ohl+oRXUPPD2GvAWMyQnTWgSAjRYh3YD8qlLkc/aMxs76+RwDHLTEBFB/NM5B2hzS
 VXp/vOt5eLfpQoMaGX658UeMYmD7+UU+bnz8KFBgBl4TEUXuMx5YXUFHQOJpZ9vAhDsM
 I+VagaQxAAeO4l1XHZSIIkda/Lc38IxhEueQYE7v0V6xlPaiMpxMEQ7P7PFXPe39QilR
 7tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5nBS8zBCltESbnab6HkNV8AzUeMRU+TTQkwzcmKCZNM=;
 b=NscfGFQ75NGYoRTd3ojRd7qPR1jdxHun9AH+2Rw2fhSttNmrC/js2Lffx4iH9cx4YV
 8oFt908p+5MN41E9wANQd6NxtrQzvQKYfpkYeKoH7heQ8rY0Q7Dbn4r9KzovOOHXiYBB
 9EPjRooLghsGUIuWcblPg+weNGlZjn0LCIQRwAUovylGZTPpjMjNxbGinVyjTzS0THly
 AQEE9n+s/V+gQZO+x13ZwRalWDpnon9uFfLvLOH0WYz1Hoc6x6/MEwBN/g+4QRoqTuOX
 zrtlUx3G0/5a0xJdyIRGnLZQf9pfnuahh0lg5GgkWBmHuAIYibnX4EFTDPPSrYWebHdJ
 yPfA==
X-Gm-Message-State: AOAM530tnLdVhQ8usTp6Zc6u6ttth5LTVy8Wf3Yz6rURoCJTx58jKeGR
 +4w0g/xI2gw1bTbOP6qcbNym1g==
X-Google-Smtp-Source: ABdhPJxUy3rTNMIx7KERxJllgw96NsC6w+zWS9X7UK2mcGOLO0jHKO12kz+5KfdoojB2+PviTcR3GA==
X-Received: by 2002:a05:6a00:a13:b0:44d:c927:b962 with SMTP id
 p19-20020a056a000a1300b0044dc927b962mr3333335pfh.41.1634949063583; 
 Fri, 22 Oct 2021 17:31:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d20sm11079718pfl.82.2021.10.22.17.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:31:03 -0700 (PDT)
Subject: Re: [PATCH 11/33] target/ppc: Move vcfuged to vmx-impl.c.inc
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d842aee-2b2a-f6de-fb5c-93be5e5adead@linaro.org>
Date: Fri, 22 Oct 2021 17:31:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 92b9527aff..f0f6d561e1 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1559,6 +1559,24 @@ GEN_VXFORM3(vpermxor, 22, 0xFF)
>   GEN_VXFORM_DUAL(vsldoi, PPC_ALTIVEC, PPC_NONE,
>                   vpermxor, PPC_NONE, PPC2_ALTIVEC_207)
>   
> +static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
> +{
> +    static const TCGOpcode vecop_list[] = { 0 };
> +    static const GVecGen3 g = {
> +        .fni8 = gen_helper_CFUGED,
> +        .opt_opc = vecop_list,
> +        .vece = MO_64,
> +    };

You only need vecop_list if you supply fniv.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

