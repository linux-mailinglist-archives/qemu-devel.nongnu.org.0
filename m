Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D818310E68
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:14:17 +0100 (CET)
Received: from localhost ([::1]:38278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84gS-0005Vq-FS
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84JP-00057k-5d
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:50:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84JJ-0007wa-QD
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Elm+TuFX86cEZJHnOdtUH41WDdgH0GHDQ+62VBM+rJQ=;
 b=A5Zuk2SD/E+kPLStGhjg1hLLAoVYasvypPVQ6MsXus+/BueFZEzXG9s8yJOjBcZe7e5KRV
 6/1W0pkGQt8x852HobfdCbO8i4me+FAf++clTQuSFz3oQzpxkPjcQNiKzc+knfaZNwTzdH
 VftXEfZ4cp3LdeLPo2irftdKVjMx92E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-Pff99UfMPES3fa7GSz_gyA-1; Fri, 05 Feb 2021 11:50:18 -0500
X-MC-Unique: Pff99UfMPES3fa7GSz_gyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB10804023;
 Fri,  5 Feb 2021 16:50:16 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFAF619727;
 Fri,  5 Feb 2021 16:50:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v3 27/27] docs: fix Parallels Image "dirty bitmap" section
Date: Fri,  5 Feb 2021 16:44:59 +0000
Message-Id: <20210205164459.432714-28-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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


