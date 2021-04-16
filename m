Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6491F362745
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:57:00 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSiB-0000NN-EW
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXRxR-0002KB-6k
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:08:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXRxP-0001Yq-4f
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:08:40 -0400
Received: by mail-ed1-x52a.google.com with SMTP id m3so33107690edv.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJNPdotRNzdX+KLl8aH5wI/EKKENeflbhthkK+M4HK4=;
 b=V4X3mLO6Svnfrg8CUKNSY50/aynSEH6+zvwuptqUjwimFMlVbv6ZkzBGxcPhRpSlrT
 13Rx+c6/plFVGt7AMXdPqmUJ8SQZ/OtLp90RPgDp4MgZblM6ozNkR1U6ADGcGZMdUxgE
 lUZ/8iOVZ/ERov7ND+UpcE/bG3OYeZrfRrb5J6ly4HyYPF4UoLOKiOAxbC0/ZlKmisVu
 dotLNZPFk5de94bUl8LLMtj6zxm7QtqmlvNTZcHESvtJV7P0slOug8M/utsdYLftStNZ
 1VvZ9bl1jdlPBlGJsYa+qoSUnMrxP0ToPh9dbzcc4j49DcT+y9a6Cs+H0Leu5FZ+ZmDd
 QM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJNPdotRNzdX+KLl8aH5wI/EKKENeflbhthkK+M4HK4=;
 b=INEM3ecjKwiPJxkcla6cdTjjaIrvugXa5ECJHSDb+/zEEdS9WvWgLZNID2IgWt1Z/4
 FO9eT/e4roS1HgOm1cP33j9PIx+wyL+j7wF1ishSZhvizw4zNOF30zBf2BkLoKrrTIQ1
 Cs4gmZUX8xIx2Qx/n6zbu2+6TfxGi8RAi14ct10eC7AZsu6t+ROq2FqY2JK26kAtOaSg
 yOFXrxUJM2n5FsFXJ+6HiN9Q2b23PSdLK7TQxdval5A3TgWzZDoeZq22FHdKzxeG5YgV
 vUv9LYVqjik4IOn0mrIjOBBNYQbjy19TrkirFtkXYRjVrK9JiZf89XAlCeQrMHuSLxJi
 6JUw==
X-Gm-Message-State: AOAM530JgnHSir4bc5z1EnXM2fJEZGKHUVfYlcaqbkxzihzRW0ZgaNPh
 ClWz2C8bwuKctXkOvsxM/FprjYHqml+qu01wZIZx9w==
X-Google-Smtp-Source: ABdhPJx48RbQlx98qjHEVJiSrAMmaR1Zk7/AXGP2SRCb6QehfjMxdvdNgJwXT72sRnmrbVT0B+aay3Y4k2kXw1k8/SI=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr11383371edd.146.1618592915034; 
 Fri, 16 Apr 2021 10:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <63df4bb6-77ae-b8fe-770e-6eb8efa7699d@redhat.com>
In-Reply-To: <63df4bb6-77ae-b8fe-770e-6eb8efa7699d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 18:07:46 +0100
Message-ID: <CAFEAcA9nJmPfcOx7dkF050-cXF6Qf1+5nXWAEkysy-2cn4iTFg@mail.gmail.com>
Subject: Re: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 17:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 16/04/21 15:55, Peter Maydell wrote:
> > Hi; this patchseries is:
> >   (1) a respin of Paolo's patches, with the review issue Dan
> >       noticed fixed (ie handle arm-a64.cc too)
> >   (2) a copy of my "osdep.h: Move system includes to top" patch
> >   (3) some new patches which try to more comprehensively address
> >       the extern "C" issue
> >
> > I've marked this "for-6.0?", but more specifically:
> >   * I think patches 1 and 2 should go in if we do an rc4
> >     (and maybe we should do an rc4 given various things that
> >     have appeared that aren't individually rc4-worthy)
> >   * patches 3-6 are definitely 6.1 material

> > Patches 1, 2 and 3 have been reviewed (I kept Dan's r-by on
> > patch 1 since the change to it is just fixing the thing he
> > noticed). Further review, and opinions on the 6.0-ness, whether
> > we should do an rc4, etc, appreciated.
>
> I think at least 1-3 are 6.0 material because build on a supported
> distro (Fedora 34, due for release on April 27) is broken right now.

We don't support not-yet-released distros, because there's no way
to do that: they might always spring new surprises on us that we
don't have time to react to. But I agree that the weight of stuff
we've built up justifies an rc4.

Is patch 3 also required? I thought 1 and 2 would suffice, but
I don't have a system which has the newer glib.

-- PMM

