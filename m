Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52F916C4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Aug 2019 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzL99-0007Ai-5J
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuval.shaia@oracle.com>) id 1hzL7c-0006L4-0g
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 09:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuval.shaia@oracle.com>) id 1hzL7a-00009m-Im
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 09:21:23 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
 id 1hzL7a-00009A-9u
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 09:21:22 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7IDIWiC027251;
 Sun, 18 Aug 2019 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=jK6soffQl8NuB4jPtSmOydQ9ZbMY37ZnslwYu4d3vqY=;
 b=AqOTAL+2Jn/qv7JDucdgDzg/9ZFMJnm7o0oLtTGSM3x5UBaHxLYjiAlsed7tAjeAQ4Xp
 mzMx3Dm4mqmzoKC8VHGIh5SXuVOExyONJpC/mWBibd3S00xjNTwvF3tiRWgVZA+el3ax
 q+TsbnqeGfVSEgOJkTaqd/tuxVe6rTGaZQfqiGFK75l12vrv7djuWRFs4sy7iNo0s3v+
 wR5/EhCKd0FPDnW9ByOym8wZRdwPFiO49L5NqeoPFXk+/vbBOe5R4/dyW4ShyVyPKjTp
 D9vHGMlgYaJl1DX3Qo1aXW+1UfH9ircYb1yCN36tW8/G1U8HMn+QnMKpeN33kHXZICHe Sw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2ue90t3mn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Aug 2019 13:21:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7IDIea0088234;
 Sun, 18 Aug 2019 13:21:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2uejxdamuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Aug 2019 13:21:19 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7IDLD2v020068;
 Sun, 18 Aug 2019 13:21:14 GMT
Received: from host4.lan (/77.138.183.59)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 18 Aug 2019 06:21:13 -0700
From: Yuval Shaia <yuval.shaia@oracle.com>
To: berrange@redhat.com, thuth@redhat.com, philmd@redhat.com,
 pbonzini@redhat.com, laurent@vivier.eu, qemu-devel@nongnu.org,
 yuval.shaia@oracle.com, marcel.apfelbaum@gmail.com
Date: Sun, 18 Aug 2019 16:21:05 +0300
Message-Id: <20190818132107.18181-1-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9352
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=850
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908180148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9352
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=916 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908180148
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Subject: [Qemu-devel] [PATCH 0/2] rdma: Utilize ibv_reg_mr_iova for memory
 registration
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtual address that is provided by the guest in post_send and
post_recv operations is related to the guest address space. This
address
space is unknown to the HCA resides on host so extra step in these
operations is needed to adjust the address to host virtual address.

This step, which is done in data-path affects performances.

An enhanced verion of MR registration introduced here
https://patchwork.kernel.org/patch/11044467/ can be used so that the
guest virtual address space for this MR is known to the HCA in host.

This will save the data-path adjustment.

patch #1 deals with what is needed to detect if the library installed in
the host supports this function
patch #2 enhance the data-path ops by utilizing the new function

Yuval Shaia (2):
  configure: Check if we can use ibv_reg_mr_iova
  hw/rdma: Utilize ibv_reg_mr_iova for memory registration

 configure                 | 28 ++++++++++++++++++++++++++++
 hw/rdma/rdma_backend.c    | 13 +++++++++++++
 hw/rdma/rdma_backend.h    |  5 +++++
 hw/rdma/rdma_rm.c         |  5 +++++
 hw/rdma/vmw/pvrdma_main.c |  6 ++++++
 5 files changed, 57 insertions(+)

-- 
2.20.1


