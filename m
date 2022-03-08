Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545EF4D143F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:07:44 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWkp-0004cQ-Cx
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWhi-0002Gs-Gz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:04:33 -0500
Received: from [2607:f8b0:4864:20::b34] (port=35708
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWhh-0007Ea-2l
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:04:30 -0500
Received: by mail-yb1-xb34.google.com with SMTP id z30so23851520ybi.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKOKX/snFFzn/HWZKm5hdVLm7NJpZ+hig1OLtkVZ5k4=;
 b=jclBSzO28bayvAXIukDXP4CBogG2Gjeg3eV/b3BIxw31akXZUeqtGMNv/i3xHEbTRW
 s/7IhxahlhNW6vonU6VXTqqHBWcJ2ef86JAh00WEZ2R2HdMsHYSVEBbkyGThSqVRdYQk
 zHyKGwOxp2FmzjY9Tj7mU0VInx+KysWLpEicsqHgcd5jv6Xz36NZn9jJrVK8GlyxzhaR
 caYkCXVOF7hWXDGLE+z9SayWE2SRlOdfDg0+0MSd0IcB4eW+t3toAJsYa+4qzNrQpBDc
 8K+hzYTS2skaukpyr8y0yvHexKUCBNDP8vSKetXKMq6xiF5XbS9nUe+UKaBIi4+hx/9I
 pXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKOKX/snFFzn/HWZKm5hdVLm7NJpZ+hig1OLtkVZ5k4=;
 b=8H2J6q7Fesk81jAGXDLoWLCKxxodBeBP/bddQ7znYMZzd/cKm2dbQFcFOu2l9hO4Gj
 KQdk7UwDpOa10AADn26mbrswkVpwOcWvKiC0S1bLYus+bwnlgETaLqKQqArd3hj9+kA8
 zNPY8vgF6BWg2E5hNF0fi6aQh2rYX7tOQD3EcDN2fU70qejIGFm1HoCkhGmFX19yKzqs
 oLekc53PjH7LFr0aEoX5rYOKiXK3G5nOscnrqtKwlKAekmMFBvz+/7MVMtaVY54Ebhcr
 Z1TRa9egxChcUnn6Hw4jGlPLJa1l3z380UM/MoVQ6oc/5sxDxjUxdyINDjWoPbWD7jdM
 nYOA==
X-Gm-Message-State: AOAM5301AayKjjs1q6N8n2Z5TgV5GZRs/dqR+Z/1XwYk/v+SQnh9Q9Nj
 GiicEtkZWBfo/JKaYEdo1sFjVQQdWMf71aBuN9hKEQ==
X-Google-Smtp-Source: ABdhPJweioBtUKT+TCXvUzZny/aiJRM06XDNnFBlenLZeDUgkdv8qAMH/+NSdbD0Ig5rhhzvgXZkf7nppeVvADyuLQg=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr11651463ybq.479.1646733866123; Tue, 08
 Mar 2022 02:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-10-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:04:15 +0000
Message-ID: <CAFEAcA-J5JfetQU1nktJ=eOkLy5bdEdiouba8z3NpqRCp_M8Nw@mail.gmail.com>
Subject: Re: [PATCH v4 09/33] target/nios2: Split control registers away from
 general registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place the control registers into their own array, env->ctrl[].
>
> Use an anonymous union and struct to give the entries in the
> array distinct names, so that one may write env->foo instead
> of env->ctrl[CR_FOO].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Not 100% sold on the union, but
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

