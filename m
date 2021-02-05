Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B231079D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:22:24 +0100 (CET)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xJn-0003yi-T0
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGe-0002hJ-QK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGd-0007nV-An
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HGnC75DgoNi8WuUBLYhDlkqTHY3lCHcrOY44TawaMUw=;
 b=I0repbndhXrTUv3CMWPRxLyumfvqb40hIzPamVA9Pm5RkSa3AoKbwthK1y82qXIMI1IN/s
 3BV+Mp3Pr2g1jtL1ZTzA0oYLoS7SfrdYrvtjBFdtOtNZCZduESt0zokPxtsRDIxXT53p/G
 A+Z8d/V7c/iZoDiFLS7btSWLURqcXUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-HYMM9_ISM8GVPW-YhUzneA-1; Fri, 05 Feb 2021 04:19:04 -0500
X-MC-Unique: HYMM9_ISM8GVPW-YhUzneA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2350192D786;
 Fri,  5 Feb 2021 09:19:03 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72C225D9CC;
 Fri,  5 Feb 2021 09:18:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/5] Move remaining x86 Travis jobs to the gitlab-CI
Date: Fri,  5 Feb 2021 10:18:52 +0100
Message-Id: <20210205091857.845389-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since Travis changed their policies, travis-ci.org will soon become
completely useless for the QEMU project. We should now really make sure
that we move the remaining tests as good as possible to the gitlab-CI
instead.

v2:
 - Run "make check" in the gprof/gcov test
 - Make sure that we run at least one test with --enable-debug
 - Reworked the thread sanitizer patch to use --enable-tsan + clang now

Philippe Mathieu-Daudé (1):
  travis.yml: Move gprof/gcov test across to gitlab

Thomas Huth (4):
  travis.yml: Move the -fsanitize=undefined test to the gitlab-CI
  travis.yml: Move the --enable-modules test to the gitlab-CI
  travis.yml: (Re-)move the --enable-debug jobs
  travis.yml: Move the -fsanitize=thread testing to the gitlab-CI

 .gitlab-ci.yml                             |  38 ++++++-
 .travis.yml                                | 111 ---------------------
 MAINTAINERS                                |   2 +-
 scripts/{travis => ci}/coverage-summary.sh |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 5 files changed, 39 insertions(+), 116 deletions(-)
 rename scripts/{travis => ci}/coverage-summary.sh (92%)

-- 
2.27.0


