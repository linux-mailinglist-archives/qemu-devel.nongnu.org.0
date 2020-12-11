Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CC2D7E05
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:25:19 +0100 (CET)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn6S-00027g-Oj
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knmGl-0000cy-Jy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knmGj-000298-MD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Po9cfEgYhy70qxsOkZwb0iukEqhZP3L4NSPsyG2AbLk=;
 b=AF5ZXV69PTWlXyM2blgv6UZT7OibwD5lR3Np5LfWKsup7ZgC/bbCVkZCW76KiXSvJOTZp4
 wx1bC4ZV3K8WZzLek+KRpqQ3zrIT4NNptC8GXdVwx04UQvOUjOxNczOEOZ54oDJxMwPKEq
 EQwwUtZgUgFUiEknJFLZkhNGXZxBWb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-a5hwjMvWN7ONig6CO4BBaw-1; Fri, 11 Dec 2020 12:31:46 -0500
X-MC-Unique: a5hwjMvWN7ONig6CO4BBaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83493107ACF5;
 Fri, 11 Dec 2020 17:31:45 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DC5610013C0;
 Fri, 11 Dec 2020 17:31:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on s390x
Date: Fri, 11 Dec 2020 18:31:31 +0100
Message-Id: <20201211173134.376078-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two more simple tests to check that virtio-rng and virtio-balloon
are at least (very) basically working on s390x.

Based-on: 20201204121450.120730-1-cohuck@redhat.com

Thomas Huth (3):
  tests/acceptance: Extract the code to clear dmesg and wait for CRW
    reports
  tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng via
    /dev/hwrng
  tests/acceptance/machine_s390_ccw_virtio: Test the virtio-balloon
    device

 tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
 1 file changed, 43 insertions(+), 16 deletions(-)

-- 
2.27.0


