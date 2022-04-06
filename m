Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4024F6B71
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 22:29:29 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncCHO-00022i-VO
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 16:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncCGX-0001MT-Fk
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:28:33 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncCGW-0001Rz-12
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:28:33 -0400
Received: by mail-yb1-xb31.google.com with SMTP id d138so6009303ybc.13
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eYvqeAjOgeGc+YG5DsEZ27Jw8lzgwU2BLaiun8eA2mk=;
 b=c4dCOxhpcpPiQXytJgBV2LXiZHSZYD2DbZp+RHgru0fpE/0udn0/Ir/yBKKYMa6dvJ
 1sdhPnqH8xY5itdPRHNtdPhHGNRnbHM4b4v85HX2iw1aJklO3Vg5xqnNRYPGnkw5F2io
 /DTweqWTlg2ig1Y2tCJjmFFBR2c0T77k2aCzjQ9pizjtvGws4DXcENGLq3fVIvXNGgKG
 HlsSRg/zFPMLeCoU9nf9s9MjPxnFDL+vF8BZID2RybooP2W38+23JIz4fe346z7VLahX
 eCyePJdcplkfOj1XdEls5Lvzv1hGDLWFH7h+QxKteNzzTG8lpFuN9O+RvGWdtLZ4UVym
 p+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eYvqeAjOgeGc+YG5DsEZ27Jw8lzgwU2BLaiun8eA2mk=;
 b=BM/sXY/Qc4S6nWC2kv67pX1zUY+VWT6ypV45I4iDdKN8Q89efMwUQ9DXvocgV26pqS
 iGsh4Q0fuq2ghptyIJ4MoZ+TOGPJ6EYIBhmYyfzefEGhjaELtWA7u/5UDtqMnZDG6GrL
 cGtc9zsxctAC0ZDrqUZ2tm/JHhHFdMRF0oTkmkjSA58fxu/C1s6NuOF3ieo8Hik9bKT7
 jHRrb13EgF1AE9DEjW12iyhkk55gUSrqeaTKJjugLGFFiM0oPfwerir6K+CH8kGroHvj
 KIvFIB9+gyAxNy/iQGZ6jeCGpIqrHCyRQfxCGtpn4qWbXjofXa0V+d34l+ilOCHT1L1/
 UbGg==
X-Gm-Message-State: AOAM5333jt8cRgmWAGe8lnymgfUXiDCePaGKyCD7aWN+2Yx9qNog8kdv
 6CcWPHIeFiZlJOFglsYK5MJzhsPs2giYDYEoCoC1vA==
X-Google-Smtp-Source: ABdhPJx0pJvw57kt0Np5GGJV5ejbCsjIIbMl6YJUk78WKC1ze13yfDlE+Af659yJVPlhWfLxZOAkYsDSBS18WlCoHoE=
X-Received: by 2002:a25:3d0:0:b0:63d:c88a:fafa with SMTP id
 199-20020a2503d0000000b0063dc88afafamr7635328ybd.479.1649276910990; Wed, 06
 Apr 2022 13:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
 <CAFEAcA-iFROkDQ=myCjbBxo5jJKqwCjQb_3tbANYdeNk=YizLw@mail.gmail.com>
 <87wng2ht6c.fsf@linaro.org>
In-Reply-To: <87wng2ht6c.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 21:28:20 +0100
Message-ID: <CAFEAcA_ecAbd1EucBG=Hy82E7VLcaYkt=_2k5VK=ZpmY-6_O3g@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 21:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Guest memory is generally zero at startup. Do we manage to
> > hit the bit of memory at the start of the virt machine's RAM
> > where we store the DTB ? (As you say, initializing the data
> > structures is the right thing anyway.)
>
> I don't know - where is the DTB loaded?

Start of RAM (that's physaddr 0x4000_0000). The thing I'm not sure
about is whether these qtests go through the code in hw/arm/boot.c
that loads the DTB into guest RAM or not.

> Currently we are using the first
> couple of pages in qtest because that where the qtest allocater is
> initialised:
>
>   static void *qos_create_machine_arm_virt(QTestState *qts)
>   {
>       QVirtMachine *machine =3D g_new0(QVirtMachine, 1);
>
>       alloc_init(&machine->alloc, 0,
>                  ARM_VIRT_RAM_ADDR,
>                  ARM_VIRT_RAM_ADDR + ARM_VIRT_RAM_SIZE,
>                  ARM_PAGE_SIZE);
>       qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_BA=
SE_ADDR,
>                                VIRTIO_MMIO_SIZE);
>
>       qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);
>
>       machine->obj.get_device =3D virt_get_device;
>       machine->obj.get_driver =3D virt_get_driver;
>       machine->obj.destructor =3D virt_destructor;
>       return machine;
>   }
>
> I don't know if there is a more sane piece of memory we should be using.

The first part of RAM is fine, it's just you can't assume it's
all zeroes :-)

-- PMM

