Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF82A2B3E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:11:19 +0100 (CET)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZZcE-0005RP-U4
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZac-0004HZ-S0
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZab-0003Jr-7B
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604322576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=62Z5otvSY2jDhstcDaZWgQa/3DkqUPBW4+N3X48ruxk=;
 b=OAgfqhpwpyVSaJ0iJhqBXRPRQJ5GF3ceo98Et/Lx8XvW8RVy8xTJlxURZfexRTbRrXB0RJ
 OyZl2x57pAFxqGVKfCi8o11CGZUnh36dlbXNpaz6Humn1NUa6xVnW8M+jO6wrJ7L1nGNOS
 w6xk1oVjjr6WT2xJg55pCHfifrAF1wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-QksZQEUTMQWLTcdgHW8-Aw-1; Mon, 02 Nov 2020 08:09:34 -0500
X-MC-Unique: QksZQEUTMQWLTcdgHW8-Aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF7FF1800D41;
 Mon,  2 Nov 2020 13:09:33 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-114-136.ams2.redhat.com [10.36.114.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21011002C21;
 Mon,  2 Nov 2020 13:09:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Publish docs as GitLab Pages
Date: Mon,  2 Nov 2020 13:09:22 +0000
Message-Id: <20201102130926.161183-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This publishes the various docs as GitLab Pages, allowing users to=0D
browse the docs generated in CI before sending patch series to the=0D
mailing list. It also introduces a sidebar link to the original page=0D
source to show readers what file to modify if they want to contribute to=0D
the docs.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  gitlab: publish the docs built during CI=0D
  gitlab: force enable docs build in Fedora, Ubuntu, Debian=0D
  docs: show stdout/stderr when meson fails build test=0D
  docs: add "page source" link to sphinx documentation=0D
=0D
 .gitlab-ci.yml                        | 18 +++++++++++++++++-=0D
 docs/_templates/editpage.html         |  5 +++++=0D
 docs/conf.py                          |  1 +=0D
 docs/devel/_templates/editpage.html   |  5 +++++=0D
 docs/interop/_templates/editpage.html |  5 +++++=0D
 docs/meson.build                      |  7 ++++---=0D
 docs/specs/_templates/editpage.html   |  5 +++++=0D
 docs/system/_templates/editpage.html  |  5 +++++=0D
 docs/tools/_templates/editpage.html   |  5 +++++=0D
 docs/user/_templates/editpage.html    |  5 +++++=0D
 10 files changed, 57 insertions(+), 4 deletions(-)=0D
 create mode 100644 docs/_templates/editpage.html=0D
 create mode 100644 docs/devel/_templates/editpage.html=0D
 create mode 100644 docs/interop/_templates/editpage.html=0D
 create mode 100644 docs/specs/_templates/editpage.html=0D
 create mode 100644 docs/system/_templates/editpage.html=0D
 create mode 100644 docs/tools/_templates/editpage.html=0D
 create mode 100644 docs/user/_templates/editpage.html=0D
=0D
--=20=0D
2.28.0=0D
=0D


