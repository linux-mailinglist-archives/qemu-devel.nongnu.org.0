Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E1325A22
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:23:14 +0100 (CET)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPyS-0006bs-SY
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFPwu-0005oR-W5
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFPws-00069v-KB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614295294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NvC5EMXTHdw6brRAdSX65XaEvrahPPj5i/BywLEhK8c=;
 b=AnccKrIfpr7xEjo5U7CfKIVgS+WsQ8mnsdfCJb5qS2cepQMXTzm40IKU7jnKTw6vssQngB
 I5jOzhjQ924J+Lg4JABHDOdgDojQ+1dNZjrzbSABTsKjOpdylgCiwZkDNOnIuq+etJCnjR
 gOKbsZa6eaOHplsLDCmvOJqhhCCeG5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-NLVotVsINxKsuOqkkvH9gg-1; Thu, 25 Feb 2021 18:21:30 -0500
X-MC-Unique: NLVotVsINxKsuOqkkvH9gg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E8B1936B61;
 Thu, 25 Feb 2021 23:21:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C377D61F38;
 Thu, 25 Feb 2021 23:21:23 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Acceptance Tests: restore the use of target related
 information
Date: Thu, 25 Feb 2021 18:21:20 -0500
Message-Id: <20210225232122.1254879-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This addresses two issues, restoring them to their previous behavior:=0D
=0D
The first one, reported by Thomas Huth, a test timeout (and thus a job=0D
failed) on CI.  The test was interrupted because of a download=0D
timeout.  The download timeout happened due to the fact that "make=0D
get-vm-images" is currently broken and the images matching the QEMU=0D
targets are not being downloaded before the Avocado job.=0D
=0D
The second one is the use of the same target related information, but=0D
to filter out tests that don't have a matching "arch" tag.  So, if one=0D
is not building, say "aarch64-softmmu", tests tagged with "arch:=0D
aarch64" won't even make into the Avocado job.=0D
=0D
For review purposes, the following job that shows the download of=0D
ppc64le, s390x and x86_64 (but not aarch64) Fedora 31 images on a=0D
acceptance-system-centos job:=0D
=0D
   https://gitlab.com/cleber.gnu/qemu/-/jobs/1057043012#L63=0D
=0D
And the following shows the download of the aarch64 Fedora 31 image=0D
(but not any other) on a acceptance-system-ubuntu job:=0D
=0D
   https://gitlab.com/cleber.gnu/qemu/-/jobs/1057043005#L61=0D
=0D
Cleber Rosa (2):=0D
  Acceptance Tests: restore downloading of VM images=0D
  Acceptance Tests: restore filtering of tests by target arch=0D
=0D
 tests/Makefile.include | 5 +++--=0D
 1 file changed, 3 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D


