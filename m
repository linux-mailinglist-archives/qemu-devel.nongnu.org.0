Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635CA6A9C67
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8f2-0001V8-OB; Fri, 03 Mar 2023 11:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8f0-0001UX-27
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:53:34 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8ey-0003ch-5c
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:53:33 -0500
Received: by mail-pl1-x62a.google.com with SMTP id h8so3276172plf.10
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677862410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vUiuUCLkGKHbQUlqBxlb0GziU8RIet/YBzg43fKiCvc=;
 b=vcxjXYs+kCt4VciFXaVfbe2VotGmL51jd94aGWH5GHHHSUuNLoAKxBHjmxgMXSnSBl
 t9osr78F6B3IiCw2XeuCP9QZenhSPOWykbrmwm0gf+BFfzzjDM0nlV9WieiFmaf8MWM0
 QxkjbP4ue2IVMhHFfVbM0irAMgthTAhOLFfeJ+tWePFK7vHj8K7YhdM0pTQ1x0/hdErV
 evza9a+pRedi3x78dZ3TNMefXoN649nVMZjivNAZEWLszPRcqWNlpjeCgZFAJWwH5tP9
 HJb0FV6swpsG4drYAWGvmypULJK21cBn1lkDcjtWIfJkm8AydWweWOTLmxVUAtJrWehv
 LtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUiuUCLkGKHbQUlqBxlb0GziU8RIet/YBzg43fKiCvc=;
 b=mjIxXofcsP1+BMl149JwuSgjkRHvs0t+GbFDW0Wf0xtJar1uvEJoJzjY17aTRfpoHl
 zgDPXWg/16vPJNcqX/sLDDtFVrygTHYhyyHLdGsqVIRLcsbqfJByyjDdDFQFu1AacI+4
 WPMP9aC1qNEPzs8klJ+x955gYpDkQ6v4yydRR39evHwEb4fy8Y7XEm6SLPn0Pt2PLbLd
 eejvTeKroFDYdjB+YPb1BByiibdH9DI77FkKFb9Yp35AQVBi00LK49+vBQVtkf6lveIB
 6Tj+B+4u5GOF4RWXgLPNqbZlAdh7bzY1f1qlRZUQDZbhCWoi/1tP2R5Vqz2Mkb5cZ/8l
 PfDg==
X-Gm-Message-State: AO0yUKUiDJb4JFUFRekllugH/feq48AYQlbes23iTDz8RhJzI9Pweh2x
 eC7kEyrbhnWnuGEKPa+FbxPf+msF0WZ1/T6nzk2mKDM+XjfJ9g==
X-Google-Smtp-Source: AK7set97MjVGunwOS+LO2OnnvnX5NR4gaJU14o3Jbebf/eX7uLuZy7dQCKleBqfW9ZaKiJoNflkSNPHrSpSAN5AVnVM=
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr922242plb.13.1677862410636; Fri, 03 Mar
 2023 08:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-8-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:53:19 +0000
Message-ID: <CAFEAcA9=+NU6M-NHt26+eqNHETTLpohNsMUo1k9LA9D2inWb_g@mail.gmail.com>
Subject: Re: [PATCH 07/13] accel/tcg: Move TLB_WATCHPOINT to
 TLB_SLOW_FLAGS_MASK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Thu, 23 Feb 2023 at 20:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This frees up one bit of the primary tlb flags without
> impacting the TLB_NOTDIRTY logic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

I think I'd need to look at a tree with this code in it to
review the change, and unfortunately patchew failed to apply
the series :-(

-- PMM

