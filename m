Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1746F832A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:43:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puulH-0000r0-Rs; Fri, 05 May 2023 08:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puulF-0000qB-T8
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:42:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puulE-0008Jm-Da
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:42:09 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso3322860a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290526; x=1685882526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HRfaO2e+ySs0LwBkN0aMeaZi/Q32IBPUuRmQDFHFZbA=;
 b=tpGxdHJYspAs8aKp0rhjqoiGrPOvljvD8WFnHOyh8eWFbhHMFQK6yJ+7rgH4SiwMum
 kKl4jY188R6DJpW4AYM5V1ygEuJCMBAoNPu8Q+T+Vj7YfojW41LPHGyp+zzBcoaUnX2i
 qLU1jgFxuVbTRe9Z3KgYQLPtul0HirrJeVfW4iALw8nUb3QRkg64jum8xbridhY3pvqr
 NGEgFxquFaHWMe7e5yl0nA8+BA+r37XFoTxvHE9wnbHotMhsUl10CW8Tz/hGQDF7zSYX
 T8VsiGDvORPH/M91OO+/sYsan+0crEVgn+mDq9NMhQ0CCTfTqCVSbX6cmG1XC1DzVdBY
 w4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290526; x=1685882526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRfaO2e+ySs0LwBkN0aMeaZi/Q32IBPUuRmQDFHFZbA=;
 b=jnQ93o9lDQsVQhgGK7QtFhjN2w937TZdJylsn4nI4Kb2MU6bCMvUg+mXvZDn83Sgrn
 2J/JZyT0GuSxntEhSOrc6bzwyuzMeHp4NXj5V9IdADMh+L8j8n2iudiUIzZE2otQcKC8
 UNy9vpviK/syhLGpyyCdFIGEp3RoAmdhHaCmaXvTvLyIv8HUotAkKhPv0V8coJS3cHop
 d2T+pU/u3+0bkkR1VaEpSxoCBFpPqckiQDCw2O1D4M+yCIValzlXSqcTDw7CnRb/Kss+
 nTy4QWdFdOVKXMqNHiFs9/JzsDUj18PJiWy9Jd5dHLPAB6wYOXxjXN3LBnswqYck/gK5
 2O0g==
X-Gm-Message-State: AC+VfDxjTLVP31PQjVulpxCmEmHMLl+BGuCZyCir5SRmIycte7pe/dnQ
 xYael5hhBR2AlG/aH9gIEDqQiF4RdbabH0d+pVsBlw==
X-Google-Smtp-Source: ACHHUZ4U8rKK1vH+TvTYCQFhMDHfZTEFBEsi966xktLotWHECwPQwl0G+ye07+W6YV74+bA+WxYnOeRPqLFZsT1aOuU=
X-Received: by 2002:a50:ff18:0:b0:506:bb0e:bc4e with SMTP id
 a24-20020a50ff18000000b00506bb0ebc4emr1152081edu.39.1683290525710; Fri, 05
 May 2023 05:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-40-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:41:54 +0100
Message-ID: <CAFEAcA-gxwTpU4=y7+-9Pu6kWFdiA08AOhmTbs5aSeUZ5+mq2g@mail.gmail.com>
Subject: Re: [PATCH v4 39/57] tcg: Introduce tcg_target_has_memory_bswap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace the unparameterized TCG_TARGET_HAS_MEMORY_BSWAP macro
> with a function with a memop argument.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

