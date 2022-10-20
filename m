Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4860656E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:09:40 +0200 (CEST)
Received: from localhost ([::1]:50866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY70-0007WG-AM
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:09:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXsj-0001kG-BG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1olXPw-0002L6-By
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:25:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:47992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1olXPp-00084h-2H
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:25:05 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KDwJYG018147;
 Thu, 20 Oct 2022 15:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=iyQQgYdumQkylVDFW7rUqAlNRlkNiBLoJEyB+bT9HL8=;
 b=o/dViHYt2qus47raY5eHiGq5uS2NRl2Hqr5Rmr+SShZpyYfrGhDng1Kvxy9pli8VjEN1
 QTYbDKPd9i8pJDnM0IcB+csZfllcB53/UzipZE+qA3W7edGp9syWIoviCZm5wpAv4TAE
 fkrikMX/NFnDuGrDAUiTXU8nDOM58Jseqev6JuEZjiNCMr3wc3mQ3Vbq5GBaqzNYLKZY
 zsi/1FwjhTtO00/o2fhng3DfOOzM4KlJBA1Qyx01eKfFfiY5+9be1Fj2vMRsZRheNbKi
 kDHOyjbhzlhOAtiOWB0IV2dZ5xRFwh6HylBwp6vj4gvMdv21dV1I7Z4IAVkahtug55Jn yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kawde1qm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:58 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29KFOvCh010013; 
 Thu, 20 Oct 2022 15:24:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3k7nxm0xu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:57 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KFOvvX010004;
 Thu, 20 Oct 2022 15:24:57 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 29KFOuXk010003
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 15:24:57 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id B85595195; Thu, 20 Oct 2022 12:24:56 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: tsimpson@quicinc.com
Cc: ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, philmd@linaro.org,
 qemu-devel@nongnu.org, quic_mathbern@quicinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH 7/8] Hexagon (target/hexagon) Use direct block chaining
 for direct jump/branch
Date: Thu, 20 Oct 2022 12:24:55 -0300
Message-Id: <282c13438aac1a4a12b061634d8efb3c84ac29cd.1666278665.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221019223739.3868-8-tsimpson@quicinc.com>
References: <20221019223739.3868-8-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FmADaDwhvMliJlOTVWOhYQrGhkRqbdkF
X-Proofpoint-ORIG-GUID: FmADaDwhvMliJlOTVWOhYQrGhkRqbdkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_06,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=501 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200091
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
> index eae358cf33..e60dbf0e7a 100644
> --- a/target/hexagon/translate.h
> +++ b/target/hexagon/translate.h
> @@ -54,6 +54,9 @@ typedef struct DisasContext {
>      bool qreg_is_predicated[NUM_QREGS];
>      int qreg_log_idx;
>      bool pre_commit;
> +    bool has_single_direct_branch;
> +    TCGv branch_cond;
> +    target_ulong branch_dest;
>  } DisasContext;
>  
>  static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index fba76d3b38..07b4326e56 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -505,15 +505,14 @@ static void gen_write_new_pc_pcrel(DisasContext *ctx, Packet *pkt,
>              gen_set_label(pred_false);
>          }
>      } else {
> -        TCGLabel *pred_false = NULL;
> +        /* Defer this jump to the end of the TB */
> +        g_assert(ctx->branch_cond == NULL);
> +        ctx->has_single_direct_branch = true;
>          if (pred != NULL) {
> -            pred_false = gen_new_label();
> -            tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> -        }
> -        tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], dest);
> -        if (pred != NULL) {
> -            gen_set_label(pred_false);
> +            ctx->branch_cond = tcg_temp_local_new();
> +            tcg_gen_mov_tl(ctx->branch_cond, pred);
>          }
> +        ctx->branch_dest = dest;
>      }
>  }

Do we want to perform this logic at gen_write_new_pc_addr() as well?

Although, in that case, we would need a separate ctx->branch_dest to
hold a TCGv instead of target_ulong...

Or have a single variable (TCGv) but add an extra
tcg_gen_addi(ctx->branch_dest, tcg_gen_constant_tl(pkt->pc), pc_off)
call to gen_write_new_pc_pcrel(). (In which case, we could also 
unify the two gen_write_new_pc_* functions and have one as a thin
wrapper around the other.) IDK about the extra overhead from 
tcg_gen_addi(), though.

