Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707535B8740
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:28:23 +0200 (CEST)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQZ4-0001Ar-1h
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oYQRx-0005CI-FT
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:21:01 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oYQRv-000239-MK
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:21:01 -0400
Received: by mail-pl1-x635.google.com with SMTP id jm11so14774108plb.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ZZXTzsvXrFoRzhjiFY+nq2viilaT7c9+O+Ladg0tW3k=;
 b=GZNjzqGaYUA3n+QFRZTeQG/UDt9kPhvuWL+fxupLXwF6Ij4/R4G+aSVbpMhPVN2RRy
 kaadIabT1ZJkrKngYCTU69jbsL0VIu/gyRqyPY0ncjwgUKJ90+9paeEEzLlNIs52NZ4B
 bJBbQbdS3jp8Z79VsKZTSTvrX8z4NUk26oLKLZoHn780IGHFIFifPzjDgOoNqumPg7iq
 6kKpN78jXvH0/qKwvtGdVCogRsBE42NOup0ZrBiEZ//olqy9x+sHYPiNKuO1ciS1kz7S
 z6TN+HAdbRD2ItnP3fIIC4dCDPc/B82ELCqgqdEvSF87xRU9BfkdDX0k66utF6k8st4e
 3naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZZXTzsvXrFoRzhjiFY+nq2viilaT7c9+O+Ladg0tW3k=;
 b=42ygXYUTgdMrQ1m2BYRZjDi33r1jzrlMIXGb+uAKGe++5+xzCfwACD9I+yP+Syy6I7
 tAjHOE+lhytwLldXn/GrFJifUGSfcSm3G2xjQ6v1btAHP7QNm8KjEjJUUGpPtNEgabMW
 Pf033sAnA7Nv6YiA6HgWig5slsAUUXUNuG2QIy6ZRalSgmVfmi0iYC9a1PtaJb8pvJne
 MyJmvQXqWLplXZgtUSuS2QSga4mMVaVBqYftwAdBZNaWsEuMLXdZ8h996ICrUHveJX4q
 bCOwwtmmuElrQZzCVF2lxy8XXWwvI6OZqfslyi0o25enmS7v1LBmKr11uIZ5OTedVap1
 gJ0Q==
X-Gm-Message-State: ACrzQf2EeieMB9iKT8kko1aYRmS51o9X/GTK9d7NzEGPOTtgyDmt4h8D
 1iwKHnKOfgXMv66TR13cNcLj52harlNpOTSRQRA=
X-Google-Smtp-Source: AMsMyM6sAnjRb+xh8Ow25YJSdbYm31TM3Y93j7MRZgjwG4nH3kIknGBaM2bTCRs6MAhtZ+y/iqwciitfo2NuVu71Ybc=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr4302267pjb.85.1663154457827; Wed, 14
 Sep 2022 04:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
 <87o7vjz6da.fsf@linaro.org>
 <CAJ307Ei=yXX_3jwhitUk7cEf=b70E2SuJEUDQTDRzszR=9wTHQ@mail.gmail.com>
In-Reply-To: <CAJ307Ei=yXX_3jwhitUk7cEf=b70E2SuJEUDQTDRzszR=9wTHQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 14 Sep 2022 13:20:31 +0200
Message-ID: <CAKmqyKNMtmNofT3utfAF-mf1__Ba1g1ErU3iscFaKa=sPYx9xQ@mail.gmail.com>
Subject: Re: Question about loading bare metal firmware
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Sep 13, 2022 at 4:57 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
>
> > > Hi all,
> > >
> > > I'm wondering if there is an official way to load bare metal software
> > > within qemu emulations.
> > > I've seen a lot of people (including us) using -kernel. However, the
> > > doc seems to imply that the generic loader would be a better approach
> > > (cf [1]). I know that the compatibility with older Qemus is one of th=
e
> > > reasons why -kernel is still highly used. I've also seen that the
> > > reset vector can be initialized automatically by -kernel unlike with
> > > the generic loader (this is the case with RiscV AFAICT).
> > > But is there any kind of official recommendation on that topic ?
> >
> > The recommendation is in the document you linked. For bare metal use th=
e
> > generic loader and make sure you put the blob in the right place so the
> > architectural reset vector will jump to it.
>
> Alright. I should have missed something when I tried with the generic loa=
der.
> Thanks for the inputs and the confirmation that we were doing something w=
rong !

Just another note that for a few RISC-V machines we load OpenSBI by
default. So if you don't want OpenSBI you should also specify `-bios
none`. You should also be able to just use `-bios <my_elf>` to load
your bare metal application

Alistair

>
> Thanks,
> Cl=C3=A9ment
>

