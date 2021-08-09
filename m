Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE53E4FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 01:11:24 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDEQU-0004c8-VW
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 19:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mDEPA-0003tL-KC; Mon, 09 Aug 2021 19:10:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mDEP7-0007up-6V; Mon, 09 Aug 2021 19:10:00 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179N2uRX001113; Mon, 9 Aug 2021 19:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vonJD1Qz1SE0d8pmVjvMNkfDZ+CxmLwIeaBc9V0UEnY=;
 b=eiDgQ7DBdn7D63upKKKYMpcaaa1PIww6btEi2Id84s0AT0NzbnkhoShCHoFVtD09LSlF
 L/gBI2a23BnNGx5VoUgWh9iKQK58/f9x9vNCTwTtHgAzoVKfLXEl4aeLPNDrMVr+6boD
 Jj2Izf97j0ekOytrqGawuGQM9lNeE8/7Pwdhp88blSc3lD8FobflVIsQGYJZ3mZ25x3f
 eONG1qhHw/TCRqIdOxXDAP77E+LA5f8uxb3wtfPF/hr93irbUnIp+bkQkolBO7wvxqDJ
 VJ1oaC6oXgTU9XgMtDwqv7usaqEk4LSZXIbYYRHfivR0grjqsCwx/0GBlEV5OoOh7VuZ Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abbnstuwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 19:09:51 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 179N3481001604;
 Mon, 9 Aug 2021 19:09:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abbnstuw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 19:09:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179N3RNf020012;
 Mon, 9 Aug 2021 23:09:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht8vw6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 23:09:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179N6bnD56688936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 23:06:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1452A4877;
 Mon,  9 Aug 2021 23:09:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EAD0A4872;
 Mon,  9 Aug 2021 23:09:44 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.52.133])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 23:09:44 +0000 (GMT)
Date: Tue, 10 Aug 2021 01:09:41 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on
 little endian
Message-ID: <20210810010941.3acd3166.pasic@linux.ibm.com>
In-Reply-To: <20210805143753.86520-1-david@redhat.com>
References: <20210805143753.86520-1-david@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1c9J8YS19eLOzrGUbbD87lJHvUUYPJiG
X-Proofpoint-ORIG-GUID: jDC6FA_Rg410T5pKbfdc_LiYZAeClmn6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_09:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108090163
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 16:37:53 +0200
David Hildenbrand <david@redhat.com> wrote:

> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
> "css" test, which fails with:
> 
>   FAIL: Channel Subsystem: measurement block format1: Unaligned MB origin:
>   Program interrupt: expected(21) == received(0)
> 
> Because we end up not injecting an operand program exception.
> 
> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be aligned")
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Pierre Morel <pmorel@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

> ---
>  target/s390x/ioinst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index 4eb0a7a9f8..bdae5090bc 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -123,7 +123,7 @@ static int ioinst_schib_valid(SCHIB *schib)
>      }
>      /* for MB format 1 bits 26-31 of word 11 must be 0 */
>      /* MBA uses words 10 and 11, it means align on 2**6 */
> -    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
> +    if ((be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
>          (be64_to_cpu(schib->mba) & 0x03fUL)) {
>          return 0;
>      }


