Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBF2DAFE3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:17:16 +0100 (CET)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpC4g-0004Hu-LJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBys-0007OE-Lh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:11:14 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpByq-000145-S8
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:11:14 -0500
Received: by mail-ed1-x533.google.com with SMTP id b2so21410272edm.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9iiaS08g5XwxYQIGSVPeEwxZbT1t2HQAkbg11fsSIOU=;
 b=UVL3khVcUOHRe8C5wVxIRrGvfhIGeR7zzW17nzFu4V80QF18WjxOEze7LU/88L7+d8
 wAHGjq5qk0qYE9spy+Nqr5CZihdvLwrr8LmbJBT9KKx67vZlbV5OAsRIC1YGFuoNligR
 reaAfgsDPYznaMowZApu9AtkJEhzka9eb+rccLiXiuA6vrie6fL5FuvZrdPdon2EmuyB
 a7+QxPN+CAApHRAI+r3zTSGsqeNNqKPyQGewR+VhvT0y8TNZ4jY5PNLVPJuzuEv6fQbF
 Be67rptNk9+pE2sJYeQUFuBcIh8TY+NuTCEZZgb2kokejktPnVmtF8yTI7jI+1ihtmyI
 i/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9iiaS08g5XwxYQIGSVPeEwxZbT1t2HQAkbg11fsSIOU=;
 b=pQaMooUP59jheu6KGK/S6EN9jo14OSqTCTq2IZgAqEK0OFwAh94slMcYVgIdQloLnC
 +m88nwBUwMx7EqeK0IF4BwfxxtxVad+QImhggGXGU/+Ar6ur5z5SgG2G9lIbNHG7S9VD
 R1IJoDtQu24DHxhcFv02nIIVNgnH6QdMst5UAMVjk6w3p9vfwL/iT8SNqGMkMOmYiRWz
 msJkHAkJYt5NOuDnsx5VtlHDvqCgRiBHnUwy8l1fQo097fhhk1a5mzmESkU/PM0DmwEf
 f0JJ3ff7/b91riFu9WF5NarTlLn1yF/AUCPiYR3Oxqk2HKGSTHnszx9oQ1fTWPlzTJI4
 Xs5Q==
X-Gm-Message-State: AOAM533r2qQs73H9Ti2agoBuxMLxwWLk4yXE03nHSJWA3xsEx5sV0IMf
 j+GMi7Hp0BRKCmx1vy6YQTVU/ZR9jAS+qsxTk9jYkA==
X-Google-Smtp-Source: ABdhPJxjHyRXGQH+GvHmnyG2b5xW0injslvrVoh1Kakgc4DZl1nDDGYT09GQ/8rNoJQ+OfjKAFjembmDg2PFusSxG/w=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr30300905eds.146.1608045071439; 
 Tue, 15 Dec 2020 07:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20201215141237.17868-1-peter.maydell@linaro.org>
 <20201215141237.17868-21-peter.maydell@linaro.org>
 <CAEUhbmUgROy8OTSkz6hv7YexMXT_U-iAF2O5Y_9RdZJcco_WGw@mail.gmail.com>
In-Reply-To: <CAEUhbmUgROy8OTSkz6hv7YexMXT_U-iAF2O5Y_9RdZJcco_WGw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 15:11:00 +0000
Message-ID: <CAFEAcA93oDGjpmW4T4Qa5WLswui6C_dfVYxzW3UaJCSPi_XrDA@mail.gmail.com>
Subject: Re: [PULL 20/20] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 15:06, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Joe,
>
> On Tue, Dec 15, 2020 at 10:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > From: Joe Komlodi <joe.komlodi@xilinx.com>
> >
> > Numonyx chips determine the number of cycles to wait based on bits 7:4
> > in the volatile configuration register.
> >
> > However, if these bits are 0x0 or 0xF, the number of dummy cycles to
> > wait is 10 for QIOR and QIOR4 commands or when in QIO mode, and otherwise 8 for
> > the currently supported fast read commands. [1]
> >
> > [1]
> > https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453
> >
> > Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> > Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > Message-id: 1605568264-26376-5-git-send-email-komlodi@xilinx.com
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
>
> Sorry for jumping in, but I just noticed this patch.
>
> I believe you tested this with Xilinx SPIPS but not some other controllers.
> Francisco and I had a discussion about dummy cycles implementation
> with different SPI controllers @
> http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/
> I would like to hear your thoughts. I think we should figure out a
> solution that fits all types of controllers.

I don't have an opinion on the technical question. Do you want me
to drop this patch from the pullreq ?

thanks
-- PMM

