Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BE54507C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:17:53 +0200 (CEST)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJuy-0007Jy-8O
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1nzIlR-0003oa-PM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:04:01 -0400
Received: from vulcan.kevinlocke.name
 ([2001:19f0:5:727:1e84:17da:7c52:5ab4]:48549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1nzIlK-0008Id-QH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:03:57 -0400
Received: from kevinolos.kevinlocke.name
 (2600-6c67-5000-3d1b-c8c1-cd06-7ee8-5d26.res6.spectrum.com
 [IPv6:2600:6c67:5000:3d1b:c8c1:cd06:7ee8:5d26])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 8C1402EFA4EC;
 Thu,  9 Jun 2022 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kevinlocke.name;
 s=vulcan; t=1654783429;
 bh=Q/G9WFFXIWgV6v32upzJGLWnz6pHWbPm1nSdvFhgbrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIDkNqJP/BVSN3/7HKNRxAQxJLOTOdI73i59Rakcv9ARs4/Re0fX7qWlnLOhYgSso
 loKti15YM98FCQSBZ1Adf5W1IMxz7bgXPyISYKGlfdhF6MVARGqTHIlfVkBYMUy2LV
 81cTL3fnyzzXFsr2ehQqIbdzuUwg229Heq0GYsKw=
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id 3FA48130015A; Thu,  9 Jun 2022 08:03:46 -0600 (MDT)
Date: Thu, 9 Jun 2022 08:03:46 -0600
From: Kevin Locke <kevin@kevinlocke.name>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
 Laine Stump <laine@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC][PATCH] docs: note exception for PCIe IO port access
Message-ID: <YqH9wt/L7vcmFe8T@kevinlocke.name>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
Received-SPF: pass client-ip=2001:19f0:5:727:1e84:17da:7c52:5ab4;
 envelope-from=kevin@kevinlocke.name; helo=vulcan.kevinlocke.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 10:58:12 -0400
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

Thanks Laszlo, I really appreciate the detailed explanation and
feedback!

On Thu, 2022-06-09 at 09:45 +0200, Laszlo Ersek wrote:
> (a) your original (non-functional) use case:
> 
> qemu-system-x86_64 \
>     -no-user-config \
>     -nodefaults \
>     -machine q35,accel=kvm \
>     -m 1G \
>     -cdrom "$iso" \
>     -device pcie-root-port,id=pci.1,bus=pcie.0 \
>     -device VGA,bus=pci.1
> 
> violates the following part of "pcie.txt":
> 
>> Plugging a PCI device into a PCI Express slot might not always work and
>> is weird anyway since it cannot be done for "bare metal".
> 
> AIUI, what Gerd explains in that SeaBIOS thread is why and how exactly
> such an attempt breaks. The statement that it would break is already
> spelled out in "pcie.txt".
> 
> So I think that, given strictly your original report on the SeaBIOS
> list, no updates to "pcie.txt" are necessary.
> 
> Note that your original (functional) use case:
> 
> qemu-system-x86_64 \
>     -no-user-config \
>     -nodefaults \
>     -machine q35,accel=kvm \
>     -m 1G \
>     -cdrom "$iso" \
>     -device VGA
> 
> does not conflict with
> 
>> Place only the following kinds of devices directly on the Root Complex:
>>     (1) PCI Devices (e.g. network card, graphics card, IDE controller),
>>         not controllers. Place only legacy PCI devices on
>>         the Root Complex. These will be considered Integrated Endpoints.
>>         Note: Integrated Endpoints are not hot-pluggable.
>>
>>         Although the PCI Express spec does not forbid PCI Express devices as
>>         Integrated Endpoints, existing hardware mostly integrates legacy PCI
>>         devices with the Root Complex. Guest OSes are suspected to behave
>>         strangely when PCI Express devices are integrated
>>         with the Root Complex.
> 
> because "-device VGA" is a legacy PCI device, not a PCI Express device.
> So the second quoted paragraph does not apply to it at all, and the
> first paragraph is in sync with your functional use case.

Ah, right you are.  My mistake.  Sorry for the noise.

I had thought virtio-vga might be an exception, since there was
discussion about changing virtio-vga to PCIe when connected to the
Root Complex[4], but it looks like the change was not made due to
compatibility concerns[5].  As you note below, this is currently the
case for all devices with VGA compatibility, so this docs change is
mostly a non-issue as long as this continues to be the case.

On Thu, 2022-06-09 at 09:45 +0200, Laszlo Ersek wrote:
> While VGA is quirky ("there was only ever intended to be one device" --
> see
> <http://vfio.blogspot.com/2014/08/whats-deal-with-vga-arbitration.html>),
> I maintain that it's sufficiently covered already (although not
> specifically) by "pcie.txt"; see above. "-device VGA" is a legacy PCI
> device, you can't plug it in an Express slot (root complex or port
> alike).
> 
> In the blog post at
> <https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/>, Gerd
> explains that (effectively) only "bochs-display" and "virtio-gpu-pci"
> (from QEMU's emulated devices) may be placed in PCI Express slots (root
> complex or separate port, alike).

Those posts are both enlightening, thanks!

On Thu, 2022-06-09 at 09:45 +0200, Laszlo Ersek wrote:
> On 06/09/22 04:00, Kevin Locke wrote:
>> and whether "Guest OSes are suspected to behave strangely when PCI
>> Express devices are integrated with the Root Complex" is still the case.
> 
> I vaguely recall that Alex didn't fully agree with this statement when
> the document was being reviewed.
> 
>> David Gibson had previously noted that graphics cards appear on the Root
>> Complex on real hardware.[3]
> 
> You forgot to provide the link for [3].

Whoops.  Links to my qemu-discuss post[2] and David Gibson's post[3]
mentioning "the GPU shows up as an integrated PCI Express endpoint" on
his laptop are included in this email below.

On Thu, 2022-06-09 at 09:45 +0200, Laszlo Ersek wrote:
> On 06/09/22 04:00, Kevin Locke wrote:
> Anyway, the full paragraph in the document goes like
> 
>>         Although the PCI Express spec does not forbid PCI Express devices as
>>         Integrated Endpoints, existing hardware mostly integrates legacy PCI
>>         devices with the Root Complex. Guest OSes are suspected to behave
>>         strangely when PCI Express devices are integrated
>>         with the Root Complex.
> 
> So the recommendation is based on motherboards seen in the wild, and the
> potential consequent assumptions in OSes. Whether that still holds up
> with today's motherboards (and OSes), I have no clue about.
> 
> [...]
> 
>> --- a/docs/pcie.txt
>> +++ b/docs/pcie.txt
>> @@ -48,6 +48,11 @@ Place only the following kinds of devices directly on the Root Complex:
>>          strangely when PCI Express devices are integrated
>>          with the Root Complex.
>>
>> +        An exception to this rule is PCI Express devices which will be
>> +        accessed using IO ports.
> 
> I find this too general; a PCI Express device is supposed to work
> without IO resources. Graphics cards with legacy VGA compatibility are
> the exception AIUI (see again Alex's blog about VGA arbitration), so we
> should spell that out.
> 
> Furthermore, from QEMU's emulated graphics cards, all device models that
> provide VGA compatibility are legacy PCI (not PCI Express) devices (see
> again Gerd's post: VGA, virtio-vga, qxl-vga, cirrus-vga, ati-vga), so
> I'd even restrict this docs update to assigned GPUs.
> 
> [...]
> 
> How about inserting a new paragraph here, instead:
> 
>     (2) Assigned PCI Express GPUs that offer legacy VGA compatibility,
>         and that such compatibility is expected of (due to booting with
>         SeaBIOS, or due to UEFI driver bugs or native OS driver bugs).

That sounds great to me.  Would you like me to send that as a v2
patch, or would you prefer to make the change?

Thanks again,
Kevin

[2]: https://lists.nongnu.org/archive/html/qemu-discuss/2022-05/msg00053.html
[3]: https://lore.kernel.org/qemu-devel/20170209041634.GC14524@umbus/
[4]: https://lore.kernel.org/qemu-devel/20170208061602.17666-1-david@gibson.dropbear.id.au/T/
[5]: https://lore.kernel.org/qemu-devel/5ea3785c-b979-8b8c-3ab0-243d69384697@redhat.com/

