Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2998262CEF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 12:19:39 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFxCU-0007e1-UR
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 06:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kFxAI-0004sY-HN
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 06:17:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kFxAD-00039w-4X
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 06:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599646636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PB9MUC0qzJVzZg8z0xCZbo7qy2QCjj1uVWnwQSxyyhw=;
 b=KAcDql9SoDdqhsGTathVIIKTP0nf0QeuN5yO/DOBG387TdWI4+V9vMOnoGkrOyUYdy0SK5
 DTFcSdkTuZWfkANlTorqIfXcuLmp125mhlQAWBbxjfSbhYXY9knj2rLMRZvoHTZASPayoK
 YO9ys1q2vDelfPo0/ysQfHJbdCe2Gww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-0DVFeZUpOiaAYXCNroE8Xg-1; Wed, 09 Sep 2020 06:17:12 -0400
X-MC-Unique: 0DVFeZUpOiaAYXCNroE8Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629AE8030A3;
 Wed,  9 Sep 2020 10:17:11 +0000 (UTC)
Received: from localhost (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8275B1002D50;
 Wed,  9 Sep 2020 10:17:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] gitmodules: switch to qemu.org meson mirror
Date: Wed,  9 Sep 2020 11:16:41 +0100
Message-Id: <20200909101642.17698-3-stefanha@redhat.com>
In-Reply-To: <20200909101642.17698-1-stefanha@redhat.com>
References: <20200909101642.17698-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 02:43:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUVNVSBub3cgaG9zdHMgYSBtaXJyb3Igb2YgbWVzb24uZ2l0LiBRRU1VIG1pcnJvcnMgdGhpcmQt
cGFydHkgY29kZSB0bwplbnN1cmUgdGhhdCB1c2VycyBjYW4gYWx3YXlzIGJ1aWxkIFFFTVUgZXZl
biBpZiB0aGUgZGVwZW5kZW5jeSBnb2VzCm9mZmxpbmUgYW5kIHNvIFFFTVUgbWVldHMgaXRzIHJl
c3BvbnNpYmlsaXRpZXMgdG8gcHJvdmlkZSBmdWxsIHNvdXJjZQpjb2RlIHVuZGVyIHNvZnR3YXJl
IGxpY2Vuc2VzLgoKU3VnZ2VzdGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmc+CkNjOiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0
LmNvbT4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiAuZ2l0bW9kdWxl
cyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhLy5naXRtb2R1bGVzIGIvLmdpdG1vZHVsZXMKaW5kZXggYjIwMTY3NTI4OC4u
YjhmOGExNDNiZiAxMDA2NDQKLS0tIGEvLmdpdG1vZHVsZXMKKysrIGIvLmdpdG1vZHVsZXMKQEAg
LTYwLDQgKzYwLDQgQEAKIAl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvcWJvb3QuZ2l0
CiBbc3VibW9kdWxlICJtZXNvbiJdCiAJcGF0aCA9IG1lc29uCi0JdXJsID0gaHR0cHM6Ly9naXRo
dWIuY29tL21lc29uYnVpbGQvbWVzb24vCisJdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0
L21lc29uLmdpdAotLSAKMi4yNi4yCgo=


