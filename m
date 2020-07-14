Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AA21EB8E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 10:39:54 +0200 (CEST)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvGTh-0006hn-Me
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 04:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jvGSk-0006BL-Fh
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:38:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36235
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jvGSi-0002HV-OB
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594715932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VvQ+f2p8tE4FBb7zZ3lI+zg1gLDFXAiog0sETYTjn2E=;
 b=Qi6omTjT+lx50KJdQVYQiGM4qAn4tVwrHr+bEmRawvoqgopVn5yj64zbEoIgQpjJI7OSwT
 +e4pESHRk3X34RMYb2kzEwDnZiO/sl0h/WqDZgnvd+vjU7vqQDF8JRkTmXi1Aii7McUHXM
 /IRTXH86G/mvAHXNXjrqA5RGhiCHzyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-w-fucwBPM9CIefC7tdWlHw-1; Tue, 14 Jul 2020 04:38:47 -0400
X-MC-Unique: w-fucwBPM9CIefC7tdWlHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D69D106B247;
 Tue, 14 Jul 2020 08:38:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.33.36.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BBD876206;
 Tue, 14 Jul 2020 08:38:34 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 0/1] MAINTAINERS: add security quotient field
Date: Tue, 14 Jul 2020 14:06:30 +0530
Message-Id: <20200714083631.888605-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:06:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

QEMU supports numerous virtualisation and emulation use cases.
It offers many features to support guest's function(s).

All of these use cases and features are not always security relevant.
Because some maybe used in trusted environments only. Some may still
be in experimental stage. While other could be very old and not
used or maintained actively.

Recently we received multiple security issue reports against VVFAT
and VirtFS host directory sharing system. After discussing with the
respective maintainers, it turned out that

* VVFAT -> https://bugs.launchpad.net/qemu/+bug/1883083
  VVFAT is quite old and is available for testing purposes only.
  Ie. It is not suitable for production environments.

* VirtFS/9pfs -> https://wiki.qemu.org/Documentation/9psetup
  VirtFS implementation though better, it is most commonly used for
  automated testing under sand-boxed server environments, ie. no
  malicious party there. It is also not mature enough for cloud services.
  It is supported on 'Odd Fixes' basis atm.

So these turned out to be issues which can be fixed as regular bugs.

For security bug analysis we generally consider use cases wherein
QEMU is used in conjunction with the KVM hypervisor, which enables
guest to use hardware processor's virtualisation features.

This patch introduces the CVE (or Security or Trust) Quotient field
in the MAINTAINERS file. It tries to capture the security sensitivity
pertaining to a feature or section of the QEMU's code base.

It indicates whether a potential issue should be treated as a security
one OR it could be fixed as a regular non-security bug.

    If Quotient == High, triage issues as potential security ones.
    if Quotient == Low,  triage issues as regular non-security bugs.

I have tagged each section in the MAINTAINERS file as High or Low on best
guess basis. I request respective maintainers to kindly review it please.

If you have any inputs/suggestions, I'd really appreciate them.

Thank you.
--
Prasad J Pandit (1):
  MAINTAINERS: introduce cve or security quotient field

 MAINTAINERS | 324 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)

--
2.26.2


