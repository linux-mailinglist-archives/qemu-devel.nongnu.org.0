Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D32D60ED
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:04:23 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOQY-0002MH-PZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKu-00081B-AS
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKs-0004xQ-8A
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607615908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qrOR0Tl997KqvCRQUJd5UybCDqSFFivrHCOxc1QYHPI=;
 b=Ym2XCGzwaXKw7QI0oeP8S2HeS/SAZROYRf7TuH6AjdDZLg1vE+Nh8Wv0nuM37wELnoMs+r
 W332R6Sxgd9TIeuK7t3rDvRD8bIkHpqCTvS7arpKeYSZQziawSaOy3zDLr4/JEdidMv0At
 TK/MKfTyAVLRs+VZC2FFRj6AhIDE47I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Ysp8wFRFMz-xGT4Pr7LMcw-1; Thu, 10 Dec 2020 10:58:24 -0500
X-MC-Unique: Ysp8wFRFMz-xGT4Pr7LMcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBE7800D53
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 15:58:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F1CE6F97E;
 Thu, 10 Dec 2020 15:58:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/4] Remove deprecated CLI parameters
Date: Thu, 10 Dec 2020 16:58:04 +0100
Message-Id: <20201210155808.233895-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove some simple CLI parameters that have been deprecated since
at least two releass already.

Philippe Mathieu-Daudé (1):
  accel/tcg: Remove deprecated '-tb-size' option

Thomas Huth (3):
  docs/system: Move the list of removed features to a separate file
  Remove the deprecated -realtime option
  Remove the deprecated -show-cursor option

 accel/tcg/translate-all.c           |   2 +-
 docs/system/deprecated.rst          | 246 ----------------------------
 docs/system/removed-features.rst    | 243 +++++++++++++++++++++++++++
 qemu-options.hx                     |  29 +---
 softmmu/vl.c                        |  45 +----
 tests/migration/guestperf/engine.py |   2 +-
 6 files changed, 247 insertions(+), 320 deletions(-)
 create mode 100644 docs/system/removed-features.rst

-- 
2.27.0


