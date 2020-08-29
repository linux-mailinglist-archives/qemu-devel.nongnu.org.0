Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC425640B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 03:59:09 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBq96-0004nJ-LQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 21:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBq87-0004Ig-0S
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 21:58:07 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBq85-0004gA-GP
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 21:58:06 -0400
Received: by mail-pf1-x443.google.com with SMTP id t9so1535472pfq.8
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 18:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xg7a5MDuZv5G6oZmTXPqF91ZxxtVVJWURaJIL7UKDcQ=;
 b=GoeDevt8M5GRIhId1sYr5bzoYlIYOdGf5SVQIbXBTY2vepslG2qzaMWiU5vMbI6Qnk
 O4vXOV71AIQqMAMFWO3UkXrcYOrwGT1ga5iPZtp2sJmHU5I0ukLfp1BbgImQHDZ8b/cK
 x+b1tlIo5x0J09FfoW0fdEfj5feU3vgJld6pT2C6tTxIrLZkIMN0thdg4+7O2PGjq7nr
 YkYbusxN34yxgNHb6XRcH8Rmnl8b9syJgCdAu3BIbUtAM3LbXxFUfMxLKNvV35/EdjA3
 LIIp+SNq9t1nDkpkKLSotFcNL2uq3sdgG9A+orZpZVia+ZVczdeLrgAKlwCeilKZTQJe
 bFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xg7a5MDuZv5G6oZmTXPqF91ZxxtVVJWURaJIL7UKDcQ=;
 b=pRU1l5ZLeOqq702WDlfdTWCuE+4f0URi+4r1hVMDQ7/YtgoH9U33KjuPc/BCt08ym/
 wgQb23A6nX10Fc2k6WzErM2XDKokmoBl9NxRAoq6fjG1Y4AOYU8+ScX40Nh7VXi4Pgep
 7O2gqtmdtkQk33M469vF1RYYIdP5Blwvf+wjsSs3QR0XjCfFaXvweKtChRK0keyOHjM9
 L0JtYt+9h9u9i3+8Oq95hLOxIrxij40HsXR8nH3skMVJPA0sQI9ZDeaoNxynPIVupzHV
 7zmsvTxgeNIfoQ0fnsEtAP5IT6pnUw5faBcHfC89qrxB1FLp6i5+lSCIePXJNTcMvyCa
 2BCA==
X-Gm-Message-State: AOAM532MHOqouzMd1XVcLpXIbu9lu5DU/dZTZFXZoi6z8W0xiRBjNZZw
 Ui6sTuAnDACFDZ+42imFMBLu2w==
X-Google-Smtp-Source: ABdhPJylRswLn00xZAPdqezpTdVJOfShSAeKsX6lRevKu1Cm/++DTTEqbFmhF/aJf99exZS9RRUFkQ==
X-Received: by 2002:a63:fc4b:: with SMTP id r11mr1084558pgk.342.1598666283859; 
 Fri, 28 Aug 2020 18:58:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i1sm701590pfo.212.2020.08.28.18.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 18:58:02 -0700 (PDT)
Subject: Re: [RFC PATCH v3 29/34] Hexagon (target/hexagon) TCG generation
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-30-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c139500-7e22-a99b-fe00-1c7eecb64246@linaro.org>
Date: Fri, 28 Aug 2020 18:58:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-30-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, philmd@redhat.com, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:50 AM, Taylor Simpson wrote:
> +/* Fill in the table with NULLs because not all the opcodes have DEF_QEMU */
> +semantic_insn_t opcode_genptr[] = {
> +#define OPCODE(X)                              NULL
> +#include "opcodes_def_generated.h"
> +    NULL
> +#undef OPCODE
> +};
> +
> +/* This function overwrites the NULL entries where we have a DEF_QEMU */
> +void init_genptr(void)
> +{
> +#define DEF_TCG_FUNC(TAG, GENFN) \
> +    opcode_genptr[TAG] = generate_##TAG;
> +#include "tcg_funcs_generated.h"
> +#undef DEF_TCG_FUNC
> +}

Just size the array properly to start.

const semantic_insn_t opcode_genptr[XX_LAST_OPCODE] = {

#define DEF_TCG_FUNC(TAG, GENFN) \
    [TAG] = generate_##TAG,
#include "tcg_funcs_generated.h"

};

