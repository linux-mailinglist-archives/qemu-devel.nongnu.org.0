Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B0589AA8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:01:40 +0200 (CEST)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJYbj-0005Oa-HR
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJYZ9-0003Zh-TN; Thu, 04 Aug 2022 06:58:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:26327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJYZ6-00030C-TD; Thu, 04 Aug 2022 06:58:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 14F9474632B;
 Thu,  4 Aug 2022 12:58:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B29897462D3; Thu,  4 Aug 2022 12:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B07F7745702;
 Thu,  4 Aug 2022 12:58:50 +0200 (CEST)
Date: Thu, 4 Aug 2022 12:58:50 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <d1082408-9e67-58cf-e6d7-f4b15c8681f6@ilande.co.uk>
Message-ID: <78d41555-f14b-bb4f-5b1f-9676d54e12d0@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <91bae6f7-1e68-6bf3-e2f-b31a5a78f2d@eik.bme.hu>
 <d1082408-9e67-58cf-e6d7-f4b15c8681f6@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1143838577-1659609475=:78256"
Content-ID: <3d2ee58-c33a-1312-9533-a8b8f71dd8@eik.bme.hu>
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

--3866299591-1143838577-1659609475=:78256
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <7ef89cef-50d0-7367-eed1-f3795cf0535f@eik.bme.hu>

On Thu, 4 Aug 2022, Mark Cave-Ayland wrote:
> On 04/08/2022 00:04, BALATON Zoltan wrote:
>> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>> hw/ppc/ppc405.h    | 16 +++++++++++
>>> hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>>> 2 files changed, 64 insertions(+), 23 deletions(-)
>>> 
>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>> index 1da34a7f10f3..1c7fe07b8084 100644
>>> --- a/hw/ppc/ppc405.h
>>> +++ b/hw/ppc/ppc405.h
>>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>> 
>>> typedef struct Ppc405SoCState Ppc405SoCState;
>>> 
>>> +/* Peripheral controller */
>>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>>> +struct Ppc405EbcState {
>>> +    DeviceState parent_obj;
>>> +
>>> +    PowerPCCPU *cpu;
>>> 
>>> +    uint32_t addr;
>>> +    uint32_t bcr[8];
>>> +    uint32_t bap[8];
>>> +    uint32_t bear;
>>> +    uint32_t besr0;
>>> +    uint32_t besr1;
>>> +    uint32_t cfg;
>>> +};
>>> 
>>> /* DMA controller */
>>> #define TYPE_PPC405_DMA "ppc405-dma"
>>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>>     Ppc405OcmState ocm;
>>>     Ppc405GpioState gpio;
>>>     Ppc405DmaState dma;
>>> +    Ppc405EbcState ebc;
>>> };
>>> 
>>> /* PowerPC 405 core */
>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index 6bd93c1cb90c..0166f3fc36da 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>> 
>>> /*****************************************************************************/
>>> /* Peripheral controller */
>>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>>> -struct ppc4xx_ebc_t {
>>> -    uint32_t addr;
>>> -    uint32_t bcr[8];
>>> -    uint32_t bap[8];
>>> -    uint32_t bear;
>>> -    uint32_t besr0;
>>> -    uint32_t besr1;
>>> -    uint32_t cfg;
>>> -};
>>> -
>>> enum {
>>>     EBC0_CFGADDR = 0x012,
>>>     EBC0_CFGDATA = 0x013,
>>> @@ -411,10 +400,9 @@ enum {
>>> 
>>> static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>> {
>>> -    ppc4xx_ebc_t *ebc;
>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>     uint32_t ret;
>>> 
>>> -    ebc = opaque;
>> 
>> I think QOM casts are kind of expensive (maybe because we have quo-debug 
>> enabled by default even without --enable-debug and it does additional 
>> checks; I've tried to change this default once but it was thought to be 
>> better to have it enabled). So it's advised to use QOM casts sparingly, 
>> e.g. store the result in a local variable if you need it more than once and 
>> so. Therefore I tend to consider these read/write callbacks that the object 
>> itself registers with itself as the opaque pointer to be internal to the 
>> object and guaranteed to be passed the object pointer so no QOM cast is 
>> necessary and the direct assignment can be kept. This avoids potential 
>> overhead on every register access. Not sure if it's measurable but I think 
>> if an overhead can be avoided it probably should be.
>
> Can you provide any evidence for this? IIRC the efficiency of the QOM cast 
> macros without --enable-debug was improved several years ago to the point 
> where their impact is minimal (note: this does not include 
> object_dynamic_cast()). From memory the previous discussions concluded that

It probably could be measured on a slower machine when something does a 
lot of register access but I did not have any concrete numbers to prove it 
and in this particular case not sure how often this device is accessed if 
it does anything at all. But this is a general remark for all devices. An 
IDE device could be accessed a lot of times for example so I generally 
try to avoid unnecessary overhead.

AFAIK (which could well be wrong) a QOM cast is optimised down to a simple 
cast if qom-debug is disabled. Problem is it's never disabled unless 
somebody explicitly compiles with --disable-qom-cast-debug as this is 
enabled by default, even in release builds without --enable-debug. At 
least that was the case when this was in configure, I don't know where it 
went during meson conversion but I think the default haven't changed. With 
qom-cast-debug a QOM cast is ultimately calling object_dynamic_cast_assert 
in OBJECT_CHECK.

Here is the discussion when I've tried to change this:

https://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03371.html

> whilst the QOM cast did add some runtime overhead, it was dwarfed by the cost 
> of breaking out of emulation to handle the MMIO access itself. If something 
> has changed here then that sounds like a bug.

Not saying it has changed but having something already slow is not an 
argument to make it even slower if that additional overhead can be 
avoided. Maybe that makes it a little less slow even if the main reason 
for slowness is not this.

> I think it's worth keeping the QOM casts in place unless there is a good 
> reason not to, simply because they have helped me many times in past catch 
> out refactoring mistakes. For example I can certainly imagine that the recent 
> PHB series would have been a lot more painful without having them.

A good reason in my opinion is that these are read/write callbacks of the 
object whith are registered in the realize method with the object itself 
as the opaque parameter which was already QOM cast from the realize 
method's device parameter so there's no way these read/wtite callbacks are 
called with an unchecked object. Therefore the QOM cast with check is 
unnecessary here and we can safely assign it to the appropriate type 
without checcking it again at every register access. Because of this, I 
always avoid QOM casts in these callback functions as this can only make 
things better and unlikely to make it worse.

The QOM casts are warranted in the object methods such as realize or init 
that maybe somehow could be called with a wrong object (I'm not sure why 
if these are object methods but maybe through a subclass or something) but 
not needed in register access callbacks that are internal to the object 
and only passed already checked objects.

Regards,
BALATON Zoltan
--3866299591-1143838577-1659609475=:78256--

