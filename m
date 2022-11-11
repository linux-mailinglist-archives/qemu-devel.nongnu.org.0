Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D772A62542F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNyt-0002Ui-UB; Fri, 11 Nov 2022 01:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otNyL-0002Ji-QY
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:57:07 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otNyJ-0004i1-QW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:57:05 -0500
Received: by mail-il1-x132.google.com with SMTP id o13so2157556ilc.7
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dwxPKaTKuqFCxlTt0EAmk64pqWsofw6qrkLiqHT60S8=;
 b=qChbM/esLFzbrLe5hZCuw3Xiw+x6Q4lMtKQPdUL10ovGh7kJPKPzC1td2kpkHawOpq
 V/XHLoOsgHUy1064VPhApuVVewAhQ6I1qlBHAfkZRDQ5QMmLPTCeX9fomITg5ayxrw8E
 rshnXZg/G4p0I+pKLaY3zRrhuAuO+ip2ne4c9QqNy/c3TcacuZM+q/ujv0bLwhqx3Aa6
 tOoCiRvDKuTvjUBP3ZpZoVp9IxY/zGA26eAVmw7NBCFOwxZCkNzWge993P/sVuD/KZoS
 4MMWAoUE2SAsgSSDSixaU8trY18TdgIVIIblR2WBxVAxqv2kJpNSNPtn85rOXKRLfsE1
 nEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dwxPKaTKuqFCxlTt0EAmk64pqWsofw6qrkLiqHT60S8=;
 b=WXQQeM6O24v6Zn9krjwI3IYc61Ns49CKi+hGk/RTwWszW7Bb6dcDhwqSPzTck6z/NE
 cC/mSYr5/ewZHw9iHqxSGvBH3B0CYoGD89ptxIZszBRJcF/sU/6/i4yoLRx5PPzZEKgT
 YCC+7pQBmnNg0KXMSEzKvpJsJZTkyfdOpk1LLPdA+87eIykcmInWvQNAiTC6ig1EPVlx
 yDJA40fWHDjXjYyhjW9/iEOBU2C/A2xKWByHwZnYjjTOt4QFhNGWVeKWmV/XzlfyuG9X
 BfO3egdbtVzWoanFL6qS7KxUsSsiRNtg3M6bhDDLL8S/yCEQ2C+K12yflzxJQo/umJcy
 GNBA==
X-Gm-Message-State: ANoB5pmSR05C/mwPo8M4QG9Mni1Ehc0NBoAbg1Y1FYAa1o1+BOi0tqMY
 MREjBpVI6fVZG8lBLsiyiGztYnGedtMMOPLZGofsNQ==
X-Google-Smtp-Source: AA0mqf4ChH7QtdIMlwl+RHpzLpPrv1nZa5fw5gzb6V615BmBjwafLZcdbBKZpPoOH+XLBPZS7FN0I1sEOMHcXD2k3vw=
X-Received: by 2002:a92:c745:0:b0:2f9:8a1e:914b with SMTP id
 y5-20020a92c745000000b002f98a1e914bmr453814ilp.259.1668149822442; Thu, 10 Nov
 2022 22:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20221110190825.879620-1-sw@weilnetz.de>
 <CAARzgwwcXhnUJe0gHLAf7Vb6oGUQ+cGRp82T9qdD3adoWCrnrA@mail.gmail.com>
In-Reply-To: <CAARzgwwcXhnUJe0gHLAf7Vb6oGUQ+cGRp82T9qdD3adoWCrnrA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 12:26:51 +0530
Message-ID: <CAARzgwzYLccKdJ6tXE3A5bzHNesAo7+8iy6D7BvmitX7dTL8bg@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 10:59 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Fri, Nov 11, 2022 at 12:38 AM Stefan Weil <sw@weilnetz.de> wrote:
> >
> > Those typos are in files which are used to generate the QEMU manual.
> >
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> For acpi-bits.rst,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>
> > ---
> >
> > I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
> >
> > Stefan
> >
> >  docs/devel/acpi-bits.rst       | 2 +-
> >  docs/system/devices/can.rst    | 2 +-
> >  hw/scsi/esp.c                  | 6 +++---
> >  include/exec/memory.h          | 6 +++---
> >  qapi/virtio.json               | 4 ++--
> >  qemu-options.hx                | 6 +++---
> >  tests/qtest/libqos/qgraph.h    | 2 +-
> >  tests/qtest/libqos/virtio-9p.c | 2 +-
> >  8 files changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> > index c9564d871a..5e22be8ef6 100644
> > --- a/docs/devel/acpi-bits.rst
> > +++ b/docs/devel/acpi-bits.rst
> > @@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
> >
> >     (a) They are python2.7 based scripts and not python 3 scripts.
> >     (b) They are run from within the bios bits VM and is not subjected to QEMU
> > -       build/test python script maintainance and dependency resolutions.
> > +       build/test python script maintenance and dependency resolutions.
> >     (c) They need not be loaded by avocado framework when running tests.

btw, if we are going to fix this doc file for typo before the release,
may I also suggest another trivial fix?

https://gitlab.com/anisinha/qemu/-/commit/4bd915a7390d799b332c11f23b6d5982efac5dac#9dedb1d2dec506845c6145696c561451a8b4b659_44_44

(removal of the reference to README from the doc).

