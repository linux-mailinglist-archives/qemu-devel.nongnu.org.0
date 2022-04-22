Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F169550B835
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:17:54 +0200 (CEST)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtAX-0008Jn-GN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsku-0005bj-IL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:51:25 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:45368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhskr-00089u-2U
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:51:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7bb893309so4226207b3.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gF2Nl00O6JYxf73p4vcb0XEEYpKrlM1xjYavIQKXZo=;
 b=sIvBPxvKvOfma3Ffk4hhgDSCtsJNPJE6TIiwT2ZyfXnS3cs32th1xBG0oWXwONdTKB
 Hw8Ucr0M1sTIK86GhYXdV6SRRF+swI0E6iyLVTLP/KB8IHiK2QN7TEdd0M0ttY1AGgw+
 ZK+8TEzzdEJKvfGNkXhhLA+5ZZlQz51NkIyqauRrHdX2zHfkHQ1NhMuNJ+KfrA+I5adU
 H9ct0SEtTAdmSVoTCv4p7bTt9Zh9Hlbr55vHORdaurT+xFZcKYuH83uUD8qNkfvoRlKF
 lZNahOL449enVM1P/inoaMcwBjrXwx2ErDRQ/XRUEngeW1OjyJPtv1PaaUd12kzCRbgL
 QOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gF2Nl00O6JYxf73p4vcb0XEEYpKrlM1xjYavIQKXZo=;
 b=v2DPpZJklOgbgfLuYG4wtLR0ckmdvZwaAku8n3W1DV4H/RhcH+RBXU3yxSdmcKZc5+
 ffAFT/OJ8lnBpMrQCB+E7qIuGJXPSNUmHLhwqVs4sU88WolkM2vu1lsgt93VeOmh12bA
 d9dH83kJqOEZl4jp9g8C/p9Cvj2R36XoCDFNt1yKd862g9CKKtz4Q/aMdIHprBpKPPY2
 owM6P6TW2P0XbC6h2fsAfXOLpC3EpEF3qQmrPFRHuuuBPHbC0ZkwXzBwaW0ai0qkJBUI
 VCkFuUn9UCqplznBjE1cH5cYiIfSzPxrMWjdetMAPxeLlWwbPSr/4g6udQ8kfqr8hNOM
 Ax4Q==
X-Gm-Message-State: AOAM531BI3ZJpGVUqrLU+WRZri7lOIlQD0OF0FMajwHmMmuARyFA0lMQ
 Gq3QF4mkXQO9dYdppuR1WIu7oX8eQ/4dStGPoQsuFA==
X-Google-Smtp-Source: ABdhPJwCcNVeo0CJzEJOZA43OrSVpmHC2HRY3CEA+zC6OZUOadnleJgEMY+efsbb+BcJUvjKa7Q3IHdvr47jqJpps/U=
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr4758180ywb.469.1650631880026; Fri, 22
 Apr 2022 05:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-10-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:51:08 +0100
Message-ID: <CAFEAcA9nQbStqvGSiZs2K9O=4SxYEPpyn9nkCmdGss9uqOkx0A@mail.gmail.com>
Subject: Re: [PATCH v7 09/64] target/nios2: Remove user-only
 nios2_cpu_do_interrupt
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since 78271684719, this function is unused for user-only,
> when the TCGCPUOps.do_interrupt hook itself became system-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

(A no-hex-digits commit hash, how unusual...)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

