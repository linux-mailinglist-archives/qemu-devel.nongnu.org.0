Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D988257BD1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 17:11:17 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kClSm-0001DQ-C1
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 11:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kClQz-0007z6-3U
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:09:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kClQw-0005lq-DX
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 11:09:24 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VEVoos171932
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=93G5CsXufl9O+m4GLSkiu5jRtpJ5CP1Yrsz5WePEUuM=;
 b=fGdvddElFpOYG8R68cYyeUR0KNEsJr9/edXaUqyZDfTc1vls2z4Gnj6EXgfLhR7Ok+py
 o86zU+8SB0jvEVuqYDItp0JVtT5GXJgcyy3/lm2xBEMJXB5I2X6UIQjNGIme7HVdVqxs
 2OUXZ4qaNGEaXReeAVUjYaXx2mNKQh4+FlJ9iZfNuZEJf/iS2u9dZLxpXS8SfxZtIeLx
 0DZYt/Q6ZyCkSUsXlAZd4Ck+8lN6fBYu/dERZKtKc0062BV2KVQAA0Ff6iwrapcJZiwG
 HDqEAPqRlxnLEJUQMX96YsXnHycQBO7LAtNs0mTHDcUhKa42ixN4S5f2HqqzWeIH+S3P XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3391vrkdna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:09:19 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07VEWslS177225
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:09:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3391vrkdmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 11:09:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VF7wej012086;
 Mon, 31 Aug 2020 15:09:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 337en82970-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:09:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VF9Fpd32768390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 15:09:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEC0BA405B;
 Mon, 31 Aug 2020 15:09:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51907A4057;
 Mon, 31 Aug 2020 15:09:14 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 15:09:14 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] pc-bios: s390x: Cleanup part 2
Date: Mon, 31 Aug 2020 11:09:05 -0400
Message-Id: <20200831150910.317171-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_06:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=938 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 11:09:20
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So, here are a few more cleanup patches mostly cleaning up ipl code
and some of the assembly.

The patches are available here:
https://github.com/frankjaa/qemu/pull/new/cleanup_bios2

v3:
	* Split PSW save rework again
	* Added noreturn annotation
	* Minor cleanup

v2:
	* Fixed psw saving in use reset psw patch (thanks Jason)
	* Dropped a lot of patches which weren't strictly necessary
	* Added disabled wait patch
	* Added RFC PSW save patch

Janosch Frank (5):
  pc-bios: s390x: Fix bootmap.c zipl component entry data handling
  pc-bios: s390x: Save PSW rework
  pc-bios: s390x: Use reset PSW if avaliable
  pc-bios: s390x: Save io and external new PSWs before overwriting them
  pc-bios: s390x: Go into disabled wait when encountering a PGM
    exception

 pc-bios/s390-ccw/bootmap.c  |  6 ++--
 pc-bios/s390-ccw/bootmap.h  |  7 +++-
 pc-bios/s390-ccw/jump2ipl.c | 51 +++++++++++++++++------------
 pc-bios/s390-ccw/netmain.c  |  3 ++
 pc-bios/s390-ccw/s390-ccw.h |  1 +
 pc-bios/s390-ccw/start.S    | 65 +++++++++++++++++++++++++++----------
 6 files changed, 92 insertions(+), 41 deletions(-)

-- 
2.25.1


