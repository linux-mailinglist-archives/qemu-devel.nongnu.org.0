Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4940C5CB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:59:22 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUVV-0004ez-RO
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQURT-00012T-OY
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQURQ-0007xx-6Y
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631710507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+I+CYpeAOQzFosC8umMt3zVQPWoCcn8o4RJlp/gFlRw=;
 b=OgRksOOJoqNm+TCKS15k1if/41IdJt+tfjpuXG2s8HA62hLchIwlczNXcMW4IfoD5Qv6Be
 eTtgNV6xoeFUUd60crAS4/FZpZn2y2Bcyghu12punVya95TFhYujsNbV8RE8sMNqZuQECL
 FoiB0fcTNbyB48ezImL/ocaDRlQvnl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-ZQDw3UR0OoGr7t0b-BN1iQ-1; Wed, 15 Sep 2021 08:55:06 -0400
X-MC-Unique: ZQDw3UR0OoGr7t0b-BN1iQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFCC41084683;
 Wed, 15 Sep 2021 12:55:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C20D460C82;
 Wed, 15 Sep 2021 12:54:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab: some minor CI tweaks
Date: Wed, 15 Sep 2021 13:54:50 +0100
Message-Id: <20210915125452.1704899-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Addressing a few issues raised by Peter on IRC yesterday=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  gitlab: skip the check-patch job on the upstream repo=0D
  gitlab: fix passing of TEST_TARGETS env to cirrus=0D
=0D
 .gitlab-ci.d/cirrus.yml        | 2 +-=0D
 .gitlab-ci.d/cirrus/build.yml  | 1 +=0D
 .gitlab-ci.d/static_checks.yml | 2 +-=0D
 3 files changed, 3 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


