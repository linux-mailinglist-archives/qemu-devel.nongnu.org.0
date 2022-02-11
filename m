Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC74B1D5E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:32:11 +0100 (CET)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINbO-0006Oh-3z
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:32:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINXu-0003mT-DK
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:28:36 -0500
Received: from [2607:f8b0:4864:20::42a] (port=33458
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINXs-0003fq-DP
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:28:33 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t36so3265449pfg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iCfNbbPtdFEfYg1BLdMU5f2Ivg+DJhxhhieX4Q6Q4TI=;
 b=CsxylWx9N6YT0RC3+LXDHWSisXSUETQtc9svr4HbbNUzPtCH+h3Qy2fx2ZyUOCk49m
 CZIXLgkxXLLm47TU0zHNp2g8VJPAxv8KrgxOLOQoijm9cMrtF6A6K7FLiFbmF+ByMW+Z
 FZfcSuf7WVQ0Tknp7jAoJj/ZVKJNioeAkmf34enWR15/CsWLz1yLfYTgzyMow4oaE+yH
 LIcYgXnphX/XN92P2u3xadx6m3Z7GP2gq9Z4MJOlWdhMWR9rAyYYf4U6kXruHDFxT6lI
 ngj1v6sY/kG/OfDibIqhtGgZwpt3GUnmta2hXUR3MZDpT3g/WkxJq+JtbQh5dvwMOQq5
 o/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iCfNbbPtdFEfYg1BLdMU5f2Ivg+DJhxhhieX4Q6Q4TI=;
 b=LC8rB69C/+2BTMvYny92VcSKiM+I4dS78zwOhreWKc1aHZ0TfnWzpMj57QmZkpincp
 z0sVxLB7VyPmixnnWoa9kAjvmW8AnqRXujpheSjg2nvVuc9Oogh6FzYbIHgZMQn28Lcg
 f3sdU3Z2wGqUUzFUrOHg2T9vUSS1glRt6xMu0deM273LoNdy+rUBgIo4EWZbHdKmzBF7
 wwM4QNEWbBRPqN+teHV1PgjdJYHv4j1kaGbbNyWdQ/UkyuD/WBEHSj0vWO1dSWP7cK1T
 4mmR7hAOfZ7lofsq5X9O3jcHdA9w6YpsOQll6bfZ4J3GFqMzyxruoDvArPkXgXw7a2tY
 pIgA==
X-Gm-Message-State: AOAM531WyKcav6tOrt5+mWzDjttp9JU/vY/cD+xLLCFQ8R+7ziAjNA1h
 YwMgUNIyPBgH29aigJBLT9ulgw==
X-Google-Smtp-Source: ABdhPJy+80huXX+MC4lvkixzz/YZ68F2JEFF9BUoaHCjIFQnM5GQFNBBFFv2+o4JgRT8foOlcXvjJQ==
X-Received: by 2002:a05:6a00:24d6:: with SMTP id
 d22mr10822162pfv.36.1644553711020; 
 Thu, 10 Feb 2022 20:28:31 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id k8sm17963085pgc.89.2022.02.10.20.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 20:28:30 -0800 (PST)
Message-ID: <79c47b31-e420-ef84-20f2-f6cfb474fc48@linaro.org>
Date: Fri, 11 Feb 2022 15:27:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/37] target/ppc: Move Vector Compare Equal/Not
 Equal/Greater Than to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-10-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-10-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
> +static void do_vcmp_rc(int vrt)
> +{
> +    TCGv_i64 t0, t1;
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +    get_avr64(t0, vrt, true);
> +    tcg_gen_ctpop_i64(t1, t0);
> +    get_avr64(t0, vrt, false);
> +    tcg_gen_ctpop_i64(t0, t0);
> +    tcg_gen_add_i64(t1, t0, t1);

I don't understand the ctpop here.  I would have expected:

     tcg_gen_and_i64(set, t0, t1);
     tcg_gen_or_i64(clr, t0, t1);
     tcg_gen_setcondi_i64(TCG_COND_EQ, set, set, -1); /* all bits set */
     tcg_gen_setcondi_i64(TCG_COND_EQ, clr, clr, 0);  /* all bits clear */


> +static bool do_vcmp(DisasContext *ctx, arg_VC *a, TCGCond cond, int vece)
> +{
> +    REQUIRE_VECTOR(ctx);
> +
> +    tcg_gen_gvec_cmp(cond, vece, avr_full_offset(a->vrt),
> +                     avr_full_offset(a->vra), avr_full_offset(a->vrb), 16, 16);
> +    tcg_gen_gvec_shli(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
> +                      (8 << vece) - 1, 16, 16);
> +    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
> +                      (8 << vece) - 1, 16, 16);

Vector compare already produces -1; no need for anything beyond the cmp.


r~

