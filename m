Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A47F5D9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 13:19:45 +0200 (CEST)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htVb6-0007xe-9g
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 07:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50237)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1htVa7-0007Jz-Lm
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1htVa6-0006RP-Gd
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:18:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1htVa6-0006Ql-BF
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:18:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2D6EC024906;
 Fri,  2 Aug 2019 11:18:40 +0000 (UTC)
Received: from localhost (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E595D9D3;
 Fri,  2 Aug 2019 11:18:36 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 15:18:32 +0400
Message-Id: <20190802111833.32187-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 02 Aug 2019 11:18:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Slirp cve 2019 14378 patches
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3bd6cbbb181b6ae60a1d1f33ccd325b45f71aa=
2a:

  Update version for v4.1.0-rc3 release (2019-07-30 22:02:05 +0100)

are available in the Git repository at:

  https://github.com/elmarco/qemu.git tags/slirp-CVE-2019-14378-pull-requ=
est

for you to fetch changes up to e1a4a24d262ba5ac74ea1795adb3ab1cd574c7fb:

  slirp: update with CVE-2019-14378 fix (2019-08-02 15:14:56 +0400)

----------------------------------------------------------------
Slirp CVE-2019-14378 pull request

----------------------------------------------------------------

Marc-Andr=C3=A9 Lureau (1):
  slirp: update with CVE-2019-14378 fix

 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.22.0.545.g9c9b961d7e


