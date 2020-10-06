Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0232851B0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 20:37:20 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPrpv-00005s-3h
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 14:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kPrkr-00037B-2n
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 14:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kPrkg-0006R2-TU
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 14:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602009114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=4B9LkdA0MGaeohHjLbvlVV7WsFAAJx550taNu8byM34=;
 b=P4bFEA6PhRXzWs4Z5ZZB1thjnf1AK/vXBa/bbsSwf9xjI3p8prpOYOBchAkWEZbo5SWVM/
 NplSKcSWv7NhbxwpmXnlIoGz1qgohWT64haYI/lseOGKxupX6pjkpifhDbzKW1tVLnZ4GK
 4uYg80vjTP5izxuNLdOgfaGviIGkh4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-rs9MovxvNN6C7QKwIqRqTw-1; Tue, 06 Oct 2020 14:31:52 -0400
X-MC-Unique: rs9MovxvNN6C7QKwIqRqTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B156E87950B;
 Tue,  6 Oct 2020 18:31:50 +0000 (UTC)
Received: from thuth.com (ovpn-113-60.ams2.redhat.com [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B81056EF43;
 Tue,  6 Oct 2020 18:31:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/16] pc-bios/s390-ccw/main: Remove superfluous call to
 enable_subchannel()
Date: Tue,  6 Oct 2020 20:31:14 +0200
Message-Id: <20201006183122.155609-9-thuth@redhat.com>
In-Reply-To: <20201006183122.155609-1-thuth@redhat.com>
References: <20201006183122.155609-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

enable_subchannel() is already done during is_dev_possibly_bootable()
(which is called from find_boot_device() -> find_subch()), so there
is no need to do this again in the main() function.

Message-Id: <20200806105349.632-9-thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index fc17e6ab83..43c792cf95 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -280,7 +280,6 @@ int main(void)
     boot_setup();
     if (have_iplb) {
         find_boot_device();
-        enable_subchannel(blk_schid);
         ipl_boot_device();
     } else {
         probe_boot_device();
-- 
2.18.2


