Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D427A41E9BB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:40:59 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWF2H-0001NP-9v
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWF0D-0008BT-VG
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:38:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWF0B-00037W-5N
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:38:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id a18so2416654wru.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yZ66l2QrH5ZiOnf5A72YJoQXai+xIQh218TZs6Uwy/I=;
 b=w8kGMrS2UIov33UsuaSQRL/gxS7X+R0KBBA17BOjFjey7WyS8+wFlF0iMz4Ls4rZcg
 OZBlR+CVOnqDTRdxtyKWsAPD7zcS8bICtJy9u5N6U0u/6V2oM0KNgCfmDuTem6AyAVYj
 5PRgGwILysjIZwyQG4i2PHU5xPRGNH0imFkeepjkWuA5g2IhixXIZvO7ArgQjLui+3PP
 Anxw7zIp8VZDu+D9F43r/fosUUSOHxH/zPhyKpMUYd/3HLNuFE830ipwsqUkYXbwEooB
 Y5cQBW9IXPXFl3sZ1WqMTbiSArJf5it8yKH/U0ncU3CtRTYLj/i4m7va4FCqSaM1X6O5
 ZgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yZ66l2QrH5ZiOnf5A72YJoQXai+xIQh218TZs6Uwy/I=;
 b=kVTKs90N5NXoIh8bed60L3KXay5D1XE5PpIZvZMRtfUDkc0anF9aUc4vukYK1WRvl6
 Feg/rIRDj49o1XpqQl4a5Mk71XT0DBJY9G5R83rN0chqGQlODPrXXB/YTLH+KkPP+12n
 UOTMSnG60b4svEjfT/HuC6hQ7TgORuoBHoUnEUFl4Z1c+UyTh+ciwT3Sd5nWcfc5cH/b
 EY/KOiJykBH86ceuvTdzmCSfNMOvctELO/CWVf2sjAAz4xlnWjDK15Bu3CG3yvyUQMXW
 zPwPpjNJLna1XOMrVPwlh+KpMFjKxkBH7P0KjHuzv4B9wV9yt53qutWaj9uAQVEVESQp
 3seA==
X-Gm-Message-State: AOAM530rGvcdDA+FahEe3WoxpnyXVmWIndmPr5DpxgEoLu6AwpERtOq4
 O9s8JCS7Nb0ztGdq5q3nNVvGO6hlQzWiZGkQUyZLJg==
X-Google-Smtp-Source: ABdhPJyiIa0mVOafbztnyHnmuUjnXxHw2pI7jJsgBSLidHmKSVwzEWn2hGBwE88c3NdyzNcekYnpmYM8Oh575f2OYcY=
X-Received: by 2002:adf:ab02:: with SMTP id q2mr441130wrc.263.1633081125264;
 Fri, 01 Oct 2021 02:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
In-Reply-To: <YVbQERWD9fY0kxxW@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:37:51 +0100
Message-ID: <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> > On 27/08/2021 14.09, Thomas Huth wrote:
> > > The dtc submodule is currently pointing to non-release commit. It's n=
icer
> > > if submodules point to release versions instead and since dtc 1.6.1 i=
s
> > > available now, let's update to that version.

> Most of our supported platforms don't have version 1.6.1 available.
>
> As a general goal IMHO we should be seeking to eliminate bundling of
> 3rd party modules that are commonly available in distros. We've
> carried dtc for a hell of a long time, and if we keep updating our
> submodule we'll keep relyin on new features, and never be able to
> drop it because it will always be newer than what's in the distros.
>
> So personally I think we should never again update dtc and capstone
> modules. If we want to take adbantage of new features, then do that
> through conditional compilation, as we do for any of the other 3rd
> party libraries consumed.

I agree in general, but (per the commit message here) our dtc
submodule is currently pointing at some random not-a-release
commit in upstream dtc. We should at least move forward to
whatever the next released dtc after that is, before we say
"no more dtc updates".

-- PMM

