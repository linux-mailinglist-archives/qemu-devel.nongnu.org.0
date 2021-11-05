Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D141E445F16
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:19:25 +0100 (CET)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqhI-0000l0-In
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqg7-0008Vm-Az
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqg3-0001Sk-Ti
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636085886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fI6f7jQkDieenvuqYuifT5O21SKQ3enNdbU2rzCuTbE=;
 b=W0r1MU+LGGJTsq0YxHea+0GrA0GbHEEHOTkvqAAu4yLwdAiEoR1TIXq+sYAlto8ajQGOJK
 te2Pxw82IHq149w47EdU+bYzXHXjOOpbU9fmBcMDhEQcowrp1Djz0mz9WGcaQWbZiR4f/o
 lmeX6b/KZXUzNhx2emvIK+NPgOPlGjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-vc1i14XdNpmOapeu9V_ZAg-1; Fri, 05 Nov 2021 00:18:02 -0400
X-MC-Unique: vc1i14XdNpmOapeu9V_ZAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD8236254;
 Fri,  5 Nov 2021 04:18:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-79.pek2.redhat.com [10.72.12.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CC2652AC;
 Fri,  5 Nov 2021 04:17:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 0/2] Net patches
Date: Fri,  5 Nov 2021 12:17:46 +0800
Message-Id: <20211105041748.1681-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 18e356a53a2926a15343b914db64324d63748f25:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-041121-2' into staging (2021-11-04 08:33:46 -0400)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 3fd641ac5ec713e67129c1a57e8b6281182bd843:

  Fix virtio-net-pci* "vectors" compat (2021-11-05 11:32:00 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Eduardo Habkost (1):
      Fix virtio-net-pci* "vectors" compat

Jon Maloy (1):
      e1000: fix tx re-entrancy problem

 hw/core/machine.c | 2 +-
 hw/net/e1000.c    | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)



