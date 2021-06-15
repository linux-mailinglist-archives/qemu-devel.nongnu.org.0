Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F093A881B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:53:01 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDFD-0000A2-Rn
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ltDDs-0007Ik-0P
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:51:36 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ltDDp-0001fq-OO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:51:35 -0400
Received: by mail-qk1-x729.google.com with SMTP id i68so39295512qke.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=el11CozE8yeNVNCbwDjL1qnzArid1d8P695r3nmjEas=;
 b=OjFOjkxk87hwxQQwc3FAIcAuKCJHU3BsJDg3hB/wKmO3KXzJ8tPrLEVFKhJinEdspJ
 6AwgiWiaOq5wtRfXu6FytD3owplD9BvHuhHgwp/xPDsrQfcnSzxoLe+e3VryGmZspU2K
 TemUyYiz5uecuBomJWdj4Mraz5bT2r/jfpw7BNLxeshyfbtxF4U3uJoTY17NiCk1I/Ph
 P+wcanh7XHOcZ2giLsC4PbaPXlPDw2eFcr5cVlrd0jj2kHExGoIXIGH6KSm8JSjyufMN
 z1UQ6WtDbunWYEyeVp2gEWfUQhmjhSsG5DGQkkSDNaStuy+UjHTfssIWGI48aHlkgNxg
 D7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=el11CozE8yeNVNCbwDjL1qnzArid1d8P695r3nmjEas=;
 b=MRUPa2mldQhar5l/Zw/eHAe2ozR53RquCsR0pcimbL7bUl07XwuUgrX0aI3pF1v5p1
 L7E1psAXbeasstfhCoqvps/yaOucodyBomt7caUWt9IfL7d/9TbCO0scPbaTD+z8ZUO7
 NxpJvek3r+fayFYmPWDpWBJEjDY+dvGxeNs1qpOn2vRRBp80Z6GsnViLgJgqBm6iK59J
 wdyCR3R/RR2DFsqUgQb+YQZ4Mq6Eyph0VSEp0I5x3W+acr+VgpMBVIJPfgYAbYaQKexs
 IRGRRvtsoUL2rztkxKI2A7gUHF1tfrNPOiMthpZNQxbze70/GG6LnlAcw4zFlZHDfEtA
 Qz3Q==
X-Gm-Message-State: AOAM533zDMpI+NQPIL1CjbOViN2H4guXHD5LAf1Vx239ZRTQVIq2R7BL
 1yn6xeUdY8eL8IIeIPFeNYtCp9Q9JwqK+A0+SpNgSQ==
X-Google-Smtp-Source: ABdhPJxqVd0wIzIPzQ3bvKLqpsC+ZuuIyoIUePngnpOSq2lGkG+4vAYb6jdHRgU4aGlj/qL2l4geJ++ALmE8wVklLDA=
X-Received: by 2002:a05:620a:2058:: with SMTP id
 d24mr875162qka.472.1623779489963; 
 Tue, 15 Jun 2021 10:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
 <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
In-Reply-To: <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 15 Jun 2021 10:51:18 -0700
Message-ID: <CAO=notxMQVaDykBrcseHQyZfC-m9NTkfdYLPdXZi8mpruJ-eZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=venture@google.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 8:46 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
> >
> > This is a board supported by OpenBmc.
> >
> > v2:
> > - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> > strap value.
> >
> > Patrick Venture (2):
> >   hw/arm: add quanta-gbs-bmc machine
> >   hw/arm: quanta-gbs-bmc add i2c comments
>
> Forgot to ask for this earlier, but could you send a followup
> patch that adds documentation for this new machine to
> docs/system/arm/nuvoton.rst please ?

Yeah, I'll try to get that this week.
Patrick

>
> thanks
> -- PMM

