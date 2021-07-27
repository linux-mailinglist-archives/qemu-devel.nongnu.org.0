Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F613D71DA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:25:11 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JKo-0008CI-K7
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JJs-0007W6-0a
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:24:12 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JJq-0006gt-FJ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:24:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id f13so11724456edq.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9iLjJ5S0wd4k9Fpnvvoxg6hpK80evotnLuMaXzjs7GI=;
 b=H07DRP6sQd9It6QdEOu6FacBR94D85pyF28xIlwwtYk/gdrGenCmyWMnSjA5snPP+d
 IVPb3L+GtTftUAw6UkXQFHRieIJlC4FPpzgI9l+g51iarhvRffcDfNQGkDjoJEtQyydM
 Uvdt+lZoXliQ+GLkgdC+8+CvZIsFpq6CU6NhVxrB2oZpnXWzIIYUfjpjyloyFNvkzgsf
 adcatuTaQOp8PoI10P5OKC+NVzi6pgVySUOsVxDPHPX4vGnmkVJqfKmIF5ppcezqO7yo
 UoiozmXLA016C6DrzPIlYcGDiPnrkHUKmT+xVDM/gf00svYmSrjKCp74vf+UQYmBaDO3
 /FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9iLjJ5S0wd4k9Fpnvvoxg6hpK80evotnLuMaXzjs7GI=;
 b=sHlrdPOn90PPFtCl0xRSDJzLuRplCiDn5tBgwUQaGZle735Nl9JLJqKyNnZi+To5Gc
 mz5A2wUsHH5PTHV7G3YknOjhTO/TPbIVWLMIo5JS44VeDgzwzbXarmCPAdQMlfXA5cLC
 lNS19vtPf3yWwP+cGkh2i2IVna471+ITTxEC6uLUueitzr4zo7ejK4+GJyysTzAbbuQM
 kWMbAGsMD72gnBx1sZ/f+O83xA6K/JJeogHI+aZcg4aMVaWORIRLYjQGoQWVlMbkpXtm
 iIC1EKWMm/Y6ND0V1QsgpXdAoDQ6A8WDiwHNyIuDpxhnf/ocni+A2oAhj3ReLtnZlDEy
 RG7Q==
X-Gm-Message-State: AOAM533PBFINmA/oHThuMpyMGFqLYvs/Whj8MQPoMfx9/H+syvyFSfDl
 5zMLKOz6taTbbIu1oqAMw6yid2UFfAVblzH/hrNqKQ==
X-Google-Smtp-Source: ABdhPJwHD7zgZHo6EWHEp5J+oDyoT+8ScL+hb2cntHTFrSVhLPDP+FJknqopzbynyQr3dLCuY4dt+uj4c6sOE9VJmUU=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr17001152eds.251.1627377848719; 
 Tue, 27 Jul 2021 02:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMiADQ8S9XSgH_zEGTw2bQpoPh4BqKByEaAUA5TTL2rLwYV=gA@mail.gmail.com>
In-Reply-To: <CAMiADQ8S9XSgH_zEGTw2bQpoPh4BqKByEaAUA5TTL2rLwYV=gA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:23:26 +0100
Message-ID: <CAFEAcA8DqSSg3i5L+Rj6m+9X3BWzr===FdufFJgR49tvq6dq=A@mail.gmail.com>
Subject: Re: QEMU question: upstreaming I2C device with unpublished datasheet
To: Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 22:06, Shengtan Mao <stmao@google.com> wrote:
>
> Hi everyone,
> we are hoping to upstream a MAX I2C device to QEMU. The device's datashee=
t is not public, and we are contacting the Maxim company to get their permi=
ssion. If Maxim is okay with upstreaming the device with an unpublished dat=
asheet, will this still be an issue with QEMU?

It's not inherently a blocker, but the difficulty is code review.
Without knowing how the device should behave, it's hard to tell
whether the model is doing the right thing. Ideally Maxim should
just publish their datasheet, so if you/your company has any
leverage with them you should push them to do that :-)

That said, we do have other device models in the tree which
don't have public datasheets, and as long as the device is not
too complicated we should be OK as long as you can also submit
enough test cases that we could refactor the device in future
without worrying too much that we're breaking it because we don't
know how it's supposed to behave.

thanks
-- PMM

