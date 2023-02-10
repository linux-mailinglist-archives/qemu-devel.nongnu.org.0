Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48102692389
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:42:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWTj-0003lG-Iw; Fri, 10 Feb 2023 11:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWTL-0003ep-QX
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:42:08 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWTH-00018b-Lf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:42:01 -0500
Received: by mail-pj1-x1036.google.com with SMTP id pj3so5742122pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676047317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X+qGC5SWOOoLk1GEHeJ2me9it/52x7tT3pbTxhNtiV4=;
 b=f8K7cPY5lj6EO/ZQCg35x4lWI5uwE1chXDPmm00knBwGQ7w7hhFpwdz96LNKO7V9BY
 Q8Q62u5aBs07/Y7ATEwBVE6w9T/FHsb38rEz/d9TzE5xKKGhKNYCIcmp5LrGxb0JHD0t
 uW+YW7XGamIALaAXdCMEi/e67EMRa1WpIm9iw75ThDRq68sh7dvM5aKq3wMgpwCzd4B8
 yVir3InolkDeBnZoFf/g+Wb1X46RD43TCa1ZGKMyYJKvsR3po0EMd72gMLx1/DXHnMRS
 MeT9nMVMUovX6tlruOPQSvMpXYtk2zMpCvGyYyN5qJNHmnJWlrOSoy0R2oDdU6Vf0jmb
 RLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676047317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+qGC5SWOOoLk1GEHeJ2me9it/52x7tT3pbTxhNtiV4=;
 b=eO0DkoNRU8ocNAJ7Lwzg9INM8migOVaVHs80d6sF7kVe4/sOIdhPqnFY98gZ7Emw0E
 jh1DDwOIY8G2H8hkCIOQEvTi/noCTxf5xgIWpMQx14bxryEGMT9mX/THFG7sldiRedbT
 mljjPsYTC5X6rDiH2J+Rm5r1caJuQuJfCRPBoOtHTD+BIZ9zU7bo3UDPttqPnT/Scz8t
 CewT7o+niW2NvXOdN/Ql+EWu1ZZMPeJclBaJOrj+dwoXgwtEHyxO3zimHLdZQZEB4BH3
 1AQPoMHk06A6qVpGoD9Hn7TMdSA5+4RHYsqRvuxpkApot/R68pJc079HynfnF0go3y4F
 2mmw==
X-Gm-Message-State: AO0yUKVLxY7wLK1NS09D6Xh7mqZ8g3RiQhJGYgVgqHVXqZq3Pj+JPoSL
 oI1A+Qh90nC/KTWLZToI5hZhMk0h4KjWFOyEsVXG1g==
X-Google-Smtp-Source: AK7set++LG2FX8h+40bUEiyItImiVzPvFV3KtY39ysDXOPtVv81YH86qbOwfq/bCCOR/AUC7arNkjbc3rzRX7F/kC9s=
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr4094867plk.28.1676047317057; Fri, 10 Feb
 2023 08:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-2-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-2-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:41:46 +0000
Message-ID: <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/hyp_gdbstub.c | 242 ++++++++++++++++++++++++++++++++++
>  target/arm/internals.h   |  50 +++++++
>  target/arm/kvm64.c       | 276 ---------------------------------------
>  target/arm/meson.build   |   3 +-
>  4 files changed, 294 insertions(+), 277 deletions(-)
>  create mode 100644 target/arm/hyp_gdbstub.c
>
> diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
> new file mode 100644
> index 0000000000..22b2b7de7b
> --- /dev/null
> +++ b/target/arm/hyp_gdbstub.c
> @@ -0,0 +1,242 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "exec/gdbstub.h"

New files must all start with the usual boilerplate
comment stating the license and copyright. Sorry I didn't
notice this in previous rounds of review.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(which means "if you make this change in the next version of
the patchset, you should put this Reviewed-by: tag into the
commit message, so that reviewers know it's already been
reviewed".)

thanks
-- PMM

