Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17D2D5B38
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:07:30 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLfN-0006K0-6l
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKq6-0003jr-F4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKpr-0006tA-Oc
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DpzsULmMH7+A8PnT+Qb88Cb0FxGBER4QcgaIUJ/uH3Y=;
 b=iN93NYoPGlGcQazxo2zXW6/ivv0Kba3DVFUhs6O4qwgM+BZzzRT8jQ0zhggt8/Dn8foQsd
 Ucy/pujlw+G1+9ASPlPibJeFMD95KC5WikRazR3kK/teA7YZnz7var2rbosMnPuxxcx9Ok
 m3y10tvT5Wvoz/JrBsNdj0vbOhQQCbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-cFGAgEPGPGCWCWVxpFGwOw-1; Thu, 10 Dec 2020 07:14:13 -0500
X-MC-Unique: cFGAgEPGPGCWCWVxpFGwOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E95E4BBEE7;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A23B519C78;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A54D9DA0; Thu, 10 Dec 2020 13:14:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] tests/acpi: update expected data files
Date: Thu, 10 Dec 2020 13:13:58 +0100
Message-Id: <20201210121359.18320-11-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
References: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20201203105423.10431-12-kraxel@redhat.com
---
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 70 -> 82 bytes
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 365 -> 365 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
index 7472c7e830b6c7139720e93dd544d4441556661d..a305f89d99eca881109ba54090da0f90262a402c 100644
GIT binary patch
delta 35
ncmZ<@;&Ke|bPi%*U|@VUk;_bok%tk;KKM@pNV2f~2MPlKf^P=P

delta 23
dcmWG?<8ln}barE4U|_sHk;{yYh3!9(2>?8v1it_P

diff --git a/tests/data/acpi/microvm/DSDT.ioapic2 b/tests/data/acpi/microvm/DSDT.ioapic2
index b43f427a222a933d3f34aceab6224a2c6115c365..aee44dd3de1bb16585bf571ff0ca8e44d467d009 100644
GIT binary patch
delta 83
zcmaFM^p=UsCD<h-myv;iNoFIL2qTk`@ni)?Q44X7cxPuvMj#m!EGWe#-p0wm$e_33
k9|IEuLnj*pBcnb814AW)fItibM|`kpybwDJ7b{Q*0Kl;hS^xk5

delta 83
zcmaFM^p=UsCD<h-myv;iDQP2@2qTk$`D6t~Q44mCcxPuvMj#m!EGWe#-p0wm$iTPZ
k9|IEuLnj*pBcnJ214AW)fItibM|`kpybwDJ7b{Q*0LlRlS^xk5

-- 
2.27.0


