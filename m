Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936F6606FD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsDX-0008Vo-SS; Fri, 06 Jan 2023 14:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDsDH-0008Uw-8G
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:17:19 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDsDB-0000ZB-Vu
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:17:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id v23so2408691pju.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yuOCkoT28gTmH6E1SNfrGuW7OUSb9y4HREmkdBx8UuM=;
 b=jPtPWEc7RUfDsqhkbO+jZjsQIxyKvjoI70sr6T+x9a79I1n5vB+neZAgCOdk1jUI1z
 oFruN8U+VXlSSn0Q8qP2kOz0tVZE+eEHgTWpFCf0rHELWQiQPEJuHLFfVOUby/ZTHYqG
 Z9MdFl+87nKoLbAswEK/LZvUtJF3zDUlESUMCgvGRiKs3I+gG1DJ7+7C0sTE8aDAmYOw
 2axJDZp32qJ8EPjOYPqGwIUXVT+1ic53hbe7ydmgNHGfIwFOl4KBm8ooHvpcd1vtiZoH
 vBTc/j36zm5/c58oj8bu/GynFKkFT3wZgtSlN5tZ1yOYqbFNbPhySS5HubKPTL+ipLZ6
 5/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuOCkoT28gTmH6E1SNfrGuW7OUSb9y4HREmkdBx8UuM=;
 b=nbZBMUz1JJd7sX2cbCrphpym0WzCVu3FgezTqB6uLdCPg2YJ2j95NGKpwmoAHBtAEF
 aQlisQ8J3KRY7r45BLa8iOMF96qjDcA6geNrXinfmXQ+O51cx+7zhhKo6vYxKeIVETvI
 rjqlUKCqmBvgDHQLGCUeLqApfLi5qtRny3QdLQ+XM3uTPoGy2Ffx5YAXrGqnFouJLyRe
 k6LqQtgq1ifDjpAU/NC6dfbvr8n4zBSHAb+iOOBCMYdfaTzD7tEM51Fmi75nlmHcJSkq
 FH/4L0HXI4OFTpP+lEZYGXQPJ9CMI7pbjxb8kyQ10gWmyjmBJUoTXHke1apk1uX4INLv
 qdCw==
X-Gm-Message-State: AFqh2kpNwwqNLapHraTQir0TkPqB4IA3ivY/QqqZ1UdHGHc4EOQbeovi
 Pd5k86ZmYGr/MyNkJ+eXXvbumkzyTsP7xNwMzGLjDw==
X-Google-Smtp-Source: AMrXdXucocKfkGPt9V2HFTHGkwTVBIocaXMlFdKjFeWDcy2Jtg0/CLbwRXt1vsjVo3d/16ws+4JN7cvsFufDr1UOAcM=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2591959plp.60.1673032621209; Fri, 06
 Jan 2023 11:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-17-richard.henderson@linaro.org>
In-Reply-To: <20230103181646.55711-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 19:16:50 +0000
Message-ID: <CAFEAcA-m32sjkQSSkM1QopiqKgn+4OLTxs+c3w-+zck8Ns86yg@mail.gmail.com>
Subject: Re: [RFC PATCH 16/40] target/arm: Represent the entire MPIDR_EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Tue, 3 Jan 2023 at 18:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace ARMCPU.mp_affinity with CPUARMState.cp15.mpidr_el1,
> setting the additional bits as required.  In particular,
> always set the U bit when there is only one cpu in the system.
> Remove the mp_is_up bit which attempted to do the same thing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     |  7 ++--
>  target/arm/cpu.c     | 80 +++++++++++++++++++++++++++++++++++++-------
>  target/arm/cpu_tcg.c |  1 -
>  target/arm/helper.c  | 25 ++------------
>  target/arm/hvf/hvf.c |  2 +-
>  target/arm/kvm64.c   |  4 +--
>  6 files changed, 75 insertions(+), 44 deletions(-)

Based purely on the diffstat it's not super-obvious why this
is an improvement. What's the rationale ?

Side note, we don't currently handle the MT bit, where some
CPUs end up putting the cpu number in the Aff1 field rather
than Aff0. We ideally ought to handle that too.

thanks
-- PMM

