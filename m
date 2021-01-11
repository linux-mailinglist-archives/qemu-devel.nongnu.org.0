Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C812F11F1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:55:09 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvmu-00050y-3W
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvio-0001CD-Ru
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvin-0006r3-Ar
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jf9VLO8As2gqnLXhMlpWco61UO3JTU8gb9+i0eDqP9A=;
 b=W6r1t7JrJcqc6K+hPOFjP1eP8C3DKcafi9KCcDJEJpNZAkfeWsqhhyA0HqkJVCmDAmcM/l
 MtKQhrfIajnlZtltPFPgPKuDp5LDC74nYQ+3VECLVMI99Gx0l0BFENxe2GJmrOZCbitTpV
 TCOJR+FM1UOk9F86L7djW+PUW60w00s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-_lShhlRIOz-yxKSd1Fjz_w-1; Mon, 11 Jan 2021 06:50:46 -0500
X-MC-Unique: _lShhlRIOz-yxKSd1Fjz_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F096B425C8;
 Mon, 11 Jan 2021 11:50:44 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C865D9F4;
 Mon, 11 Jan 2021 11:50:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] gitlab-ci: remove redundant GitLab repo URL command
Date: Mon, 11 Jan 2021 11:50:14 +0000
Message-Id: <20210111115017.156802-4-stefanha@redhat.com>
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byBwb2ludCAuZ2l0bW9kdWxlcyBhdCBHaXRMYWIg
cmVwb3Mgd2hlbgpydW5uaW5nIGluIEdpdExhYiBDSSBzaW5jZSB0aGV5IGFyZSBub3cgdXNlZCBh
bGwgdGhlIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbApp
bmRleCAwMWM5ZTQ2NDEwLi40YzJhNzFiOTM0IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAor
KysgYi8uZ2l0bGFiLWNpLnltbApAQCAtMTgsNyArMTgsNiBAQCBpbmNsdWRlOgogICBpbWFnZTog
JENJX1JFR0lTVFJZX0lNQUdFL3FlbXUvJElNQUdFOmxhdGVzdAogICBiZWZvcmVfc2NyaXB0Ogog
ICAgIC0gSk9CUz0kKGV4cHIgJChucHJvYykgKyAxKQotICAgIC0gc2VkIC1pIHMsZ2l0LnFlbXUu
b3JnL2dpdCxnaXRsYWIuY29tL3FlbXUtcHJvamVjdCwgLmdpdG1vZHVsZXMKICAgc2NyaXB0Ogog
ICAgIC0gbWtkaXIgYnVpbGQKICAgICAtIGNkIGJ1aWxkCi0tIAoyLjI5LjIKCg==


