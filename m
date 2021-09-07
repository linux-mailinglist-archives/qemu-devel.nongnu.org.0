Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91B402EEF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 21:24:56 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNgiF-0002sv-J9
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 15:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNgh4-0001xL-Aj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 15:23:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNgh1-0003KN-RT
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 15:23:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so2455006wme.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 12:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r67SiY/P+5Lvmv7Q+5JplGppBknDQoGYmHLwweL4P2A=;
 b=xyTmL9qKkTwp2Jrv0zN0Ry/Fp+/dR1jEsTZA6a5KOjMo8STFztomflB6jAk11hPaOx
 i2uR5gIxTM1XcGVvD0SQpk5L8jsMqCWFCrV6uAfDhB4VaH9/8zn7n8f09uDY0b1ttshC
 PFhyl7rpxn8TbG/W3vy7mpx/uka3wecIbacY5lnt4L9rpZsIanX+r3ZXumhccoMlGKU4
 mbZ84vNZVNbZrKCDC3VM5kJ73D21t1EC8bYhnyKIPAflfsfEwXU5ITtDZpBN4l4WmdIw
 tHWPZFzbAHyhafNEAFgRyTW4wvZ60i3rx0p2Td/RIHzfn7YSYGQxOEoJ+ZdlX0GoclM4
 zwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r67SiY/P+5Lvmv7Q+5JplGppBknDQoGYmHLwweL4P2A=;
 b=YsCGEWoRshmUGNervdh+ZqM1ichaLPuibt3Y+N3mGIP2ZHXuHXF5m42Ek+lDd6hHrP
 6NoD/aKhFoclVJxn0E0XH9DyEDh40x1bsKanlR6iSSG228Pq5z/nGc/rMNJFuHSscgwZ
 GU/FLU4L4z7pRCzoUw1K7EFcPKV8X/QFsyHW2c3Wx3S+Gxs95Oh5gM7du5uI0YwKvV8K
 e3n7hvPa6JiLW1KthesqA7Cds2pkfiNdMMceazKSUMo7432P4zBXSnyMOMAAlLrM186T
 tytW07DHhJ9bVP6ubvrcD3ecNKUMX81jsvbTJox3vHD4mx9b7xTGn+PFEGRo9V2m0f+4
 bcLw==
X-Gm-Message-State: AOAM532EtluOrVJZs+FgYdPVWc94gMHctZGCAK802vNktv/s2fpZc1rP
 RzXwr315Nw1Yoq/NdBOuzkgb51AtoaDkLqJOefYBCg==
X-Google-Smtp-Source: ABdhPJwnR3dzDgS/fGgGAZI5O8njM1BfqMX5sLMMrL0sADW6+Aye2pAMEIYwUfP9JkHiogCz3EBqzkMdg767+jz3gGc=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr5576742wmq.32.1631042618044; 
 Tue, 07 Sep 2021 12:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210907131449.493875-1-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 20:22:48 +0100
Message-ID: <CAFEAcA9fJuuSRvxx8fCgrN=Vx1PNzz2obDu4uW0ywgEJS3LCeg@mail.gmail.com>
Subject: Re: [PULL 00/20] s390x patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/s390x-pull-request-2021-09-07
>
> for you to fetch changes up to 30e398f796d882d829162a16ab7c920f7422da3b:
>
>   s390x/cpumodel: Add more feature to gen16 default model (2021-09-07 13:36:43 +0200)
>
> (Cornelia is currently on vacation, so I'm doing the s390x patches this time)
>
> ----------------------------------------------------------------
> * Some CSS related fixes
> * Storage key related fixes
> * Test SIGILL and SIGSEGV handling in usermode emulation
> * Fix SETPREFIX instruction
> * Replace PAGE_SIZE, PAGE_SHIFT and PAGE_MASK to fix Alpine compilation
> * Add more feature to gen16 default model


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

