Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2534405040
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:38:52 +0200 (CEST)
Received: from localhost ([::1]:33304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJKO-0000M6-5S
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOJGo-0005vO-Mb
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:35:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOJGn-0000J9-1K
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:35:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so2327206wrc.11
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmUEMyOf+pXdM0ueGS/XjlIc0hjis2QkEPsL4fJjy9o=;
 b=LSCyU76ZVpuJuKE6crk2MWTgEJR5hDmONybxs1lILYKM+zy3akEXlkse6747x+YrFC
 BlwqsvDyzc7pGUttGOUdBLhY4afRP3Kx6IVA5mTzboYBxhWCeUNdoFydPAbRWvxxAcn5
 vgbSNO+1I/IOsEaq26k7CmvIvDMaPdnD72p9Iu9ZNgTDl50MawLxgqsHxwZZetxp1lsH
 OGUHljELBK+Lj/NGAFCc1LKLlgLf+DuB39k8kiUFQ5V+aBDtXslIN35fNCV7Do19OFmy
 zOLwO8kxrN0JtTftK71zT+S3jSrFJA5BdRHb79M8yJBp4tKwvd/6otNYJ/jLxzq6dXzx
 z6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmUEMyOf+pXdM0ueGS/XjlIc0hjis2QkEPsL4fJjy9o=;
 b=PL0RqNCWtHrKKOkiqd17qJrnDT51NQ0tApzSw4/WBxP4NQv5hGlXzCarHWJC0UPczr
 kEy/qFdYkgthExuICLWiMIWbf1jj3dGTBS7OEUU0EioWnYlckDUHawJY2PEMEGRHWLyb
 WwCXdlOZgK6ltPUPCCa+HDCY5Nkp81WNUc2aui+IFMDM9Yla8HnWc3HmP7yRVixakcx+
 RJdYD/x7xhvpsRNJszDqicecLGDWoWjI88DzUjQriS00f2ioBrUEe8DyUotM0jYpB9yr
 QshSbVZ6TOjJy09sB7y27F9RhY8cR52NLtsYMiImvVYmIXz7l2KAKh0bFg+Ntbs/D89E
 zCyQ==
X-Gm-Message-State: AOAM532KMSvohxulBQerP2l/ZicqIK4C3TP2XBjsDoA9aGauLvZYUuWO
 E2UJjIC4Neq4WFIhDhHnK1fLdpVwI9FqFnxh+E8bVA==
X-Google-Smtp-Source: ABdhPJwiQae7GnJp3j72r706QK1nzvYU1+sy+w+9yGfRlsThKF7YZFKzuIBKboUD7hctjOIOGMWxQ1L+XGxRf3dhE/Y=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3337023wrs.149.1631190906565; 
 Thu, 09 Sep 2021 05:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
 <20210909120459.2199223-2-ysato@users.sourceforge.jp>
In-Reply-To: <20210909120459.2199223-2-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 13:34:16 +0100
Message-ID: <CAFEAcA_1VZ-6ehdmKhxCAVEB-M177GSo01i5+7XBT5r5-=a3zA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/rx: Fix helper definiton.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 13:10, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> Due to an incorrect definition of helper,
> TCG optimization could sometimes behave unexpectedly.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Could you give more detail, please?

I had a look at one or two -- it looks like the floating point
related helpers like fadd write to env->fpsw. That is a TCG global,
but we only use it in the implementation of the "move from FPSW
to a general-purpose register" instruction. So I think the
better fix for that case would be to stop defining fpsw as
a TCG global and instead make the "move from FPSW" insn
use tcg_gen_ld_i32() to read from env->fpsw.

Probably doing the same thing for every helper function is
not right -- some will be better handled by reducing
the use of TCG globals, and some will indeed need to have
the TCG_CALL_NO_WG flag removed.

thanks
-- PMM

