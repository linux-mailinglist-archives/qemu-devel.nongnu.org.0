Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA686F83D0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:21:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvMR-0003Is-22; Fri, 05 May 2023 09:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMO-0003Hg-S3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:20:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMK-0006yc-5o
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:20:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc34b98edso2702791a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292825; x=1685884825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LDhxxob13J5LDXuJmJ4rGo5aOOPgz7GkTyzqGqv6rhA=;
 b=s1PK+yHTQyxNNbUHYRWSK8gYReQC953q+qaZVToizJbyHdjWoG6m+NXPDm7uEQ1VDq
 8OUAAxUdSPf3WeX4tXlqz3lHTVvEYM93GPGOTWlw+0bkZDrKYXg/rJ6Dvm8Kv5X+jHef
 dtLtfxoge45PTzeEuH7WWUPz3+V/MndhdIwOEHmKYUriDKSMsS8InN/t9EfFg+wR9cbE
 IjpeiCdDZm+JHs197h/9adhzhSac37okZHgOj0fGqwwneppgjLPPWhK85QlCuOkaTwO5
 tLckwiTn0AybKsdKCXmToQ/Fmec5JGD7jUUBzP6xOrLUAI2zXeklxwGlkg7cg7fgnsS/
 SL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292825; x=1685884825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDhxxob13J5LDXuJmJ4rGo5aOOPgz7GkTyzqGqv6rhA=;
 b=FM73tl3jptsORYJtjBNUPVKWE0Dr8E1GNTdAcYC8gJ8t+d1BlXe5GFODHoA6chZLNm
 tHmJdqxeHG7qV6tBWZLIRpBiXHmAyvqMxnrcEBQaEMHW+IJwMVHj8OnBhQXPU6q8jo3x
 QYtJdpxR5JXNW/mdODgz6GEl8FuXlUn+C2PCjLK8xFpg95l0tNZeU0eaFUQfr0cQRdA8
 NmQboYEFPWkUq4jurjuPVeOfumFaNk4BcG7JDttu664fxUw/NA27cFWoTAls8x/w4lOB
 6bWBWdGvcbceORZofKnws/kRA1ABM4NrlL4X3BUfcJ1nA5VbXe0l7u/Xa0boUtRMqrGB
 16Qg==
X-Gm-Message-State: AC+VfDxIdeTH2eAIGykJnN0nZbqbMVNtJkUOfeTySrhwNswvRjdhfR5r
 g41r54CZNwrSGJsq7dwXzLroCAjC8598vQVUeq3zIA==
X-Google-Smtp-Source: ACHHUZ7xQD/GBVI25Hy6kaHUOquIGsPR3j3R6LGNrO48He598b77bWj9pYCSJVP0TR0Jl/YSchxx5AilzbTXaP88sGw=
X-Received: by 2002:aa7:d6cf:0:b0:508:3f08:ea0f with SMTP id
 x15-20020aa7d6cf000000b005083f08ea0fmr1422307edr.28.1683292825486; Fri, 05
 May 2023 06:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-51-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:20:14 +0100
Message-ID: <CAFEAcA8zaPE2T=5=9ga9xdLfUG=jWAC9tt0GJdFiNx2sqSGV+g@mail.gmail.com>
Subject: Re: [PATCH v4 50/57] tcg/s390x: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

