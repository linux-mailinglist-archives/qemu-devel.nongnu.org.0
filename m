Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C230866AD2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 12:19:14 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlse1-0001oA-G6
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 06:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hlsdk-0001FP-GA
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hlsdi-0001OC-Mp
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hlsdi-0001Ne-HI
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:18:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 779C13688B;
 Fri, 12 Jul 2019 10:18:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89BEA60BFB;
 Fri, 12 Jul 2019 10:18:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 11:18:47 +0100
Message-Id: <20190712101849.8993-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 12 Jul 2019 10:18:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 0/2] Compatibility fixes for nettle 2.7
 vs 3.0 vs 3.5
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Amol Surati <suratiamol@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This short series fixes a few compatibility issues around different
nettle versions.

Daniel P. Berrang=C3=A9 (2):
  crypto: switch to modern nettle AES APIs
  crypto: fix function signatures for nettle 2.7 vs 3

 crypto/cipher-nettle.c | 218 ++++++++++++++++++++++++++++++++++-------
 crypto/hash-nettle.c   |  12 ++-
 crypto/hmac-nettle.c   |  17 +++-
 3 files changed, 205 insertions(+), 42 deletions(-)

--=20
2.21.0


