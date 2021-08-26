Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5883F8974
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:56:05 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFrQ-0007tP-7i
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFqH-0006q9-Su
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:54:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFqG-00067K-D4
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:54:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y5so4783952edp.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ENOqJRI7zx+kAigR/DJ1FDbzxpcvWUU6DwpS4hAwNU=;
 b=xiAM5Arr9AUBdd/15JYZ11KnJC72chXpURdJshjblJ9I5BnLQpDKP/j7/sRN6aY36k
 QUIBHcLP1hdFR8yOuGq29WeIqdIrlWEnU3rr/IwfJN72RjG0pFHp0rdgHnlmrgSrn/Jp
 K5mZUB4VmW/jsKb9gLjht/4ncGAnK0kAT79RdkIVNd6FzruKzCo3HgeOjGbVFWq57CEj
 S1NtLk6buNLcU5R2KOXgRCPoduXuwR5VTkLjtOxzlzJHWAeGB8Mk/gOgodm5LG0dc1GW
 PKW+zor6/PaJV18Ae4FKNhrXWRr4ngns3Bg8nItCi7WpCu4LbKSgIt48gJAWdaPQ5FVm
 mRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ENOqJRI7zx+kAigR/DJ1FDbzxpcvWUU6DwpS4hAwNU=;
 b=PXGf2iWkCITWxs+LctacM+B7ajZ4ztJnK/J5MgGe6bIZqIdVHCpKWEb+rswh0zk2I7
 IxVqSlZvRB+TK60xrjGMsiDIbPKcz1tvwlSjIJeigt3lSBgotVrCRlZKJfq2cukVZg31
 YnNccQWW02zfqzh2l7K8ssrTGLFLwjE8G076Eiuf299c4BcKV5hUHuYGYtM8ZSdeN2WY
 Q3ZIzclzzpTR3OcFti+Cl6MhQcFXzmOhlrUpXlBMcbWIyFhNwvduntjDM4FarTfUAmAf
 pY0aUv6EKPW0RP3JyfOCgmnjndOHdi8jIDl7HAw5Mf1Vr7X6PTyBJanJGXB7mhFSoyml
 90Wg==
X-Gm-Message-State: AOAM531vmWsgJOhniUGfiMWRLPeJbwjbRpWT2WJsegpsbBAV73d0kDCM
 SQ1xht87IL/xmRMs8G+588OUTfjOSfKNTvbwP/ga3A==
X-Google-Smtp-Source: ABdhPJwThOQC5hwaVjEa8AqtFy7mwbqqEAuaVDF1RWklRFE+hZDzTVr6ilzeuVGepmogxGOyjqb4FK4AMSn1oYxPgmo=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4334298edw.44.1629986090905;
 Thu, 26 Aug 2021 06:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-9-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:54:03 +0100
Message-ID: <CAFEAcA8Vf-mF4xpMkv+Xc6Cc-u1fW5yW1-fHwVSFqZ6EKNdmPA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] tests/tcg: Add arm and aarch64 pc alignment tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Aug 2021 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:

> +    /*
> +     * From v8, it is CONSTRAINED UNPREDICTABLE whether BXWritePC aligns
> +     * the address or not.  If so, we can legitimately fall through.
> +     */
> +    return EXIT_SUCCESS;
> +}

Can we get the test harness to run the test on a cortex-a9 guest CPU
so we can avoid the UNPREDICTABLE and can always check the signal
happened ? The test is a bit weak if it doesn't actually test that
we take an exception...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

