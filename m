Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E0493698
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:52:37 +0100 (CET)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6ho-0006QR-IW
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6OL-0006Te-3n
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6OH-0004ea-9X
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c5BFD85XMQpvEgLTa9MIFPkvAY/k1xbv2nSo+ANy1KM=;
 b=D960VaDHfHXcCqV1OK9clfieeip/WzYvf5y4RYyly9mirbs/P7UyeKWOu0dtg5MwHprWpO
 tLd7osQ8Y6B8WzZZn0HuknRGFY00Z4kjw+gNT/teF1jbCD7ximvRss9eCCDpcaYOOAYv84
 a5/0gVvO4UMCdtinz1HHslzcN89I7VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-JxNJ3vpNNAu5T8UAXv2qVw-1; Wed, 19 Jan 2022 03:32:20 -0500
X-MC-Unique: JxNJ3vpNNAu5T8UAXv2qVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8575110151E4;
 Wed, 19 Jan 2022 08:32:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 741D14F858;
 Wed, 19 Jan 2022 08:32:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] s390x patches (shift instructions, MAINTAINERS, ...)
Date: Wed, 19 Jan 2022 09:32:05 +0100
Message-Id: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 69353c332c558cead5f8081d0bb69f989fe33fa3:

  Merge remote-tracking branch 'remotes/konstantin/tags/qga-win32-pull-2022-01-10' into staging (2022-01-16 16:32:34 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-01-19

for you to fetch changes up to 59b9b5186e44a90088a91ed7a7493b03027e4f1f:

  s390x: sigp: Reorder the SIGP STOP code (2022-01-18 15:00:57 +0100)

----------------------------------------------------------------
* Fix bits in one of the PMCW channel subsystem masks
* s390x TCG shift instruction fixes
* Re-organization for the MAINTAINERS file
* Support for extended length of kernel command lines
* Re-order the SIGP STOP code

----------------------------------------------------------------
Cornelia Huck (1):
      MAINTAINERS: split out s390x sections

Eric Farman (2):
      MAINTAINERS: Add myself to s390 I/O areas
      s390x: sigp: Reorder the SIGP STOP code

Ilya Leoshkevich (5):
      target/s390x: Fix SLDA sign bit index
      target/s390x: Fix SRDA CC calculation
      target/s390x: Fix cc_calc_sla_64() missing overflows
      target/s390x: Fix shifting 32-bit values for more than 31 bits
      tests/tcg/s390x: Test shift instructions

Marc Hartmayer (1):
      s390x/ipl: support extended kernel command line size

Nico Boehr (1):
      s390x/css: fix PMCW invalid mask

 MAINTAINERS                     |  88 +++++++++++--
 hw/s390x/ipl.c                  |  27 +++-
 include/hw/s390x/ioinst.h       |   2 +-
 target/s390x/cpu-dump.c         |   3 +-
 target/s390x/s390x-internal.h   |   3 +-
 target/s390x/sigp.c             |  12 +-
 target/s390x/tcg/cc_helper.c    |  38 +-----
 target/s390x/tcg/insn-data.def  |  36 +++---
 target/s390x/tcg/translate.c    |  53 ++++----
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/shift.c         | 270 ++++++++++++++++++++++++++++++++++++++++
 11 files changed, 430 insertions(+), 103 deletions(-)
 create mode 100644 tests/tcg/s390x/shift.c


