Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12F4D8901
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:25:17 +0100 (CET)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnVU-0007al-Ur
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:25:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmu8-00078P-7Z
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:43 -0400
Received: from smtp86.ord1d.emailsrvr.com ([184.106.54.86]:36906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmu4-0007a8-Vt
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:38 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp11.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id B54B960186; 
 Mon, 14 Mar 2022 11:46:11 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fixes for building on Solaris 11.4.42 CBE
Date: Mon, 14 Mar 2022 10:45:55 -0500
Message-Id: <20220314154557.306-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: 4af82b43-bb37-46e0-ae29-cb6bfb0f992e-1-1
Received-SPF: pass client-ip=184.106.54.86;
 envelope-from=adeason@sinenomine.net; helo=smtp86.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 12:09:05 -0400
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Deason <adeason@sinenomine.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With these minor fixes, I can build qemu on Solaris 11.4.42 CBE
(Oracle's new rolling release thing), using '--disable-rdma
--enable-modules --disable-dbus-display --target-list=x86_64-softmmu'.
I'm just interested in the guest agent right now, so that's all I've
tested (briefly), but the rest of the build wasn't hard to get
working. With this, the guest agent runs fine using isa-serial.

Andrew Deason (2):
  util/osdep: Avoid madvise proto on modern Solaris
  hw/i386/acpi-build: Avoid 'sun' identifier

 hw/i386/acpi-build.c | 4 ++--
 meson.build          | 3 +++
 util/osdep.c         | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.11.0


