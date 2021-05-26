Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A1391376
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:14:32 +0200 (CEST)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpcV-00030P-7m
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpb5-0001Xo-WD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpb3-00011s-4q
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622020379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xhwWfq5jh21kam8uySvP+CS6WT+QncDt2O67WP65bvo=;
 b=b88b8DFcLxFyed2K6hZssdOTgniSDT/+NKFQkUDNi1BmY4zAdc0Do1U8tijB3Gj8ZCS13p
 6NmiYU4QRQz8Bkar2zJV64WUUs2giaqhoJ2hB2o3HWt9KibqagPjR8xrMVGtqTgphNRHyD
 MbLQiD+ZzFE61FPYkigxY3zYDdmyJVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-pJyx5DYVM5yC4ZNt1P4XJQ-1; Wed, 26 May 2021 05:12:57 -0400
X-MC-Unique: pJyx5DYVM5yC4ZNt1P4XJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C1251935790;
 Wed, 26 May 2021 09:12:56 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C3A15D9CC;
 Wed, 26 May 2021 09:12:49 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vhost-user-blk-test and vdagent Coverity fixes
Date: Wed, 26 May 2021 10:12:45 +0100
Message-Id: <20210526091248.434459-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVzc2VzIHJlY2VudCBDb3Zlcml0eSByZXBvcnRzLiBQbGVh
c2Ugc2VlIHRoZSBpbmRpdmlkdWFsDQpwYXRjaGVzIGZvciBkZXRhaWxzLg0KDQpTdGVmYW4gSGFq
bm9jemkgKDMpOg0KICB2aG9zdC11c2VyLWJsay10ZXN0OiBmaXggQ292ZXJpdHkgb3BlbigyKSBm
YWxzZSBwb3NpdGl2ZXMNCiAgdmhvc3QtdXNlci1ibGstdGVzdDogZml4IENvdmVyaXR5IG1rc3Rl
bXAoMikgdW1hc2sgd2FybmluZw0KICB1aS92ZGFnZW50OiBmaXggY2xpcGJvYXJkIGluZm8gbWVt
b3J5IGxlYWsgaW4gZXJyb3IgcGF0aA0KDQogdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVz
dC5jIHwgMTggKysrKysrKysrKysrKysrKy0tDQogdWkvdmRhZ2VudC5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQoNCi0tIA0KMi4zMS4xDQoNCg==


