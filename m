Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCE2F36BD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:12:59 +0100 (CET)
Received: from localhost ([::1]:33390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNE2-0007dT-8v
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN0i-0002f6-Mv
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN0f-0007IQ-Ra
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610470748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RtFfa4kBxtHHV4wY4c2hxfDVJizXE0o26X164GjnZm0=;
 b=EP+YkaV86VJVAZAH4iv9FVaCxOuy3dOfIHx7kq2U4OSP1sB9qX5laPFuEqsYtWouNTQaZ4
 /A11zSQL3MlqdfYBK2a4ryrAWmRrPGXiZHi3A52y0GPFIIQAvs1T6igj27XTksll9eW1A1
 qUWDZ6zFbJfXB5r+aMjzyn1RuKXbrS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-ujjVN0N9PyOfVOAbaLPW0w-1; Tue, 12 Jan 2021 11:59:04 -0500
X-MC-Unique: ujjVN0N9PyOfVOAbaLPW0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92A53100C600;
 Tue, 12 Jan 2021 16:59:03 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1652A5C1B4;
 Tue, 12 Jan 2021 16:58:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] trace: documentation improvements
Date: Tue, 12 Jan 2021 16:58:57 +0000
Message-Id: <20210112165859.225534-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QSByZWNlbnQgZGlzY3Vzc2lvbiByYWlzZWQgbWlzc2luZyBpbmZvcm1hdGlvbiBpbiB0aGUgdHJh
Y2luZyBkb2N1bWVudGF0aW9uLg0KQWRkIGl0IQ0KDQpCYXNlZC1vbjogMjAyMDEyMTYxNjA5MjMu
NzIyODk0LTEtc3RlZmFuaGFAcmVkaGF0LmNvbQ0KDQpTdGVmYW4gSGFqbm9jemkgKDIpOg0KICB0
cmFjZTogZG9jdW1lbnQgaG93IHRvIHNwZWNpZnkgbXVsdGlwbGUgLS10cmFjZSBwYXR0ZXJucw0K
ICB0cmFjZTogdXBkYXRlIGRvY3Mgd2l0aCBtZXNvbiBidWlsZCBpbmZvcm1hdGlvbg0KDQogZG9j
cy9kZXZlbC90cmFjaW5nLnJzdCB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlv
bnMoLSkNCg0KLS0gDQoyLjI5LjINCg0K


