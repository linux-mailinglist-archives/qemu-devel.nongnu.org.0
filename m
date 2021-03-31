Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B4A34FD7B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:53:27 +0200 (CEST)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXXS-0000uF-UB
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVN-00082W-6G
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVL-0000yC-Mb
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DbXXmjvkT1ljjZrgNkEWDbcCAWDLMi+sQUhr9qvDupA=;
 b=Omkhpmrn0VgbNrbNNPvn4X5p9v2/J09EIXKaXp4/GGZyk0LMGHYM53iGNj706qaC097dNF
 PMZ3BD17AIrChCON/GPaRvyLW2fYM4dnSYPxAvjUQLbl3cPHT3FMR2BbAhxT0MAOkBqnio
 H9AeS9fqa23oHZmSvs/Rdq/WuKQb4fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-3yzdHSScMgeKtsOUgSpVTg-1; Wed, 31 Mar 2021 05:51:10 -0400
X-MC-Unique: 3yzdHSScMgeKtsOUgSpVTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F2B98189CB;
 Wed, 31 Mar 2021 09:51:08 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC7D671289;
 Wed, 31 Mar 2021 09:51:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 0/6] Block patches
Date: Wed, 31 Mar 2021 10:50:53 +0100
Message-Id: <20210331095059.303996-1-stefanha@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZDQwY2UwMGMxMTY2YzMxN2UyOThh
ZDgyZWNmMTBlNjUwYzRmODdkOg0KDQogIFVwZGF0ZSB2ZXJzaW9uIGZvciB2Ni4wLjAtcmMxIHJl
bGVhc2UgKDIwMjEtMDMtMzAgMTg6MTk6MDcgKzAxMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11
LmdpdCB0YWdzL2Jsb2NrLXB1bGwtcmVxdWVzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gYjY0ODlhYzA2Njk1ZTI1N2VhMGE5ODQxMzY0NTc3ZTI0N2ZkZWUzMDoNCg0KICB0ZXN0
LWNvcm91dGluZTogQWRkIHJ3bG9jayBkb3duZ3JhZGUgdGVzdCAoMjAyMS0wMy0zMSAxMDo0NDoy
MSArMDEwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNCkEgZml4IGZvciBWREkgaW1hZ2Ug
ZmlsZXMgYW5kIG1vcmUgZ2VuZXJhbGx5IGZvciBDb1J3bG9jay4NCg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpEYXZp
ZCBFZG1vbmRzb24gKDQpOg0KICBibG9jay92ZGk6IFdoZW4gd3JpdGluZyBuZXcgYm1hcCBlbnRy
eSBmYWlscywgZG9uJ3QgbGVhayB0aGUgYnVmZmVyDQogIGJsb2NrL3ZkaTogRG9uJ3QgYXNzdW1l
IHRoYXQgYmxvY2tzIGFyZSBsYXJnZXIgdGhhbiBWZGlIZWFkZXINCiAgY29yb3V0aW5lLWxvY2s6
IFN0b3JlIHRoZSBjb3JvdXRpbmUgaW4gdGhlIENvV2FpdFJlY29yZCBvbmx5IG9uY2UNCiAgdGVz
dC1jb3JvdXRpbmU6IEFkZCByd2xvY2sgZG93bmdyYWRlIHRlc3QNCg0KUGFvbG8gQm9uemluaSAo
Mik6DQogIGNvcm91dGluZS1sb2NrOiBSZWltcGxlbWVudCBDb1J3bG9jayB0byBmaXggZG93bmdy
YWRlIGJ1Zw0KICB0ZXN0LWNvcm91dGluZTogQWRkIHJ3bG9jayB1cGdyYWRlIHRlc3QNCg0KIGlu
Y2x1ZGUvcWVtdS9jb3JvdXRpbmUuaCAgICB8ICAxNyArKy0tDQogYmxvY2svdmRpLmMgICAgICAg
ICAgICAgICAgIHwgIDExICsrLQ0KIHRlc3RzL3VuaXQvdGVzdC1jb3JvdXRpbmUuYyB8IDE2MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHV0aWwvcWVtdS1jb3JvdXRpbmUt
bG9jay5jICB8IDE2NSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCiA0IGZp
bGVzIGNoYW5nZWQsIDI4MiBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkNCg0KLS0gDQoy
LjMwLjINCg0K


