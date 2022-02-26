Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0844C5306
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 02:24:01 +0100 (CET)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNloV-0003ll-Mo
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 20:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNlmy-00035U-4p
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:22:24 -0500
Received: from [2607:f8b0:4864:20::62c] (port=42659
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNlmv-0001mY-G6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:22:23 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p17so6163623plo.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XSM6bRvyjmHfdUnApKBOLsFfRuyIS+Ba3gMlMd2bQoY=;
 b=BE8z/44TNLULTXx57Z8GsjifV+f/tiUr5GxaFg8NCcREEAIX43bNpOyOHoblo1Y8oU
 YYZ+uPElyFwfzGb89BvIPaB2j6bGSZCz+bpFQl/w1MIC9P5InQkuRuvRlXWp+qj/59pn
 /HewA8LWD/aKnpltkwA9MOMAKP0N134s8hlcWbba46vE97l/JAcrw4bIeAsorLrqN/AX
 PXLiZjZFK4jGn10EtGgDkQi/Z/M+In0LrP+MKnHiacaC/h9uKCdNsnvFImLTwiv1DMoi
 fK4LRMkY4nlygXIMHVILWaorp2SJ8QDIgs1KBv3RgQ4AqUK98s8kmr+uaffJd3G1+cK8
 dwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XSM6bRvyjmHfdUnApKBOLsFfRuyIS+Ba3gMlMd2bQoY=;
 b=E7Rfx4hLAqezObaUnlpNN5bGqfZqg9GrTfk5/E2R08Goz9lqyfIbhxsvTzx9eSGdTU
 RCPuH8MEqDbOIEs8mxHm9FWbPkEfr74MjSDluJGKkYEVXpm1K3KrLDsREPbCrORHQu6q
 cjZFo33ID8UVSgczpxzuxf02uODUC9tLcygN1BHd6vzCeNmHIDqxBwVsy3wyjEhqHyz8
 ob1gwAWtxrDVl/5lF+7jk9X0fe4c8qeqMAhHUSQdimCuThjIfkikGE5o2wyya6pVeKRQ
 GqwBM8e5oeGZR93PwPtMaUAN2wZwM+z+7hIDyEeRwzLbpzIY26rc0tRWSxnE18BVpXzm
 nxHw==
X-Gm-Message-State: AOAM530ydIYeEZIlNRZuyC3VnqrNRlLfhIMHbVjrhW7QvUF2LDlB3t0P
 f5fWP5DWqtBr2CLWbUzWxi8=
X-Google-Smtp-Source: ABdhPJxC1U3YGQdAon2v5Ns0H+Ci2ZKeo1M1CkbfsK4j9buSAq2v3fM5RE2L2K0o/XIJxkbAir/xEQ==
X-Received: by 2002:a17:903:2406:b0:14d:6447:990c with SMTP id
 e6-20020a170903240600b0014d6447990cmr10119442plo.22.1645838533347; 
 Fri, 25 Feb 2022 17:22:13 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056a001a8d00b004f0f28910cdsm4447476pfv.42.2022.02.25.17.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:22:12 -0800 (PST)
Date: Sat, 26 Feb 2022 10:22:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] OpenRISC DTS Generation patches for 7.0
Message-ID: <YhmAwx67OUmPFQ5F@antec>
References: <20220225083222.1174517-1-shorne@gmail.com>
 <CAFEAcA-YSBDpS5+nfJxqAJ6fjHheLO=jOnH=+WFXsDPo6Y=J=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-YSBDpS5+nfJxqAJ6fjHheLO=jOnH=+WFXsDPo6Y=J=g@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Development <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 01:52:52PM +0000, Peter Maydell wrote:
> On Fri, 25 Feb 2022 at 09:19, Stafford Horne <shorne@gmail.com> wrote:
> >
> > The following changes since commit 4aa2e497a98bafe962e72997f67a369e4b52d9c1:
> >
> >   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-next-pull-request' into staging (2022-02-23 09:25:05 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/stffrdhrn/qemu.git tags/or1k-pull-request
> >
> > for you to fetch changes up to 94c71f14e9ca15ede4172e0826d690b15069a7f8:
> >
> >   hw/openrisc/openrisc_sim: Add support for initrd loading (2022-02-25 15:42:23 +0900)
> >
> > ----------------------------------------------------------------
> > OpenRISC patches
> >
> >  - Add automatic DTS generation to openrisc_sim
> >
> > ----------------------------------------------------------------
> > Stafford Horne (6):
> >       hw/openrisc/openrisc_sim: Create machine state for or1ksim
> >       hw/openrisc/openrisc_sim: Parameterize initialization
> >       hw/openrisc/openrisc_sim: Use IRQ splitter when connecting UART
> >       hw/openrisc/openrisc_sim: Increase max_cpus to 4
> >       hw/openrisc/openrisc_sim: Add automatic device tree generation
> >       hw/openrisc/openrisc_sim: Add support for initrd loading
> 
> Hi; this fails to build on various CI configs, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/2137393314
> https://gitlab.com/qemu-project/qemu/-/jobs/2137393335
> 
> ../hw/openrisc/openrisc_sim.c:40:10: fatal error: libfdt.h: No such
> file or directory
> 40 | #include <libfdt.h>
> | ^~~~~~~~~~
> 
> 
> This happens because meson doesn't put the include path for libfdt
> on the include path for every .c file -- you have to do something
> special in the meson.build file for the files that include it.
> Paolo can tell you what that is, I expect.

OK, I missed the CI results as it was all working for me.  I will fix and test
with the same as CI configs.

-Stafford

> Paolo: are we going to be able to stop doing this at some point
> and get meson to just DTRT and put includes on the path for
> every C file ?
> 
> thanks
> -- PMM

