Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B12ADCA9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:13:33 +0100 (CET)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXD1-0003aj-PQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBE-0002Bf-5I
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:11:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBB-0001Yo-J1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605028296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p8y6trFzDwVNRoHLobDMpYeZx9AvEiSn2tMLPolVwS0=;
 b=eS2KJtZTUk7WAkELocWLv03UxAaU/1l3et0HMMjytIUBPYKHARDFn248eb+e4LF2ZkK9/t
 PLN53MJWyLM/KLIlExmBwJjenqhaEX8RsEpKhRIFwjoxST0oPBck145EYxntzQBSk7eaRp
 aLXU8lkOCC3/CsgItKcVXJsv2kD1cbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-7b5k8woxP-eC8h8ZSXFxCw-1; Tue, 10 Nov 2020 12:11:30 -0500
X-MC-Unique: 7b5k8woxP-eC8h8ZSXFxCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75F71016CE1;
 Tue, 10 Nov 2020 17:11:29 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29B4C7513A;
 Tue, 10 Nov 2020 17:11:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vhost-user: ./configure improvements for 5.2
Date: Tue, 10 Nov 2020 17:11:18 +0000
Message-Id: <20201110171121.1265142-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlcmUgd2FzIGNvbmZ1c2lvbiBvdmVyIC0tZGlzYWJsZS12aG9zdC11c2VyIGFuZCB0aGUgbmV3
DQotLWVuYWJsZS9kaXNhYmxlLXZob3N0LXVzZXItYmxrLXNlcnZlciAuL2NvbmZpZ3VyZSBvcHRp
b25zLiBUaGlzIHNlcmllcyB0cmllcw0KdG8gbWFrZSB0aGluZ3MgbW9yZSBjb25zaXN0ZW50LiBT
ZWUgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbnMgZm9yIGRldGFpbHMuDQoNClN0ZWZhbiBIYWpub2N6
aSAoMyk6DQogIG1lc29uOiBtb3ZlIHZob3N0X3VzZXJfYmxrX3NlcnZlciB0byBtZXNvbi5idWls
ZA0KICB2aG9zdC11c2VyLWJsay1zZXJ2ZXI6IGRlcGVuZCBvbiBDT05GSUdfVkhPU1RfVVNFUg0K
ICBjb25maWd1cmU6IG1hcmsgdmhvc3QtdXNlciBMaW51eC1vbmx5DQoNCiBtZXNvbl9vcHRpb25z
LnR4dCAgICAgICAgfCAgMiArKw0KIGNvbmZpZ3VyZSAgICAgICAgICAgICAgICB8IDI1ICsrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0NCiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAxNSArKysr
KysrKysrKysrKysNCiBibG9jay9leHBvcnQvbWVzb24uYnVpbGQgfCAgNSArKysrLQ0KIDQgZmls
ZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4y
OC4wDQoNCg==


