Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E696B2CD424
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:02:00 +0100 (CET)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmN5-0003EC-U6
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG3-0003mO-6n
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG1-00021p-NT
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G70KEaSz9DD2rmEgKjbhumYF/7ivPoO1rAANIBSynlk=;
 b=W7XQ7bKujibvt/ILTK7pA4Q8sD+jgkJBak6u7obnI9KV71k1a105A4KnD4EzI+fIEbvTx3
 lvMYsgo1zEI3tdJ6fqey6HoirxSSGpwz3DvtbCe/E/gj+WSAmzYxghpDJudHcQdhvrFNEG
 RuXW0VQurkKZ2KmWtuzEU5h1Rdf4pQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-nrxPqizUNgOEtq-ihJpj4g-1; Thu, 03 Dec 2020 05:54:37 -0500
X-MC-Unique: nrxPqizUNgOEtq-ihJpj4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D961006C81;
 Thu,  3 Dec 2020 10:54:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C635D9CA;
 Thu,  3 Dec 2020 10:54:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C09F49DA1; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/12] tests/acpi: update expected data files
Date: Thu,  3 Dec 2020 11:54:22 +0100
Message-Id: <20201203105423.10431-12-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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


