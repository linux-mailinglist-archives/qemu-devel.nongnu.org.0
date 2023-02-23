Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAD6A0E14
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEWG-0006CY-IO; Thu, 23 Feb 2023 11:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEWD-0006CQ-Qs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:32:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEW7-0007Dx-II
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:32:29 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u14so9679314ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uviNt3lw24MHazb1piWlCKZx3R8PPhlJwbaiSWELna8=;
 b=Lhi5N/AgIHedOjgAfGedCU7bA/tbMIyaCAsMHmjTTgd+crfylSPD/9yhSX1ddMUkOG
 jtqh/f9Gdny5DcupXeV9xVULQ+ncc/+XTMHYtnF9rm/tzGytkDhDpi4htiBjccRuPg0T
 Zw+CKf3q/xwbySOtQUqh54Z7d1AjavhgPBXxgs32R/Ye4wzgy0tKdFzjqu+3oi94usHA
 T3QBh6t5I85BbFUOQ/ZMbywSC4gPssy8vKyjyHaOYiPq+Rq7Jqz3oBW+Hh9Jb18xONdy
 /LdmOljvfuSKQkLfNTm5d3jsIlGpPJrPn4k9679jnzPIxvEtUqxrmI/ke+QZszcx3QJv
 ccaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uviNt3lw24MHazb1piWlCKZx3R8PPhlJwbaiSWELna8=;
 b=thVlHRjo1yd1+WjhO4qxK1MKt2250EDxxYnN5G8imwg6tuDQU6+l5Bn19qep8H5dHG
 P2NRDS0v4314w+IkWEVIzzzIZXE3SXixkV4V23QjE4ocBy6lIBcnC1OeU1Ml1wY1MIkz
 kfac/883tCbG90EmahsiLPnAlvIxPXpwVWFtNABTole5QjgS8WGNq0wg7XA2SD3vmTko
 59UwQzMhY3+Rrd9RkjCK7/qBFMl2m2W7MAeal/aQBV07AKIbxwX+O4A9hRGFysu/6d5E
 GpCMpBdSRF6IpAufnoiAajznshl/6btSrMwX9Vaey00Ol2RJvx58JUqKdEP3Nb/SGQB1
 Vwkg==
X-Gm-Message-State: AO0yUKUYDdUgGWObBCguTIDaWVjuRVy1NMn2V+YwrPFBT/x4GszOr9St
 22lm+LbnDeLy9KMO1vxLTUqCssm6IhaCuknT8pgXZJmhOYHStA==
X-Google-Smtp-Source: AK7set+U/J3utWoJQ/G0HcTmqO0y+UMErB7Lrpo1pVwj4nDxjdsAwgawL1V2qtCbUNeLOUymiqA4NRrcqRVOuNVzs60=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1269488pjb.137.1677169938150; Thu, 23
 Feb 2023 08:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-16-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:32:07 +0000
Message-ID: <CAFEAcA-T=wK_Sp-z0LdbqeDfh=f+cf7C9NX_TVc3CPG0qWD67g@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] target/arm: Add SCTLR.nAA to TBFLAG_A64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 3 ++-
>  target/arm/translate.h     | 2 ++
>  target/arm/helper.c        | 6 ++++++
>  target/arm/translate-a64.c | 1 +
>  4 files changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

