Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF60295DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 13:45:00 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVZ1f-0007UW-1f
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 07:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYm2-0005Ib-3l
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYm0-00055t-C6
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603366127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMFZnj3WKL2Y2KPQIX3botLUm8jWqyo4+G2IcDvsub0=;
 b=Bcx4U3N9uVkzm6P1hLDoH8Axde7mD2kqX88IbT1yfDWhTgIjm9hQ1GWpXXNAoZMxihcbFx
 DtU24vckDq+bR6aezxUl591/GE4t38mQcyaOHc5auD/8fArcIgGhYfNfUgy+mRe7UOHlDn
 bZbwGdNXtpjcODr5eKyRTH9fmWAFeIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-mMSKDRgSNTOgAGtldZThGQ-1; Thu, 22 Oct 2020 07:28:45 -0400
X-MC-Unique: mMSKDRgSNTOgAGtldZThGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D44FE835B91;
 Thu, 22 Oct 2020 11:28:43 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473AE5D9F7;
 Thu, 22 Oct 2020 11:28:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 12/28] util/vhost-user-server: drop unused
 DevicePanicNotifier
Date: Thu, 22 Oct 2020 12:27:10 +0100
Message-Id: <20201022112726.736757-13-stefanha@redhat.com>
In-Reply-To: <20201022112726.736757-1-stefanha@redhat.com>
References: <20201022112726.736757-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 06:53:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGRldmljZSBwYW5pYyBub3RpZmllciBjYWxsYmFjayBpcyBub3QgdXNlZC4gRHJvcCBpdC4K
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVz
c2FnZS1pZDogMjAyMDA5MjQxNTE1NDkuOTEzNzM3LTctc3RlZmFuaGFAcmVkaGF0LmNvbQpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdXRp
bC92aG9zdC11c2VyLXNlcnZlci5oICAgICAgICAgICAgIHwgMyAtLS0KIGJsb2NrL2V4cG9ydC92
aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyB8IDMgKy0tCiB1dGlsL3Zob3N0LXVzZXItc2VydmVyLmMg
ICAgICAgICAgICAgfCA2IC0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbC92aG9zdC11c2VyLXNlcnZlci5oIGIv
dXRpbC92aG9zdC11c2VyLXNlcnZlci5oCmluZGV4IDUyMzJmOTY3MTguLjkyMTc3ZmM5MTEgMTAw
NjQ0Ci0tLSBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuaAorKysgYi91dGlsL3Zob3N0LXVzZXIt
c2VydmVyLmgKQEAgLTI5LDEyICsyOSwxMCBAQCB0eXBlZGVmIHN0cnVjdCBWdUZkV2F0Y2ggewog
fSBWdUZkV2F0Y2g7CiAKIHR5cGVkZWYgc3RydWN0IFZ1U2VydmVyIFZ1U2VydmVyOwotdHlwZWRl
ZiB2b2lkIERldmljZVBhbmljTm90aWZpZXJGbihWdVNlcnZlciAqc2VydmVyKTsKIAogc3RydWN0
IFZ1U2VydmVyIHsKICAgICBRSU9OZXRMaXN0ZW5lciAqbGlzdGVuZXI7CiAgICAgQWlvQ29udGV4
dCAqY3R4OwotICAgIERldmljZVBhbmljTm90aWZpZXJGbiAqZGV2aWNlX3BhbmljX25vdGlmaWVy
OwogICAgIGludCBtYXhfcXVldWVzOwogICAgIGNvbnN0IFZ1RGV2SWZhY2UgKnZ1X2lmYWNlOwog
ICAgIFZ1RGV2IHZ1X2RldjsKQEAgLTU0LDcgKzUyLDYgQEAgYm9vbCB2aG9zdF91c2VyX3NlcnZl
cl9zdGFydChWdVNlcnZlciAqc2VydmVyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
b2NrZXRBZGRyZXNzICp1bml4X3NvY2tldCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
QWlvQ29udGV4dCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBt
YXhfcXVldWVzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VQYW5pY05vdGlm
aWVyRm4gKmRldmljZV9wYW5pY19ub3RpZmllciwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgVnVEZXZJZmFjZSAqdnVfaWZhY2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEVycm9yICoqZXJycCk7CiAKZGlmZiAtLWdpdCBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2Vy
LWJsay1zZXJ2ZXIuYyBiL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYwppbmRl
eCBkMjI3YjQ2OGQ4Li5jOGZhNGVjYmE5IDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQvdmhvc3Qt
dXNlci1ibGstc2VydmVyLmMKKysrIGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZl
ci5jCkBAIC00MzksOCArNDM5LDcgQEAgc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ibGtfc2VydmVy
X3N0YXJ0KFZ1QmxvY2tEZXYgKnZ1X2Jsb2NrX2RldmljZSwKICAgICBjdHggPSBiZHJ2X2dldF9h
aW9fY29udGV4dChibGtfYnModnVfYmxvY2tfZGV2aWNlLT5iYWNrZW5kKSk7CiAKICAgICBpZiAo
IXZob3N0X3VzZXJfc2VydmVyX3N0YXJ0KCZ2dV9ibG9ja19kZXZpY2UtPnZ1X3NlcnZlciwgYWRk
ciwgY3R4LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkhPU1RfVVNFUl9CTEtf
TUFYX1FVRVVFUywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsICZ2dV9i
bG9ja19pZmFjZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZIT1NUX1VTRVJf
QkxLX01BWF9RVUVVRVMsICZ2dV9ibG9ja19pZmFjZSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVycnApKSB7CiAgICAgICAgIGdvdG8gZXJyb3I7CiAgICAgfQpkaWZmIC0tZ2l0
IGEvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jCmlu
ZGV4IDZlZmUyMjc5ZmQuLjczYTE2NjdiNTQgMTAwNjQ0Ci0tLSBhL3V0aWwvdmhvc3QtdXNlci1z
ZXJ2ZXIuYworKysgYi91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKQEAgLTgxLDEwICs4MSw2IEBA
IHN0YXRpYyB2b2lkIHBhbmljX2NiKFZ1RGV2ICp2dV9kZXYsIGNvbnN0IGNoYXIgKmJ1ZikKICAg
ICAgICAgY2xvc2VfY2xpZW50KHNlcnZlcik7CiAgICAgfQogCi0gICAgaWYgKHNlcnZlci0+ZGV2
aWNlX3BhbmljX25vdGlmaWVyKSB7Ci0gICAgICAgIHNlcnZlci0+ZGV2aWNlX3BhbmljX25vdGlm
aWVyKHNlcnZlcik7Ci0gICAgfQotCiAgICAgLyoKICAgICAgKiBTZXQgdGhlIGNhbGxiYWNrIGZ1
bmN0aW9uIGZvciBuZXR3b3JrIGxpc3RlbmVyIHNvIGFub3RoZXIKICAgICAgKiB2aG9zdC11c2Vy
IGNsaWVudCBjYW4gY29ubmVjdCB0byB0aGlzIHNlcnZlcgpAQCAtMzg1LDcgKzM4MSw2IEBAIGJv
b2wgdmhvc3RfdXNlcl9zZXJ2ZXJfc3RhcnQoVnVTZXJ2ZXIgKnNlcnZlciwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU29ja2V0QWRkcmVzcyAqc29ja2V0X2FkZHIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEFpb0NvbnRleHQgKmN0eCwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDE2X3QgbWF4X3F1ZXVlcywKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRGV2aWNlUGFuaWNOb3RpZmllckZuICpkZXZpY2VfcGFuaWNfbm90aWZpZXIsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IFZ1RGV2SWZhY2UgKnZ1X2lmYWNlLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApCiB7CkBAIC00MDIsNyArMzk3LDYg
QEAgYm9vbCB2aG9zdF91c2VyX3NlcnZlcl9zdGFydChWdVNlcnZlciAqc2VydmVyLAogICAgICAg
ICAudnVfaWZhY2UgICAgICAgICAgICAgID0gdnVfaWZhY2UsCiAgICAgICAgIC5tYXhfcXVldWVz
ICAgICAgICAgICAgPSBtYXhfcXVldWVzLAogICAgICAgICAuY3R4ICAgICAgICAgICAgICAgICAg
ID0gY3R4LAotICAgICAgICAuZGV2aWNlX3BhbmljX25vdGlmaWVyID0gZGV2aWNlX3BhbmljX25v
dGlmaWVyLAogICAgIH07CiAKICAgICBxaW9fbmV0X2xpc3RlbmVyX3NldF9uYW1lKHNlcnZlci0+
bGlzdGVuZXIsICJ2aG9zdC11c2VyLWJhY2tlbmQtbGlzdGVuZXIiKTsKLS0gCjIuMjYuMgoK


