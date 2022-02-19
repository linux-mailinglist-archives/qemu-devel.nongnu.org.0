Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4C4BC881
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:16:59 +0100 (CET)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPbe-000093-3I
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:16:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPOd-0002Md-Qf
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:03:32 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=40736
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPNn-0001uQ-Uw
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:03:31 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id u12so10806671ybd.7
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zH70aBFr2SWkOUZhoBaMAp+/lFTrEF01bJqe0VaX/aA=;
 b=wcfEmg49LxSKlBaEdnxIj1rXjVAbHM42wZM4Dd8RoWdyei3nZtbP+HguWEZScpEQcC
 NG5qdla+2b35hmwPapPAwIwooYRnK8EWMzsTYzsIctzTza8RruMK7Dyd3ROXsHPQdYSH
 0V9Ryoij3lqpIPhztMsSYl67ms8j+dKpcza4XPuW7OkSbMvCd0ZC3hg0Zzop/hoYgylo
 VAH/a2pBxjy/lINBBOdcy9QjOVKObq8exQnv1FF9U2CMLUcho3AleouIm3+5+CxXvJA/
 GDtH1PlJn1AthSl+Qc5bzmp21Qhx7k/dbTgq4Zbne2Xcef+TR3Lnv0RIP/7njaDpe3Wz
 MbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zH70aBFr2SWkOUZhoBaMAp+/lFTrEF01bJqe0VaX/aA=;
 b=QNe98j7cGOmqicxgD7LbzigB3HveDDJIgTcgL+JCGWjsR08YDQPpxR90hHljtTM4+W
 lKjZeZORsiwpanufJ0dnrScBJepQn4dtieNykDhPU72rOvMAAwnQxAEnqvrE1yQL+2IN
 l/HLnZQ1FWhkLpbeZWXVNnvKz4rFZblOa91hKDoJt+OYmorZo8JJD3A1DnQWJZZIUrqn
 jkGKPoMePUolMI4Qnaz02mEYDT0Fyw+MxBif3dmTHfz3aOUEQ6LwpYG1GfYJuvmkwLnQ
 r7s/kcZR3sQ7OGYI0ut0omx6h2Js8P9uHA/nTDJecBaC6CVVFF68d5e9nH8EyOCibu7e
 6fVw==
X-Gm-Message-State: AOAM533LcPw5zPnN4me4ap8aWf6yqIR8bXlQEE39QzocdhLJgTwX74uk
 KHbG2+setiKBPInMfimxbs5TVOSfSd4cSWpbWjBDfA==
X-Google-Smtp-Source: ABdhPJzWkzzAgsEVP2Ydti/zPYrajTgD31CHZWyTgw8X7ch2Q8wgoxMhLXNTzvP/6odEGCilHUY1jToSKuY44sGFxZU=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr11574729ybq.479.1645275754368; Sat, 19
 Feb 2022 05:02:34 -0800 (PST)
MIME-Version: 1.0
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-5-shorne@gmail.com>
In-Reply-To: <20220219064210.3145381-5-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Feb 2022 13:02:23 +0000
Message-ID: <CAFEAcA_0PF+R=1kDhYVeB18SA1VAeawFHgLetXSAXkbBjOvY+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Feb 2022 at 06:42, Stafford Horne <shorne@gmail.com> wrote:
>
> Now that we no longer have a limit of 2 CPUs due to fixing the
> IRQ routing issues we can increase the max.  Here we increase
> the limit to 4, we could go higher, but currently OMPIC has a
> limit of 4, so we align with that.
>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  hw/openrisc/openrisc_sim.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

