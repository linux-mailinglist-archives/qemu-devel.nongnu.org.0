Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A4B293ED9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 16:37:46 +0200 (CEST)
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUslk-00012n-R1
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 10:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUsjw-0007tf-Hq
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 10:35:52 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUsju-0001L7-O6
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 10:35:52 -0400
Received: by mail-ej1-x642.google.com with SMTP id e22so3086401ejr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 07:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gw5Lxt+HBtIRoi98EcrOfsnFo4nLxZc23yBIU18mjHs=;
 b=PGVS/QPTwDGcrB3XW/JR4HzN9YTE2zBE35pNsZhp3FW0aKSNgtsZysU0VU6s8pWrqJ
 JyqhVsIXIh2M67zcv0vHdgQxPFkPkEE+T2tm21p2b0aaqoESMWSVIvYGow3p73eBPlYO
 QEhA4ppExaJcLEFftYBimcRjL2ckOfeA3yp0kQHlHXrhaHwva7kXky2+qLi4HznY67u9
 eAdoQ7lR0h0qaY/uNusSz9A8F4JcSt3a+SWL08W1u6WQJ0gLdQYPoX+YJB6wJuiCXE3P
 nF9/Pq1fXzoFrHspQWDj6mNYWNu+PHBfjHYn8Y5y0eLiKOq60u0uEv66LQ0MbJ93tw8j
 wPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gw5Lxt+HBtIRoi98EcrOfsnFo4nLxZc23yBIU18mjHs=;
 b=hDchBRhYSfKpJYau8+AfWbOzc0My/axhvpmqvRpz99U+t/77Mg6C+vfyW2te1OZoKx
 PH8Ec1/RRtE01QMqCFYY9Sm3m4fkPkSLqXl081q/6uULZewHzt44rAjLYX/oJJkK84Dz
 9KP0PYyav6wc6xNT35c+F+2cpbZpLUQhjN1yXJRe89zpyZIeHs8pPpVnvc/IsWNwtCD6
 lC5Yl0oxnrLtTPXfyuCOUcRQQ6A6kuw4aKxlLMohj9LJTwLRFudeLvabATZw0MVB10Qo
 6oB2VKOp60awi+oCUPFSVLGMDhCdWcW/FP4G2QvzBKs3fErmBu3DjhYUdzxUf7WTaLJ8
 M6EQ==
X-Gm-Message-State: AOAM532Nq9CkkrZam2cFp1bNip+PHDb7RsnjtHE/e18gTdPlpPOhRi27
 YCAaZAVUg9Onx90Hs+xiD1+u6NjFvwZQg/bvK/x0cw==
X-Google-Smtp-Source: ABdhPJx3UtbsPF+OSLjq3ICIgF6Hfzf+7tG3VbBGXDlVVaHM1ocASxRY5nFbj3PfnoMsLdQXgXCBf4QUSx23XEaYtYY=
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr3541536ejb.4.1603204549262; 
 Tue, 20 Oct 2020 07:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201008162155.161886-1-richard.henderson@linaro.org>
In-Reply-To: <20201008162155.161886-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 15:35:38 +0100
Message-ID: <CAFEAcA8uBFG1tZ38Aumm+prMU+hv_tr7uG-hvttCudo6GHGHJA@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: MTE fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, vincenzo.frascino@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Oct 2020 at 17:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> One code cleanup and two bug fixes for MTE.
>
> Vincenzo, thanks for the clear report.  Can you please run
> this through your test case?
>
>
> r~
>
>
> Richard Henderson (3):
>   target/arm: Remove redundant mmu_idx lookup
>   target/arm: Fix reported EL for mte_check_fail
>   target/arm: Ignore HCR_EL2.ATA when {E2H,TGE} != 11



Applied to target-arm.next, thanks.

-- PMM

