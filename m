Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E665306E8D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:16:42 +0100 (CET)
Received: from localhost ([::1]:38476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l51Xk-0007Gr-RY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l51Uf-0006iq-SJ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:13:29 -0500
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:45266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l51Ud-0007ED-GP
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:13:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 595ED239E8A;
 Thu, 28 Jan 2021 08:13:23 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 08:13:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012a7f2fa9-346f-47cc-9adb-c853342bb25b,
 E57BA53B85CD0AA8C573FC380C1E6825DC018892) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 5/7] ppc/pnv: Discard internal BMC initialization when BMC
 is external
To: Joel Stanley <joel@jms.id.au>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-6-clg@kaod.org>
 <CACPK8Xd1oLKDB+zox3MwzqTbwsm0o8xULUKXFNCJeBG2tH_6+g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <22504deb-5fac-6b90-2948-d0bd35e3c4ca@kaod.org>
Date: Thu, 28 Jan 2021 08:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd1oLKDB+zox3MwzqTbwsm0o8xULUKXFNCJeBG2tH_6+g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9b929dd6-e750-44ca-920e-270b01133a37
X-Ovh-Tracer-Id: 7210825957077912483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludejmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffvefghfekteejheduveffudekgedvteeludfghfdvheeujefhhfetkedvgeeugeenucffohhmrghinhepohhpvghnphhofigvrhdrgiihiienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 1:48 AM, Joel Stanley wrote:
> On Tue, 26 Jan 2021 at 17:11, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The PowerNV machine can be run with an external IPMI BMC device
>> connected to a remote QEMU machine acting as BMC, using these options :
>>
>>   -chardev socket,id=ipmi0,host=localhost,port=9002,reconnect=10 \
>>   -device ipmi-bmc-extern,id=bmc0,chardev=ipmi0 \
>>   -device isa-ipmi-bt,bmc=bmc0,irq=10 \
>>   -nodefaults
> 
> Should this information also go in docs/system/ppc similar to the
> descriptions we have in docs/system/arm?

yes. 

Do you think we could reference :

    https://openpower.xyz/job/openpower/job/openpower-op-build/

?

Thanks,

C. 
 
>>
>> In that case, some aspects of the BMC initialization should be
>> skipped, since they rely on the simulator interface.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> 
>> ---
>>  hw/ppc/pnv_bmc.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
>> index 86d16b493539..b9bf5735ea0f 100644
>> --- a/hw/ppc/pnv_bmc.c
>> +++ b/hw/ppc/pnv_bmc.c
>> @@ -51,6 +51,11 @@ typedef struct OemSel {
>>  #define SOFT_OFF        0x00
>>  #define SOFT_REBOOT     0x01
>>
>> +static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
>> +{
>> +    return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
>> +}
>> +
>>  static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
>>  {
>>      /* IPMI SEL Event are 16 bytes long */
>> @@ -79,6 +84,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
>>      const struct ipmi_sdr_compact *sdr;
>>      uint16_t nextrec;
>>
>> +    if (!pnv_bmc_is_simulator(bmc)) {
>> +        return;
>> +    }
>> +
>>      offset = fdt_add_subnode(fdt, 0, "bmc");
>>      _FDT(offset);
>>
>> @@ -243,6 +252,10 @@ static const IPMINetfn hiomap_netfn = {
>>
>>  void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>>  {
>> +    if (!pnv_bmc_is_simulator(bmc)) {
>> +        return;
>> +    }
>> +
>>      object_ref(OBJECT(pnor));
>>      object_property_add_const_link(OBJECT(bmc), "pnor", OBJECT(pnor));
>>
>> @@ -286,7 +299,7 @@ static int bmc_find(Object *child, void *opaque)
>>
>>  IPMIBmc *pnv_bmc_find(Error **errp)
>>  {
>> -    ForeachArgs args = { TYPE_IPMI_BMC_SIMULATOR, NULL };
>> +    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
>>      int ret;
>>
>>      ret = object_child_foreach_recursive(object_get_root(), bmc_find, &args);
>> --
>> 2.26.2
>>
>>


