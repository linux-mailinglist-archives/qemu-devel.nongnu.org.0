Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA123BE0C8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:10:16 +0200 (CEST)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0x0x-0004q1-AO
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wz8-0003cd-AU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:08:22 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wz6-0000Zn-Kv
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:08:21 -0400
Received: by mail-qk1-x732.google.com with SMTP id j184so460623qkd.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QAbRfebMsmDFuN4i4xNyg5XICQTeIxdyB+NjCP2+Dy0=;
 b=MFdJscDG0J6b6+geUK7lkQLZpqvGi0Cyb5SOoRYWhyLTtypFqRFdIHlxpNnlL31rVL
 IcR736i8D+WNiuHi1gylUQzcR2jbmXOZ/w4XQxO39YN6qtaZkGMXuBg7UQ8+wDmoJn6K
 gHadxvZDJHUhUPYAxFllEV7fq0vSfTOlvZTLtTIAarCv2yCnSyp5CNGTZTQjUW7BfbGi
 yVrBZUWPQdbDj2xmyQBOcM6l7T+CpivTP12e7xQZ82tflQT6dXd6uKDgfbNjCtOpRRzo
 3kbaHmoelqnA76mEx2bzOGS0UDHoxKytEyypKXa2NdlHMCDHSD4U2moT1kwMISGCtHFp
 F25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAbRfebMsmDFuN4i4xNyg5XICQTeIxdyB+NjCP2+Dy0=;
 b=EEB1F1fA7uw6saQ385/7x6Heso5Bz+9beplb2jZcdyRc8HvBSkFEp/o6JAJzIw4GIi
 BVsMyyzu39XpmmT2AdZUZzP74c5WGmUsQAIX8IgLy0pg1lw66S3cL45Kw0q/bf6knKkT
 Kfae7ILBkspewwdalLU8s//F9ivJlJ19F/im+MEuH9T3BMQuWQIc7+mYFhb5MaBpmoAo
 hb8J5K7s/ijmTZ4oThAj+HwoQXdCMvvuzKTGG0GvuI7zJ9RvpI83N5z8zjXOcEBNspuj
 bNIRm9JFyHm1OYOajcQ+wUSTgyWmrXMNEHufwPINAqQtXx/APUaUVLqT8lGkLnoyI4D5
 2rDw==
X-Gm-Message-State: AOAM533B6VIVMu8Mc57Z9jLNBFfMBaoEqDBL0KA8L0SCurSuva0qe2gT
 ZVyqldixkUrjkDYCcfEHcv/EPA==
X-Google-Smtp-Source: ABdhPJyfO/DqbOiRipj5ql238WOxuPh8AlZo2DElCHq4Ck/WMRnWqLugVBb4eBKYfw9C/NrmTAYDQQ==
X-Received: by 2002:a05:620a:4e7:: with SMTP id
 b7mr3441593qkh.446.1625623696753; 
 Tue, 06 Jul 2021 19:08:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id w13sm3457739qkf.72.2021.07.06.19.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:08:16 -0700 (PDT)
Message-ID: <8f1298fdb9e5a19d67456ccb59710c920173f6ca.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 06 Jul 2021 22:08:15 -0400
In-Reply-To: <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
 <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
 <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-07-06 at 14:27 +0100, Peter Maydell wrote:
> On Tue, 6 Jul 2021 at 13:46, <shashi.mallela@linaro.org> wrote:
> > On Tue, 2021-07-06 at 10:19 +0100, Peter Maydell wrote:
> > > On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
> > > 
> > > But the pseudocode for MAPTI does not say anywhere that we should
> > > be checking the pIntID against any CPU's GICR_PROPBASER field.
> > > It is checked only by the checks in LPIOutOfRange(), which tests:
> > >  * is it larger than permitted by GICD_TYPER.IDbits
> > >  * is it not in the LPI range and not 1023
> > > 
> > > Checking whether the intID is too big and would cause us to index
> > > off the end of the redistributor's configuration table should be
> > > done
> > > later, only when the ITS actually sends the interrupt to a
> > > particular
> > > redistributor, I think.
> > > 
> > > (You can't rely on the guest having done the MAPC before the
> > > MAPTI;
> > > and in any case the guest could choose to do a MAPC to a
> > > different
> > > redistributor after it's done the MAPTI.)
> > We already have the "intID too big check" in place within the
> > redistributor processing when ITS sends the interrupt trigger.
> > "the LPI range and not 1023" is also handled in this function,but
> > for
> > validating "is it larger than permitted by GICD_TYPER.IDbits",the
> > source of GICD_TYPER.IDbits is GICR_PROPBASER because we pick up
> > min of
> > GICR_PROPBASER.IDbits and GICD_TYPER.IDBits.
> > 
> > If we are to not use gicr_propbaser,then are we good to just accept
> > the
> > intID value here since we are validating the same during interrupt
> > processing?
> 
> You should check the things the pseudocode says you should check.
> When processing MAPTI, that's GICD_TYPER.IDbits.
> GICR_PROPBASER.IDbits
> is not the same thing because the guest can set it to a smaller
> value.
Have made changes in code to check "intID too big" case using
GICD_TYPER.IDbits instead of GICR_PROPBASER.IDbits
> thanks
> -- PMM


