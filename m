Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788196215F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPPz-000721-QU; Tue, 08 Nov 2022 09:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osPPO-0006wu-Gb
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:17:03 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osPPL-0006jK-J6
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:16:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so17999501pjc.3
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ITPAgsJShPeK7DahnQn03u0wvS/RXm6MP/AEDwichk=;
 b=N1SAehqTGa15ITQHH96SfR79qA6M959lnn5KuegCiOdNP6gTHR62qdRblkZBRGFhjK
 nhp+WgrQ+Unv3iZHcrY1CSmIWIZymwvuWgDSbtaxASd+TserMXrO8w3Il63XtPt8rwiF
 +JMPoNAhY+vSBCRAnbb6kxuhze0HwuMepkTKRjLFOskM4DBcYve/15LWswyp/k91GQgZ
 1yZEDBzm3zLdfPQuBjOlFd4jAPD96bNeYVO8I1Yu9kfVdpiGCLxtMQMhh1YVi779H7PA
 ljcRBh5JWdBa+3KjCgd4y++EIJw7QaiB9Fsci6qA5JgBy5grvucHun+p/jFTphPbKRcM
 U5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ITPAgsJShPeK7DahnQn03u0wvS/RXm6MP/AEDwichk=;
 b=xh2B84pPxRVe3jpRqcG3zskAz30Yxu+j55dSVPBtg/nB2aOBcGM9zzXtxja6jL99Dk
 EgAWLzELauFAkEcyRLOGfplHJWFfFFJATrnUSAiQBD955Pa7cuI3x4QfwGsKiQUFB2XR
 C+Kh7evJ95b19mAw+S/FgiHyXrJOtHCnkmRrrleZO7f1slufLrrS9qebf/FWNgaEm9+r
 bHr6XhAz85DRgQiF6G4AYAeI6gNOjmVjmkSIbkdqnttKXoOR8mppV1d9MvmacQWcFz1g
 Ms8WcPlPB5BDr2M/Kdaz1ZrJm/1SuE5yNaRLVJoUa9WfTsKpIei7im5mbHea2GCNLjSe
 VLiA==
X-Gm-Message-State: ACrzQf1FnPcKYBj1I1IApSHM0dBUUGLPT9dJ99MjzYvABRcI3TvrxlrW
 pGUR0NRmxGIQnddX64FH1O5iQx8tSvR/ocaZId8+yQ==
X-Google-Smtp-Source: AMsMyM4NeCoO+w6b5IEy+dpY5I8RFpOMVr0Gjxua2voc5Ss2xDaVAEs5nbGDa3tS2ut13CdWBZ1GIRlZ/kEA3LpeQ04=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr57229214pjb.19.1667917012688; Tue, 08
 Nov 2022 06:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
In-Reply-To: <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 14:16:41 +0000
Message-ID: <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > > There is a whole comment in boot.c talking about keeping initrd withi=
n
> > > lowmem:
> > >
> > >     /*
> > >      * We want to put the initrd far enough into RAM that when the
> > >      * kernel is uncompressed it will not clobber the initrd. However
> > >      * on boards without much RAM we must ensure that we still leave
> > >      * enough room for a decent sized initrd, and on boards with larg=
e
> > >      * amounts of RAM we must avoid the initrd being so far up in RAM
> > >      * that it is outside lowmem and inaccessible to the kernel.
> > >      * So for boards with less  than 256MB of RAM we put the initrd
> > >      * halfway into RAM, and for boards with 256MB of RAM or more we =
put
> > >      * the initrd at 128MB.
> > >      * We also refuse to put the initrd somewhere that will definitel=
y
> > >      * overlay the kernel we just loaded, though for kernel formats w=
hich
> > >      * don't tell us their exact size (eg self-decompressing 32-bit k=
ernels)
> > >      * we might still make a bad choice here.
> > >      */
> > >
> >
> > I think this lowmem does not mean below 4GB. and it is to make sure
> > the initrd_start > memblock_start_of_DRAM for Linux address range check=
.
>
> The wording of this comment pre-dates 64-bit CPU support: it
> is talking about the requirement in the 32-bit booting doc
> https://www.kernel.org/doc/Documentation/arm/Booting
> that says
> "If an initramfs is in use then, as with the dtb, it must be placed in
> a region of memory where the kernel decompressor will not overwrite it
> while also with the region which will be covered by the kernel's
> low-memory mapping."
>
> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> if you don't put the kernel, initrd, etc below 4GB.

A kernel person corrects me on the meaning of "lowmem" here -- the
kernel means by it "within the first 768MB of RAM". There is also
an implicit requirement that everything be within the bottom 32-bits
of the physical address space.

-- PMM

