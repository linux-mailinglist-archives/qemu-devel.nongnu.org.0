Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88D35FDAB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 00:18:19 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWnpy-0007CG-Pa
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 18:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWnn9-0005Jh-0U
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWnmz-00077L-NY
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 18:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618438511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5i4wpIkpUHMRPW5O06b5z/Ud/TfUhdmTAya9zGys4k0=;
 b=Km3iYGPGrL/v4avY18hfu/buy8+JhGybhErMzj/KOaZDrGDt8Fo3rRyxkTWkSX4D8GEXkv
 rYwXQ+gyH8R5IPWysjVeAz5YHQYuym75KS8VIQMO1PjdbfDeDv8dShsLGxa+vqA3eIYMMB
 9f3pHpboMktSqDhgemB4Zj+vtaP5ZrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-QCbS6SZKP3OISQvrrJ_5cg-1; Wed, 14 Apr 2021 18:15:08 -0400
X-MC-Unique: QCbS6SZKP3OISQvrrJ_5cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CF5E1854E25;
 Wed, 14 Apr 2021 22:15:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01B9B19D9B;
 Wed, 14 Apr 2021 22:14:58 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Acceptance Tests: support choosing specific distro and
 version
Date: Wed, 14 Apr 2021 18:14:54 -0400
Message-Id: <20210414221457.1653745-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because Fedora 31 will not suit all tests that depend on a Linux=0D
guest, this allows for the configuration of the guest distribution.=0D
It came out of a suggestion from Eric Auger, and it was actually a=0D
feature I planned to submit for a while.=0D
=0D
This is based on the following series:=0D
=0D
 [PATCH v3 00/11] Acceptance Test: introduce base class for Linux based tes=
ts=0D
=0D
A GitLab CI pipeline can be seen here:=0D
=0D
 https://gitlab.com/cleber.gnu/qemu/-/pipelines=0D
=0D
Note: I'll address the line length caught in the check-patch job as=0D
soon as I find what was the outcome of the line limits for Python=0D
code discussion.=0D
=0D
Based-On: <20210412044644.55083-1-crosa@redhat.com>=0D
=0D
Cleber Rosa (3):=0D
  Acceptance Tests: rename attribute holding the distro image checksum=0D
  Acceptance Tests: move definition of distro checksums to the framework=0D
  Acceptance Tests: support choosing specific distro and version=0D
=0D
 docs/devel/testing.rst                    | 65 ++++++++++++++++++++++=0D
 tests/acceptance/avocado_qemu/__init__.py | 67 +++++++++++++++++++++--=0D
 tests/acceptance/boot_linux.py            |  8 ---=0D
 3 files changed, 127 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D


