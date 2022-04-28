Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96156513407
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:45:05 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3W4-00038J-Md
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3S1-00005O-Na
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:40:54 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:42302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Rz-0007b1-A8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:40:52 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ef5380669cso51288577b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hy0RUJIKH5olUHplseJrgD3zDDmRFDcNGkKxavbE8nU=;
 b=A+wadCvUKma2+aTaw+iwbhupdI+UvnOVbSjE6oN2sN/hoEzNBGW1UK8SpE6iDI9vzh
 G8TPL37Cca11GX4DFG/IB0iFGm2Il8sCuWBZjdkBRCW5vW00zrecYwEYrP23sPXtaCgf
 ZxD/JVVz/zYlFYXQoICzYcOeULor/laY9Nj4ZdM2QRxRWohcvjCXe1/Y5Qx+MSRtdF5z
 7mPu5UkoIv97KU5VQlo4/env2WaGvTBz503i09mxMlFONAxhcKVfFasvxRNcHUaKa5rx
 2zSnjBPDbFEBmgzC+WsPluJyIHb2ez+HIOatMoNVtQ+nv6JMazsOr+YGBfVD8gPhZT7h
 VZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hy0RUJIKH5olUHplseJrgD3zDDmRFDcNGkKxavbE8nU=;
 b=XxzLdEGSLrYOipbwF8PjjdlMnM6SE3G9ghL+kHvMPKaL03YZl7jJ5vvL3dK5Q6XqyP
 kopnDhek7NbsJHSjl8g3IxDEOG5r6pRbzda42W5EUauiEwQ3/mQUwhMwhfiUscmcvb0F
 6sruUwioGTLAzkYqbHe+Ua+k+93r54iKrmo6MPkM+w87ysbJIchwo1sbfxVE21P/geOX
 RlXjVWNQKc8iHYzV9CyGkbnhD0WnVSLEohd+ZdQRIxKmvkO7/7JQwpnBSG+ZWUkL9s5J
 Dh2/cWgtkXBIUJfB4IGTob5TgmcIecDj+Z0U8LCALeEPU2aB7sFBGkH+sHNb9/caAQb7
 Et8g==
X-Gm-Message-State: AOAM532PjieF87Bn59jZzLDc3drlcvBvqJPoByFsBS2AzW7Y0yIcUhxQ
 PwumrvsaHTI46/7GlvjPX94Yvg8uDbQLJSGbGDa48j2x1NE=
X-Google-Smtp-Source: ABdhPJxn0ixFc+rvQzZCh1Ey2ywk6X3yiyqcqkB2ow3ciC95+AkOR+moF8xQzEueJsXoKdi379RY/IAU5dmK23ZwgGc=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31707903ywc.64.1651149649636; Thu, 28
 Apr 2022 05:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220427051926.295223-1-richard.henderson@linaro.org>
In-Reply-To: <20220427051926.295223-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:40:38 +0100
Message-ID: <CAFEAcA8UGvLKPj=5AgcfLp6C7TfSJRjR7ar9TOesHixj2VmBMw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use field names for accessing DBGWCRn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Chris Howard <cvz185@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 06:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While defining these names, use the correct field width of 5 not 4 for
> DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.
>
> Reported-by: Chris Howard <cvz185@web.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h    | 12 ++++++++++++
>  target/arm/debug_helper.c | 10 +++++-----
>  target/arm/helper.c       |  8 ++++----
>  target/arm/kvm64.c        | 14 +++++++-------
>  4 files changed, 28 insertions(+), 16 deletions(-)


Applied to target-arm.next, thanks.

-- PMM

