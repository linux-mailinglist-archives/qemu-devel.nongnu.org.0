Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E97DDD1A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 08:53:08 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM55P-0004ee-8D
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 02:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iM54H-00045b-Kv
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 02:51:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iM54G-0006UY-6r
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 02:51:57 -0400
Received: from 17.mo7.mail-out.ovh.net ([188.165.35.227]:45560)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iM54G-0006Rj-05
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 02:51:56 -0400
Received: from player758.ha.ovh.net (unknown [10.109.146.211])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id DF2EB137818
 for <qemu-devel@nongnu.org>; Sun, 20 Oct 2019 08:51:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 1F6A4B3499C1;
 Sun, 20 Oct 2019 06:51:47 +0000 (UTC)
Subject: Re: qemu/powernv: coreboot support?
To: David Gibson <david@gibson.dropbear.id.au>,
 "Marty E. Plummer" <hanetzer@startmail.com>
References: <20191018172622.kz4smemh5cwesfit@proprietary-killer>
 <21ba3404-dcd3-fe06-7725-d58e249f9fd2@kaod.org>
 <20191019153108.gkupn3tnihspq7th@proprietary-killer>
 <1cbd1882-15c8-5471-cd65-1c84c2920ba8@kaod.org>
 <20191019160933.fizoc6tpu5jday4o@proprietary-killer>
 <20191020062842.GI1960@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0a7cbd9b-2c46-259d-4e0d-9084ee2875a3@kaod.org>
Date: Sun, 20 Oct 2019 08:51:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191020062842.GI1960@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 290763652575628243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkedvgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.35.227
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2019 08:28, David Gibson wrote:
> On Sat, Oct 19, 2019 at 11:09:34AM -0500, Marty E. Plummer wrote:
>> On Sat, Oct 19, 2019 at 05:53:12PM +0200, C=E9dric Le Goater wrote:
>>> On 19/10/2019 17:31, Marty E. Plummer wrote:
>>>> On Sat, Oct 19, 2019 at 03:46:59PM +0200, C=E9dric Le Goater wrote:
>>>>> On 18/10/2019 19:28, Marty E. Plummer wrote:
>>>>>> Hello,
>>>>>>
>>>>>> First off, thank you for the work you've done on the ppc64 support=
, it
>>>>>> has been very useful. I'm currently working on a coreboot port for=
 the
>>>>>> talos ii line of systems (which means more ppc64 support, support
>>>>>> specifically for the power9 sforza chip, and specific mainboard su=
pport.
>>>>>> My plate is very full lol) and have been using qemu to debug the
>>>>>> bootblock.
>>>>>>
>>>>>> It has been very useful for that, but I'm now at the point where I=
 need
>>>>>> to jump to romstage, and that's where it gets tricky. qemu parses =
the rom
>>>>>> image and looks for a ffs header, locates skiboot on it, and jumps=
 straight
>>>>>> to that. Not exactly ideal for debugging something not produced fr=
om op-build.
>>>>>
>>>>> yes. I suppose you are using my branch powernv-4.2 which adds PNOR =
support
>>>>> and a way to boot directly from PNOR. In that case, QEMU parses the=
 PNOR
>>>>> file to extract the PAYLOAD partition (skiboot). skiboot also detec=
ts the
>>>>> flash and extract the kernel and initramfs from the PNOR.
>>>>>
>>>>> However, you can bypass all this internal boot process by simply pa=
ssing
>>>>> a -bios option and not passing a MTD device.
>>>>>
>>>> Doing so gives me the following error:
>>>> qemu-system-ppc64: Could not load OPAL firmware 'build/coreboot.rom'
>>>> (this is after I patched the 4mb size limit up)
>>>
>>> Could you make that rom available ?=20
>>>
>> Sure, I think. Not sure about how sending files works in my current ma=
il
>> client but will see. Its more or less a 'stock' (as stock as can be fo=
r
>> a new coreboot target) coreboot.rom file, but I've added some logic in=
to
>> the build to fake a pnor ffs header at the end in order to trick hostb=
oot
>> bootloader into loading it.
>=20
> Ok.  Note that the qemu emulated machine doesn't model the hardware
> right down to the level of hostboot.  That's wy we're just loading
> skiboot and jumping straight into it usually.  I guess clg's stuff to
> load pnor images gets us a little closer to the hardware behaviour,
> but I think it's still only a rough approximation.

It's really tied to the OpenPOWER firmwares using the HIOMAP protocol
to discuss with the BMC and load the flash. We could loosen how QEMU=20
interprets the MTD device and use a property to inform QEMU that this
is an OpenPOWER  PNOR file and that skiboot and can be loaded from it.
Something to discuss.


I have applied this small hack to load larger -bios files :
=20
--- qemu-powernv-4.2.git.orig/hw/ppc/pnv.c
+++ qemu-powernv-4.2.git/hw/ppc/pnv.c
@@ -58,7 +58,7 @@
=20
 #define FW_FILE_NAME            "skiboot.lid"
 #define FW_LOAD_ADDR            0x0
-#define FW_MAX_SIZE             (4 * MiB)
+#define FW_MAX_SIZE             (64 * MiB)
=20
 #define KERNEL_LOAD_ADDR        0x20000000
 #define KERNEL_MAX_SIZE         (256 * MiB)

and coreboot.rom loads and boots and loops.


You can use -d exec,in_asm to check what's going on.


C.

