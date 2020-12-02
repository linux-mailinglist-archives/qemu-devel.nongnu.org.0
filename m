Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0B2CC93D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 22:59:42 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkaA1-0002mu-7S
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 16:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kka8P-0001mY-8Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 16:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kka8M-0002iQ-QF
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 16:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606946276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=twUETrba9uJRgT/VQ7GeyVz6dQhDgtC5JKyLadd7PP0=;
 b=VxRcLBxlMDNDwqqhJKepWjSAc2EZjH0QlBeuvaRjv1LOAyCS/CAmykVrKGUlF6J+N0kAVI
 ZJ8io41Ow29wPEpDrjAnfwlSnahuubA2TUCTdW9NmxG6SKQjc18TMV45cuaiSZ/1PonzPg
 z2R/wyatrXP4WNgLU/QJTkWe22V/dy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-pIQdZRB0MXqrKDOMqyY-fg-1; Wed, 02 Dec 2020 16:57:54 -0500
X-MC-Unique: pIQdZRB0MXqrKDOMqyY-fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B558049C8;
 Wed,  2 Dec 2020 21:57:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A50D85C1B4;
 Wed,  2 Dec 2020 21:57:48 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-5.2? 0/1] Acceptance tests: bump Fedora to 32
Date: Wed,  2 Dec 2020 16:57:46 -0500
Message-Id: <20201202215747.2719507-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I believe this may be a candidate for "right now" because the code=0D
changes here simply sync with external infrastructure changes, that=0D
is, the retirement of Fedora 31 from the official repository=0D
locations).=0D
=0D
The following jobs contain a validation of this bump:=0D
=0D
 - https://gitlab.com/cleber.gnu/qemu/-/jobs/886864642#L72=0D
 - https://gitlab.com/cleber.gnu/qemu/-/jobs/886864633#L72=0D
=0D
Thanks,=0D
- Cleber.=0D
=0D
Cleber Rosa (1):=0D
  Acceptance tests: bump Fedora to 32=0D
=0D
 tests/acceptance/boot_linux.py | 12 ++++++------=0D
 1 file changed, 6 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D


