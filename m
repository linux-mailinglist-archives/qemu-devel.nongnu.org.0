Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21F3ED377
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:59:19 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbGw-0006dE-OX
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFbFw-0005HO-75; Mon, 16 Aug 2021 07:58:17 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mFbFt-0008CH-6h; Mon, 16 Aug 2021 07:58:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8EE397462D3;
 Mon, 16 Aug 2021 13:58:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD16D7457EE; Mon, 16 Aug 2021 13:58:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CB744745708;
 Mon, 16 Aug 2021 13:58:08 +0200 (CEST)
Date: Mon, 16 Aug 2021 13:58:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
In-Reply-To: <1e0f11ef-fd72-0e96-279f-f02463f96442@amsat.org>
Message-ID: <9c79035-2fb5-cc7-9530-eedaa69aebec@eik.bme.hu>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <1e0f11ef-fd72-0e96-279f-f02463f96442@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-784112854-1629115088=:44179"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-784112854-1629115088=:44179
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 16 Aug 2021, Philippe Mathieu-Daudé wrote:
> On 8/16/21 12:26 PM, Peter Maydell wrote:
>> On Mon, 16 Aug 2021 at 06:46, David Gibson <david@gibson.dropbear.id.au> wrote:
>>>
>>> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>>>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>>>> enabled in devicetree files, they are instantiated in Linux but
>>>> obviously won't work. Disable associated devicetree nodes to prevent
>>>> unpredictable behavior.
>>>>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> I'll wait for Zoltan's opinion on this, but this sort of thing is why
>>> I was always pretty dubious about qemu *loading* a dtb file, rather
>>> than generating a dt internally.
>>
>> My take is that if you have to modify the dtb file to get QEMU to
>> work, then that's a bug in QEMU that should be fixed. It's no
>> worse than for the machines we have that don't use dtb and where
>> the kernel just knows what the hardware is. (In my experience
>> Arm kernels can be a bit finicky about wanting the right dtb
>> and not some earlier or later one, so I think at least for Arm
>> trying to generate a dt for our non-virt boards would have been
>> pretty painful and liable to "new kernels don't boot any more" bugs.)
>>
>> Is it sufficient to create stub "unimplemented-device" ethernet
>> controllers here, or does the guest want more behaviour than that?
>
> For raspi4 "unimplemented-device" is not enough, so what would
> be the ideal resolution for "the guest wants more behaviour"
> when we don't have time / interest / specs for the missing
> pieces?

I guess ideal solution is to implement the missing device emulation, if we 
don't have resources for that effort then that's less than ideal but in 
that case patching the dtb to disable the device does not look too bad to 
me. I think that's an acceptable way to save the effort of implementing 
the device that's not srtictly needed. For sam460ex I think Linux has 
booted so far but displays an error about missing ethernet ports but this 
did not prevent it from booting. So unless recent kernels fail now, this 
patch is only suppresses those errors (and avoid going to code paths in 
guest kernel that probably never run on real hadware). I think there are 
arguments for and against it (the errors look ugly so we could prevent it 
but on the other hand then we have something different than on real 
hardware however missing the device means it's really different) so I'm 
not quite decided about either approach but I tend to try to keep it as 
similar to real hardware as possible (so using unmodified dtb) as long as 
it does not cause real problems. But if patching the dtb makes it nicer by 
avoiding a big and maybe confusing error message on boot and it does not 
break anything else then that's OK too.

Regards,
BALATON Zoltan
--3866299591-784112854-1629115088=:44179--

