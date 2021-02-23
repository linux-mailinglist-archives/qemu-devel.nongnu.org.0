Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E062732291F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:57:17 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVNU-00082K-VO
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVMR-0007BN-Na
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:56:12 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEVMP-0007ak-14
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:56:11 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p2so25293371edm.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 02:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k6EwmYR/Ib3u+Afuj23IoonGlR4JCjhe1q0QCVT6eyo=;
 b=xW33N0BOh/4ntftPAlbO2JBjxCfW9RHeee5FS94E5paAvUuRo6QUhi89YmEbtCt0J5
 D+pEeXH5idVkBZUcVgRJqrl1WRiUFkfS84lA3nrPB8mPAtmUxHWK294a95leVvpGARzB
 qm+U/QtU3FS1hPhvA7WEd6zoD7yke7xhByiBf7R4lb9Zgh2sJtl2VESJ+2VcradKEMh+
 FfcjTCram8MjcCXLTEzpYSupLt7CEGtXzRF8pElwqL/TDcJzDPLLpUFoeA638S785R/5
 XevtV8NdKkauRk8p++RnH91Q0+mOqVlQpAnkcYFR9unD2W6MJoY0GeH3rQnQylZWJa8a
 kwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k6EwmYR/Ib3u+Afuj23IoonGlR4JCjhe1q0QCVT6eyo=;
 b=R7vv140JXXJYzrmJ7wWvzU+C4zhcKzFQSbo+3U6r4Pq8FdOCjxPd25CmkxSjZ6UCDA
 eooaJdg7IpMLkrwtXVAN7rgmkzLD9x50kxg8Eh8OnR51G8ZvvkWUOMUutH1MbJmUwgGW
 kRJFfu5TV6Rt6OW3jW9WQE/15hgfrDzA/jpSepiDoLT/HmaalbqgELflgV5H2lm3qfQC
 kpxIiJofCr2yOGd4O3+IV36S6W91q0EAtkXWaLaGezK5LJ2SWTsfyBpLO/qYz2c7zpYS
 Z/abXuyQ751Ds8tvjwWsmJhr7Vo1A6qS/dUQpSWwoWSySp3zZemyvzIRZjgV9PIdWRYb
 5Csg==
X-Gm-Message-State: AOAM5321ozbxhr5/jh5qCFtXr3SBMZNEUrsWBFE3MQwz3xsjyedZh6iw
 Xmnz80ogphvW4xPvDSZKL/RMxcYpaOdn/VZVSpp7Tg==
X-Google-Smtp-Source: ABdhPJzg9AMc8NT10UhLIeV7OwHrmCIPy/h0gZrYJUs3yc/r6Q5dbrTVodzY68N5iXiBsA419LHs/BNSAGN2HR9bIU4=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr26987957edd.52.1614077767323; 
 Tue, 23 Feb 2021 02:56:07 -0800 (PST)
MIME-Version: 1.0
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
 <CAFEAcA81B_7+aEu3CkOwRGdaEtP8r_HwihuD+oEwYsb4+ZmSUA@mail.gmail.com>
 <87zgzv4108.fsf@linaro.org>
In-Reply-To: <87zgzv4108.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 10:55:56 +0000
Message-ID: <CAFEAcA__36qjhqsA16DHuzDuczcDcrwXXA1pbhxSSNvgxc205A@mail.gmail.com>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 08:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 22 Feb 2021 at 19:53, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >> It certainly is by design. The comment for the helper states:
> >>
> >>   /*
> >>    * The following additional queries can be run on the hwaddr structu=
re
> >>    * to return information about it. For non-IO accesses the device
> >>    * offset will be into the appropriate block of RAM.
> >>    */
> >
> > That sounds like we're exposing ram_addrs to the plugin. Are we?
> > I'm not sure that's a good idea, as they're not a guest-relevant
> > construct.
>
> We currently expose qemu_ram_addr_from_host for RAM blocks. Are you
> saying we should translate that to the direct physical address mapping?
> If we do that for RAM should we be doing the same for IO addresses

This is not a fully-thought-through position, but as a general
thing I feel that the plugin API should be exposing as far as
possible concepts that relate to the guest program, not concepts
that relate to QEMU's internal implementation. One of the issues
with the -d logging is that it's very much "provide information
that's easy for QEMU to provide", and this confuses people who
just want to debug their guest. We can reasonably expect users to
understand concepts like "physical address", but it's less nice
to need them to understand "QEMU models guest RAM as a bunch of
blocks with a 'ram address' which is an offset into the stack
of blocks, and this isn't the same thing as any guest address".
It also constrains our ability to change the QEMU implementation
later if we let implementation details leak out via the plugin API.

thanks
-- PMM

