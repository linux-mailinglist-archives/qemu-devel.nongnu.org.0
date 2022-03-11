Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8364D61C5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 13:51:30 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSejx-0003Va-0v
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 07:51:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSeeg-0001Le-52
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:46:04 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:53825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSeeb-0005KH-2q
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 07:46:01 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E47B2234CF;
 Fri, 11 Mar 2022 12:45:53 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 11 Mar
 2022 13:45:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00226434384-ad00-43ca-b7b9-c5c40a046124,
 7C3D6D083EE6638E86D496FBA76E9F7F92D857AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8421661c-58b7-a448-9294-474524098650@kaod.org>
Date: Fri, 11 Mar 2022 13:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Thomas Huth
 <thuth@redhat.com>, <qemu-devel@nongnu.org>
References: <20220111131027.599784-1-danielhb413@gmail.com>
 <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
 <0afba7b7-3778-2799-a77b-54091386a42a@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0afba7b7-3778-2799-a77b-54091386a42a@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9ee7c91f-b2b9-4ee8-8a17-81caa75c694d
X-Ovh-Tracer-Id: 4936226669048335209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvvddggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeuheelfeevheehtdefvdevvdfggfekueekheffjeevhfevudevveeljeethfeunecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgvuggvrhhitgdrsggrrhhrrghtsehfrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

In 3/11/22 03:18, Daniel Henrique Barboza wrote:
> 
> 
> On 3/10/22 15:49, Thomas Huth wrote:
>> On 11/01/2022 14.10, Daniel Henrique Barboza wrote:
>>> Hi,
>>>
>>> This version implements Cedric's review suggestions from v4. No
>>> drastic design changes were made.
>>>
>>> Changes from v4:
>>> - patches 1,3,5: unchanged
>>> - patch 2:
>>>    * renamed function to pnv_phb4_xscom_realize()
>>>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
>>> - patch 4:
>>>    * changed pnv_phb4_get_stack signature to use chip and phb
>>>    * added a new helper called pnv_pec_stk_default_phb_realize() to
>>> realize the default phb when running with defaults
>>> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
>>>
>>> Daniel Henrique Barboza (5):
>>>    ppc/pnv: set phb4 properties in stk_realize()
>>>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>>>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>>>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>>>    ppc/pnv: turn pnv_phb4_update_regions() into static
>>
>> It's now possible to crash QEMU with the pnv-phb4 device:
>>
>> $ ./qemu-system-ppc64 -nographic -M powernv9 -device pnv-phb4
>> Unexpected error in object_property_try_add() at ../../devel/qemu/qom/object.c:1229:
>> qemu-system-ppc64: -device pnv-phb4: attempt to add duplicate property 'pnv-phb4[0]' to object (type 'power9_v2.0-pnv-chip')
>> Aborted (core dumped)
>>
>> Any ideas how to fix this?
> 
> Thanks for catching this up.
> 
> The issue here is that we're not handling the case where an user adds a pnv-phb4 device
> when running default settings (no -nodefaults). With default settings we are adding all
> pnv-phb4 devices that are available to the machine, having no room for any additional
> user creatable pnv-phb4 devices.
> 
> A similar situation happens with the powernv8 machine which errors out with a different
> error message:
> 
> $ ./qemu-system-ppc64 -nographic -M powernv8 -device pnv-phb3
> qemu-system-ppc64: -device pnv-phb3: Can't add chassis slot, error -16
> 
> 
> Adding all possible phbs by default is a behavior these machines had since they were introduced,
> and I don't think we want to change it. Thus, a fix would be to forbid user created pnv-phb devices
> when running with defaults.


On a real system with POWER{8,9,10} processors, PHBs are sub-units of
the processor, they can be deactivated by firmware but not plugged in
or out like a PCI adapter on a slot. Nevertheless, it seemed to be
good idea to have user-created PHBs for testing purposes.

Let's come back to the PowerNV requirements.

  1. having a limited set of PHBs speedups boot time.
  2. it is useful to be able to mimic a partially broken topology you
     some time have to deal with during bring-up.

PowerNV is also used for distro install tests and having libvirt
support eases these tasks. libvirt prefers to run the machine with
-nodefaults to be sure not to drag unexpected devices which would need
to be defined in the domain file without being specified on the QEMU
command line. For this reason :

  3. -nodefaults should not include default PHBs

The solution we came with was to introduce user-created PHB{3,4,5}
devices on the powernv{8,9,10} machines. Reality proves to be a bit
more complex, internally when modeling such devices, and externally
when dealing with the user interface.

So, to make sure that we don't ship a crappy feature in QEMU 7.0,
I think we should step back a little.

Req 1. and 2. can be simply addressed differently with a machine option:
"phb-mask=<uint>", which QEMU would use to enable/disable PHB device
nodes when creating the device tree.

For Req 3., we need to make sure we are taking the right approach. It
seems that we should expose a new type of user-created PHB device,
a generic virtualized one, that libvirt would use and not one depending
on the processor revision. This needs more thinking.

Hence, I am proposing we drop user-created PHB{3,4,5} for QEMU-7.0.
All the cleanups we did are not lost and they will be useful for the
next steps in QEMU 7.1.


Thanks,

C.


