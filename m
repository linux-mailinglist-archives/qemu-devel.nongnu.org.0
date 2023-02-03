Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTP id 7D860689775
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtm2-0002xL-7X; Fri, 03 Feb 2023 05:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtm0-0002x6-76
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:58:28 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtlw-0005ln-Q0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:58:26 -0500
Received: by mail-pf1-x432.google.com with SMTP id 203so3275850pfx.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8d6mjyLHkJPyIiWXEMIz2NyVjGrTa16pNi+vqTctrCA=;
 b=BeNguZONfJtjDUnPRw/lLrRlkIfZ67iXqhlApl39t7uaSylfz7kYk1Bkl6fNZFp8id
 VRkhfi6Qb0RJ+m/3zIGBJKAAmsi9eeQ8p1L3mXwbN/RMH5qYEs1u6sI+9gomx10uNG85
 9jy5xrOtIilwy0MLNrJ8/koWTmWoNOVigxsI3Y2cdKrupp/UCXCNJ3zzOq4nu4Bmx2ur
 BFMRGwboSSYGBAHSdkci/L5a4rnQykQMnSfb4XVRkHJlMmV5nFY6KLrgUJkrgipDuU6i
 ZEJucumglBqWi3iUmaFmp1Zn7YsjHmcwnZd1j1mrwvgHgOBxkdUYMmM8yrXEHH47bMiC
 wPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8d6mjyLHkJPyIiWXEMIz2NyVjGrTa16pNi+vqTctrCA=;
 b=SFrbNIjZKka/K1uyw8vxN5eFdjAEiWd++aLSWS/Q41hpELQSC1IDzbxk8nIdh9ra0S
 KsxpN1lNjQQOrfqJrGC3NkzkS9Y/5EWUsrDc1YvxfYrBfoeSaQFsaeSLkXPRLT1wFwJg
 MiiiJQ0br/awbeaXCN26pIiuOxPUbj+8F8I+90UjEZLUnUy/I2nuV/ZLBdWxlRQJ6pqe
 66zsu64Ah3l88Ad0tkzg/alORhhHl5YLZR5vPjUYBtXVmyDbBpaTsVeYzc8BrVIo5KZl
 GvhnOWtJvtD04TNcT/O45bGqOm8qVQ5dzqjuTZ6+pgxk86yX9bM8QNRcRzBmPf31FyXD
 p5qQ==
X-Gm-Message-State: AO0yUKUgvNIwNn9lbBIlbMTebZG4eeEP/BTApVwukRkXWnB/nTDhwOpY
 f352fZ3FVPjEtek/qIncPDbAAbzzPWXcsa6p1qtJbQ==
X-Google-Smtp-Source: AK7set9XcJsNjArB5tDKUDEFlkh0FA//k9Zj5mRptZy+v37/7PD4a6PgJqevO1tr6cfqgTjxUP37ebGqILdB06YezNY=
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr1591532pgm.37.1675421891381; Fri, 03
 Feb 2023 02:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20230128224459.70676-1-agraf@csgraf.de>
 <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
In-Reply-To: <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 10:57:59 +0000
Message-ID: <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, osy <osy@turing.llc>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 28 Jan 2023 at 22:45, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > We currently only support GICv2 emulation. To also support GICv3, we will
> > need to pass a few system registers into their respective handler functions.
> >
> > This patch adds support for HVF to call into the TCG callbacks for GICv3
> > system register handlers. This is safe because the GICv3 TCG code is generic
> > as long as we limit ourselves to EL0 and EL1 - which are the only modes
> > supported by HVF.
> >
> > To make sure nobody trips over that, we also annotate callbacks that don't
> > work in HVF mode, such as EL state change hooks.
> >
> > With GICv3 support in place, we can run with more than 8 vCPUs.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >
> > ---
>
>
>
> Applied to target-arm.next, thanks.

This one *also* fails 'make check'. Please can you test your
patches before sending them?

The fix is not difficult (another missing qtest_enabled() check),
so I've squashed it in.

thanks
-- PMM

