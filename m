Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D7697E7A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:36:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIsF-0003QW-H9; Wed, 15 Feb 2023 09:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pSIsD-0003QI-ST
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:35:05 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pSIsB-0004iO-Pd
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:35:05 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-52ecd867d89so225725677b3.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pt9QhESv7UHV8Dr4T4zW42CNStM7yC+Nx0xqXydCZ7w=;
 b=IyvGHKHKFuBhQXjCAp5pKPBob0bWPsGvbE9aMRgFcN9Rg06INWBUZKnqqQzA77pMBe
 nCkL36fc2N+gqQDXJoxurXlM7Y8jhTsVibL+OiupP8cgnh3FvqKGFPzOm7AihKJREkuM
 XBOiutEEKrJ6tVic6Ej7hFXXlgrJcOgqNcZUDQtEVBjHxod1OWT4ODAUkw52Hy74hRiE
 komw3q/pnDpfEP24h3JvWuBqrxuxm8zBrU6KOT/0JdDeHxFXVVZCAE+qD33KsVIgtpB3
 j0Ulg1YDIajuoL15OmDLgTZWgvHTu7j0webFM/y2KrG1Mke5pDF+uJWho8fFw+ncPZ1p
 Q3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pt9QhESv7UHV8Dr4T4zW42CNStM7yC+Nx0xqXydCZ7w=;
 b=6ApDo2ZgtxNxIIBd0p79Tt8KIyPyzuFRCAe7n5K5+9QpE2mesZTyP4L6QNMjLANyV1
 RZyxPNchNIY7fJLay+Zp6yaGFLayOwHEAdX3BQ3APaB0WnZCyM5Nn846GQ8relXE7a3d
 0DQKAMZ2j13F8AyjP5Z9gdh5Rv8ygQ5RYCndI/JtxS2uR5Fs5EvS5BBUtgH0UPrFahFX
 MilK83iqbYZDzZOq14NV+5HJceImgq/Beuu4lalayPsR/PXm88888noMI/7HSZTp3q0d
 mWgfMuv5oamlsiYMryHYMTrpOTfkF8PwreuCe96y33pzi4C8bZvFEME/pn+C7o0fMpqY
 bu5A==
X-Gm-Message-State: AO0yUKVjw4Dg4+klqfY/bUgokuyBsl5fg93+16jjZrsU4A995oeGcKWZ
 jderG57bOmpu+3qPwueXtC+TO6HVhy4jic0xmKk=
X-Google-Smtp-Source: AK7set/SB+8OuBUeIBDluZ9gedbJ2z8W/So8Z/Ue0NY58CJjx/Geb+iA23vApGj/2mB3OJ7+UFTUAkWiCc2FxOcJ4/c=
X-Received: by 2002:a81:6b84:0:b0:52e:c68a:293a with SMTP id
 g126-20020a816b84000000b0052ec68a293amr281060ywc.274.1676471701257; Wed, 15
 Feb 2023 06:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
 <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
 <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
In-Reply-To: <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 15 Feb 2023 09:34:46 -0500
Message-ID: <CAJSP0QV=UrYyASRddqTX7KbSw_dLPhVgbdORvYx_N+tQa6Nu+A@mail.gmail.com>
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 15 Feb 2023 at 08:45, Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> Hi,
>>>
>>> This commit breaks boot-serial-test on ppc64-softmmu.
>>>
>>>   $ ./configure --enable-tcg-interpreter
>>> '--target-list=3Daarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
>>> m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
>>> x86_64-softmmu'
>>>   $ make && cd build && QTEST_QEMU_BINARY=3D./qemu-system-ppc64
>>> ./tests/qtest/boot-serial-test; cd -
>>>
>>> (Yes, the full --target-list is needed because boot-serial-test isn't
>>> built when only ppc64-softmmu is selected.)
>>>
>>> Here is the CI failure:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22
>
>  I reproduced this failure and got "Out of malloc memory" error message i=
n the [openbios-ppc](https://github.com/openbios/openbios/blob/4a0041107b8e=
f77e0e8337bfcb5f8078887261a7/libopenbios/ofmem_common.c#L134). However, I'm=
 not sure how to debug this. Have you run into this issue before?

I don't. Maybe Gerd has an idea?

The memory allocation may be because there is either a request leak or
additional USB activity as a result of this patch.

Stefan

