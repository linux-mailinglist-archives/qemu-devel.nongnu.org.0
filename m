Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C289DC59
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 06:15:25 +0200 (CEST)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2StA-0000FH-6d
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 00:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pc@us.ibm.com>) id 1i2Ss1-00089n-Mz
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pc@us.ibm.com>) id 1i2Ss0-0002Dy-Kn
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:14:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18726
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pc@us.ibm.com>)
 id 1i2Srv-0002BU-ML; Tue, 27 Aug 2019 00:14:07 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7R4CWAR015863; Tue, 27 Aug 2019 00:14:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2umt9qwgj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2019 00:14:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7R4BhYo002128;
 Tue, 27 Aug 2019 04:13:59 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 2umpct8nac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2019 04:13:59 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7R4DwqC53412314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 04:13:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81DB72805A;
 Tue, 27 Aug 2019 04:13:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DDB828058;
 Tue, 27 Aug 2019 04:13:58 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.85.174.130])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Aug 2019 04:13:58 +0000 (GMT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190827020013.27154-1-richard.henderson@linaro.org>
From: Paul Clarke <pc@us.ibm.com>
Message-ID: <9cecc98f-59dc-0abf-b537-ef41ad0c08c5@us.ibm.com>
Date: Mon, 26 Aug 2019 23:13:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827020013.27154-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270046
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH] target/ppc: Set
 float_tininess_before_rounding at cpu reset
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/19 9:00 PM, Richard Henderson wrote:
> As defined in Power 3.0 section 4.4.4 "Underflow Exception",
> a tiny result is detected before rounding.

Responded in the bug:
https://bugs.launchpad.net/qemu/+bug/1841491/comments/3

In my testing, this works for "double", but not "float".

> Fixes: https://bugs.launchpad.net/qemu/+bug/1841491 
> Reported-by: Paul Clarke <pc@us.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate_init.inc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
> index 4a21ed7289..023138c2f9 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -10461,6 +10461,10 @@ static void ppc_cpu_reset(CPUState *s)
>      s->exception_index = POWERPC_EXCP_NONE;
>      env->error_code = 0;
>  
> +    /* tininess for underflow is detected before rounding */
> +    set_float_detect_tininess(float_tininess_before_rounding,
> +                              &env->fp_status);
> +
>      for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
>          ppc_spr_t *spr = &env->spr_cb[i];

PC

