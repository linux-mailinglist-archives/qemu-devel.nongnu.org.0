Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3402DD1C9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:02:49 +0100 (CET)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsvg-0000Jg-2O
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpsuK-0008A2-Dp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:01:24 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpsuI-0001Vb-Ev
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:01:24 -0500
Received: by mail-ed1-x52d.google.com with SMTP id h16so28528903edt.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPTG6WOBXAWVQe0g1H9Sfj3FU6jRst00wICuaNzKN9w=;
 b=A84Bh4PnY6SuT94L5mCawESxuo64rzlmps9LXaAK7qNCwxKsGbQ5cIUxcRjDvRYH4l
 rPJpGQXou9882dmVBF30qxTqn9jlvlIJvDwNpdQNcdeLJPrE9uv3Xho/WoGHUe/eDDmY
 EXp10lKt6lUbd1zjPJ6oTCIB3FegYqLU6sdWZDGY1DIZFfkU8G8xVC4vRhafzSAwsykJ
 V5oIHXnWWJCISOnwVMRU2KZ+6Noi8eXXjysy9wzfRIpqM1ARsCGRWmSZXxabm7vLcjhw
 OJKDxCSwubBgPsoG9/LXYrX9jSIA4/ILR7s/djVl0IxCuNYWHHUjnf5X6ZOp5sQcy5gU
 VYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPTG6WOBXAWVQe0g1H9Sfj3FU6jRst00wICuaNzKN9w=;
 b=KN2RgmeANdjzLwWGgg4cfvRbeZAgbKM17Wde8vpPTKZY1wUW0CwTU5kBZGeI6DJvGA
 dkg1jhtS9n6K560rfdV1WEcFWr5B/CxJzo79UJKG+LPG/5lZt9jXltc5/PSyELug1UjT
 AW9KBjFSl/MWCb7nRWQVUQv0vsDGzdSHoMwJE9FMzdSczCXu1rspq3H2labKZB9SX6gm
 7QGjbbFhRKSaOBiTVCvojNaJoflg8XO0WRD7OnKnXQUbRdJ+IhVNeYKxEzKoHB2dV9tT
 uhPhWDxOLo3w6zSz7ON3kxc1xIvHmCFSuGHem3dM8h2CJFEiRAOxh9Vovc6S95vlv0rO
 OF2Q==
X-Gm-Message-State: AOAM530CIjCVoDndC81ChsNl7F0IrQ2EKyu7q9ZctH6pinfNr6lf2M5r
 GGfDtMbVBG73je1IIWEGmq5aiUShy9bcpCrKhOcrag==
X-Google-Smtp-Source: ABdhPJzHBvm3eJKiFfUYhikfcOgXuFaHJYbjXSa0sUaBmg9ibDaIG2N6LuI+viakNb4HD1RWQPpfRNI8TvPBxBOwlIY=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr11305911edq.36.1608210080545; 
 Thu, 17 Dec 2020 05:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20201005040319.74600-1-gromero@linux.ibm.com>
 <20201009004303.GD1025389@yekko.fritz.box>
 <f828bad5-d3a6-e290-dc87-f1e46b7bade4@linux.ibm.com>
 <20201217034733.GF310465@yekko.fritz.box>
In-Reply-To: <20201217034733.GF310465@yekko.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 13:01:09 +0000
Message-ID: <CAFEAcA-j+nGnSfZG4rmRdF8znHz308OsFqv-983qkhQvqHoO-g@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/ppc: Add infrastructure for prefixed
 instructions
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Gustavo Romero <gromero@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, mroth@lamentation.net,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 03:55, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Wed, Dec 16, 2020 at 05:01:29AM -0300, Gustavo Romero wrote:
> > Hi David,
> >
> > Thanks a lot for the review. Please find my comments inline.
> >
> > On 10/8/20 9:43 PM, David Gibson wrote:
> > > On Mon, Oct 05, 2020 at 01:03:13AM -0300, Gustavo Romero wrote:
> > > > From: Michael Roth <mdroth@linux.vnet.ibm.com>
> > >
> > > Probably a good idea to CC future spins to Richard Henderson
> > > <rth@twiddle.net> - by knowledge of how TCG works is only middling.
> >
> > OK.
>
> Well, I said that at the time, but rth@twiddle.net seems to have been
> bouncing for a while now.  I'm not sure what Richard's current
> preferred address is.

It's richard.henderson@linaro.org (cf commit 336f744e148a7b9d5
to MAINTAINERS).

(Added qemu-devel to the cc list.)

-- PMM

