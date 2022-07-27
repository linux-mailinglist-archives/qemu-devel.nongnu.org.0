Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0A582767
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:12:34 +0200 (CEST)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGgq1-0002nU-CP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGglB-0006yH-IY
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:07:34 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGgl9-0007M6-QR
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:07:33 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31f41584236so66332987b3.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vY1IQLB3naamW5x7+ajRl5v8vZYisUNbV7tfLqvYob8=;
 b=OxsZJQznIbOi+PyaPSp9jpyIbCiKPuN5D/zS52ySJ3oAMFeGiIQtfZtvhcjXTxUgm+
 h8i51etXJcXF25OjW64VJePm/B0/IF6nQXAyxZHqSlAIVYGtknUFuO1IC+95WS7WzY2W
 qopzHleSb9IVp3aF6eGcR5Y8W04GEGGOW578vSPTqbsbTAfKtynhuuDJsrC5NOmfcGfn
 MtQYgUEW67o/aUhDp7D23/C0J46RBn9c9ndGLgOCO4l5HAbmgrcbE6nP6U4/DB4l+5Iw
 83seglabcgVTLsFSl8/Wzts1GAM8dpeWfpyDJNVUuRG9Oz8Y8bvV+lg4WM+pp6xychKU
 +luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vY1IQLB3naamW5x7+ajRl5v8vZYisUNbV7tfLqvYob8=;
 b=O5+Aa0LbKk0oj4PDBh69dE5rTUf0PXoKmNFVtLMVN4KrU4IyP1TXLJ3gNGvqebTrzS
 b3wBYCmLYno0/0JU4I/bJ4c2/onmapzPXA6HPvZRQd3MtLWgPejA26gQbO13LrlN4TL/
 6z1FBz+wdiaBFJRP2xia3Pvu0EZrPrjtKceDVs8V95kUOXZk2DuQONiB4U6yWkwaBAV3
 4qOzv6KYec97kEWMaH/SQ8xOKvDbwuztcr4YjNi1DeuXgw57/PN3aTq9DRacBexf3lhL
 EHwwQYCWg20E23i7nWx75wQQI853hVoT7m4kCnj0t5HC/VnWG34DTj+LEAlYM+1dblMf
 TLnQ==
X-Gm-Message-State: AJIora9+WnD1L+WQmbP+3VEkGznnr0bmJ+snZGzN/X4ZdaMWPP0y3kXn
 rAJBOrLca4X2t775N9213/APlQWr4ZWsaKLouBddrg==
X-Google-Smtp-Source: AGRyM1v8oQywCiv4/SZCp2tEwkXu5V1X3NnNxiQMWEyvAgxV55b5q266HxcS/X7hhkH1h4uC/c/jkXrSgRXGPAr6OzY=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr1508370ywd.347.1658927250638; Wed, 27
 Jul 2022 06:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <a7f02b8a-a132-5b8f-6ceb-0d6920ce2a22@kaod.org>
 <77d060c0-6b8a-5c20-58c0-ed6f0d45e99@eik.bme.hu>
 <CAFEAcA_5dS=Mng3bpptRrGpD36AsOQLNQ_2ntokSBK0X+oLPUw@mail.gmail.com>
In-Reply-To: <CAFEAcA_5dS=Mng3bpptRrGpD36AsOQLNQ_2ntokSBK0X+oLPUw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 14:06:50 +0100
Message-ID: <CAFEAcA_=eY5yhz0_f2xXA6yFePvpmSoLqtw1saMjY=w1kvD1Lw@mail.gmail.com>
Subject: Re: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 27 Jul 2022 at 14:01, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 27 Jul 2022 at 12:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >
> > On Wed, 27 Jul 2022, C=C3=A9dric Le Goater wrote:
> > > On 7/26/22 20:23, Peter Maydell wrote:
> > >> This patchset is mainly trying to fix a problem that Coverity spotte=
d
> > >> in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the cod=
e
> > >> is not correctly using the cpu_physical_memory_map() function.
> >
> > Likely I did not know how this function works when implementing it and =
may
> > have used it wrong but none of the reviews spotted it either. (I may ha=
ve
> > used some other DMA device model as an inspiration but don't remember
> > which.)
> >
> > >> While I was fixing that I noticed a second problem in this code,
> > >> where it doesn't have a fallback for when cpu_physical_memory_map()
> > >> says "I couldn't map that for you".
> >
> > When can that happen? If only in cases when guest gives invalid paramet=
ers
> > then maybe we don't have to bother with that and can let it fail but
> > having a fallback does not hurt.
>
> Mostly it happens when the thing being DMA'd to or from is not RAM.
> Ordinarily I wouldn't expect that to be likely, but the DMA device
> here has a "don't advance the src/destination" option which I assume
> would be used for things like DMA'ing to or from a device FIFO.
> Perhaps AmigaOS doesn't in practice do that.

Oh, and we should probably use the 'call address_space_read/write'
fallback for all cases of "don't advance the pointer", because
address_space_map() will not handle that correctly -- it will
typically return a 'bounce buffer' and then copy the bounce buffer
to the device, so the effect will be like reading/writing the
FIFO device only once instead of reading/writing all the data.

thanks
-- PMM

