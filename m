Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A13402BD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:09:04 +0100 (CET)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpaR-0003lV-Na
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpZ5-0002Xo-88
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:07:39 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpZ1-0008NB-2f
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:07:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id bx7so5857465edb.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FdJ7muPh4aBnb5G9bYd65bgMOnObSvFKCxPxTKFLI0=;
 b=OU+u5M/1p5XXPNXCWJ1TWyxeGCaFh6cDXqVeSQIxRcFzvh0QEpOvUGf0XLseCARubB
 ZMLKjkiAK9dG5sepvRCpFCKOzsi+qDWvh9NXm4THTJU39vAaO+17JUbVjswQ1T6VMtj4
 iTTfVkl5ewbNw1ble3aey21P8WJ7Of+FbqFmkB6UOLeDK5wTHJCCWfgN/dclIQxOOzwC
 M2JkqjEdhB8gStXq4NcOIjm925K0vNRQ6eyvhej6mQrJsoxou9i59i/47wiiXrNGmFfl
 cBpBWbMyylTNomCb32Cx1eDVhptYWr/XlGnYMgMw6Q281TfLuFNm0BclQM6VKYq77CWm
 gGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FdJ7muPh4aBnb5G9bYd65bgMOnObSvFKCxPxTKFLI0=;
 b=j11EoIVw7ln8NJAW7YeXXZt3UZfi3iuz3nI5BJkIndKTAo88Aui2UXGCY2H23PHxQi
 lWAfbwPl/I50w3PnfMDyUzWTMnwWVyc8xK/1V2o9xvXbs2bjhyymnGq1W2VSEHXjw3yZ
 Mzuxu8wbISddhnvCG2sutov0HmQ+1xymjdM485abkM2PHcM4P4gPFjg/rSNL14FnkKrR
 cOaQPnW9tYLrMwLh8vypetlF/jC+G0iBIPahD5JvQdbQ4lLkWkLjiOmKF6Aed0cUAigf
 NbDBZSsw2f8ctjEtgFKm598nQBynAheO3OHN+POlJOaBo3LbtmuWu+hs5sHw3wWvduv9
 679w==
X-Gm-Message-State: AOAM531rnoO0sAN3t8CVqNozmhLBGDKCgqAcpk+WW+YPZzWm8eSDe/kG
 9KGU4balGt3gKZ69HhYCEZfAI8kkb5ucIWcXuooyMg==
X-Google-Smtp-Source: ABdhPJwaaJRByFKfOpuwjJo/6AKstn66SrrRT5Tot2YEcgPSj1azwesLhPMLcR3IKqyjQcYqNBWFKQalNxeJtzQKjhk=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr1600091edu.52.1616062049323; 
 Thu, 18 Mar 2021 03:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_cZYF9u8RfW5mUY7TgOLsRYh1sN7oioztfSV8_990peg@mail.gmail.com>
 <6f3cd467-5013-a372-28f7-f1ca0b1f1d03@redhat.com>
In-Reply-To: <6f3cd467-5013-a372-28f7-f1ca0b1f1d03@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 10:07:05 +0000
Message-ID: <CAFEAcA9vqEgoYzaCg0_GNyqjm5LA4-9+9p5XvBfGb1NLYpTCwQ@mail.gmail.com>
Subject: Re: iotests failing on gitlab CI check-system-fedora job
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 23:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 17/03/21 23:23, Peter Maydell wrote:
> > The check-system-fedora job in the gitlab CI seems to have
> > started reliably failing on iotests 040 041 127 256 267:
> >   https://gitlab.com/qemu-project/qemu/-/jobs/1106977551
> >
> > Could somebody have a look at what's happening, please?
> > (This is probably a regression that's got into master because
> > I stopped using "did gitlab CI pass" as a gate because gitlab
> > was running massively too slowly to be usable for that.)
>
> It's caused by adding virtio devices to the m68k target.  Probably it
> can be fixed by moving i386-softmmu to Fedora and m68k-softmmu to Debian.

Why are the iotests not specifying what machine type they run
on if they care about the machine type ?

thanks
-- PMM

