Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED33145D1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:51:34 +0100 (CET)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9IBg-0005aI-L3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9IAQ-00056K-Ie; Mon, 08 Feb 2021 20:50:14 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9IAO-00040O-GE; Mon, 08 Feb 2021 20:50:14 -0500
Received: by mail-il1-x134.google.com with SMTP id z18so14694843ile.9;
 Mon, 08 Feb 2021 17:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mos2iXOYtgXQFNTgfDqd9JMvlXR2w41p4pW/Uzv/fsk=;
 b=Tm5b0Z04frKp3XL2WE3C/beAqxXX7/xqAVXgM+YHOPDdr0Xzf8y37IQdmg0kF9zlYe
 R7iudcjgmKmXIFlTtXj2H3Ns+UAdachwM3omdmn1C33+ozMjtntZs4pjU4Xgwf9YArPD
 9e1rV5VoOIGrfQT45W8XXEQR4d5NBTO2bE81Jt/bKfcecHKLeYNIU4n2hYHsrf3nbnk6
 SNKts2BR6gnDgt86EVnLv8lGPrrsGhGAiQQlVFmRipQks3Q3B7Wqn0Z5Izf1/ERokJnT
 LakwHUN34q+OnRXuBYmQQMlDuKTqOpwjy+xDoAU1mY3M0ECWk/31QNC/eANcCAfj70zD
 s67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mos2iXOYtgXQFNTgfDqd9JMvlXR2w41p4pW/Uzv/fsk=;
 b=P7LIFJkOY154/tnZimieoG4LqIATQP0Wp0pYvWCWa0ebSRF7KiDOyG2NV7eTmG+ysx
 Zm8p1DlBnGPTSV82bBdR4oXm3lSTJ8wPOYMRWqMowHGw29pq8f1ZOGGq1rkHBTB87O8h
 sQMwdoPmOsHF8s8fL9nSfwOO5dyZmp7LGIrKiYmWOmtIqmn+Pe1CpiXNXmkqcB/cFjod
 4HSQaYD3fYdKUdcUgY4/vdQEY4n5lAcHe3exyI6gm0OFKWlBzBapMwG8deg8wItZts/i
 DqAVS8wV/stgM9C+g5nQBPuatEGuIiYE4XpW7ELRZP+6ZNu+jgbKNLpbHBcx7N1/6u5k
 4Qyw==
X-Gm-Message-State: AOAM530gf70QxddPtb06bN65j1Y3hahbCwfhQq/6FyUMgjXTOkwISCaJ
 0F89KGpXOvN4OYX8iCeA10nstabnvLF7E47sdfI=
X-Google-Smtp-Source: ABdhPJwSaN7Xzd+vNDhhfhy7QVHxAw1kQAqBZiGWjV3Wj1SIyIhTZ+P3VQHA8j/CoA9w92ugOm6epN8wfR5sp9OIyoc=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr18279029ild.267.1612835411009; 
 Mon, 08 Feb 2021 17:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-7-laurent@vivier.eu>
 <2bb1378d-1ccb-d373-1de2-9add2f5e8a23@vivier.eu>
 <CAKmqyKMjunx2kD6u+11QbT56Lr_ruMxbAu58-UckD7oy-15OXw@mail.gmail.com>
 <1e2a030b-d41d-9d73-f350-95559ebd1f95@vivier.eu>
In-Reply-To: <1e2a030b-d41d-9d73-f350-95559ebd1f95@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Feb 2021 17:49:38 -0800
Message-ID: <CAKmqyKNghvAcCog8bcp9aZgCvpaAeumm4VfxOWoLsft_O=jD5Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 6, 2021 at 6:46 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/01/2021 =C3=A0 00:44, Alistair Francis a =C3=A9crit :
> > On Sat, Jan 23, 2021 at 7:06 AM Laurent Vivier <laurent@vivier.eu> wrot=
e:
> >>
> >> Is there someone to merge this?
> >
> > Do you mean just this patch or the whole series?
>
> Sorry, I missed your mail.
>
> I mean only this patch.

Ok, I have applied it.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Thanks,
> Laurent
>

