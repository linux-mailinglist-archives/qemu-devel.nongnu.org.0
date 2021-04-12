Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832935C8DD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:36:39 +0200 (CEST)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxg6-0006DH-Fi
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeS-0005Mr-SW
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeN-0007rM-LU
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rHJxkA6/aJNWnTBJn3SOvhdoUL5ioskNcQ+LW4lag8k=;
 b=US9Xwh9n6ZiV7SFpHxx40f4tqtaf3yyqOtsxiPovU3A/9ClT9HH4RiZ1JqnrqAfsOTeQn7
 iyndJU0ppNK05uUJO8n8fEGULcTQpHb/BaAezjvNxhQTivQAK6ACWWWevFqjD4s2jOvK0+
 MMv27xjIy/7DOAKBrylP5HUdTKN5hk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-ghOrX2YRNGS6NG8LAcU2Hg-1; Mon, 12 Apr 2021 10:34:46 -0400
X-MC-Unique: ghOrX2YRNGS6NG8LAcU2Hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D77B6D4E6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:34:45 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 901FD5C1C2;
 Mon, 12 Apr 2021 14:34:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] docs/devel/qgraph: add troubleshooting information
Date: Mon, 12 Apr 2021 15:34:35 +0100
Message-Id: <20210412143437.727560-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6DQogKiBGaXggIndpbGwgdW5hdmFpbGFibGUiIHR5cG8gW1Rob21hc10NCg0KSSByZWNlbnRs
eSBuZWVkZWQgdG8gdHJvdWJsZXNob290IGEgY2FzZSB3aGVyZSBxb3MtdGVzdCB0ZXJtaW5hdGVk
IGltbWVkaWF0ZWx5DQp3aXRoIG5vIG91dHB1dC4gSW4gb3RoZXIgd29yZHMsIHFvcy10ZXN0IGRl
Y2lkZWQgdGhhdCBubyB0ZXN0cyBhcmUgcnVubmFibGUuDQoNCkFmdGVyIGxvdHMgb2YgaGVhZCBz
Y3JhdGNoaW5nIGFuZCBzb21lIGhlbHAgZnJvbSBFbWFudWVsZSBpdCB0dXJuZWQgb3V0IHRoYXQN
CnRoZSBtYWNoaW5lIHR5cGVzIHdlcmVuJ3QgYmVpbmcgZGV0ZWN0ZWQgYXMgZXhwZWN0ZWQuDQoN
ClRoZXNlIHBhdGNoZXMgYWRkIGRvY3VtZW50YXRpb24gYWJvdXQgaG93IHRvIHRyb3VibGVzaG9v
dCBzaW1pbGFyIGNhc2VzIGluIHRoZQ0KZnV0dXJlLg0KDQpTdGVmYW4gSGFqbm9jemkgKDIpOg0K
ICBsaWJxb3MvcWdyYXBoOiBmaXggIlVOQVZBSUxCTEUiIHR5cG8NCiAgZG9jcy9kZXZlbC9xZ3Jh
cGg6IGFkZCB0cm91Ymxlc2hvb3RpbmcgaW5mb3JtYXRpb24NCg0KIGRvY3MvZGV2ZWwvcWdyYXBo
LnJzdCAgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiB0
ZXN0cy9xdGVzdC9saWJxb3MvcWdyYXBoLmMgfCAgMiArLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNTkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQotLSANCjIuMzAuMg0KDQo=


