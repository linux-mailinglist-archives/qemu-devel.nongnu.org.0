Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28DA1A76B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 10:57:49 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOHO8-0001VK-S5
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 04:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOHMx-0000TK-VL
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:56:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOHMw-0006ZF-Vh
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:56:35 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35333)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOHMw-0006Yw-MW
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 04:56:34 -0400
Received: by mail-oi1-x22f.google.com with SMTP id b7so7234387oic.2
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=b8GwhEXxc2ZrWJb59U9zTeXN9WG94IxfR4D5+vM6CQg=;
 b=LO5+enFiJRa3Q/6+eguysp30jTNvPGDyTYapBc6nWD2t+o/QyqJfA5HsOH7UjsTV/t
 Sq28SpCQYGKT4LaqqXp9S33Nr/98rXxJT24n+W8tN9RrKzcpc6DUjxJzP1xAwAPELbY+
 lbcfew9UGsIcVf9I4iiV2O7/WBc9OradoheuIrCaLkaRBhNKdG+EPy/rnjCOTm30ffxF
 uRdxDp3o4uSB8H+S7sV6MJbzyVTRnpDK2V/7amT9VS99N2ex1g8pZf6+KInSPMMyopWX
 KcSbAIvc7fVJCP/xyK+AkT6B44Yuo1Orn3bfVphvZi4us4KyZT2f+PZKbd6U4htKEgTG
 4giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=b8GwhEXxc2ZrWJb59U9zTeXN9WG94IxfR4D5+vM6CQg=;
 b=CLYuQQo2jOU1G+TWfUpxaCi6LAKDGFxRQJCxl8GhvcQ7Ji8ZA9qjpEZLv6QMcxSGaI
 E2GJjkPEhACy3xSjWJlemsD9yRhJ3qwO+lgNTzHuIeWR7XgVfVt/LxcqCUWoObNKyyHe
 x5Som+vO1vSc8U4ePWRQYjoCMjS78DLE0VN0HQWRWXWGIve+806TYQj0e/2avatOv7Y0
 JhSF178FmycRNYCN26Uk6H063+CUJlDx/DliANlBpvF4Uc9Z+h2VdSLeYgO5wczQHHpV
 9thikgdX2t54VEurkTCMlIqRh9ivtGqWn67hmJm+BwxtOBbyC42e869GxcgoagzBD25Y
 QdQw==
X-Gm-Message-State: AGi0Pubqn1XoMNPMbGmUno/oalLBP7kGH+cZk2Idrlax/t644ipQxC1A
 UB0/7/xPnqtnv33AwlmR1yt3YhshGpIQLN4PB3kysufwXVc=
X-Google-Smtp-Source: APiQypI/GLAlD6GaByDW1u435I+vBSEFmSRSZNpZaH7buC6QrFFhFyrXO8JDf3+mjt4rwfgsEGr8yyrRsYX2af6SL38=
X-Received: by 2002:aca:f3c2:: with SMTP id r185mr3726733oih.163.1586854593314; 
 Tue, 14 Apr 2020 01:56:33 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Apr 2020 09:56:22 +0100
Message-ID: <CAFEAcA_gxCxi88mzZnFq6yYWtNqzVQLn1xv00+uuEFt9yM3p+w@mail.gmail.com>
Subject: Delaying QEMU rc3 til tomorrow
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I get the impression from the list that there's still quite a
lot of "stuff that ought to be fixed in 5.0" work on the list, and
also this has been the Easter weekend so some people will have
been on holiday. So I'm going to postpone cutting rc3 til tomorrow
(Wednesday) in the hope that we can get these fixes into it. (As
a reminder, rc3 is supposed to be the final rc before release; if
anything critical doesn't make rc3 we would need to cut an rc4.)

thanks
-- PMM

