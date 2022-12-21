Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9D653870
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87NV-00015t-IS; Wed, 21 Dec 2022 17:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p87NI-00010L-Hq
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:15:44 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p87NF-0004jU-Ay
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:15:42 -0500
Received: by mail-pg1-x52b.google.com with SMTP id f9so138056pgf.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8KyXpN2Tcof4jRsBvQILYb+rqKrJ697w4WJ0wu6Rm4=;
 b=x8gtQ8x3a1IiJ+yy/4EvDfVewmabiFa+nJIDzKg1ynesd1+3aPP8tk0hHqzvc+Mz/u
 T0RE7a0Woaj6OTHCoj+rxEeg79LPQuObDhvp47fM96SVfw6P+1rTNZJAhLknoxIip6eA
 FRwb9ELTrGS5oE57bEILm9rE0K8HEKe4ly87PlGLq/FMYJ2WJtsOkSiVQH6QJhvBK76X
 vn8T2qpVgpbLR+mwN9OlWxuv788OjGOpWCC/xswuJW4UB523A/jaxk56EeVFbyYmySsu
 4YM5gYEyemRWWv2uNjW0fgzNrhx7SpskpC7EobnejmRJPonPZYPbYNpPF/64aRU6zF8d
 r9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8KyXpN2Tcof4jRsBvQILYb+rqKrJ697w4WJ0wu6Rm4=;
 b=5047meh3n+PQSsg+lWVeibEzI5B/sU0537phajuYSH6Huzcu2mH9BZ/N2ge0/ClqYr
 q3i80vAWxAsxLt65huurRBeUUS/wkdh/gq4ikdfnjyQUWZ5Qu642udn5J+VoKq+ETnWl
 99YiEJY0zg5uqV+FtGVwbLPItDumLxzMBlbFj7NpXloJYAta4sYF6OPIEiE+kC2iCJQv
 U02SkJRIDuec58n/2JMEpeWECLT6uGR/d24asbNzD3pF6uj7xtm6CjeVhCJ7dNN5QBIL
 9ghfX2kuLrNpX9mA1WGyTwcGwTxgZbSfISbgRO4324zBfEXD4JPp9qVtWaTIvSqjKixT
 pURw==
X-Gm-Message-State: AFqh2koRptollOhzr/7em0UeuBhEEd2+E+wKdcZVAZx+ZYMsZAbhbw+9
 aqWVPSBAhufuOkUL4xglEfP3+C/2gs0eJ5wyBgp7eQ==
X-Google-Smtp-Source: AMrXdXu2xkYmsTnTuq2VjmVee6HdNeYgYRy/TPo5uuTVbrcJ2ZMLZxMTPFZchVBNwmtpYC7763LytEX23jVwvU/xa5s=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr203134pgh.105.1671660939380; Wed, 21
 Dec 2022 14:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
 <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
 <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
In-Reply-To: <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 22:15:28 +0000
Message-ID: <CAFEAcA_yh95V-szcDaX1p490FvWi_VwRz9FJVokGwiw3zqqi8w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 21 Dec 2022 at 16:03, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/21/22 13:33, Peter Maydell wrote:
> > On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au=
> wrote:
> >> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> >>> OK. I still think we should consistently change all the places that a=
re
> >>> accessing this data structure, though, not just half of them.
> >>
> >> Yes, that makes sense.  Although what exactly constitutes "this data
> >> structure" is a bit complex here.  If we mean just the spapr specific
> >> "external HPT", then there are only a few more references to it.  If
> >> we mean all instances of a powerpc hashed page table, then there are a
> >> bunch more in the cpu target code.
> >
> > I had in mind "places where we write this specific array of bytes
> > spapr->htab".
>
>
> spapr_store_hpte() seems to be the most annoying part. It is used
> by hcalls h_enter, h_remove, h_protect. Reworking the interface
> to present pte0/pte1 as BE variables means reworking the whole
> hw/ppc/spapr_softmmu.c file. That's feasible but not a small task
> since the changes will root down in the target hash mmu code which
> is shared by all platforms ... :/

Don't you just need to change spapr_store_hpte() to use stq_be_p()
instead of stq_p() ?

> spapr_hpte_set_c() are spapr_hpte_set_r() are of a different kind.

That code seems to suggest we already implicitly assume that
spapr->htab fields have a given endianness...

thanks
-- PMM

