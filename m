Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0394C4A92
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:23:22 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdNJ-00084J-Cb
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd9X-0002Md-1z; Fri, 25 Feb 2022 11:09:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd9T-0004PH-8y; Fri, 25 Feb 2022 11:09:04 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PFoJG1002753; 
 Fri, 25 Feb 2022 16:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SV6fylpNNeY1Jqo0ncSWW/quM4cMvIiXGxS1xZWw0FA=;
 b=IgOvZRd5p4ElmFPAR+TAVKa+RhtNbhptA00+z8nuZZx6ceizAhMyLxUX4dFfScV0+Sxf
 Wi9p0REwAFZ1xen5mHtWSTsWyz7++aUeFIM1qdUxyTUptkWGc1JvrihzlFtKcHPR0w/G
 KzD3SKR/dJw2EWXnk5DV/0xf3c7frBORGjqAk/dDL50PDGDuWOY8KqZcHyCOKwRNX4L0
 BjEJoNGOXYsprGXEfxYoLJvX6brIw8jdgUSM1Zno/0XMqoiGEHRazb5RnHJKZS/UYWBu
 cQPS+GAaYRD/3oTlt855TZ0qFDOAmfvgIWdojE+Gor+S3KTU9kVY628JpmVIugf4UnMq tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eeytf4tcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:51 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21PFuXi7026028;
 Fri, 25 Feb 2022 16:08:51 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eeytf4tbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:51 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PFwK2C007871;
 Fri, 25 Feb 2022 16:08:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3ear6br9vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PG8n0248693610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 16:08:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABB93AC05E;
 Fri, 25 Feb 2022 16:08:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9144AC05B;
 Fri, 25 Feb 2022 16:08:48 +0000 (GMT)
Received: from localhost (unknown [9.211.119.70])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 16:08:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 3/4] hw/ppc: Take nested guest into account when
 saving timebase
In-Reply-To: <YhhLNVXO/Uj7XpVi@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-4-farosas@linux.ibm.com> <YhhLNVXO/Uj7XpVi@yekko>
Date: Fri, 25 Feb 2022 13:08:46 -0300
Message-ID: <87zgmf2ak1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: daonBAxV16T-PXqXVu9Jfirc8jvkUGrM
X-Proofpoint-ORIG-GUID: MTQxvn1xPJvf8vU-iaiJicPsTP6rLUBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Feb 24, 2022 at 03:58:16PM -0300, Fabiano Rosas wrote:
>> When saving the guest "timebase" we look to the first_cpu for its
>> tb_offset. If that CPU happens to be running a nested guest at this
>> time, the tb_offset will have the nested guest value.
>> 
>> This was caught by code inspection.
>
> This doesn't seem right.  Isn't the real problem that nested_tb_offset
> isn't being migrated?  If you migrate that, shouldn't everything be
> fixed up when the L1 cpu leaves the nested guest on the destination
> host?

This uses first_cpu, so after we introduced the nested guest code, this
value has become dependent on what the first_cpu is doing. If it happens
to be running the nested guest when we migrate, then guest_timebase here
will have a different value from the one it would have if we had used
another cpu's tb_offset.

Now, we might have a bug or at least an inefficiency here because
timebase_load is never called for the TCG migration case. The
cpu_ppc_clock_vm_state_change callback is only registered for KVM. So in
TCG we call timebase_save during pre_save, migrate the guest_timebase,
but never do anything with it on the remote side.

>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  hw/ppc/ppc.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index 9e99625ea9..093cd87014 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -36,6 +36,7 @@
>>  #include "kvm_ppc.h"
>>  #include "migration/vmstate.h"
>>  #include "trace.h"
>> +#include "hw/ppc/spapr_cpu_core.h"
>>  
>>  static void cpu_ppc_tb_stop (CPUPPCState *env);
>>  static void cpu_ppc_tb_start (CPUPPCState *env);
>> @@ -961,19 +962,33 @@ static void timebase_save(PPCTimebase *tb)
>>  {
>>      uint64_t ticks = cpu_get_host_ticks();
>>      PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
>> +    int64_t tb_offset;
>>  
>>      if (!first_ppc_cpu->env.tb_env) {
>>          error_report("No timebase object");
>>          return;
>>      }
>>  
>> +    tb_offset = first_ppc_cpu->env.tb_env->tb_offset;
>> +
>> +    if (first_ppc_cpu->vhyp && vhyp_cpu_in_nested(first_ppc_cpu)) {
>> +        SpaprCpuState *spapr_cpu = spapr_cpu_state(first_ppc_cpu);
>> +
>> +        /*
>> +         * If the first_cpu happens to be running a nested guest at
>> +         * this time, tb_env->tb_offset will contain the nested guest
>> +         * offset.
>> +         */
>> +        tb_offset -= spapr_cpu->nested_tb_offset;
>> +    }
>> +
>>      /* not used anymore, we keep it for compatibility */
>>      tb->time_of_the_day_ns = qemu_clock_get_ns(QEMU_CLOCK_HOST);
>>      /*
>>       * tb_offset is only expected to be changed by QEMU so
>>       * there is no need to update it from KVM here
>>       */
>> -    tb->guest_timebase = ticks + first_ppc_cpu->env.tb_env->tb_offset;
>> +    tb->guest_timebase = ticks + tb_offset;
>>  
>>      tb->runstate_paused =
>>          runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAVE_VM);

