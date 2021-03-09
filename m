Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C323332381
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:01:03 +0100 (CET)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa6o-0003Gi-AT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZtU-0005uU-E5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:47:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZtP-00071S-OE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVZfGpZdgU8Z1wzcPLLTVOUCTSuuV4S0GcRAE+fr55o=;
 b=EfCjhu917BSCaG7A/x+4v/anEnOP8bLl8/XRd6GGIlYF2w+4Mnpm90RJeGxC2VGmN8mCVz
 hGNGBsW4pNrnQLglOXPwbLJ658OAaoIpSa2/lScsOkxdt6QLtF437sh8rGO8K9V4laYWeU
 Ico+k69MUle3VZVRHqDX1+XsnezCsHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-zgtZvFGKNcCT9ZRQKUOVPg-1; Tue, 09 Mar 2021 05:47:05 -0500
X-MC-Unique: zgtZvFGKNcCT9ZRQKUOVPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 981BA801814;
 Tue,  9 Mar 2021 10:47:04 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70F3860C04;
 Tue,  9 Mar 2021 10:47:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] bsd-user: Add new maintainers
Date: Tue,  9 Mar 2021 11:46:17 +0100
Message-Id: <20210309104617.714908-15-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

The FreeBSD project has a number of enhancements to bsd-user. These changes have
evolved over the past 10 year, and aren't currently updated to the latest
version of qemu due to fluxuations in staffing causing us to fall behind in the
past. We're working on porting all the changes forward and contributing all the
changes back to qemu. Add myself as maintainer and Kyle Evans as a reviewer for
changes. In addition, add a pointer to our github repo in the interim while this
work is ongoing.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210308224023.75187-1-imp@bsdimp.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68388900af..06ea6e0b9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2903,9 +2903,12 @@ F: thunk.c
 F: accel/tcg/user-exec*.c
 
 BSD user
-S: Orphan
+M: Warner Losh <imp@bsdimp.com>
+R: Kyle Evans <kevans@freebsd.org>
+S: Maintained
 F: bsd-user/
 F: default-configs/targets/*-bsd-user.mak
+T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
-- 
2.27.0


