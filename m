Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F66F827C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puu81-0006Sn-Rq; Fri, 05 May 2023 08:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7z-0006RE-P8
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7x-00022f-4u
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bd87539c2so2663927a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=V0lalG9XXtCujSphE2jmcN7CLGLfvn0ySJiaRM3ot9Pozj01nX0C6Z70vzHr0uFV+F
 Fbqxm8wXkpBxsllSId1BPlxw4OlePFCF5oBzdj7paqlFL2itqxrU8aSvn+UHts3BaXys
 h4w/SAKTurLhJDLFVoM0IOg2CNlq2AP1bNDf6WmQWKb8sHUD6aFN1TPj/gI78Cm1Lmaw
 BxaNcazMnodF8SPBCXmtDutjwZ76NsbZ9pxgb05m2aODHOuj7Q/Dn13Z5MXPKyAHMwgl
 xc3DpxT4HYv9BhDd6UZJtV/RPn93hj/4FZfxIQ5jJ1Kp5yEamEKqq5du1dLue6IsDzhO
 Zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=airjZM9FKif3Zpbq/YWBT/nZjTf6wIzfBtKT4ZDr8CxvCF4pKTSg8mehkxTKxnAiC8
 FDAmzZSiaJVc7Np/9MVwlLKUR95LSdX2dVUMGupn7684u1mFz9gcbXQIirbaU5t3yu/b
 TcPeHl6iNWKWa24Nqi0je2pVkocO0nIDAojLgMVJIcxygH6AecISsLy2jLVtMJ8WvAF7
 uyKz+QemB9TlIEiZpBuMqdindGliIiayWIonPI8u6Wovg5aLaPa3q5FCS7f/xG0lBORo
 Nz/SFGpBIC/X7GGtb1C81+/v1ouU6Y47SAblPhp66efXJ1l1p4J0HRpmnknL5rLSeDzO
 5F3A==
X-Gm-Message-State: AC+VfDyw2Z54OOnhkQ3b+14MkU5mqsDKO4TfHoqkurVYvIVIPzqyNX/c
 7xdKmooglDjkChl38yUeF2zawWLIji9EpPWZ0lZ91g==
X-Google-Smtp-Source: ACHHUZ7pDm7LgnyRLkGask/K4Is9uLtQ3FPEDhcx7+lrIW1zes640dGEGD7JEmSHYCHkdmJrbtZfGwdLdURudUp3gCo=
X-Received: by 2002:a17:906:ee8e:b0:95e:c549:9ace with SMTP id
 wt14-20020a170906ee8e00b0095ec5499acemr813409ejb.62.1683288090174; Fri, 05
 May 2023 05:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-22-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:01:19 +0100
Message-ID: <CAFEAcA_eSG4c1CKgOgOphM2yUZ1pL3AM6muf8Bcyx8zwXX9sSg@mail.gmail.com>
Subject: Re: [PATCH v4 21/57] tcg/i386: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

