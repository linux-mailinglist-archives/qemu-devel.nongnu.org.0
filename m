Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A301F45F332
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 18:53:39 +0100 (CET)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqfPm-0002YO-A8
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 12:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqfNz-0001d7-0n
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:51:47 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:51071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqfNw-0005De-5G
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 12:51:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id AFA1C21229;
 Fri, 26 Nov 2021 17:51:40 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 18:51:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016da221e8-504c-4d5c-b09a-15f347cdef37,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <077efeac-3672-8b8f-dbe4-901c47c23eda@kaod.org>
Date: Fri, 26 Nov 2021 18:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <20211125224202.632658-1-danielhb413@gmail.com>
 <YaA0SIVnltlrarQZ@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YaA0SIVnltlrarQZ@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 39a033a7-a6a1-4692-85ff-b56de4b0a24c
X-Ovh-Tracer-Id: 2210141520938240992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 02:11, David Gibson wrote:
> On Thu, Nov 25, 2021 at 07:42:02PM -0300, Daniel Henrique Barboza wrote:
>> If one tries to use -machine powernv9,accel=kvm in a Power9 host, a
>> cryptic error will be shown:
>>
>> qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, only "-cpu host" is possible
>> qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
>>
>> Appending '-cpu host' will throw another error:
>>
>> qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
>>
>> The root cause is that in IBM PowerPC we have different specs for the bare-metal
>> and the guests. The bare-metal follows OPAL, the guests follow PAPR. The kernel
>> KVM modules presented in the ppc kernels implements PAPR. This means that we
>> can't use KVM accel when using the powernv machine, which is the emulation of
>> the bare-metal host.
>>
>> All that said, let's give a more informative error in this case.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/pnv.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 71e45515f1..e5b87e8730 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
>>       DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
>>       DeviceState *dev;
>>   
>> +    if (kvm_enabled()) {
>> +        error_report("The powernv machine does not work with KVM acceleration");
>> +        exit(EXIT_FAILURE);
>> +    }
> 
> 
> Hmm.. my only concern here is that powernv could, at least
> theoretically, work with KVM PR.  I don't think it does right now,
> though.

At the same time, it is nice to not let the user think that it could work
in its current state. Don't you think so ?

C.

> 
>> +
>>       /* allocate RAM */
>>       if (machine->ram_size < mc->default_ram_size) {
>>           char *sz = size_to_str(mc->default_ram_size);
> 


