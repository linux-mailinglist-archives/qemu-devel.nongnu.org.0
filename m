Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47247383D8B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:34:35 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lij0c-0003yA-5G
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiV4-0006vu-Qm
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:01:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liiV2-0006J4-GU
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:01:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id a25so8142532edr.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VqhSl3VfGpLttd+fJjV0hbZDkOHjPTqBGXfw/MCo440=;
 b=OSjLIVPbs54km9xhuPx1w/1h4ZmF7/eoWSQnjUEfVBZbCP0morY38lS2z+0VTya3WH
 s1fNytcGqU4quFWAyTUNK+A8sNQKW151VObHJL3DSq9/HM8dEQB7vOmY+u3USixSBfxP
 ktf24hO2PYiY6G8YazaXhokJE74jfVUXOOdclw9n6c0TZSscKIZ7/XkpLrGyGQuuFL6C
 yrnEXeYwCZ51KfVT0UdeP6tCnKc+T0RwW9JPJgInM93Vy7+8B/pA9mJ4dnVZQbahM4bE
 I9uj+B+A+2K2WDBMOJSfbW+DDykVXi5WglDovQ797tEWnCpy0OQoPAiECum6OKy3KE0Z
 JMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VqhSl3VfGpLttd+fJjV0hbZDkOHjPTqBGXfw/MCo440=;
 b=UdxbXgR7lh0HB2A2TLGJlN6pfdCdfMwLdjT/n+JcmHBxa1IDTBnInPLdrNQgoc1cPL
 nq6tEjLkL99B8DQY4OHj91gKzd8vbxtbWUUJSaV30Xe0iVfD+GRo31vMNb+4y6oeQ9dn
 DIt968HHtxG6KxvX/Wvid1QsI5GCfjAs7907gqcSkt7/CdLacVYBFKF4G4iTWMegTzuU
 iW4LUUPaXMY5LVY6qu01Uw4wqrtf5MtUaTJ5OZuquC1F4RL3KDW7YLJEksTyuya6n7KL
 Ivd28hXE2lN9+lMArBMqLdg/P9Svl5EJxZic/Ya+8vqRBfU31o7cG4c1HS6ZtbOdNnF+
 o5zw==
X-Gm-Message-State: AOAM530RyAmYSCRSmQ9TOPmh7WGsOAdwCmiqJ5UYglzyXPzCgPPRJ3vI
 EePVWV7fzk6BM4pUqkp/4ud/AO35ACnfp2KvSvCFLA==
X-Google-Smtp-Source: ABdhPJxnmQyGPIXR8sBs7XZJm84Z55PFde3HKdMerXMuocP53561QywAwgG+kdGgqMSdTE9gCMQAZK8eZFaGb8sNPvM=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr1843905edb.100.1621278113054; 
 Mon, 17 May 2021 12:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <87y2chjmsf.fsf@linaro.org>
 <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org>
 <87bl99e03j.fsf@linaro.org>
In-Reply-To: <87bl99e03j.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 20:01:37 +0100
Message-ID: <CAFEAcA-ZWpZ5nA8aTgdGh5WReQAEaSHozLnmobwAMk4x=FzmuQ@mail.gmail.com>
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, gdb@gnu.org,
 Luis Machado <luis.machado@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 May 2021 at 18:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Luis Machado <luis.machado@linaro.org> writes:
> > Right. We don't support reverse step/next/continue for remote targets.
> > I think this would be the most appropriate way to implement this
> > feature in GDB. But it is not trivial.
>
> You do because ";ReverseStep+;ReverseContinue+" is part of the gdbstub
> negotiation handshake.
>
> Out of interest how is rr implemented? It presents a gdb interface so I
> thought it was some implemented using some remote magic.

AIUI rr just implements the reverse-step/reverse-continue parts
of the gdb remote protocol. It makes them fast by internally to
its implementation saying "ah, you wanted to do a reverse-step,
I can do that by starting from the best available checkpoint and
going forwards" and by automatically creating checkpoints at
points that it thinks will be useful. gdb and the remote protocol
know nothing about these checkpoints -- they are purely created and
managed under the hood by rr as an optimisation so that reverse-step
is decently fast. (Given that it's the rr end that knows best about
what checkpoints  are available, how expensive it is to create a
checkpoint, etc, that seems not unreasonable.)

There are also a handful of rr-specific gdb commands kind of
like the QEMU-specific ones, which the user can use to say
things like "go directly to this point in time T" which the
gdb UI doesn't have a concept of. (Also because rr starts the
gdb for you it gets a chance to feed it a few gdb macro
definitions which I think mostly just make the debugging
experience a bit smoother rather than being critical parts
of the gdb-to-stub communication.)

thanks
-- PMM

