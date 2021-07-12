Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980C3C60E5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:53:18 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zBF-0005h0-LW
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8I-00008k-Ms
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2z8G-0002Cm-Hv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626108611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sNbcNj3B8GzBYYN8jmhUfj7gz0Oba6zImuIIiirHwqQ=;
 b=Ddo8leHIMsjs8TYEzxi7qh2emhxbLD0vIwOvksKzv/uQiU9rKGGxHgeuvZPVctRKN12eyr
 qLWHHjuiOgRCfzeFs4DSb4ARJgdiMK9BhJ/o244DZabJK342k0adGAflQXb+GKwxJWl13J
 9G5glk9e9NDI3CeqgZmwcKIdjIWh3k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-d-eKFFLTPseAXD_ugkYU0w-1; Mon, 12 Jul 2021 12:50:09 -0400
X-MC-Unique: d-eKFFLTPseAXD_ugkYU0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2419101F001;
 Mon, 12 Jul 2021 16:50:08 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EC8360916;
 Mon, 12 Jul 2021 16:50:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Tracing patches
Date: Mon, 12 Jul 2021 17:49:55 +0100
Message-Id: <20210712165001.429113-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiZDM4YWUyNmNlYTBkMWQ2YTk3Zjkz
MDI0OGRmMTQ5MjA0YzIxMGEyOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvcnRoLWdpdGxhYi90YWdzL3B1bGwtdGNnLTIwMjEwNzEwJyBpbnRvIHN0YWdpbmcgKDIw
MjEtMDctMTIgMTE6MDI6MzkgKzAxMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11LmdpdCB0YWdz
L3RyYWNpbmctcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBi
YmU0N2VkMjkyODU0MmU3ZGI1ODE0NmI2MTA4ZTNmMjgzNmYyNzhmOg0KDQogIHRyYWNlLCBsdHRu
ZzogcmVxdWlyZSAucGMgZmlsZXMgKDIwMjEtMDctMTIgMTc6Mzc6MTIgKzAxMDApDQoNCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NClB1bGwgcmVxdWVzdA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkdlcmQgSG9mZm1hbm4gKDUpOg0KICBxZW11
LXRyYWNlLXN0YXA6IGNoYW5naW5nIFNZU1RFTVRBUF9UQVBTRVQgY29uc2lkZXJlZCBoYXJtZnVs
Lg0KICB0cmFjZTogaXRlciBpbml0IHR3ZWFrcw0KICB0cmFjZTogYWRkIHRyYWNlX2V2ZW50X2l0
ZXJfaW5pdF9ncm91cA0KICB0cmFjZS9zaW1wbGU6IHBhc3MgaXRlciB0byBzdF93cml0ZV9ldmVu
dF9tYXBwaW5nDQogIHRyYWNlL3NpbXBsZTogYWRkIHN0X2luaXRfZ3JvdXANCg0KUGFvbG8gQm9u
emluaSAoMSk6DQogIHRyYWNlLCBsdHRuZzogcmVxdWlyZSAucGMgZmlsZXMNCg0KIGNvbmZpZ3Vy
ZSAgICAgICAgICAgICAgIHwgMTggKystLS0tLS0tLS0tLS0tLS0tDQogbWVzb24uYnVpbGQgICAg
ICAgICAgICAgfCAgNCAtLS0tDQogdHJhY2UvY29udHJvbC5oICAgICAgICAgfCAzMCArKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0NCiB0cmFjZS9zaW1wbGUuaCAgICAgICAgICB8ICAxICsN
CiBtb25pdG9yL21pc2MuYyAgICAgICAgICB8ICA0ICsrLS0NCiB0cmFjZS9jb250cm9sLXRhcmdl
dC5jICB8ICAyICstDQogdHJhY2UvY29udHJvbC5jICAgICAgICAgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCiB0cmFjZS9xbXAuYyAgICAgICAgICAgICB8ICA2
ICsrKy0tLQ0KIHRyYWNlL3NpbXBsZS5jICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKyst
LS0tLQ0KIHNjcmlwdHMvcWVtdS10cmFjZS1zdGFwIHwgMTQgKysrKy0tLS0tLS0tLS0NCiB0cmFj
ZS9tZXNvbi5idWlsZCAgICAgICB8ICAyICstDQogMTEgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0
aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4zMS4xDQoNCg==


