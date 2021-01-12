Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02B2F35EE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:42:06 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMk8-0004kf-8q
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMjC-0003kZ-Bt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMj8-0000xk-Cj
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610469659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qJyeFQNiwzX7G+OuVdfBMJb/scj/d9z6dZE9aWz4dyc=;
 b=cinfylw8dqZHUMci9W8dbvI0CqjkhCsVS0o9waiqFxM1zhIYWSMdeyYnTaRiBhfR/Djz0o
 oOmyOmmxGC9MwKM4/JrnC1ugomnJ4+ZVdi+mQ5sZpdHm+IGUSm46Pl9l1rVsB2qLCbUTBb
 nlLq5k8ycpKQw3Y0iFhbIZq84UwHa2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-QoAiU1r8PxSY4mm6EfLSGg-1; Tue, 12 Jan 2021 11:40:56 -0500
X-MC-Unique: QoAiU1r8PxSY4mm6EfLSGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0004F804761;
 Tue, 12 Jan 2021 16:40:54 +0000 (UTC)
Received: from thuth.com (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FBF35D9CD;
 Tue, 12 Jan 2021 16:40:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 0/3] Acceptance tests for mpc8544ds & virtex-ml507 ppc machines
Date: Tue, 12 Jan 2021 17:40:42 +0100
Message-Id: <20210112164045.98565-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use the two new images from the QEMU advent calendar 2020 to test
the mpc8544ds & virtex-ml507 ppc machines.

Thomas Huth (3):
  tests/acceptance: Move the pseries test to a separate file
  tests/acceptance: Test the mpc8544ds machine
  tests/acceptance: Add a test for the virtex-ml507 ppc machine

 MAINTAINERS                            |  1 +
 tests/acceptance/boot_linux_console.py | 19 -------
 tests/acceptance/machine_ppc.py        | 69 ++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 19 deletions(-)
 create mode 100644 tests/acceptance/machine_ppc.py

-- 
2.27.0


