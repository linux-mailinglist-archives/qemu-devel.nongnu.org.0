Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28383D277F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bUM-0000nc-Qb
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bSd-0007qy-4r
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bSb-0008Jc-Ob
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626970929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzJTpW/pXuv1y5QLNX4/HpmJqJDZjqjL87rRjO+0C08=;
 b=XmPQiDyXxgsnfXI+G8hP08pjjpbHXOKoR8oiA00JporhkqN2S0ahVaQLP5L9V2/pQsSiWq
 m61kezCNX9aPeSQsVfxeRGhMsjYtbRV2jgDjfGI9xHMp+Q60jDUCtUpENBqUFduSnNjxF+
 T18CBnmMUiWll5v2PoZ3tcvS5hUHeao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-SUYpa9j8N2WM1ucsNQIk_g-1; Thu, 22 Jul 2021 12:22:08 -0400
X-MC-Unique: SUYpa9j8N2WM1ucsNQIk_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F0B8A00E8;
 Thu, 22 Jul 2021 16:20:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-245.ams2.redhat.com
 [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88B6460936;
 Thu, 22 Jul 2021 16:20:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/2] gitlab: misc tweaks to job execution rules
Date: Thu, 22 Jul 2021 17:20:33 +0100
Message-Id: <20210722162035.2765755-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 - Fixes a problem with acceptance jobs running when build jobs fail=0D
 - Fixes a problem with pages job publishing website from undesirable=0D
   branches.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  gitlab: only let pages be published from default branch=0D
  gitlab: don't run acceptance jobs if build jobs fail=0D
=0D
 .gitlab-ci.d/buildtest-template.yml |  4 ++--=0D
 .gitlab-ci.d/buildtest.yml          | 18 ++++++++++++++++++=0D
 2 files changed, 20 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


