Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12492D24BF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 08:41:46 +0100 (CET)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXd3-0001N9-Vf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 02:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kmXbF-0000Pd-TL
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:39:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kmXbD-00014F-ME
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607413190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7u3rJWN1zJpyEPN6bZp5h775XSvBd8X32HlLtMftlKc=;
 b=L1Xq6U2HU6yNd43nThHhweaX3r2xgy1nVWZI0++xcRfYP9zDRICf1OT+XuaGnS1D8QDc3A
 OQGEX1tWwgEA9J3afg6eDh15I6bBAX1ZgsoQ5k7ulpPMiAf2j1lVa+PUYP4T6pb95FQtjk
 AWcZlcx+uvn/oXPjrO+aqWzePiPBWgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-N6fTKGRaM5qu1uQmx2KlCg-1; Tue, 08 Dec 2020 02:39:48 -0500
X-MC-Unique: N6fTKGRaM5qu1uQmx2KlCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968D68014C1
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 07:39:47 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-194.ams2.redhat.com
 [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF67710016DB;
 Tue,  8 Dec 2020 07:39:37 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH] virtiofsd: update FUSE_FORGET comment on "lo_inode.nlookup"
Date: Tue,  8 Dec 2020 08:39:36 +0100
Message-Id: <20201208073936.8629-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Miklos Szeredi <mszeredi@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWlrbG9zIGNvbmZpcm1zIGl0J3MgKm9ubHkqIHRoZSBGVVNFX0ZPUkdFVCByZXF1ZXN0IHRoYXQg
dGhlIGNsaWVudCBjYW4KdXNlIGZvciBkZWNyZW1lbnRpbmcgImxvX2lub2RlLm5sb29rdXAiLgoK
Q2M6ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KQ2M6IE1p
a2xvcyBTemVyZWRpIDxtc3plcmVkaUByZWRoYXQuY29tPgpDYzogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgpGaXhlczogMTIyMmYwMTU1NThmYzM0Y2VhMDJhYTNhNWE5MmRl
NjA4YzgyY2VjOApTaWduZWQtb2ZmLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29t
PgotLS0KIHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
dmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMgYi90b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hf
bGwuYwppbmRleCAwNjU0M2IyMGRjYmIuLmQzYmU2ODBlOTJjMyAxMDA2NDQKLS0tIGEvdG9vbHMv
dmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMKKysrIGIvdG9vbHMvdmlydGlvZnNkL3Bhc3N0aHJv
dWdoX2xsLmMKQEAgLTExMyw3ICsxMTMsNyBAQCBzdHJ1Y3QgbG9faW5vZGUgewogICAgICAqIFRo
aXMgY291bnRlciBrZWVwcyB0aGUgaW5vZGUgYWxpdmUgZHVyaW5nIHRoZSBGVVNFIHNlc3Npb24u
CiAgICAgICogSW5jcmVtZW50ZWQgd2hlbiB0aGUgRlVTRSBpbm9kZSBudW1iZXIgaXMgc2VudCBp
biBhIHJlcGx5CiAgICAgICogKEZVU0VfTE9PS1VQLCBGVVNFX1JFQURESVJQTFVTLCBldGMpLiAg
RGVjcmVtZW50ZWQgd2hlbiBhbiBpbm9kZSBpcwotICAgICAqIHJlbGVhc2VkIGJ5IHJlcXVlc3Rz
IGxpa2UgRlVTRV9GT1JHRVQsIEZVU0VfUk1ESVIsIEZVU0VfUkVOQU1FLCBldGMuCisgICAgICog
cmVsZWFzZWQgYnkgYSBGVVNFX0ZPUkdFVCByZXF1ZXN0LgogICAgICAqCiAgICAgICogTm90ZSB0
aGF0IHRoaXMgdmFsdWUgaXMgdW50cnVzdGVkIGJlY2F1c2UgdGhlIGNsaWVudCBjYW4gbWFuaXB1
bGF0ZQogICAgICAqIGl0IGFyYml0cmFyaWx5IHVzaW5nIEZVU0VfRk9SR0VUIHJlcXVlc3RzLgot
LSAKMi4xOS4xLjMuZzMwMjQ3YWE1ZDIwMQoK


