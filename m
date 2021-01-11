Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA12F11F7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:57:34 +0100 (CET)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvpE-0007Ek-JF
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvj2-0001d3-De
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyviz-0006ww-UO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sORcbQSuPuyT0A5d+L2vDdjIm4JuwsRpAnNcnUWLMW4=;
 b=BzPBc30VOFlxObbakUv1tItlG3KihfyMXvEGdzwX0artXjXofzjGMeFzhIphRxbS3Y1TPw
 K/5Kl6DIUEcCzVV0F0ySW5VXtrWy9sgojp8appEjtCN4aNGpjbcKDCdHAnuUR/Z4n+o68E
 JrlKnU8Enrr5LipIa/apFMhAEZmLr+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-1pYppdv2O8WmvxXiWrPWdw-1; Mon, 11 Jan 2021 06:51:03 -0500
X-MC-Unique: 1pYppdv2O8WmvxXiWrPWdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0F71005D4C;
 Mon, 11 Jan 2021 11:51:02 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452315D720;
 Mon, 11 Jan 2021 11:50:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] get_maintainer: update repo URL to GitLab
Date: Mon, 11 Jan 2021 11:50:17 +0000
Message-Id: <20210111115017.156802-7-stefanha@redhat.com>
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cWVtdS5vcmcgaXMgcnVubmluZyBvdXQgb2YgYmFuZHdpZHRoIGFuZCB0aGUgUUVNVSBwcm9qZWN0
IGlzIG1vdmluZwp0b3dhcmRzIGEgZ2F0aW5nIENJIG9uIEdpdExhYi4gVXNlIHRoZSBHaXRMYWIg
cmVwb3MgaW5zdGVhZCBvZiBxZW11Lm9yZwoodGhleSB3aWxsIGJlY29tZSBtaXJyb3JzKS4KClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBz
Y3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5l
ci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggMjcxZjVmZjQyYS4uZTU0OTli
OTRiNCAxMDA3NTUKLS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAorKysgYi9zY3JpcHRz
L2dldF9tYWludGFpbmVyLnBsCkBAIC0xMzc3LDcgKzEzNzcsNyBAQCBzdWIgdmNzX2V4aXN0cyB7
CiAJd2FybigiJFA6IE5vIHN1cHBvcnRlZCBWQ1MgZm91bmQuICBBZGQgLS1ub2dpdCB0byBvcHRp
b25zP1xuIik7CiAJd2FybigiVXNpbmcgYSBnaXQgcmVwb3NpdG9yeSBwcm9kdWNlcyBiZXR0ZXIg
cmVzdWx0cy5cbiIpOwogCXdhcm4oIlRyeSBsYXRlc3QgZ2l0IHJlcG9zaXRvcnkgdXNpbmc6XG4i
KTsKLQl3YXJuKCJnaXQgY2xvbmUgaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3FlbXUuZ2l0XG4i
KTsKKwl3YXJuKCJnaXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11
LmdpdFxuIik7CiAJJHByaW50ZWRfbm92Y3MgPSAxOwogICAgIH0KICAgICByZXR1cm4gMDsKLS0g
CjIuMjkuMgoK


