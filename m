Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7E2AF134
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:48:42 +0100 (CET)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpYH-0003IT-0z
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTz-00073b-VK
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpTy-00018y-3R
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wykwF6JRkXwdwFG6CRa3/LoMXETQzaO7sefW3MEoBDY=;
 b=Wn1fgJzUsY6oDr0rMnt9Xn6D3TIdgGS93GdAo+xKKI6N1uFVXUHxUKc8kh6LtbgUo+eWuF
 JzjbbGUBmThk9VlJKrMDnhXch0hh6SR0SDvsic4MysLajsV4eHZQG77xBV1ZUc7m3uRR+n
 LKVaezzehbO2fhbl2+ttJ4OVePvqwmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-KBoZWUitOxyadXstb7Y2iA-1; Wed, 11 Nov 2020 07:44:10 -0500
X-MC-Unique: KBoZWUitOxyadXstb7Y2iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99CC1801FDB;
 Wed, 11 Nov 2020 12:44:09 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06F776EF4A;
 Wed, 11 Nov 2020 12:44:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 04/10] vhost-user-blk-test: rename destroy_drive() to
 destroy_file()
Date: Wed, 11 Nov 2020 12:43:25 +0000
Message-Id: <20201111124331.1393747-5-stefanha@redhat.com>
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
References: <20201111124331.1393747-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZ1bmN0aW9uIGlzIHVzZWQgbm90IGp1c3QgZm9yIGltYWdlIGZpbGVzIGJ1dCBhbHNvIGZv
ciBVTklYIGRvbWFpbgpzb2NrZXRzIChRTVAgbW9uaXRvciBhbmQgdmhvc3QtdXNlci1ibGspLiBS
ZWZsZWN0IHRoYXQgaW4gdGhlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVz
dC5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVzdC5j
IGIvdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVzdC5jCmluZGV4IDMxZjIzMzVmOTcuLmYw
NWYxNGMxOTIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYwor
KysgYi90ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMKQEAgLTY1OCw3ICs2NTgsOCBA
QCBzdGF0aWMgY29uc3QgY2hhciAqcXRlc3RfcWVtdV9zdG9yYWdlX2RhZW1vbl9iaW5hcnkodm9p
ZCkKICAgICByZXR1cm4gcWVtdV9zdG9yYWdlX2RhZW1vbl9iaW47CiB9CiAKLXN0YXRpYyB2b2lk
IGRyaXZlX2Rlc3Ryb3kodm9pZCAqcGF0aCkKKy8qIGdfdGVzdF9xdWV1ZV9kZXN0cm95KCkgY2xl
YW51cCBmdW5jdGlvbiBmb3IgZmlsZXMgKi8KK3N0YXRpYyB2b2lkIGRlc3Ryb3lfZmlsZSh2b2lk
ICpwYXRoKQogewogICAgIHVubGluayhwYXRoKTsKICAgICBnX2ZyZWUocGF0aCk7CkBAIC02Nzgs
NyArNjc5LDcgQEAgc3RhdGljIGNoYXIgKmRyaXZlX2NyZWF0ZSh2b2lkKQogICAgIGdfYXNzZXJ0
X2NtcGludChyZXQsID09LCAwKTsKICAgICBjbG9zZShmZCk7CiAKLSAgICBnX3Rlc3RfcXVldWVf
ZGVzdHJveShkcml2ZV9kZXN0cm95LCB0X3BhdGgpOworICAgIGdfdGVzdF9xdWV1ZV9kZXN0cm95
KGRlc3Ryb3lfZmlsZSwgdF9wYXRoKTsKICAgICByZXR1cm4gdF9wYXRoOwogfQogCkBAIC03MTcs
NyArNzE4LDcgQEAgc3RhdGljIGNoYXIgKnN0YXJ0X3Zob3N0X3VzZXJfYmxrKEdTdHJpbmcgKmNt
ZF9saW5lLCBpbnQgdnVzX2luc3RhbmNlcywKIAogICAgIHFtcF9mZCA9IG1rc3RlbXAocW1wX3Nv
Y2tfcGF0aCk7CiAgICAgZ19hc3NlcnRfY21waW50KHFtcF9mZCwgPj0sIDApOwotICAgIGdfdGVz
dF9xdWV1ZV9kZXN0cm95KGRyaXZlX2Rlc3Ryb3ksIHFtcF9zb2NrX3BhdGgpOworICAgIGdfdGVz
dF9xdWV1ZV9kZXN0cm95KGRlc3Ryb3lfZmlsZSwgcW1wX3NvY2tfcGF0aCk7CiAKICAgICBnX3N0
cmluZ19hcHBlbmRfcHJpbnRmKHN0b3JhZ2VfZGFlbW9uX2NvbW1hbmQsCiAgICAgICAgICAgICAi
ZXhlYyAlcyAiCkBAIC03MzEsNyArNzMyLDcgQEAgc3RhdGljIGNoYXIgKnN0YXJ0X3Zob3N0X3Vz
ZXJfYmxrKEdTdHJpbmcgKmNtZF9saW5lLCBpbnQgdnVzX2luc3RhbmNlcywKICAgICAgICAgc29j
a19wYXRoID0gZ19zdHJkdXAoc29ja19wYXRoX3RlbXBhdGUpOwogICAgICAgICBmZCA9IG1rc3Rl
bXAoc29ja19wYXRoKTsKICAgICAgICAgZ19hc3NlcnRfY21waW50KGZkLCA+PSwgMCk7Ci0gICAg
ICAgIGdfdGVzdF9xdWV1ZV9kZXN0cm95KGRyaXZlX2Rlc3Ryb3ksIHNvY2tfcGF0aCk7CisgICAg
ICAgIGdfdGVzdF9xdWV1ZV9kZXN0cm95KGRyaXZlX2ZpbGUsIHNvY2tfcGF0aCk7CiAgICAgICAg
IC8qIGNyZWF0ZSBpbWFnZSBmaWxlICovCiAgICAgICAgIGltZ19wYXRoID0gZHJpdmVfY3JlYXRl
KCk7CiAgICAgICAgIGdfc3RyaW5nX2FwcGVuZF9wcmludGYoc3RvcmFnZV9kYWVtb25fY29tbWFu
ZCwKLS0gCjIuMjguMAoK


