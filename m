Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC12715EA
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 18:26:58 +0200 (CEST)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK2Az-00087S-8T
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kK28y-0006s9-7Q
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kK28v-0008BZ-DB
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600619086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f78w0vyPUhdZOsyzkXQ6u8rB4aN/S08TR3PercA4tuQ=;
 b=aXfPEcl5VUtkJZe47ma9FSo8Th5T9jBof7FMkKBqsoqcWqL5dG7s2+8pVs6YoD+Q0mH9RE
 lkbickaNyt4nQKE1zazVxnzUkpgEklw73FGTUy2S/XMC12BxDi3E+BPzBqjIiPWyOe8GGV
 cAy2IYJehSXicYGuEBPv3qIZ2SkV3lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468--tsNge6KNeaqpNeehsqXRw-1; Sun, 20 Sep 2020 12:24:44 -0400
X-MC-Unique: -tsNge6KNeaqpNeehsqXRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E361F186841A
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 16:24:43 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F40B8100239A;
 Sun, 20 Sep 2020 16:24:35 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] vhost-vdpa: add trace functions in vhost-vdpa.c
Date: Sun, 20 Sep 2020 18:24:32 +0200
Message-Id: <20200920162434.868041-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 11:14:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add trace events functions in vdpa functions.=0D
=0D
Modify qemu_hexdump() to be able to dump the vdpa config=0D
in trace logs in hexadecimal form.=0D
=0D
Laurent Vivier (2):=0D
  util/hexdump: introduce qemu_hexdump_line()=0D
  vhost-vdpa: add trace-events=0D
=0D
 hw/virtio/trace-events | 29 ++++++++++++++=0D
 hw/virtio/vhost-vdpa.c | 85 +++++++++++++++++++++++++++++++++++++++---=0D
 include/qemu-common.h  |  8 ++++=0D
 util/hexdump.c         | 54 +++++++++++++++++----------=0D
 4 files changed, 151 insertions(+), 25 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


