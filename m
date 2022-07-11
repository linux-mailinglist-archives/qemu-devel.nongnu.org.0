Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835DE570366
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:55:11 +0200 (CEST)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAswQ-00046v-LE
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAssb-0000mF-2r
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:51:14 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:33423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAssZ-0002i1-Jg
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:51:12 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31c89111f23so47997737b3.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TUpUoLVWGeJacuaeJ27qdwCvm9njmgM+eCTjqiPeboo=;
 b=KtVH0Lbya551ddG9L/TOJwHksaw/7qcdl6XuCJesNiqeD1W8q6s+cKnJMYNeHxGov3
 WUkR3sv5qXahTdDi6eeuVUp/KBkOi/PmHj3JZmiJX2Z3elDijGIjtZtVErnU215v0AHZ
 QhHrv/Aym9tIiyKxXnvtevO3GwkYp7CM1ifKh2uhOJ6FV0Fi0k3nRHdN+bttfJwI4IzB
 lpYN7SEpcw1U7Bwf/4FCnkyCj4EQLMF4x4mzLf+nK+vb14IOk/F+Ic8SpuKpTk8HXsXn
 Vi1EJpChSfh7Im4dP2XXS95je3TA35Pe7ER+v6yat2ij5oGXpe+DgGv7iHR6j8kKje7K
 7epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TUpUoLVWGeJacuaeJ27qdwCvm9njmgM+eCTjqiPeboo=;
 b=sNN1WxcLnNu02HajU4x0OytAkSXkAEKJvPXKtlmkwYhRWxm4v2Unl4DMWhFkOtpUrx
 GxMrE6nQN3adkQnUSn8i/0xIda9+vD6QCCEOAfjq5cHPeqFJdvOOZHn5cUzq1iU1hrJz
 2eqInwj+gV3k+szX35uHEt9B/M/rNsvfqlZ5O0jX7EMHOBjAabG8DN7jWyuMANt36cAM
 F9sfSJPGtiHif2o6yMRZgz3/frwnS03CpWnUbW0dm8kZgN+vB6dzetozZUDUs2YtV8WN
 Q4lf96NQaw5ufgAC9h0WBSVeGuZMF4OXjyUPHhctDNg3eLMDlMrgCg6XEHQmbmsfbbf1
 aWlw==
X-Gm-Message-State: AJIora8EbrDhBOScYbW/HYOcejKjIJ2MTUgwyjMdz+KaA8oBMd6B0hOU
 5ZprzDkmDK+WkcsPgbjyrAQxUAl3Av40psswkDzfxA==
X-Google-Smtp-Source: AGRyM1toA1tQqRzfdwKaqWF8UBDT9Za7zEcobsqNxIhfE+9fiIkzM4wc3/qoEI1PQOjM005nPxUXHYeeRZ2ZvKDm3TI=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr18790301ywb.257.1657543870723; Mon, 11
 Jul 2022 05:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220708151540.18136-1-richard.henderson@linaro.org>
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 13:50:31 +0100
Message-ID: <CAFEAcA9fsPBy9DNxz_HqLcBt3srjfhOGY=Bkgg7MWp64xzi0+Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/45] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jul 2022 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v6:
>   * Some sub-word big-endian addressing fixups (pmm).
>   * Logic errors for BFMOPA/FMOPA (pmm).
>   * Fix for PR_SME_SET_VL hflags rebuild.
>



Applied to target-arm.next, thanks.

-- PMM

