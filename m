Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E63456A5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:19:42 +0100 (CET)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYW5-0007s9-6r
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYU1-0004rj-48
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:17:34 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYTw-0000Tr-HU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:17:32 -0400
Received: by mail-qt1-x830.google.com with SMTP id s2so14073158qtx.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KMyv6UwfIDM575qYdeEBx8z7YTGEAhGsVLNf+ybBwI=;
 b=Y67tu2fckeXE0P83VpUQskny5o2AubnM9voykixEqu4QiMDkkHTr1s9VcArvzeQE0t
 PNsDXKssjK2vlrN0zra+hNH+6OXxnpAQjYgXmWzKBauqaei0/q1g+5kmVa1abi89xsgI
 7EJN6VNAmzjYCt3UInZ0xTqSeGPaEFKjtK9qLaY4/rP8vO03svC/4FG5rH5fVc6n9hcz
 LdCeSyC7jYTGYJ7/AaKmkkdCWCLpzamiLl3m8IUy229IZLNG/H942ROJLV7p15rNHcQc
 gKph9HHr4s44a/4ZCcBDyOS0jkoj5dOr8MY21xM8QnSET8XT+eezBCnwVSK/blJW1W+d
 LWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KMyv6UwfIDM575qYdeEBx8z7YTGEAhGsVLNf+ybBwI=;
 b=HD8PgyNMlSJS3X5vTbLtAeNMSDphTdXV1VPYQop6vH5dPWYn0rctOLpAb7RMgQQDFs
 vwnEiNAOyTMkMOGN2BYDlAB2djqPCCPbAxVWKzPlNGftJ7VvJ1s+46WJ2Uq06ANswDK+
 gCqZxgXJWsc9xrwsHGU7fbkRMtzbGkuzObU07kGrbGhMj4oeVNqnRSghaV3xbw2SBQnz
 0jzr0WBU8PhuBryPsX+Zevl78ci8LyVr1apbxGaHfXJOOF03Xtf83wXgsAnljCf4RPh/
 PvnWzz7SgWadD9vByVu9gyq8Vorj4GcHJaLjTwHZDMD8hkjULoPytH9BhzkjN3HEOt6u
 0Zwg==
X-Gm-Message-State: AOAM530TcJtzYhFXmPT38o6OUoaWtHDbbU2hEz9Iwm1o0pN8CQm0U2Tc
 X8L+KvypIwBG7ir480bSrRS5dQ==
X-Google-Smtp-Source: ABdhPJxBPEei8+uuHQztaB2MvPAwdFmxsqZfJPmQo0auxFldpe7d7YesmRl6w5qI8dee/uCqWguO2g==
X-Received: by 2002:ac8:4543:: with SMTP id z3mr2958782qtn.286.1616473047430; 
 Mon, 22 Mar 2021 21:17:27 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id c73sm13041373qkg.6.2021.03.22.21.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:17:27 -0700 (PDT)
Message-ID: <cad8a51902cbabbe0f0a4750d42b5f6765e45402.camel@linaro.org>
Subject: Re: [PATCH 1/2] hw/intc: GICv3 ITS implementation
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 00:17:26 -0400
In-Reply-To: <CAFEAcA8q9sS-ob7XDKh62OX-R=5icXbhSTqD64KB-K+=yg2gOQ@mail.gmail.com>
References: <20210315164931.23477-1-shashi.mallela@linaro.org>
 <CAFEAcA8q9sS-ob7XDKh62OX-R=5icXbhSTqD64KB-K+=yg2gOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

As per your suggestion, i have split the series into smaller pieces and
shared newer patch-sets for review including cover letter.
Also,have added virt board support and tested the same for
functionality using kvm-unit-tests.

Please ignore this patch and consider the latest series patchset for
review.

Thanks
Shashi

On Tue, 2021-03-16 at 16:15 +0000, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 16:49, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Implementation of Interrupt Translation Service which allows
> > eventid
> > from devices to be translated to physical LPI IntIds.Extended the
> > redistributor functionality to process LPI Interrupts as well.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3.c                    |    6 +
> >  hw/intc/arm_gicv3_common.c             |   20 +-
> >  hw/intc/arm_gicv3_cpuif.c              |   15 +-
> >  hw/intc/arm_gicv3_dist.c               |   22 +-
> >  hw/intc/arm_gicv3_its.c                | 1386
> > ++++++++++++++++++++++++
> >  hw/intc/arm_gicv3_its_common.c         |   17 +-
> >  hw/intc/arm_gicv3_its_kvm.c            |    2 +-
> >  hw/intc/arm_gicv3_redist.c             |  163 ++-
> >  hw/intc/gicv3_internal.h               |  169 ++-
> >  hw/intc/meson.build                    |    1 +
> >  include/hw/intc/arm_gicv3_common.h     |   13 +
> >  include/hw/intc/arm_gicv3_its_common.h |   12 +-
> >  12 files changed, 1807 insertions(+), 19 deletions(-)
> >  create mode 100644 hw/intc/arm_gicv3_its.c
> 
> Hi; thanks for posting this. Unfortuantely 1800 lines is much
> too large a patch to be reviewable. Could you split the series
> up into smaller pieces, please? One possible structure would be
> to have a patch with the framework of the device but no actual
> implementation of register behaviour or command handling,
> followed by patches which add the behaviour piece by piece,
> and then finally the patch adding it to the board.
> 
> I think it would also be useful to have the virt board
> support, as a demonstration that the emulated ITS and
> the KVM ITS have the same interface to the board code
> and are basically drop-in-replacements.
> 
> Finally, for multi-patch series, please always send a cover letter
> (the "0/5" email, which the other patch emails are followups to;
> git format-patch should do this for you).
> 
> thanks
> -- PMM


