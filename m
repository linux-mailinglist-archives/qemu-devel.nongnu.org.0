Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B54C059A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 00:54:29 +0100 (CET)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMezE-0001OW-Ml
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 18:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMexX-0000Tt-6j
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:52:43 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38728
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMexV-00063g-Rr
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:52:42 -0500
Received: by mail-pl1-x62c.google.com with SMTP id m11so13542696pls.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pza9QY5ebZlVlPfc4S7Dsyi2Cv7DoCaBAKWgybMdDg4=;
 b=XTojtEyGUiRk8a6+P3I65leGop0t1Z+7j4itHVQvKBUfVG+d1AYBqoVIF4rI2mWFks
 PUHUIM1r3mQo6MgZTfbY9aR8zHa1Q/qtbXK053e9fhg2A8x9SlmMAE9h0gA0hrjzPhvz
 I4rHpJw5LQAQQMy08z2/G7sPXuwXxyVuE6Zl5jbbulqT6k/cJ9ss+SWW3OUNOCKM0Cpw
 OtdOJtJcxfAYavVPtgK3YCUZYGTZygh9tIZeUfeqx3CaQ/Wtx6T73LtK19LpmA10XdwG
 lIzT9DlNMoKdWlkJcdKjfg6fEQmYYBLnvaUjm+SBxkkqUgZ0B7jfIaWL0I21WYWEj6B4
 IAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pza9QY5ebZlVlPfc4S7Dsyi2Cv7DoCaBAKWgybMdDg4=;
 b=RM1cfvK/mUUit/dtKZ5TJEynafa0Sv8Ax00sjDtmp6HsaYjFwzpt9K4GV6BSye6xHi
 PuN8NVkd4o6MQJpvHyKPHIbPhJihHGHYXm8+t8Ah4rRNPr8DQh4nheVmGFGqMvNSs7V6
 jH9ryDKPazvfN81pAE2IJDTmMKHzM3Dq/BQGWDQLoSLGYPtCR7KliPibVjGfwxcNkCD4
 O77t7/M6nCoie9GJpeYB1m44z3l4ydgNQMuDwy2gl5rt2PlCVfgxBwnLreJ4JkalZiSL
 KZSBSz01u18wSvisrtjjDhP4hg0KT1QZYnFnHT5XKq2oOqTLUyk2oohEwbVqHFvRMwTk
 Ps7w==
X-Gm-Message-State: AOAM533DLunym+CRvgr5g7OJZyULFRPRULaXE5JpjHlnXDZEiNxDT/FY
 7mFtQE/ipKBpHvdLLamxyGY+zA==
X-Google-Smtp-Source: ABdhPJx7cABmrvCrNlnSvVFVQ1EwxIA3PUjI4eCHJQzQ8OVy0OTjzYskTaeRpYvMzO4NluYfO7xcjQ==
X-Received: by 2002:a17:902:d647:b0:14e:ec42:2d86 with SMTP id
 y7-20020a170902d64700b0014eec422d86mr24751917plh.38.1645573960158; 
 Tue, 22 Feb 2022 15:52:40 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm742466pjg.24.2022.02.22.15.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:52:39 -0800 (PST)
Message-ID: <e7e75d69-024f-d4da-d1b2-420e7a017c26@linaro.org>
Date: Tue, 22 Feb 2022 13:52:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 34/47] target/ppc: move
 xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-35-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-35-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
> +static bool do_xsmadd(DisasContext *ctx, int tgt, int src1, int src2, int src3,
> +        void (gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))

Missing a * before gen_helper.  Somewhat surprised this compiled...

> +static bool do_xsmadd_XX3(DisasContext *ctx, arg_XX3 *a, bool type_a,
> +        void (gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))

Likewise.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

