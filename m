Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F12D554C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:25:29 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHGS-0005Bv-RL
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1knHF8-0004lN-L4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:24:07 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:59337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1knHF5-0004VN-9J
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:24:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 9086E7951994
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:23:59 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 09:23:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f2af9daf-a867-4f35-9420-3f3e26a362e8,
 35DF0118C1BD2D4E469FA4C27706E890450E7B32) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
To: <qemu-devel@nongnu.org>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
 <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
 <b8474a48-5dcd-343e-ef29-531c628b2ff2@redhat.com>
 <20201209182617.GV1289986@habkost.net> <20201209212436.2f7a1b6f@bahia.lan>
 <20201209205404.GY1289986@habkost.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2c40b46d-3103-1384-327a-e2418ed91e1d@kaod.org>
Date: Thu, 10 Dec 2020 09:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209205404.GY1289986@habkost.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2a6b3f4c-3a91-4997-83b6-4e12cf91a357
X-Ovh-Tracer-Id: 15789338819551267607
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejledguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 9:54 PM, Eduardo Habkost wrote:
> On Wed, Dec 09, 2020 at 09:24:36PM +0100, Greg Kurz wrote:
>> On Wed, 9 Dec 2020 13:26:17 -0500
>> Eduardo Habkost <ehabkost@redhat.com> wrote:
>>
>>> On Wed, Dec 09, 2020 at 07:11:40PM +0100, Philippe Mathieu-Daudé wrote:
>>> [...]
>>>>>>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
>>>>>>>>      int i;
>>>>>>>>  
>>>>>>>>      for (i = 0; i < cc->nr_threads; i++) {
>>>>>>>> -        spapr_reset_vcpu(sc->threads[i]);
>>>>>>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
>>>>>>>
>>>>>>> Why reset() needs access to the machine state, don't
>>>>>>> you have it in realize()?
>>>>>>>
>>>>>>
>>>>>> This is for the vCPU threads of the sPAPR CPU core. They don't have the
>>>>>> link to the machine state.
>>>>>
>>>>> They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
>>>>> spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
>>>>> something?
>>>>
>>>> Anyhow, from a QOM design point of view, resetfn() is not the correct
>>>> place to set a property IMHO, so Cc'ing Eduardo.
>>>
>>> This patch is not setting the property on resetfn(), it is
>>> setting it on CPU core pre_plug().
>>>
>>> This is more complex than simply using qdev_get_machine() and I
>>> don't see why it would be better, but I don't think it's wrong.
>>>
>>
>> The reference to the machine state is basically needed to
>> setup/reset/teardown interrupt presenters in the IRQ chip
>> backend. It is a bit unfortunate to express this dependency
>> at realize(), reset() and unrealize(). Maybe having an
>> "irq_chip" property linked to the IRQ chip backend would
>> make more sense ?
>>
> 
> Considering that the spapr_irq_*() functions get a
> SpaprMachineState argument and deal with two interrupt
> controllers, maybe you won't be able to save what you need in a
> single irq_chip field?

The sPAPR machine needs to operate on all available interrupt 
controllers and the array is built under the spapr_irq* routines 
with : 

    SpaprInterruptController *intcs[] = ALL_INTCS(spapr);

We could add the array under the machine and use a link to that
instead but we need to keep the existing interrupt controllers 
anyway because of migration compatibility.
 
> I don't have a strong opinion here.  It feels weird to me to save
> a reference to the global machine object that is always
> available, but I don't think that's a problem if you believe the
> resulting code looks better.

I think it's a good cleanup to remove globals. QEMU might emulate 
multiple "machines" in a single binary one day.

C.

