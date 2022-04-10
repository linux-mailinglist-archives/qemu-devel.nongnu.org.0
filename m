Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842FB4FB0D8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 01:43:00 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndhCt-0006gn-5d
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 19:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1ndhBI-0005xT-Ne
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 19:41:20 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:45986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1ndhBG-0002yp-Rd
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 19:41:20 -0400
Received: by mail-vs1-xe31.google.com with SMTP id r1so11696034vsi.12
 for <qemu-devel@nongnu.org>; Sun, 10 Apr 2022 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ym6yqyY5sFwpGGsbfw5iz4CIsOOzqkNqAuVSMQULboY=;
 b=kazeVf/yKn7bxh/UbSspQ3E0D5/wmLtLTwY+zCFjpefwKMvBvbITBKmL2bP620SeFP
 pkl6CLK/vuntsICmAP+Dl8B21BRLkZ13YpsVhqS/Dvk7dWjYvzTj7XEYKv8JlyaA4BY1
 TR4ZZwJo0BoL/EYvYSC2RYmBUYgmUoc51UUamWmXji27x5rrHqOIfm16g4llkq5MgeH6
 EmM+j2gCCOxnnBU8HD1rHOjBm6fq8B2KNKEeB15/f4KqLTBNXbyAYO8tkCAlvHZD5Z32
 Qx4Es/v0qy7V3YnVjCVwlPE2T4blc3JA2KNELYx9KTB2W2XckTTMMS4EiTYOGkKN106/
 EAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ym6yqyY5sFwpGGsbfw5iz4CIsOOzqkNqAuVSMQULboY=;
 b=1YlcopMkkX7FCNNKNsVcqmBVeKqfmUH5J5w66bNhL3we81cWULKWyD7UQnzuOMdGQH
 yfqmhDUNDm+MsTARB4ZOKDAYFKTntOGcCykJTf7+68bYDotKGwvKwMoBYmfAsDdgG2Nt
 8gOgrd5pvJeMXWnB9f6C5twRAHGV7fMBkTeVL4PsT8Q3SXS3XmAsdqx+RIlv2bxSXX0q
 q8tPV1t8PGERqv8zLdWyW2p/ZyovXMrqRnjBgPLkr209u+OkapdgJ5rR8azjVsAakgjV
 rBeaGxg3QEEthWyH6LyEMB5b2vSa+oY4y0YFv1mxOxuHx2FbgXHJGy5lvozkrsyDdFf9
 NKtg==
X-Gm-Message-State: AOAM530M29gXIOsMYooF6ZBvoxGKqIBGsPfqnwXaIC6/Hs7+9hZaqRmI
 UxQxC9ftF8lz0m2niNpKsHxfq6zEuu8m4H1Ijlc=
X-Google-Smtp-Source: ABdhPJy1RP6DTiP3syn9sNFKJX0YBCaeXMgHl4cf7XYT7M4oBmfueEGY9X0EwVFR6FcYKpCXTO+ZidGecw3nB/lefi4=
X-Received: by 2002:a67:ba10:0:b0:328:28e6:7066 with SMTP id
 l16-20020a67ba10000000b0032828e67066mr3158930vsn.29.1649634077012; Sun, 10
 Apr 2022 16:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
 <CAFEAcA9UsOqNhCu+o71YCMr6Og5as7Ht+LD3XLiujkKjSygc1g@mail.gmail.com>
In-Reply-To: <CAFEAcA9UsOqNhCu+o71YCMr6Og5as7Ht+LD3XLiujkKjSygc1g@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Mon, 11 Apr 2022 08:41:06 +0900
Message-ID: <CANW9uyt5UDNrygX_TS9FBDb5pJdJLkHAtHqDFEoyg1U0Mgz0Ug@mail.gmail.com>
Subject: Re: Procedures adding new CPUs in sbsa-ref
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Good point; however per the SBSA specification, DEN0029F, there's the
PE architecture requirement at
each level from 1 to 7, so now I am wondering whether supporting
cortex-a57 and a72 are good enough to
set up a fully SBSA level 7 compliant "board" in QMEU. Also, the 'max'
is there, but does not boot.

Itaru.

On Sat, Apr 9, 2022 at 12:04 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 Apr 2022 at 15:59, Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
> > I'd like to add a64fx cpu to the sbsa-ref board, if there's a quick and dirty
> > way of completing that, advice from the  maintainers is greatly appreciated.
>
> I have cc'd the sbsa-ref maintainers (as listed in the MAINTAINERS file).
>
> However, I'm not sure why you want to add the a64fx CPU to this
> board model? The sbsa-ref board is intended as a platform for
> developing firmware that runs on Server Base System Architecture
> hardware, so it deliberately doesn't have support for every CPU
> type QEMU implements.
>
> thanks
> -- PMM

