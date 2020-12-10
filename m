Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5AA2D5B86
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:23:18 +0100 (CET)
Received: from localhost ([::1]:57092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLuf-0001ZI-EN
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKqG-0003uO-0i
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKq1-0006w0-HW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzyW1LfV3kICae7XN9LudGTy5RZDrztOysxJu7Wx2/s=;
 b=LkfxhMQHHOJ1ykgCudRbDtUeSYsMzuFM5NDNYtF7yDa2GT6qli2noCF1OxUFjGiZqhqCec
 cfq9TDZkIPjgXlXaA8+jn6v9YHqzWUyEE6JYn2j/7wAsJDqo8YKXebOWUT5uDyuOxemVPE
 zVbRc6p2GGqNpSG6r+hbNULKzoPeuEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-IudmbYyQOpeOKhtd-xG3dA-1; Thu, 10 Dec 2020 07:14:22 -0500
X-MC-Unique: IudmbYyQOpeOKhtd-xG3dA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C6118C8C01;
 Thu, 10 Dec 2020 12:14:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A414F5D6BA;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0985D9D9E; Thu, 10 Dec 2020 13:14:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] tests/acpi: add data files for ioapic2 test variant
Date: Thu, 10 Dec 2020 13:13:56 +0100
Message-Id: <20201210121359.18320-9-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
References: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Copy microvm/APIC -> microvm/APIC.ioapic2
Copy microvm/DSDT -> microvm/DSDT.ioapic2

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20201203105423.10431-10-kraxel@redhat.com
---
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 0 -> 70 bytes
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 0 -> 365 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/microvm/APIC.ioapic2
 create mode 100644 tests/data/acpi/microvm/DSDT.ioapic2

diff --git a/tests/data/acpi/microvm/APIC.ioapic2 b/tests/data/acpi/microvm/APIC.ioapic2
new file mode 100644
index 0000000000000000000000000000000000000000..7472c7e830b6c7139720e93dd544d4441556661d
GIT binary patch
literal 70
zcmZ<^@N{-#U|?Xp?&R<65v<@85#a0y6k`O6f!H9Lf#JbFFwFr}2jnsGfW!{`1CcCj
H|A7Jk<Z=uF

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/microvm/DSDT.ioapic2 b/tests/data/acpi/microvm/DSDT.ioapic2
new file mode 100644
index 0000000000000000000000000000000000000000..b43f427a222a933d3f34aceab6224a2c6115c365
GIT binary patch
literal 365
zcmX9(%SyvQ6upy2n@pNIKA<QF#Sf5arMONe(=?DaG1G?-VTyaft+=UO6kPiQ{RBV7
z&*`dor`gOs_nbMLa}$-!-w1&98W&=s`tfrq66BBqgUw{=rB<=7xA)_f7<+n>CE=5t
zE;#2y@U)soH1M>j)Okp0N|?)B()oaTI~2uqaQfeg{#@eeMV8=e3}=mj(J&<k`(T52
z$G~{<Rw@(SghZmuI3GM<2s%R)5Sg4V4Zd4o6Cc~5X(KC{LI+@fq)z=6m{mw6^ZwPX
zmdm;SZkF|){d}&e1=QM=t170OdV6g^6IRYjF1Tp2ut@AIEB@GM`K&7N+EF9YHntEE
jUShi3(B94m0^Q#uSOD0Iklv{mV=rh>BYn|!sEgD;a<EMS

literal 0
HcmV?d00001

-- 
2.27.0


