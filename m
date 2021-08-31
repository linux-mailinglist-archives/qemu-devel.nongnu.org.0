Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AC3FC96D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:11:49 +0200 (CEST)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4UO-0003z1-I8
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mL45U-0004rA-GT
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:46:04 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:40055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mL45E-0001WD-RH
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:46:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 51F722104F;
 Tue, 31 Aug 2021 13:45:45 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 15:45:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058d4b6e40-29b9-4e9e-8ab4-4e84619e1abf,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 13/26] ppc/pnv: Add POWER10 quads
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-14-clg@kaod.org> <YSXepFEmvf9luXo0@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a14e9e46-279e-24f8-c4b1-210b43132aa5@kaod.org>
Date: Tue, 31 Aug 2021 15:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSXepFEmvf9luXo0@yekko>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d837fa7c-afdd-4935-92d7-c96609e5fa8b
X-Ovh-Tracer-Id: 3641441776746269664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelgfejveehieefffduueehvdevfedtleeiudekjeegveeigfeifefhtdfffedtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 8:09 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 03:45:34PM +0200, Cédric Le Goater wrote:
>> Still needs some refinements on the XSCOM registers.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ppc/pnv.h |  3 +++
>>  hw/ppc/pnv.c         | 34 ++++++++++++++++++++++++++++++++++
>>  2 files changed, 37 insertions(+)
>>
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index a299fbc7f25c..13495423283a 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -128,6 +128,9 @@ struct Pnv10Chip {
>>      Pnv9Psi      psi;
>>      PnvLpcController lpc;
>>      PnvOCC       occ;
>> +
>> +    uint32_t     nr_quads;
>> +    PnvQuad      *quads;
>>  };
>>  
>>  #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index f75d90e61fa8..f670d97c5f91 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -1605,6 +1605,34 @@ static void pnv_chip_power10_instance_init(Object *obj)
>>      object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
>>  }
>>  
>> +
>> +static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
>> +{
>> +    PnvChip *chip = PNV_CHIP(chip10);
>> +    int i;
>> +
>> +    chip10->nr_quads = DIV_ROUND_UP(chip->nr_cores, 4);
>> +    chip10->quads = g_new0(PnvQuad, chip10->nr_quads);
>> +
>> +    for (i = 0; i < chip10->nr_quads; i++) {
>> +        char eq_name[32];
>> +        PnvQuad *eq = &chip10->quads[i];
>> +        PnvCore *pnv_core = chip->cores[i * 4];
>> +        int core_id = CPU_CORE(pnv_core)->core_id;
>> +
>> +        snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
>> +        object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
>> +                                           sizeof(*eq), TYPE_PNV_QUAD,
>> +                                           &error_fatal, NULL);
>> +
>> +        object_property_set_int(OBJECT(eq), "id", core_id, &error_fatal);
> 
> "id" might not be a good name for this, since "id" on QOM objects is
> nearly always the (usually) user assigned name - which is a string.

I will change PnvQuad before resending. 

Thanks,

C.


> 
>> +        qdev_realize(DEVICE(eq), NULL, &error_fatal);
>> +
>> +        pnv_xscom_add_subregion(chip, PNV10_XSCOM_EQ_BASE(eq->id),
>> +                                &eq->xscom_regs);
>> +    }
>> +}
>> +
>>  static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>>  {
>>      PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
>> @@ -1626,6 +1654,12 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> +    pnv_chip_power10_quad_realize(chip10, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>>      /* XIVE2 interrupt controller (POWER10) */
>>      object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
>>                              PNV10_XIVE2_IC_BASE(chip), &error_fatal);
> 


