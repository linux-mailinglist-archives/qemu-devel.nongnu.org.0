Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B43097C3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 20:06:07 +0100 (CET)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5vZO-0003A7-Mg
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 14:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vY4-0002b5-9s
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 14:04:44 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:32917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vY1-0007zj-HB
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 14:04:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id c6so14421671ede.0
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=g9ov0VVs1sCdcd4GwD2Rn1yejaNO5CuETR3oztC0Xkg=;
 b=CIA8NvEulkN+vLw83eXXsBwWIUXXqW/Jpc4iD01+5FBwHdK2T5VfjHyP+Eel4YI+H8
 JyXiJPCHNWsy2+J9t73XriTuRvntpXPDn2psNuxGy+UHs+ZiRFq53cadFtxKiogZfxgf
 +m6Z+X8ThmF9W/97AQAP2l9V4xojFyH+XWGCeDAMXWLrH39EZav0J4BUVfPBQ2Uz9ii0
 E2yn8EfRWja9XAC5wCWphCOBw/h70alSLIF6rxYWq1gdxKOwLbvRsZ1DyjvIDgfwOYdA
 2RbCFoBrlNi3OP7cWduVsnBoRmVgizuCBq+gdCItCQLuysNZgo3AMmuM2BoaQliWAp+X
 jy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=g9ov0VVs1sCdcd4GwD2Rn1yejaNO5CuETR3oztC0Xkg=;
 b=QvYrdgjwXQ6X3axZUCoN4vCTMolLVfuoNVM8pTHBr9NH92Sw35FQT8fjlHH9nrVh6S
 d4O0b2y2fKuMpzfBIXlsdv584Oi5NspDFuYUmap6CRgr4dXqWwNNMRMY+Q7b6A/EeXFe
 WhaimQFZ5CpMmUP434JyxyknrovaSo7JU6dIs7VArS0ii3I13Mx8C7YEsF9bFOfjzl1A
 lVIzJJCdtLTFpSd4nz5iT5HByfu+mAtR76+QYKRpo9vwOJ4LHIEAFC40UD+sIpRZA5c5
 wPA1psEvhrkqffql37EZ0uwa/7XsS9geCMjkpGi2J3LiH55r6nAhikING0Z4nU7qAQ/E
 s3qQ==
X-Gm-Message-State: AOAM531IIJIYsW9VOddwZHWJ7MM1ULYmu2Uj5zEEHRfL0NtDkYTh1dDO
 IQhA8lbrb9tsZTYS6LgEcQ2F67WYc58i77LJoavKUV4o/5cQvtMwVi0=
X-Google-Smtp-Source: ABdhPJzgGTWh2a39lrSBTZbk0IOWJW/yztogMklO1WEmrblNo0ijn5vT5vlpOseaCogKyqEPjKTkSDgWiGqoOOi6FAs=
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr11164355edx.191.1612033479865; 
 Sat, 30 Jan 2021 11:04:39 -0800 (PST)
MIME-Version: 1.0
From: Iris Johnson <iris@modwiz.com>
Date: Sat, 30 Jan 2021 13:04:28 -0600
Message-ID: <CAN6Exg2Kz9yu-9Ftx4V5QL31duVdNCvR3_Pn-4PG39_zRm+pzw@mail.gmail.com>
Subject: Question: Adding emulated machine support for Apple M1 mac
To: QEMU Arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=iris@modwiz.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

In light of attempts to get Linux bootstrapped on the new M1 macs I've
been working on supporting them in QEMU as a new machine type, I think
this has benefits for testing and potentially there is desire for an
M1 Mac running QEMU to natively support emulating an M1 Mac and
potentially booting OS X under such a setup (although this is not
something I can personally test).

Adding a new machine type is hardly a straightforward process though
and there's a lot of paths the existing code takes that aren't ideal.
Constructing the memory map and how to handle initialization of the
hardware before jumping into code that would expect to be loaded from
firmware bootloaders are two examples of cases that are handled in a
multitude of different ways.

I'm looking for some feedback on the possible approaches, you can find
the current progress of my work on what might (eventually) turn into a
potential patch adding support here:
https://github.com/modwizcode/qemu/tree/add_M1_test.

Currently I'm focused on booting m1n1
(https://github.com/AsahiLinux/m1n1/), a sort of linux loader, with
the goal to have enough support to not need any qemu specific m1n1
patches to handle qemu differences. This goal has been achieved well
enough to start work on basic framebuffer and interrupt controller
implementation.

The most objectionable area at the moment is that I currently just
modify the cortex-a72 to stub out a few Apple M1 specific MSRs,
obviously a real coretype for the M1 should be added (probably two to
account for differences between the two types of cores it has).

Currently I have an "AppleM1SoC" object that will hold all the
peripherals, and then I add a simple machine definition called
"apple-m1" that (once more information is available) should simulate
the hardware environment of an M1 based mac mini.

Feedback would be appreciated on desire for this, implementation
suggestions, critiques (although there's some cleanup I'm saving for
later once I've decided on a more correct approach)

Thanks
Iris Johnson

