Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98818115CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM7TI-0002SJ-P9
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:53:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hM7R4-0000W6-MO
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hM7R3-0000YH-Fd
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:51:22 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
	id 1hM7R1-00007K-9x; Thu, 02 May 2019 04:51:19 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x428nPMJ189972; Thu, 2 May 2019 08:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id; s=corp-2018-07-02;
	bh=s2pXex4ADp9C4Nzq+h1CmSBWsXwfqY4PB/43pctDRjo=;
	b=C2eMQYqSJ8ZXQVh/Arh9dsoVlm5+iLEpV/wIC+pYYXZ+GYu0CPE/JCKwEm+ot7d+qpRB
	3Gl0UCMKobs/kZ424O39JqNIEBZ2h4XjlAznhACXNJT6HfmPdq8zzLHkr1pxsnedemJa
	xFUggONBcWKfwe0eJsk5r+p00zDEEB9m6gpMxbSlt8DwC0/z7dnutOCjgDDweqOeU+EJ
	9U9EQ1ZNNOssrfi808eHUjVQFxf6p5G2sOC6HmK6XTPGxqeI28ufhforKs+yhEZUMulN
	qp5IUF5lqgPOrbytQ9/XywjzrOsesIu82lj8Nkupl09h7Z7YcD64N6zRFHK0+QA58Gn1
	Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2s6xhyq56m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 May 2019 08:50:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x428ojWi186591; Thu, 2 May 2019 08:50:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 2s7rtbksey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 May 2019 08:50:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x428orI3006676;
	Thu, 2 May 2019 08:50:53 GMT
Received: from nexus.ravello.local (/213.57.127.2)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 02 May 2019 01:50:53 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
To: kwolf@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  2 May 2019 11:50:26 +0300
Message-Id: <20190502085029.30776-1-shmuel.eiderman@oracle.com>
X-Mailer: git-send-email 2.13.3
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9244
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=2 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=2 mlxscore=2 mlxlogscore=171
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1905020067
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9244
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=1 clxscore=1015
	lowpriorityscore=0 mlxscore=1 impostorscore=0 mlxlogscore=208
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905020067
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [PATCH 0/3] qemu-img: rebase: Improve/optimize rebase
 operation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eyal.moscovici@oracle.com, arbel.moshe@oracle.com, liran.alon@oracle.com,
	shmuel.eiderman@oracle.com, sagi.amit@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to improve the speed of qemu-img rebase.

1. Mainly by removing unnecessary reads when rebasing on the same
   chain.
2. But also by minimizing the number of bdrv_open calls rebase
   requires.


