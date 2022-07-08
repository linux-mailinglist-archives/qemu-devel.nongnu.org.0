Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49D56B3F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 10:02:40 +0200 (CEST)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9iwg-0005ze-Je
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 04:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o9itz-0003ys-G6
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 03:59:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o9itx-000495-Q4
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 03:59:51 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so1097763pjf.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1Q7GSyOOD/D8l0VtSofgxlNxskFG2yZn1AW12KtJdw=;
 b=kcq7+i4wMvGSEZrpHnQHV7OmOl84N0ZfbdCsjCRcQE0BlDI0HeiR1RXoUuo3tAyJFM
 lWDF/XCSPl3QryeO161kgwyssfOSGJ6lOxE93NJirnCZgWnUFAExUDjg9VPExw7Aev+V
 3Aut9WtpKpbfplftwYGXfgVUXdxGkeQ4hL71lpVMe3jWhVicOj7k9PRicfPZblJrs9ef
 q1Qv2DPFGQBos+sUxRt9FQRov4XsVA13j3BZs0pioq25wm5DljuUdydo+rx/AO3QnGrG
 gKbv65XngHZbDCtkqqpOkr0Oeah6gQh5Gbk6SWdU4jVjiyq12btHyD4Cc1wh7CwKxY3M
 RlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1Q7GSyOOD/D8l0VtSofgxlNxskFG2yZn1AW12KtJdw=;
 b=AMDOgL6QjIx6JfGKS9cJIG6imt4F2mnMeWaTXJAylMDlhRD+KqE1un1+Ap4DlfucLm
 bK8dDcKlrqQlJxXRCfswVB8dUMuGtfzJqWYJTQ6ka1IDiTvYeiG9U6VuxmJa/Rd7Wf+u
 YbGj9UwGVTTOKtDN4JHzYUhe0LJtTmppJgI6Gv7F8klqcxS7AAOJsrFSJWY9ieR6AzL8
 vw5iWT0dQ7R1LtMxPC6bdKxZqSfSg0x7ZGAJQJk0fu/EsPnK9cJeIMzpKT/3P+iGJDQl
 GnmcT7Qwur3xrIEDQhTby6XNxD1bOmwSpBthVhCMqn97H2A7UsyK9qw7KSY/A9kSytwe
 v0nQ==
X-Gm-Message-State: AJIora+fJzMV4TViAAlitaWbGg5EDtP6H6e2P8po8si98K9w3dq7fmLq
 5PURBEl0gETmWtdLBW7j5Z5j2Fj4TiNHWFXfwVE=
X-Google-Smtp-Source: AGRyM1tiC0KhqyKEY6TnDx3LEmvyLUh4qPSXeFY2og/Tw61I6voNV8SqSUMk6oV2argV51mugsSXFXcLpjPAH8/pN1I=
X-Received: by 2002:a17:90a:e611:b0:1ef:92b6:d31 with SMTP id
 j17-20020a17090ae61100b001ef92b60d31mr10201727pjy.166.1657267184718; Fri, 08
 Jul 2022 00:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
In-Reply-To: <YsYxM6gmJf7y/nJc@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Jul 2022 17:59:18 +1000
Message-ID: <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
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

On Thu, Jul 7, 2022 at 11:04 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Alistair,
>
> On Tue, Jul 05, 2022 at 03:09:09AM +0200, Jason A. Donenfeld wrote:
> > Hi Alistair,
> >
> > On Wed, Jun 29, 2022 at 4:09 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > I have a Linux 5.8 test case that is failing due to this patch.
> >
> > Before I started fixing things in random.c, there were a lot of early
> > boot bugs with the RNG in Linux. I backported the fixes for these to
> > all stable kernels. It's a bummer that risc-v got hit by these bugs,
> > but I think that's just the way things go unfortunately.

Hmm... That's a pain. So there is a bug in older kernels where they
won't boot if we specify this?

Can you point to the fixes?

> >
> > Jason
> >
>
> By the way, I still can't find this in your github tree. I was hoping we
> could get this in for 7.1.

Yeah, it's hard to accept when it will break users. I would rather
avoid someone upgrading to QEMU 7.1 and the kernel failing to boot
with no information.

>
> As for your 5.8 issue, I've been trying to reproduce that to understand
> more about it, but I'm unable to. I've been trying with
> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
> possible in testing this out you were testing the wrong branch? Anyway,
> it'd be nice to get this queued up...

Hmm... you can't reproduce it?

Alistair

>
> Jason

