Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB40A4802A4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 18:15:25 +0100 (CET)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1tam-0005j2-C7
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 12:15:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n1tYs-0004sC-DM; Mon, 27 Dec 2021 12:13:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n1tYq-0002wo-Gb; Mon, 27 Dec 2021 12:13:26 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGBn7C009389; 
 Mon, 27 Dec 2021 17:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=6w0ntMSpzIUjg6BR8xvwMltGXkAWrjUDoOuYGw+3yCg=;
 b=LhC3i1J8yCjSsGDXtNsOWV7B0fKoF/CwFgnfZtdrMw/n1Ui40dwthM166Fl4NwUOEdfW
 T5V/ySIrLpshbuBaUyNm6izqJt1iLHZtyekafrrbGLtMEUSFCZULs+A9B7/vqf2oJwQN
 llL6LWHJdrDC9nUIDGUiSqeqq7htfMfvm7qLEMlgBonYjsESu2CPze0Yh3PIu9USdJDT
 IBdYiM+Dn6RWxqWUr0InazJmfEEyj7wZYcoakOdHdExTlKLZ6xMiFAkDgQgzQGvUAW5i
 jNtCBHuUgETvOhWnREQnIH5fZGV59biOS1ARY8jUpGxVYOfhHBhjFLSCPv/5A//Theg+ lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gsx923c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 17:13:10 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRHBJmv024296;
 Mon, 27 Dec 2021 17:13:09 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gsx9231-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 17:13:09 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRHCThW017632;
 Mon, 27 Dec 2021 17:13:08 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3d70g0vj7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 17:13:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRHD7HS18416002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 17:13:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8541D78060;
 Mon, 27 Dec 2021 17:13:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA00E7805E;
 Mon, 27 Dec 2021 17:13:06 +0000 (GMT)
Received: from localhost (unknown [9.211.154.52])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Dec 2021 17:13:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC v2 05/12] target/ppc: powerpc_excp: Standardize arguments
 to interrupt code
In-Reply-To: <Yca7ptuQbgonc6e8@yekko>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-6-farosas@linux.ibm.com> <Yca7ptuQbgonc6e8@yekko>
Date: Mon, 27 Dec 2021 14:13:04 -0300
Message-ID: <8735mermxr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GFQ0BN_95pjyxoVHGxFh0zLF1D6eoc3e
X-Proofpoint-GUID: 2jrGIdvJa6ckqqNg_cSHWHX5dku6U1X_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_09,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Dec 20, 2021 at 03:18:56PM -0300, Fabiano Rosas wrote:
>> In preparation to moving the interrupt code into separate functions,
>> create a PPCIntrArgs structure to serve as a consistent API.
>
> The patch doesn't seem to match this description - I see no new
> structure here.

I didn't want to create the new ppc_intr.h header in this patch so I
might have been careless and put the structure right before the
powerpc_excp definition. See below.

>> 
>> No functional change intended.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  target/ppc/excp_helper.c | 213 +++++++++++++++++++++------------------
>>  1 file changed, 113 insertions(+), 100 deletions(-)
>> 
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 45641f6d1d..f478ff8a87 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -164,7 +164,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>>                                        target_ulong msr,
>>                                        target_ulong *new_msr,
>> -                                      target_ulong *vector)
>> +                                      target_ulong *new_nip)
>>  {
>>  #if defined(TARGET_PPC64)
>>      CPUPPCState *env = &cpu->env;
>> @@ -241,9 +241,9 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>>  
>>      if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
>>          if (ail == 2) {
>> -            *vector |= 0x0000000000018000ull;
>> +            *new_nip |= 0x0000000000018000ull;
>>          } else if (ail == 3) {
>> -            *vector |= 0xc000000000004000ull;
>> +            *new_nip |= 0xc000000000004000ull;
>>          }
>>      } else {
>>          /*
>> @@ -251,15 +251,15 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>>           * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
>>           */
>>          if (ail == 3) {
>> -            *vector &= ~0x0000000000017000ull; /* Un-apply the base offset */
>> -            *vector |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
>> +            *new_nip &= ~0x0000000000017000ull; /* Un-apply the base offset */
>> +            *new_nip |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
>>          }
>>      }
>>  #endif
>>  }
>>  
>> -static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
>> -                                          target_ulong vector, target_ulong msr)
>> +static inline void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong new_nip,
>> +                                          target_ulong new_msr)
>>  {
>>      CPUState *cs = CPU(cpu);
>>      CPUPPCState *env = &cpu->env;
>> @@ -272,9 +272,9 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
>>       * will prevent setting of the HV bit which some exceptions might need
>>       * to do.
>>       */
>> -    env->msr = msr & env->msr_mask;
>> +    env->msr = new_msr & env->msr_mask;
>>      hreg_compute_hflags(env);
>> -    env->nip = vector;
>> +    env->nip = new_nip;
>>      /* Reset exception state */
>>      cs->exception_index = POWERPC_EXCP_NONE;
>>      env->error_code = 0;
>> @@ -289,6 +289,15 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
>>      check_tlb_flush(env, false);
>>  }
>>  
>> +typedef struct PPCIntrArgs {
>> +    target_ulong nip;
>> +    target_ulong msr;
>> +    target_ulong new_nip;
>> +    target_ulong new_msr;
>> +    int sprn_srr0;
>> +    int sprn_srr1;
>> +} PPCIntrArgs;

here ^

I can have new header in this patch for the next version.

>> +
>>  /*
>>   * Note that this function should be greatly optimized when called
>>   * with a constant excp, from ppc_hw_interrupt
>> @@ -298,35 +307,35 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>>      CPUState *cs = CPU(cpu);
>>      CPUPPCState *env = &cpu->env;
>>      int excp_model = env->excp_model;
>> -    target_ulong msr, new_msr, vector;
>> -    int srr0, srr1, lev = -1;
>> +    PPCIntrArgs regs;
>> +    int lev = -1;

