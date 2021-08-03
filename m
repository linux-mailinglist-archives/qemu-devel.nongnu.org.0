Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41E3DF5C6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:36:30 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0DF-00071W-M8
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0Bx-00053x-4F
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mB0Bt-0002Ow-EY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628019303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+lOY59eSX1oV0T1F9wZohauot0DMMhxnX1Uf7IRcoEA=;
 b=f0Qg6/nHAWUMosyUHCssPdVV7tx9LmF++Lm/7JErqo8x9AfOhVXcmcdEB8Pk0lrpyfLw6F
 EQhmkOGJSDbzNsG4ghY6se8ebJfO2FAEHwnHZwAiAqmC6wtUmw0JvpnrzAQlFz+242dsm5
 2bdn7CgDlgRor2YWz56trYY6xPQW1U0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-_ccFfwmyMHKvUHNMFx6Vpw-1; Tue, 03 Aug 2021 15:35:01 -0400
X-MC-Unique: _ccFfwmyMHKvUHNMFx6Vpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A27107465F;
 Tue,  3 Aug 2021 19:35:00 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.8.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B72351981F;
 Tue,  3 Aug 2021 19:34:52 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] Acceptance Tests: clean up of temporary dirs and
 MAINTAINERS entry
Date: Tue,  3 Aug 2021 15:34:45 -0400
Message-Id: <20210803193447.3946219-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a reply to an issue[1] reported by Peter, and while at it, an=0D
update of the MAINTAINERS entry so other people now the status and=0D
where to go for help with regards to the acceptance tests'=0D
infrastructure.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00349.html=0D
=0D
Cleber Rosa (2):=0D
  Acceptance Tests: add standard clean up at test tearDown()=0D
  Acceptance Tests: updates to the MAINTAINERS file=0D
=0D
 MAINTAINERS                               | 6 +++---=0D
 tests/acceptance/avocado_qemu/__init__.py | 1 +=0D
 2 files changed, 4 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


