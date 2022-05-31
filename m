Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433A5390A5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:24:26 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0vA-0002HY-8H
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0fD-0007DA-Ig
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:07:55 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0fA-0002RF-OL
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:07:55 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v106so16517381ybi.0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KelfOkbq+al07TKUgiaYNmACE0HIIJMErn+5VANXLTQ=;
 b=rL45SJLZKsGhRA8ud8Wdfw1r9Auetvm/kuGQpOG9/edpJ3xuFizJ1GKTJOoMTFjsKn
 VRWxehNOapRyzyJsbsoiJ/kkTKYQO3LimiWWTkG/XhU+5nm4m6fGA/yuqfElpJWQgCJi
 YiTVMuPFgFCJOcRsoHhcMayLpK82YiAlXFvijx03+ETWi50kMV96DAj8jFBXnWEXDmrz
 PDrrQVw2f0/pswLsSfv+W2hj/n0GopAigGCn2lEsjrEOdwKaxqSqNwLTtJ1M5yHQaLjQ
 +YdSwMWnyVikungCcMJQEY6zHxC3iFXvLMN8o0pqc1w18GjebkilvPIa+XwB+9PjC1g8
 FJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KelfOkbq+al07TKUgiaYNmACE0HIIJMErn+5VANXLTQ=;
 b=D7uyyZ3u3FmZziDCw2CK52R6YW/4Hx5QHdZhxbsdqk9Dc+SjJva0zzTcpdwrvbd32j
 qU4PqCzQW6z9t8Rz5Dh86nJfsAidt8l7KdQvGDW2WtK8BOhen3VoScRzZkIpvYfC24xw
 CEnRLYCl4eL/5QHzpbqxCzTlWOeFsnvWNcqqXpAXI5zkpAdl02+GsG8J11t+TDpFBybl
 q/OAob6vO6JBTEsI6VgCcyVGdV6q5JO/sElHC+Wx2+vpLSfFaLnUuWDsXiGk1FQBU7s7
 bHyM7ugFNEDr7udxsvtkXiZSZkDsqAZirbIlkQXzb04AQbTJLD2HhwwNjVAp0JpOldl/
 0X5g==
X-Gm-Message-State: AOAM533I/WsQF0woTnw8WMg4wIZhkcx6s/PMGXfGYg6JezOaOn7CCFmP
 iJHHYRUOCPBJNjJd00guj20r5pIbdKlg5rNIPRfzKWoMUO4=
X-Google-Smtp-Source: ABdhPJxne12QicKF63fTSOU0aZfbiJpxsjLwUJlL/lWxIbn0492gz+2qoGDIXwyMHYTs74/xokKFjMUSky9bFFUb6jk=
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr42620304ybp.479.1653998871675; Tue, 31
 May 2022 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-18-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:07:40 +0100
Message-ID: <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
Subject: Re: [PATCH 17/18] target/arm: Add cur_el parameter to
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 May 2022 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We often have this value already handy in the caller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

True, but it makes the function clunkier to use. Does it really
make a noticeable difference to performance ?

thanks
-- PMM

