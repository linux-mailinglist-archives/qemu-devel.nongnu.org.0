Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641A264837
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 16:47:11 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGNqw-0005j6-NB
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 10:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGNp0-0003l2-8b
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 10:45:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56215
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGNoy-0001bb-Fb
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 10:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599749107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4lbOZwjOpfMKhU2MmGHVACehC+nXofvmDFrjq43DOxg=;
 b=AQBK/96vDlamGPd5UmXIg+ni5o56VWTnpxrfUF32kYnAcT4xnzUw1gVQqZj8WTvyLN8+Jj
 GPZT5XQoS9BeYLx/jxqcTzdd0yLNPuT75NYMTugYOdIlEAAmuXeQB1aLIpAFz7VH45t45X
 OJVbGaE+HN7ix4H8eG4fLfMaMW/uaIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-2G9bI2hCOzyDRTfoXPVe_g-1; Thu, 10 Sep 2020 10:45:03 -0400
X-MC-Unique: 2G9bI2hCOzyDRTfoXPVe_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58ABAE2A0;
 Thu, 10 Sep 2020 14:44:53 +0000 (UTC)
Received: from localhost (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B64B19C59;
 Thu, 10 Sep 2020 14:44:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] MAINTAINERS: add Kevin Wolf as storage daemon
 maintainer
Date: Thu, 10 Sep 2020 15:44:00 +0100
Message-Id: <20200910144400.69615-4-stefanha@redhat.com>
In-Reply-To: <20200910144400.69615-1-stefanha@redhat.com>
References: <20200910144400.69615-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
 afrosi@redhat.com, Laszlo Ersek <lersek@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIE1BSU5UQUlORVJTIGZpbGUgd2FzIG5vdCB1cGRhdGVkIHdoZW4gdGhlIHN0b3JhZ2UgZGFl
bW9uIHdhcyBtZXJnZWQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKaW5kZXggN2QwYTVlOTFlNC4uZWI4MGI2YzU0OCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMK
KysrIGIvTUFJTlRBSU5FUlMKQEAgLTIwOTksNiArMjA5OSwxNSBAQCBGOiBxb2JqZWN0L2Jsb2Nr
LXFkaWN0LmMKIEY6IHRlc3RzL2NoZWNrLWJsb2NrLXFkaWN0LmMKIFQ6IGdpdCBodHRwczovL3Jl
cG8ub3IuY3ovcWVtdS9rZXZpbi5naXQgYmxvY2sKIAorU3RvcmFnZSBkYWVtb24KK006IEtldmlu
IFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+CitMOiBxZW11LWJsb2NrQG5vbmdudS5vcmcKK1M6IFN1
cHBvcnRlZAorRjogc3RvcmFnZS1kYWVtb24vCitGOiBkb2NzL2ludGVyb3AvcWVtdS1zdG9yYWdl
LWRhZW1vbi1xbXAtcmVmLnRleGkKK0Y6IGRvY3MvdG9vbHMvcWVtdS1zdG9yYWdlLWRhZW1vbi5y
c3QKK1Q6IGdpdCBodHRwczovL3JlcG8ub3IuY3ovcWVtdS9rZXZpbi5naXQgYmxvY2sKKwogQmxv
Y2sgSS9PIHBhdGgKIE06IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KIE06
IEZhbSBaaGVuZyA8ZmFtQGV1cGhvbi5uZXQ+Ci0tIAoyLjI2LjIKCg==


