Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A062C2654EC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 00:18:09 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGUtM-00058y-MD
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 18:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUqr-0001JU-Cj
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26735
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUqp-0002Y0-9A
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599776130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V4vsIXEjGG4OY4JNOGkgQNU6DkZLO/4CR0c/L4Lyq8A=;
 b=XykcgjJHzKngiJc2Ma82yk9VLH1QJBgOjFjvH0vE/TjVtin6EAOZItjSBRBqGl2oGVWPsl
 bu+d7wdGxhRc/YfuChYjj8TUU7J7W6PIicBm/AGRmUOrae5bACUHffPMcZfQMJk7KX0/jP
 mVnhq/4dY4nokAmDos9k8HGxg7kNwRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-UOJf4_NYMcO4_JyGU4DyDg-1; Thu, 10 Sep 2020 18:15:28 -0400
X-MC-Unique: UOJf4_NYMcO4_JyGU4DyDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CAF80732B;
 Thu, 10 Sep 2020 22:15:27 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E392660BF1;
 Thu, 10 Sep 2020 22:15:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] docs: Convert QOM documentation to kernel-doc + Sphinx
Date: Thu, 10 Sep 2020 18:15:17 -0400
Message-Id: <20200910221526.10041-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 18:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This converts the existing gtk-doc markup in object.h (that=0D
probably was never rendered into an actual document) to=0D
kernel-doc + Sphinx syntax, and reference them at=0D
docs/devel/qom.rst.=0D
=0D
Eduardo Habkost (9):=0D
  qom: Document all function parameters in doc comments=0D
  qom: Use kernel-doc private/public tags in structs=0D
  qom: Use ``code`` Sphinx syntax where appropriate=0D
  qom: Add kernel-doc markup to introduction doc comment=0D
  qom: Reformat section titles using Sphinx syntax=0D
  qom: Indent existing code examples=0D
  qom: Add code block markup to all code blocks=0D
  docs: Create docs/devel/qom.rst=0D
  docs: Move object.h overview doc comment to qom.rst=0D
=0D
 docs/devel/index.rst |   1 +=0D
 docs/devel/qom.rst   | 378 ++++++++++++++++++++++++++++++=0D
 include/qom/object.h | 547 ++++++++-----------------------------------=0D
 3 files changed, 475 insertions(+), 451 deletions(-)=0D
 create mode 100644 docs/devel/qom.rst=0D
=0D
--=20=0D
2.26.2=0D
=0D


