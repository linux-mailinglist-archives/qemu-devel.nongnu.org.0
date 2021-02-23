Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E63228D2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:28:00 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUv9-00069u-5C
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEUrk-0003M0-Qn; Tue, 23 Feb 2021 05:24:29 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEUrd-0001m3-GF; Tue, 23 Feb 2021 05:24:28 -0500
Received: by mail-yb1-xb31.google.com with SMTP id u75so15929477ybi.10;
 Tue, 23 Feb 2021 02:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucuPs1EFrTWkrcSftLOOH0A/C7Bd9UVGmjlvXJpdG9k=;
 b=OtLj21otqdt6tM/o4Kn43BNoUe3C0HJ5LdGr48YE3t7zBMTXwQzwCvAobM2G6Ps8on
 JwalP/g9JbDKC6H3epqCr2K5+KxjsPCf63HDqem1S6xuR4EZ0unurmgGGVLBz1zRqYfo
 xB6VSDr4q4WSC7WpXoIWha7IvWvYQ5nO63hITDpRB14Mt6F/VLHjfk5l9UPVO1yeufbK
 Yrv7wbttLRpedeMR6YoKqb4dcf5m0QWkIL/5xKTZSCG2pZrgwcoIAXL1izue1MNB/SIx
 hDZ/0Krkq/INH6aZEbnu1QpV6KONLrpmQ3BSxXs2EUPIsHj2VY9NsBCL/gVF6/YcMr5+
 ddJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucuPs1EFrTWkrcSftLOOH0A/C7Bd9UVGmjlvXJpdG9k=;
 b=Ta2OUpHjdNcwKM6qWMbZQVjIsOSOG9S6HKGSxSHqu1WEpukutq4nnukgORpiRCD3L2
 gIqvpZnGtAwifLScxEE/wyeGr6ol6FHWvSnXk5w3YoX853vhTEIbN/MZx023+Heb1ZOf
 sSTFVyIzvtuE5sEsohb+nQVpUOaBvCt4xXxxWTLu2H6F8JKn+bCkk3GR8es1DEeWnE4I
 o6V0AN7z9steJEeUUN1kg2+w3/t9aXoVriF2fiCAh2JAPphAk9g5c61SYrVY3esT9iYV
 H3wUR2DH7bJw6AsNrof7s06KcTXJfbB6VLyEjE/qx8kWEcoUt9AW/SG2y4vPEis4wBG7
 fgSQ==
X-Gm-Message-State: AOAM530F7B9flQYbXmI74Eo7H28Y/NMmo7c8p3S4LmHwB62Tx/YLknW7
 WmaiIKMXDOsjPOFv9gXgrA1m2X4b7JVdTlGHgkk=
X-Google-Smtp-Source: ABdhPJyQGDRTSOap4wZEwpEUXCo3P46OEaOzWRYOnLeU57BN6uXD0fi3wXNxa4K0dw7bHSeKcpPf6wmhvvRx8o4HOCw=
X-Received: by 2002:a25:8712:: with SMTP id a18mr38901184ybl.306.1614075858970; 
 Tue, 23 Feb 2021 02:24:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <99af17f9-10cf-7c9b-8222-2318b464f5b0@redhat.com>
 <20210222082137.1b3f8b3b@bahia.lan>
 <CAFEAcA8oqPR=PbqWaoBGfDKWik6Jv5TuE-PZqTc0W3TsoktvsA@mail.gmail.com>
 <20210222154341.0992238d@bahia.lan>
 <CAEUhbmV+qUWtw0Cksrp9dwO2vPnCD8B7Se88a3K_dn3FENnLLQ@mail.gmail.com>
 <20210223105510.0687d0b6@bahia.lan>
In-Reply-To: <20210223105510.0687d0b6@bahia.lan>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Feb 2021 18:24:07 +0800
Message-ID: <CAEUhbmWUMaf=vqKibc0fnHR+BJVyO2-mvg+rPXPdVSPGsCHUag@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Tue, 23 Feb 2021 14:57:21 +0800
> Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > On Mon, Feb 22, 2021 at 10:43 PM Greg Kurz <groug@kaod.org> wrote:
> > >
> > > On Mon, 22 Feb 2021 13:59:34 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > > On Mon, 22 Feb 2021 at 07:21, Greg Kurz <groug@kaod.org> wrote:
> > > > >
> > > > > On Fri, 19 Feb 2021 17:51:02 +0100
> > > > > Thomas Huth <thuth@redhat.com> wrote:
> > > > >
> > > > > > On 19/02/2021 17.26, Peter Maydell wrote:
> > > > > > > Does anybody use the ozlabs patchwork install for QEMU patches,
> > > > > > > either occasionally or on a regular basis ?
> > > > > > > http://patchwork.ozlabs.org/project/qemu-devel/list/
> > > > > > > The admins for that system are trying to identify which of
> > > > > > > the various projects are really using their patchwork instances,
> > > > > > > so I figured I'd do a quick survey here. We don't use it
> > > > > > > as an official project tool but it's certainly possible to
> > > > > > > use it as an individual developer in one way or another.
> > > > > >
> > > > > > I think it might be used by some of the ppc hackers ... so CC:-ing to
> > > > > > qemu-pcc ...
> > > > > >
> > > > >
> > > > > I do on a very regular basis.
> > > >
> > > > Thanks for the reports. Do you use the features like assigning
> > > > patches to people and changing patch status, or do you mostly
> > > > just use it as a read-only archive-of-patches ?
> > > >
> > >
> > > Only the latter but mostly because I don't have the permissions
> > > to change status, e.g. when trying to change status of this
> > > recent patch from Cedric to rearrange the PowerPC docs:
> > >
> > > You don't have permissions to edit patch 'docs/system: Extend PPC section'
> > >
> > > My understanding is that users must be "maintainer" to edit other's
> > > patches. Only three 'maintainers' are currently listed at ozlabs for
> > > QEMU:
> >
> > I can update my patch status in the QEMU project. I am not sure if
> > this is due to I am a maintainer of another project hosted on
> > ozlabs.org.
> >
>
> Yeah everyone can update its own patches but you need to
> be maintainer of a project to update the status of other's
> patch for this project IIUC.
>

Ah, I see, thanks. So the question is whether QEMU maintainers want to
try the practice of using patchwork to help their maintenance work ...

> > >
> > > https://patchwork.ozlabs.org/api/1.0/projects/14/
> > >
> > > We had a discussion about that a few months back with Christian Schoenebeck
> > > (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we didn't
> > > quite know how to go further because of lack of documentation, but I'd be
> > > glad to experiment the full patchwork experience if someone knows how to
> > > do it :-)
> >
> > I personally found patchwork is really helpful for mainatiner's work.
> > But it looks the maintainers from the QEMU community do not use it.

Regards,
Bin

