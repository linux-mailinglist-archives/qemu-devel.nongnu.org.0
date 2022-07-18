Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BA57871F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:21:15 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTUf-0001Gi-LJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTRT-0006Dx-D3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:17:57 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTRL-0008P9-SI
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:17:50 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 75so21681341ybf.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwQA7tATQrJ3/1h3l8zjQZqPpsjuVMBDd73VbiMNCM4=;
 b=HQSAn7gnBAz/OGHs4lhuTDQro39wHcTmhF7ZTyGnw5ZlMpeJGPMWpMJQUMtNrHSqVW
 m0u5/4VS/PeWOXAFtyosxdhEG5zAKnbGX4AYn/f88WD4SyT90+7cuoXkBsmvaenid8DC
 NC7JdMMK2HAfxz5BQEiwoiiP79KsQ0yIcR8GHCNubQxuZEM5RVti+vdIhmoW9gkiWSXK
 ggD8UOXwkKv2havirIHVHLdmQ/pJDJUvt4hacCaEqe2VOSYMj2cQz++YjFwL/xPWs81j
 I/vATXF9TNhRzum3DolYl2f5uN/T1HtSSOD48Dd5bqblhzFDunyhzhEF8/yIePCFrW62
 D15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwQA7tATQrJ3/1h3l8zjQZqPpsjuVMBDd73VbiMNCM4=;
 b=26L5fcYygIeOR7sIbV/yZnu584gJ7/PpTFnVlbAvN9YxNarO6puoUk98sR1uFV6bQZ
 X7nhRGQu/IY6oU6ED7taGxq+7ZF7im3b+KfQP2ixhAJ3jFLssy2VmtzTJ+8kq0/8uOM+
 Q2xg+LeL+jkG1bN433s0CtoF46UhTLwxNPV6fD1FgZmB62492IkYFBYCqeWKzVca9KmU
 ToHKMYF3W9i1upeEqQalNzwzK3tPvaeI7Inlu22tlVKsSIlCcWup+KzbVzMzajsLKMps
 8nBbM2QLoXqc8nHSpiDXnHYb5OyLOi9znv4TE4V7lb8/NAMQQOVfrRb0xpgk8isVFmsa
 IKIw==
X-Gm-Message-State: AJIora8FP9HxGbzLCfBuP030x9QOzPipmkL7fWN2tLc3rJW0gDkVRWgs
 iFy3tLbDMoJSoHEpuXKcRaf7eakO7m4TnxfL2OmKew==
X-Google-Smtp-Source: AGRyM1uHEjqJ/lURmRQS08S16gCVhCfyC5lL4XXxwau6DRNSEuOWWqxZneCYq8ZmN94W8isS4vo5Bq0WAeEuRrJgxl8=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr1881266ybq.140.1658161065365; Mon, 18
 Jul 2022 09:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <YtQzMUuBOfBiMNlY@p100>
 <CAFEAcA9GzSJw4GpCkdOQPx7j24chp3WDq5tD=8FVkyYYtdrHuQ@mail.gmail.com>
 <273d6b49-332c-9563-a90f-4d1a889314d3@gmx.de>
 <CAFEAcA_68kFSveyvJtwAb8XbsseDhepwXsPC6Bxe=Ha8-Kx3cw@mail.gmail.com>
 <eefad438-67ad-8313-87dc-c2c476340032@gmx.de>
In-Reply-To: <eefad438-67ad-8313-87dc-c2c476340032@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 17:17:34 +0100
Message-ID: <CAFEAcA_2w+T_cg3ctNnS5i-gZgU3OwGCRX5pvH3AXUsStDOvtw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS, 
 SH4 and SPARC
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Mon, 18 Jul 2022 at 16:50, Helge Deller <deller@gmx.de> wrote:
> On 7/18/22 16:33, Peter Maydell wrote:
> > So my preference would be that we should just say "we can assume
> > that pipe2 is always available and implemented on linux hosts" and
> > remove the code that handles the possibility that it isn't.
>
> Ok for me.
> Do you want me to send a patch or will you do?

If you'd like to write the patch that would be great.
You can remove the meson.build line that sets CONFIG_PIPE2
as well, since we have no other places that check it.

-- PMM

