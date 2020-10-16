Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E994290439
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:43:31 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTO8w-0000VA-6U
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO4T-00073n-4l
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO4Q-0001aL-GV
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tTQjzuiyrFazkLpXaNa1Q+Rws4utGOaxQXqW9hy544=;
 b=PldoFhK/GuWeFgJ1hn7PnejzO7G1z47fh1bG73emzj18hdDFN6FeY7T2r0JF3FIsIWcc7j
 HzmzKdHYF1morZwA5UEFB+HTcfvLGmAOf5157UBfe4bytAtrH1ZttIx8MAPNVVFQSPFEGA
 A3vsBf12xasAbfO5ELruKsUItViT9E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-VsAUPDQQOYa9qFFy17DfXg-1; Fri, 16 Oct 2020 07:38:48 -0400
X-MC-Unique: VsAUPDQQOYa9qFFy17DfXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBD9835B58;
 Fri, 16 Oct 2020 11:38:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEBBB10013DB;
 Fri, 16 Oct 2020 11:38:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8C3E9D0F; Fri, 16 Oct 2020 13:38:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] tests/acpi: update expected data files
Date: Fri, 16 Oct 2020 13:38:34 +0200
Message-Id: <20201016113835.17465-7-kraxel@redhat.com>
In-Reply-To: <20201016113835.17465-1-kraxel@redhat.com>
References: <20201016113835.17465-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/data/acpi/microvm/APIC.pcie | Bin 0 -> 110 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC.pcie b/tests/data/acpi/microvm/APIC.pcie
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6c51081b50beb061c5f4e5baa134585d82db4c39 100644
GIT binary patch
literal 110
zcmZ<^@N~{&U|?Xp@8s|75v<@85#a0y6k`O6f!H9Lf#JbFFwFr}2jnsGfW!{`1CdNz
b3_Kt%FNnp<3uE!|!C3tKU=|D8f1pMH#A*!z

literal 0
HcmV?d00001

-- 
2.27.0


