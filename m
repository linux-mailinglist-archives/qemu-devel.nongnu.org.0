Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE94B4C1F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 12:41:39 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAAvR-0006rr-FU
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 06:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAcy-00085H-3f
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAcx-0004Ny-00
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17940
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAcw-0004NM-QR
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:30 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHlL0103506
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2tk275js-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:30 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:22:27 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:22:21 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8HAMJ9e46662000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:22:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACB81A4040;
 Tue, 17 Sep 2019 10:22:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABAAEA4053;
 Tue, 17 Sep 2019 10:22:18 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 10:22:18 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:22:18 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-0028-0000-0000-0000039E0F00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-0029-0000-0000-0000246087A9
Message-Id: <156871573833.196432.7906362695920387537.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=445 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 17/17] checkpatch: Warn when errp is passed to
 error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@d06av23.portsmouth.uk.ibm.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing errp from the argument list to error_append_hint()
isn't recommended because it may cause unwanted behaviours
when errp is equal to &error_fatal or &error_abort.

First, error_append_hint() aborts QEMU when passed either of
those.

Second, consider the following:

    void foo(Error **errp)
    {
         error_setg(errp, "foo");
         error_append_hint(errp, "Try bar\n");
    }

error_setg() causes QEMU to exit or abort, and hints aren't
added.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 scripts/checkpatch.pl |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index aa9a354a0e7e..17ce026282a6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2902,6 +2902,10 @@ sub process {
 		}
 	}
 
+		if ($line =~ /error_append_hint\(errp/) {
+		    WARN("suspicious errp passed to error_append_hint()\n" .
+			 $herecurr);
+		}
 # check for non-portable libc calls that have portable alternatives in QEMU
 		if ($line =~ /\bffs\(/) {
 			ERROR("use ctz32() instead of ffs()\n" . $herecurr);


