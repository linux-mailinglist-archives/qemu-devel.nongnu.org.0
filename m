Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1576A316247
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:33:06 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9lrs-0006TV-ND
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmM-0002OR-NE
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmL-0005er-4f
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612949240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7dZni2i+uZBavmkjw8lvHqwUAtD09j5zH6NzjMwesI=;
 b=BZOvUj2HVwXvb8GOvEu84qmrUIVlnssEigCmSqKWs4d+tGR/BxOkTA8YpPO4seHKBFLtlX
 qJV79l0fQN5uSkPUSBjZHkyPoBXPPLUXnm7PsZ5e9gNvXNoXM1e+hD26YVI/pKtvqP8Mj4
 E8qxyx8UtvlFGUuywv/1uNTVg3TKYVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-Aqi97hBtN0iAfiFhyhhAWA-1; Wed, 10 Feb 2021 04:27:18 -0500
X-MC-Unique: Aqi97hBtN0iAfiFhyhhAWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514EB801962;
 Wed, 10 Feb 2021 09:27:16 +0000 (UTC)
Received: from localhost (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39485679F5;
 Wed, 10 Feb 2021 09:27:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v4 03/27] gitlab-ci: remove redundant GitLab repo URL command
Date: Wed, 10 Feb 2021 09:26:04 +0000
Message-Id: <20210210092628.193785-4-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 thuth@redhat.com, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byBwb2ludCAuZ2l0bW9kdWxlcyBhdCBHaXRMYWIg
cmVwb3Mgd2hlbgpydW5uaW5nIGluIEdpdExhYiBDSSBzaW5jZSB0aGV5IGFyZSBub3cgdXNlZCBh
bGwgdGhlIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGEgPHdhaW5l
cnNtQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNv
bT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNv
bT4KTWVzc2FnZS1pZDogMjAyMTAxMTExMTUwMTcuMTU2ODAyLTQtc3RlZmFuaGFAcmVkaGF0LmNv
bQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0t
LQogLmdpdGxhYi1jaS55bWwgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCA3YzBkYjY0
NzEwLi4yOGE4M2FmYjkxIDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFi
LWNpLnltbApAQCAtMTgsNyArMTgsNiBAQCBpbmNsdWRlOgogICBpbWFnZTogJENJX1JFR0lTVFJZ
X0lNQUdFL3FlbXUvJElNQUdFOmxhdGVzdAogICBiZWZvcmVfc2NyaXB0OgogICAgIC0gSk9CUz0k
KGV4cHIgJChucHJvYykgKyAxKQotICAgIC0gc2VkIC1pIHMsZ2l0LnFlbXUub3JnL2dpdCxnaXRs
YWIuY29tL3FlbXUtcHJvamVjdCwgLmdpdG1vZHVsZXMKICAgc2NyaXB0OgogICAgIC0gbWtkaXIg
YnVpbGQKICAgICAtIGNkIGJ1aWxkCi0tIAoyLjI5LjIKCg==


