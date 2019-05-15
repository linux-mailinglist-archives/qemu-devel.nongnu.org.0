Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CE1F63D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 16:12:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQudU-0008S0-6a
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 10:12:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hQubz-0007sk-Hq
	for qemu-devel@nongnu.org; Wed, 15 May 2019 10:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hQubx-0007Fb-MJ
	for qemu-devel@nongnu.org; Wed, 15 May 2019 10:10:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39078)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hQubs-00078F-P9
	for qemu-devel@nongnu.org; Wed, 15 May 2019 10:10:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55575C04FFF2;
	Wed, 15 May 2019 14:10:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-65.ams2.redhat.com
	[10.36.112.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD2695D706;
	Wed, 15 May 2019 14:10:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 15:10:09 +0100
Message-Id: <20190515141011.5315-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 15 May 2019 14:10:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] x86/cpu: add "md-clear" feature for MDS
 security flaws
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series provides the new "md-clear" feature that is used
for mitigation with CVE-2018-12126, CVE-2018-12127, CVE-2018-12130,
CVE-2019-11091.

Assuming you have the updated microcode and kernel to support the
md-clear feature, then using "-cpu host" will expose the new
feature to guests. For named CPU models, it must be explicitly
added eg "-cpu Haswell,+md-clear"

The first patch from Paolo is what most distros will already be
shipping with their security updates for this issue.

Daniel P. Berrang=C3=A9 (1):
  docs: recommend use of md-clear feature on all Intel CPUs

Paolo Bonzini (1):
  target/i386: define md-clear bit

 docs/qemu-cpu-models.texi | 12 ++++++++++++
 target/i386/cpu.c         |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

--=20
2.21.0


