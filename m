Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9E35425A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:27:05 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTPFw-0002Z8-3F
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTPDz-0001zx-Sr
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:25:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTPDy-0003Us-49
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:25:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id m3so2719140edv.5
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MG6gaCSYiJfsqF/7yXfv/iiXM3EMqGyLhj76Q5X70IQ=;
 b=XsLrcPwsp1LUepLlT2SEw4Bxl7PGF5XogWOQ957lqqauTxvg5q+2Xy5/DnKAcXYgR5
 g9MnjD6JhL2hJcTgbHTnmD5o4gbxIZ3Rdq0B3zwioBem9qG9qbv/rnf+BCzIbi6jGgjx
 PXTG11RRXNIeuuNgzaVXaCc8QOFiXHShxiqTVjBOuoVC9vA2BypHuZYl0TSKJZncSzu3
 biL/cuM7BFL3L+JDLHdRkjh+tDCXg3RdKOj5OBJ9yHFlsxX7gZ7Udu42nFXjbudhE4T4
 atUHpbOxBHsS6tOxcuBAWPV+ZVOy+IjnKdBh3bXoj0i0ME6Nybfg7cfnil6bPy/xvGze
 z5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MG6gaCSYiJfsqF/7yXfv/iiXM3EMqGyLhj76Q5X70IQ=;
 b=WDBMRbW27v9wNxYdjJnWZn/gyzG71uDt2mkjiwCvXJDOboczMB95qEkE3etYnydP+D
 6v/I36pRK6S1a5U8siV7gzSGUnjncTD3Emde8uJ8Sd+E8uUvEPaimrfkGfdI955JmnK4
 Av+Vu4dw0s+4RURgcSHIqcvh200P0BEfCzIOvi/XVMwhvbtuYk4EWzCKsMtfX/DME2hl
 l4sqZ153M2NveUJoR0h+vX/nQDfNWYOLWATEd5e0XFcAmuBYXx2rvE0W5qc08Ei3EC67
 b+ij4L+2haF4rX8LBYnIyobOZWg/DxmvvsbS1TxHQNAoNSPpzkimxKnRIYl7C9DN2rRR
 W5oA==
X-Gm-Message-State: AOAM533qFUqPH9m8odo07kWiF3NNbUhZC5oH+/uMRveSoivSkFIp04Hs
 KyL8tqbKVRClbvRaDOn7oFTAvS5C9N/Ig47ntjM4lw==
X-Google-Smtp-Source: ABdhPJwGTiGnKrvf5fBZCpDWn0QNP8vRRt1QRpNrf/uOQKbsHuqR4LzUdf4PO7I+D7vPzKBqLf7gsi2tF9GJx+ScYe4=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr31310674edb.204.1617629100183; 
 Mon, 05 Apr 2021 06:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210403161616.17502-1-jcmvbkbc@gmail.com>
In-Reply-To: <20210403161616.17502-1-jcmvbkbc@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Apr 2021 13:24:22 +0000
Message-ID: <CAFEAcA8rAz_6T7XfdrFw9snze_uDEx6nnbaTQ-iQ_m4+yHB-Sw@mail.gmail.com>
Subject: Re: [PULL 0/2] target/xtensa fixes for v6.0
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Sat, 3 Apr 2021 at 17:16, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Peter,
>
> please pull the following two fixes for the target/xtensa.
>
> The following changes since commit 6d40ce00c1166c317e298ad82ecf10e650c4f87d:
>
>   Update version for v6.0.0-rc1 release (2021-03-30 18:19:07 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/OSLL/qemu-xtensa.git tags/20210403-xtensa
>
> for you to fetch changes up to 30c676134eb8f956853a55023d694062062d40d7:
>
>   target/xtensa: make xtensa_modules static on import (2021-04-03 08:52:18 -0700)
>
> ----------------------------------------------------------------
> target/xtensa fixes for v6.0:
>
> - make meson.build pick up all available xtensa core definitions;
> - don't modify Makefile.objs in import_core.sh;
> - add sed rule to import_core.sh to make xtensa_modules variable static.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

