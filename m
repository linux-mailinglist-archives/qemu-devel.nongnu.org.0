Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5032B9884
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:49:57 +0100 (CET)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn88-00046V-SY
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfn6S-0002h0-6V
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfn6O-000102-0L
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605804487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q8o3oc5sanr2Ifsrei9vvIGPZ5LqpMHYRbks1FNYFqU=;
 b=M00WpSrOeDRE1rfrLcv5OQ9O/poeuj7NR4c76/0QZtJAAtT0Vfu7wsorJCEsqFuC2dSXtj
 20PI22jap0nA4f/uymAvOrdwQzrig9tGzhjkMMx2YOJk3cqZLt6gfp1DX1ZarRQs74lkJs
 9aMcGjTLxXMvNq751kXXyR0pTHPeumc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-fMrdLiI4PoG0kLH2NCd5ig-1; Thu, 19 Nov 2020 11:48:02 -0500
X-MC-Unique: fMrdLiI4PoG0kLH2NCd5ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E03D618C43DA;
 Thu, 19 Nov 2020 16:48:00 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0281B70497;
 Thu, 19 Nov 2020 16:47:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 0/1] Tracing patches
Date: Thu, 19 Nov 2020 16:47:57 +0000
Message-Id: <20201119164758.939980-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmZjg1ZGI3NjlmZmQ0MzFmODZkMjYz
ZDVlOTU0ZTgwOWE4M2JlOTJmOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvY29odWNrL3RhZ3MvczM5MHgtMjAyMDExMTknIGludG8gc3RhZ2luZyAoMjAyMC0xMS0x
OSAxMDozNjo1MyArMDAwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6DQoNCiAgaHR0cHM6Ly9naXRsYWIuY29tL3N0ZWZhbmhhL3FlbXUuZ2l0IHRhZ3MvdHJhY2lu
Zy1wdWxsLXJlcXVlc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRiMjY1Yzc5
YTg1YmIzNWFiZTE5YWFjZWE2OTU0YzE2MTY1MjE2Mzk6DQoNCiAgdHJhY2U6IHVzZSBTVEFQX1NE
VF9WMiB0byB3b3JrIGFyb3VuZCBzeW1ib2wgdmlzaWJpbGl0eSAoMjAyMC0xMS0xOSAxNjo0MTow
OSArMDAwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNCkZpeCAtLWVuYWJsZS1tb2R1bGVz
IC0tZW5hYmxlLXRyYWNlLWJhY2tlbmRzPWR0cmFjZSB3aXRoIHJlY2VudCBTeXN0ZW1UYXANCnJl
bGVhc2VzLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQoNClN0ZWZhbiBIYWpub2N6aSAoMSk6DQogIHRyYWNlOiB1c2Ug
U1RBUF9TRFRfVjIgdG8gd29yayBhcm91bmQgc3ltYm9sIHZpc2liaWxpdHkNCg0KIGNvbmZpZ3Vy
ZSAgICAgICAgIHwgNyArKysrKysrDQogdHJhY2UvbWVzb24uYnVpbGQgfCA0ICsrLS0NCiAyIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjI4
LjANCg0K


