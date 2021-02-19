Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81431F58A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:00:41 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD0iM-0005Qz-L4
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0fc-0003KY-9m
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0fa-0002XG-2L
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613721463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hSz50b7VjiI40JzyGItnEBdsvPXqIExqtcuz49HJ5yQ=;
 b=eHnGYOXwKVCIz99ltXrZs1Q2pK3bkXeziUXNu6qu/Br9s2wTyyOy3+sJ12FWcZNBrb7vzZ
 yAL5jH/btUohy9cnKzOrJkZPpJ7q8TR7tM7+BOjLMqdcXyiz1rx0EaAG4ewthmg/jnuEt/
 7Aq6BxExtG0BMPli41+EpwjelIwOVMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-5iqj3El0OZCmHMkvan6mvg-1; Fri, 19 Feb 2021 02:57:42 -0500
X-MC-Unique: 5iqj3El0OZCmHMkvan6mvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0286E1E57A;
 Fri, 19 Feb 2021 07:57:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E43955D9C2;
 Fri, 19 Feb 2021 07:57:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/10] gitlab and qtest patches
Date: Fri, 19 Feb 2021 08:57:28 +0100
Message-Id: <20210219075738.2261103-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2021-02-19

for you to fetch changes up to fc4241827fffc761f0ca41536c1c7d88b1b1d0c4:

  travis.yml: Limit simultaneous jobs to 3 (2021-02-19 06:31:40 +0100)

----------------------------------------------------------------
* Always build the container images in the gitlab-CI
* Some other small gitlab-CI improvements
* Some qtest fixes
* One patch to (hopefully) silence the failing Travis jobs
----------------------------------------------------------------

Daniel P. Berrangé (3):
      gitlab: always build container images
      gitlab: add fine grained job deps for all build jobs
      gitlab: fix inconsistent indentation

Philippe Mathieu-Daudé (3):
      tests/qtest/boot-serial-test: Test Virt machine with 'max'
      gitlab-ci: Display Avocado log content when tests timeout
      gitlab-ci: Disable vhost-kernel in build-disable job

Thomas Huth (4):
      scripts/checkpatch: Improve the check for authors mangled by the mailing list
      tests/qtest/boot-sector: Check that the guest did not panic
      gitlab-ci.yml: Run check-tcg with TCI
      travis.yml: Limit simultaneous jobs to 3

 .gitlab-ci.d/containers.yml    |  7 ----
 .gitlab-ci.d/crossbuilds.yml   | 46 ++++++++++++++++++++++++
 .gitlab-ci.yml                 | 81 ++++++++++++++++++++++++++++++++++++------
 .travis.yml                    |  4 ++-
 scripts/checkpatch.pl          |  2 +-
 tests/qtest/boot-sector.c      |  9 +++++
 tests/qtest/boot-serial-test.c |  2 +-
 7 files changed, 130 insertions(+), 21 deletions(-)


