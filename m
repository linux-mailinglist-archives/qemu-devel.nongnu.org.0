Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F7D1AAE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 23:17:36 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIJKw-0002By-SV
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 17:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw5-0007FE-1M
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw4-0003eF-0d
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHvz-0003cZ-Td; Wed, 09 Oct 2019 15:47:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D96677FDFC;
 Wed,  9 Oct 2019 19:47:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD63E1001DC2;
 Wed,  9 Oct 2019 19:47:41 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] iotests: trivial cleanups
Date: Wed,  9 Oct 2019 15:47:36 -0400
Message-Id: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 09 Oct 2019 19:47:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The most trivial set of cleanups to iotests common libraries and the
044 test.

Changes from v1:
 * Added emacs mode hints on tests/qemu-iotests/common.* files (Eric
   Blake)

Cleber Rosa (4):
  qemu-iotests: remove bash shebang from library files
  qemu-iotests: remove forceful execution success from library files
  qemu-iotests: 044: pass is actually a noop, so remove it
  qemu-iotests: 044: remove inaccurate docstring class description

 tests/qemu-iotests/044            | 4 ----
 tests/qemu-iotests/common.config  | 5 +----
 tests/qemu-iotests/common.filter  | 5 +----
 tests/qemu-iotests/common.nbd     | 3 +--
 tests/qemu-iotests/common.pattern | 2 +-
 tests/qemu-iotests/common.qemu    | 2 +-
 tests/qemu-iotests/common.rc      | 5 +----
 tests/qemu-iotests/common.tls     | 2 +-
 8 files changed, 7 insertions(+), 21 deletions(-)

--=20
2.21.0


