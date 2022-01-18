Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82649491FB0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:11:28 +0100 (CET)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ieK-0000rF-9s
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9iSD-0007Jd-4d
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 01:58:53 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:49667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9iSA-00073f-3D
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 01:58:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1B66E20597;
 Tue, 18 Jan 2022 06:58:47 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 07:58:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001262dda10-97ac-444f-847b-6a04d41b0622,
 817DC8A55E710CB67D5DF258B9F54D73727C34FE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <452ecb0e-106d-6b4e-2fb7-bcf4958a9f10@kaod.org>
Date: Tue, 18 Jan 2022 07:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] ppc/pnv: Remove PHB4 version property
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220117122753.1655504-1-clg@kaod.org>
 <20220117122753.1655504-4-clg@kaod.org>
 <329048b5-819f-603b-7e5b-efd98df81598@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <329048b5-819f-603b-7e5b-efd98df81598@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 07e1c477-03ba-499b-b9e0-e0def622f302
X-Ovh-Tracer-Id: 7288513048379755485
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/17/22 20:50, Daniel Henrique Barboza wrote:
> 
> 
> On 1/17/22 09:27, Cédric Le Goater wrote:
>> and grab the PHB version from the PEC class directly when needed.
> 
> I guess we want a capital "A" when starting the commit msg

I just removed the 'and'.

Thanks,

C.


> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> 
> This change also makes pnv-phb4s a little closer with pnv-phb3s, given that we don't
> have a "Version" attribute exposed in the QOM for pnv-phb3s as well.
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
>>   hw/pci-host/pnv_phb4.c     | 9 +--------
>>   hw/pci-host/pnv_phb4_pec.c | 3 ---
>>   2 files changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index c688976caec9..a78add75b043 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -672,7 +672,7 @@ static uint64_t pnv_phb4_reg_read(void *opaque, hwaddr off, unsigned size)
>>       switch (off) {
>>       case PHB_VERSION:
>> -        return phb->version;
>> +        return PNV_PHB4_PEC_GET_CLASS(phb->pec)->version;
>>           /* Read-only */
>>       case PHB_PHB4_GEN_CAP:
>> @@ -1575,7 +1575,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       if (!phb->pec) {
>>           PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>>           PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>> -        PnvPhb4PecClass *pecc;
>>           BusState *s;
>>           if (!chip) {
>> @@ -1589,11 +1588,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>               return;
>>           }
>> -        /* All other phb properties are already set */
>> -        pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>> -        object_property_set_int(OBJECT(phb), "version", pecc->version,
>> -                                &error_fatal);
>> -
>>           /*
>>            * Reparent user created devices to the chip to build
>>            * correctly the device tree.
>> @@ -1688,7 +1682,6 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
>>   static Property pnv_phb4_properties[] = {
>>           DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
>>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>> -        DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
>>           DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
>>                            PnvPhb4PecState *),
>>           DEFINE_PROP_END_OF_LIST(),
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index a3c4b4ef850c..40d89fda56e5 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -117,7 +117,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>                                           Error **errp)
>>   {
>>       PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
>> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>>       object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
>> @@ -126,8 +125,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>                               &error_fatal);
>>       object_property_set_int(OBJECT(phb), "index", phb_id,
>>                               &error_fatal);
>> -    object_property_set_int(OBJECT(phb), "version", pecc->version,
>> -                            &error_fatal);
>>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>>           return;


