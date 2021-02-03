Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F530DC7E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:19:23 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J06-0007I5-Kz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7IwZ-0005W4-Qt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:15:44 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7IwX-0004E2-JP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:15:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y8so11895785ede.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORhaB7GlgQrmA2DOxRW2NxMU3MuPG4S5rOa0DDVVVZM=;
 b=nkMpD7LBujfngq2Brsh4r0Tyz3kQMuNxhSpJ0Hk3m9Q+G5jwF32MbuS6B/aHUqILCu
 kwPA8wj5UfY42BJn1TpPoHyam7WYvswzcdHudOuQhtvidmEAXUXneyrkY1pIkadY/hS6
 Z7yOzzqp2dnQ0tO/4ToDDUEh8RLTtlizTOimCrjemCpwwKeAIf0oudM8IfATlY4peTpo
 Vt6BLW/3DuypylpsCmnh7cXgHHWCjnZvoLfrna1+5hUeyJIbZkgFwx7xTYXQBxh3+4l7
 G8iUGVMJz+vXYPZAWb6SEdE1w7u7GXSDREgwSUB3soyojBXQgtHeJWklvbOdKWxodU0Y
 vNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORhaB7GlgQrmA2DOxRW2NxMU3MuPG4S5rOa0DDVVVZM=;
 b=WMRYIHdfF76JGDf5ruZlWUp6OUy62sD1DpLiLcpE7JTjN/UhWGdJlfQz+fWtab349y
 lmF2wEx41KQMS+YTZKkWTzpDpCmeaBhZ7gVwlyyFZwSCMQ4TPtvUlS0DQtBNoXPakoW4
 dbQZvsmt1Ne7Cl0TbJuNN5JR+0WMQZlfQUtsbjxFzfDR9o1RmiHfoGvC2Qz0wDZXoBhw
 eEzHthHdhxGqSfrWr4Mx7rYPcXAFfUGC0WL7ctPP91H2SRyzrgU43ftPI2D7DxlXU5rC
 jWMpoEFKhlg0tD3YVBSqPzw95l3l9JeG87x15tk8OEIm0M3wHG8aBbajFHBceoBzNU+U
 MJSQ==
X-Gm-Message-State: AOAM531ylpVhVIS0IJPzP9nhv/njT0fXLLv6LCJKEsPGoyOlohEDwJHp
 T2+F3tdx1QnNLRyTKYGXzyYNFZ5XD+VkPvAEaefJhA==
X-Google-Smtp-Source: ABdhPJwgMOzmix1eMFU6re1q4W9eYzNj8oUhFk/jhr2OLuyi21CkAbFE5HPx5R3EZbkcw2096VW/1AzC+uHXdeo52dU=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr3143268edv.36.1612361739092; 
 Wed, 03 Feb 2021 06:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20210202151116.1573669-1-mst@redhat.com>
 <CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com>
 <20210202175645-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210202175645-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 14:15:28 +0000
Message-ID: <CAFEAcA9Cox4wzzVqXO-3iNaT6FxH_fOKpDi4G7UkD4STrLU1PQ@mail.gmail.com>
Subject: Re: [PULL 0/9] pc,virtio: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Tue, 2 Feb 2021 at 22:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> I added a fixup on top, and pushed.

Can you squash fixes into the correct patches in the pullreq, please?
Otherwise it breaks bisection.

thanks
-- PMM

