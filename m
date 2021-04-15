Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2E36012E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 06:43:59 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWtrB-00036C-Kv
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 00:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtqI-0002gM-89
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:43:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtqE-0002uj-9h
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:43:01 -0400
Received: by mail-io1-xd30.google.com with SMTP id v123so16091578ioe.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 21:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mo6tBoNIhMk+xyjlU/BAAg9bfNyAzwVR08IdnM52euU=;
 b=XErMT16nKgpeOY3x4wbLYoJ1x3iKM2/cPUUdt9V9T5DlL1IvFHvR61AeJKukgkwlXz
 X+7v7L5nWov2O/1nAYpXHV4L1YLVSrtQM9mLVmgnbiK0qTZR8HbWPLd5Y7Cr+PC8cV2M
 QndC4zwjWFen9rkecBSx/3vpNtEZE+kTFwa0+Lvp0LFg9bg1qQRZCiwIGb0hve+y326H
 wu/38eWiSEm2SObfNRNTCz+PJDnpHIC9/vifYehzeEbo6jONYSfL+oLBeh7VYQsFDGFX
 3g2P/gIVXVgvBxap9fTfZ/y9hnTrcdBD38VTkBt17T/rR6Kg5XfvDLLhRiwUPB3cVhxd
 Eaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mo6tBoNIhMk+xyjlU/BAAg9bfNyAzwVR08IdnM52euU=;
 b=eMjTl9dMHV/PnfAhjgrCLO2TqiUneGggrOxWu0WQZNpF6U5k1Ok48seZhqKveVpjIr
 RhYWd7l36/dq3QmeJxmDmosCPR5lhynoHACNWyDJhdyRlLNR6yyfTdZtGDx5OJhRZca1
 CBCW1FFc3raGa2KmykXMmuhf4bLNyEYuwlwU1Q/cF49YAPWAfjInCF1UlQm3mT/CzG1v
 F6Y9UpFxoxki8d1sGY4r9ttVScCdxU5SZw/Kp/3NkqLHdWxg4vppfBy434dgWaCvoyq7
 DQzr4gXOmN2llGJG0HvxSQ2YaAUIZoGEkdoPL+upJWh8ch4jzpdJqNk9Klq1iLBlO+Ux
 HF4Q==
X-Gm-Message-State: AOAM531XyDohWC6NXLZRbgr6hQmbhwi6FzBSl2oX7PYEJplA28E0E/je
 9gMINgkH63f3b0gLgIbgtK0D/YSRzMb3an34F4c=
X-Google-Smtp-Source: ABdhPJxWYVNrhpfz0dPxrCMBuPWkGDn/i4vrRF3I/hr3Ft4vBeDn6etulXHXB4Qy6QTNm6BXceEFjGU6xzAWBG3IUyo=
X-Received: by 2002:a05:6638:41:: with SMTP id a1mr1270295jap.8.1618461775964; 
 Wed, 14 Apr 2021 21:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
 <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
 <d8a3da4f-69d5-d254-497b-c2a0397db029@c-sky.com>
In-Reply-To: <d8a3da4f-69d5-d254-497b-c2a0397db029@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 14:42:29 +1000
Message-ID: <CAKmqyKMsnAYFx5FDtO3kghtv96RQMFGzvaDgpzjGpo9Zu32Gnw@mail.gmail.com>
Subject: Re: [Bug 1923629] [NEW] RISC-V Vector Instruction vssub.vv not
 saturating
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bug 1923629 <1923629@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 2:18 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Hi Alistair,
>
> I think that this bug has been resolved in my packed-extension patch set[=
1].
>
> Would you mind to have a test and merge it before the whole patch set?

Great! Thanks

I have applied patch 3 for the next PR.

Alistair

>
> Thanks.
>
>
> Best Regards,
>
> Zhiwei
>
> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg782125.html
>
>
>
> On 2021/4/15 =E4=B8=8A=E5=8D=8811:57, Alistair Francis wrote:
> > + LIU Zhiwei and Kito Cheng
> >
> > Alistair
> >
> > On Wed, Apr 14, 2021 at 1:31 AM Tony Cole <1923629@bugs.launchpad.net> =
wrote:
> >> Public bug reported:
> >>
> >> I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv pro=
duces an
> >> incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
> >>
> >> Here is the bit of the code:
> >>
> >>                  vmv.v.i         v16, 0
> >>                  =E2=80=A6
> >> 8f040457        vssub.vv        v8,v16,v8
> >>
> >> I believe the instruction encoding is correct (vssub.vv with vd =3D v8=
,
> >> vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
> >>
> >> I=E2=80=99ve just tested with what I think is the latest branch (
> >> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
> >> 2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
> >> exists.
> >>
> >> ** Affects: qemu
> >>       Importance: Undecided
> >>           Status: New
> >>
> >>
> >> ** Tags: riscv vector
> >>
> >> --
> >> You received this bug notification because you are a member of qemu-
> >> devel-ml, which is subscribed to QEMU.
> >> https://bugs.launchpad.net/bugs/1923629
> >>
> >> Title:
> >>    RISC-V Vector Instruction vssub.vv not saturating
> >>
> >> Status in QEMU:
> >>    New
> >>
> >> Bug description:
> >>    I noticed doing a negate ( 0 =E2=80=93 0x80000000 ) using vssub.vv =
produces an
> >>    incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
> >>
> >>    Here is the bit of the code:
> >>
> >>                  vmv.v.i         v16, 0
> >>                  =E2=80=A6
> >>    8f040457      vssub.vv        v8,v16,v8
> >>
> >>    I believe the instruction encoding is correct (vssub.vv with vd =3D=
 v8,
> >>    vs2 =3D v16, rs1 =3D v8), but the result does not saturate in QEMU.
> >>
> >>    I=E2=80=99ve just tested with what I think is the latest branch (
> >>    https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 F=
eb
> >>    2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem st=
ill
> >>    exists.
> >>
> >> To manage notifications about this bug go to:
> >> https://bugs.launchpad.net/qemu/+bug/1923629/+subscriptions
> >>

