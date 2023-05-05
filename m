Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496476F842E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:36:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puva6-0003wz-MO; Fri, 05 May 2023 09:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puva2-0003vo-Lf
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:34:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puva0-0003ca-S9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:34:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so27192913a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293673; x=1685885673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JiFvrogM9FNyydo5CDO77mDwZeLm4Zeu80VVzg83FQQ=;
 b=MfS/3yTJzsT1NxRogUvsXhH7SUJ9wfhn/XfzSgi+/o0P9YBIk7BBluRNLbCZKm1aP4
 N2CixsA2I8nRD8kIjcWhJzkE01j7ho29mg+f0J9PV33BYtu/yx+/LsMzAiBACxz2zXFV
 ncdiuUnU7fwt0viakcFlcPhIJbVNqx01TyKA+Nzd2osacMoDcrswph3Pouqp8szZmFl7
 4suQPlOMJ/zFmxDtfW2faqRYMQanHtl4HJyLapqSY17wI/SW1+WvEhrUbFxQ+5uNuhnX
 MhF2LO84NrlLpth8D5gwuZON4gSFjs31dnBreOwkg/4IuLRBshUmkOCfj2B6zhyzkpIg
 tPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293673; x=1685885673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiFvrogM9FNyydo5CDO77mDwZeLm4Zeu80VVzg83FQQ=;
 b=d3T+xGfUmT/S04boBOtDG54eGqlMvvsEcEFdrZoR/zVTgdAuTEfCZzERPVJH5HEfXA
 lASAb2V499Jf/IWY0JctAvSgaxOV+PP7KdWR6dTIlwiudU1EX5wfi/1D3LKP8Ass+Udd
 eLVm6LIxj8sRK9o3JTibCNA0ivj9jTpqZYXhDufmTD1GdXAnNEuh8v+UScCBcycLIsnJ
 zAa/XLNwYsG319Kx9WyycunIRS3r4j5sMqDmep7NrPoIKdh6a1P9rBGgDl8RaVacWnhT
 Dj8eCmEWONhYOpmGrROSzVgO4A+iPz1xvuqOqnpjurMKtABk7rYPKNgpXfr8qlBUHvpn
 /hGA==
X-Gm-Message-State: AC+VfDz5Mr+xt2fLL/tpK28UMQ1QGw5+gR7QDXK8kj8dYHkB1r+5Pkqi
 OEgOKtVn1hMtoXKf8pAeXFLYCGR0NQLX3krMEvzEdg==
X-Google-Smtp-Source: ACHHUZ7LVhXwUemg/aIH8V9+eOi1HByZMaHy69hsZAHOfWcVrcZRkhCqXaj8nfWTOuTDa8IqGdDQgskx1cyKf2k9654=
X-Received: by 2002:a05:6402:5202:b0:506:bd27:a2f0 with SMTP id
 s2-20020a056402520200b00506bd27a2f0mr2333862edd.15.1683293672734; Fri, 05 May
 2023 06:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-54-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:34:21 +0100
Message-ID: <CAFEAcA9s+_XsbiKEaapmt0Wi_F2D9fykmuFdvRh3QRFDRsinMw@mail.gmail.com>
Subject: Re: [PATCH v4 53/57] tcg/i386: Support 128-bit load/store with
 have_atomic16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |   3 +-
>  tcg/i386/tcg-target.c.inc | 184 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 182 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

