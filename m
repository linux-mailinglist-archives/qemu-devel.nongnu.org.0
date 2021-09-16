Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6740E0A0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:22:34 +0200 (CEST)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQu9h-0002QG-HS
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQtmg-0002gV-7k
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:58:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQtme-0000P9-AM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:58:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so3304015wri.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9va8IPoUbumHfiNo6Kwcmx+DBrcIdYjE4IvnXeCl2Bo=;
 b=LUMvFE0TL9aJVlN8n7lB2fFaTrZCfWRJQadFPlxDUaUniE+r3J5Fhkh2sjLxAbMMCm
 xSxkVmPWCkinZB0jERwKk9bKgwiWfwUxSQMPyzsbG+9jtPYZr8x2SoBtZeJBMh9JEReZ
 pqLIpkjnzIFcQtG27bI4AtM7t+k8SHe0CX6nE2N7mxXwxIckttnoD7QvKylAAj8cXOO6
 Wz4+1rhLnLGNQbiBSG3bD0U5vVc9IHTLnMLiBXTnG/B2h6Mn+W9chuoJyXdq/0K7sLIZ
 S5R9Eypi/bvA3yaMdF1YmWtrv7fhjgP54+szPM51LzXoQjkvJ9vYYQpbNu8u/VzS3uHi
 H43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9va8IPoUbumHfiNo6Kwcmx+DBrcIdYjE4IvnXeCl2Bo=;
 b=ura3+H1H5+vRcYUAJXUxaNXabW1qFt0IS+mT2g3z+U9ui/oHx/rWyZ3AvcqgjrNwpO
 f6VlgF03xWiul+yxjplQ03soxp3fN0mJ2PT+mu3+RA/Hs5qtcsVEgz/DhYyw7zYXTyU7
 oqFfac6LBQeABSZigl3TKuKdkeu8IWvF/RU5yYe57EiFBPEeOdm6sMGusT8FOXXyb4MF
 nw6ZeU8eahzAwmSt478UHs9jWamR5mK0XfpQtJL1wKVs9G+1c1naIZt64ZbzJyY6Vaxp
 mxid3HzelMGxYqOPWlawb0Z4mLECkQTPCPJR97icstdrRT7J0Z69jTJqPACCwKnbYqZU
 tPZw==
X-Gm-Message-State: AOAM5302Uo/QsucM0d71VkdCLxERPsKXbyLqsWY1Z/N+8IxbOsmuj4Cx
 AHWQO3p2M2pJ2ead6BbsKHZiUrQ8s1PGJG+uchMpjQ==
X-Google-Smtp-Source: ABdhPJxwdf8PLmTqydUjj7yppShOcL6/eiCnJHXLxUw+z/chuXY8ZXmPMy0luIkSGZVDAyP7TK7W7U28TvMY/ZPRa1o=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr6771793wrq.263.1631807922502; 
 Thu, 16 Sep 2021 08:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210916135241.150566-1-dgilbert@redhat.com>
 <CAFEAcA-k=jKqBcEzxd+ALPYz_UVT1_AG3PnsuX2N77_UTSE=nA@mail.gmail.com>
 <YUNj1DQT9VyU54DV@work-vm>
In-Reply-To: <YUNj1DQT9VyU54DV@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 16:57:51 +0100
Message-ID: <CAFEAcA_DDQFkF-n3_mr9RyRBUnUN00kZNKoiP_e5koY3F1zxHg@mail.gmail.com>
Subject: Re: [PULL 0/2] virtiofs queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 16:33, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 16 Sept 2021 at 14:58, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
> > >
> > >   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916
> > >
> > > for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:
> > >
> > >   virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)
> > >
> >
> > gpg says your key has expired; what keyserver can I download an
> > updated key from?
>
> I pushed an updated one to pgp.mit.edu just before I sent the pull;
> I can see it there (although it's a bit slow to respond).

It doesn't seem to respond for me; a recv-keys just hangs.
I recommend keys.openpgp.org or keyserver.ubuntu.com.

-- PMM

