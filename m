Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFDE50B6AE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:58:39 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrvq-0002KR-Fx
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr82-0007cW-V5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:07:10 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr7x-0004DI-NV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:07:10 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x9so6739125ybe.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fpp02IqhGGG1yUBEK87fDjE/8WHko0mJqIbe/N80t6M=;
 b=Il0Rey3T+TZamON9hwhNloMBFA+U224dXlk2ai7zXpHx1uwuDSHLu8YZvDtcA0lnCv
 Fn4YZ6ZQAYoLAnPEthiz6ghog62grSdG6tgQGDI16+3eU+fe7LGlwKdgJj7si7UFnvOo
 DpF6RuVdS2u9DB9kgHsKw3qjV+AdGyjl/3KZbKRKsn+aEu1K16CZSkGad0lOgPpuRG5n
 HaSPHo+/C97ktWy7sIuIrwUHBuP+rMCl7iwA0cuUDYSC+0udaR1jX26iRzdf6lxsfBDn
 FgWt7KUN5uFDIrNSsKDdk7l2x+2KMUxoTcf4q8n6jD9scaSgt9YuZuvJrP4/pJOX3Z4B
 KNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fpp02IqhGGG1yUBEK87fDjE/8WHko0mJqIbe/N80t6M=;
 b=0X253A+X9GOKkgph4yrZbX2Jo3ECqozhlTfcC4Thg5zGHeQALG+SIuHy4rzieAw4YX
 7ahzf37lAt8O1C0cp3Z6cgrn5+/T4PWzHqpOFMdvBGfqGMmv/a0VaEAEogCN0qFoUnrh
 aGX4K6qBMuaUN+G8QWkpP3axiP1kxYTKE7pogJB2CCo8psKWFQuNGgdrl3eytC/5atJR
 Gd+VaFYNlAgMYimR/gLUhdBG1gOXbJ+G/E68ADckil9CmBLIKmPJ1eLBH6qzAdUwpEWL
 +g6TAqknNzTup/auMBLpEJkAPZvapPUD3uobOBPPhxj02kZgCEEnBnKJtcrlVq8EMlOc
 2KIw==
X-Gm-Message-State: AOAM533Afki9PiEJMNiIX10ycUxDfrcIlF8Ujpx+QJe3nbn6JNQosKAO
 oD/pP1cVBuLJxsNSEc9FtmZ85hJ8JDWHXj62CxUEyw==
X-Google-Smtp-Source: ABdhPJyz8KkwpfI7Nqfcn7jk+KxHFGka/Ddc8TU7bzRz/M7iJzA9zF9ueCdgKiDsU8spL9SsHYCiLJBVOe5fmSaGQtA=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr3728253ybg.140.1650625624719; Fri, 22
 Apr 2022 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-52-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:06:53 +0100
Message-ID: <CAFEAcA-yYSjuUKfPQTtHxuGcRy_qUTHOQ+fskQgdtQSQxoQ8gQ@mail.gmail.com>
Subject: Re: [PATCH v3 51/60] target/arm: Implement virtual SError exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
> and are routed to EL1 just like other virtual exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Honor EAE for reporting VSERR to aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

