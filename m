Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD99C2C6BE7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:18:56 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijGh-0000OW-R3
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijDv-0007Oz-2H
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:16:03 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:45297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijDo-0005PE-8o
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:16:00 -0500
Received: by mail-ed1-x544.google.com with SMTP id q3so6696025edr.12
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5i6O/NXgsHqSsmlYgDOvOCpE8WyKKdXAI9Zys/W5mlc=;
 b=cCIb0Ne7j5iLG+VqA9HNszY3b9toOA2at4R2GDb9z6k/PCJGD8Ydh+MkJPpTd4desW
 GEO244tI4uR0IdZsHTBaeHt45m9WSpV0AYAE/WduCBTxGEy+MFDfXToTwhjnZBaEGosy
 2EccJ1iO60cBzqC5/G7xKMWPVH4aiyBcLpxK8KBCCX5gCMFcAOZVCtp4xNivy9Qm1GVE
 J8k2XwEa94lmfdY9KktkmhN9WLvqrcbJw1MeGrRfKDbK0+4MIBaABTFMojEuc5WHwaX9
 UiLnvhfHgYtxRpNBG2x7sHR6pyOHL6bmDliBfhV3esBAcB6rCOoENOltXH/0BXQav7jq
 aWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5i6O/NXgsHqSsmlYgDOvOCpE8WyKKdXAI9Zys/W5mlc=;
 b=tJdtqCBrwC38qf2IFeGAJBfoGMmmUdnB0A9Ghan16TUgUIM8j571AZEhtvdyjA4bKp
 oY7TaC1gfOaLSINw2hj+pLzbKF/WDjOQc/omwMG22vTkIZz9ww3f7rbuHOHFP+s9dzTR
 OGtSd7aXMj7bM/x6yh6pUu6qhMnxgS2FyWHKHrJvzv1KD6PG3WAaXntVzpF5ioB/oa4v
 1Eh5qG4WVo5HWho0zMcf3chXDjefGX2hSxGAWWF5A3EP54G1pbxuqjYt3PSrKn0gHtjZ
 RWxXIPrHBudfrHdIkj2Wpo1mYbx+U51LNFJ1NyEP3cmdBla/AbzYffkS37UTGEHKEOVn
 hv1Q==
X-Gm-Message-State: AOAM533IbYsYUIMZym0ZQgYLPl/FWjUQp9s0yEIZBpDP2dlq1XAibDPE
 ULpa0SSC2yvGXxn2l80+djxZ8wpmi48B/2LasTxB3oBx2YAjSg==
X-Google-Smtp-Source: ABdhPJwKKp/9zzdRwcHBy6fqMZxgXbsDezX5eCTZtkv9dunv1OvNHpDzpdrni08q0UMNNm5zRlWrCGTxuZqYdaS7gvM=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr9297274edy.251.1606504553339; 
 Fri, 27 Nov 2020 11:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20201127183619.8958-1-info@metux.net>
In-Reply-To: <20201127183619.8958-1-info@metux.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 19:15:42 +0000
Message-ID: <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
Subject: Re: [PATCH] python 3.5 compatibility
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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

On Fri, 27 Nov 2020 at 19:12, Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
> Several stable distros are still on python-3.5, so qemu cannot be
> built there, w/o backporting the whole python stack. In order to
> make qemu build there, make it running w/ python-3.5. The changes
> are mostly removing the new type annotations (which, IMHO, just
> serve for documentation purpose) and replacing f-strings by classic
> string formatting.

We dropped Python 3.5 support deliberately in commit
1b11f28d05121fec43 on the basis that all our supported build
platforms are on at least 3.6 and there were features we wanted there.

Could you say which "stable distros" you have in mind, and whether
they are covered by our "supported build platforms" policy
https://www.qemu.org/docs/master/system/build-platforms.html  ?

thanks
-- PMM

