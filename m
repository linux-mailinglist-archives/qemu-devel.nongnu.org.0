Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2A207243
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:39:18 +0200 (CEST)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3kL-0003B9-56
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cB-0004Fh-Qh
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c2-0007y3-Ir
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=eM5iqr2FFJ/KmKCoaf2j9QYBByiH0+UI7k7ir+RfAMc=;
 b=HtvX0/46nGaG+MZR3e6oOeK/cpNOdx5m35Uj8CWQpZVIHrRmmqLSYr5F4O4y0fQqQ3r27z
 Xk6V4txz1nwkRFDKlaxamEkJtS2AFfo0EM6W8BY+psxgR0lnQoV6Cpr4X1VEqMA4NwA+dN
 pZl5vnuLvTCHKXqphwS/uuNKeSxGpMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-dqLEo0l0PsSmVeatgoFsUw-1; Wed, 24 Jun 2020 07:30:39 -0400
X-MC-Unique: dqLEo0l0PsSmVeatgoFsUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 906A418A822B;
 Wed, 24 Jun 2020 11:30:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40F581C8;
 Wed, 24 Jun 2020 11:30:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5FEC631E60; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/20] audio: add soundhw deprecation notice
Date: Wed, 24 Jun 2020 13:30:24 +0200
Message-Id: <20200624113026.13343-19-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 3a255591c341..4cbf3bba3944 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -82,6 +82,15 @@ should specify an ``audiodev=`` property.  Additionally, when using
 vnc, you should specify an ``audiodev=`` propery if you plan to
 transmit audio through the VNC protocol.
 
+Creating sound card devices using ``-soundhw`` (since 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Sound card devices should be created using ``-device`` instead.  The
+names are the same for most devices.  The exceptions are ``hda`` which
+needs two devices (``-device intel-hda --device hda-duplex``) and
+``pcspk`` which can be activated using ``-machine
+pcspk-audiodev=<name>``.
+
 ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.18.4


