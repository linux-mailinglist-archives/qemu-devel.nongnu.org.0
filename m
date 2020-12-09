Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBB2D4023
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:42:02 +0100 (CET)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwv3-0006X5-Uz
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwra-0003ea-1N
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwrY-0007YT-Ch
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607510303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FFZucyiN8e3EVU9t97lvTtOxjCtUDTOCND4Sc1aaDU=;
 b=iXcHuGz/LK/n928Gv4hG3u1CQlasSAaY548vskAqgBDosriD3vA1JDeTFXzGtWrWicwlEw
 PKaSAd4pEpJhpi7YY7ijyHv9fb242ZsmrP83FcVsjymUHX/t9oOW5kDtZPVOn84RFgTaUR
 kJJBAWbcOjsV2On0zX3LQGKwJyU9BLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-M4SNVbhlMbC7xRjgIAkzwA-1; Wed, 09 Dec 2020 05:38:20 -0500
X-MC-Unique: M4SNVbhlMbC7xRjgIAkzwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02E6D1005504;
 Wed,  9 Dec 2020 10:38:19 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A156064B;
 Wed,  9 Dec 2020 10:38:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] MAINTAINERS: add Kevin Wolf as storage daemon
 maintainer
Date: Wed,  9 Dec 2020 10:38:02 +0000
Message-Id: <20201209103802.350848-4-stefanha@redhat.com>
In-Reply-To: <20201209103802.350848-1-stefanha@redhat.com>
References: <20201209103802.350848-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIE1BSU5UQUlORVJTIGZpbGUgd2FzIG5vdCB1cGRhdGVkIHdoZW4gdGhlIHN0b3JhZ2UgZGFl
bW9uIHdhcyBtZXJnZWQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpSZXZp
ZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0K
IE1BSU5UQUlORVJTIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDY4YmMxNjBm
NDEuLjg2NzY3MzBjYzkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC0yMTQ2LDYgKzIxNDYsMTUgQEAgRjogcW9iamVjdC9ibG9jay1xZGljdC5jCiBGOiB0ZXN0
cy9jaGVjay1ibG9jay1xZGljdC5jCiBUOiBnaXQgaHR0cHM6Ly9yZXBvLm9yLmN6L3FlbXUva2V2
aW4uZ2l0IGJsb2NrCiAKK1N0b3JhZ2UgZGFlbW9uCitNOiBLZXZpbiBXb2xmIDxrd29sZkByZWRo
YXQuY29tPgorTDogcWVtdS1ibG9ja0Bub25nbnUub3JnCitTOiBTdXBwb3J0ZWQKK0Y6IHN0b3Jh
Z2UtZGFlbW9uLworRjogZG9jcy9pbnRlcm9wL3FlbXUtc3RvcmFnZS1kYWVtb24tcW1wLXJlZi5y
c3QKK0Y6IGRvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5yc3QKK1Q6IGdpdCBodHRwczov
L3JlcG8ub3IuY3ovcWVtdS9rZXZpbi5naXQgYmxvY2sKKwogQmxvY2sgSS9PIHBhdGgKIE06IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KIE06IEZhbSBaaGVuZyA8ZmFtQGV1
cGhvbi5uZXQ+Ci0tIAoyLjI4LjAKCg==


