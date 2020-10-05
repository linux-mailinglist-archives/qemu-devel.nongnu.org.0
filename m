Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4EE2841B1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:54:45 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPXVM-00034Z-7n
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXTK-0001Uq-Cf
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 16:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXTI-0005pH-Ay
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 16:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601931154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dot6P37PxoTmgZTJ7G7tqku4LzWsKUy9rRcBtdXcADw=;
 b=aJmijmEb4of7BO0xPLrPr42pA2eXv2l7ZsdFOdk4weC5FXfN7MwF/BHPY3jI6fXQ1NRjwu
 JA+D8muh8juLcB+2mWdWJuknqnOO8Qfx8yPiCxFKk6luzAZlpNwHk2DSLp0o9yc4GJQiSN
 icgd1yBMsLis15fRZ25z+rz/rpHqdpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-g5AXRIj8O5mmlu_GpEFXwg-1; Mon, 05 Oct 2020 16:52:30 -0400
X-MC-Unique: g5AXRIj8O5mmlu_GpEFXwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320C018A072C
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 20:52:29 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E483F18E3C;
 Mon,  5 Oct 2020 20:52:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] docs: Include QTest protocol and libqtest API on
 documentation
Date: Mon,  5 Oct 2020 16:52:25 -0400
Message-Id: <20201005205228.697463-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This moves the QTest section of testing.rst to a separate=0D
document, and include the QTest Protocol specification and=0D
libqtest API reference in the document.=0D
=0D
Eduardo Habkost (3):=0D
  docs: Move QTest documentation to its own document=0D
  docs/devel/qtest: Include protocol spec in document=0D
  docs/devel/qtest: Include libqtest API reference=0D
=0D
 docs/devel/index.rst          |  1 +=0D
 docs/devel/qtest.rst          | 72 ++++++++++++++++++++++++++++++++++=0D
 docs/devel/testing.rst        | 47 +---------------------=0D
 tests/qtest/libqos/libqtest.h | 20 +++++-----=0D
 softmmu/qtest.c               | 73 +++++++++++++++++++++++++++++++----=0D
 5 files changed, 150 insertions(+), 63 deletions(-)=0D
 create mode 100644 docs/devel/qtest.rst=0D
=0D
--=20=0D
2.26.2=0D
=0D


