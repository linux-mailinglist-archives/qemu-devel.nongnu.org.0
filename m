Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758C1871D2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:04:48 +0100 (CET)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDu6Z-0008G0-7y
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mahesh@linux.vnet.ibm.com>) id 1jDtYs-00062c-Fq
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mahesh@linux.vnet.ibm.com>) id 1jDtYr-0005pk-1w
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:29:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mahesh@linux.vnet.ibm.com>)
 id 1jDtYq-0005cI-NV
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:29:56 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02GHMLgi119300
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 13:29:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrubn2fwc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 13:29:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 16 Mar 2020 17:29:52 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Mar 2020 17:29:49 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02GHSmCZ48562522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 17:28:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF3B24C044;
 Mon, 16 Mar 2020 17:29:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79C5B4C040;
 Mon, 16 Mar 2020 17:29:47 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.45.53])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 16 Mar 2020 17:29:47 +0000 (GMT)
Date: Mon, 16 Mar 2020 22:59:45 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/8] ppc/spapr: Add FWNMI System Reset state
References: <20200316142613.121089-1-npiggin@gmail.com>
 <20200316142613.121089-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316142613.121089-4-npiggin@gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 20031617-0020-0000-0000-000003B56862
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031617-0021-0000-0000-0000220DC90D
Message-Id: <20200316172945.fkh5cowdseomgd7g@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-16_07:2020-03-12,
 2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=1
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003160076
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Mon, 16 Mar 2020 13:49:15 -0400
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-03-17 00:26:08 Tue, Nicholas Piggin wrote:
> The FWNMI option must deliver system reset interrupts to their
> registered address, and there are a few constraints on the handler
> addresses specified in PAPR. Add the system reset address state and
> checks.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Looks good to me.

Reviwed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.
> ---
>  hw/ppc/spapr.c         |  2 ++
>  hw/ppc/spapr_rtas.c    | 14 +++++++++++++-
>  include/hw/ppc/spapr.h |  3 ++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b03b26370d..5f93c49706 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1704,6 +1704,7 @@ static void spapr_machine_reset(MachineState *machine)
> 
>      spapr->cas_reboot = false;
> 
> +    spapr->fwnmi_system_reset_addr = -1;
>      spapr->fwnmi_machine_check_addr = -1;
>      spapr->fwnmi_machine_check_interlock = -1;
> 
> @@ -2023,6 +2024,7 @@ static const VMStateDescription vmstate_spapr_fwnmi = {
>      .needed = spapr_fwnmi_needed,
>      .pre_save = spapr_fwnmi_pre_save,
>      .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(fwnmi_system_reset_addr, SpaprMachineState),
>          VMSTATE_UINT64(fwnmi_machine_check_addr, SpaprMachineState),
>          VMSTATE_INT32(fwnmi_machine_check_interlock, SpaprMachineState),
>          VMSTATE_END_OF_LIST()
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 0b8c481593..521e6b0b72 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -414,6 +414,7 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>                                    uint32_t nret, target_ulong rets)
>  {
>      hwaddr rtas_addr;
> +    target_ulong sreset_addr, mce_addr;
> 
>      if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) == SPAPR_CAP_OFF) {
>          rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> @@ -426,7 +427,18 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>          return;
>      }
> 
> -    spapr->fwnmi_machine_check_addr = rtas_ld(args, 1);
> +    sreset_addr = rtas_ld(args, 0);
> +    mce_addr = rtas_ld(args, 1);
> +
> +    /* PAPR requires these are in the first 32M of memory and within RMA */
> +    if (sreset_addr >= 32 * MiB || sreset_addr >= spapr->rma_size ||
> +           mce_addr >= 32 * MiB ||    mce_addr >= spapr->rma_size) {
> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> +        return;
> +    }
> +
> +    spapr->fwnmi_system_reset_addr = sreset_addr;
> +    spapr->fwnmi_machine_check_addr = mce_addr;
> 
>      rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>  }
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 64b83402cb..42d64a0368 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -194,9 +194,10 @@ struct SpaprMachineState {
> 
>      /* State related to FWNMI option */
> 
> -    /* Machine Check Notification Routine address
> +    /* System Reset and Machine Check Notification Routine addresses
>       * registered by "ibm,nmi-register" RTAS call.
>       */
> +    target_ulong fwnmi_system_reset_addr;
>      target_ulong fwnmi_machine_check_addr;
> 
>      /* Machine Check FWNMI synchronization, fwnmi_machine_check_interlock is
> -- 
> 2.23.0
> 
> 

-- 
Mahesh J Salgaonkar


