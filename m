Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775C2D535
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 07:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVrRu-0003Db-Mz
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 01:48:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hVrQT-0002bc-Uk
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hVrQS-0003rN-PZ
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:47:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44020
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
	id 1hVrQS-0003pp-Lf
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:47:00 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4T5hSGv077120
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 01:46:58 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sskwsrnb8-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 01:46:57 -0400
Received: from localhost
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
	Wed, 29 May 2019 06:46:56 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
	by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 29 May 2019 06:46:54 +0100
Received: from b03ledav001.gho.boulder.ibm.com
	(b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4T5krXX59048180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 29 May 2019 05:46:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57EFA6E050;
	Wed, 29 May 2019 05:46:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A43996E04C;
	Wed, 29 May 2019 05:46:51 +0000 (GMT)
Received: from [9.124.31.56] (unknown [9.124.31.56])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2019 05:46:51 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <155591636364.20338.844048953355207313.stgit@aravinda>
	<155591662496.20338.3862565585716109724.stgit@aravinda>
	<20190510065144.GM20559@umbus.fritz.box>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Wed, 29 May 2019 11:16:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190510065144.GM20559@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19052905-0016-0000-0000-000009BB58EA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011177; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01210125; UDB=6.00635759;
	IPR=6.00991157; 
	MB=3.00027096; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 05:46:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052905-0017-0000-0000-00004368409B
Message-Id: <0c935fb1-dd17-3fb7-2764-6ad40764de9a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-29_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905290038
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v8 6/6] migration: Block
 migration while handling machine check
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: paulus@ozlabs.org, aik@au1.ibm.com, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Friday 10 May 2019 12:21 PM, David Gibson wrote:
> On Mon, Apr 22, 2019 at 12:33:45PM +0530, Aravinda Prasad wrote:
>> Block VM migration requests until the machine check
>> error handling is complete as (i) these errors are
>> specific to the source hardware and is irrelevant on
>> the target hardware, (ii) these errors cause data
>> corruption and should be handled before migration.
>>
>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>> ---
>>  hw/ppc/spapr_events.c  |   17 +++++++++++++++++
>>  hw/ppc/spapr_rtas.c    |    4 ++++
>>  include/hw/ppc/spapr.h |    3 +++
>>  3 files changed, 24 insertions(+)
>>
>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>> index 4032db0..45b990c 100644
>> --- a/hw/ppc/spapr_events.c
>> +++ b/hw/ppc/spapr_events.c
>> @@ -41,6 +41,7 @@
>>  #include "qemu/bcd.h"
>>  #include "hw/ppc/spapr_ovec.h"
>>  #include <libfdt.h>
>> +#include "migration/blocker.h"
>>  
>>  #define RTAS_LOG_VERSION_MASK                   0xff000000
>>  #define   RTAS_LOG_VERSION_6                    0x06000000
>> @@ -864,6 +865,22 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
>>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
>>  {
>>      SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +    int ret;
>> +    Error *local_err = NULL;
>> +
>> +    error_setg(&spapr->migration_blocker,
>> +            "Live migration not supported during machine check handling");
>> +    ret = migrate_add_blocker(spapr->migration_blocker, &local_err);
>> +    if (ret < 0) {
>> +        /*
>> +         * We don't want to abort and let the migration to continue. In a
>> +         * rare case, the machine check handler will run on the target
>> +         * hardware. Though this is not preferable, it is better than aborting
>> +         * the migration or killing the VM.
>> +         */
>> +        error_free(spapr->migration_blocker);
>> +        fprintf(stderr, "Warning: Machine check during VM migration\n");
> 
> Use report_err() instead of a raw fprintf().
> 
>> +    }
>>  
>>      while (spapr->mc_status != -1) {
>>          /*
>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>> index 997cf19..1229a0e 100644
>> --- a/hw/ppc/spapr_rtas.c
>> +++ b/hw/ppc/spapr_rtas.c
>> @@ -50,6 +50,7 @@
>>  #include "target/ppc/mmu-hash64.h"
>>  #include "target/ppc/mmu-book3s-v3.h"
>>  #include "kvm_ppc.h"
>> +#include "migration/blocker.h"
>>  
>>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>                                     uint32_t token, uint32_t nargs,
>> @@ -396,6 +397,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>>          spapr->mc_status = -1;
>>          qemu_cond_signal(&spapr->mc_delivery_cond);
>>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>> +        migrate_del_blocker(spapr->migration_blocker);
>> +        error_free(spapr->migration_blocker);
>> +        spapr->migration_blocker = NULL;
>>      }
>>  }
>>  
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 9d16ad1..dda5fd2 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -10,6 +10,7 @@
>>  #include "hw/ppc/spapr_irq.h"
>>  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>>  #include "hw/ppc/xics.h"        /* For ICSState */
>> +#include "qapi/error.h"
>>  
>>  struct SpaprVioBus;
>>  struct SpaprPhbState;
>> @@ -213,6 +214,8 @@ struct SpaprMachineState {
>>      SpaprCapabilities def, eff, mig;
>>  
>>      unsigned gpu_numa_id;
>> +
>> +    Error *migration_blocker;
> 
> This name doesn't seem good - it's specific to fwnmi, not any other
> migration blockers we might have in future.  It also always contains
> the same string - could you just initialize that in a global and just
> do the migrate_add_blocker() / migrate_del_blocker() instead?

I retained it in SpaprMachineState instead of a global variable because
we add the blocker in spapr_events.c and delete it in spapr_rtas.c

But I have renamed it to fwnmi_migration_blocker.

Regards,
Aravinda

> 
>>  };
>>  
>>  #define H_SUCCESS         0
>>
> 

-- 
Regards,
Aravinda


