Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC134A3ED1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:46:55 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESKs-0005Nh-4m
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERz7-0007Qq-36
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:24:25 -0500
Received: from [2607:f8b0:4864:20::1035] (port=52819
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERz5-0006Cd-FM
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:24:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o64so13248658pjo.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KgKyz8PB2WIu0oQsNVV4ui8F88tB0EJOVVi/KC/eBco=;
 b=D4bDswL9UWf3PbYyye5anMlD1oZShRjrFS2XDQ/Mg5MINuC2L1Gs2fF2UrOMI3ZlZ2
 CN5Lm8qSmNJDRuSq4x96g0VIo9GLlQIBht9cTXtWGeDrpDA9aQrcHTEpqpqNce8Vs2zV
 kSLXoaMRRDN3+Y9JRAq82WhN+kY+DPLpYze6AGrqszVNIYAIyJjsLFzLj6dGRo033Zxz
 6AMUSrf/w4SYfUvlwN3CRVxpNOcE8c7rnnvkmimXChPcZLZVGLCeOvG5NvFko4Tvi46A
 +FYMw+bRP3PTRIGN++y//EXr8yRgOC2YpWp79s99Ktwv2TK+NJ7d8xewNs/juWHV6wtf
 SucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KgKyz8PB2WIu0oQsNVV4ui8F88tB0EJOVVi/KC/eBco=;
 b=y3brnSXG4HlHgGUKOr0qbuJ6+G+Nb6KDqgNaKMXJ01tmP2xZ5+I0NBTH870WKQ6TnC
 OYwlvHpjSOTZgO0QR+7+ZLzGr7SvDSW1lkKya6CIdS6bnJiNDnFjMrv0V7tM44wnZURG
 NJA9oOcaCEKz4cQKML+m5otvb6DdIYGOHl9mi7GWtAj1kndz0VonbEgw9vFcycGscX36
 pDn20JnJgiOs5Eb9+Ss9dLp/DCOCAAaTajZO2bEKDIagUTOBTW0G9fHvz1YWOJ4Pjavu
 xNVLsfuYW93nmpxWNdO7vZqsEW/gbF2yOJ0eZkwOLaVzXAUNH1KmCeGuGPlObCQ1Jjed
 zHqg==
X-Gm-Message-State: AOAM530eo75J7BKp1e+tnYDQeKxzB8qOn6qdD/eY/PU7LDjFPoNLd7qV
 +YCUAC/ST2TM4i74HUDV5nccSQ==
X-Google-Smtp-Source: ABdhPJzKcGZmxOCLfyIkLexle2ZgdhFEJnYZ8y8TU2TC3j1WCYzV1FpTbm+fOLbxyKFJ0TUw+sDMjg==
X-Received: by 2002:a17:90a:5503:: with SMTP id
 b3mr13697658pji.169.1643617462112; 
 Mon, 31 Jan 2022 00:24:22 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id t24sm19065320pfg.92.2022.01.31.00.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:24:21 -0800 (PST)
Message-ID: <c12577f0-8666-6410-023a-1e7f98240ccd@linaro.org>
Date: Mon, 31 Jan 2022 19:24:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
 <20220130235759.1378871-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220130235759.1378871-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 10:57, Philipp Tomsich wrote:
> As the number of extensions is growing, copying them individiually
> into the DisasContext will scale less and less... instead we populate
> a pointer to the RISCVCPUConfig structure in the DisasContext.
> 
> This adds an extra indirection when checking for the availability of
> an extension (compared to copying the fields into DisasContext).
> While not a performance problem today, we can always (shallow) copy
> the entire structure into the DisasContext (instead of putting a
> pointer to it) if this is ever deemed necessary.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> 
> (no changes since v3)
...
> +    const struct RISCVCPUConfig *cfg_ptr;

Use the typedef.  With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

