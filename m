Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2C35EF30
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:21:10 +0200 (CEST)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWaln-0002k3-7M
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakC-0001Th-81
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWak9-0004l7-Tt
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1sVxU0PXLQaPQeG9jxJgks5xp4+ooe8mHGz/rSPw+x8=;
 b=U87EMeXgjyBIEM/wU+pDvp8Jg1eNAZFxhnpgM+v1fuFMksXXZxsbqUN3kN+9zuIny1xY+Q
 4LcDrcuB2PDy7YpnmcM918pptIdnItgeqOKZ6/mmMlmmUimpId96q25a/HUMDecLnr2qYP
 cxdxfNFjKQscENWh9ltn4z3bnZppfUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-nLnxysPsMxO3OKoJU6iqgw-1; Wed, 14 Apr 2021 04:19:22 -0400
X-MC-Unique: nLnxysPsMxO3OKoJU6iqgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2E3107ACC7;
 Wed, 14 Apr 2021 08:19:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A09715D9CA;
 Wed, 14 Apr 2021 08:19:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 0/5] Use ccache in the gitlab-CI
Date: Wed, 14 Apr 2021 10:19:02 +0200
Message-Id: <20210414081907.871437-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are some patches to enable ccache in the gitlab-CI. Using the
compiler cache can speed up some of the jobs in the CI by avoiding
to recompile the same sources again and again. With this patch series,
some jobs indeed get quite a bit faster. For example "build-system-fedora"
goes down from 29 minutes (https://gitlab.com/thuth/qemu/-/jobs/1168149051)
to 12 minutes (https://gitlab.com/thuth/qemu/-/jobs/1175479324) in the
best case.
However, and that's why I've marked this series still as RFC, there
are some jobs which refuse to improve much, for example the *-cfi-* jobs
are still running for a long time, see e.g.:

 https://gitlab.com/thuth/qemu/-/jobs/1168149079 (50 minutes on master)
 https://gitlab.com/thuth/qemu/-/jobs/1175479342 (43 minutes with ccache)

Thus the overall run time did not improve very much yet.

Additionally, the jobs are sometimes running even slower, e.g. if the
cache has not been populated yet or if there are a lot of cache misses,
and I've seen some jobs hitting the 60 min time limit because of this.
And I've even seen two or three jobs failing intermittendly with a
crashing test, e.g.:

 https://gitlab.com/thuth/qemu/-/jobs/1175479336

Not sure whether that's related to some bad caching of ccache, or
whether it's something that also occurs on the master branch recently?
Has anybody else experienced such a problem?

Thus this series is RFC only - in case somebody else wants to play
with it and help to improve it, you're very welcome!

Thomas Huth (5):
  tests/docker/dockerfiles: Add ccache to containers where it was
    missing
  tests/docker/dockerfiles/ubuntu2004: Add missing symlink for cc
  gitlab-ci.d/crossbuilds: Limit the amount of targets in the
    cross-win64 build
  gitlab-ci.yml: Compile with ccache enabled
  gitlab-ci.d/crossbuilds.yml: Enable compilation with ccache

 .gitlab-ci.d/crossbuilds.yml                  | 34 +++++++++++++++++++
 .gitlab-ci.yml                                | 20 +++++++++++
 tests/docker/dockerfiles/alpine.docker        |  1 +
 .../dockerfiles/fedora-i386-cross.docker      |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  3 ++
 8 files changed, 62 insertions(+)

-- 
2.27.0


