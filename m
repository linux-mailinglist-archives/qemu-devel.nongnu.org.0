Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5B44649B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:05:39 +0100 (CET)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizqc-0001OY-Cv
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mizge-000553-Vo
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:55:27 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mizgZ-0003fU-Gf
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:55:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1806CC9B02D6;
 Fri,  5 Nov 2021 14:54:59 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 14:54:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00558b98e41-11cd-4f1c-b671-bdd47a994971,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f5264f8a-4bce-a8f4-235e-9253738240bd@kaod.org>
Date: Fri, 5 Nov 2021 14:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>, <groug@kaod.org>, <danielhb413@gmail.com>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211105034640.53754-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e4a611f9-4d87-4acd-87e1-97409dda15b9
X-Ovh-Tracer-Id: 4013551696605121318
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgeffteffieejheehveekgfefhfffveffuedtvdeftdffjeeijefhheeljefhudenucffohhmrghinhepohiilhgrsghsrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 04:46, David Gibson wrote:
> As our day jobs and interests have moved onto other things, Greg and I have
> been struggling to keep on top of maintainership of target/ppc and
> associated pieces like the pseries and powernv machine types, with their
> platform specific devices.
> 
> We've therefore discussed and plan to transfer maintainership to Cédric Le
> Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and Daniel
> have been actively contributing to the area for some time, and they're
> supported in this by their current employer, IBM, who has an obvious
> interest in the platform.


IBM business has changed focus and pseries/KVM will be less in
the spotlights. Nevertheless, there is a large code base we want
to keep running and not break. Migration compatibility is the
most complex part of it. I hope we will be able to automate some
of the non-regression tests RedHat/IBM have. Not an easy part
I admit.


There are plenty of contributors who help on very large parts
of QEMU-PPC.

Richard and the Eldorado team are watching closely instruction
implementation,
Mark is doing the same for MAC machines,
Balaton for 44x and 46x and associated machines.
Thomas showed he could bring back from the dead any forgotten board,
Alex Graf still admins the qemu-ppc mailin list.
It was nicely hooked to patchwork by the OzLabs recently :

     https://patchwork.ozlabs.org/project/qemu-ppc/list/

we might add some simple automation on the received patches,
"does the patch apply ?" for instance. Anyhow, it's an easy way
to share the review between people.

Daniel, Bharata, Fabiano, Nick, You and Greg for pseries, and
Alexey, for SLOF+VOF also. I am still around for PowerNV, XIVE, XICS.

Christophe is doing his best to keep alive Linux ppc405.

Michael does kernel CI testing on all these platforms :

     https://github.com/linuxppc/ci-scripts/tree/master/scripts/boot

Guenter also does :

     https://github.com/groeck/linux-build-test/tree/master/rootfs/ppc

and skiboot :

     https://github.com/open-power/skiboot/tree/master/opal-ci

GitLab does even more.

and we have Philippe, always here to make sure every grain of sand
has been examined.

We don't feel alone :)

> Greg and I do plan to stay around in some capacity for at least the next
> 6 months, providing reviews and advice to assist the new maintainers into
> the role.

Thanks for the time and assistance for all these years. Pseries
and PowerNV would not be in such a good shape without all the
efforts you have put into them.

I suppose emulation will take a larger part of our time now since
it is largely used for pseries/powernv development in IBM. We will
see how that goes.

> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Acked-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>   MAINTAINERS | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 797be5b366..066c4fb2b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,8 +262,10 @@ F: hw/openrisc/
>   F: tests/tcg/openrisc/
>   
>   PowerPC TCG CPUs
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: target/ppc/
> @@ -382,8 +384,10 @@ F: target/mips/kvm*
>   F: target/mips/sysemu/
>   
>   PPC KVM CPUs
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   S: Maintained
>   F: target/ppc/kvm.c
>   
> @@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
>   F: tests/acceptance/ppc_prep_40p.py
>   
>   sPAPR
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/*/spapr*
> @@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
>   
>   Virtual Open Firmware (VOF)
>   M: Alexey Kardashevskiy <aik@ozlabs.ru>
> +R: Cédric Le Goater <clg@kaod.org>
> +R: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> 


