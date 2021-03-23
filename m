Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F5345EDF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:03:36 +0100 (CET)
Received: from localhost ([::1]:34500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgh5-0003ED-Tq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOgf7-00021e-Nw; Tue, 23 Mar 2021 09:01:34 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:52515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOgf3-0007t9-24; Tue, 23 Mar 2021 09:01:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 46A2074632F;
 Tue, 23 Mar 2021 14:01:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 210257462DB; Tue, 23 Mar 2021 14:01:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1FD797462D6;
 Tue, 23 Mar 2021 14:01:27 +0100 (CET)
Date: Tue, 23 Mar 2021 14:01:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v10 7/7] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
In-Reply-To: <YFk8iCC3IhGw1TqL@yekko.fritz.box>
Message-ID: <e1f21b2-398d-1422-2b49-6f3ebe5a9cef@eik.bme.hu>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
 <YFk8iCC3IhGw1TqL@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2088236693-1616504487=:79777"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-2088236693-1616504487=:79777
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 23 Mar 2021, David Gibson wrote:
> On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
>> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
>> a PowerPC board based on the Marvell MV64361 system controller and the
>> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
>> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
>> image is needed to boot and only MorphOS has a video driver to produce
>> graphics output. Linux could work too but distros that supported this
>> machine don't include usual video drivers so those only run with
>> serial console for now.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  MAINTAINERS                             |  10 ++
>>  default-configs/devices/ppc-softmmu.mak |   2 +
>>  hw/ppc/Kconfig                          |   9 ++
>>  hw/ppc/meson.build                      |   2 +
>>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>>  5 files changed, 167 insertions(+)
>>  create mode 100644 hw/ppc/pegasos2.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b6ab3d25a7..1c3c55ef09 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1353,6 +1353,16 @@ F: pc-bios/canyonlands.dt[sb]
>>  F: pc-bios/u-boot-sam460ex-20100605.bin
>>  F: roms/u-boot-sam460ex
>>
>> +pegasos2
>> +M: BALATON Zoltan <balaton@eik.bme.hu>
>> +R: David Gibson <david@gibson.dropbear.id.au>
>> +L: qemu-ppc@nongnu.org
>> +S: Maintained
>> +F: hw/ppc/pegasos2.c
>> +F: hw/pci-host/mv64361.c
>> +F: hw/pci-host/mv643xx.h
>> +F: include/hw/pci-host/mv64361.h
>
> Oh, sorry about the comment in the previous patch.
>
>>  RISC-V Machines
>>  ---------------
>>  OpenTitan
>> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
>> index 61b78b844d..4535993d8d 100644
>> --- a/default-configs/devices/ppc-softmmu.mak
>> +++ b/default-configs/devices/ppc-softmmu.mak
>> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
>>  CONFIG_MAC_OLDWORLD=y
>>  CONFIG_MAC_NEWWORLD=y
>>
>> +CONFIG_PEGASOS2=y
>
> I don't think we can have this default to enabled while it requires a
> non-free ROM to start.

Not having it enabled though does not help those who might want to use it 
as they are not people who can compile their own QEMU but rely on binaries 
so adding it without also enabling it is like it wasn't there at all in 
practice. I can attempt to make some guests boot without a ROM but since 
guests expect an OpenFirmware client interface, I'll need something to 
provide that. I'm waiting for VOF to be merged for this.

Regards,
BALATON Zoltan
--3866299591-2088236693-1616504487=:79777--

