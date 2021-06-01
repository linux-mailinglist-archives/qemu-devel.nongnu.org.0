Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFDB396D8A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 08:46:34 +0200 (CEST)
Received: from localhost ([::1]:56136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnyAb-0002td-6F
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 02:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lny8o-0001ot-Sf
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 02:44:43 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:36794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lny8n-0005fp-75
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 02:44:42 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id s107so15851322ybi.3
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eitphQ69Q6/bQla7Rqy36hmX8pD8FZvbx46IzfS14jI=;
 b=mPkLTAKnA5BUN7buj3/NygFv3LziBjvbGqIAXflF8k/4WqGYTXRzebQS6ql9sIm/YW
 hhRgdLmTu0+g2ceFAgcYMpau8vLFj4V+WYnhI0UjugGFZwOYXVpLoDG1ALfEy/zFtSCi
 Yx99pnPegT1vkW53RgbBKGKJ2MLRWDiXXjv7Sc66Kvt+mM+2/BfhTS8MbuV5O8qeJhW2
 QUNE1t0h2KMjygd05sXEB99t7l4F7d/g1ODtPDtohNV9F4oQ5yLX9UuQhwyIMOGw0Wr0
 re6mJX9rizabJ3iU4q2ZQNljjzHRZFQThEnqU5ya+b1Bs3tSeg1P1irDhIlqtn+JKQh0
 Kk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eitphQ69Q6/bQla7Rqy36hmX8pD8FZvbx46IzfS14jI=;
 b=I5nXI3pS1nBSQrz/4gETNRqY2xOT68Wl22bBfSynQPoilx0JsrUBS4hCDeiQ+BYUhC
 EYHTnWA+LX4XKim86tNQFdzpG2Y1LwzF+c+NYE1iimOlspMDAXQZBYqJPfEs5RrAqeaL
 cNUd5YL7EFOr3ZygHaZrDHPhAO8fTMggvdVbCAqnOEcRb8NfrTNJ6ZV96pzlyqxzJnCe
 J8z/QXFl8CR7JoxgUyDn3yIAM7NYQMu3JkJMVDTAuFLHsxSKUv1KyO739aAiOQ5ygFzq
 uO2DgjKleHJnB79THw9hnq6vnx2KRVB5m5TkZelsuvwBUgXmnR6yU+zBAd66BIkRMvKq
 lczw==
X-Gm-Message-State: AOAM533+/EoZOYtvTMA0lx2N/+U9cNpkTbL5r0G6tyTuMglxS1+OWMDJ
 ILHO1X3Kqq+C+FwP+4qhrV2HJs69Fr/A0oUI114=
X-Google-Smtp-Source: ABdhPJzWX0uAdeVFc8yMaXd7Svj7yfbTfYo8t5cumaYRboqA91MK1VFB1tzFE3EcGJ0FgWuArab6Sp8XQYqxiJzsNRs=
X-Received: by 2002:a25:6a09:: with SMTP id f9mr327310ybc.332.1622529880226;
 Mon, 31 May 2021 23:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210528142202.2154592-1-kraxel@redhat.com>
 <20210528142202.2154592-3-kraxel@redhat.com>
 <20210531153219.xfuel2wz7i6ko4jm@mozz.bu.edu>
In-Reply-To: <20210531153219.xfuel2wz7i6ko4jm@mozz.bu.edu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 14:44:29 +0800
Message-ID: <CAEUhbmXpMB0nHkdjGTvh_poH45DMfLxOz9hofpfRJ7ZZUM73Ww@mail.gmail.com>
Subject: Re: [PULL 2/3] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only
 when told to
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 31, 2021 at 11:33 PM Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 210528 1622, Gerd Hoffmann wrote:
> > From: Ruimei Yan <ruimei.yan@windriver.com>
> >
> > At present MSI / MSI-X interrupts are triggered regardless of the
> > irq level. We should have checked the level to determine whether
> > the interrupt needs to be delivered.
> >
> > The level check logic was present in early versions of the xhci
> > model, but got dropped later by a rework of interrupt handling
> > under commit 4c4abe7cc903 ("xhci: rework interrupt handling").
> >
> > Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
> > Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Message-Id: <20210521024224.2277634-1-bmeng.cn@gmail.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>
> Hi,
> FYI, OSS-Fuzz detected that this fixed this stack-overflow:
> https://bugs.launchpad.net/bugs/1905444
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D27796#c5

Good to know :)

Regards,
Bin

