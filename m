Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08958A025
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:03:26 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfBs-0005ql-Oe
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJf9O-0004HH-Kl; Thu, 04 Aug 2022 14:00:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:59532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJf9L-0006xe-0p; Thu, 04 Aug 2022 14:00:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 45629746324;
 Thu,  4 Aug 2022 20:00:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C687B7462D3; Thu,  4 Aug 2022 20:00:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C11B5745702;
 Thu,  4 Aug 2022 20:00:42 +0200 (CEST)
Date: Thu, 4 Aug 2022 20:00:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
Message-ID: <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-309135532-1659636042=:2281"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-309135532-1659636042=:2281
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 4 Aug 2022, Cédric Le Goater wrote:
> [ Replying to all ]
>
> On 8/4/22 16:26, BALATON Zoltan wrote:
>> On Thu, 4 Aug 2022, Cédric Le Goater wrote:
>>> On 8/4/22 14:09, BALATON Zoltan wrote:
>>>> On Thu, 4 Aug 2022, Cédric Le Goater wrote:
>>>>> On 8/4/22 01:36, Daniel Henrique Barboza wrote:
>>>>>> Cedric,
>>>>>> 
>>>>>> On 8/3/22 10:28, Cédric Le Goater wrote:
>>>>>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>>>> ---
>>>>>>>   hw/ppc/ppc405.h    | 16 +++++++++++
>>>>>>>   hw/ppc/ppc405_uc.c | 71 
>>>>>>> +++++++++++++++++++++++++++++++---------------
>>>>>>>   2 files changed, 64 insertions(+), 23 deletions(-)
>>>>>>> 
>>>>>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>>>>>> index 1da34a7f10f3..1c7fe07b8084 100644
>>>>>>> --- a/hw/ppc/ppc405.h
>>>>>>> +++ b/hw/ppc/ppc405.h
>>>>>>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>>>>>>   typedef struct Ppc405SoCState Ppc405SoCState;
>>>>>>> +/* Peripheral controller */
>>>>>>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>>>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>>>>>>> +struct Ppc405EbcState {
>>>>>>> +    DeviceState parent_obj;
>>>>>>> +
>>>>>>> +    PowerPCCPU *cpu;
>>>>>>> +    uint32_t addr;
>>>>>>> +    uint32_t bcr[8];
>>>>>>> +    uint32_t bap[8];
>>>>>>> +    uint32_t bear;
>>>>>>> +    uint32_t besr0;
>>>>>>> +    uint32_t besr1;
>>>>>>> +    uint32_t cfg;
>>>>>>> +};
>>>>>>>   /* DMA controller */
>>>>>>>   #define TYPE_PPC405_DMA "ppc405-dma"
>>>>>>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>>>>>>       Ppc405OcmState ocm;
>>>>>>>       Ppc405GpioState gpio;
>>>>>>>       Ppc405DmaState dma;
>>>>>>> +    Ppc405EbcState ebc;
>>>>>>>   };
>>>>>>>   /* PowerPC 405 core */
>>>>>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>>>>>> index 6bd93c1cb90c..0166f3fc36da 100644
>>>>>>> --- a/hw/ppc/ppc405_uc.c
>>>>>>> +++ b/hw/ppc/ppc405_uc.c
>>>>>>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>>>>>> /*****************************************************************************/
>>>>>>>   /* Peripheral controller */
>>>>>>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>>>>>>> -struct ppc4xx_ebc_t {
>>>>>>> -    uint32_t addr;
>>>>>>> -    uint32_t bcr[8];
>>>>>>> -    uint32_t bap[8];
>>>>>>> -    uint32_t bear;
>>>>>>> -    uint32_t besr0;
>>>>>>> -    uint32_t besr1;
>>>>>>> -    uint32_t cfg;
>>>>>>> -};
>>>>>>> -
>>>>>>>   enum {
>>>>>>>       EBC0_CFGADDR = 0x012,
>>>>>>>       EBC0_CFGDATA = 0x013,
>>>>>>> @@ -411,10 +400,9 @@ enum {
>>>>>>>   static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>>>>>>   {
>>>>>>> -    ppc4xx_ebc_t *ebc;
>>>>>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>>>>>       uint32_t ret;
>>>>>>> -    ebc = opaque;
>>>>>>>       switch (dcrn) {
>>>>>>>       case EBC0_CFGADDR:
>>>>>>>           ret = ebc->addr;
>>>>>>> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int 
>>>>>>> dcrn)
>>>>>>>   static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>>>>>>   {
>>>>>>> -    ppc4xx_ebc_t *ebc;
>>>>>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>>>>> -    ebc = opaque;
>>>>>>>       switch (dcrn) {
>>>>>>>       case EBC0_CFGADDR:
>>>>>>>           ebc->addr = val;
>>>>>>> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int 
>>>>>>> dcrn, uint32_t val)
>>>>>>>       }
>>>>>>>   }
>>>>>>> -static void ebc_reset (void *opaque)
>>>>>>> +static void ppc405_ebc_reset(DeviceState *dev)
>>>>>>>   {
>>>>>>> -    ppc4xx_ebc_t *ebc;
>>>>>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>>>>>>       int i;
>>>>>>> -    ebc = opaque;
>>>>>>>       ebc->addr = 0x00000000;
>>>>>>>       ebc->bap[0] = 0x7F8FFE80;
>>>>>>>       ebc->bcr[0] = 0xFFE28000;
>>>>>>> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>>>>>>>       ebc->cfg = 0x80400000;
>>>>>>>   }
>>>>>>> -void ppc405_ebc_init(CPUPPCState *env)
>>>>>>> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
>>>>>>>   {
>>>>>>> -    ppc4xx_ebc_t *ebc;
>>>>>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>>>>>> +    CPUPPCState *env;
>>>>>>> +
>>>>>>> +    assert(ebc->cpu);
>>>>>>> +
>>>>>>> +    env = &ebc->cpu->env;
>>>>>>> -    ebc = g_new0(ppc4xx_ebc_t, 1);
>>>>>>> -    qemu_register_reset(&ebc_reset, ebc);
>>>>>>>       ppc_dcr_register(env, EBC0_CFGADDR,
>>>>>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>>>>>       ppc_dcr_register(env, EBC0_CFGDATA,
>>>>>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>>>>>   }
>>>>>>> +static Property ppc405_ebc_properties[] = {
>>>>>>> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
>>>>>>> +                     PowerPCCPU *),
>>>>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>>>>> +};
>>>>>>> +
>>>>>>> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
>>>>>>> +{
>>>>>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>>>>>> +
>>>>>>> +    dc->realize = ppc405_ebc_realize;
>>>>>>> +    dc->user_creatable = false;
>>>>>>> +    dc->reset = ppc405_ebc_reset;
>>>>>>> +    device_class_set_props(dc, ppc405_ebc_properties);
>>>>>>> +}
>>>>>>> +
>>>>>>> +void ppc405_ebc_init(CPUPPCState *env)
>>>>>>> +{
>>>>>>> +    PowerPCCPU *cpu = env_archcpu(env);
>>>>>>> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>>>>>>> +
>>>>>>> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), 
>>>>>>> &error_abort);
>>>>>> 
>>>>>> This line is breaking the boot of sam460ex:
>>>>>> 
>>>>>> 
>>>>>>   ./qemu-system-ppc64 -display none -M sam460ex
>>>>>> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
>>>>>> qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
>>>>>> Aborted (core dumped)
>>>>>> 
>>>>>> 
>>>>>> I think you meant to link the cpu prop of the EBC obj to the CPU 
>>>>>> object,
>>>>>> not the cpu prop of the CPU obj to the EBC dev.
>>>>> 
>>>>> Yes. ppc405_ebc_init() has only one user left, the sam460ex, which I 
>>>>> didn't
>>>>> test :/
>>>> 
>>>> This patch changes ppc405_ebc_init to a realize method so shouldn't the 
>>>> sam460ex be changed to create the new object instead of calling 
>>>> ppc405_ebc_init too instead? 
>>> 
>>> Sure.
>>> 
>>> First step was to make sure nothing was broken. I can add some extra
>>> patches in v3 to convert ppc405_ebc_init(), ppc4xx_plb_init() and
>>> ppc4xx_mal_init() in the ppc4x machines. I don't think that would be
>>> too much work. It's a good opportunity to modernize a bit the ppc4xx
>>> machines also.
>> 
>> OK, I did not mean to impose too much additional work but if a legacy init 
>> function only has one caller left maybe it's a good time to get rid of it 
>> at the same time when you converted the other caller. Those which have more 
>> users left could be addressed later if it would be too much work.
>> 
>>>> Is the only reason the keep ppc405_ebc_init to add the cpu link? 
>>> 
>>> Yes. That's all there is to it really: convert the routines
>>> parameters in object properties.
>>> 
>>>> As I noted before it would be nice to get rid of this link somehow, it 
>>>> would allow dropping this init func and a bunch of property descriptors 
>>>> where this cpu link is the only object. 
>>> 
>>> We should introduce a DCR namespace instead and use DCR memory regions
>>> but that's much more work.
>> 
>> Maybe that's a more complete solution but I think we could make it simpler 
>> even without going there yet.
>> 
>>>> It should be possble to get from a QOM object to its parent and the cpu 
>>>> from there but I could not find out how. Maybe somehow with 
>>>> object_resolve_path() or object_resolve_path_type() but I don't know QOM 
>>>> enough and did not find anything in docs.
>>>> 
>>>> Does somebody know how to do that? 
>>> 
>>> One way, would be to introduce a base class DCRDeviceState with a "cpu"
>>> link and a class handler to install the DCR read/write ops. But I think
>>> it's not worth the time and effort. Adding DCR namespace and DCR memory
>>> regions would be better.
>> 
>> Is this really necessary? Why do we have a qom-tree if objects can't 
>> navigate it? I think it should be possible to get to the cpu object from 
>> these soc devices without needing a link property for that. Ideally it 
>> should be able to get "../cpu" or shouldn't something like 
>> object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL) return the cpu 
>> object? 
>
> Yes. We could. I find it cleaner to use a property.

I don't like the property because it adds a significant number of lines to 
some otherwise simple devices that don't have any properties now (adding a 
property is at least 5 lines of code) so I think avoiding it would 
simplify it enough to worth trying to do without the property.

> It is true that "cpu" is only used at realize time to install the DCR
> handlers in the DCR table of the CPU. So there is not much value in
> keeping a pointer to the CPU under the device state struct. Once the
> DCR handlers are installed. We are done.

Then it would even better to get somehow get the cpu object from the QOM 
tree in realize once then the state struct also does not need the cpu 
reference so at least one more line less. Also don't need to assign the 
property so callers are simpler too (and cannot make the mistake you did 
above).

>> (Assiming there's only one which is true for these SoCs.) Then you could do 
>> this in the realize method and store the cpu in the state struct of the soc 
>> device 
>
> The CPU is already under the 405 SoC device, or you mean any SoC device ?
> I am not sure I am following. Send a code example !

I was trying to find out how to do it but I don't understand QOM enough to 
answer the simple question of how to get the cpu object from QOM. My 
guesses are:

object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL)

or maybe

object_resolve_path_at(OBJECT(dev)->parent, "cpu")

or how do these functions work and what is the preferred way to retrieve 
an object from the QOM tree? This is what I hoped someone with more 
understanding of QOM could answer.

We know that the dev (the device whose realize method we're in and want to 
get to the cpu) is likely at the same level as the cpu object (either both 
are in a soc or part of the machine) so we somehow need to either go up to 
our parent and search for a cpu there or start from /machine and find a 
cpu (the only one these machines have) so if the above path resolve 
functions go down the tree it should find it. If it only searches one 
level than we may need to try twice, once at /machine/soc and maybe once 
at /machine as most ppc4xx machines don't have a soc object yet (or maybe 
they do after your patches? can you show how "info qom-tree" looks after 
your patches for these machines?).

Does it make more sense or should I try to explain it more?

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>
>> so it does not have to be looked up every time or set externally via a 
>> property? That way no cpu link property is needed for all these soc devices 
>> only that they are added to a soc that already has a cpu added before.
>> 
>> 
>> We do have the parent field in the Object struct so you could theoretically 
>> just do object_resolve_path_at(obj->parent, "cpu") but all those fields are 
>> marked private and I could not find out what's the preferred way to get to 
>> this then. Could somebody with more knowledge about QOM chime in please?
>> 
>> Regards,
>> BALATON Zoltan
>
>
>
--3866299591-309135532-1659636042=:2281--

