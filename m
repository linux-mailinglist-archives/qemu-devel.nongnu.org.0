Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C230B305
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:58:06 +0100 (CET)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6i8z-0001Ly-GP
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5I-000669-45
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5D-00023w-LL
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qo23IpsmouVtYFANf8hB06wX8hRpbxsaH2QQcZUkvxQ=;
 b=Ehmg7y1lbZLKzY5YO6kFj9UjyUbYZLB9gUwITbunMFbX/9ZENiDlixPzrMLNaS6ny6fOme
 MsZV0I3qsp+2NMhDL+cMa1EmVTDanSpSkjZxlxfeXta/f9ZDzVO0Brmj8xJ64jXiDKJ2J8
 EC7/hfo1ncpIKJstGhduDhQvlaC8Q9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-7SIoBHbfOzm0HrbMvZ0G2A-1; Mon, 01 Feb 2021 17:54:07 -0500
X-MC-Unique: 7SIoBHbfOzm0HrbMvZ0G2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F022107ACE6;
 Mon,  1 Feb 2021 22:54:06 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 387DA277C2;
 Mon,  1 Feb 2021 22:54:05 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] i386: Ensure feature names are always defined
Date: Mon,  1 Feb 2021 17:54:01 -0500
Message-Id: <20210201225404.3941395-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgetting to adding feature names to the feature array=0D
seems to be a very common mistake.=0D
=0D
Examples:=0D
=0D
- Missing name for MSR_VMX_EPT_WB=0D
  commit 0723cc8a5558 ("target/i386: add VMX features to named CPU models")=
=0D
- Missing name for "ibrs" at=0D
  https://lore.kernel.org/qemu-devel/0ad4017d-e755-94a3-859e-800661bcd2d1@a=
md.com=0D
=0D
This series fixes the MSR_VMX_EPT_WB problem and adds a runtime=0D
check that should detect similar mistakes even before CPU model=0D
classes are registered.=0D
=0D
Eduardo Habkost (3):=0D
  i386: Add missing "vmx-ept-wb" feature name=0D
  i386: Move asserts to separate x86_cpudef_validate() function=0D
  i386: Sanity check CPU model feature sets=0D
=0D
 target/i386/cpu.c | 31 +++++++++++++++++++++++++++----=0D
 1 file changed, 27 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


