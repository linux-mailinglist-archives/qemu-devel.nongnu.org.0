Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E7387CE2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:51:40 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj20R-0005yZ-G4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1lj1rW-00028W-0m; Tue, 18 May 2021 11:42:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pc@us.ibm.com>)
 id 1lj1rT-0007mt-4T; Tue, 18 May 2021 11:42:25 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IFYFRj112477; Tue, 18 May 2021 11:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 message-id : references : content-type : in-reply-to : mime-version :
 subject; s=pp1; bh=Mlu25JidYZYPsjCDhGHtLXyrlkY51CZcpWn15FJMFww=;
 b=G/78bf6MCYc7yI8tdPrmzB9YNeMsXlJJhM0gImoilxiiKCHim/+URjT8TZCfj4lgszhp
 tU3UNk+BxQ1urIK8EshY+pID8/i5GsdYPTe3+AhhKcImuTbJ1nikSwOCMaCCKSGVUYbE
 o64zrMG/7S1lCFEp10HehQJFe5RqmMioojJZwzLxTC0TUuBTr8lwFr3U2z2yuWEXh9cF
 feMj40FJ72OX6sasJMubdsJR4fuVRWcxc05rV1Pz7Fj6IiirED/wXUppxOAkvpCkWmUv
 Wl23DeROVWF0r2hVli3M+ZzGG11hsYEuAWvYljESMCfvOc2SgNSs5lOAzJ7aHrOPeUvq WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38mg7s0emr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 11:42:15 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14IFYJsH113504;
 Tue, 18 May 2021 11:42:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38mg7s0em7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 11:42:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14IFXiOZ029870;
 Tue, 18 May 2021 15:42:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 38j5x9e791-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:42:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14IFgDUf15401248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 15:42:13 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 032616A077;
 Tue, 18 May 2021 15:42:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 245216A051;
 Tue, 18 May 2021 15:42:12 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.85.160.160])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 18 May 2021 15:42:11 +0000 (GMT)
Date: Tue, 18 May 2021 10:42:09 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Giuseppe Musacchio <thatlemon@gmail.com>
Message-ID: <20210518154209.GB6890@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210518133020.58927-1-thatlemon@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518133020.58927-1-thatlemon@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hIMXwFtK2mqBlvCSfIQyUpDj_CzU7kyW
X-Proofpoint-ORIG-GUID: Z1ZE9eRJKmIjXYjP212YX6C10brx13bY
X-Proofpoint-UnRewURL: 8 URL's were un-rewritten
MIME-Version: 1.0
Subject: Re:  [PATCH v2] target/ppc: Fix load endianness for lxvwsx/lxvdsx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_07:2021-05-18,
 2021-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105180111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pc@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-stable@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, all!  My original patch which addressed this issue
for me probably should've been labeled as an RFC.  Thanks for your
willingness to review it, in spite of its problems.  It was a bit
of a stab in the dark. I hope it at least helped get to this solution.

Tested-by: Paul A. Clarke <pc@us.ibm.com>

Do I need to do anything about the GitLab issue?
https://gitlab.com/qemu-project/qemu/-/issues/212

(I couldn't even figure out how to subscribe to my own issue,
or if I already was, or who might have been notified of its
existence, or if discussion should happen there or here.)

On Tue, May 18, 2021 at 03:30:20PM +0200, Giuseppe Musacchio wrote:
> TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
> runtime-configurable parameter.
> 
> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> Fixes: afae37d98ae991c0792c867dbd9f32f988044318
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/translate/vsx-impl.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index b817d31260..57a7f73bba 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
>  
>      data = tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
> +    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
>      tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
>  
>      tcg_temp_free(EA);
> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
>  
>      data = tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
>  
>      tcg_temp_free(EA);
> -- 
> 2.30.2

PC

