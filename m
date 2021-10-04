Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A16420A32
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 13:39:39 +0200 (CEST)
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXMJm-0004rj-8r
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 07:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXMG7-0002jA-Kg
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:35:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXMG5-00024L-FH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 07:35:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id g8so63745052edt.7
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDoFl1ZY7CPKwOWATCIxKgINldL76VPBxWNcsfnF1X8=;
 b=qsN9+dtAL51sjzhH93bqwU9V2aX/D25LHwW4OBIPcLPylwLzcWy2PYxWUPVHnIrmeB
 fx42PZo27TnYxnXPw2COKPZJEd94o/t29IXnNTmmSMvX65YCCJg8JKi8Wa0ay7Ly0hh0
 f+4OV/JbMy9Yr8OwjJf+TRVjjN2zNQv4iYsqylIZEKGDz2L36/h5SKFNzkuFx9M2TbSL
 8budrnjVGZ8u5Wa5vN0LboaNdKQglzcDTV/T6eX3pEQ2hn06TqdcssoPA9xnWXgPF9A9
 1fIR/fF94Ffw3YjtdGYqPMp/oQzAsO9qPNNZsD8bZPfdhNh0c4P0E/+FcCw8bKkpbkyv
 LnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDoFl1ZY7CPKwOWATCIxKgINldL76VPBxWNcsfnF1X8=;
 b=h1vJD9hLLKlgJBiGLaI9OsuzCr0I0CpqsFDKHHgwoEreyvKY5Wttpyu52iAmqLVTpo
 rEV9FQl4WezslhMiptcnw026yYtG/oWcLVIbysKB9PZgBgmgz+GbhnF0pkh5mXw1NdYD
 UymuXKy2mc+/G/fmtd+12aTHViIN97VR6X+RWckkfampu2xO1tBQ+ktL59ylY6bz/0Fs
 cXSXqtqsb29hqE1wQlA8NNZzBadLMgHPaL7kJ+V2X+LxIiuI7E8Ob9JiTTUcWmPV6GkL
 5djIO8Ot1QKk6eQ6ophef+SwL8W51Nbh9vxPRI2Z09lRlVnCoYP3KUMRVxBejHQ+WB/Z
 F/Mg==
X-Gm-Message-State: AOAM5314FXN8NzmFujP1Mf4HRL7MDYSqHGPqw2F5MzoQqE/k2Upb9D8h
 hNiVHJVPajhhy33pNgaHMKxkf42GB77tFwQfeSRrjcMTW9s=
X-Google-Smtp-Source: ABdhPJwoux5Uo+8bs6jFThxBNg2G4c7sVmpdyK75XfcE5kQo3I8fpzO3qCiPvuBb+c3t4d3kkHGJK0bCooO/ab2+ljg=
X-Received: by 2002:a17:906:2bd0:: with SMTP id
 n16mr17112173ejg.132.1633347347299; 
 Mon, 04 Oct 2021 04:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210920070047.3937292-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2109231244190.630@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2109231244190.630@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 4 Oct 2021 17:05:36 +0530
Message-ID: <CAARzgwzpjBy9gKyHVoz8dC=BxKWxgMNgUC1iPp0c6HkkYqTgoA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x530.google.com
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Thu, Sep 23, 2021 at 12:44 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> ping ...
>
> On Mon, 20 Sep 2021, Ani Sinha wrote:
>
> > This patchset adds a unit test to exercize acpi hotplug support for multifunction
> > bridges on q35 machines. This support was added with the commit:
> >
> > d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> >
> > changelist:
> > v1 : initial RFC patch.
> > v2: incorporated some of the feedbacks from Igor.
> > v3: forgot to add the ASL diff for patch 3 in commit log for v2. Added now.
> >
> > Ani Sinha (3):
> >   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
> >     table blob
> >   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
> >     for q35
> >   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
> >     test
> >
> >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8435 bytes
> >  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> >
> > --
> > 2.25.1
> >
> >

