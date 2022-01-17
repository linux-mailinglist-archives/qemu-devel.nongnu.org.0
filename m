Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9146490B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:38:26 +0100 (CET)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9U5R-0005fh-UC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9TCW-00085p-8u; Mon, 17 Jan 2022 09:41:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9TCC-0007NL-A2; Mon, 17 Jan 2022 09:41:37 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HDvbh9018288; 
 Mon, 17 Jan 2022 14:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lyt8WdZ3iLBr3y54dFwzZEJqrvt+cq6BEucaQ+osUf4=;
 b=JVuSkC7nO+/Xw292p2YyKqKXZ2LDrd9147LKYk+MQBOPRnhCc53NtwlQOggxFe1DeXYv
 qYIkGpuHV4L24JjRSin4KxmJfW+DIMWe1X3pQugl5dqYJ5MTpBdPj9xcWzjBbDNzZpar
 YEcJm6Q0thI7o8DunJ8asX4Qc68wd8JQcDLPOCmC6nPi66V2dwC1S162AMOt3NPnXupF
 lgZSfbpOKR3qa9MHYiq7HE8nwJ8PJOLDdJCk0zoqE8TmCyqSvIGEYCO3C8ibYR4CSlck
 m1VDJNgAcu69jR7TNWrOHPzlVWVMZOC5zZM543fYBBRGwaosrbgKDaQY3AA8mDN5+zLC lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn9t3gspa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:40:52 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HE2JsM003973;
 Mon, 17 Jan 2022 14:40:51 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn9t3gsp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:40:51 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HEX7pT025857;
 Mon, 17 Jan 2022 14:40:50 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3dknwaps31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 14:40:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HEenGi24314132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 14:40:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC237AE066;
 Mon, 17 Jan 2022 14:40:48 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA854AE071;
 Mon, 17 Jan 2022 14:40:47 +0000 (GMT)
Received: from localhost (unknown [9.211.141.90])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Jan 2022 14:40:47 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3] ppc/ppc405: Fix TLB flushing
In-Reply-To: <20220113180352.1234512-1-clg@kaod.org>
References: <20220113180352.1234512-1-clg@kaod.org>
Date: Mon, 17 Jan 2022 11:40:44 -0300
Message-ID: <87lezewhlf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UFisB_fQih0wwa0N_7AUZsNobT5L44Q1
X-Proofpoint-GUID: tlzlMVpreHbeGf5tPi_6X7Nu_eKAV3DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 malwarescore=0 adultscore=0
 mlxlogscore=960 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Commit cd0c6f473532 did not take into account 405 CPUs when adding
> support to batching of TCG tlb flushes. Set the TLB_NEED_LOCAL_FLUSH
> flag when the SPR_40x_PID is set or a TLB updated.
>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Fixes: cd0c6f473532 ("ppc: Do some batching of TCG tlb flushes")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


