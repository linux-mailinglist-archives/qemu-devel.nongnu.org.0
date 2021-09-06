Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA44401A2C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:52:33 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCEq-000735-Q3
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNCBy-0003Vu-Bz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:49:35 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNCBn-00027P-Pz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:49:34 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n27so12669288eja.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iKyctzVGVAx+r/IQtog0pbBZcwOp3gzn2JRmZuxlSM0=;
 b=uTpQLFu/UNmm7nZp4CHqyJQe3Vkq/lerEFnudz/55GeuLInA0th1us/nU3v/cjvxUE
 JcgVkC183X3oX/oYPxeyQgB8M3n0qlLhnCWRUMW7svZCJLCMhVGPYdChCr8aP3ZMMi/g
 5MwmdlgolSbRn2qRhoZWHuTk3uVtqUQcuWYKvSyDQS7m3CJbd4OdvdmExqeXriQBWC3U
 eDj64z2AGYCMrUcnuk0AFKNDazOZTHrj1d9G4m9kmnl08AKbIpnrd5bfyc4/Rn0B8sn+
 kxp6RqJpKTlzE04YM3nOxeZK4C3dYoh8jCVeNax4vFV3RZEI7S7M7psX46YcGo3Lgi59
 xP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iKyctzVGVAx+r/IQtog0pbBZcwOp3gzn2JRmZuxlSM0=;
 b=ObM5328busqUqKIrJx8BjgInOgkOcNmFubffTBY9T2gYhJW7oIcFxDdRjFF60SyeLD
 3sj+nKPBM/AimXfaKsUAAEXxTIoMw6YSj86Fn6Kml6sfAxWn4KS4veIKYwXV7kRaQ+vT
 Kvyv8QY5QkzPuh/qrAsOvdJUsGPGjG2R/pcbzimUDrA+Dgb4uZScxmx5/2Iv2vz2HgBS
 NJtM5vTGOp/7VeTFAxmmJ7DHJWjD8vnoGtBtxqEeHwu5/78aty063VcOYvyre8Bwnu/D
 IW4I60ZaAKC/X6OMbSkSuHyti87T4y+SpQYVrDyTQ4N6VZkwiVgDkYbWE1CVhUd22aK7
 iu0g==
X-Gm-Message-State: AOAM530dRiXGRXdKWw4sdScg4qd+DuhW/7yMb1CowjAboATWSahsTP4i
 PuEuNkAiU8qxl/FZ+MnblYy1aSdmQJOH9Arc5nYnqA==
X-Google-Smtp-Source: ABdhPJwem4iIn4nA8kCBdMpLxAz2LcGQiFZ1PKxnkGMvv0eh0iFx/Z1bsxA/IXqsK2gm/yeK7DAImUZNI5HubjLc2SQ=
X-Received: by 2002:a17:906:6b96:: with SMTP id
 l22mr13163166ejr.430.1630925362044; 
 Mon, 06 Sep 2021 03:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
 <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
In-Reply-To: <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 6 Sep 2021 16:19:11 +0530
Message-ID: <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 9/6/21 12:03 PM, Ani Sinha wrote:
> > On Mon, 6 Sep 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
> >>> From: Ani Sinha <ani@anisinha.ca>
> >>>
> >>> Currently various acpi hotplug modules like cpu hotplug, memory hotpl=
ug, pci
> >>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is tur=
ned on.
> >>> This brings in support for whole lot of subsystems that some targets =
like
> >>> mips does not need. They are added just to satisfy symbol dependencie=
s. This
> >>> is ugly and should be avoided. Targets should be able to pull in just=
 what they
> >>> need and no more. For example, mips only needs support for PIIX4 and =
does not
> >>> need acpi pci hotplug support or cpu hotplug support or memory hotplu=
g support
> >>> etc. This change is an effort to clean this up.
> >>> In this change, new config variables are added for various acpi hotpl=
ug
> >>> subsystems. Targets like mips can only enable PIIX4 support and not t=
he rest
> >>> of all the other modules which were being previously pulled in as a p=
art of
> >>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 ne=
eds but
> >>> are not required by mips (for example, symbols specific to pci hotplu=
g etc)
> >>> are available to satisfy the dependencies.
> >>>
> >>> Currently, this change only addresses issues with mips malta targets.=
 In future
> >>> we might be able to clean up other targets which are similarly pullin=
g in lot
> >>> of unnecessary hotplug modules by enabling ACPI_X86.
> >>>
> >>> This change should also address issues such as the following:
> >>> https://gitlab.com/qemu-project/qemu/-/issues/221
> >>> https://gitlab.com/qemu-project/qemu/-/issues/193
> >>
> >> FYI per https://docs.gitlab.com/ee/administration/issue_closing_patter=
n.html
> >> this should have been:
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
> >>
> >
> > Ah my apologies. Will do this next time.
> >
> >> Can we close these issues manually?
> >
> > Since both you and I have verified that those issues gets fixed with my
> > change, yes we can close them. I do not have a gitlab account. Should I
> > have one? Is there special permissions needed to handle these tickets?
>
> Since you are listed in the MAINTAINERS file, long-term you'll
> eventually use it anyway (i.e. to run the CI pipelines before sending
> patches, to subscribe to the 'ACPI' label to get notifications or
> comment ACPI-related issues).
>
> The process is quite straight-forward, once having an account you
> simply request to be member of the project via the WebUI then you
> can help triaging the issues (and closing these two).

Hmm. I created an account and added a comment to the tickets. However
I am unable to close them. I requested access to the project.

