Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757263FB1C1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:17:27 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbXq-0001uN-5w
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mKbVp-0007rN-6l; Mon, 30 Aug 2021 03:15:21 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:42983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mKbVn-00061B-GW; Mon, 30 Aug 2021 03:15:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8E384BB7FF94;
 Mon, 30 Aug 2021 09:15:15 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 09:15:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e15a98ab-d4dc-4b2a-8700-d3b2c2d30c86,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH 06/26] ppc/pnv: add a chip topology index for POWER10
To: Greg Kurz <groug@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-7-clg@kaod.org> <20210820161213.1634f63f@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8eb25f31-ce30-e478-c68d-e5ca35d66692@kaod.org>
Date: Mon, 30 Aug 2021 09:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820161213.1634f63f@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6f840276-87ff-4737-b4ec-2e4835091b1b
X-Ovh-Tracer-Id: 9620533229825788896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 4:12 PM, Greg Kurz wrote:
> On Mon, 9 Aug 2021 15:45:27 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Maybe add a short description of its purpose in the changelog
> for the records ? What's the difference with "ibm,chip-id" ?


yep. I will add a comment.

Thanks,

C. 

>> ---
>>  hw/ppc/pnv_xscom.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
>> index be7018e8ac59..faa488e3117a 100644
>> --- a/hw/ppc/pnv_xscom.c
>> +++ b/hw/ppc/pnv_xscom.c
>> @@ -284,6 +284,8 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
>>      _FDT(xscom_offset);
>>      g_free(name);
>>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_id)));
>> +    _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-index",
>> +                           chip->chip_id)));
>>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));
>>      _FDT((fdt_setprop_cell(fdt, xscom_offset, "#size-cells", 1)));
>>      _FDT((fdt_setprop(fdt, xscom_offset, "reg", reg, sizeof(reg))));
> 


