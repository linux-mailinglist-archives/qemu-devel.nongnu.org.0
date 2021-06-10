Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA53A2E27
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:28:20 +0200 (CEST)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLfP-0004vK-6Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLdW-0002Uv-6L
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:26:22 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLdT-0004tP-U9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:26:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id g8so44542641ejx.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=81SMQU+t0cJZ1cQ8798i8DpIPvrCW27Vrxe7wfzWkMo=;
 b=PHAd2CLnh3mLSIcyUEWKJh3G8ublAVD8hdoyPEIrfzBXZrBgNCJss07uBr+NFQoX8m
 Mq1TzF00O6efmR8+Tz7ez7ISutdU58CTEvNTIBGTHTOhmvkj3XF82oamXSOjd0VEGS6u
 CkFRAIVeKSv+B/G6K7891JHZ6ipU+VuNibFqigDSxOMTma58ssJ6o7yLzv8Ez8cQyv5S
 8fvf1DzlV3HD21Vf/aGcx707ey305eof7pOnps252Eby9gBYQhBs+8ebG80e9zwSPA/I
 FOGrC7gOVVaArmI5z022cf6iApy0FWUFV0QW2Q2A9diu8IuIihftrYukDnLYpYB3UOVp
 /9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=81SMQU+t0cJZ1cQ8798i8DpIPvrCW27Vrxe7wfzWkMo=;
 b=Xyec0bhphv/w4j35qalx+mK7OBZ/P9yZTcCD5ruyAIOWwN0MCGuJpPY+L6fhxrtTjF
 zxyTx4lHiUFJAP8lbsARw3VZxpA874U9QPQS+JLRfoQJg6clNaOl+TdZaJztiCpz/WcJ
 W0i2uncPYjPEaWu1JV4dmFnUKnkFUOou5H6kGGQszvITymB1sc8w1qmdRXcFWdgj/jRw
 +SQQ31x0tg5+BnZepaBL8Ob+oouLBUD+HD/p1QjWeWTsFjxG+N0qdOqT8EOSq7UpCB5p
 7ugWWlDIRjB5f6Vf0RU/VCps68+eaBxulVyzxHaMdooNu+Xs8k9pY635gmEnoD0qHNWB
 v3lQ==
X-Gm-Message-State: AOAM5306zIPymNpvPJf4QO3E8Qzb86MJR6dq5Mb35OkTE83FKMyQGZZ+
 VQD47CNlyJ82/Pd600vG37SUaUfL+vbVmJYOxX+e+w==
X-Google-Smtp-Source: ABdhPJyHu3dZC+3iLTzCERGod8IDbvpT/w1e6ILS3mz7jPe4f3Cb6wrCsVIJvzKTAhdanMZwNlCasXf2BFrjGBvTPfg=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr4762519ejy.407.1623335177856; 
 Thu, 10 Jun 2021 07:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
 <87im2liz4x.fsf@linaro.org>
In-Reply-To: <87im2liz4x.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 15:25:44 +0100
Message-ID: <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm told that the Arm C compiler C library always assumes that
> > the "stack base" value is what it should set SP to, so reporting 0
> > for that will break binaries that were built with it.
> >
> > As the TODO comment notes, the "heap base" is a bit of a guess,
> > but putting stackbase at top-of-RAM seems generally sensible.
> >
> > What bug are we trying to fix here?
>
> Having newlib use a value that's wrong and therefor plant it's heap in
> the middle of the loaded code.
>
> > I think one possible implementation that might not be too
> > hard to make work would be:
> >
> >  (1) find the guest physical address of the main machine
> >      RAM (machine->ram). You can do this with flatview_for_each_range()
> >      similar to what rom_ptr_for_as() does. (It might be mapped
> >      more than once, we could just pick the first one.)
>
> Currently this is done by common_semi_find_region_base which pokes
> around get_system_memory()->subregions to find a region containing an
> initialised register pointer.

Yes. I am suggesting we throw that code away, since (a) assuming
any register happens to point in to the main RAM is dubious and
(b) iterating through the subregions of get_system_memory() is
not guaranteed to work either (consider the case where the system
memory is inside a container MR rather than a direct child of the
system memory MR).

> >  (2) find the largest contiguous extent of that RAM which
> >      is not covered by a ROM blob, by iterating through the
> >      ROM blob data. (This sounds like one of those slightly
> >      irritating but entirely tractable algorithms questions :-))
>
> Does that assume that any rom blob (so anything from -kernel, -pflash or
> -generic-loader?) will have also included space for guest data and bss?

Yes; the elf loader code creates rom blobs whose rom->romsize
covers both initialized data from the ELF file and space to
be zeroed.

thanks
-- PMM

