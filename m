Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED83229C8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:56:35 +0100 (CET)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWIr-0001vP-TF
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEWHP-0001Go-AQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:55:04 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEWHN-0000b2-6q
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:55:03 -0500
Received: by mail-ej1-x631.google.com with SMTP id w1so33989885ejf.11
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1xE4fjD2G/iEmolfTWe9jylxc5ltLRuA9lOdyte2Bg=;
 b=RqZhsN4joWZQ+39gKG+qJgY76FZppEGzA9XVpsmzHw4lM+jU9BiOzjr8wCLjPpjwIe
 3Q0Hq3ukfgJDdFzEpo7tPDlW1uR5jw1iXZdJ8pi53XCw6T3jFY11Mw42RXdzniOi35g+
 /uYTrvLiNXFK93L8DAuU6DlQt79uX8if9VjTeXmNgIVauJTxfiETGDv8tKFid9OF8Bbe
 ptV6letZzri0Ock7sdG7UKsZFbpnADtr1NHk9PRp8rJH8jgQiRGS8GNkV4p49ASXF3PN
 ytUqkijXkUQX8/UL1sx10tFZdj1W3kyW1vhrhAJ0Z8hDMMdMeUT+vuVtq+kR1jOppEH/
 hXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1xE4fjD2G/iEmolfTWe9jylxc5ltLRuA9lOdyte2Bg=;
 b=dwFrLnDMf0ceQ7dsrlKC7K0iQFXWsvDHoWVxdCZko6n8ixpt17aqbK6U4mYjk+iW4Z
 DCJd2ozW34mivF/XiVL0TJi/tIKHTFrIjb86qdEHHYHnfbk78AS3ptTlHBedZ8Hk3uWi
 P1UTGGgqyIr6t27d6BHB1AYZjilireyh6f/pOiNSwY6IJ54Kx0SSdzDTCrR++zeY+DpS
 m7oxwRtzAF3dPF4QxrbX9Z988crbpVLn12U9SpYvnCK6VFpYVfgiRj+Y53m1hapHB//S
 A8umo3qW0KllKZncDev9ZZRisr1zp3Vs7fcuLBW68r5u3VrgpVwU7gx1PC+vYXWWL54D
 VpLw==
X-Gm-Message-State: AOAM533GyWfC7XX+v637wOdvM04Iv5eqTzy14NoQK/QpWfLch9df9EX7
 2PjCJzcKcU7gQF7TFAiHP19YM1SaMBoJiXWSD0cTjQ==
X-Google-Smtp-Source: ABdhPJwwwKm+voJrif77+AndyVtNfIxkcxApk18hqFXt+IMwbg2rzdLjU3QE25ccmk857tTGwMR8FRIMBkpWTX2R1zo=
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr22752178ejb.482.1614081299067; 
 Tue, 23 Feb 2021 03:54:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
 <20210222154341.0992238d@bahia.lan>
 <CAFEAcA8x6GnfaHtfTLtEMiM1Xm9K7dhsMEpFjf2MFYe7T1jF4w@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
In-Reply-To: <20210223123943.06d23a56@bahia.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 11:54:47 +0000
Message-ID: <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 11:39, Greg Kurz <groug@kaod.org> wrote:
>
> On Tue, 23 Feb 2021 11:09:05 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Mon, 22 Feb 2021 at 14:43, Greg Kurz <groug@kaod.org> wrote:
> > > My understanding is that users must be "maintainer" to edit other's
> > > patches. Only three 'maintainers' are currently listed at ozlabs for
> > > QEMU:
> > >
> > > https://patchwork.ozlabs.org/api/1.0/projects/14/
> > >
> > > We had a discussion about that a few months back with Christian Schoenebeck
> > > (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
> > > quite know how to go further because of lack of documentation, but I'd be
> > > glad to experiment the full patchwork experience if someone knows how to
> > > do it :-)
> >
> > If people want to try that kind of thing out I'm happy to try
> > to tweak their permissions on the patchwork instance.
> >
>
> Please do for me then. My name is groug :)

Hmm. Having looked through the UI and docs I can't figure
out how to do that (or even if 'maintainer' permission is
sufficient to add other maintainers; maybe one has to ask the
patchwork instance admins to do that?). If you can tell me what
I need to do to add you to the maintainer list for QEMU I'll do it :-)

-- PMM

