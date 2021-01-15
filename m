Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6472F77F4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:50:02 +0100 (CET)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nc9-0006GG-Ae
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Nb7-0005lP-VO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:48:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Nb5-0004Cl-9G
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:48:57 -0500
Received: by mail-ed1-x536.google.com with SMTP id g24so9168456edw.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 03:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKKaiSUJu1ZC7nlTLMm/z+4PB1pTcr4IvClezmnR0CA=;
 b=xWFDPQKnBr9z+ZloKu84+VdVSqjNnzcbcvSg+jPNv7+J3H/zin6untc2+XmyfbqN41
 rwv9a7TH9ptGlpR/90SVFvYp6I2MzOpfRclzUugwN1gxvtjPBuow2ktOtZ7QyS4plEbT
 PfZpIatamxwmeAjutbJtAyTzL1ZRyy1NDZKaheezWjikPEUfq4Ot2QXDC9X8mPmaV9r+
 9XgusvDvW9J3EeGwcGGwvf/fMhmOQHy6Wl+JTeRsFlNlH1bwcNYllM6imgoANngOBZWI
 OOMRv/AEXNufEHLVoh+h/u7BT9ltaPEGSX8mqPEbQKQTDjSLzlu0xPc2RlYccCybcx1v
 EKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKKaiSUJu1ZC7nlTLMm/z+4PB1pTcr4IvClezmnR0CA=;
 b=XEgxkbxhaoBUiYZ8EgQ3g1nIYr1A2aQMPiOLQEHlXj+N0o/t33OUs5bTJ8Nu26156I
 w2/Qnl5+J+Mwv0DfacTIrtV8SLl5c1AzdZU8xFlL06INziZ0jw/oANT9k/IZaWdnrO20
 GgNPMDS9sB0pyjQelewOQrz45KfSZNcv12PwQmTMYu6RlLGuUTiOICJsvQdgrtQ9uFJ7
 Uvg8XSkH/qrReRl87qw+Tcy4aT5/D2GK7i/VLaF51hBoYy91Ktle13ImrkYCb/XzYVSJ
 ajgm0q8gMRMuPxs1oAlhkIRYzRY8Ky4oxnoHAFXvjFJYYod3GBMhs050heDEj9dzvwux
 0t8A==
X-Gm-Message-State: AOAM531YQOQvhfCsqzl+dKxniABcv1okOhXsuCmTKHv7H2YbqhQ/av7R
 lOYm8b/WNhe5kC02SwOCnr3L5t6JNSK8ZZPdLUgCdA==
X-Google-Smtp-Source: ABdhPJzEyyMc3wXOluiGWu8EvtynwWp6NVdG+MX2oVddIv7BqwWv2CpvO4apxRgHsqTbOTIYBP2KkoPo3NQsAQIs37I=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr872607edu.251.1610711333330; 
 Fri, 15 Jan 2021 03:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201117041736-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201117041736-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 11:48:41 +0000
Message-ID: <CAFEAcA90AWh7CLBa4Nj-be+DzLXfn9HdA01ihaHnvjcHrcePGA@mail.gmail.com>
Subject: Re: [PATCH for-5.2 00/10] block/export: vhost-user-blk server tests
 and input validation
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 09:18, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 11, 2020 at 12:43:21PM +0000, Stefan Hajnoczi wrote:
> > The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> > pull request, but was dropped because it exposed vhost-user regressions
> > (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> > are fixed we can re-introduce the test case.
> >
> > This series adds missing input validation that led to a Coverity report. The
> > virtio-blk read, write, discard, and write zeroes commands need to check
> > sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> > in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> > integer overflow".
> >
> > Merging just the input validation patches would be possible too, but I prefer
> > to merge the corresponding tests so the code is exercised by the CI.
>
>
> Peter reports this hanging for him so I dropped this for now.
> Pls work with him to resolve, and resubmit.
> If possible let's defer the addition of new tests and just fix existing
> ones for 5.2.

Ping! This series was trying to fix a Coverity error -- it got dropped
for 5.2 but now 6.0 is open what are the plans for it?

thanks
-- PMM

