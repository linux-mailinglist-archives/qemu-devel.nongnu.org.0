Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68538B8AB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 23:02:45 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljpoZ-0007Iq-Vo
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 17:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljpkL-0005FE-P9
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljpkG-0007su-JC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621544294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8pl9fQCIkdoKEG+Dsvn1VnGlvicvr191DURq+vLCTY=;
 b=TDWoDuwfaPkdSfR71NhhDSB1MebGD5eWCEg1xd7OyblHGpegFz3yYJZlvi2No3rgmnfAAH
 8UzKlG1rUqFU7BvqYUfpt7ec+kYs+lXi/G6xS0wPrNBhgfye6gAL/J64FRfBXw7ICGgnii
 nIGSYzpd7+ZlGMYigWWWsmqBiuNf73E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Qn-tU74ONAWNcBx985ueEA-1; Thu, 20 May 2021 16:58:12 -0400
X-MC-Unique: Qn-tU74ONAWNcBx985ueEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A32FB189C440;
 Thu, 20 May 2021 20:58:11 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-104.rdu2.redhat.com
 [10.10.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 712C15D74D;
 Thu, 20 May 2021 20:58:06 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] acceptance tests: bump Avocado version to 88.1
Date: Thu, 20 May 2021 17:58:03 -0300
Message-Id: <20210520205804.211730-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401=
=0D
=0D
Besides some internal changes, new features, and bug fixes, on the QEMU sid=
e,=0D
this version fixes the following message seen when running the acceptance=
=0D
tests: "Error running method "pre_tests" of plugin "fetchasset": 'bytes'=0D
object has no attribute 'encode'".=0D
=0D
The release notes are available at=0D
https://avocado-framework.readthedocs.io/en/latest/releases/88_0.html.=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (1):=0D
  acceptance tests: bump Avocado version to 88.1=0D
=0D
 tests/requirements.txt | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


