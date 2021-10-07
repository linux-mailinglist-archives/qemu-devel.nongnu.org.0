Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C1424D63
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:43:18 +0200 (CEST)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYN7d-0001GR-HT
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYN65-0000VB-3Y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:41:42 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYN62-00009V-0A
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:41:39 -0400
Received: by mail-il1-x12a.google.com with SMTP id w10so5301146ilc.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 23:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m7CQuKobADpQwh8A6ynzPs7n8KD2FzqMANT47m3c9kw=;
 b=q3VOLrKIqUHMboNdu1UPthKVqfByTjkr+cTLmJBmDfKNPRACoVHRDTszs+ei0HGsa+
 hHHgIR6INUtxTOp6ky1fj9Dpqc+skC5GX8dAQb2sO3zy/8fCsomF/bo63l1VdCPd4rVd
 Q3U+mx8rxdq9IrSZ8kpe1X9svOgMiR6lVhKHREt/UpWoWFI0UyfedXTcN0LsTKGZZZ9Z
 TpsoLRT5+g7Y0Dlx23IkuvdxxvhBsOMxD3pTBtoUP6APADJW6zL8J6IDS6+xssZqLeA0
 uvXu3s/967s9o2LI45hSl8AoIB9piCSxo71hkJQLh1Mrxe2gxH44E6WJ7c9dELPbgzPU
 8qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m7CQuKobADpQwh8A6ynzPs7n8KD2FzqMANT47m3c9kw=;
 b=PYF5dzVDsEseGUEYeOZd0YEXuRVv7UMMVaZ4tsdx6vNgaLBmle02lzD+8SX//X2UaB
 UaCeM4e1uWtQL4A3L38mjq95Yp3+EjK4XOirT6vClEojDUx0oUTcXDFLFckpnvRw/ljz
 arQcXY7NaOPXlepQTU0w9sEk8S+heWzyekKCRzejBQyRGpQsscish+vw9SiRCiVqlZke
 Y5hGSRAj09OVqJnprngxPQKMx/BUHku8PXAMsz+Mw0GfUoWX/8rrPSnYui8ZK1qGmNeP
 Bh8/pC4gABtSIqhoLjOqK8tJV2Cv3XCLFl8b0kGgmQmD6BLdoxzNsVqkeaFejflJsDmp
 xNDw==
X-Gm-Message-State: AOAM5307vBi21z2i0amtzmz5cQ4/H65yV8DLGpMj1N81BtrVTi+3WvZ0
 yBbMPlwdzodmRS633pAkpYuQawXFVvrKw+b1a9M=
X-Google-Smtp-Source: ABdhPJwS/JygC1mSyivkUjUntdk6BS6kFietLE+ak8uBm+XgQLipfzwxisw4xC87wcSZRWBNVAobA5g3vHJ2uvTaOpg=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr1859005ilo.208.1633588895966; 
 Wed, 06 Oct 2021 23:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
In-Reply-To: <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 16:41:09 +1000
Message-ID: <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 6, 2021 at 10:04 PM Damien Hedde <damien.hedde@greensocs.com> w=
rote:
>
>
>
> On 10/6/21 13:49, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 10/6/21 13:37, Damien Hedde wrote:
> >> Right now, we cannot load some binary file if it is bigger than the
> >> machine's ram size. This limitation only occurs when loading a
> >> binary file: we can load a corresponding elf file without this
> >> limitation.
> >>
> >> This is an issue for machines that have small ram or do not use the
> >> ram_size feature at all.
> >>
> >> Also get rid of "hw/boards.h" include, since we needed it only
> >> to access `current_machine`.
> >>
> >> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
> >> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>
> >> Hi Alistair,
> >>
> >> I found this while experimenting with a ram_size=3D0 machine.
>
>
>
> >
> > Where are you loading your file?
> >
>
> In a rom.
>
> The loader does not check at all that we are loading to the machine's
> ram. It just check the size for the raw binary file format.

Hmmm... This is probably correct, in that a user might want to load a
binary into ROM and doesn't want to be blocked by the ram size.

In general though a user would expect an error if they are loading a
file into RAM that is larger then the RAM. So I'm not fully convinced
we want this change.

What error do you get if you try to load a binary that is too large
with this patch applied?

Alistair

>
> --
> Damien
>
>
>

