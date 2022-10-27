Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192E60F5CB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:57:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0Zp-0002W2-Nt; Thu, 27 Oct 2022 06:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0Zj-0000qo-Rr; Thu, 27 Oct 2022 06:57:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0ZU-0004ny-OJ; Thu, 27 Oct 2022 06:57:19 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RAiPx1031835;
 Thu, 27 Oct 2022 10:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=vY1h8S+11R1uGpfl1VAuGMZH06BQqjx3pH775e1VEf4=;
 b=OT5Zwm09LCQVTFpogD+eGWEb4BE6BYSYUssqkqZBuheKUJzccYREfM46sNoga1HfLQ/u
 4QS615gSuXbJxYydRoBlwxaPBIoc4mTDr0E2KgN926FY2QCo/tjH46dqHnfsHxWeoyXW
 oSu6vd7WWZDpnBrRL42R7JoziTwJhyJ8Rjeo1yxzUPRqBssFQPxVJVJg20wWLhva9RH1
 m1BHWUWjbWoggRYQWi6l1aCCRndn8Tivsn4E7C99MytZ1IJ14jM+Ohu5a91RLu19Pwtd
 Hm1HYUZCyK58jxVp+NoClYkG4ShFeSVQeT2j7C2mt28YI7HWZjBabcH5W8Ia0N2HwIrp zA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfrg90b4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:57:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RAoXOx010880;
 Thu, 27 Oct 2022 10:57:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3kfahd17yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 10:57:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29RAv6wk62849376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 10:57:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74CEF42041;
 Thu, 27 Oct 2022 10:57:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B4AF4203F;
 Thu, 27 Oct 2022 10:57:06 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 10:57:06 +0000 (GMT)
Date: Thu, 27 Oct 2022 12:57:04 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 6/9] target/s390x: Copy wout_x1 to wout_x1_P
Message-ID: <20221027105704.insdlbhc5riqzjey@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-7-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Tz84xvlEgiJLLYBSS_9BlHkrfQOMRR-C
X-Proofpoint-GUID: Tz84xvlEgiJLLYBSS_9BlHkrfQOMRR-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=736 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 05:30:03PM +1000, Richard Henderson wrote:
> Make a copy of wout_x1 before modifying it, as wout_x1_P
> emphasizing that it operates on the out/out2 pair.  The insns
> that use x1_P are data movement that will not change to Int128.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c   |  8 ++++++++
>  target/s390x/tcg/insn-data.def | 12 ++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

