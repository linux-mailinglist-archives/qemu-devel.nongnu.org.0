Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951EF5AEE4E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:03:32 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVa6t-0001Wj-BE
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVYpU-000540-0G
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:41:31 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:39573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oVYpS-0002Qt-8H
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:41:27 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3376851fe13so96757037b3.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=vnAejslANxdZfpNpsgLqIMJJkSnk+410P40vhD4I7DA=;
 b=Z+WA0wuXxTk6mrwWe7Gvg1mJ5JdQPShaQ7k9fPx91wba9ZgFCprm+KBK5dy/5D8fQS
 LWe054QxnE1a6df1QQc9f7/ANnJsB2+KxhK5RWyYPpXldtPF+xstfXy/MxG415sEk1j8
 Dz37PrnkOiwrldf4OKZhq8mYkvE4FB7qG7mGvpD/jTMZrzgSvEOu7lawiQ/ANYg7QHCV
 ju3gdIpXEXwqaRnZpvvBTqkG9+ymoaWAl/LrfLaKoPBbUsyqESeF6o8o234LmDK5jdWB
 XoIFm74PrJ2+1c+PrJSIkCj2wDQCVGJOVh0SsvE490lSktG145Mo/gwBd6sREdvSLeLM
 1DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vnAejslANxdZfpNpsgLqIMJJkSnk+410P40vhD4I7DA=;
 b=KD+ZEl8IdX6znZJnUooCaGmloXxF/HNK1lhBrs4ZaO8vL20ttV1OjCJfxOscrpPlvl
 9oHHxzjxibKTCc+fcR2nNI9puw5zjAK3jxXarJxhdjXfJdyZR/eJ93jjTxKYSFnPR3y3
 ezPsny3FO3CgqjVdWqc60UnvtEtd+wgv84Zi+TGwJxpC3QJ2O/UBJLYLhlO2uVkvpFT+
 N6QXP2EFXo1adbQ0j6joKfLMYOsOT4Cb/J9bNLiE9Bw4bCDfBztw3gnuj89IfcQoja4J
 In4fdQ91o1mN9LSVUK8fhDKNNzPDFDevRM3zQKBVZNlK7tuF1T84lTHkI9OZ0L3nun+o
 o+dA==
X-Gm-Message-State: ACgBeo3KReRE1UNKB0CPWAHc4rKd/nQMrS9mMtAmJs4BkuyAyNrPryGW
 J2+X4WV180/6zy+c2saeX2eq+ovCUJHlUl618Y20mA==
X-Google-Smtp-Source: AA6agR4WvwEy7VjfB5PVil0jsnkOTC2CZS/nZYSEv41o9+DGdZtWZIdu6IZ0MIcVBjQBiPy9OpEz/rsA/A4ywzYhCrA=
X-Received: by 2002:a81:1615:0:b0:340:d343:7c11 with SMTP id
 21-20020a811615000000b00340d3437c11mr39122250yww.257.1662471685047; Tue, 06
 Sep 2022 06:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
 <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
 <Yxb86Fz8XVW3uW1p@redhat.com>
In-Reply-To: <Yxb86Fz8XVW3uW1p@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Sep 2022 14:41:13 +0100
Message-ID: <CAFEAcA8DZZe2XKntbrg2mOrmWmepPAVvgBKTvO9vMAE2tVq2hg@mail.gmail.com>
Subject: Re: sphinx-build is really slow, any way to improve that?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 6 Sept 2022 at 08:55, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Sep 05, 2022 at 10:21:55PM +0100, Peter Maydell wrote:
> > On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
> > > when I build qemu, there is a lot of time spent at the end of the bui=
ld where one cpu goes 100% on sphinx-build.
> > >
> > > Is there some way to parallelize that? It seems it is the current bot=
tleneck for rebuilds for me..
> >
> > It's a big fat python program, so I suspect not, but
> > maybe I'm wrong.
>
> It annoys me too and I've had a look at what it is doing in the past and
> failed to find an obvious way to improve it. I fear this could be an
> inherant limitation of the way we use sphinx to build the docs as a
> complete manual, as compared to say treating each docs source file as
> a distinct standalone web page.

IIRC sphinx really really wants to process the whole document tree
in one go. You can see this in the way that for example the
HTML build process creates HTML files for the top-level rst
files that are supposed to be only for the manpage -- it will
suck in and process everything, not just the files reachable
via whatever top level file you point it at.

-- PMM

