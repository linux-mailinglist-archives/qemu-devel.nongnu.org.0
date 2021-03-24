Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8052347704
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:22:14 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1aX-0004k8-7k
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lP1ZU-0004DG-SS; Wed, 24 Mar 2021 07:21:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lP1ZS-0004sV-0O; Wed, 24 Mar 2021 07:21:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2704F7462D3;
 Wed, 24 Mar 2021 12:21:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E8C357462BD; Wed, 24 Mar 2021 12:21:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E75E274581E;
 Wed, 24 Mar 2021 12:21:02 +0100 (CET)
Date: Wed, 24 Mar 2021 12:21:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v10 7/7] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
In-Reply-To: <YFqZt6NaXuOmgBza@yekko.fritz.box>
Message-ID: <66385c2e-72f5-c993-dc86-6cfaa9c0dffd@eik.bme.hu>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
 <YFk8iCC3IhGw1TqL@yekko.fritz.box>
 <e1f21b2-398d-1422-2b49-6f3ebe5a9cef@eik.bme.hu>
 <YFqZt6NaXuOmgBza@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-617097667-1616584862=:9580"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-617097667-1616584862=:9580
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, David Gibson wrote:
> On Tue, Mar 23, 2021 at 02:01:27PM +0100, BALATON Zoltan wrote:
>> On Tue, 23 Mar 2021, David Gibson wrote:
>>> On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
>>>> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
>>>> a PowerPC board based on the Marvell MV64361 system controller and the
>>>> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
>>>> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
>>>> image is needed to boot and only MorphOS has a video driver to produce
>>>> graphics output. Linux could work too but distros that supported this
>>>> machine don't include usual video drivers so those only run with
>>>> serial console for now.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  MAINTAINERS                             |  10 ++
>>>>  default-configs/devices/ppc-softmmu.mak |   2 +
>>>>  hw/ppc/Kconfig                          |   9 ++
>>>>  hw/ppc/meson.build                      |   2 +
>>>>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>>>>  5 files changed, 167 insertions(+)
>>>>  create mode 100644 hw/ppc/pegasos2.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index b6ab3d25a7..1c3c55ef09 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1353,6 +1353,16 @@ F: pc-bios/canyonlands.dt[sb]
>>>>  F: pc-bios/u-boot-sam460ex-20100605.bin
>>>>  F: roms/u-boot-sam460ex
>>>>
>>>> +pegasos2
>>>> +M: BALATON Zoltan <balaton@eik.bme.hu>
>>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>>> +L: qemu-ppc@nongnu.org
>>>> +S: Maintained
>>>> +F: hw/ppc/pegasos2.c
>>>> +F: hw/pci-host/mv64361.c
>>>> +F: hw/pci-host/mv643xx.h
>>>> +F: include/hw/pci-host/mv64361.h
>>>
>>> Oh, sorry about the comment in the previous patch.
>>>
>>>>  RISC-V Machines
>>>>  ---------------
>>>>  OpenTitan
>>>> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
>>>> index 61b78b844d..4535993d8d 100644
>>>> --- a/default-configs/devices/ppc-softmmu.mak
>>>> +++ b/default-configs/devices/ppc-softmmu.mak
>>>> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
>>>>  CONFIG_MAC_OLDWORLD=y
>>>>  CONFIG_MAC_NEWWORLD=y
>>>>
>>>> +CONFIG_PEGASOS2=y
>>>
>>> I don't think we can have this default to enabled while it requires a
>>> non-free ROM to start.
>>
>> Not having it enabled though does not help those who might want to use it as
>> they are not people who can compile their own QEMU but rely on binaries so
>> adding it without also enabling it is like it wasn't there at all in
>> practice.
>
> Not convinced, sorry.  If it's not usable out of the box, having to
> build from source is kind of expected.  Or you could convince someone

I accept your point however there's a difference of only needing a ROM 
image to be able to use it from your distro's binary and having to rebuild 
it from source. So to me needing a ROM does not make it expected having to 
rebuild it. Needing to configure it some way would make that expected.

> (or do it yourself) to provide prebuild binaries for this purpose that
> have the right things enabled.

There are people who provide binaries with patches for such purposes but 
that limits the availability of it compared to having it in all distro 
binaries without further effort. As I said I also plan to solve this 
eventually but I'd probably need VOF for that. Will that be merged at 
last? Other alternatives would be modifying SLOF, OpenBIOS or OpenFirmware 
or rewrite SmartFirmware to free it from its non-distributable parts but I 
think VOF would be a simpler way also avoiding adding another full OF 
implementation to QEMU that already has more than there should be.

Regards,
BALATON Zoltan

>> I can attempt to make some guests boot without a ROM but since
>> guests expect an OpenFirmware client interface, I'll need something to
>> provide that. I'm waiting for VOF to be merged for this.
>>
>> Regards,
>> BALATON Zoltan
>
>
>
--3866299591-617097667-1616584862=:9580--

