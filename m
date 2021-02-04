Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5E30F55A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:51:20 +0100 (CET)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fyZ-0001Ct-DT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fvW-0000Eq-20
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:48:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fvS-00044K-Ht
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:48:09 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so5798103ejc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ENG7ewkylD3SVYRxdFxp87v4mU0NTvlG4kLtNcSPRg=;
 b=q5839UmbGp+EGGUzoqLfBShw1YnQWssp7jll16ZdBaSWkIAs1b0rgffb+TAFvBsU4v
 GyhPv24vWCHO41Iqm58XmTqoIlK8yoNkbZXj/AUx507iS7Oz1WsHHD/eZ8iTnwbN2cg0
 UCmJVrSuop9RWr7G7qFhVWnM2s3kV/BCQynxH5ijnaAFq3iN21nlUpKR2NHIIXgC5YwX
 /PB4MxGhCGvp4MIksQEDGaRofb8Jjr4LjolComz54CrW/S0xITaqpYv1KjoXQ3C9eqQ7
 cHo6odKx7tENJ6V0jbwpC9YYw0AzybSJAb4ef5fFHWo8+eP+RMP9L51BzyEcomcU14ZF
 SKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ENG7ewkylD3SVYRxdFxp87v4mU0NTvlG4kLtNcSPRg=;
 b=qAeIxWmpujZnGw0sfFI3kfb/Z/7dEc7jcolF5wb0gYACNpY4uxbG1+ukMu9ttTczk5
 J90RBKnD12R4jG8/Riz1tOUNmA59tQ4wg/TJZSQtJSYLtodyLSNXdF8SRHu5gQI/nu65
 rpK3rVZkcm6lDwctHSk2vV5iAbU4ztdVcBtxNz6+Hx+lAUAoi69jE6WeLZ5zAKkOeFDP
 i/30wcTDrBsGDLK6VrX7IDPXuIARltCPeiU64cql50i+n5hYKues09tsUr+REgRtV3Xn
 AnPJY/uSEsE2bk8FavUeXm46JzbpY7KXtbglyCI+CJ7RBiwIwuYM2NL6fPQGA3+EAWux
 FrSA==
X-Gm-Message-State: AOAM532B5g6Hd+hb//RQOij7mZu4bfeIVqWksf7xsck0HsOtEvK6d6Jm
 ETTrQ6eEDlz/g9V3aho5rLS+xdphgNUsACGjuP1b/A==
X-Google-Smtp-Source: ABdhPJzQkfh5lmZLYXZUQOD6AVHGKPViiFv3bf/L6lb65mcK6cd0l1KUn0kFXEkvi/9HiqfGMx5aVFptdJI7YNsCumI=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr8420589ejt.56.1612450084069; 
 Thu, 04 Feb 2021 06:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box>
In-Reply-To: <20210204144006.GI6496@merkur.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 14:47:52 +0000
Message-ID: <CAFEAcA_z83hJMgGuA8mSmNESpfEGE3AE+SKxaM1BT7489kt+kA@mail.gmail.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 14:40, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 04.02.2021 um 15:31 hat Peter Maydell geschrieben:
> > On Thu, 4 Feb 2021 at 14:23, Wainer dos Santos Moschetta
> > <wainersm@redhat.com> wrote:
> > > Unrelated too, but allow me to ask:
> > >
> > > Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the
> > > tools directory (virtiofsd seems to feel alone there)?
> >
> > I think that would be a good thing, yes (things documented in docs/tools
> > should have their source code in tools).
>
> Maybe we should define then what a tool is. I think contrib/ has a few
> more things that could be considered tools.

I think that's more that contrib/ is a weird mess and dumping
ground (as directories named "contrib" usually are -- it often
seems to mean "pile of random unmaintained stuff"). If there are
things in it that have better homes elsewhere it would be good to
move them too.

thanks
-- PMM

