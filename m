Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396692C8BF7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:03:56 +0100 (CET)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnWk-0000nw-OZ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVT-0008Dq-RH
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVQ-0007VY-79
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606759350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DMPwiZa7rpwD9V7e7oCGKaU3N8uF6Hesl40JvbzW8GU=;
 b=HqmtKkG/ehFXIQKJxjGOVKH8SE+ep1RXcxNAm3llzAZD7XvaE6OgRNgluw8OF/fKNuYlDQ
 3zyiUHUb9VC5B+t7kD+jPIA3ucU3gYY6RteXj20p6d7mrYLOHN5T654tp38z31e2sLc2Dp
 P/DyrcSyx2CQdDCM7K36gYE+RB51IzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-c2RVnhM7NVSnSLbIXZD3zQ-1; Mon, 30 Nov 2020 13:02:26 -0500
X-MC-Unique: c2RVnhM7NVSnSLbIXZD3zQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B77180A094;
 Mon, 30 Nov 2020 18:02:24 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3993019C71;
 Mon, 30 Nov 2020 18:02:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tests/acceptance: enhance s390x devices test
Date: Mon, 30 Nov 2020 19:02:13 +0100
Message-Id: <20201130180216.15366-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series builds upon the new s390x acceptance test currently
queued on my s390-next branch.

Sadly, the kernel/initrd I'm using does not have the virtio-net driver,
so I cannot test things like mac address specification etc. Instead,
I added some quick checks regarding legacy virtio and propagation of
device type and fid properties.

Next up: maybe some device plug/unplug tests; but I still need to find
some inspiration there.

[And yes, I know that checkpatch moans about long lines -- hard to avoid
if you use a function with a very long name.]

Cornelia Huck (3):
  tests/acceptance: test virtio-ccw revision handling
  tests/acceptance: verify s390x device detection
  tests/acceptance: test s390x zpci fid propagation

 tests/acceptance/machine_s390_ccw_virtio.py | 41 ++++++++++++++++++---
 1 file changed, 36 insertions(+), 5 deletions(-)


base-commit: 875a99a0354211276b6daf635427b3c52a025790
-- 
2.26.2


