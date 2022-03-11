Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8884D5CAE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:48:57 +0100 (CET)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSa18-0006yd-Nb
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSZyy-0005Gz-Pt
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:46:40 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSZyw-0007LI-O6
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:46:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8DF2B22B09;
 Fri, 11 Mar 2022 07:46:36 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 11 Mar
 2022 08:46:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00149d094a3-0626-4ce1-964a-74b8dbc75b18,
 79B1F22DAD7DBC473036ED04AB85CFE0B7BEDBC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e736d043-4700-d8d3-6c9a-72241a68c3ab@kaod.org>
Date: Fri, 11 Mar 2022 08:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/xive2: Make type Xive2EndSource not user creatable
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220311074352.171536-1-clg@kaod.org>
 <d2d88ebe-d145-5e6f-2133-08901eb4e718@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d2d88ebe-d145-5e6f-2133-08901eb4e718@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 55b4744f-36e8-4936-a7dc-942715bfdfc1
X-Ovh-Tracer-Id: 18328524583786351581
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 3/11/22 08:45, Thomas Huth wrote:
> On 11/03/2022 08.43, Cédric Le Goater wrote:
>> Xive2EndSource objects can only be instantiated through a Xive2Router
>> (PnvXive2).
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/intc/xive2.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
>> index b6452f14784b..3aff42a69ef5 100644
>> --- a/hw/intc/xive2.c
>> +++ b/hw/intc/xive2.c
>> @@ -1000,6 +1000,7 @@ static void xive2_end_source_class_init(ObjectClass *klass, void *data)
>>       dc->desc    = "XIVE END Source";
>>       device_class_set_props(dc, xive2_end_source_properties);
>>       dc->realize = xive2_end_source_realize;
>> +    dc->user_creatable = false;
>>   }
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

And,

Fixes: f8a233dedf25 ("ppc/xive2: Introduce a XIVE2 core framework")

Thanks,

C.
  


