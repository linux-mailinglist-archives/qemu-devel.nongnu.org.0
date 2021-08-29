Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA833FAD20
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 18:41:25 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKNs4-0008Jn-1Z
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 12:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKNqg-0007Wt-Dx
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 12:39:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKNqe-0006p2-RU
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 12:39:58 -0400
Received: by mail-ej1-x62f.google.com with SMTP id x11so25885889ejv.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yaII4uzpkdPkJI4ZtmjROE1+vLJCdNVpJoIuT5RnHqE=;
 b=n5g44khjRgpvC9QG4m0NmyYBM8GRjBccjKv3COgyYyjCxyCBKUmDlCRyQuRHlztEoc
 3sp5+Y/4Q6sKCE2oOweOC1kse64NKewUa5twP3fhezPJYQFC4GCNXDFg3n7GCrYan423
 xttkMCNddVJDhiMbem2sKKRB/SBr4So8vgHNjj5uL9XGoFFbjMkcu7Uji2vprJc6zU9x
 daM0Zi/BiKcAXzrfwAO4dt40PY9tvss9wVhHpuBATIAQsagXnCuDb65cp8wQCYHU9llg
 9p9ufnX7GjKrxSTHbI/VxH0dq4k55BuYkEy7zXWFj7SAB0sFUqtot4IXlbjkJKP5nkha
 zDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yaII4uzpkdPkJI4ZtmjROE1+vLJCdNVpJoIuT5RnHqE=;
 b=Tj7mF1w6mi/ha18Cy+hBZMAE/V3KW2OyDQncyAAqg1U4rb0IYfB2vK9wqD/A+ybn/1
 hPyjGsyVu+qHbhBYgZcKSyoFpVG2GFPnm+o8p1xJ0XzUAkrgG7BT/KqhUmjsgz8ZHXjQ
 3PnM2IT8tYjla1slHVJYWrjoe3+9IEqK7YR4h5YBZKwsJWtEUp1rWv2m6eQnlKOxKjto
 5PIay6Ln/yoTylAdNoAEeKKNTxaPT55kSMeI0IHhH6KDrw8wLddH/yWu9oseZAAENKj7
 0MDak73ew85VVbBzDMx4puE5U3sV+2AkEXh/LSnpKbroQNRMJvCl2ToCOgXI3Kk4xyD5
 iVSA==
X-Gm-Message-State: AOAM531G2wEpB3lIHLCWTgLmAmF8GzWJTLBrjOaGSfPTgoEfx4c5nEWx
 R06PZiX5+FV3yNFnTubnqeocgDBQkhhPQQ/sOtLvnA==
X-Google-Smtp-Source: ABdhPJyN9JEMGAkfrNZSDNK/AIFgmOK1onJG7kbOJPVnwCnNj14Sn/Dx6fgyLW2AbqzEQHPXY4WgfHx1XicaaKzBdUo=
X-Received: by 2002:a17:906:abc3:: with SMTP id
 kq3mr1299047ejb.382.1630255195062; 
 Sun, 29 Aug 2021 09:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210718134650.1191-3-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <20210718134650.1191-1-reinoud@NetBSD.org>
 <YSuwFI8vBJTDF2GW@gorilla.13thmonkey.org>
In-Reply-To: <YSuwFI8vBJTDF2GW@gorilla.13thmonkey.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 17:39:07 +0100
Message-ID: <CAFEAcA8oLY-XYUFVguMDcQzZ+CykWnddpgdAcbrq3-2S1Q5X4Q@mail.gmail.com>
Subject: Re: applied? Re: [PATCH v1 0/2] Update NVMM support to recent
 changes, [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined,
 [PATCH v1 2/2] Fix nvmm_ram_block_added() function arguments
To: Reinoud Zandijk <reinoud@13thmonkey.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 17:06, Reinoud Zandijk <reinoud@13thmonkey.org> wrote:
>
> Hi :)
>
> Have these patches been applied? How can I easily check it without manually
> checking if they are there in a git pullup? Am I notified normally when
> patches are applied?

Generally when a submaintainer picks up a patchset they'll send
an email reply to the patch cover letter to say they've done so.
At that point it should get into upstream git eventually.
Until that happens it's the initial submitter's responsibility to
'ping' the patch after a few weeks if nobody's replied to it
or reviewed it.

Ccing Paolo who seems to have taken the initial nvmm patches
through his tree.

thanks
-- PMM

