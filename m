Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEB2F11E6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:51:41 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvjY-0001j2-Tt
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyviU-0000ZW-Sy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyviS-0006hd-2t
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=THjfY+qrBcFCx5WCWY0fsK21EIga7eyV7i+JhW/y0rE=;
 b=ixdm9J6tmZwWPioUf+/pbdoN/n01ikzqAJNSQFQqVtAFp3F8K04ITozwCKFlgZ/XeVQ3Jj
 UQVBX6geW+RwcOuNU0uODpdwJgGebK+MUa01CgUyLmXwYeSqhsA+j2v8wtFNg5fxNjiHzn
 Kf0dwI2Q5Vx7+z5A1nNGLfrC8/W5U28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-gYADZ7IMPLu9SKjp4LyD5Q-1; Mon, 11 Jan 2021 06:50:26 -0500
X-MC-Unique: gYADZ7IMPLu9SKjp4LyD5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4088118C8C01;
 Mon, 11 Jan 2021 11:50:25 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08BFA5D762;
 Mon, 11 Jan 2021 11:50:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Update git repo URLs to GitLab
Date: Mon, 11 Jan 2021 11:50:11 +0000
Message-Id: <20210111115017.156802-1-stefanha@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2V2ZXJhbCBwbGFjZXMgaW4gcWVtdS5naXQgcmVmZXJlbmNlIHFlbXUub3JnIGdpdCByZXBvIFVS
THMuIExldCdzIHN3aXRjaCB0bw0KR2l0TGFiIHJlcG8gVVJMcyBpbiBvcmRlciB0byBlbmFibGUg
R2l0TGFiIGFzIGEgZ2F0aW5nIENJIGFuZCBpbiBvcmRlciB0bw0KcmVkdWNlIHFlbXUub3JnIGJh
bmR3aWR0aCBjb25zdW1wdGlvbi4NCg0KUGFvbG8gaGFzIGFscmVhZHkgc2V0IHVwIEdpdExhYiBt
aXJyb3IgcmVwb3MuIHNnYWJpb3Mgd2FzIG1pc3NpbmcgYW5kIEkgYWRkZWQNCnRoYXQgdG9kYXku
IEl0IGlzIG5vdyBwb3NzaWJsZSB0byByZXBsYWNlIGdpdC5xZW11Lm9yZy9naXQgd2l0aA0KZ2l0
bGFiLmNvbS9xZW11LXByb2plY3QgaW4gVVJMcy4NCg0KU3RlZmFuIEhham5vY3ppICg2KToNCiAg
LmdpdGh1YjogcG9pbnQgUmVwbyBMb2NrZG93biBib3QgdG8gR2l0TGFiIHJlcG8NCiAgZ2l0bW9k
dWxlczogdXNlIEdpdExhYiByZXBvcyBpbnN0ZWFkIG9mIHFlbXUub3JnDQogIGdpdGxhYi1jaTog
cmVtb3ZlIHJlZHVuZGFudCBHaXRMYWIgcmVwbyBVUkwgY29tbWFuZA0KICBkb2NzOiB1cGRhdGUg
UkVBRE1FIHRvIHVzZSBHaXRMYWIgcmVwbyBVUkxzDQogIHBjLWJpb3M6IHVwZGF0ZSBtaXJyb3Ig
VVJMcyB0byBHaXRMYWINCiAgZ2V0X21haW50YWluZXI6IHVwZGF0ZSByZXBvIFVSTCB0byBHaXRM
YWINCg0KIFJFQURNRS5yc3QgICAgICAgICAgICAgICAgfCAgNCArKy0tDQogLmdpdGh1Yi9sb2Nr
ZG93bi55bWwgICAgICB8ICA4ICsrKy0tLS0NCiAuZ2l0bGFiLWNpLnltbCAgICAgICAgICAgIHwg
IDEgLQ0KIC5naXRtb2R1bGVzICAgICAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCiBwYy1iaW9zL1JFQURNRSAgICAgICAgICAgIHwgIDQgKyst
LQ0KIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgfCAgMiArLQ0KIDYgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yOS4yDQoNCg==


