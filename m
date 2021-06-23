Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08B3B11BB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 04:29:26 +0200 (CEST)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvsdp-0002SH-6G
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 22:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvsbj-0000fZ-Br; Tue, 22 Jun 2021 22:27:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvsbg-0003Mf-Tx; Tue, 22 Jun 2021 22:27:15 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N23uVu062182; Tue, 22 Jun 2021 22:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SQA5T+kEUb3bTik4fi5heoK3QJgqDG4/5LOgN8Qp3tQ=;
 b=muKEHiVCRwoM4GBJYM15GGX74g4qDqNpWafKJxZ8ukNgxGshF0YP16SYitbCUbY5FXzS
 fHpovMwSal4mmYtrMz9HNAx4EM+WW4vy24reg1+oEC1dKJ1rudvzyCKH0liU8HpSvz2Y
 P+NECaVXzhrhxIguZbbDs/rAY9u1UqXQ6S785mbPyd60koBboRl135FLop/NTiWtjuxU
 L77wYdnqG3wIxGIX7JeYYAnrxISvxbYQAJYI5SAf63ViUTYFa3IUqvfBK96VZQHkABo5
 PtZaCZqZ3MwA2iDXkp6f9720TKr2LgP1WpZJhomae9FfvympGmTXoYsy3jQ452dm74ce jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39br5q55nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 22:27:08 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N240Ax062494;
 Tue, 22 Jun 2021 22:27:07 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39br5q55n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 22:27:07 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N2R5HD031091;
 Wed, 23 Jun 2021 02:27:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3998788xru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 02:27:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N2R2D714352872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 02:27:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55A87A4054;
 Wed, 23 Jun 2021 02:27:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E341EA4060;
 Wed, 23 Jun 2021 02:27:01 +0000 (GMT)
Received: from sig-9-145-39-144.uk.ibm.com (unknown [9.145.39.144])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 02:27:01 +0000 (GMT)
Message-ID: <3746b7e49ab2554080cd8467139340cf2462c055.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
Date: Wed, 23 Jun 2021 04:27:01 +0200
In-Reply-To: <20210621141452.2045-2-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210621141452.2045-2-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: keagJZeeLbllxSMQgmzzV1gj_bA0yVXZ
X-Proofpoint-ORIG-GUID: sOrh1o5W57osbshRoKOgUQrO9qpZMOvj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_14:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230008
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-06-21 at 10:14 -0400, Jonathan Albrecht wrote:
> Currently when a compare-and-trap instruction is executed, qemu will
> always raise a SIGILL signal. On real hardware, a SIGFPE is raised.
> 
> Change the PGM_DATA case in cpu_loop to follow the behavior in
> linux kernel /arch/s390/kernel/traps.c.
>  * Only raise SIGILL if DXC == 0
>  * If DXC matches an IEEE exception, raise SIGFPE with correct si_code
>  * Raise SIGFPE with si_code == 0 for everything else
> 
> When applied on 20210602002210.3144559-2-iii@linux.ibm.com, this fixes
> crashes in the java jdk such as the linked bug.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/319
> Signed-off-by: Jonathan Albrecht <
> jonathan.albrecht@linux.vnet.ibm.com>
> ---
>  linux-user/s390x/cpu_loop.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

I tried this on top of my SIGILL patch to run Maven, it worked without
issues.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>


