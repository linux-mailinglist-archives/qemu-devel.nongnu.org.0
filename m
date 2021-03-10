Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363B3334A0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:59:22 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqwL-0006UX-D0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJqvb-000645-KF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJqvY-0000Jd-Oe
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 23:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615352311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KDGSB/F5q1mF4vCxZ0IcFIyOROaqif8GR3QUq10S0HQ=;
 b=UD9GXDCrop4jBCRD89Fk/8GwmbjVSQBWahjVt+V8IQwCyu3a4kuof7y4twwGjvT/lKnl6u
 EWktxO030E0maqLULSZOBfIAx0jYYFO5MawEAA4PJCke7nhgHuewzVnSGuJmsB61kyzRZf
 eNqebnHN9N4jNhZYvI/a7Ya2KRYUTg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-lo03C3VQNOeiNVdCnhUkuQ-1; Tue, 09 Mar 2021 23:58:29 -0500
X-MC-Unique: lo03C3VQNOeiNVdCnhUkuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 619A81005D4A;
 Wed, 10 Mar 2021 04:58:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5ABF60CED;
 Wed, 10 Mar 2021 04:58:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: Fix removal text of -show-cursor
Date: Wed, 10 Mar 2021 05:58:21 +0100
Message-Id: <20210310045821.1004396-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should say now when it was removed, not when it was deprecated.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/removed-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index f8db76d0b5..13f9dd3014 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -26,8 +26,8 @@ The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
-``-show-cursor`` option (since 5.0)
-'''''''''''''''''''''''''''''''''''
+``-show-cursor`` option (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''
 
 Use ``-display sdl,show-cursor=on``, ``-display gtk,show-cursor=on``
 or ``-display default,show-cursor=on`` instead.
-- 
2.27.0


