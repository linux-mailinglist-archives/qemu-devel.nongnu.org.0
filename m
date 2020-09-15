Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D026A64B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 15:29:11 +0200 (CEST)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIB1C-0003uP-58
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 09:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kIAhR-0002BG-0u
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:08:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25530
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kIAhP-0007AR-JY
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600175322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXvvUloMp94Z9+gVYhOGK2atLGnNbFZYUG/aulOGmpU=;
 b=I6dfyARQ4io3qnjHGomfkkKAQ81qqTLH/W8ADFsavRJFvv0g75AGXviorI2eCcj2yUgAcF
 qF/nKfJr2SFjuXL4IxoMIUw3vg8l2U2hhMb6DHIkGI+8wp/MZS8dioWJ3T/sd9OSidfiTK
 SItWBog/efxiT37vpfQ26fgjj9OYNRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-jZ0Fe-hQNsC7X34lrL2pmQ-1; Tue, 15 Sep 2020 09:08:40 -0400
X-MC-Unique: jZ0Fe-hQNsC7X34lrL2pmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2462564087
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 13:08:39 +0000 (UTC)
Received: from localhost (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DD0A5DC1E;
 Tue, 15 Sep 2020 13:08:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] gitmodules: add qboot, meson, and vbootrom mirrors
Date: Tue, 15 Sep 2020 14:08:31 +0100
Message-Id: <20200915130834.706758-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:29:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6CiAqIFJlYmFzZSBub3cgdGhhdCB2Ym9vdHJvbSBpcyBpbiAuZ2l0bW9kdWxlcyBbUGV0ZXJd
CgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHFlbXUub3JnIG1pcnJvcnMgZm9yIHFib290LCBtZXNv
biwgYW5kIHZib290cm9tLgoKdmJvb3Ryb20gaXMgbm90IHlldCB1c2VkIGJ5IHFlbXUuZ2l0L21h
c3RlciBzbyB5b3UgbWF5IHdpc2ggdG8gaG9sZCBvZmYgb24KYXBwbHlpbmcgdGhlIGZpbmFsIHBh
dGNoLgoKU3RlZmFuIEhham5vY3ppICgzKToKICBnaXRtb2R1bGVzOiBzd2l0Y2ggdG8gcWVtdS5v
cmcgcWJvb3QgbWlycm9yCiAgZ2l0bW9kdWxlczogc3dpdGNoIHRvIHFlbXUub3JnIG1lc29uIG1p
cnJvcgogIGdpdG1vZHVsZXM6IGFkZCBxZW11Lm9yZyB2Ym9vdHJvbSBzdWJtb2R1bGUKCiAuZ2l0
bW9kdWxlcyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjYuMgoK


