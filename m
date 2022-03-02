Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2DC4C9D0F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 06:15:25 +0100 (CET)
Received: from localhost ([::1]:45016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPHKe-0002Tq-KD
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 00:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHJY-0001FP-S8
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:14:17 -0500
Received: from [2a00:1450:4864:20::62f] (port=38491
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHJX-00039a-ID
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:14:16 -0500
Received: by mail-ej1-x62f.google.com with SMTP id r13so1292547ejd.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 21:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qb1OwIEZgDtZoKRs5V3fAcZLAOJCYYa2qtv+vMfGTJ8=;
 b=hKyAK+lEO4EBHVrO5QXefxOkAUbRvrmGMbAbLN+9sFIX8tOEukhSVET2wJIhwgrbCs
 pnEFAUyzNZjB69Fwuu4edBxGJFx0ndBWXsMYheiCa0wSO//BV07D1t7TNKx3RbLn70qq
 UyjYV/Q9KplzZkb43nJCBfDbYE3BJzxAEQJzh4iaqqJxIJm4hsoMhstYVfThY9VYrKZS
 sHgnkZbtIEPUceQqcz9ERzplCEnyYGrBTVMV/8dWE6rN0xBS79gjSYgRm7kk/QYNI2KO
 na7CrABrz9G0cxPf3qzX2II5jmNPzwMdJlmqsz5RiWDLxW476SygiwR04CVEr3XNuNPb
 f9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qb1OwIEZgDtZoKRs5V3fAcZLAOJCYYa2qtv+vMfGTJ8=;
 b=rGuM0AhuRnG3KrTDN/Xld3v56UbKAnihJv6Fdc8RMNY3f/weG1wUjTMdldizqrdKZs
 7n7DSl4FZlY3a633nU6gDoGhPMQuvLJ0QQx4TfjJBsnrpjh1M5Opan6m0t3OA/H21/jn
 mm8snZPxEAUdVvCq9Tmtw0IZ8apM5UyzDnkJsyzGUJ1qa46PC7itdkkIHloQG00bItu0
 adj4NvdBp0GgU2BmTaoSakW8FqRJi5n8nUty8rHfNMEvmdXmFUmIOxvlwE649LMz+zfM
 Vt/UUKTl9I7x5sAmf0Z84P4Sxnf0sbO+6ETILuimZmmpCKSyBCOyS756j45o3DHhuHWg
 6IAQ==
X-Gm-Message-State: AOAM533xbVvoreX28dPGdGyIaTZdWE1VBwdSnrUZ3hihOQvqENxPaj9R
 Ay3cdLzFpUQnds/VMzbht32BVMy8QW/NhM0WLGwvCg==
X-Google-Smtp-Source: ABdhPJyu5Dc9X9jdGK/t539EFosnE1eVX3IY/g2HE66Gzp1HjFb2HD0s3kYaV8AjWeR6m22WL+pc657+d35VFgosf9Q=
X-Received: by 2002:a17:907:8a25:b0:6d7:d59:6912 with SMTP id
 sc37-20020a1709078a2500b006d70d596912mr3535481ejc.259.1646198053966; Tue, 01
 Mar 2022 21:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
 <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
In-Reply-To: <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Mar 2022 10:44:03 +0530
Message-ID: <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: Liav Albani <liavalb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62f.google.com
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
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 2, 2022 at 12:50 AM Liav Albani <liavalb@gmail.com> wrote:
>
>
> On 3/1/22 11:52, Ani Sinha wrote:
> >
> > On Tue, 1 Mar 2022, Igor Mammedov wrote:
> >
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
> > Igor is correct. Although I see that currently there are no 8042 devices
> > for microvms, maybe we should be conservative and add the code to detect
> > the device anyway. In that case, the change could affect microvms too when
> > such devices get added in the future.
> >
> >
> > echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
> > -monitor stdio 2>/dev/null | grep 8042
> >
> > <empty>
>
> What about this?
>
> echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> -device i8042 -monitor stdio 2>/dev/null | grep 8042
>
> Or this?
>
> echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> -device i8042 -monitor stdio 2>/dev/null | grep 8042

On both occasions you are explicitly adding the device.

