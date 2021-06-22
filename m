Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B53B0D41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 20:55:36 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvlYe-0000OT-3E
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 14:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lvlWn-0006f7-Pf; Tue, 22 Jun 2021 14:53:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lvlWc-0007Nx-KN; Tue, 22 Jun 2021 14:53:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MIjffq044267; Tue, 22 Jun 2021 14:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HWvlNoy06ej93ul8QvZExmnU8a/9jA1WqOhV3W/Gbbo=;
 b=GljTby2Un419nHRfZeqJHWhvGf/q6oWaS4GOWrnxKPKmIGMs4lJEnYWoj6Dw/YNKVZbA
 G7v9sZOs5sDLtlQk7RSM+lh00S7P1qdUOhi2T30zVVSDXjypLGmPdic9xgBGHMQgDzEE
 6q5cQhqn6N8LDGST09DBOYkHS4QqgFS/Wo6A5ygdZGa4muV6c3egPwlLQpC42+EX1hSi
 OsqVA1FULVTedV79pfqSrOd+unnvwbbbvyjrudUsHy1DXQMXQH37+B4uQ2S2t2jd15dq
 x8hxa9EZxFyxrCJws2QWsFL7nvHHYz638RhBK3T6EeXqEGdOEVcDmh4Z2fHe4ox1Z+Pn AA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bkueb9fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 14:53:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MIqgn3008514;
 Tue, 22 Jun 2021 18:53:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 399879rn5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 18:53:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MIrHwF31850978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 18:53:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B8C5AC060;
 Tue, 22 Jun 2021 18:53:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E44AC059;
 Tue, 22 Jun 2021 18:53:16 +0000 (GMT)
Received: from localhost (unknown [9.211.80.241])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 22 Jun 2021 18:53:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] target/ppc: Drop
 PowerPCCPUClass::interrupts_big_endian()
In-Reply-To: <20210622140926.677618-3-groug@kaod.org>
References: <20210622140926.677618-1-groug@kaod.org>
 <20210622140926.677618-3-groug@kaod.org>
Date: Tue, 22 Jun 2021 15:53:13 -0300
Message-ID: <87r1gtohnq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qE5czkrdIkGxCN6q2ElAsmKzUY2aL3V4
X-Proofpoint-ORIG-GUID: qE5czkrdIkGxCN6q2ElAsmKzUY2aL3V4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_11:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> This isn't used anymore.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu-qom.h  |  1 -
>  target/ppc/cpu_init.c | 17 -----------------
>  2 files changed, 18 deletions(-)
>
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 06b6571bc9d5..7b424e3cb0bc 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -199,7 +199,6 @@ struct PowerPCCPUClass {
>      void (*init_proc)(CPUPPCState *env);
>      int  (*check_pow)(CPUPPCState *env);
>      int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
> -    bool (*interrupts_big_endian)(PowerPCCPU *cpu);
>  };
>  
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0411e7302a2..1a22aef874b1 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2666,18 +2666,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
>      return 0;
>  }
>  
> -static bool ppc_cpu_interrupts_big_endian_always(PowerPCCPU *cpu)
> -{
> -    return true;
> -}
> -
> -#ifdef TARGET_PPC64
> -static bool ppc_cpu_interrupts_big_endian_lpcr(PowerPCCPU *cpu)
> -{
> -    return !(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
> -}
> -#endif
> -
>  /*****************************************************************************/
>  /* PowerPC implementations definitions                                       */
>  
> @@ -7740,7 +7728,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_VSX;
>      pcc->l1_dcache_size = 0x8000;
>      pcc->l1_icache_size = 0x8000;
> -    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
>  }
>  
>  static void init_proc_POWER8(CPUPPCState *env)
> @@ -7918,7 +7905,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
>      pcc->l1_dcache_size = 0x8000;
>      pcc->l1_icache_size = 0x8000;
> -    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
>  }
>  
>  #ifdef CONFIG_SOFTMMU
> @@ -8136,7 +8122,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
>      pcc->l1_dcache_size = 0x8000;
>      pcc->l1_icache_size = 0x8000;
> -    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
>  }
>  
>  #ifdef CONFIG_SOFTMMU
> @@ -8347,7 +8332,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
>      pcc->l1_dcache_size = 0x8000;
>      pcc->l1_icache_size = 0x8000;
> -    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
>  }
>  
>  #if !defined(CONFIG_USER_ONLY)
> @@ -9094,7 +9078,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
>                                        &pcc->parent_unrealize);
>      pcc->pvr_match = ppc_pvr_match_default;
> -    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_always;
>      device_class_set_props(dc, ppc_cpu_properties);
>  
>      device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);

