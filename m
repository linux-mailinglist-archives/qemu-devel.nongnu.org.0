Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2910DFA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 22:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLvoy-00052T-8I
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 16:27:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvn0-0003eo-NN
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvmz-00018U-Pd
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hLvmx-000169-IL; Wed, 01 May 2019 16:25:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EA7F308427D;
	Wed,  1 May 2019 20:25:10 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-238.bos.redhat.com [10.18.17.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A8067C62E;
	Wed,  1 May 2019 20:25:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 16:25:04 -0400
Message-Id: <20190501202506.13875-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 01 May 2019 20:25:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Bitmaps patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
	qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 46316f1dfffc6be72e94e89f7b0e9162e7dcdc=
f1:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-updates-201903=
11.0' into staging (2019-03-12 13:37:29 +0000)

are available in the Git repository at:

  https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request

for you to fetch changes up to 90edef80a0852cf8a3d2668898ee40e8970e4314:

  docs/interop/bitmaps: rewrite and modernize doc (2019-05-01 16:21:24 -0=
400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

John Snow (2):
  Makefile: add nit-picky mode to sphinx-build
  docs/interop/bitmaps: rewrite and modernize doc

 docs/interop/bitmaps.rst | 1599 ++++++++++++++++++++++++++++++--------
 Makefile                 |    2 +-
 2 files changed, 1265 insertions(+), 336 deletions(-)

--=20
2.20.1


