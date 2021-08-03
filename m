Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF83DF5C8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:36:35 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0DK-0007C6-8T
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0C1-00058i-Dt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0C0-0002Uv-1t
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628019311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvnucPwZ+0MrBCwibixJURNhaS3Tam1v4/QE7fUvZ6o=;
 b=cvlMrQGypVE4WFID+XwNvaqMQ2ZatM+4FXaD6R9WCWi2uKIy/yRO4I5lv2F6m0HeiG5KIt
 U0Hpr/SnsMYp0pugAGT/78yYvkhDU3pL79V0JRWN24v0xObOat/+pAu4Wy11v2W40uO7ty
 BfHsDz1j5SOEWONTohbH75yacBiR2lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-u0xHvPdGPt6Y9cwu9rdqCA-1; Tue, 03 Aug 2021 15:35:08 -0400
X-MC-Unique: u0xHvPdGPt6Y9cwu9rdqCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414D1107ACF5;
 Tue,  3 Aug 2021 19:35:07 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.8.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBD1117C58;
 Tue,  3 Aug 2021 19:35:01 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
Date: Tue,  3 Aug 2021 15:34:47 -0400
Message-Id: <20210803193447.3946219-3-crosa@redhat.com>
In-Reply-To: <20210803193447.3946219-1-crosa@redhat.com>
References: <20210803193447.3946219-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests/acceptance directory is currently lacking a maintainer
entry, even though I've been performing that role (of course with help
from many others).  Thus, its status is, even more now, Maintained.

This also removes the currently broken Trello board link, which was
make unavailable unintentionally by a third party.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e442..d35b948e8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3418,11 +3418,11 @@ F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
 
 Acceptance (Integration) Testing with the Avocado framework
-W: https://trello.com/b/6Qi1pxVn/avocado-qemu
-R: Cleber Rosa <crosa@redhat.com>
+M: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-S: Odd Fixes
+S: Maintained
+F: tests/Makefile.include
 F: tests/acceptance/
 
 Documentation
-- 
2.31.1


