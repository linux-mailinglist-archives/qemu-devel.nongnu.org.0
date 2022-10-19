Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9A6046ED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:24:36 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol93j-0001A8-96
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ol8rn-0004E9-JH; Wed, 19 Oct 2022 09:12:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ol8rh-0005fb-Q3; Wed, 19 Oct 2022 09:12:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JCL5hm008175;
 Wed, 19 Oct 2022 13:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ko52jyA49blSKQjyhaaHX8everpJOddop/lFfyDbEcc=;
 b=bRbaix/5seYhtI7eMjby9/vXrqfy4odAL9zxfInoAUY64vx5dq+IgxO3kN1iXxRJ3K2h
 4XDpXL5BM+MIL3rp363m7xyrlsgZnPRxSzQPAcFdP8qGNbN/OSOUvYqxBMXnzU2t9MBm
 22dMWfjAm6U4pIOZGMbKw25975RZqf9BgzOarAzlVKmso87okPNSqyE2tnDM13mB63ee
 xaEPdygxWseLZ45nA46aSvryLExloX9hvKhNPcBV9LkrvirWShERtMUETtw6skN95xgK
 JnELpL2X5JSbHSCY0AEINHLjLy7CtSPZEd2yNdLACkiQDKB7A87897AXoXNSakz8Z1FF jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kah5u20s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 13:11:03 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JCL2iC008056;
 Wed, 19 Oct 2022 13:10:57 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kah5u20m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 13:10:57 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JD8Owl017827;
 Wed, 19 Oct 2022 13:10:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3k7m4jde85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 13:10:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JDAlsS20644134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 13:10:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D72C311C04C;
 Wed, 19 Oct 2022 13:10:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7940311C04A;
 Wed, 19 Oct 2022 13:10:47 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Oct 2022 13:10:47 +0000 (GMT)
Message-ID: <3883d140400e582c0673053baae97c17ccbfb7a9.camel@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: target/s390x/: add Ilya as reviewer
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>
Date: Wed, 19 Oct 2022 15:10:47 +0200
In-Reply-To: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
References: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZznromHtcsQE3UPtassNAGwBSE7Bu90f
X-Proofpoint-ORIG-GUID: F-yOCRJoYM69nSItZUmkT1R7TpLJEClw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190070
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, 2022-10-19 at 14:56 +0200, Christian Borntraeger wrote:
> Ilya has volunteered to review TCG patches for s390x.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c46..ae5e8c8ecbb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,7 @@ F: target/rx/
>  S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
> +R: Ilya Leoshkevich <iii@linux.ibm.com>
>  S: Maintained
>  F: target/s390x/
>  F: target/s390x/tcg

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

Thanks!

