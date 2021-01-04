Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA222EA113
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:47:43 +0100 (CET)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZZe-0003T8-Fr
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwZWg-0002PT-U6
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:44:38 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwZWe-0006iV-BJ
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:44:38 -0500
Received: by mail-ed1-x534.google.com with SMTP id c7so29203397edv.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKcPT3vGvuebCgbahOEeH0AqNb1OFrBlJMNInj5qQDs=;
 b=Wik0HMK64sjUMzEtZZgeVbKsmn3ITdQGik1i24dvnvX6NttWlsCnJH20C5w6bnGZSI
 LDa63RA1AwFgDGcxkvoYYZ31WH0P44yOM5n3Ls8NG/OWyPPHbpaaybHFQ0EaVy6iQJFf
 nnEmHkJHdrAFwg4qMutzLyu4rIuCUmBgJaz8uF5Ojf3+21LO2+c27yVzxLZphq2BOtoE
 Opqq4RO/EuN1JleTjb0IOm7BdtTOAxg5JqWU0DD2vZZqHCVNV9QZj69OSVWcj+Cd6YeC
 XuYFDcdqH4BmMoiuZx6LHXLWQqIWuxjZXkf2n6m6ryxqsqnCpZUqNYb9sm7BR6fEkUwO
 W2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKcPT3vGvuebCgbahOEeH0AqNb1OFrBlJMNInj5qQDs=;
 b=bcNieqPx6ViIujH2ZWwHyxk0icjYX/0Q1J2VbdCwRjxrWbImk7QK6e8ue9SjeHNKaO
 tZxipCQsAsCNqgbu81gwAhzrLXIVJHUxL8YQbKJhec3WNodneMQqw8Objx+WHMOiXGj2
 rAMDzW96cTd4P2dMkBHPttN0TOm3V44sgKEbdtFIyihkYKDlOgNyYOBERWBnhzwMW3gD
 XlR1h2w6FIXXzHOypbdEIlVm35oFtfpW1ixDkh9l8FCDe8oD/P+YCYXuDaAFXTaimi/3
 uL3i9PGuF+kDpjbXOr1MCCSzquUaso94B9NVfnGU4WWmsGPndmejKZDUkc12c2b5w+OV
 gbDg==
X-Gm-Message-State: AOAM533fJRejLETRnneC8/HB1wvVyTN9xCXwElIUHfxnaYYWLPvug4kh
 DKixBr++YVl13zNrSLRSBkTsNzvdZAImnPDOSYlwgg==
X-Google-Smtp-Source: ABdhPJwX6216WB2Fs7aLlWbqUInyvqk8diiTr2PdaiyZBqMOtpddS06qoOUNpDEglzURPRAWINthW6/Hsm7LcP7EOls=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr73301451edr.204.1609803873898; 
 Mon, 04 Jan 2021 15:44:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609802040.git.balaton@eik.bme.hu>
 <49fd899c9767a5ed08905b7bbb2b19d0531cf7ec.1609802040.git.balaton@eik.bme.hu>
In-Reply-To: <49fd899c9767a5ed08905b7bbb2b19d0531cf7ec.1609802040.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 23:44:22 +0000
Message-ID: <CAFEAcA-Y64=2xBvVwHY8nEsAd3c7Vn58e5L3aixM0-JCMj4_Eg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ppc440_pcix: Improve comment for IRQ mapping
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 23:23, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> The code mapping all PCI interrupts to a single CPU IRQ works but is
> not trivial so document it in a comment.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/ppc440_pcix.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
> index ee952314c8..eb1290ffc8 100644
> --- a/hw/ppc/ppc440_pcix.c
> +++ b/hw/ppc/ppc440_pcix.c
> @@ -415,8 +415,15 @@ static void ppc440_pcix_reset(DeviceState *dev)
>      s->sts = 0;
>  }
>
> -/* All pins from each slot are tied to a single board IRQ.
> - * This may need further refactoring for other boards. */
> +/*
> + * All four IRQ[ABCD] pins from all slots are tied to a single board
> + * IRQ, so our mapping function here maps everything to IRQ 0.
> + * The code in pci_change_irq_level() tracks the number of times
> + * the mapped IRQ is asserted and deasserted, so if multiple devices
> + * assert an IRQ at the same time the behaviour is correct.
> + *
> + * This may need further refactoring for boards that use multiple IRQ lines.
> + */
>  static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
>  {
>      trace_ppc440_pcix_map_irq(pci_dev->devfn, irq_num, 0);
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

