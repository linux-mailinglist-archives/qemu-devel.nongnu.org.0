Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767F2B7DD6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:51:04 +0100 (CET)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMvL-000745-Ap
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMtj-0005pN-32
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMth-0006Os-BH
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605703756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dPgDzYtRmVhRgFZwJYxwrXh67l8gQpy6YY83Hvz+Psw=;
 b=FtT8NvHoWiehtVhdJX7hLbA8HFpv9PJ/FHsreHVhSHfrgQJThs2xQpsOoQzv+mWoK8gJvd
 IA263YFWWf5atSsXQAKBxfjLXqQG/oE3fShlTNP95P71Lu2MxRGsosjwb4v4pZoCVVGWYc
 svoJn7dYYQQKK9sPU7OzYijYRpmk4Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-t-06Tmt-Nw6o-I6whYq2Hg-1; Wed, 18 Nov 2020 07:49:14 -0500
X-MC-Unique: t-06Tmt-Nw6o-I6whYq2Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8451D1882FB3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 12:49:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-41.ams2.redhat.com
 [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAF8C5D9CD;
 Wed, 18 Nov 2020 12:49:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Misc fixes patches
Date: Wed, 18 Nov 2020 12:49:07 +0000
Message-Id: <20201118124911.282735-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158=
:=0D
=0D
  Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request=0D
=0D
for you to fetch changes up to c2aa8a3d7e5ce57fa3df310c9b7ca48fcbf9d4ad:=0D
=0D
  authz-simple: Check that 'identity' property is set (2020-11-18 10:51:35 =
+0=3D=0D
000)=0D
=0D
----------------------------------------------------------------=0D
Misc error reporting and checking fixes to authorization objects=0D
=0D
----------------------------------------------------------------=0D
=0D
Kevin Wolf (2):=0D
  authz-pam: Check that 'service' property is set=0D
  authz-simple: Check that 'identity' property is set=0D
=0D
Markus Armbruster (2):=0D
  authz-list-file: Fix file read error handling=0D
  authz-list-file: Improve an error message=0D
=0D
 authz/listfile.c |  6 +++++-=0D
 authz/pamacct.c  |  6 ++++++=0D
 authz/simple.c   | 14 ++++++++++++++=0D
 3 files changed, 25 insertions(+), 1 deletion(-)=0D
=0D
--=3D20=0D
2.28.0=0D
=0D


