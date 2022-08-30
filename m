Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A15A7166
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 01:14:45 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTARQ-0007cT-8W
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 19:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oTAQ0-0006Ep-Ln
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:13:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49464
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oTAPy-0006pU-N4
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 19:13:16 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UMvjsS006128;
 Tue, 30 Aug 2022 23:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=THv8sDS73/ZhxMt+7o7tz620IAAUUI990mi2wyxDroo=;
 b=tOIlgc7i3NR+HSEOEOMp8w6YzV3JVy+2wms0kasCovvA+B2d/2XQAHskO/pB6A4B4OGx
 KZt+e+gUAzjDsNTRcFs4JCXGoL3nVGSbGWdNvQLWOQsrcYyUP4bF1DVLdqh+VRSkdUeL
 HSpZyOUXmjkLGc9VqtNg+LwtqCrukY0ZJk9Das3Z257l5NExSlf1UkPYZFuIkBm+JYjJ
 8YwG5rCWkix9rGiPTLpuwKjYA/fBDz/oCb0z1qAHO2KVAxARIPSFq9rokMvr2AvGkXnN
 Knle+KcyWTRMP56ho3eOezWKbGXC/ZdZ8UKCfofl8Ny3LDB6dlPzk9fTRa0Zl+/F8xCU XA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9ut88b5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 23:13:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UN5vva006314;
 Tue, 30 Aug 2022 23:13:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw94bpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 23:13:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27UND6GN41419098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 23:13:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A3AA4C044;
 Tue, 30 Aug 2022 23:13:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 575974C040;
 Tue, 30 Aug 2022 23:13:06 +0000 (GMT)
Received: from [9.171.5.135] (unknown [9.171.5.135])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 23:13:06 +0000 (GMT)
Message-ID: <3d7d4c6f2fb1d0095668148070abc46ba2962d70.camel@linux.ibm.com>
Subject: Re: [PATCH v7 13/20] accel/tcg: Document the faulting lookup in
 tb_lookup_cmp
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
Date: Wed, 31 Aug 2022 01:13:06 +0200
In-Reply-To: <20220823220542.1993395-14-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
 <20220823220542.1993395-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qM3N3MXxhiB8uJGsXb7AL0uLJQ5MrK3O
X-Proofpoint-ORIG-GUID: qM3N3MXxhiB8uJGsXb7AL0uLJQ5MrK3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_12,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2022-08-23 at 15:05 -0700, Richard Henderson wrote:
> It was non-obvious to me why we can raise an exception in
> the middle of a comparison function, but it works.
> While nearby, use TARGET_PAGE_ALIGN instead of open-coding.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 7887af6f45..5f43b9769a 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -198,7 +198,16 @@ static bool tb_lookup_cmp(const void *p, const
> void *d)
>              tb_page_addr_t phys_page2;
>              target_ulong virt_page2;
>  
> -            virt_page2 = (desc->pc & TARGET_PAGE_MASK) +
> TARGET_PAGE_SIZE;
> +            /*
> +             * We know that the first page matched, and an otherwise
> valid TB
> +             * encountered an incomplete instruction at the end of
> that page,
> +             * therefore we know that generating a new TB from the
> current PC
> +             * must also require reading from the next page -- even
> if the
> +             * second pages do not match, and therefore the
> resulting insn
> +             * is different for the new TB.  Therefore any exception
> raised
> +             * here by the faulting lookup is not premature.
> +             */
> +            virt_page2 = TARGET_PAGE_ALIGN(desc->pc);
>              phys_page2 = get_page_addr_code(desc->env, virt_page2);
>              if (tb->page_addr[1] == phys_page2) {
>                  return true;

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

