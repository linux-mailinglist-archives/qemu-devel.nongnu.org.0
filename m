Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646D295C48
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 11:55:53 +0200 (CEST)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVXK3-0004SC-Ir
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 05:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kVXJ3-0003uY-T9; Thu, 22 Oct 2020 05:54:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kVXIz-0004ma-Pd; Thu, 22 Oct 2020 05:54:49 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M9XULS182304; Thu, 22 Oct 2020 05:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iiOxbqSYs3Den1G8WZBAjpPVL8ixID24++LhoOZQlUs=;
 b=akK0Y08/1iprbaPNGTEiBfmsi2kHVFP4mgIoiJTR/kDEfh8EGuXJymVjlKyOx001KoQg
 Ud/rA4wUpu3oRXUV6ai+Hegs+mOV0Oq1EsFlKRZo2CMR8fXmDNEtjVhPodT6MZye746S
 X6Y+vS0xQpVh6/QuK9qOCtTtX5Yx1IyKDxmIALWYmj6LQ13wr+7+vRGG83MUvN2q5AVb
 82s9W31+w4KjAWwDKUGXo+Nr5tEBUCZfoKbInPgzSOiqUoPBW8tWzENAwtsco370IJGG
 KOCxgee3+S0v7mQ98JYsLzLLpGgwRNzbLlMIcC8QvsiflvR69socKetiecbBkukO4N5h lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b0vrk1wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 05:54:43 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09M9XjGq183637;
 Thu, 22 Oct 2020 05:54:42 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b0vrk1vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 05:54:42 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09M9m0ns006035;
 Thu, 22 Oct 2020 09:54:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 347r882r8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 09:54:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09M9sbOa33030460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 09:54:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3B5952051;
 Thu, 22 Oct 2020 09:54:37 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.38.109])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3E4485204F;
 Thu, 22 Oct 2020 09:54:37 +0000 (GMT)
Date: Thu, 22 Oct 2020 11:54:30 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH] s390x: pv: Fix diag318 PV fencing
Message-ID: <20201022115430.507743ed.pasic@linux.ibm.com>
In-Reply-To: <20201022082312.124708-1-frankja@linux.ibm.com>
References: <74c4631b-735c-e5ad-77a3-0bbd9c63c4db@redhat.com>
 <20201022082312.124708-1-frankja@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_02:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 04:23:26
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mhartmay@linux.ibm.com, walling@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 04:23:12 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Diag318 fencing needs to be determined on the current VM PV state and
> not on the state that the VM has when we create the CPU model.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Fixes: fabdada935 ("s390: guest support for diagnose 0x318")
> ---
> 
> If you're sure that this is what you want, then I'll send a v2 of the
> patch set.
> 
> ---
>  target/s390x/cpu_features.c | 5 +++++
>  target/s390x/cpu_features.h | 4 ++++
>  target/s390x/cpu_models.c   | 4 ++++
>  target/s390x/kvm.c          | 3 +--
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
> index 31ea8df246..42fe0bf4ca 100644
> --- a/target/s390x/cpu_features.c
> +++ b/target/s390x/cpu_features.c
> @@ -14,6 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "cpu_features.h"
> +#include "hw/s390x/pv.h"
>  
>  #define DEF_FEAT(_FEAT, _NAME, _TYPE, _BIT, _DESC) \
>      [S390_FEAT_##_FEAT] = {                        \
> @@ -105,6 +106,10 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
>          }
>          feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
>      }
> +
> +    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
> +        clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
> +    }
>  }

Sorry, I'm a little rusty with cpu models. Does this affect the outcome
of the corresponding QMP commands?

I would guess it does...

Regards,
Halil

