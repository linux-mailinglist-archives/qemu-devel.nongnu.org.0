Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333F402328
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 07:57:10 +0200 (CEST)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNU6X-0004lu-3C
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 01:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNU4x-0003Kl-OQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 01:55:31 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNU4v-0006ij-KJ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 01:55:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id j13so12240198edv.13
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 22:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ega5jPfKxmnHGIGRVxSOPSifvVYLPtqjJKz8bX6MVIg=;
 b=shyKF+Amr/0wyNMUd3QIYJK7XqQlWLVv/gVHW39ZoTG7dIWf2XR3nOtrBzocwalV1K
 zeDOhqJxsDNSEcc9SQ60q1WpPg0cygq9duFZZsUmUtPU49SKiQWGX1qWkBO1VS5t5aCr
 THk+ZkKAB5KEeMr7QuuYLu1dKyRxErYWJhvE0V9C4TtS4dJr87EdqrMBL801X4JfCXVW
 ImMdG5iI1vrKoSwESUX9isQvzNR4RmsUNnMVZsDn04VmtkyioVUIOk65FZG5Qcu+aCOb
 SIkJxLSVVGiGI7uRZJwzXMBXBSzsMU5JGZtFqX1+jqXdYfid2D2cKaPUIZhCOHxxcFL3
 br4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ega5jPfKxmnHGIGRVxSOPSifvVYLPtqjJKz8bX6MVIg=;
 b=oHu7Pd7tHoP4p6bMecBfepyGvkKdfbZEz87RUeYnCnc5vDHwGdIVPd3VEudMKm9K5E
 6RP4UBvfiGfPBfDMuPbPYsL67FUEG6cm4sZDOCc4PPLFqb/vz52eWv0flFkeBlT0kWPa
 2AX4jB3wCg47kabbOTSVT472SI3rOZz5MFGn9pm7QluB228kQhcP2KPRqjRf/tkYXCUz
 oq0SOHTraj1tgZxv334G2tVAt/aBsm56YPl+WOgP+RvyYgzcsIVinz4eEYioOBSQk+3k
 87YTwhDMkXErvJJHSMzqIiz4sT/GlZFHdV7gNJ3s2F0BTu87nJkk4T4t8czJZVy9lfWN
 F0Cg==
X-Gm-Message-State: AOAM5307JZ/EfrlEO0H1XQ9ZsCmX6aSbCROGYspahr7CyBlyp6swBaRQ
 LxKgVV+cMtUIKdm6nU4KDgbUdyX149IqSQPkk0exzw==
X-Google-Smtp-Source: ABdhPJxxGDiATv3B7LwFIz9eGlxZ4KOSXCZXVm+4r+MdwglYq1iagPhg6HUYtcZvfilX8UU3UUFdI73bsIumR41r1ew=
X-Received: by 2002:a05:6402:1cb9:: with SMTP id
 cz25mr17079707edb.11.1630994126902; 
 Mon, 06 Sep 2021 22:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
 <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
 <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
In-Reply-To: <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 7 Sep 2021 11:25:16 +0530
Message-ID: <CAARzgwxXCJ_a4Z-x0Bc_4PV_pEScxr2fp0cMxRf49BiZUvQ9dA@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Sep 6, 2021 at 4:19 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
> >
> > On 9/6/21 12:03 PM, Ani Sinha wrote:
> > > On Mon, 6 Sep 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > >> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
> > >>> From: Ani Sinha <ani@anisinha.ca>
> > >>>
> > >>> Currently various acpi hotplug modules like cpu hotplug, memory hot=
plug, pci
> > >>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is t=
urned on.
> > >>> This brings in support for whole lot of subsystems that some target=
s like
> > >>> mips does not need. They are added just to satisfy symbol dependenc=
ies. This
> > >>> is ugly and should be avoided. Targets should be able to pull in ju=
st what they
> > >>> need and no more. For example, mips only needs support for PIIX4 an=
d does not
> > >>> need acpi pci hotplug support or cpu hotplug support or memory hotp=
lug support
> > >>> etc. This change is an effort to clean this up.
> > >>> In this change, new config variables are added for various acpi hot=
plug
> > >>> subsystems. Targets like mips can only enable PIIX4 support and not=
 the rest
> > >>> of all the other modules which were being previously pulled in as a=
 part of
> > >>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 =
needs but
> > >>> are not required by mips (for example, symbols specific to pci hotp=
lug etc)
> > >>> are available to satisfy the dependencies.
> > >>>
> > >>> Currently, this change only addresses issues with mips malta target=
s. In future
> > >>> we might be able to clean up other targets which are similarly pull=
ing in lot
> > >>> of unnecessary hotplug modules by enabling ACPI_X86.
> > >>>
> > >>> This change should also address issues such as the following:
> > >>> https://gitlab.com/qemu-project/qemu/-/issues/221
> > >>> https://gitlab.com/qemu-project/qemu/-/issues/193
> > >>
> > >> FYI per https://docs.gitlab.com/ee/administration/issue_closing_patt=
ern.html
> > >> this should have been:
> > >>
> > >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
> > >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
> > >>
> > >
> > > Ah my apologies. Will do this next time.
> > >
> > >> Can we close these issues manually?
> > >
> > > Since both you and I have verified that those issues gets fixed with =
my
> > > change, yes we can close them. I do not have a gitlab account. Should=
 I
> > > have one? Is there special permissions needed to handle these tickets=
?
> >
> > Since you are listed in the MAINTAINERS file, long-term you'll
> > eventually use it anyway (i.e. to run the CI pipelines before sending
> > patches, to subscribe to the 'ACPI' label to get notifications or
> > comment ACPI-related issues).
> >
> > The process is quite straight-forward, once having an account you
> > simply request to be member of the project via the WebUI then you
> > can help triaging the issues (and closing these two).
>
> Hmm. I created an account and added a comment to the tickets. However
> I am unable to close them. I requested access to the project.

I could be wrong, but I think only reporters can open and close bugs
like yourself on gitlab.

