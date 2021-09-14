Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE240B72C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 20:49:56 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDVD-00068G-As
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 14:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mQDUD-0005Sg-JE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mQDU5-00044k-UT
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631645323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RKO9cLJCaeXPVazhHLczGrmr2SLFxc8uraLxx8yA0Ns=;
 b=Y9sWaYl8j25B1gFk8XJlVz+/mHP5T1usr62VESPG72dvNUBCvQ2lGrX8aQid+2IWMEh3/r
 baZmRdHn6O+w3jvoFBWFMeYpSu5+/pdn5i9H2ILXnuVCyffu4YnEwh6EJ3YE5EUmeZPgP7
 ZEGIn3jDoukOxzM23zhH4tpLZb5lNsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-G9u15v6cMdyvoDWC3k4NIg-1; Tue, 14 Sep 2021 14:48:42 -0400
X-MC-Unique: G9u15v6cMdyvoDWC3k4NIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51F6E1B18BC6;
 Tue, 14 Sep 2021 18:48:41 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.17.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04ACE81F65;
 Tue, 14 Sep 2021 18:48:31 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] docs/deve/ci-plan: define a high-level plan for the QEMU
 GitLab CI
Date: Tue, 14 Sep 2021 15:48:29 -0300
Message-Id: <20210914184830.84454-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a high-level plan for the QEMU GitLab CI based on use cases.=0D
The idea is to have a base for evolving the QEMU CI. It sets high-level=0D
characteristics for the QEMU CI use cases, which helps guide its=0D
development.=0D
=0D
There is an opportunity to discuss the high-level QEMU CI plan and some of=
=0D
the implementation details during the KVM Forum.=0D
=0D
Willian Rampazzo (1):=0D
  docs/deve/ci-plan: define a high-level plan for the QEMU GitLab CI=0D
=0D
 docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++++++=0D
 docs/devel/ci.rst      |  1 +=0D
 2 files changed, 78 insertions(+)=0D
 create mode 100644 docs/devel/ci-plan.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


