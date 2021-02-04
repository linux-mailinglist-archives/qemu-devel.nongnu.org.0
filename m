Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054630F75F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:14:02 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hGb-00041Z-8T
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7grk-0002ST-0g
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:48:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gri-00064T-8b
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Elm+TuFX86cEZJHnOdtUH41WDdgH0GHDQ+62VBM+rJQ=;
 b=OMSyS4PlTGkWS/JYHQTDCQ4CLjsgjk3UcGHSYXhCKCPZ2mC1vXkTRw4Je69G2BgGkqD2cV
 MFgk9N9j/xHSMIJMHPWwNpxuW0e6VY34dWP55EeptKTJSnzpfcdB1PtPJsze6p6XQK6RYG
 wrqu0DfS5XwlBSkVUYVEU6z/L88gtjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-WsBmyV0pM1-yBdu-8BFB4g-1; Thu, 04 Feb 2021 10:48:14 -0500
X-MC-Unique: WsBmyV0pM1-yBdu-8BFB4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0077C803F48;
 Thu,  4 Feb 2021 15:48:13 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FA9C5C257;
 Thu,  4 Feb 2021 15:48:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 27/27] docs: fix Parallels Image "dirty bitmap" section
Date: Thu,  4 Feb 2021 15:43:27 +0000
Message-Id: <20210204154327.386529-28-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogIkRlbmlzIFYuIEx1bmV2IiA8ZGVuQG9wZW52ei5vcmc+CgpPcmlnaW5hbCBzcGVjaWZp
Y2F0aW9uIHNheXMgdGhhdCBsMSB0YWJsZSBzaXplIGlmIDY0ICogbDFfc2l6ZSwgd2hpY2gKaXMg
b2J2aW91c2x5IHdyb25nLiBUaGUgc2l6ZSBvZiB0aGUgbDEgZW50cnkgaXMgNjQgX2JpdHNfLCBu
b3QgYnl0ZXMuClRodXMgNjQgaXMgdG8gYmUgcmVwbGFjZXMgd2l0aCA4IGFzIHNwZWNpZmljYXRp
b24gc2F5cyBhYm91dCBieXRlcy4KClRoZXJlIGlzIGFsc28gbWlub3IgdHdlYWssIGZpZWxkIG5h
bWUgaXMgcmVuYW1lZCBmcm9tIGwxIHRvIGwxX3RhYmxlLAp3aGljaCBtYXRjaGVzIHdpdGggdGhl
IGxhdGVyIHRleHQuCgpTaWduZWQtb2ZmLWJ5OiBEZW5pcyBWLiBMdW5ldiA8ZGVuQG9wZW52ei5v
cmc+ClJldmlld2VkLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjEwMTI4MTcxMzEzLjIyMTA5NDctMS1kZW5A
b3BlbnZ6Lm9yZwpDQzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpDQzog
VmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgoK
W1JlcGxhY2UgdGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlICJkb2NzOiBmaXggbWlzdGFrZSBp
biBkaXJ0eSBiaXRtYXAKZmVhdHVyZSBkZXNjcmlwdGlvbiIgYXMgc3VnZ2VzdGVkIGJ5IEVyaWMg
Qmxha2UuCi0tU3RlZmFuXQoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5o
YUByZWRoYXQuY29tPgotLS0KIGRvY3MvaW50ZXJvcC9wYXJhbGxlbHMudHh0IHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZG9jcy9pbnRlcm9wL3BhcmFsbGVscy50eHQgYi9kb2NzL2ludGVyb3AvcGFyYWxsZWxzLnR4dApp
bmRleCBlOTI3MWViYTVkLi5mMTViZjM1YmQxIDEwMDY0NAotLS0gYS9kb2NzL2ludGVyb3AvcGFy
YWxsZWxzLnR4dAorKysgYi9kb2NzL2ludGVyb3AvcGFyYWxsZWxzLnR4dApAQCAtMjA4LDcgKzIw
OCw3IEBAIG9mIGl0cyBkYXRhIGFyZWEgYXJlOgogICAyOCAtIDMxOiAgICBsMV9zaXplCiAgICAg
ICAgICAgICAgIFRoZSBudW1iZXIgb2YgZW50cmllcyBpbiB0aGUgTDEgdGFibGUgb2YgdGhlIGJp
dG1hcC4KIAotICB2YXJpYWJsZTogICBsMSAoNjQgKiBsMV9zaXplIGJ5dGVzKQorICB2YXJpYWJs
ZTogICBsMV90YWJsZSAoOCAqIGwxX3NpemUgYnl0ZXMpCiAgICAgICAgICAgICAgIEwxIG9mZnNl
dCB0YWJsZSAoaW4gYnl0ZXMpCiAKIEEgZGlydHkgYml0bWFwIGlzIHN0b3JlZCB1c2luZyBhIG9u
ZS1sZXZlbCBzdHJ1Y3R1cmUgZm9yIHRoZSBtYXBwaW5nIHRvIGhvc3QKLS0gCjIuMjkuMgoK


