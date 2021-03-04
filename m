Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112D32D4C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:03:01 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoZA-0006Jq-8h
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHoWC-0005NQ-Uy
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:59:56 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHoWA-0002CP-WB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:59:56 -0500
Received: by mail-lf1-x133.google.com with SMTP id z11so43275881lfb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7DrYmXX3Rqu29jpA9dYVzoFT46beyYj4E0Cb+wrr4mg=;
 b=cYI1J7E233DcMw/zE7f+8rW8bGPWTXwiY4Sq5X77tYU97SaT127kI6O69yEkLFAjPx
 yIpIPj3y2bu6VVLxfkC3WaXq++mpw4vVe1Qsx0gC9Bxzo5K4c6QWHEY2fU8LRsUNwYzt
 ABE43cR6rIXB6LNm3ju1whMH1I9Kj38HyMHlZXjo/aQ2LZ9wwYcRviz4dy668cAXK6en
 y4iM4lXTBqql0HZ5RyAZ91lXlSuDNfray63wWk+M/y0BflcoUFLM+AhB7XfGssUiNsNL
 6QjIRnMtzz7MKtMxQ0deh3TvIs+8Wiat75+0j2yN2fagWQmDX4Z0sQruXZkfH0yp+DsI
 P9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7DrYmXX3Rqu29jpA9dYVzoFT46beyYj4E0Cb+wrr4mg=;
 b=mPAzP9AxWGE09nZ39LXJfWDPfzR4L3NIjXxk81FZ7rwQ0ITW3WCpuv8HhNXokPpnid
 l9kjad1sYWMg7rg8BwEiF35+1xlNiLclCzKt2UStXTDdXvPtpOZ1D+XeGdvYNIArH0t/
 c7tkwDjZaC6P4Z/m29y5gCDHG4hjcf0zBTQmzN48ayJTE2+yELjcBRzxCNmjBqTSLU8l
 ma/sUcomM8QyENL1KgzozwFht1wEla3iQRzJzHaeH/DaxlGg8UDFcuYgB6YgeZApPyH3
 QOUTKGW5mNx1nvrxiVDeXWBhO3pSf/yylncevBQoyhXvPMC4AyPCa6dqc2+a6JT8AnrW
 bPuQ==
X-Gm-Message-State: AOAM533k8hkptT1DjXgIZaYWdkzEjk8yTBrfdkAAp8XpfgMjbbD54R5m
 JrNdkws4Vh9a85DI7j4xohROeiQz8RPh/HGzprLDdw==
X-Google-Smtp-Source: ABdhPJzUfmWcCbWewuhBRptlLcRc8iJUtfojPj+H0pYQs0o1AKl7Wp2zybZ9H+e58VJwzrmJsGUVV2IevPRqmKO6kDE=
X-Received: by 2002:a19:8b45:: with SMTP id n66mr2375583lfd.252.1614866392445; 
 Thu, 04 Mar 2021 05:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20210228222314.304787-1-f4bug@amsat.org>
 <8735xbghho.fsf@linaro.org>
In-Reply-To: <8735xbghho.fsf@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Thu, 4 Mar 2021 13:59:40 +0000
Message-ID: <CAHDbmO1wX74Gobmc1LCg6devmfm4iQPRZGwbGoEa8_418N3_yQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x133.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I of course meant 1 and 4 (skipping the gitlab bits)

On Thu, 4 Mar 2021 at 13:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > Hi,
> >
> > This series is a rework of the 'Add Dockerfile for hexagon' patch
> > from Alessandro/Brian that Taylor sent in v8:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg780330.html
> > but adapted to mainstream.
>
> Queued patches 1 and 2 to testing/next, thanks.
>
> >
> > Gitlab shared runner are usually capped to 2/4 cores and timeout
> > after 2h30 to 3h. We need a beefy custom runner to get the image
> > built and stored in the registry. For now the image is added in
> > manual mode, hopping we'll have magic runners added some day to
> > build the image, then developers can directly pull it from the
> > registry.
> >
> > Alessandro Di Federico (2):
> >   docker: Add Hexagon image
> >   tests/tcg: Use Hexagon Docker image
> >
> > Philippe Mathieu-Daud=3DC3=3DA9 (2):
> >   gitlab-ci: Pass optional EXTRA_FILES when building docker images
> >   gitlab-ci: Build Hexagon cross-toolchain
> >
> >  .gitlab-ci.d/containers.yml                   |  11 ++
> >  tests/docker/Makefile.include                 |   2 +
> >  .../dockerfiles/debian-hexagon-cross.docker   |  23 +++
> >  .../build-toolchain.sh                        | 141 ++++++++++++++++++
> >  tests/tcg/configure.sh                        |   4 +
> >  5 files changed, 181 insertions(+)
> >  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docke=
r
> >  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docke=
r.d/bu=3D
> > ild-toolchain.sh
> >
> > --=3D20
> > 2.26.2
>
>
> --
> Alex Benn=C3=A9e



--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

