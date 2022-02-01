Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F84A62F9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:51:14 +0100 (CET)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExJ9-0001AL-Vo
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEvUu-0000Bm-0R
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nEvUq-0001x9-D3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643730904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J41TnzZbqbys2OHs7TF+WYN7NyqTZ05l8f6Akx5iczQ=;
 b=bAY0kCVBlh9j2AoRPfXHMuQpULtUpcsHmz8iut2uwAcjpRaPkeg/nG9WUKVcq3XDmXmLLS
 PG9DNwXe7sRR+5E4a//U1ttnL+bmmh9X5uMwCOh+7wINMCVqvRZYq8RGs9OSlrs77NepQ3
 JJifx2Q2txK/+gD35f+clT/GJxVVEmU=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-jfJtvNXDO7qhXkawMF90mw-1; Tue, 01 Feb 2022 10:55:01 -0500
X-MC-Unique: jfJtvNXDO7qhXkawMF90mw-1
Received: by mail-ua1-f70.google.com with SMTP id
 c17-20020ab03491000000b0030c42ef8db7so9052037uar.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J41TnzZbqbys2OHs7TF+WYN7NyqTZ05l8f6Akx5iczQ=;
 b=kWG+yB45AG/3SIVZ2Aa0wA7HN3hoijL9DMcySKJV3OoaivPTz4LKk24oPuQrLnguHX
 oSLnBpP8nCxmV98byICuLZFHwyWSn43QR3BYHvlWKoljMm7NwKqL16GgRGt/wdnsB2ne
 eEbC6+7sFymT6Q0dp5AvKvwLSsBgDu54eDLsiEYrrGF4suYoRMfICZHfPHveg45g5MPO
 lgsMFGJpGgVeYK842Eg0qI4VnOVCeKlMn3uiqoHIyxyOMHyuXieeUxCZ5KtgVdflqNrP
 csMsoqtKZYbLuhp9MdPU3Bf3o+8asmTg2iqYcSJByv/0ZcEtS3yeNMAXi24mP4MC3PAE
 YMig==
X-Gm-Message-State: AOAM533C/10PvQq3OfXN7m3YpSbdcphg9AcrKjW52E3chbnZOhm7ektG
 rSbjfb5kAZ6oUUhA2D3/8vocvO+0ROGu3tLdWosHq8bvMrOBFVAeThJ/RsCGoCUvI+LjvKi+9kh
 ZlUYcAMqDdIiB6gh8hu3cJnuTiwltgGY=
X-Received: by 2002:a05:6122:b75:: with SMTP id
 h21mr10491095vkf.26.1643730901218; 
 Tue, 01 Feb 2022 07:55:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbsnJz9e1tbNiBchxIrvtYccjuHFstpP4eW9nRtXn1eI5def08pIRYdR3YZe/D/Y7JXFvDViI8bnVcnpzICeM=
X-Received: by 2002:a05:6122:b75:: with SMTP id
 h21mr10491082vkf.26.1643730900950; 
 Tue, 01 Feb 2022 07:55:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <YfkUOVUQX3b2XgqN@paraplu>
In-Reply-To: <YfkUOVUQX3b2XgqN@paraplu>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 10:54:50 -0500
Message-ID: <CA+bd_6+TUA4J3JVk-6vrj3u61pFAJ-avGvXhrsE6+LEHYxoFVg@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: Kashyap Chamarthy <kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 6:07 AM Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 10:20:11AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> >
> > > IMHO the ideal scenario would be for us to have a kernel, initrd
> > > containing just busybox tools for the key arch targets we care
> > > about. Those could be used with direct kernel boot or stuffed
> > > into a disk iamge. Either way, they would boot in ~1 second,
> > > even with TCG, and would be able to execute simple shell scripts
> > > to test a decent amount of QEMU functionality.
> >
> > I have some test images based on buildroot which are essentially that.
> > https://gitlab.com/kraxel/br-kraxel/
> >
> > Still a significant download, but much smaller than a full fedora or
> > ubuntu cloud image and it boots much faster too.  Not down to only one
> > second though.
>
> Any objection to using CirrOS[1] images for boot-testing?   FWIW,
> OpenStack upstream CI boots thousands of guests each day with these for
> many years now.  It boots quick, and also satisfies one of Peter's
> other requirements: AArch64 images.
>

Even though I strongly support CirrOS (see my reply to Dan), I strongly object
using it as the only OS on "boot tests" (that is, testing that QEMU can fully
boot a system).  The reason is because actual functional coverage is reduced
and detached from most real world scenarios (I'm not aware of CirrOS, Alpine
and similar distros being used significantly on real world workloads).

This is the reasoning behind tests such as
"tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm" which takes ~12
seconds to run on my 4 years old laptop.

Depending on what one considers a system to be booted, the existing approach
on "tests/avocado/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc" of
booting only a kernel / initrd is also valid.  That takes around 0.4
seconds with KVM
and ~2 seconds to run with TCG on my system.

> A downside of CirrOS is it doesn't have a package manager, so installing
> custom packages is a PITA.  The main use-case of CirrOS images
> is any kind of boot-testing only.
>
> To make the booting even quicker with CirrOS, do disable the "metadata
> service lookup" (this is queried 20 times) at boot time.  It can be
> trivially done by making this change in this file
> /etc/cirros-init/config (in the disk image):
>
>     - DATASOURCE_LIST="nocloud configdrive ec2"
>     + DATASOURCE_LIST="nocloud"
>

That's a good tip!

If CirrOS had better support for "nocloud"[1], the existing boot tests could
transparently use it.  For instance, you can currently do this:

$ ./tests/venv/bin/avocado vmimage get --distro=ubuntu --distro-version=20.04
The image was downloaded:
Provider Version Architecture File
ubuntu   20.04   amd64
/home/cleber/avocado/data/cache/by_location/ca6ab0fdb5d175bbf3dfc3d070511559f6eab449/ubuntu-20.04-server-cloudimg-amd64.img

$ ./tests/venv/bin/avocado run -p distro=ubuntu -p
distro_version=20.04
tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm

The "-p distro=cirros" works, but only up to the downloading/preparing
the image.
The lack of proper support for cloud-init/nocloud then breaks it. I
would be a bit
reluctant of adding another family of tests or a third way of dealing
with guests
because they implement a custom behavior for something that is supposed
to be so standard at this point (cloud-init / nocloud).

Regards,
- Cleber.

[1] https://github.com/cirros-dev/cirros/issues/67


