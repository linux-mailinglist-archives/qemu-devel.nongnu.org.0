Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAFA1567
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 12:07:23 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3HKs-0006rk-Av
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 06:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3HJA-0005SU-SG
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3HJ9-0008Q5-Q4
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 06:05:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42852)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i3HJ6-0008KW-7V; Thu, 29 Aug 2019 06:05:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 328C310C6973;
 Thu, 29 Aug 2019 10:05:31 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 182A95D6B2;
 Thu, 29 Aug 2019 10:05:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 12:05:19 +0200
Message-Id: <20190829100521.12143-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 29 Aug 2019 10:05:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] git.orderfile: Order Python/shell scripts
 before unordered files
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series update the git.orderfile to order Python and shell
scripts before unordered files.
This is particularly useful for changes in tests/qemu-iotests.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (2):
  scripts/git.orderfile: Order Python files before unordered ones
  scripts/git.orderfile: Order shell scripts before unordered files

 scripts/git.orderfile | 5 +++++
 1 file changed, 5 insertions(+)

--=20
2.20.1


