Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34163D736B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:37:22 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KSf-0007yJ-BJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8KRa-0007IO-VM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8KRY-0005GB-La
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627382170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJmOJupCeU/628YdpFVv4tda1VaBAMdpKkK5icCs7LM=;
 b=QjaoNqX+rw79PmE0q3LyOzrPhDBBUKgJUG6Xw1B0nUfFaAQIiDyXmALEQU+A7S1ML0muZN
 enGis48rahGNRzcIOmJ4f2MDh644pDWDgZVxltozuKIxHpGFyuRLzHQsuMgYsM97FJAq4z
 SjiL2imsalYPMDM/KdItEz77AY9VCOU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122--Z5d6Wp8OfO2jCc4Fd5m_w-1; Tue, 27 Jul 2021 06:36:07 -0400
X-MC-Unique: -Z5d6Wp8OfO2jCc4Fd5m_w-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso4366645wrs.22
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehZCq5bmp6XYjMdeL0Lxj/3D8ptHnvyfHx1RHx85mB0=;
 b=Ozyft05EJsNkaiX2rxzgqkmOLK7GMQ5121YQ4NE8yr4BFtgrEGvbA/pnkqXBg7KrKr
 p/DShmk3NKQsh5vHcT8FYVuzC9A7GnuZzJgLJ2+0o2W7OC4MqcRm+gFuJGAzyZoA5R91
 xmNzjnoff7EyDbLeMwpE4z09XAyBG4bi1kcvRneHEFgmV0B1nIcgyyERyYF74PyYWFs2
 rzPzaQ/Cl9rAfstsENjjiINEl2Sscf4RWkzjeMYq0tXarN/MPQz+2UBvt2TrV70Xpbwn
 Wsf/bBBJNl62jtcBWBuB/9cUYereaBgPdVPdSPlpeoxfdXzJ9zaDulp0Xi5G2qPB3Vsc
 4L/Q==
X-Gm-Message-State: AOAM533fmX/2YRuGWHLjSsSndZ/Rk5oiVPDvEOMGOss3m/RLjzhd1qIT
 liKnhxS+H6kzSaCNaavNsfLBS5oE8aznuwLJgjEfTLG2e9FMwNWZBVq7levKpbVliOutB6fIB4p
 M1lZsFAC8tTBol+w=
X-Received: by 2002:adf:b305:: with SMTP id j5mr23281614wrd.11.1627382166187; 
 Tue, 27 Jul 2021 03:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaS0qZCR23bMiB5REZ+9I5Z8Ri2A+Gs8xVndkiROBdxqD8+HvFzhLEy/FIZW7I8qjrGFgvdw==
X-Received: by 2002:adf:b305:: with SMTP id j5mr23281590wrd.11.1627382165941; 
 Tue, 27 Jul 2021 03:36:05 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n186sm2783982wme.40.2021.07.27.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:36:05 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:36:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210727123603.6119c34c@redhat.com>
In-Reply-To: <20210727045315-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 05:01:23 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jul 26, 2021 at 10:12:38PM -0700, Guenter Roeck wrote:
> > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote: =20
> > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote: =20
> > > > (cc Bjorn)
> > > >=20
> > > > On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@r=
edhat.com> wrote: =20
> > > > >=20
> > > > > On 7/26/21 12:56 AM, Guenter Roeck wrote: =20
> > > > > > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote: =20
> > > > > > > On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote=
: =20
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > starting with qemu v6.0, some of my aarch64 efi boot tests =
no longer
> > > > > > > > work. Analysis shows that PCI devices with IO ports do not =
instantiate
> > > > > > > > in qemu v6.0 (or v6.1-rc0) when booting through efi. The pr=
oblem affects
> > > > > > > > (at least) ne2k_pci, tulip, dc390, and am53c974. The proble=
m only
> > > > > > > > affects
> > > > > > > > aarch64, not x86/x86_64.
> > > > > > > >=20
> > > > > > > > I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: In=
form os to
> > > > > > > > keep firmware resource map"). Since this commit, PCI device=
 BAR
> > > > > > > > allocation has changed. Taking tulip as example, the kernel=
 reports
> > > > > > > > the following PCI bar assignments when running qemu v5.2.
> > > > > > > >=20
> > > > > > > > [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class =
0x020000
> > > > > > > > [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x00=
7f]
> > > > > > > > [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-=
0x1000007f] =20
> > > >=20
> > > > IIUC, these lines are read back from the BARs
> > > >  =20
> > > > > > > > [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x100=
0-0x107f]
> > > > > > > > [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > > > > > > 0x10000000-0x1000007f]
> > > > > > > >  =20
> > > >=20
> > > > ... and this is the assignment created by the kernel.
> > > >  =20
> > > > > > > > With qemu v6.0, the assignment is reported as follows.
> > > > > > > >=20
> > > > > > > > [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class =
0x020000
> > > > > > > > [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x00=
7f]
> > > > > > > > [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-=
0x1000007f]
> > > > > > > >  =20
> > > >=20
> > > > The problem here is that Linux, for legacy reasons, does not suppor=
t
> > > > I/O ports <=3D 0x1000 on PCI, so the I/O assignment created by EFI =
is
> > > > rejected.
> > > >=20
> > > > This might make sense on x86, where legacy I/O ports may exist, but=
 on
> > > > other architectures, this makes no sense. =20
> > >=20
> > >=20
> > > Fixing Linux makes sense but OTOH EFI probably shouldn't create mappi=
ngs
> > > that trip up existing guests, right?
> > >  =20
> >=20
> > I think it is difficult to draw a line. Sure, maybe EFI should not crea=
te
> > such mappings, but then maybe qemu should not suddenly start to enforce
> > those mappings for existing guests either. =20
>=20
> I would say both. But about QEMU actually I think you have a point here.
> Re-reading the spec:
>=20
> 0: No (The operating system shall not ignore the PCI configuration that f=
irmware has done
> at boot time. However, the operating system is free to configure the devi=
ces in this hierarchy
> that have not been configured by the firmware. There may be a reduced lev=
el of hot plug
> capability support in this hierarchy due to resource constraints. This si=
tuation is the same as
> the legacy situation where this _DSM is not provided.)
> 1: Yes (The operating system may ignore the PCI configuration that the fi=
rmware has done
> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
>=20
>=20
> I think I misread the spec previously, and understood it to mean that
> 1 means must ignore. In fact 1 gives the most flexibility.
> So why are we suddenly telling the guest it must not override
> firmware?
>=20
> The commit log says
>     The diffences could result in resource assignment failure.
>=20
> which is kind of vague ...
>=20
> Jiahui Cen, Igor, what do you think about it?
> I'm inclined to revert 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14
> at least for now.
Looking at patch history, it seems consensus was that it's better to
enforce firmware allocations.

Also letting OS do as it pleases might break PCI devices that
don't tolerate reallocation. ex: firmware initializes PCI device
IO/BARs and then fetches ACPI tables, which get patched with
assigned resources.

to me returning 0 seems to be correct choice.
In addition resource hinting also works via firmware allocations,
if we revert the commit it might change those configs.

me wonders if there is a way make enforcement per device.

> > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > qemu. That solves my immediate problem, giving us time to find a soluti=
on
> > that is acceptable for everyone. After all, it doesn't look like anyone
> > else has noticed the problem, so there is no real urgency.
> >=20
> > Thanks,
> > Guenter =20
>=20
> Well it's not like we have an army of testers, I think we should
> treat each problem report seriously ...
>=20


