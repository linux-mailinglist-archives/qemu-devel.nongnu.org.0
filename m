Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FAD5A2C6E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:39:28 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcMh-0006cQ-6o
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRcB4-0002oN-5U
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:27:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRcB2-0001BC-D3
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:27:25 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QGP0lO025866;
 Fri, 26 Aug 2022 16:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PdhaktwXlpYyfgNldNoqLEqsK2EHDNmIX5nFmGZn238=;
 b=apHwvHr4C+QfRVKTHYTseTxkF5ijZKI7Vxb4LtOo58ud11wUdhhULiPnjS5fWINA5um3
 +btmIxZ8kuR07qkA0oGX0ZM13f+rBCDqwpoRhqXMguf+RIHtz5S01jhEHDYWbeizC7NV
 vuGS/nWmYVXNpHaBJusJNphtPORjcE2sXrNZY2cZq633n0rCK9wUJlX1OhDCYa+ZusUR
 kmvd8pqYDjfYy9CMjiUfxPn6hMMIkQmu3Lz6JTj9UDJekWxQ8T0ggBgIeSVS4mvWihOK
 ZLqxOIAU/LQuhaST11Txwj6CZzSKnb6knHAc7G8c5RoBkKAunt3srq63rYtxv3eHG9Qx NA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j71nwg1b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 16:27:22 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27QGJtOj014178;
 Fri, 26 Aug 2022 16:27:21 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3j2q8a8wvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 16:27:21 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27QGRKbB5505670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 16:27:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A499FBE051;
 Fri, 26 Aug 2022 16:29:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 621C2BE054;
 Fri, 26 Aug 2022 16:29:21 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Aug 2022 16:29:21 +0000 (GMT)
Message-ID: <b27f4f82-87a6-c181-8fae-730e747ac14d@linux.ibm.com>
Date: Fri, 26 Aug 2022 12:27:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown under
 Xen
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220826143841.1515326-1-ross.lagerwall@citrix.com>
 <12d8f3b7-ae22-73c9-c0ab-eca403f421bb@linux.ibm.com>
 <PH0PR03MB6382266A55B2CDB9745015D5F0759@PH0PR03MB6382.namprd03.prod.outlook.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <PH0PR03MB6382266A55B2CDB9745015D5F0759@PH0PR03MB6382.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dDPuSUt4D7TaVNdjcUnAkFLaNiYa4PCs
X-Proofpoint-ORIG-GUID: dDPuSUt4D7TaVNdjcUnAkFLaNiYa4PCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260065
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 8/26/22 12:15, Ross Lagerwall wrote:
>> From: Stefan Berger <stefanb@linux.ibm.com>
>> Sent: Friday, August 26, 2022 4:20 PM
>> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Stefan Berger <stefanb@linux.vnet.ibm.com>
>> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
>> Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown under Xen
>>   
>> On 8/26/22 10:38, Ross Lagerwall wrote:
>>> When running under Xen and the guest reboots, it boots into a new domain
>>> with a new QEMU process (and a new swtpm process if using the emulator
>>> backend). The existing reset function is triggered just before the old
>>> QEMU process exists which causes QEMU to startup the TPM backend and
>>> then immediately shut it down. This is probably harmless but when using
>>> the emulated backend, it wastes CPU and IO time reloading state, etc.
>>>
>>> Fix this by calling the reset function directly from realize() when
>>> running under Xen. During a reboot, this will be called by the QEMU
>>> process for the new domain.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> ---
>>>
>>> This conditional logic is ugly. Is there a cleaner way of doing this?
>>>
>>>     hw/tpm/tpm_crb.c | 7 ++++++-
>>>     1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>>> index 67db594c48..ea930da545 100644
>>> --- a/hw/tpm/tpm_crb.c
>>> +++ b/hw/tpm/tpm_crb.c
>>> @@ -26,6 +26,7 @@
>>>     #include "sysemu/tpm_backend.h"
>>>     #include "sysemu/tpm_util.h"
>>>     #include "sysemu/reset.h"
>>> +#include "sysemu/xen.h"
>>>     #include "tpm_prop.h"
>>>     #include "tpm_ppi.h"
>>>     #include "trace.h"
>>> @@ -308,7 +309,11 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>>                          TPM_PPI_ADDR_BASE, OBJECT(s));
>>>         }
>>>
>>> -    qemu_register_reset(tpm_crb_reset, dev);
>>> +    if (xen_enabled()) {
>>> +        tpm_crb_reset(dev);
>>> +    } else {
>>> +        qemu_register_reset(tpm_crb_reset, dev);
>>> +    }
>>>     }
>>>
>>>     static void tpm_crb_class_init(ObjectClass *klass, void *data)
>>
>> This doesn't look right also for Xen. Shouldn't it be something like this?
>>
>>       qemu_register_reset(tpm_crb_reset, dev);
>>       if (xen_enabled()) {
>>          tpm_crb_reset(dev);
>>       }
>>
>>
>> We need the reset callback for VM reset.
> 
> This patch doesn't change anything for the QEMU/KVM case which works
> fine as is.
> 
> In the Xen architecture, the guest is rebooted into a new domain which
> has new instances of QEMU and swtpm. The old instances are terminated.
> So during a guest reboot it doesn't make sense to have the QEMU for the
> old domain call tpm_crb_reset() just as it is about to exit since it
> causes swtpm to be sent CMD_INIT which causes it to needlessly
> reinitialize and reload the state. Instead, the new QEMU instance
> post-reboot will call tpm_crb_reset() to start the backend directly from
> the realize() function, just as for the initial guest boot.


You should probably add this to the commit text because I wouldn't have 
known that a VM reset in Xen causes a new domain to be created...

> 
> Ross

