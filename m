Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0792802C1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 17:29:42 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO0Wb-00066i-C8
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 11:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kO0TO-0004JZ-UV
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 11:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kO0TL-0001Rv-3p
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 11:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601565975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjMh8egcPCTKPBb80zWfpVh9nGn5ooNO9AIjJfxMfBs=;
 b=BA9jeMxwN1BPmmEmW9oEss0kATbiSut6PUSkr589dD3i+KzdcW0wAykAtGqT6fA60pq5e3
 J8VoHfw3i09hD4vNFflX4ls65rdCN+Vzr6wruJh1v4AL6jLq6gx9FFkLjGGk187+TgMBkF
 1mOThUTttVy76QDhhvylD4BdvtZC70s=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-eEpduTuQNZebbrgtyLp-Zw-1; Thu, 01 Oct 2020 11:26:11 -0400
X-MC-Unique: eEpduTuQNZebbrgtyLp-Zw-1
Received: by mail-oo1-f69.google.com with SMTP id a21so2849949oos.5
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 08:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjMh8egcPCTKPBb80zWfpVh9nGn5ooNO9AIjJfxMfBs=;
 b=OGT51u7QnBG6dl6uJBo8Aj15/X63FmOz+Ea9O4YMWP8rjI/MztJryYr+wUX5XfWmSq
 6VoIZpa9R8d4bQcHqrHddVAGfQoLMksr6ybo3Jmdi9NuOCSgm2dEgEAFxidPPYYbcL0+
 vHGbBy0oul83f5Ccw6VjP3gBAQ9ZbzdBeClx159cHXdA5nYAociHYqoUDDGKiPHULv7t
 ICQ/hQaguxYePPSFB1zdhxjF8ADENLqSotQTpRRt/InCoo0wp0qSSrAtTcBNakC9SM+b
 Jf/7JHIG0ib4ME9qgzJJHTPwfju1FtH1adA6jH0s3cIzQyQ/CAM2pVPQzULJywux3/Op
 YAiA==
X-Gm-Message-State: AOAM530C7m23lFqLYbJSG+z+q7NL3tjAs8yVsQXy2yiyFFThV/U7zaUa
 kGtvuEmmpkYtYZDFePJxRyGLKGGlLaf9GRi6i2Vl7eOVuRpSQMnoIzybeJbb7E/o7BA/7C63fPH
 v/nYBJqDWfl9Yi73pBWRyEEVMQXmFGr4=
X-Received: by 2002:a05:6830:1312:: with SMTP id
 p18mr5514151otq.316.1601565970699; 
 Thu, 01 Oct 2020 08:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxun6foaUd1eYnyCHRipyslbYiW02HprJehlJOah+BE+3LK3PY8nYG49TlL4SxD0bfifZYRoj9JF7ZPHsZ0b4=
X-Received: by 2002:a05:6830:1312:: with SMTP id
 p18mr5514119otq.316.1601565970306; 
 Thu, 01 Oct 2020 08:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200924070013.165026-1-jusual@redhat.com>
 <20200924050236-mutt-send-email-mst@kernel.org>
 <CAMDeoFU_ZO7UxQsz-tvA6WsFm2qK755W5guGoVHfVs55Gb7aUg@mail.gmail.com>
 <20201001073823-mutt-send-email-mst@kernel.org>
 <CAARzgwyGm=U4hN0XGuuh=CeBaJN=MYHDmKPOOWEr6rHCsYF_hA@mail.gmail.com>
In-Reply-To: <CAARzgwyGm=U4hN0XGuuh=CeBaJN=MYHDmKPOOWEr6rHCsYF_hA@mail.gmail.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Thu, 1 Oct 2020 17:25:59 +0200
Message-ID: <CAMDeoFUm0SmN0XRxMjeToH7h_jh6zS=GQwQRZYn4EQ-UCcubEA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Use ACPI PCI hot-plug for Q35
To: Ani Sinha <ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 1, 2020 at 3:02 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Thu, Oct 1, 2020 at 17:10 Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Thu, Oct 01, 2020 at 10:55:35AM +0200, Julia Suvorova wrote:
>> > On Thu, Sep 24, 2020 at 11:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>> > >
>> > > On Thu, Sep 24, 2020 at 09:00:06AM +0200, Julia Suvorova wrote:
>> > > > The patch set consists of two parts:
>> > > > patches 1-4: introduce new feature
>> > > >              'acpi-pci-hotplug-with-bridge-support' on Q35
>> > > > patches 5-7: make the feature default along with changes in ACPI tables
>> > > >
>> > > > This way maintainers can decide which way to choose without breaking
>> > > > the patch set.
>> > > >
>> > > > With the feature disabled Q35 falls back to the native hot-plug.
>> > > >
>> > > > Pros
>> > > >     * no racy behavior during boot (see 110c477c2ed)
>> > > >     * eject is possible - according to PCIe spec, attention button
>> > > >       press should lead to power off, and then the adapter should be
>> > > >       removed manually. As there is no power down state exists in QEMU,
>> > > >       we cannot distinguish between an eject and a power down
>> > > >       request.
>> > > >     * no delay during deleting - after the actual power off software
>> > > >       must wait at least 1 second before indicating about it. This case
>> > > >       is quite important for users, it even has its own bug:
>> > > >           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>> > > >     * no timer-based behavior - in addition to the previous example,
>> > > >       the attention button has a 5-second waiting period, during which
>> > > >       the operation can be canceled with a second press. While this
>> > > >       looks fine for manual button control, automation will result in
>> > > >       the need to queue or drop events, and the software receiving
>> > > >       events in all sort of unspecified combinations of attention/power
>> > > >       indicator states, which is racy and uppredictable.
>> > > >     * fixes:
>> > > >         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>> > > >         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
>> > > >
>> > > > Cons:
>> > > >     * lose per-port control over hot-plug (can be resolved)
>> > > >     * no access to possible features presented in slot capabilities
>> > > >       (this is only surprise removal AFAIK)
>> > >
>> > > something I don't quite get is whether with this one can still add
>> > > new pcie bridges and then hotplug into these with native
>> > > hotplug.
>> >
>> > Right now I disable native if there is acpihp anywhere, but even if
>> > you enable it for hotplugged devices, native hot-plug will not work.
>>
>> So that's a minor regression in functionality, right?
>> Why is that the case? Because you disable it in ACPI?
>> What if we don't?
>
>
> Stupid question. If both native and acpi is enabled which one does OS chose? Does this choice vary between OSes and different flavours of the same OS like Windows?

It will always choose native.

>>
>>
>> > > the challenge to answering this with certainty is that right now qemu
>> > > does not allow hotplugging complex devices such as bridges at all,
>> > > we only have a hack for multifunction devices.
>> > > Maybe adding a bridge as function 1 on command line, then hotplugging another device as
>> > > function 0 will work to test this.
>> > >
>> > >
>> > >
>> > > > v3:
>> > > >     * drop change of _OSC to allow SHPC on hotplugged bridges
>> > > >     * use 'acpi-root-pci-hotplug'
>> > > >     * add migration states [Igor]
>> > > >     * minor style changes
>> > > >
>> > > > v2:
>> > > >     * new ioport range for acpiphp [Gerd]
>> > > >     * drop find_pci_host() [Igor]
>> > > >     * explain magic numbers in _OSC [Igor]
>> > > >     * drop build_q35_pci_hotplug() wrapper [Igor]
>> > > >
>> > > > Julia Suvorova (7):
>> > > >   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
>> > > >   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
>> > > >   hw/pci/pcie: Do not initialize slot capability if acpihp is used
>> > > >   hw/acpi/ich9: Enable ACPI PCI hot-plug
>> > > >   bios-tables-test: Allow changes in DSDT ACPI tables
>> > > >   hw/acpi/ich9: Set ACPI PCI hot-plug as default
>> > > >   bios-tables-test: Update golden binaries
>> > > >
>> > > >  hw/i386/acpi-build.h              |   7 ++++
>> > > >  include/hw/acpi/ich9.h            |   5 +++
>> > > >  include/hw/acpi/pcihp.h           |   3 +-
>> > > >  hw/acpi/ich9.c                    |  67 ++++++++++++++++++++++++++++++
>> > > >  hw/acpi/pcihp.c                   |  16 ++++---
>> > > >  hw/acpi/piix4.c                   |   4 +-
>> > > >  hw/i386/acpi-build.c              |  31 ++++++++------
>> > > >  hw/i386/pc.c                      |   1 +
>> > > >  hw/pci/pcie.c                     |  16 +++++++
>> > > >  tests/data/acpi/q35/DSDT          | Bin 7678 -> 7950 bytes
>> > > >  tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 9274 bytes
>> > > >  tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 9865 bytes
>> > > >  tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8413 bytes
>> > > >  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9603 bytes
>> > > >  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 8025 bytes
>> > > >  tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9309 bytes
>> > > >  tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 9080 bytes
>> > > >  tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7956 bytes
>> > > >  tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8555 bytes
>> > > >  19 files changed, 129 insertions(+), 21 deletions(-)
>> > > >
>> > > > --
>> > > > 2.25.4
>> > >
>>


