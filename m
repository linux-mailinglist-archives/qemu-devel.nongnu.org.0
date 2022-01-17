Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F7491149
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 22:15:59 +0100 (CET)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ZM6-0005Yv-6m
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 16:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9ZIw-0004cw-BY; Mon, 17 Jan 2022 16:12:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9ZIu-0003j9-Ih; Mon, 17 Jan 2022 16:12:42 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HJvOpT004120; 
 Mon, 17 Jan 2022 21:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aG7CLHKqPXz5CSotHNV4wWijU8/z+ZhPCkZ85PtuAfE=;
 b=mUAbQEQi7QC98l8aTGbz/d4+yBMC0sFTsOq+fEN2+8HFGC9C3QP01hUqgRK81igVj1e4
 sF0PLwqup2DnmZeL1Ays9FznBRCdxFYDt3zftmnAHHFVzS12TLDB8mA3ToQSYT+tAm+0
 DshzTVFjSGsgm7+ZH+QXuFDqvlUsw0QKoNgGhCmx7gE8KQA5q8tyq0YxetBVSxwbO7m2
 9hU//I4DLeAbo1i3k1D3prFaSvxormH4maN0D+e3U9KKas3bv15ajfirOC5+aj61piaR
 G0t9Epkfa0ZCOvMS205bw1nC5HZWvY7tKUgE31BtbYXwzMNLfYotxxnpuYxu0Cb6M5ib NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnf2qhcfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 21:12:25 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HKurRs024882;
 Mon, 17 Jan 2022 21:12:25 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnf2qhcfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 21:12:25 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HL74we029978;
 Mon, 17 Jan 2022 21:12:24 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3dknwbdjw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 21:12:24 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HLCN3q12255494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 21:12:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED09AE062;
 Mon, 17 Jan 2022 21:12:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9287AAE05F;
 Mon, 17 Jan 2022 21:12:22 +0000 (GMT)
Received: from localhost (unknown [9.211.141.90])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Jan 2022 21:12:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/8] target/ppc: 405: Add missing MSR bits to msr_mask
In-Reply-To: <20220110181546.4131853-2-farosas@linux.ibm.com>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-2-farosas@linux.ibm.com>
Date: Mon, 17 Jan 2022 18:12:20 -0300
Message-ID: <87iluivzgr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tjd0GriRu23SHD1cAjWq1B-aZ6ONsPmJ
X-Proofpoint-GUID: YvfleFVi8VI9Q6o8slpyiDAjxqCSSmQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201170132
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> Some bits described in the user manual are missing from msr_mask. Add
> them.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu_init.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e30e86fe9d..a50ddaeaae 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2535,15 +2535,19 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
>                         PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                         PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
>                         PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_POW) |
> +    pcc->msr_mask = (1ull << MSR_AP) |
> +                    (1ull << MSR_POW) |
>                      (1ull << MSR_CE) |
>                      (1ull << MSR_EE) |
>                      (1ull << MSR_PR) |
>                      (1ull << MSR_FP) |
> +                    (1ull << MSR_ME) |
>                      (1ull << MSR_DWE) |
>                      (1ull << MSR_DE) |
> +                    (1ull << MSR_FE1) |
>                      (1ull << MSR_IR) |
>                      (1ull << MSR_DR);

This patch brings an unexpected complication:

MSR_AP here is not correct, it is defined as:

#define MSR_AP   23 /* Access privilege state on 602 */

That is bit 8. While MSR_AP in the 405 is bit 6. So I would need to
introduce a new MSR_AP_405 defined as:

#define MSR_AP_405   25 /* Auxiliar processor available on 405 */

But 25 is the same as MSR_SPE, so it triggers this code in
init_ppc_proc:

    /* MSR bits & flags consistency checks */
    if (env->msr_mask & (1 << 25)) {
        switch (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
        case POWERPC_FLAG_SPE:
        case POWERPC_FLAG_VRE:
            break;
        default:
            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
                    "Should define POWERPC_FLAG_SPE or POWERPC_FLAG_VRE\n");
            exit(1);
        }
     ...

The commit that introduced that sanity check is 25ba3a6812 ("Remove
synonymous in PowerPC MSR bits definitions..."), which sort of assumes
that MSR bits will not have different purposes between any of the (now
47) CPUs, while itself leaving other duplicated bits around.
   
So my idea is to drop this patch and only include the MSR_ME that is of
practical effect at patch 6. I think going into the rabbit hole of
disambiguating MSR bits falls out of the scope of the exception series.

