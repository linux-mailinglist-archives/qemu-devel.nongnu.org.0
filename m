Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DB63A4E0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaP9-0004ca-QO; Mon, 28 Nov 2022 04:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaOu-0004bA-9v
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozaOs-0004ne-Hz
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669627565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J6oNLufdPTiNrsLEnR8CxlIggd9h72+5Cgq/n/ST8Nk=;
 b=A2byAQQolHkATyTp56DydpPnpQc+VlD1/fjIjgFzddg/U6q37U6J3h/ckBMqpc+jSzpHuy
 gGHS9siyz8xQfmQe1d4I0kZb56Rk64sxZFY3DLUNc2UDD7u/4YUh3FINJpdfcMFifDxQ3g
 t6IyJtX+LD4X3hw9RrrTrJFCuBeAA0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-bRTOVFdsPoWNj65Q1PdhJQ-1; Mon, 28 Nov 2022 04:26:02 -0500
X-MC-Unique: bRTOVFdsPoWNj65Q1PdhJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86C2A800186;
 Mon, 28 Nov 2022 09:26:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABA6F49BB61;
 Mon, 28 Nov 2022 09:25:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
Date: Mon, 28 Nov 2022 10:25:50 +0100
Message-Id: <20221128092555.37102-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Our release tarballs are huge - qemu-7.2.0-rc2.tar.xz has a size of 116
MiB. If you look at the contents, approx. 80% of the size is used for the
firmware sources that we ship along to provide the sources for the ROM
binaries. This feels very wrong, why do we urge users to download such
huge tarballs while 99.9% of them never will rebuilt the firmware sources?
We were also struggeling a bit in the past already with server load and
costs, so we should really try to decrease the size of our release tarballs
to a saner level.

So let's split the firmware sources into a separate tarball to decrease
the size of the main QEMU sources tarball a lot (which should help us
to safe a lot of traffic on the server).

Additional improvements for the make-release script add a little help text
and speed it up by downloading less data from the various git repositories.

v2:
 - Move the firmware sources into a separate tarball instead of dropping
   the edk2 and skiboot sources.

Thomas Huth (5):
  scripts/make-release: Add a simple help text for the script
  scripts/make-release: Only clone single branches to speed up the
    script
  scripts/make-release: Remove CI yaml and more git files from the
    tarball
  roms: Add a README file with some basic information
  scripts/make-release: Move roms into separate tarball

 roms/README.rst      | 24 ++++++++++++++++++++++++
 scripts/make-release | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 53 insertions(+), 5 deletions(-)
 create mode 100644 roms/README.rst

-- 
2.31.1


