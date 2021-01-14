Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD42F5E11
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:52:09 +0100 (CET)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzIW-0004yq-0i
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzzGN-00046i-0e
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:49:55 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:42282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzzGL-0002j0-68
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:49:54 -0500
Received: by mail-qk1-x732.google.com with SMTP id 22so6679531qkf.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 01:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dMhN1OaVokTUVZz2JxBP8t+Ad3hi+lgCq0RKdH1cNM8=;
 b=k0C7kQ7RJ9kvho5wMoydYjoXKb2mivhi05C+CkiA+kx36nyGo3qwkbp/xC/y9ZoSE3
 gI7il+IAaKUCR4yaCtT4/ZveYOawHSYQs/dTHpedQd1moe0erbSBStAB81G8z6fO8NDS
 5pyntUal22n/b3MCCL0MFZqQe4zrRSDkHIjEsJl27tpwl5tYiEWbNeYcGklWou5u6DrD
 p4rocGpd4OwU6ii69jzYWxpaIBy5xhzXMSbHa8P/JKYer4nOmnuA8uBgKNcbzWYcQ/YD
 3H68YcIcywSQKLJPBI8F2VoZbnFCr5M6FxRwAhEdQcq267UHls2DtSc7iwE1X/4W9jiU
 lvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dMhN1OaVokTUVZz2JxBP8t+Ad3hi+lgCq0RKdH1cNM8=;
 b=g60htEvyMzY6QLNeB6cHidqulinh2pcxcIwVBjzVYDQx1Xd/tpXNuIW/I4+yxcICu6
 ghUybHS3xD2nCuYS0s79vrsMa/vtPEi+z+Yvwd/oym8BY4/tIV5XeHRDuOMBc7SY5hPD
 A7DJUpoDzGlgXk500YVb8cVPvnfT1+NRXMLcc/UCoLQ53p5sWF1fF7kKc0lfEwgXS3Sd
 3lmVcQfofCkScfsfxE8INtCKrlzlxDtP7Qq4R/wuLTVB5j+Cboj02sO+1GIaSk/s5DJQ
 CKsJPxf61u2dYpRf396z3y2Mgha/ukRPgp0znCJh97WGFK55H/l9vv0mJ7crEcnq1JCv
 tCag==
X-Gm-Message-State: AOAM530WaWkvlXQo85KmKOUE53ZfO7x6OABBKYbJYT3pPKsWmdtCZYh0
 zM6wax4hQGvWXEIYwAXND0ax6sNOZNUm0Zz414s=
X-Google-Smtp-Source: ABdhPJwyMzKTfVZWVX/PMDWq3l9mPUIRZ18YbtXBPOG/uaMBK04Ml+FzuVuMYl+bYQnT61KXqBAvdAmUrb6HI3eGQgc=
X-Received: by 2002:a25:2a86:: with SMTP id q128mr4044048ybq.387.1610617791893; 
 Thu, 14 Jan 2021 01:49:51 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKNoUg9f-NdgAoGrq_DuBwWv_ZgusArvOobxEYM1mpzbRA@mail.gmail.com>
 <mhng-5ca93c0e-3134-4384-915f-23c4aed71712@palmerdabbelt-glaptop1>
 <87y2jeai0s.fsf@linaro.org>
 <CAKmqyKMy9e0sZ6RQriu1-GU9uSwcCotG1gweewwj9XvKq8Rryw@mail.gmail.com>
In-Reply-To: <CAKmqyKMy9e0sZ6RQriu1-GU9uSwcCotG1gweewwj9XvKq8Rryw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 14 Jan 2021 17:49:40 +0800
Message-ID: <CAEUhbmV4axZYh_6uBA5JdjdWjKLMgad=aAcRtmfgw8G6WqfC+A@mail.gmail.com>
Subject: Re: Emulation for riscv
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Moises Arreola <moyarrezam@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 8:09 AM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Fri, Nov 6, 2020 at 2:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >
> >
> > Palmer Dabbelt <palmer@dabbelt.com> writes:
> >
> > > On Thu, 22 Oct 2020 17:56:38 PDT (-0700), alistair23@gmail.com wrote:
> > >> On Thu, Oct 22, 2020 at 4:58 PM Moises Arreola <moyarrezam@gmail.com=
> wrote:
> > >>>
> > >>> Hello everyone, my name is Moses and I'm trying to set up a VM for =
a risc-v processor, I'm using the Risc-V Getting Started Guide and on the f=
inal step I'm getting an error while trying to launch the virtual machine u=
sing the cmd:
> > >>
> > >> Hello,
> > >>
> > >> Please don't use the RISC-V Getting Started Guide. Pretty much all o=
f
> > >> the information there is out of date and wrong. Unfortunately we are
> > >> unable to correct it.
> > >>
> > >> The QEMU wiki is a much better place for information:
> > >> https://wiki.qemu.org/Documentation/Platforms/RISCV
> > >
> > > Ya, everything at riscv.org is useless.  It's best to stick to the op=
en source
> > > documentation, as when that gets out of date we can at least fix it. =
 Using a
> > > distro helps a lot here, the wiki describes how to run a handful of p=
opular
> > > ones that were ported to RISC-V early but if your favorite isn't on t=
he list
> > > then it may have its own documentation somewhere else.
> >
> > Even better if you could submit some .rst pages for QEMU's git:
> >
> >   docs/system/target-riscv.rst
> >   docs/system/riscv/virt.rst (and maybe the other models)
> >
> > then we could improve the user manual where RiscV is currently a little
> > under-represented. A number of the systems have simple example command
> > lines or explain the kernel support needed for the model.
>
> Thanks for pointing that out Alex. Bin has sent some patches for this
> so RISC-V should have a presence soon.
>

Yep, after the initial patches are merged, we can start adding more
RISC-V docs in reST.

Regards,
Bin

