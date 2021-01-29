Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C030908F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:26:23 +0100 (CET)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5d9i-0008Po-Pv
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d8Y-0007fl-4g
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:25:11 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5d8W-00038V-HO
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:25:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id a10so15290832ejg.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ksmwsyH6yyc2Nh5FgxhJVAMo1SSkXP9xpYFCnnH8Kt0=;
 b=WYwRvgRy1FLflrwBICwA6+ZFzqR9IRCicMWRBhIR2dETfGSPZUjq/k8iBatQGypqka
 b7V2b54cRsPGddZmT126CnoEgsjC9Fti+lXEHHWvIiJmMhLs5v1axz12hFrJkmpsMenW
 WUgVwOO85shnjP8w/+OTLpUU5ESVrILLeJ5IGm9x8hR3d8SjmCz38dkuI1OLKeZjCyDu
 EKYxcSYhk3ffQbotod6nJzv1eTi9eua5hsc6Hx785CRsHm9Q/AG/caej1c21xBR53C1O
 9MD07vW2rh+tK1ccOhs6NFF3eyu9ufn6HKQ4KJdK5C5rZTJA6p51zt2dxOa+Ww374Zuf
 NxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ksmwsyH6yyc2Nh5FgxhJVAMo1SSkXP9xpYFCnnH8Kt0=;
 b=RNIpnyipMTw1ioPaye+UWrC+oowcrFkZcEEJBRXoSLDaFqtYJISatovnYpJ8DftREY
 JbV5nppUhTZTnpZj0HzYkz3E3mS7gv3tYgIwAfCY9xdasvQDtKNH6ak/5OfTUORezfHm
 A1yBKEFWOofj2P6fauvkkSnYJL79A2B28IOLln9dPADJQdQve8tmkdPK6owhpzOfKf6m
 qlVC0CVNc7egvAcS+fHd3ctkD3Iwz3FCO07yCTDEp2a4/+vxcX0q0kT4jqV9wa9h2Z3p
 7GI4KQa6Hi4mdEYEyx9QsMJs7MdlxoSp6G/DzHZKIVkDF22ScyuMbPstHoAagqYYFLSw
 bD9w==
X-Gm-Message-State: AOAM530uMIiedmByBOS0eDRHpuUnLvruKLm/lNj3ixyrRfiaWNTvMDYw
 vA3DYTW2+QjJXFtYzZpLFyu/biuNLtUFwMa5JLzEjLihEcY=
X-Google-Smtp-Source: ABdhPJwuKzJDVvf0NgElZy79FE87+kYL1FGh769rdL6boqtGDBLMAjf87AOvmxhT4rmdSetgO+WVlYAib6PwwTTVfng=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr6879258ejt.56.1611962706933; 
 Fri, 29 Jan 2021 15:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-12-richard.henderson@linaro.org>
In-Reply-To: <20210129201028.787853-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:24:55 +0000
Message-ID: <CAFEAcA-FAqJq2O7pV5M997EqGCOoHHBFg2aMhmWc1+TvPAvhOA@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 20:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
>  tcg/riscv/tcg-target.h         |  1 +
>  tcg/riscv/tcg-target.c.inc     | 52 +++++++++-------------------------
>  3 files changed, 35 insertions(+), 39 deletions(-)
>  create mode 100644 tcg/riscv/tcg-target-con-str.h
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

