Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D1394852
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 23:24:23 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmjxu-0004BT-An
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 17:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linuxram@us.ibm.com>)
 id 1lmjwj-0003QD-Pf; Fri, 28 May 2021 17:23:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linuxram@us.ibm.com>)
 id 1lmjwh-0001vD-5h; Fri, 28 May 2021 17:23:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SLDN9a066948; Fri, 28 May 2021 17:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 message-id : reply-to : references : mime-version : content-type :
 in-reply-to : subject; s=pp1;
 bh=d9IKtSNcHgWVEZITabs0vFR8r0xtttQitmj6MA5seQI=;
 b=ZSt3p7VKbgjU6OGYGMMXGyovr8ZyE7Ccr9mJ4MJWlT9IC9zt7UYFxSroEfV4TDsXUicx
 HT02+aHJPm4i0FG67BJS8ayWTUIqPJ7Yd4iUIzNuIs8HVnEZd9AoKEnqwLxsNyp7fG8L
 v6Af+lxhwoHaoEuyw7DgbOSK068x1U/s1TTQ1Js87YoYpXNfeLWXR1Res1Z9dM+qJ9Eg
 UKWVDL5M4/QZxX0OiQ3KGESN6LCSruN3s72MMJ2PdiVEzCiierIDB+LNZ7brVip+KvQb
 1eEZguwgXaRofQl0gO7juMPGgaq2mIzi2FncUGem+ZuuoSpUM93Q/3wqadbDtPRbxT7q 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38u88905ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 17:22:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14SLFNgI080178;
 Fri, 28 May 2021 17:22:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38u88905dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 17:22:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14SLE3Hg028211;
 Fri, 28 May 2021 21:22:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 38sba2sska-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 21:22:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14SLMjNT21954860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 21:22:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3435A4055;
 Fri, 28 May 2021 21:22:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F5C7A4057;
 Fri, 28 May 2021 21:22:44 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.65.216.168])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 28 May 2021 21:22:43 +0000 (GMT)
Date: Fri, 28 May 2021 14:22:36 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <20210528212236.GA4537@ram-ibm-com.ibm.com>
References: <20210528201619.52363-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528201619.52363-1-danielhb413@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Iif8du0nC0WkkEUJgToQc5UZ2CcvHKbX
X-Proofpoint-ORIG-GUID: e3gXC1sAB12eUnJEr_6kxvZklVNv9XuD
Subject: Re: [PATCH 1/1] ppc/pef.c: initialize cgs->ready in kvmppc_svm_init()
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_08:2021-05-27,
 2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105280139
Received-SPF: pass client-ip=148.163.156.1; envelope-from=linuxram@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 28, 2021 at 05:16:19PM -0300, Daniel Henrique Barboza wrote:
> QEMU is failing to launch a CGS pSeries guest in a host that has PEF
> support:
> 
> qemu-system-ppc64: ../softmmu/vl.c:2585: qemu_machine_creation_done: Assertion `machine->cgs->ready' failed.
> Aborted
> 
> This is happening because we're not setting the cgs->ready flag that is
> asserted in qemu_machine_creation_done() during machine start.
> 
> cgs->ready is set in s390_pv_kvm_init() and sev_kvm_init(). Let's set it
> in kvmppc_svm_init() as well.
> 
> Reported-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Acked-by: Ram Pai <linuxram@us.ibm.com>

> ---
>  hw/ppc/pef.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> index 573be3ed79..cc44d5e339 100644
..snip..

