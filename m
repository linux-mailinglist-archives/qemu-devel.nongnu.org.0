Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5055154DEE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:28:42 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izohV-0006bM-N1
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoZu-000805-Qk
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoZs-0002em-6Y
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39199
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoZr-0002an-T3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTU/TN2tPF0Zrj1zZlxmmsrwvGCjrj7GmWW/wKSkxOk=;
 b=HX/ZaV4EqLbwjF6RXV3JyZBgV05woMQQGBaqmy6nIn7ryhrFWTVjrI3G4wYOQMs+7saovv
 RNQvqgy+9q8IkexxGMbZw1cOqLAn6lWx5wi5mTAL/z01w/GDChdG+GVsk7sgi36AR9WE0M
 7kE/CHjViKEH66zhfhG6vmWhWKR+I2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-HclyfWTQOmWtywF2wJIdNg-1; Thu, 06 Feb 2020 16:20:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D533D2F61;
 Thu,  6 Feb 2020 21:20:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DA760BEC;
 Thu,  6 Feb 2020 21:20:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/46] travis.yml: install rpm2cpio for acceptance tests
Date: Thu,  6 Feb 2020 22:19:02 +0100
Message-Id: <20200206211936.17098-13-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: HclyfWTQOmWtywF2wJIdNg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liam Merwick <liam.merwick@oracle.com>

The extract_from_rpm() method added for the PVH acceptance tests needs
rpm2cpio to extract a vmlinux binary from an RPM.

Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <1580914565-19675-4-git-send-email-liam.merwick@oracle.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 6c0ec6cf69..54e1d12762 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -323,6 +323,7 @@ matrix:
             - python3-pil
             - python3-pip
             - python3.5-venv
+            - rpm2cpio
             - tesseract-ocr
             - tesseract-ocr-eng
=20
--=20
2.21.1


