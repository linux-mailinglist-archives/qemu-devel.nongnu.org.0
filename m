Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB14414266
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:13:44 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwRr-0005UR-E4
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSwQ7-000491-Em; Wed, 22 Sep 2021 03:11:58 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mSwQ4-0006kQ-74; Wed, 22 Sep 2021 03:11:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 43DBEBF4B102;
 Wed, 22 Sep 2021 09:11:47 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 22 Sep
 2021 09:11:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0061ec201c0-0e0c-4cfa-a6ad-2d89dd356128,
 2BB727CE71B327F05EAAC08E3CEBB2C417F62D6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2afa987c-ee6d-c775-cabd-462cc556414c@kaod.org>
Date: Wed, 22 Sep 2021 09:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] spapr/xive: Fix kvm_xive_source_reset trace event
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20210922070205.1235943-1-clg@kaod.org>
 <20210922090627.12378b3b@bahia.huguette>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210922090627.12378b3b@bahia.huguette>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b20f6a90-fc62-411f-b4d0-cde8d0308009
X-Ovh-Tracer-Id: 15506737945440521184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiiedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) NICE_REPLY_A=-0.001,
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

On 9/22/21 09:06, Greg Kurz wrote:
> On Wed, 22 Sep 2021 09:02:05 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> The trace event was placed in the wrong routine. Move it under
>> kvmppc_xive_source_reset_one().
>>
>> Fixes: 4e960974d4ee ("xive: Add trace events")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks,

C.

> 
>>   hw/intc/spapr_xive_kvm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
>> index beb904d5bdee..bf43ffb54018 100644
>> --- a/hw/intc/spapr_xive_kvm.c
>> +++ b/hw/intc/spapr_xive_kvm.c
>> @@ -236,6 +236,8 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>>       SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
>>       uint64_t state = 0;
>>   
>> +    trace_kvm_xive_source_reset(srcno);
>> +
>>       assert(xive->fd != -1);
>>   
>>       if (xive_source_irq_is_lsi(xsrc, srcno)) {
>> @@ -328,8 +330,6 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,
>>           return xive_esb_rw(xsrc, srcno, offset, data, 1);
>>       }
>>   
>> -    trace_kvm_xive_source_reset(srcno);
>> -
>>       /*
>>        * Special Load EOI handling for LSI sources. Q bit is never set
>>        * and the interrupt should be re-triggered if the level is still
> 


