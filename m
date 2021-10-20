Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126E434E13
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:39:20 +0200 (CEST)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCkQ-0007ce-ST
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCce-0006fn-DT; Wed, 20 Oct 2021 10:31:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCcb-0001jU-BC; Wed, 20 Oct 2021 10:31:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 30E5B756044;
 Wed, 20 Oct 2021 16:31:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0B4FF75603A; Wed, 20 Oct 2021 16:31:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 08D99756036;
 Wed, 20 Oct 2021 16:31:09 +0200 (CEST)
Date: Wed, 20 Oct 2021 16:31:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: LEROY Christophe <christophe.leroy@csgroup.eu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
Message-ID: <19612059-3e61-f920-339c-63162a94dd22@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1607508830-1634740269=:45829"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1607508830-1634740269=:45829
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 20 Oct 2021, LEROY Christophe wrote:
> Le 20/10/2021 à 12:10, Cédric Le Goater a écrit :
>> I dont understand how
>>
>>    static bd_t bd;
>>
>> can be updated in the kernel.
>>
>
> It's not updated in the kernel.
>
> It is supposed to be provided by UBoot to Linux Kernel. But modern
> kernels don't take that anymore, they take a device tree. For this
> reason cuboot takes the content of bd to build/update the device tree.
>
> Looks like QEMU also provides the bd, see ref405ep_init()
>
> I managed to get a kernel booting with the following change (and with
> CONFIG_ETHERNET removed)
>
> diff --git a/arch/powerpc/boot/cuboot-hotfoot.c
> b/arch/powerpc/boot/cuboot-hotfoot.c
> index 888a6b9bfead..63a9545ff55d 100644
> --- a/arch/powerpc/boot/cuboot-hotfoot.c
> +++ b/arch/powerpc/boot/cuboot-hotfoot.c
> @@ -132,6 +132,12 @@ void platform_init(unsigned long r3, unsigned long
> r4, unsigned long r5,
>                    unsigned long r6, unsigned long r7)
>  {
>         CUBOOT_INIT();
> +        bd.bi_intfreq = 133333333;
> +        bd.bi_busfreq = 33333333;
> +        bd.bi_procfreq = 133333333;
> +        bd.bi_plb_busfreq = 33333333;
> +        bd.bi_pci_busfreq = 33333333;
> +        bd.bi_opbfreq = 33333333;
>         platform_ops.fixups = hotfoot_fixups;
>          platform_ops.exit = ibm40x_dbcr_reset;
>         fdt_init(_dtb_start);

So maybe taihu should also provide this boot info when linux_boot is true 
(i.e. using -kernel) like the ref405ep does? Usually when using -kernel 
without -bios then QEMU has to also emulate enough of what the firmware 
would otherwise do like setting up devices and setting boot environment. 
Or if we have both -bios and -kernel then maybe -kernel should tell the 
firmware to boot a kernel but that may need a way to do that like setting 
variables in nvram but we don't have models of that in taihu. This taihu 
machine seems to be an early skeleton that wasn't finished, the ref405ep 
seems to be more advanced.

Regards,
BALATON Zoltan
--3866299591-1607508830-1634740269=:45829--

