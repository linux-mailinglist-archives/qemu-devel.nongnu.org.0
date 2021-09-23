Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE0415C26
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:45:11 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTME2-000318-Da
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMAz-0006HL-KC
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:42:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTMAx-0006CG-KK
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:42:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t28so2456496wra.7
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NOZnnYyGpWEW51WXd6nrKYJpZ7o2sT3xFQtWxmfjndU=;
 b=MVAaOEj7MtCCWRXA69xRYMU72SR+Ov5KydBrTqzQjM2lXGrp4/g+lq0rmvliH5bjrl
 g6xZa1t24sVfhfLwcS7pCV6dpL4a+seG+G7E4fWt9kFPb3HFm6Lvm3IJftXpbqlmsNcr
 CTWBwNE3USakWK0lJYdeMG/e2S0oIJDu/dtzjt+03ffkIbr5pPPXvaK8tVTmqwuqE21u
 Tt5HOwvZYontnS+VCsXtWfLQeHtCDdLn0WWEtTiNQ584tvb9AkeBAltaXmDEgYZiKFv1
 6UcjtBNSVRUjfRw6tMoqo+EK1W+BiZJilM/6bF3OkpW8yzqMZ19frXT4TX6Tb1hAaeSv
 80ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NOZnnYyGpWEW51WXd6nrKYJpZ7o2sT3xFQtWxmfjndU=;
 b=6R/os/TT8xSt2idKsJUrCCIl82tAqYF8NMOYuq8x06CYG6ySDzV5lsSSnRH65Yp3yn
 G4suf99QbMJtTXyJAIbrzIloJPWXG9qIFpRVDQCMG5UfzSBRa140xHCxl7nx2wLijFJ4
 EEmvp0Xdc1p6SqNC+NVzkA0ot1H9YxgX5o22ruNSd4VxJy1MD/Mpt3jNdR0sx1vvrNUq
 ZZj99Yi82/HuqaCVAwnLLXpziqEwvxqr9zBaNubvw+eEs7QuIOVqq+nHXua0CYKgbcSW
 CzbpwcFc2amDxHYCr51Uz3OK/IEfI5OdEBREpJocJGOtYTeo7aTP+nZ7g41op2To2ncA
 NhUA==
X-Gm-Message-State: AOAM530Pg2ciKhVag2PSf2h0iZSZSrs1fv5l9Q2wWn3+LxyPMPic3Jt0
 1IFTpGuM7m6Hoz2qrjFEez20GmNT6ZsxbCtDbBJVPA==
X-Google-Smtp-Source: ABdhPJwuW+5/aURJ5RG6a2DoELZZtMSRRqLXoK0K2PclO3Ml5Bh23pFwidsnKCvbflXKnGPy2//bnzgV2Tay9spTG2M=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr15311248wmi.37.1632393717980; 
 Thu, 23 Sep 2021 03:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
In-Reply-To: <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 11:41:05 +0100
Message-ID: <CAFEAcA9aZ3HXmHc12X58N5k=1dfk6SZWEU9Uf1ErajNj0EHWxg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 11:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
> >> +
> >> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
> >> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
> >> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
> >> +                        DEVICE_LITTLE_ENDIAN);
> >
> > It looks like serial_mm_init() does one more thing:
> >
> >      qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
> >
> > I am not sure what that is.
>
> I'll defer on Paolo / Marc-Andr=C3=A9 for that part, I think this is for
> migrating legacy (x86?) machines, which is not the case.

Yes, this is only needed for backwards-compatibility of incoming
migration data with old versions of QEMU which implemented migration
of devices with hand-rolled code. If a device didn't previously
handle migration at all then it should not now be setting the
legacy instance ID.

Speaking of migration, I notice that this QOM conversion does
not add a vmstate, which usually we do as part of the QOM conversion.
The device is also missing a reset method.

thanks
-- PMM

