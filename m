Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7C3B66BD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:28:33 +0200 (CEST)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu7d-00006u-1S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxu5c-0006I4-Ih
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:26:28 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxu5Z-00045E-Ne
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:26:28 -0400
Received: by mail-ed1-x530.google.com with SMTP id w13so20831167edc.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5n590fBEpRMrKH6fJYWHH9IGuY38gH9hzq+B+1RgJFs=;
 b=v47LuQ+3FnGJ7P9XSyiAZbnmhOUDRBmahCZeQflYIFSdNIqLZ4J7B/dipF4VOHuAWX
 Z0jhCTIY6LHQsjRyRUxLX7XF2JEtJDqW6NYfYWj3ewezcXtIcesyJQ9dipPINz99r2O0
 AJBjFC1KAM7uK4EGeTCrCAt7FtxO7K4TKw8y8qU9Pv2wrbzbDUQkHwcd3WP0hLkzGILF
 jsANOXOpiBj1Gp2YNN8PH2wUIzRep/BQ/KcVuf5OgUwS4VEP51q9+iTNmEsAG0Ifdw1R
 GQga5qkb/eDvBPGmb32SKIR9eFnI9HL6QSOidxI8JYKouASkwQIZpaa+9fPdHBlRlyQQ
 J2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5n590fBEpRMrKH6fJYWHH9IGuY38gH9hzq+B+1RgJFs=;
 b=n6CT/t/cR+yQriqgICxowSLojfCRs4vYf6PBC36Tm1WV2LUKmPg3YLqCcXoZMJ9L2V
 qZhyfvpfZin3lJUBLK6AvM8stKGpv/LFTgtRi0emE6PdqQwkXGGOxFH4Pdo+GAVnSoj9
 XBnVkQMOlQVw5lYZcQUCFKi1QCjxTVtzgVlXIZ5nQpE+uOqMmKpXRvyoY+z88BgbthK7
 RowN9CveFz4N1fy88gx4bx0lheY9BxbtLQbCAQZxDB4Dpcn0qCPfHN6QmeOXEaDOHNGf
 fDSiY8+bv670dHJY+Qkx5SCOdXOIRtc9o05wFdTrEe+Mlj+MliFmfjOz8bobmqz80f1f
 eH6w==
X-Gm-Message-State: AOAM530sOQFio1fF0FAqcb04g0waG4XbJPpUcpkY75GA8p4jkDagJLap
 H1WURhEgQkrOr42uocOkgUglbklbrm/oLHJ1GeYEqA==
X-Google-Smtp-Source: ABdhPJx+vwXe83APkZ6q1FPnkZnUzyRdIEaM3FNl8EItFKXR7Djj5TEUpk7Di1Ou3YX4BoLJzjwPbzQzSuNEifRA5qM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr33257178edt.100.1624897583833; 
 Mon, 28 Jun 2021 09:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
 <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
In-Reply-To: <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 17:25:46 +0100
Message-ID: <CAFEAcA8V9TegQbisBufg0CHooV-eDzE6Arvh-7H2wc2F_cRBXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 15:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Jun 2021 at 20:28, Patrick Venture <venture@google.com> wrote:
> >
> >
> > Patrick Venture (2):
> >   docs/system/arm: Add quanta-q7l1-bmc reference
> >   docs/system/arm: Add quanta-gbs-bmc reference
> >
> >  docs/system/arm/aspeed.rst  | 1 +
> >  docs/system/arm/nuvoton.rst | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
>
>
>
> Applied to target-arm.next, thanks.

Just noticed the docs don't actually build:

Warning, treated as error:
/home/petmay01/linaro/qemu-from-laptop/qemu/docs/system/arm/nuvoton.rst:2:Title
underline too short.

Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
=====================================================


But the fix is trivial, so I will make it locally.

Passing configure '--enable-docs' will enforce that it complains if you
don't have enough prerequisites to build the docs, rather than silently
skipping them.

thanks
-- PMM

