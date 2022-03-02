Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494774CA9BE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:00:35 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPROz-00066o-Ui
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:00:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPRNI-0005Re-JK
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:58:48 -0500
Received: from [2a00:1450:4864:20::529] (port=33509
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPRNG-0006eH-S1
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:58:48 -0500
Received: by mail-ed1-x529.google.com with SMTP id s14so2938047edw.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9MagHOUxsEN5CT63CbPh1wrLpf5FTDCD1AxaTpwTqo=;
 b=5LFlCWw7QYMglW7xRl+DkF+r1N198duLq9+4WTP+I2udrcwoG2Q3Pov5zWvhKYNK6B
 caBjpss6gg73y8wzkjXXJlW81KEGQMOeLtKPBCuQd9i9EC1z+dLQzWOTsAZgs0jgEgb+
 MEXzJVE8sSbuJk36GrMcuz5kGTQMs8UpOQpODWzRj7ZE6zX58czPdJ3aJs0AwA2o94WE
 36g3ZYCuu0jYOpqPNm6fy4ayq6DFfMPsARPtG6Ks4XwYOH45GMR9YYlL7Gb/iG/W4DvN
 OrvRwNCPLaQBEpZjP7PxtDjW51I2bk0VCIl0twAersVuiFE9GQiIk/6udJYhVT58lPVo
 RfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9MagHOUxsEN5CT63CbPh1wrLpf5FTDCD1AxaTpwTqo=;
 b=wxTPD95j6nmSVZBo9ZDYm4xWB4CRigj5oF3IR6QMFIxrgcgLJ5y/nimJGgw0nowkLg
 j/fF6IvpARrCcaBsgYxUXvBXeyRQm6lYiZ4pqb3RX5G79RF//l5lJishnPb+gzqHXtNo
 /dLFGkIjL8wEa1ANxz5Zps2RniBSRDo5luLJv1qmLvy2eh9WGimYi4Va45ox75VdM/Cj
 terkom9/9gFU754iog7daVG58BU9wnc9jiNGsnJQtp6nPMJbODEK3lca/bOUJv/QAY97
 uNWVVMmkiD6FGYH5AT89ZCkGVOyqriMKumhW9VdHAjCqZx425HbYvQhYIOsJIxl6zxKh
 y8Lg==
X-Gm-Message-State: AOAM533khbeRu3yBmxAGGgC8ZiVt2445UOn6bCwNiruK5eAqSyK1J8Wy
 3gfyeWo+/uW1nRp7Tl2fFKa8dGsopt50OnKR2Kth/A==
X-Google-Smtp-Source: ABdhPJwZF5et9xrMOj/JAKw6HnJgKd/ZlHZ4MI55QqX734YLqeVpLmo28vm/z0kGyl83yvBQwgTmoMBs1b8A1yisTYg=
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr30064513edw.113.1646236724950; Wed, 02
 Mar 2022 07:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
 <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
 <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
 <20220302074022-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220302074022-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Mar 2022 21:28:34 +0530
Message-ID: <CAARzgwyQa1gs5SHW=91hGWaFxWoH-EuX77X9yTK1-LcPShu1aw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x529.google.com
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
 Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 2, 2022 at 6:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Mar 02, 2022 at 10:44:03AM +0530, Ani Sinha wrote:
> > On Wed, Mar 2, 2022 at 12:50 AM Liav Albani <liavalb@gmail.com> wrote:
> > >
> > >
> > > On 3/1/22 11:52, Ani Sinha wrote:
> > > >
> > > > On Tue, 1 Mar 2022, Igor Mammedov wrote:
> > > >
> > > >> On Mon, 28 Feb 2022 22:17:32 +0200
> > > >> Liav Albani <liavalb@gmail.com> wrote:
> > > >>
> > > >>> This can allow the guest OS to determine more easily if i8042 controller
> > > >>> is present in the system or not, so it doesn't need to do probing of the
> > > >>> controller, but just initialize it immediately, before enumerating the
> > > >>> ACPI AML namespace.
> > > >>>
> > > >>> This change only applies to the x86/q35 machine type, as it uses FACP
> > > >>> ACPI table with revision higher than 1, which should implement at least
> > > >>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > > >>> flags register according to the ACPI 2.0 specification.
> > > >>>
> > > >>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> > > >>> ---
> > > >>>   hw/acpi/aml-build.c         | 11 ++++++++++-
> > > >>>   hw/i386/acpi-build.c        |  9 +++++++++
> > > >>>   hw/i386/acpi-microvm.c      |  9 +++++++++
> > > >> commit message says it's q35 specific, so wy it touched microvm anc piix4?
> > > > Igor is correct. Although I see that currently there are no 8042 devices
> > > > for microvms, maybe we should be conservative and add the code to detect
> > > > the device anyway. In that case, the change could affect microvms too when
> > > > such devices get added in the future.
> > > >
> > > >
> > > > echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
> > > > -monitor stdio 2>/dev/null | grep 8042
> > > >
> > > > <empty>
> > >
> > > What about this?
> > >
> > > echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> > > -device i8042 -monitor stdio 2>/dev/null | grep 8042
> > >
> > > Or this?
> > >
> > > echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> > > -device i8042 -monitor stdio 2>/dev/null | grep 8042
> >
> > On both occasions you are explicitly adding the device.
>
> Yes of course.

OK. I did not think for a "microvm" one would explicitly add more 8042
devices beyond what was added by default in the real life use case.

