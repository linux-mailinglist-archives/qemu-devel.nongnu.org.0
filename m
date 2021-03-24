Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500B347B48
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:40 +0100 (CET)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4zv-0000vp-7j
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4ru-0007o0-0e
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4rs-0002Gr-6c
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616597537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1keC6l3LRTO9U9HfEnKk2jB5w2AlwmFMyPSw6+frLEA=;
 b=IemTmlCqWHtKCeJ6/aHpNK43dLvPa0ZSkN1lAHYxBq3Zl5pjTT5nIK6nPI3RBExChxDgX6
 nKIQ9qVa7E2QPS/nQeGDg/f16mJwdy/941aBnGojWnfHnEBucS8jVNyw6Eyo3HWN3QW5B7
 bOCj2XGDWISsjwTzo+8oQXeKr1ygqeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Mo9d_wrBNEeJnmvk759HLA-1; Wed, 24 Mar 2021 10:52:15 -0400
X-MC-Unique: Mo9d_wrBNEeJnmvk759HLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92BF583DD22;
 Wed, 24 Mar 2021 14:52:13 +0000 (UTC)
Received: from localhost (ovpn-115-111.ams2.redhat.com [10.36.115.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2642319C71;
 Wed, 24 Mar 2021 14:52:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/2] Block patches
Date: Wed, 24 Mar 2021 14:52:00 +0000
Message-Id: <20210324145202.430759-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2N2MxMTE1ZWRkOThmMzg4Y2E4OWRk
MzgzMjJlYTNmYWRmMDM0NTIzOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMva3JheGVsL3RhZ3MvdWktMjAyMTAzMjMtcHVsbC1yZXF1ZXN0JyBpbnRvIHN0YWdpbmcg
KDIwMjEtMDMtMjMgMjM6NDc6MzAgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11LmdpdCB0
YWdzL2Jsb2NrLXB1bGwtcmVxdWVzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
MzQ2MGZkN2YzOTU5ZDFmYTdiY2MyNTU3OTY4NDRhYTI2MWM4MDVhNDoNCg0KICBtaWdyYXRlLWJp
dG1hcHMtcG9zdGNvcHktdGVzdDogY2hlY2sgdGhhdCB3ZSBjYW4ndCByZW1vdmUgaW4tZmxpZ2h0
IGJpdG1hcHMgKDIwMjEtMDMtMjQgMTM6NDE6MTkgKzAwMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClB1bGwgcmVx
dWVzdA0KDQpUaGlzIGRpcnR5IGJpdG1hcCBmaXggc29sdmVzIGEgY3Jhc2ggdGhhdCBjYW4gYmUg
dHJpZ2dlcmVkIGluIHRoZSBkZXN0aW5hdGlvbg0KUUVNVSBwcm9jZXNzIGR1cmluZyBsaXZlIG1p
Z3JhdGlvbi4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5ICgyKToN
CiAgbWlncmF0aW9uL2Jsb2NrLWRpcnR5LWJpdG1hcDogbWFrZSBpbmNvbWluZyBkaXNhYmxlZCBi
aXRtYXBzIGJ1c3kNCiAgbWlncmF0ZS1iaXRtYXBzLXBvc3Rjb3B5LXRlc3Q6IGNoZWNrIHRoYXQg
d2UgY2FuJ3QgcmVtb3ZlIGluLWZsaWdodA0KICAgIGJpdG1hcHMNCg0KIG1pZ3JhdGlvbi9ibG9j
ay1kaXJ0eS1iaXRtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKw0KIHRl
c3RzL3FlbXUtaW90ZXN0cy90ZXN0cy9taWdyYXRlLWJpdG1hcHMtcG9zdGNvcHktdGVzdCB8IDEw
ICsrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCg0KLS0gDQoy
LjMwLjINCg0K


