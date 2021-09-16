Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96240ED32
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:14:06 +0200 (CEST)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzdt-0000vB-C7
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQzXi-00029Q-47
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQzXa-0005O3-MA
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631830052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LT7Cn00TR+IlRT++yQDBpO6/cY4P5IHD+lsFFoRjZxg=;
 b=FjUp1e6qFZjvqzo3bKwvVeCnG6DbT22uQX0/fNuZl1FiZ3H6y3Hey2VRLClojAQTLbYUk2
 70X86o+C6ztOgaFIuL5l8P5Q+TYAp3tcScy5UiceAr8REo0hCMarEn8NszuBm+CZuuRSNw
 aRHCviE1LeWTDZhDydLWqljS+x0w5ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-o-k0QaQXO7S4xVARfpcQog-1; Thu, 16 Sep 2021 18:07:31 -0400
X-MC-Unique: o-k0QaQXO7S4xVARfpcQog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F74F362FD;
 Thu, 16 Sep 2021 22:07:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34D455D9C6;
 Thu, 16 Sep 2021 22:07:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Python patches
Date: Thu, 16 Sep 2021 18:07:14 -0400
Message-Id: <20210916220716.1353698-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529=
:=0D
=0D
  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' i=
nto staging (2021-09-14 18:14:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to eb8033f658e8b6f23ba9f4ef4a1b55894f7ea486:=0D
=0D
  python: pylint 2.11 support (2021-09-16 15:04:04 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python Pull request=0D
=0D
This fixes the check-python-tox job.=0D
=0D
CI including optional jobs is all green:=0D
https://gitlab.com/jsnow/qemu/-/pipelines/372151147=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (2):=0D
  python: Update for pylint 2.10=0D
  python: pylint 2.11 support=0D
=0D
 python/qemu/machine/machine.py | 7 ++++++-=0D
 python/setup.cfg               | 3 ++-=0D
 2 files changed, 8 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


