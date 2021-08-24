Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36AA3F5C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:39:46 +0200 (CEST)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITqL-00070c-S8
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITpb-0006Lx-W2
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:39:00 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITpa-00050r-IK
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 06:38:59 -0400
Received: by mail-ot1-f47.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso33432848ots.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 03:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ntVOPchcRWX1SC4mpsy6Q0RfRCWJUPtx6mQIqYhsyS0=;
 b=f+OwGC6Ott+9ubirBVUb82KjUELRwef2n+Mab3ZaoZEXU8QUwa16fx+205qpKuc+Xo
 JkYF4clfko34r5kLcObq2CdLsGHH2WkfYqdsuGJSgD7+g+4eGs0wBe3YqcrEn/6Atm65
 xqIJiAg341tJmQ+Po8XsTT3O+8kMIi4e49ufMEkFvUGVERZ/hkbkyQCkG3HOhJvzq+pH
 wBHGG+G+Cq/KvL8drbOPZ/DjhCQvmPJXp2rxbkO+a4C9JGT0BUXPKpQmcVZ4Pc95cMzb
 wO+8oIR2NKtsex6Jm57NHMYfwxl6GpvT2an0jGAOD3Zr5WeXrGfZwSu5Kun4ojCVAy+p
 PB3A==
X-Gm-Message-State: AOAM532lae6UJwvUD+8JcAbyr72pluk4FQAZLy270jK5nZ4u48GBj6H2
 gmL8i2HA/7SQ/GxExSGqlIs668nXc3nQGKd7YbM=
X-Google-Smtp-Source: ABdhPJwPaWV0/ygvrDzz7CemLnvyxVds9yEgGtTo3f1pwg3fzNSBsC0bjyKEfMRQdbYFAJbKuNs3aP30A0vYXi9T8eg=
X-Received: by 2002:a05:6830:2815:: with SMTP id
 w21mr9758948otu.37.1629801537307; 
 Tue, 24 Aug 2021 03:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAFEAcA8c6T124Yg+tCWsXr_bmFyCpUy8kjpaLsP=0A1G4GEzNw@mail.gmail.com>
In-Reply-To: <CAFEAcA8c6T124Yg+tCWsXr_bmFyCpUy8kjpaLsP=0A1G4GEzNw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 24 Aug 2021 12:38:46 +0200
Message-ID: <CAAdtpL5zUcMQ=te7WgQVn+vaYu1cprwMaDq0R=Sn+rZkfy-DSg@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gautam Bhat <mindentropy@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 11:19 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On Tue, 24 Aug 2021 at 09:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> > On 8/23/21 9:46 PM, Gautam Bhat wrote:
> > > On Sun, Aug 22, 2021 at 10:18 PM Peter Maydell <peter.maydell@linaro.=
org> wrote:
> > >> On Sun, 22 Aug 2021 at 15:37, Gautam Bhat <mindentropy@gmail.com> wr=
ote:
> > >>>
> > >>> Hi,
> > >>>
> > >>> I am to implement a very simple microcontroller for my understandin=
g
> > >>> of Qemu development. This microcontroller runs its code from
> > >>> programmable flash which is bit-, byte- and word addressable. To do
> > >>> some initial tests of my nascent microcontroller implementation I
> >
> > Aren't Nascent uC based on 8051? Because AFAIK QEMU doesn't emulate
> > this architecture.
>
> I assumed Gautam was using 'nascent' in the usual English sense
> of the word (ie as an adjective meaning "just coming into existence").

TIL 'nascent' is an English word =3D)

Thanks,

Phil.

