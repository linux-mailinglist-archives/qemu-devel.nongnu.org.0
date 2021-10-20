Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211A434A30
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:38:00 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9ux-00037H-5R
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1md9t1-0001SW-Qk; Wed, 20 Oct 2021 07:36:02 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1md9sx-0004hp-Cv; Wed, 20 Oct 2021 07:35:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3BC76748F5B;
 Wed, 20 Oct 2021 13:35:50 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 17011748F57; Wed, 20 Oct 2021 13:35:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 156357475FA;
 Wed, 20 Oct 2021 13:35:50 +0200 (CEST)
Date: Wed, 20 Oct 2021 13:35:50 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: CLI: Using -bios AND -kernel
In-Reply-To: <5d0b9827-616b-120b-3100-dac69fe86bed@redhat.com>
Message-ID: <f060a3df-a94-144-f555-40c9f1c1c4e3@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
 <YWQB1FMhQfmqRYxN@yekko> <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <054c5b53-84ab-370f-8806-5f54265e8d3e@redhat.com>
 <5d0b9827-616b-120b-3100-dac69fe86bed@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-727218841-1634729750=:8668"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-727218841-1634729750=:8668
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 20 Oct 2021, Thomas Huth wrote:
> On 20/10/2021 12.12, Philippe Mathieu-Daudé wrote:
>> Hi John / Paolo / Markus,
>> 
>> On 10/19/21 12:07, BALATON Zoltan wrote:
>>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>>> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>>>>> On 19/10/2021 11.31, Christophe Leroy wrote:
>> [...]
>>>> I use the following command, but it does nothing, it stays in uboot
>>>> prompt as when I don't get a kernel argument
>>>>
>>>>      ~/qemu/build/qemu-system-ppc -M taihu -bios
>>>> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio -kernel
>>>> arch/powerpc/boot/uImage
>>> 
>>> I'm not sure using -bios and -kernel together makes sense, it probably
>>> starts u-boot in this case and you have to load and start the kernel
>>> from u-boot as you'd notmally do on a real machine. Alternatively you
>>> could use -kernel instead of -bios which then loads a kernel and starts
>>> it directly but not sure if it needs a firmware to work.
>>> 
>>> Ot I could be completely wrong as I don't know this machine and haven't
>>> tried it.
>> 
>> Usually -bios overwrites -kernel/-append cmdline options.
>> Having them accepted together is probably a configuration mistake,
>> and we should reject that (generically).
>
> No, having -bios and -kernel together is perfectly fine if the BIOS knows 
> about it. Have a look at the ppc64 pseries machine, it works perfectly fine 
> with -bios and -kernel at the same time.

Also this way the board can decide what's right, In pegasos2 I added a 
warning for cases that may not work as expected to let users know but on 
other machines a firmware may be needed and -kernel could set firmware 
environment to boot that loaded kernel (this may be what ref405 is trying 
to do or e500 also messes with some boot_info struct that it writes to 
guest I think). So maybe there's no generic way to handle it. These 
options are just defined by the board which is not great for UI 
consistency but may be needed for enough flexibility to implement 
everything boards want.

Regards,
BALATON Zoltan
--3866299591-727218841-1634729750=:8668--

