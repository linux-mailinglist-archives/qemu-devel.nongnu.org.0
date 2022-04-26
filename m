Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E237450FAFE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:38:04 +0200 (CEST)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIa3-0000PJ-T1
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHuM-0000uq-Qf
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:55:00 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHuL-0001WQ-DG
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:54:58 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e12so3109725ybc.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUD/MZswfzKR0TnqDQfQpyZBZEFPy8cQTzDRMo/s/kY=;
 b=fjOCUk4Ni2f7YNeysM3xv4sJ2rANG4x7ekks7fkQ54qvX4h1wjFM+KuRE4fPCVZhjh
 3YeomrKmAEeR6W+SL0/IpCv0Gra2vohY5g4FM2VSn4qHdEBQ/RuHXlOV0/x3tdAuF/yt
 rJJsppJfBcQC1Vc/siZRYmU3kGrWSp0Id/y5mlEKw4cQZD79sMUJ2qOURxn18Wwp04qx
 mhVi5JtP/X7wvZUL/4qc8AvrBuoijeu1tE7T7tdVGTlZ78nrJUmY5V6zPPpMoX6/NQXw
 fY4pXK+kqDeq7FqVeHTPIq8gmxAi2naGWbRcZRJUtgw4hYazXLIhhL9NxIbzLx5XobFt
 O0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUD/MZswfzKR0TnqDQfQpyZBZEFPy8cQTzDRMo/s/kY=;
 b=in4sA/uKkmozLY7ak9NMxrmPDJ/NknP3JjK8VOOnmuArs+lULnuz9Hkgh3wwUbHJ02
 0XggEpG2CDCRK3pdsK3KbPnHu+7CK3m4QR+9hJrR5YJBEpnmbIb5AgjSfaHG1DMGk2KS
 fti5tVbgB3scoit3+fg+e5OPotIPG3UTJ/2KORvCcFrFNkBTl0LynB2et5vVnYgJpCSX
 Krw2JcRknMTCinIh8ZMSFmdLJY0zr4vOmXWph/WY0J3Fo62aC1PVvMwwmV6sWkGNrWRQ
 K+PkFi0zLov+6uGndF5yhxE4IqcVB2TMvL01SmehMQaL0eK7jvm7zF7L5+Va6X3Zyk4Z
 NENg==
X-Gm-Message-State: AOAM531xCIiUT5Hk1zYoCxYqbmaxl0TqTjjh9mY4mq70lBPOUyORC8Cg
 zRFmUFaOCseTJQF1CcfeKQloxEYy3q0oi/yg1wwirA==
X-Google-Smtp-Source: ABdhPJyjhHizmmMR7Rs94uZnW/9hsab866hLDavJBFTbTy4Tv92hXZvpmI8S9+HUOxvX8pNJr1BuwnsvhJGjoOdysa8=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr18519074yba.193.1650966896065; Tue, 26
 Apr 2022 02:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-49-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:54:44 +0100
Message-ID: <CAFEAcA-3V5ah=53JMOY3dMkeD=YZVMqvLhLXgLLqPST_T+5NZA@mail.gmail.com>
Subject: Re: [PATCH v8 48/68] target/nios2: Split out helpers for gen_rr_shift
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Fri, 22 Apr 2022 at 18:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do as little work as possible within the macro.
> Split out helper functions and pass in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

