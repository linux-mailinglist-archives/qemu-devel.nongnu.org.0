Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696F2333F1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19Ez-0004zA-Sj
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1k19Dl-00049q-8f
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:07:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1k19Dj-0003KF-4a
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:07:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UE24m3012027
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 10:07:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kretnj9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 10:07:39 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06UE28mG012621
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 10:07:39 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kretnj8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 10:07:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UE5oq5022635;
 Thu, 30 Jul 2020 14:07:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4p85g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 14:07:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UE7Y8O54526178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 14:07:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 543A84C046;
 Thu, 30 Jul 2020 14:07:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D29864C05A;
 Thu, 30 Jul 2020 14:07:33 +0000 (GMT)
Received: from marcibm.ibmuc.com (unknown [9.145.35.48])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 14:07:33 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] Enable virtio-fs on s390x
Date: Thu, 30 Jul 2020 16:07:29 +0200
Message-Id: <20200730140731.32912-1-mhartmay@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_10:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300099
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:28:21
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series is about enabling virtio-fs on s390x. For that we need
 + some shim code (first patch), and we need
 + libvhost-user to deal with virtio endiannes for non-legacy virtio
   devices as mandated by the spec.

How to use?

For general instructions how to use virtio-fs (on x86) please have a
look at https://virtio-fs.gitlab.io/howto-qemu.html. Most of the
instructions can also be applied on s390x.

In short:

1. Install self-compiled QEMU with this patch series applied
2. Prepare host and guest kernel so they support virtio-fs

Start virtiofsd on the host

 $ virtiofsd -f --socket-path=/tmp/vhostqemu -o source=/tmp/shared

Now you can start QEMU in a separate shell on the host:

 $ qemu-system-s390x -machine type=s390-ccw-virtio,accel=kvm,memory-backend=mem \
   -object memory-backend-file,id=mem,size=2G,mem-path=/dev/shm/virtiofs,share=on,prealloc=on,prealloc-threads=1 \
   -chardev socket,id=char0,path=/tmp/vhostqemu -device vhost-user-fs-ccw,queue-size=1024,chardev=char0,tag=myfs \
   -drive if=virtio,file=disk.qcow2 \
   -m 2G -smp 2 -nographic

Log into the guest and mount it

 $ mount -t virtiofs myfs /mnt

Changelog:
 RFC v2 -> v1:
 - patch 1:
  + Added `force_revision_1 = true` (Conny)
  + I didn't add the r-b from Stefan Hajnoczi as I've added the
    changes suggested by Conny
 - squashed patches 2 and 3:
  + removed assertion in performance critical code path (Stefan)
  + dropped all dead code (Stefan)
  + removed libvhost-access.h
  
 RFC v1 -> RFC v2:
  + rebased
  + drop patch "libvhost-user: print invalid address on vu_panic" as it's not related to this series
  + drop patch "[RFC 4/4] HACK: Hard-code the libvhost-user.o-cflags for s390x"
  + patch "virtio: add vhost-user-fs-ccw device": replace qdev_set_parent_bus and object_property_set_bool by qdev_realize
  + patch "libvhost-user: handle endianness as mandated by the spec":
    Drop support for legacy virtio devices
  + add patch to fence legacy virtio devices
*** BLURB HERE ***

Halil Pasic (1):
  virtio: add vhost-user-fs-ccw device

Marc Hartmayer (1):
  libvhost-user: handle endianness as mandated by the spec

 contrib/libvhost-user/libvhost-user.c | 77 +++++++++++++++------------
 hw/s390x/Makefile.objs                |  1 +
 hw/s390x/vhost-user-fs-ccw.c          | 75 ++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 34 deletions(-)
 create mode 100644 hw/s390x/vhost-user-fs-ccw.c

-- 
2.25.4


