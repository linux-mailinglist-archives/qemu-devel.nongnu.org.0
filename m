Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B498B3BF61B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:16:25 +0200 (CEST)
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1OGm-0001fE-9c
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1m1OEr-0000Nl-WA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1m1OEo-0004w1-DJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625728459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KQ9Mzef/CZ++vSiNvBGr8ND5IefCIiXK9RrhXNC5FKg=;
 b=QXbmCIIc4uulwGrKUoVM1MA31xM93gO/w5kb1UgcT8MByCzWm9g+c+h++dENFwm34TJD/e
 zfIvTHNnr6AbvHdad76XottO+fffTVkX2iBQp74pqyYHn+kbwBm+G32qJ5ipxdLtAwXHsQ
 iNHxBn6LR/kCgpeu4pw2tTbh7qU+DQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Qs0L2ciDNiK2TjPggHqJ5g-1; Thu, 08 Jul 2021 03:14:16 -0400
X-MC-Unique: Qs0L2ciDNiK2TjPggHqJ5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B9D1084F54;
 Thu,  8 Jul 2021 07:14:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-21.ams2.redhat.com
 [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0EA45C1C2;
 Thu,  8 Jul 2021 07:14:10 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Subject: [PATCH] MAINTAINERS: remove Laszlo Ersek's entries
Date: Thu,  8 Jul 2021 09:14:09 +0200
Message-Id: <20210708071409.9671-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSd2ZSByZWxpbnF1aXNoZWQgbXkgZWRrMiByb2xlcyB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWl0
IG1lc3NhZ2UgWzFdIFsyXQpbM106Cgo+IE1haW50YWluZXJzLnR4dDogcmVtb3ZlIExhc3psbyBF
cnNlaydzIGVudHJpZXMKPgo+IEknbSByZWxpbnF1aXNoaW5nIGFsbCBteSByb2xlcyBsaXN0ZWQg
aW4gIk1haW50YWluZXJzLnR4dCIsIGZvciBwZXJzb25hbAo+IHJlYXNvbnMuCj4KPiBNeSBlbWFp
bCBhZGRyZXNzIDxsZXJzZWtAcmVkaGF0LmNvbT4gcmVtYWlucyBmdW5jdGlvbmFsLgo+Cj4gVG8g
bXkgdW5kZXJzdGFuZGluZywgbXkgZW1wbG95ZXIgaXMgd29ya2luZyB0byBhc3NpZ24gb3RoZXJz
IGVuZ2luZWVycwo+IHRvIHRoZSBlZGsyIHByb2plY3QgKGF0IHRoZWlyIGRpc2NyZXRpb24pLgoK
WzFdIGh0dHBzOi8vZWRrMi5ncm91cHMuaW8vZy9kZXZlbC9tZXNzYWdlLzc3NTg1ClsyXSBodHRw
czovL2xpc3RtYW4ucmVkaGF0LmNvbS9hcmNoaXZlcy9lZGsyLWRldmVsLWFyY2hpdmUvMjAyMS1K
dWx5L21zZzAwMjAyLmh0bWwKWzNdIGh0dHA6Ly9taWQubWFpbC1hcmNoaXZlLmNvbS8yMDIxMDcw
ODA3MDkxNi44OTM3LTEtbGVyc2VrQHJlZGhhdC5jb20KCkFjY29yZGluZ2x5LCByZW1vdmUgbXkg
ZW50cmllcyBmcm9tIFFFTVUncyBNQUlOVEFJTkVSUyBmaWxlIGFzIHdlbGwsIHdoaWNoCmFsbCBy
ZWxhdGUgdG8gZ3Vlc3QgZmlybXdhcmUuCgpDYzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5n
ZUByZWRoYXQuY29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBL
YXNoeWFwIENoYW1hcnRoeSA8a2NoYW1hcnRAcmVkaGF0LmNvbT4KQ2M6IFBldGVyIE1heWRlbGwg
PHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KQ2M6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVk
aGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDY4
NDE0MmUxMmVhYS4uNzgzOWY2NzZkYzNhIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMjE2NSw3ICsyMTY1LDYgQEAgRjogaW5jbHVkZS9ody9zb3V0aGJyaWRn
ZS9waWl4LmgKIAogRmlybXdhcmUgY29uZmlndXJhdGlvbiAoZndfY2ZnKQogTTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotUjogTGFzemxvIEVyc2VrIDxsZXJz
ZWtAcmVkaGF0LmNvbT4KIFI6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgogUzog
U3VwcG9ydGVkCiBGOiBkb2NzL3NwZWNzL2Z3X2NmZy50eHQKQEAgLTI4OTcsNyArMjg5Niw2IEBA
IEY6IGluY2x1ZGUvaHcvaTJjL3NtYnVzX3NsYXZlLmgKIEY6IGluY2x1ZGUvaHcvaTJjL3NtYnVz
X2VlcHJvbS5oCiAKIEZpcm13YXJlIHNjaGVtYSBzcGVjaWZpY2F0aW9ucwotTTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KIE06IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KIFI6IERhbmllbCBQLiBCZXJyYW5nZSA8YmVycmFuZ2VAcmVkaGF0LmNv
bT4KIFI6IEthc2h5YXAgQ2hhbWFydGh5IDxrY2hhbWFydEByZWRoYXQuY29tPgpAQCAtMjkwNSw3
ICsyOTAzLDYgQEAgUzogTWFpbnRhaW5lZAogRjogZG9jcy9pbnRlcm9wL2Zpcm13YXJlLmpzb24K
IAogRURLMiBGaXJtd2FyZQotTTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KIE06
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KIFM6IFN1cHBvcnRl
ZAogRjogcGMtYmlvcy9kZXNjcmlwdG9ycy8/Py1lZGsyLSouanNvbgotLSAKMi4xOS4xLjMuZzMw
MjQ3YWE1ZDIwMQoK


