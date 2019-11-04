Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638DEE390
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 16:21:11 +0100 (CET)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iReAI-0002CE-GM
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 10:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iRe3M-0002pe-2J
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:14:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iRe3K-0002ju-Q8
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58357
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iRe3K-0002jg-M4
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572880438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhvQYdqSVxC8PNSualrUpwUPMTwWhSaMc4yvowmz3iI=;
 b=Nn7kPJOhJi11OmrhJz8JspsSzCP0dqjMb0UHqCz4k4y+RPPMw/QQQ3gL4r0QB+65kyktbb
 dbYkAOUqXEOvNDMMwB+1hDrYCnRrMu+a6LcM1PUoy+8EbTweRa29QxZAHUbu0WGo8YA7ik
 j967uZLrNohnLE/jEjC9qhdAN4d1tbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-fzc0QGGeOiyvNTWHtLurEA-1; Mon, 04 Nov 2019 10:13:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C72B31800D53;
 Mon,  4 Nov 2019 15:13:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DA35D6C8;
 Mon,  4 Nov 2019 15:13:51 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/8] Acceptance tests: add the build directory to the
 system PATH
Date: Mon,  4 Nov 2019 10:13:21 -0500
Message-Id: <20191104151323.9883-7-crosa@redhat.com>
In-Reply-To: <20191104151323.9883-1-crosa@redhat.com>
References: <20191104151323.9883-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: fzc0QGGeOiyvNTWHtLurEA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Beraldo Leal <bleal@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So that when binaries such as qemu-img are searched for, those in the
build tree will be favored.  As a clarification, SRC_ROOT_DIR is
dependent on the location from where tests are executed, so they are
equal to the build directory if one is being used.

The original motivation is that Avocado libraries such as
avocado.utils.vmimage.get() may use the matching binaries, but it may
also apply to any other binary that test code may eventually attempt
to execute.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index 17ce583c87..a4bb796a47 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -110,6 +110,12 @@ class Test(avocado.Test):
         return None
=20
     def setUp(self):
+        # Some utility code uses binaries from the system's PATH.  For
+        # instance, avocado.utils.vmimage.get() uses qemu-img, to
+        # create a snapshot image.  This is a transparent way of
+        # making sure those utilities find and use binaries on the
+        # build tree by default.
+        os.environ['PATH'] =3D '%s:%s' % (SRC_ROOT_DIR, os.environ['PATH']=
)
         self._vms =3D {}
=20
         self.arch =3D self.params.get('arch',
--=20
2.21.0


