Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B688B650A43
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:40:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DZE-00024E-0T; Mon, 19 Dec 2022 05:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DYo-0001vt-IO
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:39:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7DYm-0001uV-LJ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:39:53 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so12543831pjr.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u7KeSU+NIGRMiKUqkPJtZFR1KIYWRCK8Ds6T77hTh3w=;
 b=uSptm9k0w65crp6lqNvmpCwAuG8sw4+YYo8YL+jJKAgdAISgjEFkoMJyHxncVFY0Ur
 7FrJpM1vq7PiSGGI1FxBK6nXxl2/PESX8HIsLKuEgjl2I2XJ+lbJvVJkIPP/nSHZyebw
 en2/IIu7lBIW/HnYYqbko3E5mj+0TVk7XXBjxNGyw5z0mqnSqAxT8rX7ngvBXdOCs7aH
 vH1v4pl2GKo0dwF2PiKP3eQXrh3qVLbFCmXmqvPqhksd4A7EckRVy7zkygGHdcan+o7c
 EQRmVTp98B6imAinzwShgSZYw5swi+DVYBXCPqG8K5X/aJPUg0vZR8ddGe1dCNLJ4VIr
 Fihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u7KeSU+NIGRMiKUqkPJtZFR1KIYWRCK8Ds6T77hTh3w=;
 b=PqLXDdEkBDhCdCsPXpXEHefqZ1cxmTMLKzRitgR+J//c0Zro4ndmORuLhzvjNq/zbQ
 yu4aKSd1wvqGfzuUFyi0uHwqcfGKgVTSppYJA+L9jn+J7xptripQwBGVFYKlVEsKcwBP
 rBq435qE5LCWOT+JY5GI5zW8UyE2CWoOqLuA3o0SXjJsqpkRP0ITSc3jhwUvFQWKeHnT
 wsH126s3nYWrYjHeMGDhxCSa+LNzxK/MsunDSlr0/u6gNipX6AqifnAlikQhCPuiZDM5
 1i1j0QgfBUXbTymt9xNREn8+sWRFl6g2jdHoyKueA42DpkkHIP8qZ2HmwnJpnuRLcrbR
 hPvA==
X-Gm-Message-State: AFqh2koXz2+qyJVw9acU8M+nBOuXygYVR712yFgPsZl+jl0dXc2aGj6m
 JZd50blxxuj4HGJi7d7cCJxUenPWj8Y4/mzexcA01A==
X-Google-Smtp-Source: AMrXdXu8V+vWKNuuqzeYNpv8VSmTKPBB3zpbc1mjYmM/d4GUigUrVJyYdaGEPXMQaoDCgL1to3ucV4WZRN5C9CEotFU=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1914058pjb.19.1671446391242; Mon, 19
 Dec 2022 02:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
In-Reply-To: <Y6AFLpDEkpS+muSJ@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 10:39:40 +0000
Message-ID: <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Mon, 19 Dec 2022 at 06:35, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Dec 16, 2022 at 09:39:19PM +0000, Peter Maydell wrote:
> > On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> > >
> > >
> > >
> > > On 12/13/22 10:51, Peter Maydell wrote:
> > > Yes, most if not all accesses are being handled as "target endian", even
> > > though the target is always big endian.
>
> So "target is always big endian" is pretty misleading for POWER.  We
> always define "TARGET_BIG_ENDIAN" in qemu, but for at least 10 years
> the CPUs have been capable of running in either big endian or little
> endian mode (selected at runtime).  Some variants can choose
> endianness on a per-page basis.  Since the creation of the ISA it's
> had "byte reversed" load and store instructions that let it use little
> endian for specific memory accesses.

Yeah, this is like Arm (and for the purposes of this thread
I meant essentially "TARGET_BIG_ENDIAN is always defined").

> Really the whole notion of an ISA having an "endianness" doesn't make
> a lot of sense - it's an individual load or store to memory that has
> an endianness which can depend on a bunch of factors.  When these
> macros were created, an ISA nearly always used the same endianness,
> but that's not really true any more - not just for POWER, but for a
> bunch of targets.  So from that point of view, I think getting rid of
> tswap() - particularly one that has compile time semantics, rather
> than behaviour which can depend on cpu mode/state is a good idea.

I tend to think of the TARGET_BIG_ENDIAN/not setting as being
something like "CPU bus endianness". At least for Arm, when you
put the CPU into BE mode it pretty much means "the CPU byteswaps
the data when it comes in/out", AIUI.

> I believe that even when running in little-endian mode, the hash page
> tables are encoded in big-endian, so I think the proposed change makes
> sense.

OK. I still think we should consistently change all the places that are
accessing this data structure, though, not just half of them.

thanks
-- PMM

