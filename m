Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB0397758
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:59:32 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6nj-0008S1-2G
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6mQ-0006kh-7o
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6mO-0007qK-L3
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622563087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tB5qP1tD50GwYxP6L5r4md4WK2fdOzsNbu3TXknhcmM=;
 b=iwd/uG0isCcOFilFpqi2PzUSnEGcJCADWovFOkahXrtLxlDWPhs/8fXL1MGdaW/FCdrEH8
 oLz6XA/aLmPy2+eI7YL8akywVu1fF3MVQQ/u429yRIMNanqtqg/OD84IiPBKUE3C2OzLsc
 o5kcEEOwI3TG7Fud7vRKfAFKbLLEoAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-hJtRdC6HMrK6xLE3GmC67g-1; Tue, 01 Jun 2021 11:58:04 -0400
X-MC-Unique: hJtRdC6HMrK6xLE3GmC67g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578B71854E44;
 Tue,  1 Jun 2021 15:58:03 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A83266087C;
 Tue,  1 Jun 2021 15:57:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] vhost-user-blk-test and vdagent Coverity fixes
Date: Tue,  1 Jun 2021 16:57:53 +0100
Message-Id: <20210601155755.216949-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6DQogKiBEcm9wIFBhdGNoIDIgc2luY2UgdGhlIG1rc3RlbXAoMykgdW1hc2sgd2FybmluZyBp
cyBhcmNoYWljIGFuZCBoYXNuJ3QNCiAgIGFwcGxpZWQgZm9yIGEgbG9uZyB0aW1lIFtQZXRlcl0N
CiAqIEZpeCBpbmNvbnNpc3RlbnQgZ19hc3NlcnRfY21waW50KCkvYXNzZXJ0KDMpIHVzYWdlIGlu
IFBhdGNoIDEgW1BldGVyXQ0KDQpUaGlzIHBhdGNoIHNlcmllcyBhZGRyZXNzZXMgcmVjZW50IENv
dmVyaXR5IHJlcG9ydHMuIFBsZWFzZSBzZWUgdGhlIGluZGl2aWR1YWwNCnBhdGNoZXMgZm9yIGRl
dGFpbHMuDQoNClN0ZWZhbiBIYWpub2N6aSAoMik6DQogIHZob3N0LXVzZXItYmxrLXRlc3Q6IGZp
eCBDb3Zlcml0eSBvcGVuKDIpIGZhbHNlIHBvc2l0aXZlcw0KICB1aS92ZGFnZW50OiBmaXggY2xp
cGJvYXJkIGluZm8gbWVtb3J5IGxlYWsgaW4gZXJyb3IgcGF0aA0KDQogdGVzdHMvcXRlc3Qvdmhv
c3QtdXNlci1ibGstdGVzdC5jIHwgOCArKysrKystLQ0KIHVpL3ZkYWdlbnQuYyAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCg0KLS0gDQoyLjMxLjENCg0K


