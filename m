Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4152A964
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:36:59 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr17t-0004n4-0K
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr162-0002vW-W2
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:34:59 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr161-00052e-DC
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:34:58 -0400
Received: by mail-pl1-x632.google.com with SMTP id bh5so6164214plb.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g3SgW/cDsiB+B9py3XRfiauVsaZghz9KsBywAhBl59M=;
 b=s4ojt1fp0tIS5UfeyiJ9BvpR33f8ZsCEFNKC6GA6UV2G5cFAiqI/D7DuXhUSzYe+hq
 B8CsvGZR3+IDnw+gW+DXzMhbnEYqVETSntToAia8zqsoiAqv3oSs4c10P7ziIoLRuiNz
 NytnuFKr2ZYd72rLAuz1AlrfyxhmJnuvKJDOGe3ACqIX08/g3lKBcwM07iGlfHFOyUxE
 nW13vjX+zA0uFtRNPaYB2V2mIG2+ggvFmcNlAyaDPPo0KD2Wc4Mkl3N5WIOq4nhr/Yha
 5Njwyqe9brprC8byvYv1plKU3BB4gwKHdXtoLzfvf/pjrvo+RG8rSmHUAqmZkrRdjYW/
 NGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g3SgW/cDsiB+B9py3XRfiauVsaZghz9KsBywAhBl59M=;
 b=s2ahV9GS1GoTWW+ERz7EuTn1JA8GolzYVTy4INzJ9UZPEyZ2vgdcmjw/UZtsaVfuFs
 LJ+YDqmtZwFUBM/rHDcWdtgHBYE/1SbmYmzCGzk7a1oalCDBm2/hEEqG4A3PI5L5P7DR
 q1o/BVDs54V7kqVHsE+bszW66BuOiY1MtriobtEXCK4YQNBmYA4Sp+Xb8YyPvqEQqB1B
 qVNaAhMgHhaOmWAspAMlrXGcJ0on12cDMk/bcl1C/yLFhM0qn2YBwd63SLvxt3F4u+tK
 HlSs0ewalRjJzkB2DowkZd9FDfmScuVSCtj6iChNqChz+WiMbAHRSV0X5H4uU8+mRXLe
 OhqQ==
X-Gm-Message-State: AOAM5332PWtgZVKdgZXF0fTyNeisOASvfquQ7l8bHlCfWF5vNEbSYKIM
 kthaT9a2GymyMrrEngcKlpzLpkGo6QuE7Q==
X-Google-Smtp-Source: ABdhPJx8OupdlCbzK/NWbnEmA5ifb3I0ymJr7DbV8s7cP0SbHpV65ZruEblmJl9uVlZsd16F08v8MA==
X-Received: by 2002:a17:90a:7e94:b0:1da:3b47:b00e with SMTP id
 j20-20020a17090a7e9400b001da3b47b00emr38096965pjl.222.1652808895865; 
 Tue, 17 May 2022 10:34:55 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a1709027e0500b0015e8d4eb1c8sm9471190plm.18.2022.05.17.10.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:34:55 -0700 (PDT)
Message-ID: <4b803b38-df45-98de-e979-514ddcdd7191@linaro.org>
Date: Tue, 17 May 2022 10:34:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 10/12] target/ppc: declare vmsum[um]bm helpers with call
 flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-11-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-11-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Move vmsumubm and vmsummbm to decodetree, declare both helpers with
> TCG_CALL_NO_RWG, and drop the unused env argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 | 4 ++--
>   target/ppc/insn32.decode            | 3 +++
>   target/ppc/int_helper.c             | 6 ++----
>   target/ppc/translate/vmx-impl.c.inc | 5 ++++-
>   target/ppc/translate/vmx-ops.c.inc  | 2 --
>   5 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

