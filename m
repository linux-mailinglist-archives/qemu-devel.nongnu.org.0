Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A81455CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:42:14 +0100 (CET)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhg5-0002z2-Ek
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnha6-000894-11
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnha2-0002lw-8s
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IHFHT3sJUPu83cbYBoL1no1u411zhvN0zLqeCR5zqqY=;
 b=TSOx4+x3cTs6RxAR4g3Sg3+r/xCs1QZjsOeFsiMTxmT3Wweuj/tVGgLYDWcVcLSHYzMxua
 keUUOvvj0VmCN+6RihepdBRQn/VFJf/vWqmxZ2APQ71DsE+oERjaY5Ac2TsNbIzWwDA4KP
 ge69X+9NiEk5TeXohDbgMaWzLjde20c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-TGTcRcQgNr26s9ZXQa5eCQ-1; Thu, 18 Nov 2021 08:35:56 -0500
X-MC-Unique: TGTcRcQgNr26s9ZXQa5eCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89102802EDA;
 Thu, 18 Nov 2021 13:35:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF4CE5F4ED;
 Thu, 18 Nov 2021 13:35:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6 for-6.2] AMD SEV patches
Date: Thu, 18 Nov 2021 13:35:26 +0000
Message-Id: <20211118133532.2029166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0055ecca84cb948c935224b4f7ca1ceb26209790=
:=0D
=0D
  Merge tag 'vfio-fixes-20211117.0' of git://github.com/awilliam/qemu-vfio =
into staging (2021-11-18 09:39:47 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/sev-hashes-pull-request=0D
=0D
for you to fetch changes up to 58603ba2680fa35eade630e4b040e96953a11021:=0D
=0D
  target/i386/sev: Replace qemu_map_ram_ptr with address_space_map (2021-11=
-18 13:28:32 +0000)=0D
=0D
----------------------------------------------------------------=0D
Add property for requesting AMD SEV measured kernel launch=0D
=0D
 - The 'sev-guest' object gains a boolean 'kernel-hashes' property=0D
   which must be enabled to request a measured kernel launch.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dov Murik (6):=0D
  qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=3Don|off option=
=0D
  target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=3Don=0D
  target/i386/sev: Rephrase error message when no hashes table in guest=0D
    firmware=0D
  target/i386/sev: Fail when invalid hashes table area detected=0D
  target/i386/sev: Perform padding calculations at compile-time=0D
  target/i386/sev: Replace qemu_map_ram_ptr with address_space_map=0D
=0D
 qapi/qom.json     |  7 ++++-=0D
 qemu-options.hx   |  6 +++-=0D
 target/i386/sev.c | 79 +++++++++++++++++++++++++++++++++++++++--------=0D
 3 files changed, 77 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


