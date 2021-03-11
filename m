Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AC337019
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:35:31 +0100 (CET)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIfC-0005bR-A7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIct-0002VO-2g
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcr-0005e7-Cy
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c76XY6aVwV6a7rXABr9GRgCzn+vUt5NpLcUrsDRWmoI=;
 b=MaSaGKGW35OSyXh2uAkC/k+CZKXFtCXcC7GBHcGq6ms+2JkA1yf6RE9Hyglyp2JLTVJ0Y5
 YOqyiytMbuvjEU4M9MwEdb49aGhoyFdaNAM1xzV8w4vo8RyfnROqbBpqIEuZGzgMUVelcr
 CBwy4+tRB0ofFlu1D0buspUSUiJA0iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-GNJPr-_tOEOzbo58GoNt-g-1; Thu, 11 Mar 2021 05:33:02 -0500
X-MC-Unique: GNJPr-_tOEOzbo58GoNt-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3E7410866AB
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4192D29400;
 Thu, 11 Mar 2021 10:32:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] vhost: replace master/slave with more accurate wording
Date: Thu, 11 Mar 2021 05:32:43 -0500
Message-Id: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compared to v1, which only affected the prose of the documentation, I
am also changing the message names in the docs and code now.

Patch 2 was also adjusted according to Stefan's documentation, and
"frontend/backend" (with no hyphen) is used consistently.

Paolo

Supersedes: <20210226143413.188046-1-pbonzini@redhat.com>

Paolo Bonzini (7):
  docs: vhost-user: clean up request/reply description
  docs: vhost-user: rewrite section on ring state machine
  docs: vhost-user: replace master/slave with front-end/back-end
  docs: vhost-user: rename message names from "SLAVE" to "BACKEND"
  vhost-user: rename message names from "SLAVE" to "BACKEND"
  libvhost-user: rename message names from "SLAVE" to "BACKEND"
  libvhost-user: rename struct VuDev fields from "slave" to "backend"

 docs/interop/vhost-user-gpu.rst           |  10 +-
 docs/interop/vhost-user.rst               | 532 ++++++++++++----------
 hw/virtio/vhost-user.c                    |  96 ++--
 subprojects/libvhost-user/libvhost-user.c |  66 +--
 subprojects/libvhost-user/libvhost-user.h |  45 +-
 5 files changed, 395 insertions(+), 354 deletions(-)

-- 
2.26.2


