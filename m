Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACD55BFCC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:32:52 +0200 (CEST)
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67aV-00052F-Vu
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66f6-0004gG-2Y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:33:33 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66f1-0005EV-AL
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:33:31 -0400
Received: by mail-ed1-x534.google.com with SMTP id c13so16446493eds.10
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gxi2VzvXgssDm6xVeDSQFVzjIYkJFlL5XrgLWss/tlY=;
 b=lTi4obaq6CyAPg7Gncrkgam5VCcmsz7ALFHp+9HcJnN2iJIGUdt8Cd+Xf1k85E8007
 r4Jh6YquODTLGLXFyh2lsL7kmJ9sAB9tuZPcctPztkSAoehoE+bNozQavbuy0JZGx3UJ
 t2EansKmZK8oj9SphkDeSvaU7ZXZz4buBn1EtaoACNOzORMyofoPvkYA3zzwcc6NgPkN
 /7g3xsetyvaKhb2CoptM1rnHucDSDc1m2dPJNx9t7qMBUtK8roXX+oKrFPeRodDnpkdK
 y5gfjR8jaDcod7IYydbwexhpLY8puCPxFRuuWpG2w0Cu5HXvHYgy+GlqaL7M7fnMa4cN
 jYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gxi2VzvXgssDm6xVeDSQFVzjIYkJFlL5XrgLWss/tlY=;
 b=GRBxl+uT0ElrpimlFNTorzCvlXqAapydG/G1Pd5U5T3jY1cixZwklk1nQ3EcNUlYn1
 yM63+/+gEdz4J4QmVyN6GRhvAYUsUHLL+8OicQAQpNUUqQBm1j7Kv9ngEI+esbzQGWXP
 UlpXgYwMPVdsCsB8NIFG7XNkrjIgkfQcEr/G96WU13jXahYF+ji5biMkcWoP021t1v+P
 uTPXqloDdNolIUBZrEBLCh/ygACAFwuORt7tCwnFb41u8ZNi+Lwl0MacdjtrzzCm+tmx
 lZAqRIe8Ff40FUfRHkFqvZegJNXOhtar9UIkxp+wc96aPWVszEuvYqwOaA/o4i8EknGe
 Te9Q==
X-Gm-Message-State: AJIora9AWC7l4Aj1nSPBC/Fn5jiZfW7RdT6iSYdENr5/tX20sfyFo5La
 mvYtRprwpMnY6IMtui2BMSbp5dqIwGAyi6sYM4q8cg==
X-Google-Smtp-Source: AGRyM1t/zLhjKTkgkOMtfyoc4fnjcdubJuM/EOSqDeWPvYsIhKKD7vIiLx86ON5ICog9sgl43es3ViyoEkt283gm5jM=
X-Received: by 2002:a05:6402:4302:b0:437:7990:992e with SMTP id
 m2-20020a056402430200b004377990992emr17360365edc.194.1656405205756; Tue, 28
 Jun 2022 01:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <Yrq3HUEghZ7IFh//@redhat.com>
In-Reply-To: <Yrq3HUEghZ7IFh//@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 14:03:15 +0530
Message-ID: <CAARzgwzDdQGQ81bNAOg6t=4rhfdkQjunscT+x=sUOEp92R=cmg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 1:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 27, 2022 at 12:58:44PM +0530, Ani Sinha wrote:
> > Biosbits is a software written by Josh Triplett that can be downloaded =
by
> > visiting https://biosbits.org/. The github codebase can be found here:
> > https://github.com/biosbits/bits/tree/master. It is a software that exe=
rcizes
> > the bios components such as acpi and smbios tables directly through acp=
ica
> > bios interpreter (a freely available C based library written by Intel,
> > downloadable from https://acpica.org/ and is included with biosbits) wi=
thout an
> > operating system getting involved in between.
> > There are several advantages to directly testing the bios in a real phy=
sical
> > machine or VM as opposed to indirectly discovering bios issues through =
the
> > operating system. For one thing, the OSes tend to hide bios problems fr=
om the
> > end user. The other is that we have more control of what we wanted to t=
est
> > and how by directly using acpica interpreter on top of the bios on a ru=
nning
> > system. More details on the inspiration for developing biosbits and its=
 real
> > life uses can be found in (a) and (b).
> > This patchset contains QEMU qtests written in python that exercizes the=
 QEMU
> > bios components using biosbits and reports test failures.
> >
> > Details of each of the files added by this patchset are provided in the=
 README
> > file which is part of Patch 11. Every effort to contact Josh, through v=
arious
> > means including email, twitter, linkedIn etc has failed. Hence, the cha=
nges to
> > build biosbits with the newer compiler, upgrade acpica and other change=
s are
> > currently maintained in a forked project in my personal github. We may =
want to
> > maintain bits in a separate fork in a stable repository that is accessi=
ble by
> > QEMU developers.
> >
> > The newly introduced qtest currently only run for x86_64 platform. They=
 pass
> > both when running make check on a baremetal box as well as from inside =
a vm.
> >
> > Thanks to Igor M for pointing me to this work.
> >
> > (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/86=
7/original/bits.pdf
> > (b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> >
> > Ani Sinha (12):
> >   qtest: meson.build changes required to integrate python based qtests
> >   acpi/tests/bits: add prebuilt bios bits zip archive
> >   acpi/tests/bits: add prebuilt bits generated grub modules and scripts
>
> These two files didn't arrive on the mailing list, presumaby because
> pre-built binaries made the patches way too large.

Yes they are over 25 MB and my gmail account does not support
attachments more than that size.

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

