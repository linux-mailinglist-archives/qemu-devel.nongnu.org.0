Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DCE22EEA8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 16:09:54 +0200 (CEST)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k03pB-0003xr-72
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 10:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k03lA-0007Uj-7r
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:05:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49999
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k03l8-0005ju-61
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595858741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KVLGhJdLF90B78Vu11YVvNt4iQnG1MHj8LZCAuqVhzI=;
 b=MxmL96p/EUmVR7aPKyk90KuJ8/o0lsd9VVmxhwQZWu6p3p+gWKU1I1DNnV8Mrh8jV5EKx6
 JIGjGpZbIo9jzgz+3c7Q7wTO0BpBODMbta4cdVlw5Tf21jE/4xBeVe6ekOlYr71c51iG37
 Ij5QaT4ShqYTrlnQyFeYgJok4hzNYEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-e2tfskLtMxavSK0bOgPXiw-1; Mon, 27 Jul 2020 10:05:28 -0400
X-MC-Unique: e2tfskLtMxavSK0bOgPXiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB7580BCAE;
 Mon, 27 Jul 2020 14:05:27 +0000 (UTC)
Received: from localhost (ovpn-112-210.ams2.redhat.com [10.36.112.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CABD98FF9F;
 Mon, 27 Jul 2020 14:05:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/2] some more s390x fixes
Date: Mon, 27 Jul 2020 16:05:20 +0200
Message-Id: <20200727140522.251815-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:46:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8ffa52c20d5693d454f65f2024a1494edfea65d4:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-07-23 13:38:21 +0100)

are available in the Git repository at:

  https://github.com/cohuck/qemu tags/s390x-20200727

for you to fetch changes up to d6645483285feaa0aa26fe2b0c3bac6989250d2f:

  s390x/s390-virtio-ccw: fix loadparm property getter (2020-07-24 08:49:53 +0200)

----------------------------------------------------------------
fixes for protected virtualization and loadparm handling

----------------------------------------------------------------

Christian Borntraeger (1):
  s390x/protvirt: allow to IPL secure guests with -no-reboot

Halil Pasic (1):
  s390x/s390-virtio-ccw: fix loadparm property getter

 hw/s390x/ipl.c             | 3 ++-
 hw/s390x/s390-virtio-ccw.c | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.4


