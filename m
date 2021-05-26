Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD639216E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:22:32 +0200 (CEST)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm02x-000691-9U
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llzmW-0003dk-Bj
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:05:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llzmS-0001kv-CS
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:05:32 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h16so3009146edr.6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfbF+bpDCj7JPOXpBGOG+bg/GEQR0sagYh89CokxVdQ=;
 b=xMPI1I1HrwyVD14jYGmJsMpIgY9U5qYlFViQa9oODjDPso58xx0HMIs5C5KOLEBkrR
 LvlUgnpQeaHJUZHgcpFLMs0J2zcHf3MlBVYWfKLOXO3djXwS8ZzMPg1NaFBOi5ponV96
 iJAKYy8AKFz3UHFJjmaZQ93P2h6kD0OpKZERu1qihydtDShQ1giE1+fbXrqsBTGLoB0z
 K6zqjBpeW13aUFqkutGiNaXLADE+GMH3ToHtAk9r3PXwyC2pypn8JwOvm0UbRkrw7XFp
 ubeY8w7oBqn3xjlYDIQYjcAseYl5/pzDUS2zM5AfAdSw9+tnmNY8QesN2tVAl/2bupok
 W3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfbF+bpDCj7JPOXpBGOG+bg/GEQR0sagYh89CokxVdQ=;
 b=ZNqsEOHVzJ4tagpXOw2P25fjLAOYk+9BqEHQyoTvDw1wKgeU2OphQQscsTs/sO+SA1
 IRLUAeJUiLnNFQN/aJHcqg+hw/E9IE7h3H41atdn5m6t+iwd6vMaQWvCx2nI2EvECocH
 Ug+qtDj87nNchhFHW2lpbbs+y8EFc2k291GJeJSx1w7oNW12aCs6sM1RHOoUma8W286v
 SA7TWYQNd9wdGXBaKNIr/sbrZb4WF7AvatvAO7Ho1sKro0VNxlgeP44NrDsTJpbst4/H
 wrsmAKgmcrSlgMGRESa8xxYeRt0YNHrzhaQJBjPGa3tqBW86SyVhqA7VM08Fjc/e4QqQ
 cSjQ==
X-Gm-Message-State: AOAM5307fSFPvOdO0YRLVIVOalQBGPfUE83EPgpe4AHy22Wf9FnJKSl9
 KRR2jpV2gUdRj4x3C8u+d9P4b9Rp9QHx5ddOhuVVxw==
X-Google-Smtp-Source: ABdhPJx6094l9Ys15lkWS1cm/jF/4PHHiCE2egt98NTexhq+0luMktSwkx3SndWjcElC5hZYwT9pMiCBr06+Vpiy6Fg=
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr19298edv.44.1622059523824; 
 Wed, 26 May 2021 13:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210526140627.381857-1-kraxel@redhat.com>
In-Reply-To: <20210526140627.381857-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 May 2021 21:04:58 +0100
Message-ID: <CAFEAcA-ug0s7nVuq5chC+VQPP9zunvMCkf7veUCa_SOkft-+Ug@mail.gmail.com>
Subject: Re: [PULL 00/14] Input 20210526 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 15:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/input-20210526-pull-request
>
> for you to fetch changes up to 96376ab154cfb7a8f0b985e26db5b0074b86c2ee:
>
>   hw/input/ps2: Use ps2_raise_irq() instead of open coding it (2021-05-26 11:33:49 +0200)
>
> ----------------------------------------------------------------
> input: a bunch of ps2 fixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

