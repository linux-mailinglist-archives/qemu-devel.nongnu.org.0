Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7538F644CC8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:04:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2e91-0008LN-Cf; Tue, 06 Dec 2022 15:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2e8y-0008L1-KU
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:02:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2e8v-0003l8-LN
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:02:19 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6IuiUP022275; Tue, 6 Dec 2022 20:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=q8Kdljlq1dXxKHf3uPJ6Syu4k+QUihl6yqhIsy5SFco=;
 b=ACuBqjlS4/MCWTQDDvhm4klGXHxSOw0NfPKiBZc0jAjH2wDTSazKeo92V1xftZSRzh3B
 G6AeobCt4Ruh1rDoUHyihHwmSyc37oKucnLTqVYALo9Z3282kA+Z+J3JYDC4Al+GW3vs
 Go91dwnD07+sFCu9kobYkJm3BtvmSsNRZGful1ovCMESFLWYecjwQzbg7QZGunJ9xYu6
 aVna36g/w7hyGgFxWkuhiV28TH7U0P7hyaQWwhZELlvUbWkLip+Cd8Ne3ZO+Q4toTOj1
 9KJxu2llGGWjP6XrlSuLEhAGp3qdCoXdRn0Lwrn4Zl56AAkm+HLxvfLj5CuWhW0oIuh7 sQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabfa1hpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:02:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B69TMCb008321;
 Tue, 6 Dec 2022 20:02:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3m9m5y1wg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:02:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6K29PE34800096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 20:02:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4E420040;
 Tue,  6 Dec 2022 20:02:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA70C20049;
 Tue,  6 Dec 2022 20:02:08 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 20:02:08 +0000 (GMT)
Date: Tue, 6 Dec 2022 21:02:04 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 06/13] tcg/s390x: Support MIE2 multiply single
 instructions
Message-ID: <20221206200204.bxpzt6hecbazdobo@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-7-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lDs6skgCefeJg9ETDT6dTH2wkGQBQ47U
X-Proofpoint-ORIG-GUID: lDs6skgCefeJg9ETDT6dTH2wkGQBQ47U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=823
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060168
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

On Thu, Dec 01, 2022 at 10:51:53PM -0800, Richard Henderson wrote:
> The MIE2 facility adds 3-operand versions of multiply.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target-con-set.h |  1 +
>  tcg/s390x/tcg-target.h         |  1 +
>  tcg/s390x/tcg-target.c.inc     | 34 ++++++++++++++++++++++++----------
>  3 files changed, 26 insertions(+), 10 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

I have one small suggestion, see below.

> diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
> index 00ba727b70..33a82e3286 100644
> --- a/tcg/s390x/tcg-target-con-set.h
> +++ b/tcg/s390x/tcg-target-con-set.h
> @@ -23,6 +23,7 @@ C_O1_I2(r, 0, ri)
>  C_O1_I2(r, 0, rI)
>  C_O1_I2(r, 0, rJ)
>  C_O1_I2(r, r, ri)
> +C_O1_I2(r, r, rJ)
>  C_O1_I2(r, rZ, r)
>  C_O1_I2(v, v, r)
>  C_O1_I2(v, v, v)
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index 645f522058..bfd623a639 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -63,6 +63,7 @@ typedef enum TCGReg {
>  #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
>  #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
>  #define FACILITY_LOAD_ON_COND2        53
> +#define FACILITY_MISC_INSN_EXT2       58
>  #define FACILITY_VECTOR               129
>  #define FACILITY_VECTOR_ENH1          135
>  
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index d02b433271..cd39b2a208 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -180,6 +180,8 @@ typedef enum S390Opcode {
>      RRE_SLBGR   = 0xb989,
>      RRE_XGR     = 0xb982,
>  
> +    RRFa_MSRKC  = 0xb9fd,
> +    RRFa_MSGRKC = 0xb9ed,
>      RRFa_NRK    = 0xb9f4,
>      RRFa_NGRK   = 0xb9e4,
>      RRFa_ORK    = 0xb9f6,
> @@ -2140,14 +2142,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_mul_i32:
> +        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
>          if (const_args[2]) {
> -            if ((int32_t)args[2] == (int16_t)args[2]) {
> -                tcg_out_insn(s, RI, MHI, args[0], args[2]);
> +            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);

Should we consider a0 == a1 case here as well, in order to get rid of
this extra move when possible?

> +            if (a2 == (int16_t)a2) {
> +                tcg_out_insn(s, RI, MHI, a0, a2);
>              } else {
> -                tcg_out_insn(s, RIL, MSFI, args[0], args[2]);
> +                tcg_out_insn(s, RIL, MSFI, a0, a2);
>              }
> +        } else if (a0 == a1) {
> +            tcg_out_insn(s, RRE, MSR, a0, a2);
>          } else {
> -            tcg_out_insn(s, RRE, MSR, args[0], args[2]);
> +            tcg_out_insn(s, RRFa, MSRKC, a0, a1, a2);
>          }
>          break;
>  
> @@ -2405,14 +2411,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_mul_i64:
> +        a0 = args[0], a1 = args[1], a2 = args[2];
>          if (const_args[2]) {
> -            if (args[2] == (int16_t)args[2]) {
> -                tcg_out_insn(s, RI, MGHI, args[0], args[2]);
> +            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);

Same here.

> +            if (a2 == (int16_t)a2) {
> +                tcg_out_insn(s, RI, MGHI, a0, a2);
>              } else {
> -                tcg_out_insn(s, RIL, MSGFI, args[0], args[2]);
> +                tcg_out_insn(s, RIL, MSGFI, a0, a2);
>              }
> +        } else if (a0 == a1) {
> +            tcg_out_insn(s, RRE, MSGR, a0, a2);
>          } else {
> -            tcg_out_insn(s, RRE, MSGR, args[0], args[2]);
> +            tcg_out_insn(s, RRFa, MSGRKC, a0, a1, a2);
>          }
>          break;
>  
> @@ -3072,12 +3082,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>             MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
>             have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
>          return (HAVE_FACILITY(GEN_INST_EXT)
> -                ? C_O1_I2(r, 0, ri)
> +                ? (HAVE_FACILITY(MISC_INSN_EXT2)
> +                   ? C_O1_I2(r, r, ri)
> +                   : C_O1_I2(r, 0, ri))
>                  : C_O1_I2(r, 0, rI));
>  
>      case INDEX_op_mul_i64:
>          return (HAVE_FACILITY(GEN_INST_EXT)
> -                ? C_O1_I2(r, 0, rJ)
> +                ? (HAVE_FACILITY(MISC_INSN_EXT2)
> +                   ? C_O1_I2(r, r, rJ)
> +                   : C_O1_I2(r, 0, rJ))
>                  : C_O1_I2(r, 0, rI));
>  
>      case INDEX_op_shl_i32:
> -- 
> 2.34.1
> 
> 

