Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E035E0AC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:54:32 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJUt-0003Yp-3A
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWJPk-0001OY-4F; Tue, 13 Apr 2021 09:49:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWJPg-00025W-96; Tue, 13 Apr 2021 09:49:11 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DDX6Tl016889; Tue, 13 Apr 2021 09:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/o0F/Lq+frrmbhlPgeve0G8jqOF13ed0n4DkISGCGQ8=;
 b=Sux+Z1poPnmmg4t64THxlKIbnOa3kwKv+nKihs9O5udnoSAd0C2zK4jDmGxFmaHowNvO
 2esSt/7dIHV6TdjDDKCaycgxu6PDL0hUY5DOSJC1TxDw7bipunLQEiMfIDNr07n8JFpK
 90m4BOHnqjh5doFAicDUvqxmJeU/yVmNom1+Z/rjgZ03/09639hho2dntktyfpaVQq3r
 e9mQUBGA0z4ybeEzqBj6BTJMCB05G1cZY4wWDgv1m6jlO4zzl3wphbmQY78gvreAu90n
 reg86fjkUINz7IkvVbxlM3aGr05JIwsuzrC7YWkLe8+x7oW4pHL2Nfaz1BzQjOpixFcx RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wb4faubg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:49:02 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DDYg4S022586;
 Tue, 13 Apr 2021 09:49:02 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wb4faub7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:49:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DDlrhh010187;
 Tue, 13 Apr 2021 13:49:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 37u3n9f84e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 13:49:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DDn0rS30933462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 13:49:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73662AC05F;
 Tue, 13 Apr 2021 13:49:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96DF5AC066;
 Tue, 13 Apr 2021 13:48:59 +0000 (GMT)
Received: from localhost (unknown [9.211.159.146])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 13:48:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH v1 1/3] target/ppc: Fix POWER9 radix guest HV interrupt
 AIL behaviour
In-Reply-To: <20210413125448.1689545-2-npiggin@gmail.com>
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-2-npiggin@gmail.com>
Date: Tue, 13 Apr 2021 10:48:56 -0300
Message-ID: <87y2dm47nb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OkyeNoaXfEgi-Frg_Q0a3g8Y8vSiBOuY
X-Proofpoint-GUID: 95cGW8LwuJQQbhyzTI7lDqf5xOeCPKJu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
> the LPCR[AIL] value can apply to hypervisor interrupts.
>
> This affects machines that emulate HV=1 mode (i.e., powernv9).
>

Ah ok, so we actually want to replicate the quirk in the pnv
machine. Took me a while.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/excp_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 85de7e6c90..b8881c0f85 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>  #endif
>  
>      /*
> -     * AIL only works if there is no HV transition and we are running
> -     * with translations enabled
> +     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>       */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
> -        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
> +    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>          ail = 0;
>      }
>  
> +    /*
> +     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> +     * partition is in HPT mode. For radix guests, such interrupts are
> +     * allowed to be delivered to the hypervisor in ail mode.
> +     */
> +    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> +        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> +            ail = 0;
> +        }
> +    }
> +
>      vector = env->excp_vectors[excp];
>      if (vector == (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",

