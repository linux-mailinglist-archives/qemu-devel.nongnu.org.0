Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B67644803
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Zs3-0000Xx-Bc; Tue, 06 Dec 2022 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2Zs0-0000XY-6o
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:28:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2Zrx-00019Z-Rc
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:28:31 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6E8VAe024985; Tue, 6 Dec 2022 15:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=P7u6pHd0va0FZhaoZvUrQZYdGC6/64yaikEHjj1RXbs=;
 b=Au4gZY9LtEe2kmJZSR1W0xLX8gwft0j4d1HNTREDmWgn2suX0FAsp9VRVOYGUNVhJIQ7
 WYmk9uZ0TZHC6R4lY/Qvj5WyBbBb2z9PMI+A9xbRXEWfBg7+Z4XdAoNumKODH3NY2NyF
 NEZxXVwEyuClwYJ1EkogxJAG3TpDWLmFo4GoDJpIqncVHLH3yWKl7daEWKdjgxmt7E29
 iLjWmj5dJKnKKzFmnKONS8Vx+LYxNQk5KJl2jFeQcce9dAwMm/pj0gfx9kFoND6PYlDg
 cuU/hfVtfq1F1dVGCvqEXqvmATGqOweJkNHhSSnJLEO/lwlhGXbH/7Clzm4/dRZuHQLV Yw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ma2h228g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 15:28:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6DAhSU010128;
 Tue, 6 Dec 2022 15:28:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7r95ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 15:28:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6FSL2v23986760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 15:28:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D424B20043;
 Tue,  6 Dec 2022 15:28:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E23920040;
 Tue,  6 Dec 2022 15:28:21 +0000 (GMT)
Received: from heavy (unknown [9.171.16.157])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 15:28:21 +0000 (GMT)
Date: Tue, 6 Dec 2022 16:28:15 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 29/34] tcg: Reorg function calls
Message-ID: <20221206152815.okaikikteop3cduk@heavy>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
 <20221202053958.223890-30-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202053958.223890-30-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wPfyTVvvD49dlmAmOUKxhaAjiDEuaghy
X-Proofpoint-ORIG-GUID: wPfyTVvvD49dlmAmOUKxhaAjiDEuaghy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_10,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212060124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 09:39:53PM -0800, Richard Henderson wrote:
> Pre-compute the function call layout for each helper at startup.
> Drop TCG_CALL_DUMMY_ARG, as we no longer need to leave gaps
> in the op->args[] array.  This allows several places to stop
> checking for NULL TCGTemp, to which TCG_CALL_DUMMY_ARG mapped.
> 
> For tcg_gen_callN, loop over the arguments once.  Allocate the TCGOp
> for the call early but delay emitting it, collecting arguments first.
> This allows the argument processing loop to emit code for extensions
> and have them sequenced before the call.
> 
> For tcg_reg_alloc_call, loop over the arguments in reverse order,
> which allows stack slots to be filled first naturally.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/helper-head.h |   2 +
>  include/tcg/tcg.h          |   5 +-
>  tcg/tcg-internal.h         |  22 +-
>  tcg/optimize.c             |   6 +-
>  tcg/tcg.c                  | 609 ++++++++++++++++++++++---------------
>  5 files changed, 394 insertions(+), 250 deletions(-)

...

> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index d08323db49..74f7491d73 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -547,7 +547,7 @@ void tcg_pool_reset(TCGContext *s)
>  
>  #include "exec/helper-proto.h"
>  
> -static const TCGHelperInfo all_helpers[] = {
> +static TCGHelperInfo all_helpers[] = {
>  #include "exec/helper-tcg.h"
>  };
>  static GHashTable *helper_table;
> @@ -565,6 +565,154 @@ static ffi_type * const typecode_to_ffi[8] = {
>  };
>  #endif
>  
> +typedef struct TCGCumulativeArgs {
> +    int arg_idx;                /* tcg_gen_callN args[] */
> +    int info_in_idx;            /* TCGHelperInfo in[] */
> +    int arg_slot;               /* regs+stack slot */
> +    int ref_slot;               /* stack slots for references */
> +} TCGCumulativeArgs;
> +
> +static void layout_arg_even(TCGCumulativeArgs *cum)
> +{
> +    cum->arg_slot += cum->arg_slot & 1;
> +}
> +
> +static void layout_arg_1(TCGCumulativeArgs *cum, TCGHelperInfo *info,
> +                         TCGCallArgumentKind kind)
> +{
> +    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
> +
> +    *loc = (TCGCallArgumentLoc){
> +        .kind = kind,
> +        .arg_idx = cum->arg_idx,
> +        .arg_slot = cum->arg_slot,
> +    };
> +    cum->info_in_idx++;
> +    cum->arg_slot++;
> +}
> +
> +static void layout_arg_normal_n(TCGCumulativeArgs *cum,
> +                                TCGHelperInfo *info, int n)
> +{
> +    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
> +
> +    for (int i = 0; i < n; ++i) {
> +        /* Layout all using the same arg_idx, adjusting the subindex. */
> +        loc[i] = (TCGCallArgumentLoc){
> +            .kind = TCG_CALL_ARG_NORMAL,
> +            .arg_idx = cum->arg_idx,
> +            .tmp_subindex = i,
> +            .arg_slot = cum->arg_slot + i,
> +        };
> +    }
> +    cum->info_in_idx += n;
> +    cum->arg_slot += n;
> +}
> +
> +static void init_call_layout(TCGHelperInfo *info)
> +{
> +    int max_reg_slots = ARRAY_SIZE(tcg_target_call_iarg_regs);
> +    int max_stk_slots = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
> +    unsigned typemask = info->typemask;
> +    unsigned typecode;
> +    TCGCumulativeArgs cum = { };
> +
> +    /*
> +     * Parse and place any function return value.
> +     */
> +    typecode = typemask & 7;
> +    switch (typecode) {
> +    case dh_typecode_void:
> +        info->nr_out = 0;
> +        break;
> +    case dh_typecode_i32:
> +    case dh_typecode_s32:
> +    case dh_typecode_ptr:
> +        info->nr_out = 1;
> +        info->out_kind = TCG_CALL_RET_NORMAL;
> +        break;
> +    case dh_typecode_i64:
> +    case dh_typecode_s64:
> +        info->nr_out = 64 / TCG_TARGET_REG_BITS;
> +        info->out_kind = TCG_CALL_RET_NORMAL;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
> +
> +    /*
> +     * Parse and place function arguments.
> +     */
> +    for (typemask >>= 3; typemask; typemask >>= 3, cum.arg_idx++) {
> +        TCGCallArgumentKind kind;
> +        TCGType type;
> +
> +        typecode = typemask & 7;
> +        switch (typecode) {
> +        case dh_typecode_i32:
> +        case dh_typecode_s32:
> +            type = TCG_TYPE_I32;
> +            break;
> +        case dh_typecode_i64:
> +        case dh_typecode_s64:
> +            type = TCG_TYPE_I64;
> +            break;
> +        case dh_typecode_ptr:
> +            type = TCG_TYPE_PTR;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        switch (type) {
> +        case TCG_TYPE_I32:
> +            switch (TCG_TARGET_CALL_ARG_I32) {
> +            case TCG_CALL_ARG_EVEN:
> +                layout_arg_even(&cum);
> +                /* fall through */
> +            case TCG_CALL_ARG_NORMAL:
> +                layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
> +                break;
> +            case TCG_CALL_ARG_EXTEND:
> +                kind = TCG_CALL_ARG_EXTEND_U + (typecode & 1);
> +                layout_arg_1(&cum, info, kind);
> +                break;
> +            default:
> +                qemu_build_not_reached();
> +            }
> +            break;
> +
> +        case TCG_TYPE_I64:
> +            switch (TCG_TARGET_CALL_ARG_I64) {
> +            case TCG_CALL_ARG_EVEN:

On a s390x host with gcc-11.0.1-0.3.1.ibm.fc34.s390x I get:

FAILED: libqemu-aarch64-softmmu.fa.p/tcg_tcg.c.o
../tcg/tcg.c: In function ‘init_call_layout’:
../tcg/tcg.c:739:13: error: case value ‘1’ not in enumerated type [-Werror=switch]
  739 |             case TCG_CALL_ARG_EVEN:
      |             ^~~~

The following helps:

--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -735,7 +735,7 @@ static void init_call_layout(TCGHelperInfo *info)
             break;
 
         case TCG_TYPE_I64:
-            switch (TCG_TARGET_CALL_ARG_I64) {
+            switch ((TCGCallArgumentKind)TCG_TARGET_CALL_ARG_I64) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
                 /* fall through */

This looks like a gcc bug to me.
I still thought it would be worth mentioning here.

...

Best regards,
Ilya

