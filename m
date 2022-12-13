Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8E64B9A3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:27:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5863-0001Fu-VE; Tue, 13 Dec 2022 11:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p5861-0001Eu-98
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:25:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p585w-000879-IK
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:25:32 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDG6nVu026774; Tue, 13 Dec 2022 16:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=bLBDWCQNnQrmoyaMSl4OHLNUL0pOQUq2DjwRz9l0ZXQ=;
 b=ZCn+MCjUb9cTNtfGGdXFhwpHpA+RGRqRFeqiXoTSw8Qxk9+Uu7tD63faR65qkDUuHLpt
 hhyNPfTm0k9RIr3zAlaFCgFAq4ekSaCkWlul1cSGzpg+JZsMBZc/QCNjtatIO/o9Z2vY
 Ldej54rzVs/xQr5ofTU5I9bzmLOv+Q+mL+ZXBF0g9u15zjplUQzFQ7gGsOQRcmZGfwu6
 aNutRM+4EFQk9bO5OlDx/FPmCylCswzFwnZI4kEg8X+hV6XMZ8AQnExaaCUp7p0dC0/i
 ldnKd/MkL29YhtxMV4VvZ8zd0+WTR8Nw12IH/2ReGRWHzywJpoG98sikd7kcBC4Ahp+E 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mev20hjk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:25:23 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BDG8E98002490;
 Tue, 13 Dec 2022 16:25:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mev20hjj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:25:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDFtRpI007894;
 Tue, 13 Dec 2022 16:25:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mchcf4f74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:25:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDGPIUk20972114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 16:25:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0A1C2004B;
 Tue, 13 Dec 2022 16:25:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3008820043;
 Tue, 13 Dec 2022 16:25:18 +0000 (GMT)
Received: from heavy (unknown [9.179.23.216])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Dec 2022 16:25:18 +0000 (GMT)
Date: Tue, 13 Dec 2022 17:25:16 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 25/27] tcg/s390x: Tighten constraints for 64-bit compare
Message-ID: <20221213162516.tfiopikzv5ilhgwf@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-26-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-26-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: psUJC7Yn6QG8tfw7bhoNvG7sVflDA7q2
X-Proofpoint-ORIG-GUID: lhOI14rT5d90RZV9Yfx74ziT46IS44WG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=834
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130142
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

On Thu, Dec 08, 2022 at 08:05:28PM -0600, Richard Henderson wrote:
> Give 64-bit comparison second operand a signed 33-bit immediate.
> This is the smallest superset of uint32_t and int32_t, as used
> by CLGFI and CGFI respectively.  The rest of the 33-bit space
> can be loaded into TCG_TMP0.  Drop use of the constant pool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target-con-set.h |  3 +++
>  tcg/s390x/tcg-target.c.inc     | 27 ++++++++++++++-------------
>  2 files changed, 17 insertions(+), 13 deletions(-)

<...>
 
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -1249,22 +1249,20 @@ static int tgen_cmp2(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
>              tcg_out_insn_RIL(s, op, r1, c2);
>              goto exit;
>          }
> +
> +        /*
> +         * Constraints are for a signed 33-bit operand, which is a
> +         * convenient superset of this signed/unsigned test.
> +         */
>          if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
>              op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>              tcg_out_insn_RIL(s, op, r1, c2);
>              goto exit;
>          }
>  
> -        /* Use the constant pool, but not for small constants.  */
> -        if (maybe_out_small_movi(s, type, TCG_TMP0, c2)) {
> -            c2 = TCG_TMP0;
> -            /* fall through to reg-reg */
> -        } else {
> -            op = (is_unsigned ? RIL_CLGRL : RIL_CGRL);
> -            tcg_out_insn_RIL(s, op, r1, 0);
> -            new_pool_label(s, c2, R_390_PC32DBL, s->code_ptr - 2, 2);
> -            goto exit;
> -        }
> +        /* Load everything else into a register. */
> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, c2);
> +        c2 = TCG_TMP0;

What does tightening the constraint give us, if we have to handle the
"everything else" case anyway, even for values that match
TCG_CT_CONST_S33?

The example that I have in mind is:

- Comparison: r0_64 s<= -0xffffffffL;
- tcg_target_const_match(-0xffffffffL, TCG_TYPE_I64,
                         TCG_CT_CONST_S33) == true;
- (long)(int)-0xffffffffL != -0xffffffff;
- So we should end up in the "everything else" branch.

<...>

Best regards,
Ilya

