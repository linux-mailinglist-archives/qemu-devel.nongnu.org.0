Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0352F36AC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:09:42 +0100 (CET)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNAr-0004KP-5T
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN0l-0002lx-Gy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN0j-0007Je-UX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610470753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvluqyvHL46TVi/zPnd39YSu+etCx0hVbco7BNEVNEA=;
 b=bXmSyvP/0SY4o83XkpdDVAX4Y0feSJ5hA7qOfjxN5nePorjXArKJ1JDCQwESkDoUJqFDVY
 YvVASpahYQ0ThBBQwkyIx+3gS79VecluCNwgReDPHDFgbzbB2gkF7H3z1v3L/ha+1+QKca
 9Yc3uwRqdNK8DpFpbf1yQyvFaQvELYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-1mtjWTyHNk2THVEMV_lmmA-1; Tue, 12 Jan 2021 11:59:09 -0500
X-MC-Unique: 1mtjWTyHNk2THVEMV_lmmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DFF0801B1C;
 Tue, 12 Jan 2021 16:59:08 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CD91972B;
 Tue, 12 Jan 2021 16:59:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] trace: document how to specify multiple --trace patterns
Date: Tue, 12 Jan 2021 16:58:58 +0000
Message-Id: <20210112165859.225534-2-stefanha@redhat.com>
In-Reply-To: <20210112165859.225534-1-stefanha@redhat.com>
References: <20210112165859.225534-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgaXMgcG9zc2libGUgdG8gcmVwZWF0IHRoZSAtLXRyYWNlIG9wdGlvbiB0byBzcGVjaWZ5IG11
bHRpcGxlCnBhdHRlcm5zLiBUaGlzIG1heSBiZSBwcmVmZXJyYWJsZSB0byB1c2VycyB3aG8gZG8g
bm90IHdhbnQgdG8gY3JlYXRlIGEKZmlsZSB3aXRoIGEgbGlzdCBvZiBwYXR0ZXJucy4KClN1Z2dl
c3RlZC1ieTogQkFMQVRPTiBab2x0YW4gPGJhbGF0b25AZWlrLmJtZS5odT4KU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGRvY3MvZGV2ZWwv
dHJhY2luZy5yc3QgfCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3RyYWNpbmcucnN0IGIv
ZG9jcy9kZXZlbC90cmFjaW5nLnJzdAppbmRleCA0ZWJmOGUzOGVhLi44Nzc3YzE5ZDE0IDEwMDY0
NAotLS0gYS9kb2NzL2RldmVsL3RyYWNpbmcucnN0CisrKyBiL2RvY3MvZGV2ZWwvdHJhY2luZy5y
c3QKQEAgLTIyLDEwICsyMiwxNSBAQCBldmVudHM6OgogVGhpcyBvdXRwdXQgY29tZXMgZnJvbSB0
aGUgImxvZyIgdHJhY2UgYmFja2VuZCB0aGF0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdCB3aGVuCiBg
YC4vY29uZmlndXJlIC0tZW5hYmxlLXRyYWNlLWJhY2tlbmRzPUJBQ0tFTkRTYGAgd2FzIG5vdCBl
eHBsaWNpdGx5IHNwZWNpZmllZC4KIAotTW9yZSB0aGFuIG9uZSB0cmFjZSBldmVudCBwYXR0ZXJu
IGNhbiBiZSBzcGVjaWZpZWQgYnkgcHJvdmlkaW5nIGEgZmlsZQotaW5zdGVhZDo6CitNdWx0aXBs
ZSBwYXR0ZXJucyBjYW4gYmUgc3BlY2lmaWVkIGJ5IHJlcGVhdGluZyB0aGUgYGAtLXRyYWNlYGAg
b3B0aW9uOjoKKworICAgICQgcWVtdSAtLXRyYWNlICJrdm1fKiIgLS10cmFjZSAidmlydGlvXyoi
IC4uLgorCitXaGVuIHBhdHRlcm5zIGFyZSB1c2VkIGZyZXF1ZW50bHkgaXQgaXMgbW9yZSBjb252
ZW5pZW50IHRvIHN0b3JlIHRoZW0gaW4gYQorZmlsZSB0byBhdm9pZCBsb25nIGNvbW1hbmQtbGlu
ZSBvcHRpb25zOjoKIAogICAgICQgZWNobyAibWVtb3J5X3JlZ2lvbl9vcHNfKiIgPi90bXAvZXZl
bnRzCisgICAgJCBlY2hvICJrdm1fKiIgPj4vdG1wL2V2ZW50cwogICAgICQgcWVtdSAtLXRyYWNl
IGV2ZW50cz0vdG1wL2V2ZW50cyAuLi4KIAogVHJhY2UgZXZlbnRzCi0tIAoyLjI5LjIKCg==


