Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DBB2E7D44
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 00:52:34 +0100 (CET)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kulGb-000229-2f
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 18:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulFk-0001NF-Id; Wed, 30 Dec 2020 18:51:40 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulFh-0000dr-Kt; Wed, 30 Dec 2020 18:51:40 -0500
Received: by mail-yb1-xb31.google.com with SMTP id y128so16104058ybf.10;
 Wed, 30 Dec 2020 15:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=INrNCSPHna5Q5SFMnCRtfb0NpALehAgSQWwjH/1FFg4=;
 b=suMEZOrnuhYHOCIhzkbpV2rWmLo4F/V5xfsFPaCS6Z7hb41SS27kPP/BQS4btBGgK1
 I6dkUHJR1YDQCXnUShRv0MG+vPlwClx0X2cdsymceEhuFrFE26JeLpNYL3WJac3hbJG4
 Ezl8dL1m1ki8ObhMv8cWf335Uaecb67Fpb5u4yyc83a+Nmg6oGCxXBg/s8p0TrESrMyh
 n+ChWIvShT83nMEG26KBojEcL/0tbc+ICpG8TYL+v6mW5EDYcjcsOZriyEPnmZLg9SRi
 NQwfa6EBEHf9sPWuHB4wquiM751iz05mRd5rgC39BYDYAyy+T9KdAOljZuowrKAZM/VX
 D4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=INrNCSPHna5Q5SFMnCRtfb0NpALehAgSQWwjH/1FFg4=;
 b=h0j4ByJbxjivW3oJpex+sRkEhqR0qMMAsmFwJ7yAKni3y9QQuJJe8Fk/FgQO4xVbce
 2T+mzYe92EFLycr660VdjPT8GWpcsZx3PM9518eJs1mGaSfGt9Z/AJM4kOzQ5l7rih1K
 wm2cxA5ZCsdaZOGC7GUveEe7Sqibza8QEwRusewR+Gwe3DuZFyaYaolgoTICIuGPgmwl
 +FjonFFDJ2RMQXi5iRhMGFWau3v2+BeY2DMF1iVIokbQHSl7p85hIOmDxwg2PN94ML0s
 MZ8vxV5QLIDRTAlrTatH+B9q8yJmXWceaNGhr8rFTPNb/n7oqClw5WOyEw4pIcvPELL+
 RfrQ==
X-Gm-Message-State: AOAM532Pp4SL9sk1gFWZskqMsMpEoBWtYEj7Al7/uLisNCVkgRH6IUCb
 jgW4KW4Jxqsi0vdsjcnmFrKEVIusu4SmeBZ3TJs=
X-Google-Smtp-Source: ABdhPJz2/lnyvFNxxut0WNAVyD8s5uVM2VDciZzUEkbVLDVGqv4NbK3HZovkkm1Xqagl4RL58yI6KxiuymFv1De2L3Y=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr23692664ybb.387.1609372296259; 
 Wed, 30 Dec 2020 15:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAEUhbmV8gfgtb=hXwimhPfMHs_nJ24PKHLynydZRVkuM8njV6g@mail.gmail.com>
In-Reply-To: <CAEUhbmV8gfgtb=hXwimhPfMHs_nJ24PKHLynydZRVkuM8njV6g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 31 Dec 2020 07:51:24 +0800
Message-ID: <CAEUhbmUfXOqPyQqFaLgekLApo7MBjMJnL97z0vY=0Rsh9rW-+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 22, 2020 at 2:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 6:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> Ping?

Ping?

