Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45A633AF4B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:53:13 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjuS-0007i0-Hx
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjsm-0006vP-Lt
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjsh-0004NH-Sj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1oB85MO+kpqI/e2IAghajO+nCr/t4AbHmfXbPmnPpVQ=;
 b=E335SVIwHynHEIhqvu8diIOBvRQTi2XRQ1rV7ulyPkMJFsjsL99dMEs+f9bW74OBhlMVFQ
 6LaDQUB+T02myhOslqlT8Vz3pjwHY5gDoOmb5WpWo8WOjaqJu4LC6m6pA0NjDw3UKxnT56
 eR1t+hNZ66J8KAwmVuPC3Bk9p1DfF90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-iRsZIzFPPu6lc9gqJolzXw-1; Mon, 15 Mar 2021 05:51:20 -0400
X-MC-Unique: iRsZIzFPPu6lc9gqJolzXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE66E760C1;
 Mon, 15 Mar 2021 09:51:18 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0893362A1B;
 Mon, 15 Mar 2021 09:51:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] Block patches
Date: Mon, 15 Mar 2021 09:51:09 +0000
Message-Id: <20210315095110.110003-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2MTU3YjBlMTk3MjFhYWRiNGM3ZmRj
ZmU1N2IyOTI0YWY2MTQ0YjE0Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvdml2aWVyMi90YWdzL2xpbnV4LXVzZXItZm9yLTYuMC1wdWxsLT0NCnJlcXVlc3QnIGlu
dG8gc3RhZ2luZyAoMjAyMS0wMy0xNCAxNzo0Nzo0OSArMDAwMCkNCg0KYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRsYWIuY29tL3N0ZWZhbmhh
L3FlbXUuZ2l0IHRhZ3MvYmxvY2stcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byBmYjBiMTU0YzgwMWUzNDQ3ZTUwNWRlNDIwMTk1ZmI3MDM4Njk1OTQxOg0KDQog
IHZpcnRpby1ibGs6IFJlc3BlY3QgZGlzY2FyZCBncmFudWxhcml0eSAoMjAyMS0wMy0xNSAwOTo0
ODo1MyArMDAwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KQWtpaGlr
byBPZGFraSAoMSk6DQogIHZpcnRpby1ibGs6IFJlc3BlY3QgZGlzY2FyZCBncmFudWxhcml0eQ0K
DQogaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWJsay5oIHwgMSArDQogaHcvYmxvY2svdmlydGlv
LWJsay5jICAgICAgICAgIHwgOCArKysrKysrLQ0KIGh3L2NvcmUvbWFjaGluZS5jICAgICAgICAg
ICAgICB8IDEgKw0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQoNCi0tPTIwDQoyLjI5LjINCg0K


