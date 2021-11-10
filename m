Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35944BB64
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:48:38 +0100 (CET)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgTN-0006Uv-5p
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgQj-0004cE-3Y
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:45:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgQf-0007jp-S2
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636523148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=980LWXE9VHZXZ7/r3QDxoVkigDe3wcSPt9k6iKIV7SQ=;
 b=A1y1C5UJAExefGe2z+aFNbDvC/vCitc/eATNF8bKORGR6XSsNmt/SeZ/iYloxM/KFF33At
 8iA4hXMzuw7jAlWy3rHQFChDgTL++hSOR6jmyDJPLYkXBReXNAoa7rdUBvWOTC/wXzyj1b
 Nd95TKEe8Ll+h6rSngG3avIq21C/jvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-B8e5UWsKMKKcrs8a4DXCwg-1; Wed, 10 Nov 2021 00:45:44 -0500
X-MC-Unique: B8e5UWsKMKKcrs8a4DXCwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C183B87498F;
 Wed, 10 Nov 2021 05:45:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E27104253B;
 Wed, 10 Nov 2021 05:45:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F191811380A7; Wed, 10 Nov 2021 06:45:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Monitor patches patches for 2021-11-10
Date: Wed, 10 Nov 2021 06:45:40 +0100
Message-Id: <20211110054541.2368410-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:

  Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-monitor-2021-11-10

for you to fetch changes up to 1bf4d3294bd48b702530b131e3344860495425fd:

  monitor: Fix find_device_state() for IDs containing slashes (2021-11-10 06:14:51 +0100)

----------------------------------------------------------------
Monitor patches patches for 2021-11-10

----------------------------------------------------------------
Markus Armbruster (1):
      monitor: Fix find_device_state() for IDs containing slashes

 include/qom/object.h   | 12 ++++++++++++
 qom/object.c           | 11 +++++++++++
 softmmu/qdev-monitor.c |  8 +-------
 3 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.31.1


