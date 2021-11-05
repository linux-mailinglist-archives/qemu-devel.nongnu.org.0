Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49F4467A4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:16:07 +0100 (CET)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2ow-0006VD-QH
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2mS-00047H-IU
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:13:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2mR-0002QK-2Z
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:13:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso10017160wmd.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+oeeevTvvCE3c4nf/NIZP2x2G5pus53mLUY57P2efs8=;
 b=enF47wU5uzwReg7v6baTYm9hlA9tX7TO/sXsALrVP86Ubg0yQKS3dZumhN76yLygyx
 x8NnEisBtb2iiFoa/kuyt9V+v1qnDl5ZdEvvQ4bJvNcxzpfhLr6W2Cs2GapPaWe1fpp3
 UeKSUkPxYecMMfQiuvzkA3q22QE8FECxF7S1LbHl9wPy6CSpO5uEWjIKcXJ9Nz30Ac45
 9x9A0CfLmde4p7Mi2OIXOiul92ZIWQlFZCQ1bvFu7pvrzIzOIfjEeEDKLvd1bvkswi2A
 dzjizv2t1d35yB4JRAY4UTnnxfdukkPSy5IggGljbC9Xy2G1dHVc1a2mGaynpj+gcUem
 GVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+oeeevTvvCE3c4nf/NIZP2x2G5pus53mLUY57P2efs8=;
 b=ucFCz2w6npjAQFOfQVTjTixCKhFWc/A6yQVkqNTfI1nH0l5Cy+mGtqSLRBoNXtVuUs
 PZFnzr4Y+nsgqvKAoI0uFYlZQdI4GFlnL6h37D/VqRxLc4BG1zpm6iNhSm8s0qYr6nvB
 FZJKxc41k30vbNi9B/1Ux8jwCQbKoiusTEFoVwNwc9DgCXIgCk7762GDyfqHe0LJic92
 pxChNTUwDGv/9nTGvwcNNqxVN2bwSz4kyo8IcCM2ooaDOhpogPvqZjl6GFFx6VwJ5EFx
 HhzZUTeFhLcfOX9j7WRZ/pTJyGDW9sTjrNu2mBGeg1siaBsAqNDzt+PSleUPi4Q2prjL
 C3/A==
X-Gm-Message-State: AOAM533mgWW/l70FQqr7NHGZwssHI1IQpPUZzjmriMNngkdrfPnsslLz
 CPIl6Q/kvYZ6KODKtKY6tgHr9+XpWPCC4GV3zASqng==
X-Google-Smtp-Source: ABdhPJyciaXUEvyTnm8wjh+GY2zqAKDpmdy6zBWg0ZbGEKO27XnOuT3aiqcQHoA11VW0ZoCJBKmr9Ae5hqtLw3p3dEc=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr31121528wme.32.1636132409364; 
 Fri, 05 Nov 2021 10:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-8-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:13:18 +0000
Message-ID: <CAFEAcA8yyxt2tnUMcqgt7oxMX5na2q5JZpE-SBKHgBK8fzrnJw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

