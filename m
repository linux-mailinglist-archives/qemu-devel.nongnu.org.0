Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8332372D3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 13:28:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYqZM-0000S8-Rs
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 07:28:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hYqXf-0007we-Lp
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 07:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hYqXd-00054g-KR
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 07:26:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60406
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
	id 1hYqXb-00051Y-TC
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 07:26:45 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x56BLs12027432
	for <qemu-devel@nongnu.org>; Thu, 6 Jun 2019 07:26:43 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sy13nar6y-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 07:26:42 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
	Thu, 6 Jun 2019 12:26:41 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 6 Jun 2019 12:26:38 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
	[9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x56BPMAY18743570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 6 Jun 2019 11:25:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FCDA112063;
	Thu,  6 Jun 2019 11:25:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D699B112062;
	Thu,  6 Jun 2019 11:25:19 +0000 (GMT)
Received: from [9.85.82.46] (unknown [9.85.82.46])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jun 2019 11:25:19 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
	<155910845769.13149.8097972239187020170.stgit@aravinda>
	<20190606030614.GK10319@umbus.fritz.box>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Thu, 6 Jun 2019 16:55:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190606030614.GK10319@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060611-0040-0000-0000-000004F982C5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011223; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01214026; UDB=6.00638130;
	IPR=6.00995105; 
	MB=3.00027206; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 11:26:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060611-0041-0000-0000-00000905A260
Message-Id: <08b42ce8-2413-ce8f-980a-419146423be7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-06_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906060084
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v9 6/6] migration: Include migration
 support for machine check handling
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
Cc: aik@au1.ibm.com, qemu-devel@nongnu.org, groug@kaod.org, paulus@ozlabs.org,
	qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thursday 06 June 2019 08:36 AM, David Gibson wrote:
> On Wed, May 29, 2019 at 11:10:57AM +0530, Aravinda Prasad wrote:
>> This patch includes migration support for machine check
>> handling. Especially this patch blocks VM migration
>> requests until the machine check error handling is
>> complete as (i) these errors are specific to the source
>> hardware and is irrelevant on the target hardware,
>> (ii) these errors cause data corruption and should
>> be handled before migration.
>>
>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>> ---
>>  hw/ppc/spapr.c         |   20 ++++++++++++++++++++
>>  hw/ppc/spapr_events.c  |   17 +++++++++++++++++
>>  hw/ppc/spapr_rtas.c    |    4 ++++
>>  include/hw/ppc/spapr.h |    2 ++
>>  4 files changed, 43 insertions(+)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index e8a77636..31c4850 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -2104,6 +2104,25 @@ static const VMStateDescription vmstate_spapr_dtb = {
>>      },
>>  };
>>  
>> +static bool spapr_fwnmi_needed(void *opaque)
>> +{
>> +    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
>> +
>> +    return (spapr->guest_machine_check_addr == -1) ? 0 : 1;
> 
> Since we're introducing a PAPR capability to enable this, it would
> actually be better to check that here, rather than the runtime state.
> That leads to less cases and easier to understand semantics for the
> migration stream.

I am fine with this approach as well.

> 
>> +}
>> +
>> +static const VMStateDescription vmstate_spapr_machine_check = {
>> +    .name = "spapr_machine_check",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = spapr_fwnmi_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
>> +        VMSTATE_INT32(mc_status, SpaprMachineState),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>>  static const VMStateDescription vmstate_spapr = {
>>      .name = "spapr",
>>      .version_id = 3,
>> @@ -2137,6 +2156,7 @@ static const VMStateDescription vmstate_spapr = {
>>          &vmstate_spapr_dtb,
>>          &vmstate_spapr_cap_large_decr,
>>          &vmstate_spapr_cap_ccf_assist,
>> +        &vmstate_spapr_machine_check,
>>          NULL
>>      }
>>  };
>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>> index 573c0b7..35e21e4 100644
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
>> @@ -855,6 +856,22 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
>>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
>>  {
>>      SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +    int ret;
>> +    Error *local_err = NULL;
>> +
>> +    error_setg(&spapr->fwnmi_migration_blocker,
>> +            "Live migration not supported during machine check handling");
>> +    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
>> +    if (ret < 0) {
>> +        /*
>> +         * We don't want to abort and let the migration to continue. In a
>> +         * rare case, the machine check handler will run on the target
>> +         * hardware. Though this is not preferable, it is better than aborting
>> +         * the migration or killing the VM.
>> +         */
>> +        error_free(spapr->fwnmi_migration_blocker);
> 
> You should set fwnmi_migration_blocker to NULL here as well.

ok.

> 
> As mentioned on an earlier iteration, the migration blocker is the
> same every time.  Couldn't you just create it once and free at final
> teardown, rather than recreating it for every NMI?

That means, we create the error string at the time when ibm,nmi-register
is invoked and tear it down during machine reset?

Regards,
Aravinda

> 
>> +        warn_report_err(local_err);
>> +    }
>>  
>>      while (spapr->mc_status != -1) {
>>          /*
>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>> index 91a7ab9..c849223 100644
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
>> @@ -404,6 +405,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>>          spapr->mc_status = -1;
>>          qemu_cond_signal(&spapr->mc_delivery_cond);
>>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>> +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
>> +        error_free(spapr->fwnmi_migration_blocker);
>> +        spapr->fwnmi_migration_blocker = NULL;
>>      }
>>  }
>>  
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index bd75d4b..6c0cfd8 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -214,6 +214,8 @@ struct SpaprMachineState {
>>      SpaprCapabilities def, eff, mig;
>>  
>>      unsigned gpu_numa_id;
>> +
>> +    Error *fwnmi_migration_blocker;
>>  };
>>  
>>  #define H_SUCCESS         0
>>
> 

-- 
Regards,
Aravinda


