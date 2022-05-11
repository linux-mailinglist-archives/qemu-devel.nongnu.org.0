Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FA5230BC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:36:16 +0200 (CEST)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojhX-00065Y-M5
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nojaA-0002E5-HH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:28:38 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:36637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noja8-0001Vv-O1
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:28:38 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7b815ac06so15514637b3.3
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 03:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2EDSVZZmqnlZBgUSIbBGmbPja7EyDd/q494HGXDajQ=;
 b=b7JzE5k6LG87/QU/dzu8qCUiG8jkVsZISaPrdkIkB2XhmCsr6cuf4M531LS3SqKthn
 OBY7EH8hDqNjPtteUYram4kBXqoRezxwP+fQpnACK1Xn6V68kC19wH81Y/1ma2O7XmEI
 lI32nxLgNMJhJtQXZoFjmBabrH12k/eLCCwgaQgB0g1busvi+QCqpr4Bl58k8dJVH9Z4
 rTPrWBduud0UNSDRP2/kcDLbapUZVMVNR2PrHg1VnOnBChxu0rvimuOnPe10vEkOsUoM
 rc+Y4dzPr5wSH7PHtNewE00y1BqMUyb3yLRnVtB0uD/6/8r9s3flGX2rOdOma2ySp5jf
 8Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2EDSVZZmqnlZBgUSIbBGmbPja7EyDd/q494HGXDajQ=;
 b=c7bAj5lraXhoujDliaxD7xu7EeEvSfzrHL9yB/11mDO33Z9o6fJcyP10PkLTkPZNhk
 xPhXvwfmenb2szYJrPwn2wWAtPnY/ZuGlZIXfVDysH7dYVytLUUT6b6JEj9WW2YQPsEd
 viZOAzr4lV81eyuVJQpeT/cHlXVon1/y1ceWP5v0xj2WLtApqpzdicyc40kaaRDnDcFQ
 aSA259RFYfP4ccfcdW+wg19pZahgP2cORC3vlKJpkfJrb6fEhC/BXbe5+OHrEnooMzub
 HLxsaxUtWsNorBcej7TETXGnNovtqftb3Z0IwDF3538pZSHRrlNGpn7r+EOCbZ2TL9Gk
 vSJg==
X-Gm-Message-State: AOAM532nkABGgnD22N0ph1wWFozhejKSnktUItt1oTyzcx0H/Yz47ww+
 Tn0AFBU3MWf4Fs9uP0CUfC7aO0Wo6q2iBv3wvbkGlA==
X-Google-Smtp-Source: ABdhPJwqTW2QVKq1d8dkJgfltnvTWDkoicxTLO0gERzSPa5x1vXt7lISb1btwCHm1497FEpKMwVEw+FUqwMN5p+nPPs=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr24107099ywd.10.1652264915500; Wed, 11
 May 2022 03:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220511094758.794946-1-thuth@redhat.com>
In-Reply-To: <20220511094758.794946-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 May 2022 11:28:24 +0100
Message-ID: <CAFEAcA9bUires+a-dc8v-oDDKg5WJRf4vVR8jKady5QgjMJTZA@mail.gmail.com>
Subject: Re: [PATCH] meson.build: Bump minimum supported version of pixman to
 0.34.0
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 11 May 2022 at 10:50, Thomas Huth <thuth@redhat.com> wrote:
>
> We haven't revisited the minimum required versions of pixman
> since quite a while. Let's check whether we can rule out some
> old versions that nobody tests anymore...
>
> For pixman, per repology.org, currently shipping versions are:
>
>      CentOS 8 / RHEL-8 : 0.38.4
>               Fedora 34: 0.40.0
>              Debian 10 : 0.36.0
>       Ubuntu LTS 20.04 : 0.38.4
>     openSUSE Leap 15.3 : 0.34.0
>            MSYS2 MinGW : 0.40.0
>          FreeBSD Ports : 0.34.0 / 0.40.0
>           NetBSD pksrc : 0.40.0
>
> OpenBSD 7.1 seems to use 0.40.0 when running tests/vm/openbsd.
>
> So it seems to be fine to bump the minimum version to 0.34.0 now.

This seems to be missing the rationale for why bumping
the minimum version is worth doing. What new feature that
we need is this enabling, or what now-unnecessary bug
workarounds does this permit us to drop?

We shouldn't bump minimum versions of libraries only because
all our supported hosts happen to have something newer.

thanks
-- PMM

