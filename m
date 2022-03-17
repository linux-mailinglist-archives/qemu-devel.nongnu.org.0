Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938F4DCB95
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:40:37 +0100 (CET)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtAy-0004V2-Gq
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:40:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt9K-00035r-ES
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:38:54 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=39710
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUt9I-0006B5-Oo
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:38:54 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id t11so11250569ybi.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhBt+qNgePboOfK+1Fu2RZ3eJ+tk5Zn1AB/m0/4mcwo=;
 b=hrGexB91gZgBuJIL2wzw3Yx+3LhmoLWZPZo7mP5PTsLoh/aEakXsc/BJBtT6vud/Kr
 Yn4xg8qF3BuN1CemYGll7bdSvXaoEm85Xxd3sYC0BpkaXEwOQOTIwz57MFIDnlPnUQRP
 PQB1vA7h5xs+WE6kzGBnGnHr1tHhkV+Xww0CABCk6KWyeCW2ZU8w6ijskPQELvIWxnHf
 dJ7JeaUUDU3uR09fdBbQoLLhhX495gqSpMNpY7on5asrkU2+Z2bhLZ7H2KT1FBj8F4lG
 n1QdN8O0mnYmPrLYD0+bNim7YEXS15x6qG5gpcRMM5XgNk+zEDMsnYXMXbsDhMoJ39OE
 b76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhBt+qNgePboOfK+1Fu2RZ3eJ+tk5Zn1AB/m0/4mcwo=;
 b=sOEnKY+nPCBRgGgoAxjLtKbfb6XVgWD1mkLjcrZ60dXp1G2hMEmEOThmenhkHGWHoS
 CKDTbKtTbnrhWxj/MYQ2V+79DHIIN6IXX5dZpLwuTZwPhBlldathsH1xciRmxOBtlWU2
 CcSnBAXIWrCNygbS7xg+mqEt6ErHo060sg2fXd3oI0N+mpbW+I03t1Ac3vy4WDbHQPfw
 a/+Zy1GgsCIzkNlTMyv7xK6TQJdkINFV37/JYS12HmvMG8Ajda+isl/NjMjgdctCCHfD
 3fAEQmRBf3+Z93SlUghRsbZU3XYKm4UBmOhLYYEQFD4PExjlGrDpbiMIBUB6rWHt7HTd
 2GJg==
X-Gm-Message-State: AOAM530Lhnf4nfnliCQlXUU9NB7japTAYEWkPxk64IjGgMBqhXUPnng4
 CqPhBfG7580ScVVlrjsYC1MV3rIEfIKSvwilLt7+vA==
X-Google-Smtp-Source: ABdhPJygxYkuvvItOEBRFaYbCF0eMv+KrC9bOnp6aFlOAJKtyB8I/fl98m8gNw2gpVfoe6h5Wx9IeaAaX9x4KONjpR0=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr5924341ybf.288.1647535131735; Thu, 17
 Mar 2022 09:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-41-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:38:40 +0000
Message-ID: <CAFEAcA-d=UxvL8oGF=vYc-obOWgZ63Z_8=qeb-KpbwC1NU_Aaw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 40/51] linux-user/nios2: Handle various SIGILL
 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We missed out on a couple of exception types that may
> legitimately be raised by a userland program.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

