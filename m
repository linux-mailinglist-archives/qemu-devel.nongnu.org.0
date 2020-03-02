Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7FC175923
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:03:28 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8ir9-00081j-Nk
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8iqB-0007Ti-5X
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:02:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8iq9-0000Sm-T0
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:02:26 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38677)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8iq9-0000RW-MY
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:02:25 -0500
Received: by mail-oi1-x242.google.com with SMTP id 2so9870088oiz.5
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3xPkDCTTQpgwTNewKIg9eQaVQEz55A6GJLb1Cab3MjA=;
 b=Z2hOXrlRBA/1WtvUbm77PZs5AALAyp/UqXFAW/58Qw0MZNVEPhD7eg4jC6h0rYnaEW
 CtGeeb2STDfEU+25vLzzHK5mln3b04tSBNakjULGfu6x4jVLKX5FmChusiNllRt+WO4y
 /MvFV9TUj67zfNnTHW60ueQqRO8tXP11yI1OrsGYP4VAYh4YtZ6Q5t5bnfAgPyqXn9JQ
 frqp7b9Pwuge7Hi400P63AriqkW7qJ1t7+epe62ebcb+wCQvam9fIZdmKhC/Tf19hA4f
 U+ajsrgfnoVhysjrsDQv7CPvqyxzOdlGx6lMdfx3m9CvpGralurXRnkeY7sYiqzXq6d3
 YSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3xPkDCTTQpgwTNewKIg9eQaVQEz55A6GJLb1Cab3MjA=;
 b=rc6MrdqZVVgryi6df08QgeOfgC5LoVO7WVl1TamhljZ2MGkt6wrrGAqRCWie1Sz30L
 YxVM4xKYbK48A87jrJyUaYufscDewvQme1K7MpYMWhefaekQfPWZHdfNVnbF7ANDdnxk
 Pz+jEhgvZDzZMxjbA7DYYRN+RvcgxAglnF+ltsX4m6DxTNl+Er/K2kDC87hFTmPWtODo
 Pox+9LkPJt1VHYypOhC0DbIxcAsLP0BV6dbq2R43KoOI3bAtQGgAQMdiUJhCxLjcp3jS
 lzvrSXzJpcCbsxUHGAJD2HVAeK2rvYCBT9mCtt3GQl6D/jdDsKaWmZ8YSixZNuGGgNqJ
 heIQ==
X-Gm-Message-State: APjAAAV1g+qyRNr6nWmjIjCVgS+F6zbyb0dA/HQ4CDk5E5VECdtCF4by
 MtqJJ2/Qj2RJPICPBbLMi981towazqVh9seotRs3dw==
X-Google-Smtp-Source: APXvYqy3z0HX4DXVLbmqCLHEO0G78azZb/rQYT6n/1CugLfbkIl4Xf0jTaD5qQ+EtxTNAqZxSzo2hRNMyh15TsUf7N0=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr10742225oic.48.1583146944865; 
 Mon, 02 Mar 2020 03:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20200226172628.17449-1-eric.auger@redhat.com>
 <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
In-Reply-To: <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:02:13 +0000
Message-ID: <CAFEAcA-2DJ_Bw2NhWtJdNugkHKwAHmxiFv+tGO_y9wRm8aCp4A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 17:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Eric,

> Patch is easy to review but code not. By inverting the if() statement I
> find the code easier to review.



> SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num)
> {
>      SMMUPciBus *smmu_pci_bus =3D s->smmu_pcibus_by_bus_num[bus_num];
>      GHashTableIter iter;
>
>      if (smmu_pci_bus) {
>          return smmu_pci_bus;
>      }
>
>      g_hash_table_iter_init(&iter, s->smmu_pcibus_by_busptr);
>      while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) =
{
>          if (pci_bus_num(smmu_pci_bus->bus) =3D=3D bus_num) {
>              s->smmu_pcibus_by_bus_num[bus_num] =3D smmu_pci_bus;
>              return smmu_pci_bus;
>          }
>      }
>
>      return NULL;
> }
>
> What do you think?

I think I agree with Philippe here -- the current code is already
a bit confusing in that it looks at first glance as if the "find
the bus in the hash table" code works by falling through into
the "we already had the cached value" code on success, but in
fact the success case is dealt with by the return in the middle
of the while loop and it's only the not-found case that falls
through. Adding this patch on top fixes the bug but leaves in
place the odd code structure that caused it. Rearranging it as
Philippe does above makes it much clearer what's happening,
I think.

Would one of you like to submit a patch that does it that way
round, please?

thanks
-- PMM

