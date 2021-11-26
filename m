Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402745F28C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:56:30 +0100 (CET)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeWS-0001RX-UM
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeUz-000896-HC
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:54:57 -0500
Received: from [2a00:1450:4864:20::429] (port=36360
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeUy-000674-1x
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:54:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so19992355wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMdirr5DOzumIV9LVk4HRmSZnV6fmeYKr179wY1h48o=;
 b=vMsMG1zAtNKTIFraA3M3tWFlu1pE8sFoOceJMCoSzvbxpW8PWlBmaDDgwkEDwsRNa1
 RLXdYXtjpJ98pynWpIHGLpqZClexZfAwkUgnYKmzBrXDoWx1pIMbXVjhPv+pOIiR4DXn
 LC+lp+VJXwDXPEGztgRqrrtgyc2pEa0Bk7rG8i2iR4aUq4R4tbqKKn1sbLm3H7hJpspg
 Z+vvx2V6FpWMMzSBjBBSEsMlIre/sOxxgdUthtqZo0HhmSLF1glGUpgky5vDuFj/67P5
 Gd5xJPb1T2+Nwiwjhhv1GZGCR3QxUSjX1Cc59/l7i/eclayFZvqENIEGKfCx9TNF/Hzx
 QG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMdirr5DOzumIV9LVk4HRmSZnV6fmeYKr179wY1h48o=;
 b=wy9nkKdnHLUvSpH6CTlVCNz7XFQ93KUNjFwPqwchkg6IkP6ODf6aLr/uJ99MRpLrYG
 fKyqDEp76tSJZzBVGSxrepAi6fbXq6tJGJP5Qcj6JhMFHoNGs9sZrCUAokX1WX8tRYFs
 XhW5wX7NYfCXLEgkdzFDEAa1gx0Ydhski1xZT4Dn6zEj+az1zYa4sQUOVZ71Pv+5Bl1l
 9lfPcTr0uW8UYzUq+UPeYgsdqK6rENgt0Y5tvOTl/eGkPcIkNIzW7M5GQDVfxWaFpaiA
 kV50yWQOTuO8m/I8ReA9+60M0OCTKgfUduRipaL1QXWQiLdsr2Nkmvov6JkXNDdyI7Bt
 eHvw==
X-Gm-Message-State: AOAM530xhlWcPI04zAeiA0bSq1yyVh3QZOHV9he2vvDNUGFCn6JrzAP2
 /xo5hzcbSTbTKRlBnHMME7mXKBized/M6v+P0k8ojQ==
X-Google-Smtp-Source: ABdhPJw85+2vFyj7k/JTTp6phtGR6QzstSdMd/enXDCGeMz5RlMCKOJPvCNEb9NQjKLM3Q5NrXY5d/g4INvPYPlF8aU=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr14814790wrp.528.1637945694797; 
 Fri, 26 Nov 2021 08:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
 <CAFEAcA-spJc2Dg=D=9=XgPYxdzi_d4sJh27BRDW_DD9y_+O0JQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-spJc2Dg=D=9=XgPYxdzi_d4sJh27BRDW_DD9y_+O0JQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Nov 2021 16:54:43 +0000
Message-ID: <CAFEAcA-xOJL52QqyTVx3UOu5-LdV251GbNgb9+saDC4Tdr8S_w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: leif@nuviainc.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Nov 2021 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 24 Nov 2021 at 18:22, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> > to be enabled.This patch fixes the issue.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 84bcbb5f56..c929a9cb5c 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
> >
> >      switch (offset) {
> >      case GITS_CTLR:
> > -        s->ctlr |= (value & ~(s->ctlr));
> > -
> > -        if (s->ctlr & ITS_CTLR_ENABLED) {
> > +        if (value & R_GITS_CTLR_ENABLED_MASK) {
> > +            s->ctlr |= ITS_CTLR_ENABLED;
> >              extract_table_params(s);
> >              extract_cmdq_params(s);
> >              s->creadr = 0;
> >              process_cmdq(s);
> > +        } else {
> > +            s->ctlr &= ~ITS_CTLR_ENABLED;
> >          }
> >          break;
> >      case GITS_CBASER:
>
> The code looks fine, so in that sense
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> It seems odd that we have two different #defines for the
> same bit, though (ITS_CTLR_ENABLED and R_GITS_CTLR_ENABLED_MASK).
> We should probably standardize on the latter and drop the
> former.

Applied this version to target-arm.next for 6.2, anyway.

-- PMM

