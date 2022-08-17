Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BB596E77
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 14:34:40 +0200 (CEST)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOIFr-0001jw-BJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOIDO-00005Q-Tz
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:32:07 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOIDN-0005gg-D2
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:32:06 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-333a4a5d495so116933107b3.10
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+kPU+uD7Z1/ETT3ulfOSdkBhoSCpgg4Ij0XDQx0RGuI=;
 b=iOJ4WboaoE9UpxLWssFrVbOtJzxOglMS2MD7QVdJO+wklhl0uHdAkVIyPdDLXZGi6s
 pcizpvBBtJOSmEIUwCMhdh/ZMhgcXNc7EZQka//Qr+8oEGAOBmwd+Wl/zy5G9lNmIkvM
 MeeJigr8UYji3l4cl/DIgcswjQ2qwB1GezZ8zY0L4rVhx8a6mlEOvGTPLV7wcNU4FjNV
 NcZWJ1cB/xuJfr92pKmVoBpkJbebCSW5LJXSeRj6f6szEWRjL3nLpOvp9Q+PLSyx1FQ/
 vi+UpjzUO2ILKfIjs+LiiQzEannL9v7allvttOjGlo+WI0kXM1jh9bFzfpFSgOS83D9E
 ooRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+kPU+uD7Z1/ETT3ulfOSdkBhoSCpgg4Ij0XDQx0RGuI=;
 b=Ldz5vKsra9m40KN7ZZ2fK10g5j18IR6pF1Ugl2KtaoeIgKNBoq/R4qXMwMAu0YH/li
 kC/+4ztx3IZFZOF4G5zKL6fY0kqjmNZ6SjJfLtEp/qkTHEFwQXX253Kbh+FczlQRWqEx
 PKLutV/m5O23atUz1Nn2ku/4FPqEOmpgQSsrSNxTHmk2+1cgvb3djoCWI5jWRMokHtHO
 WCocsQion7d8pnR3lJbmSdha1DKzbouNiKehDgAzfWo3J97vEO5BPEej2tbCl0YkUmFN
 VNNUqEyP30x+88532vzTyfQmdB31Yd1fhB5c2V4NaOyw2cNzFB3hLLsr7HcQzSxSkJXz
 3PUA==
X-Gm-Message-State: ACgBeo2Pv4bFr/w6t38aDIuWaGzjEzNKJtJ6sFMF91mtZ1+678rPTwJh
 7pLOzc1QiWXyAaFz8Qe7mY9QavJA2Svac3P6dESvig==
X-Google-Smtp-Source: AA6agR676bu+9nFppMMoSwRzd8MLsHvGrQkte1XfsGn4uzdQzRnfUAueIP9ziXN7vBPSDbO/51Vpt9EmYV/BXDbq4Fo=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr21880400ywt.64.1660739524168; Wed, 17
 Aug 2022 05:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-3-peter.maydell@linaro.org>
 <219fb09f-c46a-4dda-9ab7-ebb0772c17f5@linaro.org>
 <CAFEAcA8GF8MLrp+9yqmPYJCfkVdUtc+-A7J+zn-gfvb06v-+Yw@mail.gmail.com>
 <20220817064800-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220817064800-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 13:31:22 +0100
Message-ID: <CAFEAcA9joP2W9MdGKsZFz2uJWqQoSUKTfdH5TNwyRyxPhGcBBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 17 Aug 2022 at 11:48, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 27, 2022 at 11:26:15AM +0100, Peter Maydell wrote:
> > On Tue, 26 Jul 2022 at 23:30, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > >
> > > On 7/26/22 09:32, Peter Maydell wrote:
> > > > Coverity complains that in functions like pci_set_word_by_mask()
> > > > we might end up shifting by more than 31 bits. This is true,
> > > > but only if the caller passes in a zero mask. Help Coverity out
> > > > by asserting that the mask argument is valid.
> > > >
> > > > Fixes: CID 1487168
> > > >
> > > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > > Note that only 1 of these 4 functions is used, and that only
> > > > in 2 places in the codebase. In both cases the mask argument
> > > > is a compile-time constant.
> > > > ---
> > > >   include/hw/pci/pci.h | 20 ++++++++++++++++----
> > > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > index c79144bc5ef..0392b947b8b 100644
> > > > --- a/include/hw/pci/pci.h
> > > > +++ b/include/hw/pci/pci.h
> > > > @@ -688,7 +688,10 @@ static inline void
> > > >   pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
> > > >   {
> > > >       uint8_t val = pci_get_byte(config);
> > > > -    uint8_t rval = reg << ctz32(mask);
> > > > +    uint8_t rval;
> > > > +
> > > > +    assert(mask & 0xff);
> > >
> > > Why the and, especially considering the uint8_t type?
> >
> > Oops, yes. I think I was mixing up prototypes and thought the
> > mask was passed as a 32-bit value in both these functions.

> Did you intend to send v2 of this without the &?

Thanks for the reminder -- I'd forgotten I needed to respin.

-- PMM

