Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A066C1B422
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 12:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ8JG-0005dJ-Oz
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 06:35:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hQ8Hd-00051e-6e
	for qemu-devel@nongnu.org; Mon, 13 May 2019 06:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hQ8Hc-0007Br-6d
	for qemu-devel@nongnu.org; Mon, 13 May 2019 06:34:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51696
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hQ8Hc-0007Ba-1B
	for qemu-devel@nongnu.org; Mon, 13 May 2019 06:34:12 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4DAVk60139500
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 06:34:11 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sf4eewkb2-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 06:34:11 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <groug@kaod.org>;
	Mon, 13 May 2019 11:34:09 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 13 May 2019 11:34:06 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4DAY5b542795086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 13 May 2019 10:34:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A850D11C04A;
	Mon, 13 May 2019 10:34:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79FC611C04C;
	Mon, 13 May 2019 10:34:05 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.37.105])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 13 May 2019 10:34:05 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 12:34:05 +0200
In-Reply-To: <155774341935.175576.9256391991091401927.stgit@bahia.lan>
References: <155774341935.175576.9256391991091401927.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051310-0012-0000-0000-0000031B1383
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051310-0013-0000-0000-00002153A5B8
Message-Id: <155774364513.175576.16227408255899232620.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905130076
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v2 1/2] vl: Deprecate -virtfs_synth
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The synth fsdriver never got used for anything else but the QTest
testcase for VirtIO 9P. And even there, QTest uses -fsdev synth and
-device virtio-9p-... directly.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - change "no replacement" to "use '-fsdev synth' instead"
---
 qemu-deprecated.texi |    5 +++++
 qemu-options.hx      |    3 ++-
 vl.c                 |    4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 842e71b11dcc..1a821b68f435 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -72,6 +72,11 @@ backend settings instead of environment variables.  To ease migration to
 the new format, the ``-audiodev-help'' option can be used to convert
 the current values of the environment variables to ``-audiodev'' options.
 
+@subsection -virtfs_synth (since 4.1)
+
+The ``-virtfs_synth'' argument is now deprecated. Please use ``-fsdev synth''
+and ``-device virtio-9p-...'' instead.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
diff --git a/qemu-options.hx b/qemu-options.hx
index 51802cbb266a..03c50ba0f0b2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1368,7 +1368,8 @@ DEF("virtfs_synth", 0, QEMU_OPTION_virtfs_synth,
 STEXI
 @item -virtfs_synth
 @findex -virtfs_synth
-Create synthetic file system image
+Create synthetic file system image. Note that this option is now deprecated.
+Please use @code{-fsdev synth} and @code{-device virtio-9p-...} instead.
 ETEXI
 
 DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
diff --git a/vl.c b/vl.c
index b6709514c1bb..8456f006edbd 100644
--- a/vl.c
+++ b/vl.c
@@ -3535,6 +3535,10 @@ int main(int argc, char **argv, char **envp)
                 QemuOpts *fsdev;
                 QemuOpts *device;
 
+                warn_report("'-virtfs_synth' is deprecated, please use "
+                             "'-fsdev synth' and '-device virtio-9p-...' "
+                            "instead");
+
                 fsdev = qemu_opts_create(qemu_find_opts("fsdev"), "v_synth",
                                          1, NULL);
                 if (!fsdev) {


