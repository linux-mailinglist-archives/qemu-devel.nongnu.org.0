Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC4561612
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:20:21 +0200 (CEST)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qLU-0008Dh-Vg
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6qHT-00064v-LC
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:16:14 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6qHR-0003W3-O8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:16:11 -0400
Received: by mail-yb1-xb34.google.com with SMTP id g4so21092966ybg.9
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jq1RV5+whmExWqqjE6UGNSq/jjPdGRlN+nu0t85JQgE=;
 b=hMd4cJjcGheTk9skYIypKZuD9ri4cfAay/RXXb54uBwHwzkHFSVj7WOTQPidgwrNub
 19ws8Qhw/OWwcBkvbCrD1b0qE2WP3cnnepmTaBohgdQgzNqNhGHU1HfUt/MOLsGaYZP7
 rPBlFS4miMbcVhUquqNRIGOYia/pMAbGM13+pEt534JGVAHtIG260f/VOOMLtNOxV5OR
 +WzzevZcd+tgPnqbDQA4lTLemX0lXNS1PyB+l5dC71G746a3+ptftUFs00mKV/Hut4i+
 xH5ExYtZiqUuHiMNgr0LOD4sDpcuGQsO44o90vtEOdom2KLQ2HrIrtFKK7nWUTCJn1fy
 yfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jq1RV5+whmExWqqjE6UGNSq/jjPdGRlN+nu0t85JQgE=;
 b=SjGgtF9e82Hl4uEIkZyRjbPCxOxMl1jWnlGBbkOvf2qc+J0pIVw95H5z2pZ5QyAqqd
 bCAB6x5yMAxDlcIbZLndICTGcvbNwzYPAJJy19MuqpAfEbT+YOjd6MoYapiyZOOS7pab
 XJpmXIJuNYe0PGdqxD6+1HWQbQxdTlQoPhBBvOOyHn83e6wY0WZ5PZ8KWir21SNZNkrk
 x908SN3irLzk365DvVAJ7SbBjlTkIP+7Ic9YP7DlAfAnp8sANzxgOiKf0JuYMhLagOu/
 9pDZdkz7+6HKV0fkP/x9yedz/NdcvShsDO+3+g1/IlV01grT5w2T8mO+/vqrWy8B2m/P
 2tyw==
X-Gm-Message-State: AJIora9LRPFQfOW8VJphVpTA4cM1S4A/GOZYT6I1qVKNVO2vIB5NsLIN
 +XJxxSlqe4rccdjpb6SBeQqqGLHV85O/lZiqwXR+pA==
X-Google-Smtp-Source: AGRyM1tIXoxKoOfmV4Ae5TtuJp3pljmmsoNw7+oDLGNrvaENZyJ+LEiKxsVkpaCkaBrPLCLRWCxNxwcglpEkV8Be+Tw=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr9170191ybg.193.1656580568061; Thu, 30
 Jun 2022 02:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
 <878rpfixfh.fsf@linaro.org> <Yrw2+X6Pi8qlTo2d@zx2c4.com>
 <87r137h49s.fsf@linaro.org> <Yrx2D/uPxM8YPCYK@zx2c4.com>
In-Reply-To: <Yrx2D/uPxM8YPCYK@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2022 10:15:29 +0100
Message-ID: <CAFEAcA8iq+ANzSgwXvLsF3ZQGLcTFGvyXtwh+Kw5XGmCo+-Z-g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Wed, 29 Jun 2022 at 16:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Wed, Jun 29, 2022 at 04:24:20PM +0100, Alex Benn=C3=A9e wrote:
> > Given the use case for the dtb-kaslr-seed knob I wonder if we should
> > have a common property and deprecate the kaslr one? As of this patch
> > existing workflows will break until command lines are updated to suppre=
ss
> > the second source of randomness.
> >
> > Maybe it would be better to have a single a new property
> > (dtb-rng-seeds?) which suppresses both dtb entries and make
> > dtb-kaslr-seed an alias and mark it as deprecated.
>
> No, I don't think so. If anything, I'll try to get rid of kaslr-seed
> upstream at some point if that makes sense. But until that happens --
> that is, until I have the conversations with people who added these and
> care about their semantics -- assume that there's granularity for some
> good reason. No need to put the cart before the horse.
>
> This is a simple patch doing a simple thing in exactly the way that
> things are already being done. I really don't want to do much more than
> that here. If you want to bikeshed it further, send a follow up patch.

It's adding a command line option, though. Those we have to get
right the first time, because for QEMU they're kind of like ABI
to our users. We *can* clean them up if we find we've made a mistake,
but we have to go through a multi-release deprecation process to do it,
so it's much less effort overall to make sure we have the command line
syntax right to start with.

If there's a good use case for the two seeds to be separately
controllable, that's fine. But I'd rather we find that out for
certain before we put a second control knob and make all our
users with workflows where they want non-random dtb blobs find
out about it and flip it.

thanks
-- PMM

