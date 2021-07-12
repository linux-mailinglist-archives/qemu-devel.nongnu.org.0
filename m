Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C423C4650
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 11:42:42 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2sSX-0002aM-8x
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 05:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2sQT-0001mp-Vu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:40:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2sQR-0000XD-Fh
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:40:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id dj21so7192575edb.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13yfotU+8FIjRf2AZAL6cdnBM6kIK5f80OlpfdU1glY=;
 b=BgMIAM52swPfssf7rGMsRbr8RzlQ3CF5Su8ivVZ+5Ex7fd2NV6OZu4P5FPoqzFZiaE
 u0eVdUkCH9tGeNdQ+lEO5nawjyn85k0t+zzBgl39ak/BusxTBOegjYE94wJ3rixrEN9+
 aYUzEVlUjpkGFAbjETOHjXm6HMH4EAPj41c1k6QJivAhAvKJiFbpMhnz5W4W3h+lDv9l
 PT3SDPISVopRf2wiABNEapYzdFPX1pvZ/wax9tH3ruGEyT9rnFwt8wWP89aHRhvMKNsl
 Z1GypveHHB1y7qmkab5cVD0twTgCNGdxX0DXGIRoYrMK/3FIKOXDsxD/K9yLI2NY9eHk
 J6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13yfotU+8FIjRf2AZAL6cdnBM6kIK5f80OlpfdU1glY=;
 b=fEf6rSBPBsIrEVv9bgYvJ9InhaDj1WXMIGTouO+Q+TB3UoIBJgXedmZ5G0WRq/AueT
 YZ2XjSf0KDjpx3WfK1t+yU1OmWcpB5rxPYmnhhVLNnE4CtHVAdkZXJAbyGobZIljaQaV
 zgxMXiTt6Ms8euiP1usEpmQ+1ybCAmGBOK5LbTXqXGKnU/7h7upkPxcIAgl+aKT1MbEb
 LEoCipKgue0mWBFk6jJ/wRyxVekFmSOJ9NJUP3MA2pDzttcfCUHB+6xzwN8NqPkgEX8W
 0VrRSF8nHM2ikjbjzkvArUGLsvRDIMaEWf9X91n9NcrNPr3UxSZ0UcG1H6W2xAvVh5lV
 /c2w==
X-Gm-Message-State: AOAM531zqJcDAXw2ITLMiJ8eC+yDadIc4vXH68UP8yL8oxD5mw9FlZgR
 R7ssjNaUwhUa2rq5w5nhAZ6rQWGDFeYTCrlYZIOyWA==
X-Google-Smtp-Source: ABdhPJwhLBBOheHhwuTDnG6Vj/336sr3tygJM971LtdK52G7hcT4EcZuHucCfGEU1tcwhQDwWIUplJtnyJwPoc99CyI=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr50689831edf.52.1626082829570; 
 Mon, 12 Jul 2021 02:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
 <20210711222033.tb3paw53ayxrkagb@Rk> <20210711225032.smu6kxhqvt3xniwk@Rk>
In-Reply-To: <20210711225032.smu6kxhqvt3xniwk@Rk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 10:39:50 +0100
Message-ID: <CAFEAcA9a-PX_xaFF7AB=1DqUL-Yn3qqSYWmw4uSedeuGhKTaRw@mail.gmail.com>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Coiby Xu <coiby.xu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 11 Jul 2021 at 23:55, Coiby Xu <coiby.xu@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 06:20:33AM +0800, Coiby Xu wrote:
> >On Sun, Jul 11, 2021 at 04:53:51PM +0100, Peter Maydell wrote:
> >>On Sat, 10 Jul 2021 at 14:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>
> >>>I've noticed recently that intermittently 'make check' will hang on
> >>>my aarch32 test system (really an aarch64 box with an aarch32 chroot).
> >>>
> >>>I think from grep that this must be the vhost-user-blk test.
> >>
> >>I've also now seen this on qemu-system-i386 guest x86-64 Linux host:
> >
> >Good to to know that! This makes it much easier for me to debug this
> >issue.
>
> Which i386 image do you use for the guest? Could you share the download
> link? I can't find a suitable i386 qcow2 image. For example, [1] is
> outdated.

I'm just running "make check" on the x86-64 host, which runs tests
on qemu-system-i386 (assuming you built i386 targets).

-- PMM

