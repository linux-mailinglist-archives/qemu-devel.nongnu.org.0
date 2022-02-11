Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266744B1DE8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:31:30 +0100 (CET)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOWm-0006aR-QG
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUV-0003ve-9I
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:07 -0500
Received: from [2607:f8b0:4864:20::434] (port=37466
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUT-0007Xv-Lq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:06 -0500
Received: by mail-pf1-x434.google.com with SMTP id y5so14318387pfe.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YNrCVzUUFWxMOG/bWT/1cRIBSFDIKjZU5g18hyG/afw=;
 b=WuuglQ03ZMCGmIYMF7nruA56VBogOIXvSSGxIr2zyw5nnPMRj7uiA0lcOoIMz2eExT
 6CUE5htvCC1C7S4LPBQf5WKlv0QNpYoVCwXTweDcKOe7rZmCvFcVlmIjUEdGcPyvkOJY
 5d7C9qVsncYIjA74naIs+BTTQYDu96Oq7GcZ+P2YJ4L0gRDM3kSx/ZmS6JDTUwQh5jcF
 yS3rmQOuTHp/Q395RR2/RjeLuDsb2v5dHGRI8zHda3nTGtByXhXkcK/SFY5bbmgckjLN
 S7FP/kAlMlNB2JD9MtjZnUUj6rEch+nV42wR+gTrUwX+ARW+FbtHKWF2eQZqkOHrO6BP
 we9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YNrCVzUUFWxMOG/bWT/1cRIBSFDIKjZU5g18hyG/afw=;
 b=WLE4hafJNB2tY7HGRmygfYatZE3S7hlZG5QkNPA0wU9fHDQ2/Cm25rPqLdqiBganAB
 lTnxfRfI4oPC4r6HpFf87LCCgZRViC0thmXtYRxHifzuU7nbOEEaKpJ7IES6J26OUGD8
 UjTs9Oh9GtmRhqVu1WKAo/409zebhb8tPRCH+OUH8RPiAfvqgQAEcaAaZfEEs93m1pKE
 izsC7a4UdY3Zz4ddGUPjW2FivSsNnnFDSZ565api8EhMjIPnF3d7p+PburqIiYsYrlsC
 uS+SzuXUt7QRsGqxiAZ14E+ywD3/TKkZXlenX4PWj05/F88PveelEG0CkhoTp94SkiSH
 hDog==
X-Gm-Message-State: AOAM5310pgSmahf8rjKzYstwRylEXCJ9UpeaJhmgdSk/qOqYOCpzVPd8
 K2jPpW72/uPOYnG7tS/kab+Elg==
X-Google-Smtp-Source: ABdhPJyXdcl70DcgYUKFCglWim17jfkvvcBz9Q1x2OiwKvFaKEZ6zVUQrP5atZus55qGM0MUZajLlQ==
X-Received: by 2002:a63:1c42:: with SMTP id c2mr37059pgm.356.1644557343094;
 Thu, 10 Feb 2022 21:29:03 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id q17sm18288976pgh.58.2022.02.10.21.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:02 -0800 (PST)
Message-ID: <59ea114f-199c-518d-a570-19d091d90831@linaro.org>
Date: Fri, 11 Feb 2022 15:41:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 10/37] target/ppc: Move Vector Compare Not Equal or
 Zero to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-11-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-11-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +static void gen_vcmpnez_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec t0, t1, zero;
> +
> +    t0 = tcg_temp_new_vec_matching(t);
> +    t1 = tcg_temp_new_vec_matching(t);
> +    zero = tcg_constant_vec_matching(t, vece, 0);
> +
> +    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t0, a, zero);
> +    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t1, b, zero);
> +    tcg_gen_cmp_vec(TCG_COND_NE, vece, t, a, b);
> +
> +    tcg_gen_or_vec(vece, t, t, t0);
> +    tcg_gen_or_vec(vece, t, t, t1);
> +
> +    tcg_gen_shli_vec(vece, t, t, (8 << vece) - 1);
> +    tcg_gen_sari_vec(vece, t, t, (8 << vece) - 1);

No shifting required, only the cmp.

> +static bool do_vcmpnez(DisasContext *ctx, arg_VC *a, int vece)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_cmp_vec, INDEX_op_shli_vec, INDEX_op_sari_vec, 0
> +    };

Therefore no vecop_list required (cmp itself is mandatory).

r~

