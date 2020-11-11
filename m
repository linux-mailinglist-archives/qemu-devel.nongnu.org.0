Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F312AF59C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:59:09 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsWa-0001hd-Ej
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcsUd-0008SM-6V
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcsUb-0000ZJ-Ih
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605110224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FoW9WkgQBjX9oZ3J7hXx2JZYps6HaNrG+9xucaOiKvU=;
 b=BZH8Znn74TogdRU0C09dS0esXb1DhRNhckQ8VRRGPa2nJnL9+T+ESLnHk7XM3fsH8yjabu
 RmqpPE3one8MlDr4oK1jsbL1z10HLGUWdOCBNUS8ge4Zx+r6JOg/dLfCofBRt1nb3ltII8
 IiY8Syl8jHbn8cDjKM18mX1Z/QVeF/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-CNWyNAVkMBOE88CTZ_CUPw-1; Wed, 11 Nov 2020 10:57:00 -0500
X-MC-Unique: CNWyNAVkMBOE88CTZ_CUPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 746C3108E1A9;
 Wed, 11 Nov 2020 15:56:59 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09DDE75128;
 Wed, 11 Nov 2020 15:56:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 0/2] Tracing patches
Date: Wed, 11 Nov 2020 15:56:52 +0000
Message-Id: <20201111155654.1430860-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjNmYyOGVkNTA3NWRmNzlmZWYzOWM1
MDAzNjJhM2Y0MDg5MjU2YzljOg0KDQogIFVwZGF0ZSB2ZXJzaW9uIGZvciB2NS4yLjAtcmMxIHJl
bGVhc2UgKDIwMjAtMTEtMTAgMjI6Mjk6NTcgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmNvbS9zdGVmYW5oYS9xZW11
LmdpdCB0YWdzL3RyYWNpbmctcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byAzNWUyOGNiMGYyMTBjYWUzZDljOTgxMTNkNTE5ZmU1YTRiZWY1ODY2Og0KDQogIHNj
cmlwdHMvdHJhY2V0b29sOiBzaWxlbmNlIFN5c3RlbVRhcCBkdHJhY2UoMSkgbG9uZyBsb25nIHdh
cm5pbmdzICgyMDIwLTExLTExIDEzOjEwOjM4ICswMDAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpUcmFjaW5nIHB1
bGwgcmVxdWVzdA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClBhb2xvIEJvbnppbmkgKDEpOg0KICB0cmFjZTogcmVt
b3ZlIGFyZ3VtZW50IGZyb20gdHJhY2VfaW5pdF9maWxlDQoNClN0ZWZhbiBIYWpub2N6aSAoMSk6
DQogIHNjcmlwdHMvdHJhY2V0b29sOiBzaWxlbmNlIFN5c3RlbVRhcCBkdHJhY2UoMSkgbG9uZyBs
b25nIHdhcm5pbmdzDQoNCiB0cmFjZS9jb250cm9sLmggICAgICAgICAgICAgICAgICAgICAgfCAx
MiArKystLS0tLS0tLS0NCiBic2QtdXNlci9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgfCAg
NiArKy0tLS0NCiBsaW51eC11c2VyL21haW4uYyAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0t
LS0NCiBxZW11LWltZy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBx
ZW11LWlvLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBxZW11LW5i
ZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBzY3NpL3FlbXUtcHIt
aGVscGVyLmMgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBzb2Z0bW11L3ZsLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCiBzdG9yYWdlLWRhZW1vbi9xZW11LXN0b3Jh
Z2UtZGFlbW9uLmMgfCAgOSArKystLS0tLS0NCiB0cmFjZS9jb250cm9sLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAxMCArKysrLS0tLS0tDQogc2NyaXB0cy90cmFjZXRvb2wvZm9ybWF0L2QucHkg
ICAgICAgIHwgIDYgKysrKysrDQogMTEgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwg
NDkgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yOC4wDQoNCg==


