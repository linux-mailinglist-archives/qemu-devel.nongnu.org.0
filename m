Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C330D8BC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:36:00 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GRz-0003io-4M
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GP1-0001xR-Pj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GP0-0004sP-3O
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IOPuZ2vswSWC9o5uIki9RWonYvQVhOHL4Ive7hkp36E=;
 b=Jd/ZR8Od7q5uYMXcBYZrHK94CLrIOvc+WIO6h7YQYfp/sFqSYPOgMcUYQb7LF/WrEWO3Tu
 YRR9lhWe4JKjcEbMy1z0LC5sTD7uyvk91/T9uUelIltwX67zdZrsC+OGifVZGflOKQI+1v
 AqXkdRraBbUNsroU9lSiBnTFWSJ171s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-2Y7RvC9gNPKskI5lgcslVQ-1; Wed, 03 Feb 2021 06:32:51 -0500
X-MC-Unique: 2Y7RvC9gNPKskI5lgcslVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34DAA809DC9;
 Wed,  3 Feb 2021 11:32:50 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB3660C66;
 Wed,  3 Feb 2021 11:32:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/6] Move remaining x86 Travis jobs to the gitlab-CI
Date: Wed,  3 Feb 2021 12:32:37 +0100
Message-Id: <20210203113243.280883-1-thuth@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since Travis changed their policies, travis-ci.org will soon become
completely useless for the QEMU project. We should now really make sure
that we move the remaining tests as good as possible to the gitlab-CI
instead. Since the gitlab-CI has already quite a lot of jobs, I tried
to squeeze the missing bits as good as possible into the existing jobs
instead of adding a separate job for each and ever test that we had
in the Travis-CI - I hope that will help to avoid increasing the stress
on the CI system too much. 

Philippe Mathieu-Daudé (1):
  travis.yml: Move gprof/gcov test across to gitlab

Thomas Huth (5):
  travis.yml: Move the -fsanitize=undefined test to the gitlab-CI
  travis.yml: Move the --enable-modules test to the gitlab-CI
  travis.yml: Remove the --enable-debug jobs
  target/s390x/arch_dump: Fixes for the name field in the PT_NOTE
    section
  travis.yml: Move the -fsanitize=thread compile-testing to the
    gitlab-CI

 .gitlab-ci.yml                             |  27 ++++-
 .travis.yml                                | 110 ---------------------
 MAINTAINERS                                |   2 +-
 scripts/{travis => ci}/coverage-summary.sh |   2 +-
 target/s390x/arch_dump.c                   |   6 +-
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 6 files changed, 33 insertions(+), 116 deletions(-)
 rename scripts/{travis => ci}/coverage-summary.sh (92%)

-- 
2.27.0


