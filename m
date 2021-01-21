Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743042FF61E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:42:06 +0100 (CET)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gmL-0000PE-17
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2gkk-0008JJ-R4
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:40:28 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:32878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2gke-0004yT-An
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:40:26 -0500
Received: by mail-ed1-x536.google.com with SMTP id c6so4131619ede.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gfUtRFYTM5/q60jOqaVgL3bl5JqrWtB42261p0EFHvI=;
 b=cZ2EXjMFFkcnyPWeIQbceoMmtSJ2rJcjG/AaaPq+a8jIbIsQGMJyE+ZQ7d02vt04Fw
 90a4P0GWkH0IgMqmiODy3gaXBuVeIrl4GxQcr+t88K49CM425tf1lXR2I4EeONJom46P
 GvyWWlqcOZrRw9924pKlG4xPGvAsEUCXjaEZIKcuY/kcTV4pfP9MwDnFQ6s8RdIy8z1B
 dU3Jy4DOylBVEhAOVOg+CfW+LJYlAhG94OjGT1pfhXoQfN69Tzek83rYCOxVIHAAetro
 Owa8Sk5ZFlUAXDIM3QaPdiTBj6fQrimqIEE6ZobGkTpkbYxj1gHFCq1GwpkjR0gg5Dlt
 vUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gfUtRFYTM5/q60jOqaVgL3bl5JqrWtB42261p0EFHvI=;
 b=n9SWPNCjcOI4pZZMdjfYUHZ9uCd5IgiGkIqvDZLFFwBZAyQvu3Xk2LBtzqIt/GPD1y
 K4TBUcOt7FmZHdpRPEiMgDsb9TmZ0zi9S0dBibWPhy7JyszRcEyMGctUGitt5ebWgFpw
 uPpqu7NLhqVqGquZ5clKrnbqbjaOimOCbHgq0eX5/X8IiUNDfuWGkal7mdrBwgCJ2RIH
 kuQfG+WPRcPMeq+uarG9yna5+mObrQDWBmKmvA1RaczEY4+b+F6wwdWbuTUs2W3R4d4R
 aZjJfDSueLcUIMoVB3hrPaIQTB6HbyNbp9OrpAd/OYnjZCHAjKjJ6kjNW/rPDOGdL1FX
 p1Cg==
X-Gm-Message-State: AOAM531BXGovI2QEU2fIt4Gt4d7YfEpd0NCuxS5RcLda1xwFbXDCfnds
 74Q/cUMYeTjkXtsW61prM2ew28bKhn+6IjbEQn4=
X-Google-Smtp-Source: ABdhPJxe2YDoAPbdvu4i1eye33NJcSGBVbZTjI2ypVXfk77TCvzrpFWKjVAR5jkGRR4DkGjsa5pZM4Vdd14IML1aaaE=
X-Received: by 2002:a05:6402:6c4:: with SMTP id
 n4mr745976edy.257.1611261618161; 
 Thu, 21 Jan 2021 12:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121082314.458600-1-dje@google.com>
 <CAJ+F1CJ5SB2RHuR6KzoA8K0Tdpeam+=LdSRbax6W6WQ+18qqUA@mail.gmail.com>
 <CADPb22R9c+e1i-3CYWOc=U9Yr+F=86=T3sZ2p3jBNrn9m2kwGg@mail.gmail.com>
In-Reply-To: <CADPb22R9c+e1i-3CYWOc=U9Yr+F=86=T3sZ2p3jBNrn9m2kwGg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 22 Jan 2021 00:40:06 +0400
Message-ID: <CAJ+F1CKrzGunuhDRfNfei4PaaVuHDUYyTS2QNJ8+-wFvOSEU4w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add ipv6 hostfwd support
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug

On Fri, Jan 22, 2021 at 12:29 AM Doug Evans <dje@google.com> wrote:
>
> On Thu, Jan 21, 2021 at 1:41 AM Marc-Andr=C3=A9 Lureau <marcandre.lureau@=
gmail.com> wrote:
>>
>> Hi Doug,
>>
>> On Thu, Jan 21, 2021 at 12:24 PM dje--- via <qemu-devel@nongnu.org> wrot=
e:
>> >
>> > Hi. This patchset takes the original patch from Maxim,
>> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
>> > and updates it.
>> >
>> > The first patch is the slirp additions, the second patch adds the u/i.
>>
>> libslirp is maintained on gitlab. Can you open a merge request?
>> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests
>>
>> thanks
>
>
>
> Hi. Sure, no problem.
> I wasn't sure what the procedure is but figured it would come out during =
the review.
> How does review of libslirp patches work?

We do the reviews on the gitlab MR (of the individual patches).

> I gather Samuel is a libslirp maintainer so I'm guessing it just needs to=
 be approved here (after appropriate review) and then afterwards I should f=
ile the merge request?

Any of the libslirp maintainer can merge after reviews (including me).

Then anybody can propose a patch to update libslirp in qemu, get
reviews/comments, and Samuel can send the pull request. Sometimes
someone else sends it.

Note that libslirp is packaged in a number of distributions these days
(https://repology.org/project/libslirp/versions), and that qemu may
link to it depending on how it is built.

