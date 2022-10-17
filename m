Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D86010F9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:20:30 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQyg-0005Iv-NJ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQs3-0007WO-HJ
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:13:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okQrr-00028p-Av
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:13:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id 128so10572059pga.1
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dmI63+i3xoIWBCbd5XSsui7MT1vR6ghnjtuE5WRRghM=;
 b=FiAKVxnhBJHOPqa5Pw62utR/LGSBDJDm9ss4GkXNeQ69Y58D+0tdcHN2KPxRPBTg2n
 m6TVdLD5UrsUPxJgs/DOkYfOMNW5478w5caRQymoT57rMsqRosNXbeMNIGfe18jOQmzo
 IYqjK2bEqKlkCUn5xL8XNn2muPGmBnAD8qkxfD8RdJ4QaP0BxEcv1ZaOlC2GTDk8qfwQ
 D7+YoiY3RW5A9tttcVcs2K+l5J7oKpprot4yXYbazCoh01PNuWPUJwDoLepukrwq81t3
 oLcnQEoSqbgAZiFQL0/DTqj664qPADO+aWJ81MI3Jhp4DxQXTBpK8y03wUJLz9nZNenz
 J/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmI63+i3xoIWBCbd5XSsui7MT1vR6ghnjtuE5WRRghM=;
 b=t2I4c4XEcnhU653kzNeprHlDnWXKcSFLneXnUE39VVOO9WPAMtVtlbLTAvyOPGtxuB
 FSeaIuuItx1ynHZ3tnrDqCeWc51dFph4vg5fdyTrRLS/p39LYg1kg8Kk5I9v/8QgbaTi
 9M2znfmwtZmauYwklNfy4vFh2N82IvbN4s3+Mdp0WA98tgbI1XpiP3jNsKgtJV14UMTZ
 zLViNCyJ8gyG2fAkD0dXrkHge5A2h4ENfUDOugw/9fpvd+GxvLRhoiD6NW9wkTOFDgNi
 HFiDPMRyMmBOSUIO6k/V90rthbi/EpychZ4QpfSZNz3Th7I5w+Ik9AhCfJH+XgT6o4Ue
 koug==
X-Gm-Message-State: ACrzQf3AKigNvp6vY4pCKh4PJVvTxsZtpqN+UjKu9uS64zqzK+S5TF6E
 R//HBjD8lBd88GveQ+IuRUPrNOzOO5SDNQyzWv8rzw==
X-Google-Smtp-Source: AMsMyM7s0R/Z0DWyEdeVkmebtDQblZPFdh4s3TjD4CqOH7eyIl6uH90UW0UwmbFMw6VdoXjnQxbkso2ou+baYqGQDlY=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr11259050pge.231.1666015998754; Mon, 17
 Oct 2022 07:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
In-Reply-To: <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 15:13:07 +0100
Message-ID: <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Chris Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
 cfriedt@meta.com, jslaby@suse.cz
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Oct 2022 at 14:50, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 221015 1710, Chris Friedt wrote:
> > From: Christopher Friedt <cfriedt@meta.com>
> >
> > In the case that size1 was zero, because of the explicit
> > 'end1 > addr' check, the range check would fail and the error
> > message would read as shown below. The correct comparison
> > is 'end1 >= addr' (or 'addr <= end1').
> >
> > EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!
> >
> > At the opposite end, in the case that size1 was 4096, within()
> > would fail because of the non-inclusive check 'end1 < end2',
> > which should have been 'end1 <= end2'. The error message would
> > previously say
> >
> > EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!
> >
> > This change
> > 1. renames local variables to be more less ambiguous
> > 2. fixes the two off-by-one errors described above.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254
> >
> > Signed-off-by: Christopher Friedt <cfriedt@meta.com>
>
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>
> As a side-note, seems strange that edu_check_range will abort the entire
> VM if the check fails, rather than handling the error more elegantly.

Yes, this is bad for a device model, though we have a lot of
older device models that still do it. The preferred pattern is:
 * for situations which are "if this happens there is a
   bug in QEMU itself", use assert. hw_error() is a kind of
   assert that prints a bunch of guest register state: sometimes
   you want that, but more often you just want normal assert()
 * for situations where the guest has misprogrammed the device,
   log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
   and continue with whatever the real hardware would do, or
   some reasonable choice if the h/w spec is vague
 * for situations where the guest is correct but is trying to
   get the device to do something our model doesn't implement
   yet, same as above but with LOG_UNIMP.

Probably most hw_error() uses in the codebase should be
replaced with one of the above options.

thanks
-- PMM

