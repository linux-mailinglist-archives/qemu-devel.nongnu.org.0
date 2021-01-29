Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A0308B5E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:27:21 +0100 (CET)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XYG-0001Xr-Qe
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIo-0003F8-13
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XIi-0006qF-9F
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Ag+Ojke1VZ7peEiJLfN4zopmW9YFDJ/HcmSeyh2OQg=;
 b=CjLPxmN7qDAbyVrb7NFruK4LqrAFtXyPFOgeuaSH89P0QahSEh5MMUXpqP3ZvLWZDV5P+K
 qWrw1gkNFYMYVZR0Iq7WvfAFl9cL/nMTl/DPFcl0t1O+dqUCjrMtdtci6XJx1VcfNGPBPT
 Q5seok95kpraAYJz2jhQmKjt8fKE7tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-Pc1VZFoEPHKO0j2spnuHvg-1; Fri, 29 Jan 2021 12:11:12 -0500
X-MC-Unique: Pc1VZFoEPHKO0j2spnuHvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D14803F42;
 Fri, 29 Jan 2021 17:11:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8535D705;
 Fri, 29 Jan 2021 17:11:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Misc patches
Date: Fri, 29 Jan 2021 17:10:49 +0000
Message-Id: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0=
-p=3D=0D
ull-request' into staging (2021-01-29 10:10:43 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request=0D
=0D
for you to fetch changes up to ecb98f5c7589ba8ecd15c8b1baa2ec7192e47c75:=0D
=0D
  tests: Replace deprecated ASN1 code (2021-01-29 17:07:53 +0000)=0D
=0D
----------------------------------------------------------------=0D
* Replace --enable/disable-git-update with --with-git-submodules=0D
  to allow improved control over use of git submodules=0D
* Deprecate the -enable-fips option=0D
* Ensure docs use prefer format for bool options=0D
* Clarify platform support rules=0D
* Misc fixes to keymap conversions=0D
* Fix misc problems on macOS=0D
=0D
----------------------------------------------------------------=0D
=0D
Dan Streetman (1):=0D
  configure: replace --enable/disable-git-update with=0D
    --with-git-submodules=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (5):=0D
  os: deprecate the -enable-fips option and QEMU's FIPS enforcement=0D
  Prefer 'on' | 'off' over 'yes' | 'no' for bool options=0D
  docs: simplify and clarify the platform support rules=0D
  docs: fix missing backslash in certtool shell example=0D
  ui: update keycodemapdb submodule commit=0D
=0D
Kevin Wolf (3):=0D
  crypto: Move USER_CREATABLE to secret_common base class=0D
  crypto: Forbid broken unloading of secrets=0D
  crypto: Fix memory leaks in set_loaded for tls-*=0D
=0D
Stefan Weil (2):=0D
  tests: Fix runtime error in test-authz-pam=0D
  tests: Replace deprecated ASN1 code=0D
=0D
shiliyang (2):=0D
  crypto: Fix some code style problems, add spaces around operator=0D
  crypto: Add spaces around operator=0D
=0D
 Makefile                        | 24 ++-----------=0D
 configure                       | 51 +++++++++++++++++++-------=0D
 crypto/aes.c                    |  6 ++--=0D
 crypto/desrfb.c                 |  4 +--=0D
 crypto/secret.c                 | 14 --------=0D
 crypto/secret_common.c          | 21 +++++++++--=0D
 crypto/secret_keyring.c         | 14 --------=0D
 crypto/tlscredsanon.c           |  3 +-=0D
 crypto/tlscredspsk.c            |  3 +-=0D
 crypto/tlscredsx509.c           |  5 ++-=0D
 docs/system/build-platforms.rst | 63 ++++++++++++---------------------=0D
 docs/system/deprecated.rst      | 12 +++++++=0D
 docs/system/tls.rst             |  2 +-=0D
 docs/system/vnc-security.rst    | 10 +++---=0D
 include/authz/listfile.h        |  2 +-=0D
 os-posix.c                      |  3 ++=0D
 qemu-options.hx                 |  4 +--=0D
 scripts/git-submodule.sh        | 34 +++++++++++++-----=0D
 tests/crypto-tls-x509-helpers.c | 10 +++---=0D
 tests/crypto-tls-x509-helpers.h |  2 +-=0D
 tests/pkix_asn1_tab.c           |  2 +-=0D
 tests/qemu-iotests/233          |  4 +--=0D
 tests/test-authz-pam.c          | 10 +++++-=0D
 ui/keycodemapdb                 |  2 +-=0D
 ui/meson.build                  |  3 +-=0D
 25 files changed, 161 insertions(+), 147 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


