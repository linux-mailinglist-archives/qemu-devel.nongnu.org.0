Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9B6A7CDC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeNf-0006EE-QO; Thu, 02 Mar 2023 03:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pXeNb-0006DI-Qe
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:33:36 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1pXeNZ-00048r-CC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:33:35 -0500
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7E4643F22D
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677746007;
 bh=YDYVgHGYyWyrPjvKG8EdQBXhP7haUvRh/I+TAp5wK0M=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Wgwg/Ampu7V1J1WM0kxscwHCNe1gBkiGDa9gBY93yKHQeHMVN+jqAil3VpOqDVhXe
 cF845G7gMqug9AeLYrWJXi+ZKVKr8zD7fAStC/JPLCxqV2m4vBsqri3YDSHu1NuDFg
 uovMy3cTF0OosfpSxO6StnV2CJR3GQA65CzdxhqUtkwiLMaveSp17Jk9yUwCoHMVBT
 Meq+1SFR1f7npq6eqJ/xtmChlsEYQtckX5RNTHKTnJJeq0MWXwJp1r4iV2/MAUUVtK
 z2/8dPozxOjH1f2UMC0Afv9WQlrRSsSxv/5fJlTFYgmautBEzu9aeAjFvu6wkH2B5P
 155FlCV04sITg==
Received: by mail-pg1-f200.google.com with SMTP id
 n11-20020a63e04b000000b004fac0fa0f9eso5336804pgj.19
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDYVgHGYyWyrPjvKG8EdQBXhP7haUvRh/I+TAp5wK0M=;
 b=g8hqaKKNoD61KQj73xnYLDS0xse8UP5klHgZO/KTOqJkab4tn7caOKvekkB1JbBbrw
 GRqysPRxwLjPFaEW5lZEGhSNyi9eHR5lkQgzDtdWwFhWX0lF7zccoRdYMGxYi20qNWfX
 i6NdxuLx9KuwJh52TVzTr0sC6e4az4FE2VT8isJ44q5y8ecHB46iTU6ecCcJatH7Ht3k
 Zx12n5W3fr9fXB3iFX0hYcwn6GSGlWdwDVN9PV6KQd7oZP4PJXmBNNxgEw0F1tvrJDTD
 4yoJ4SinC75eImhDkPM7JAiQNzUxVg5GejsVeAJ4HPZ+kDdP9TL9EfGhPtLcUBW7uGgp
 VAag==
X-Gm-Message-State: AO0yUKWqtaluh0aEtWopFY0dPQOE6cbSAQh0YkXUh+Nk8me/q1TKE5iU
 +H3HK+JuybAbU9dDryQblJFrl0Vm8f37l/q9W1x9DRlO4t5RR72XbVY7huBsPfPegIDhsWapP/t
 UzD9goor8Ih8BmWf0oA5PF2AOmjLGSR1bN/HzhQksF9rx/Ffv
X-Received: by 2002:a17:903:130b:b0:19a:f3f8:c31a with SMTP id
 iy11-20020a170903130b00b0019af3f8c31amr3378540plb.10.1677746005795; 
 Thu, 02 Mar 2023 00:33:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8M2tEsMR66N2CGcG8HxLGpzvtLowaRcFHY/ui8vX8BoDeOFv9ZlIFgpibf1dbtCZ/x7pUqc8WzmAa6AyAMBOM=
X-Received: by 2002:a17:903:130b:b0:19a:f3f8:c31a with SMTP id
 iy11-20020a170903130b00b0019af3f8c31amr3378527plb.10.1677746005250; Thu, 02
 Mar 2023 00:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
 <CAATJJ0K8Qt3-gNFT4nmweRFk-1bSHGicuLPim_V7EjgaXmLtGw@mail.gmail.com>
 <2cf7e982-470f-87eb-7f3e-807499d7c89f@redhat.com>
In-Reply-To: <2cf7e982-470f-87eb-7f3e-807499d7c89f@redhat.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Thu, 2 Mar 2023 09:32:58 +0100
Message-ID: <CAATJJ0LoQW9RDF=1=f_D1zWJSgWzMMtJ0FvqdsQYd9zOuuKkgg@mail.gmail.com>
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
To: Laszlo Ersek <lersek@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>, 
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Oliver Steffen <osteffen@redhat.com>, 
 Pawel Polawski <ppolawsk@redhat.com>, Dann Frazier <dann.frazier@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=christian.ehrhardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 1, 2023 at 9:04=E2=80=AFAM Laszlo Ersek <lersek@redhat.com> wro=
te:
>
> Hello Christian,
>
> On 3/1/23 08:17, Christian Ehrhardt wrote:
> > On Thu, Jan 5, 2023 at 8:14=E2=80=AFAM Laszlo Ersek <lersek@redhat.com>=
 wrote:
> >>
> >> On 1/4/23 13:35, Michael S. Tsirkin wrote:
> >>> On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
> >>>> The modern ACPI CPU hotplug interface was introduced in the followin=
g
> >>>> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
> >>>>
> >>>>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protoc=
ol
> >>>>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
> >>>>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
> >>>>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hoo=
k
> >>>>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplu=
g
> >>>>                   interface
> >>>>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hot=
plug
> >>>>                   interface
> >>>>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
> >>>>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machin=
e type
> >>>>
> > ...
> >>
> >> The solution to the riddle
> >
> > Hi,
> > just to add to this nicely convoluted case an FYI to everyone involved
> > back then,
> > the fix seems to have caused a regression [1] in - as far as I've
> > found - an edge case.
> >
> > [1]: https://gitlab.com/qemu-project/qemu/-/issues/1520
>
> After reading the gitlab case, here's my theory on it:
>
> - Without the patch applied, the CPU hotplug register block in QEMU is
> broken. Effectively, it has *always* been broken; to put it differently,
> you have most likely *never* seen a QEMU in which the CPU hotplug
> register block was not broken. The reason is that the only QEMU release
> without the breakage (as far as a guest could see it!) was v5.0.0, but
> it got exposed to the guest as early as v5.1.0 (IOW, in the 5.* series,
> the first stable release already exposed the issue), and the symptom has
> existed since (up to and including 7.2).
>
> - With the register block broken, OVMF's multiprocessing is broken, and
> the random chaos just happens to play out in a way that makes OVMF think
> it's running on a uniprocessor system.
>
> - With the register block *fixed* (commit dab30fbe applied), OVMF
> actually boots up your VCPUs. With MT-TCG, this translates to as many
> host-side VCPU threads running in your QEMU process as you have VCPUs.
>
> - Furthermore, if your OVMF build includes the SMM driver stack, then
> each UEFI variable update will require all VCPUs to enter SMM. All VCPUs
> entering SMM is a "thundering herd" event, so it seriously spins up all
> your host-side threads. (I assume the SMM-enabled binaries are what you
> refer to as "signed OVMF cases" in the gitlab ticket.)
>
> - If you overcommit the VCPUs (#vcpus > #pcpus), then your host-side
> threads will be competing for PCPUs. On s390x, there is apparently some
> bottleneck in QEMU's locking or in the host kernel or wherever else that
> penalizes (#threads > #pcpus) heavily, while on other host arches, the
> penalty is (apparently) not as severe.
>
> So, the QEMU fix actually "only exposes" the high penalty of the MT-TCG
> VCPU thread overcommit that appears characteristic of s390x hosts.
> You've not seen this symptom before because, regardless of how many
> VCPUs you've specified in the past, OVMF has never actually attempted to
> bring those up, due to the hotplug regblock breakage "masking" the
> actual VCPU counts (the present-at-boot VCPU count and the possible max
> VCPU count).

Thank you for the detailed thoughts - if we can confirm this we can
close the case as "it is odd that there is so much penalty, but =3D>
Won't Fix / Works as Intended"

> Here's a test you could try: go back to QEMU v5.0.0 *precisely*, and try
> to reproduce the symptom. I expect that it should reproduce.

v5.0.0 - 1 host cpu vs 2 vcpu - 58.47s
v5.0.0 - 1 host cpu vs 1 vcpu -  5.33s
v5.0.0 - 2 host cpu vs 2 vcpu -  5.27s
v5.1.0 - 1 host cpu vs 2 vcpu -  7.18s
v5.1.0 - 1 host cpu vs 1 vcpu -  5.22s
v5.1.0 - 2 host cpu vs 2 vcpu -  5.40s

Yes, v5.0.0 behaves exactly like the recent master branch does since your f=
ix.
And v5.1.0 does no more, just as you predicted

> Here's another test you can try: with latest QEMU, boot an x86 Linux
> guest, but using SeaBIOS, not OVMF, on your s390x host. Then, in the
> Linux guest, run as many busy loops (e.g. in the shell) as there are
> VCPUs. Compare the behavior between #vcpus =3D #pcpus vs. #vcpus > #pcpus=
.
> The idea here is of course to show that the impact of overcommitting x86
> VCPUs on s390x is not specific to OVMF. Note that I don't *fully* expect
> this test to confirm the expectation, because the guest workload will be
> very different: in the Linux guest case, your VCPUs will not be
> attempting to enter SMM *or* to access pflash, so the paths exercised in
> QEMU will be very different. But, the test may still be worth a try.

That felt too much of a different workload to me, so I have skipped this
one as - without further evidence that it will help - it could be quite a
time sink.

> Yet another test (or more like, information gathering): re-run the
> problematic case, while printing the OVMF debug log (the x86 debug
> console) to stdout, and visually determine at what part(s) the slowdown
> hits. (I guess you can also feed the debug console log through some
> timestamping utility like "logger".) I suspect it's going to be those
> log sections that relate to SMM entry -- initial SMBASE relocation, and
> then whenever UEFI variables are modified.

Building without -b RELEASE adding debugcon and timestamping that
ouput showed that each individual initialization takes the expected
~x10 longer.
So up to these they are more or less at the same speed initially.
But then the bad case slows down.

Here one example on BootGraphicsResourceTableDxe.efi

good ~0.09
[08:14:36.657866559] Loading driver at 0x0000DA42000
EntryPoint=3D0x0000DA43545 BootGraphicsResourceTableDxe.efi
[08:14:36.658913369] InstallProtocolInterface:
BC62157E-3E33-4FEC-9920-2D3B36D750DF DA72D18
[08:14:36.659946746] ProtectUefiImageCommon - 0xDA72040
[08:14:36.660982120] - 0x000000000DA42000 - 0x0000000000002840
[08:14:36.662043745] InstallProtocolInterface:
CDEA2BD3-FC25-4C1C-B97C-B31186064990 DA445F0
[08:14:36.663092745] InstallProtocolInterface:
4B5DC1DF-1EAA-48B2-A7E9-EAC489A00B5C DA44670
[08:14:36.664139682] Loading driver
961578FE-B6B7-44C3-AF35-6BC705CD2B1F
[08:14:36.665191815] InstallProtocolInterface:
5B1B31A1-9562-11D2-8E3F-00A0C969723B DA72540
[08:14:36.666244307] Loading driver at 0x0000DA02000
EntryPoint=3D0x0000DA099BC Fat.efi

bad ~0.17s
[08:15:30.386201946] Loading driver at 0x0000DA49000
EntryPoint=3D0x0000DA4A545 BootGraphicsResourceTableDxe.efi
[08:15:30.410568994] InstallProtocolInterface:
BC62157E-3E33-4FEC-9920-2D3B36D750DF DA7EB18
[08:15:30.430838932] ProtectUefiImageCommon - 0xDA7E140
[08:15:30.440526879] - 0x000000000DA49000 - 0x0000000000002840
[08:15:30.450730504] InstallProtocolInterface:
CDEA2BD3-FC25-4C1C-B97C-B31186064990 DA4B5F0
[08:15:30.480538889] InstallProtocolInterface:
4B5DC1DF-1EAA-48B2-A7E9-EAC489A00B5C DA4B670
[08:15:30.490532370] Loading driver
961578FE-B6B7-44C3-AF35-6BC705CD2B1F
[08:15:30.510566744] InstallProtocolInterface:
5B1B31A1-9562-11D2-8E3F-00A0C969723B DA7D040
[08:15:30.550572432] Loading driver at 0x0000D7F6000
EntryPoint=3D0x0000D7FD9BC Fat.efi

This seems to be the case for each driver load in here which then adds up.
There is another rather big jump here a bit later

good ~instant
[08:14:37.267336194] Select Item: 0xE
[08:14:37.268346995] [Bds]RegisterKeyNotify: 000C/0000 80000000/00 Success

bad ~8s
[08:15:43.561054490] Select Item: 0xE
[08:15:51.291039364] [Bds]RegisterKeyNotify: 000C/0000 80000000/00 Success

The whole late section of OVMF init makes up for almost all of the loss.

Full files:
- good: https://paste.ubuntu.com/p/DcMpxtd9Cy/
- bad: https://paste.ubuntu.com/p/4wDfzmC9Sm/

> Preliminary advice: don't overcommit VCPUs in the setup at hand, or else
> please increase the timeout. :)

I was always in the "if possible you should not overcommit" camp anyway.
And we have - by now resolved this in the tests [1] due to my bug
about it - thanks @Dann Frazier

[1]: https://salsa.debian.org/qemu-team/edk2/-/commit/243f0c2533fc18671dc37=
3645e44b5071d8474a5

> In edk2, a way to mitigate said "thundering herd" problem *supposedly*
> exists (using unicast SMIs rather than broadcast ones), but that
> configuration of the core SMM components in edk2 had always been
> extremely unstable when built into OVMF *and* running on QEMU/KVM. So we
> opted for broadcast SMIs (supporting which actually required some QEMU
> patches). Broadcast SMIs generate larger spikes in host load, but
> regarding guest functionally, they are much more stable/robust.
>
> Laszlo
>


--=20
Christian Ehrhardt
Senior Staff Engineer, Ubuntu Server
Canonical Ltd

