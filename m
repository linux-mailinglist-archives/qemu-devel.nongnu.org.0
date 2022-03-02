Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397874C9D0A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 06:14:42 +0100 (CET)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPHJx-0000z4-BP
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 00:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHIX-0000Hi-9p
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:13:13 -0500
Received: from [2a00:1450:4864:20::52c] (port=41910
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHIV-00034k-Ro
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:13:13 -0500
Received: by mail-ed1-x52c.google.com with SMTP id w3so655402edu.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 21:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUbnFTBahod5oiK6yNiT4YVI8MG8f5gk70ffziMlmWE=;
 b=VgSBLShoTThUxCPcveb35NDl7sEeEJiSCpQNUeVbkqkRbvVHqo8MXU0NE+zh6QCvVW
 2S/p8QX+2+j9mqA6DHUITyiM/PTtMpqWvPRxymxQFImX3tlGtEi7FfqKzsAmSS5kTYzd
 8gLZGcum0z+8DtNIkSWUQRTsVewJuzaEr45vjZPY4bR48dh6L//gi0PUN+81fZdh4BaL
 WFqDOpfD0o3L3I0dczehy4f7fagkMRGblKhGqnOk8mGM5l8gI/fImCTRUJo0wbSp/Nza
 72F+NAyadsET6Jmj3kCkgHzgx1VzOBXvZ5P+UrGlE+uuolZVpRMpE4aS7YoT0F03lWmW
 wVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUbnFTBahod5oiK6yNiT4YVI8MG8f5gk70ffziMlmWE=;
 b=5YynxeQ1FFM3X/3eFhDRNR/a+yu01SWlRgjtj5CMWRtRcydfOaGynFVKc36w8WrgUB
 7o3cv+r3uuZoPfWMIqQxNUQzFJE1nDWwTU/Cz1CvEYQfpi7978wNVLE//8UYBSTZA8lO
 kVzkOsVvIgMyMPsHZDpMATZfVrCkmBAE87f3PnBFFlU/MB3Smm1/sZ1GJBSdgpJ0xK2S
 Or9kk0M4kmrWvPudIA2HSnkeQlHp69CA08E27wC1kCTG/k5X4XT3AU1kouqmKd/wMfkf
 puOpq42ZfIgopMq8jmw5aIolAG8dk9XY6s0ojKSflB0h/1c2+j7W1pobs9roJr+ds3yK
 1VVg==
X-Gm-Message-State: AOAM533xnuTiyYAjlvehKbWwtksMdHSRelFOneb1ts4zWeQuaJi5+jDd
 Hjr1/o3NV0zaU6aneEbda4EZqw150AmGZgqv5AA0yg==
X-Google-Smtp-Source: ABdhPJy59+r0kZZfuamVuWw9t6WNuLOnf2BHTTY+lluA1/tx7phmB8lKgheBlVZeasbglBlqZRWxD3ZHb2fTQtztDCM=
X-Received: by 2002:a05:6402:1e8e:b0:412:cfd8:4d12 with SMTP id
 f14-20020a0564021e8e00b00412cfd84d12mr27288024edf.343.1646197990253; Tue, 01
 Mar 2022 21:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
 <b6934751-f513-d9b9-ae2e-106a736b3f57@gmail.com>
In-Reply-To: <b6934751-f513-d9b9-ae2e-106a736b3f57@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Mar 2022 10:42:59 +0530
Message-ID: <CAARzgwxXkcpv=HY0nNzMDMfQxVKw3-AUnP1M1vvFEzTJQQdSFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Liav Albani <liavalb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, shentey@gmail.com,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 2, 2022 at 12:41 AM Liav Albani <liavalb@gmail.com> wrote:
>
>
> On 3/1/22 13:19, Michael S. Tsirkin wrote:
> > On Tue, Mar 01, 2022 at 09:43:54AM +0100, Igor Mammedov wrote:
> >> On Mon, 28 Feb 2022 22:17:32 +0200
> >> Liav Albani <liavalb@gmail.com> wrote:
> >>
> >>> This can allow the guest OS to determine more easily if i8042 controller
> >>> is present in the system or not, so it doesn't need to do probing of the
> >>> controller, but just initialize it immediately, before enumerating the
> >>> ACPI AML namespace.
> >>>
> >>> This change only applies to the x86/q35 machine type, as it uses FACP
> >>> ACPI table with revision higher than 1, which should implement at least
> >>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> >>> flags register according to the ACPI 2.0 specification.
> >>>
> >>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> >>> ---
> >>>   hw/acpi/aml-build.c         | 11 ++++++++++-
> >>>   hw/i386/acpi-build.c        |  9 +++++++++
> >>>   hw/i386/acpi-microvm.c      |  9 +++++++++
> >> commit message says it's q35 specific, so wy it touched microvm anc piix4?
> >>
> This affect only q35 machine type for now, but what happens if the
> MicroVM ACPI FACP table is updated to use a revision that supports IA-PC
> boot flags?

microvm FACP table uses version 5. See function acpi_build_microvm().
It supports that flag already. What Igor was trying to say (and he can
correct me if I am wrong) is that lets address microvm when the need
arises, unless we already envision today that we would need IA-PC boot
flag update even for microvms in the near future. In other words, lets
not touch microvms if we do not have to, at present.

