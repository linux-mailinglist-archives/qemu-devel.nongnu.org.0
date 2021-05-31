Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04916395804
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 11:22:30 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lne7w-0007Em-Lh
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 05:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lne71-0006ZA-IH
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:21:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lne6z-0004ca-Rc
 for qemu-devel@nongnu.org; Mon, 31 May 2021 05:21:31 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14V92vWk117134
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 05:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+nkWr+xeafPP/y6Dg7wiWniwkLowe6grDHbOm/UX9dQ=;
 b=dpIfYhEJHSvFNz1weooN6aJb5HJOEdMgYU5e4FRnidTBPEFWMiT9ivr7MD4Kk2iOk9WI
 ext9i+6sYkEcH3Sb5L0EuCqDKXprxARo6Fq4UxVpbM6KieWLlJxdKmYoj6tgnygb9/xQ
 aZ2v7uFiXj75dUfN9WmCmuWKzXdW3mDMcqm+kHrQyYQgWGWq213DRrgRIKMhenmZ5YyB
 Cg3Fp3S1ME3/kCD0rLSur2z6hOWlZpJqM9hpx9+rXrYJfEUJn/APF44nxGIzafM8dyOi
 Nd/v23AUtFP7lwTmeAtCymtlxABuQxyNyFmEUZcygX5ydK66XoWNWKlRaiqzlOAv3/x6 yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38vunnad4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 05:21:26 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14V92xFZ117308
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 05:21:25 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38vunnad48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 05:21:25 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14V97umM005999;
 Mon, 31 May 2021 09:21:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 38ud888wss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 09:21:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14V9LLOS27787622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 09:21:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0690EA405B;
 Mon, 31 May 2021 09:21:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BADD0A4054;
 Mon, 31 May 2021 09:21:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.89.221])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 31 May 2021 09:21:20 +0000 (GMT)
Subject: Re: [PATCH] qobject: Fix maybe uninitialized in qdict_array_split
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
References: <20210518130638.54529-1-frankja@linux.ibm.com>
Message-ID: <b4aebccf-db62-74da-ebd0-8ca24ea22f59@linux.ibm.com>
Date: Mon, 31 May 2021 11:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518130638.54529-1-frankja@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i3YyjC48w68JjmBNSd61pf7HBgb5xyOw
X-Proofpoint-ORIG-GUID: dSjfgE62dKazcN3mKlU3sYS0BMBZeEDR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-31_07:2021-05-31,
 2021-05-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105310065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, cohuck@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 3:06 PM, Janosch Frank wrote:
> Lets make the compiler happy.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Ping
My build is still breaking on Ubuntu because of this.

> ---
>  qobject/block-qdict.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8..b26524429c 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
>      for (i = 0; i < UINT_MAX; i++) {
>          QObject *subqobj;
>          bool is_subqdict;
> -        QDict *subqdict;
> +        QDict *subqdict = NULL;
>          char indexstr[32], prefix[32];
>          size_t snprintf_ret;
>  
> 


