Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4A1D918F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 10:02:55 +0200 (CEST)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaxDC-0005n4-3a
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 04:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jaxBm-0004AK-NK
 for qemu-devel@nongnu.org; Tue, 19 May 2020 04:01:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53619
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jaxBl-0001Yi-V0
 for qemu-devel@nongnu.org; Tue, 19 May 2020 04:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589875285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kercReWlZ2KhPw8IavTNPyATttTJZan4+XkgSZ5rfc=;
 b=Ccfm/fHvaCvvBL6FFfss4Q6R/3ReTjUjIMFIXnNMfcOIBWSLOFdmzgE7YZcAiF4FtJEiBP
 7Md0/e+Tzrm8CLsLjRUOi0NgAv5+WpGAF03kcync13UFQMaTzbF2CQqJqHimT/UyYBPfIU
 dJRoDuKBvuC9sDdFuuTil7JPIu1BIGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-n2S0Iw9JPWmmY1FnM3fKww-1; Tue, 19 May 2020 04:01:21 -0400
X-MC-Unique: n2S0Iw9JPWmmY1FnM3fKww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6B061800720;
 Tue, 19 May 2020 08:01:19 +0000 (UTC)
Received: from localhost (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC13010013D9;
 Tue, 19 May 2020 08:01:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] Makefile: List fuzz targets in 'make help'
Date: Tue, 19 May 2020 09:00:48 +0100
Message-Id: <20200519080054.146495-3-stefanha@redhat.com>
In-Reply-To: <20200519080054.146495-1-stefanha@redhat.com>
References: <20200519080054.146495-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKTGlzdCBz
b2Z0bW11IGZ1enogdGFyZ2V0cyBpbiAnbWFrZSBoZWxwJyBvdXRwdXQ6CgogICQgbWFrZSBoZWxw
CiAgLi4uCiAgQXJjaGl0ZWN0dXJlIHNwZWNpZmljIHRhcmdldHM6CiAgYWFyY2g2NC1zb2Z0bW11
L2FsbCAgICAgICAgICAgIC0gQnVpbGQgZm9yIGFhcmNoNjQtc29mdG1tdQogIGFhcmNoNjQtc29m
dG1tdS9mdXp6ICAgICAgICAgICAtIEJ1aWxkIGZ1enplciBmb3IgYWFyY2g2NC1zb2Z0bW11CiAg
YWxwaGEtc29mdG1tdS9hbGwgICAgICAgICAgICAgIC0gQnVpbGQgZm9yIGFscGhhLXNvZnRtbXUK
ICBhbHBoYS1zb2Z0bW11L2Z1enogICAgICAgICAgICAgLSBCdWlsZCBmdXp6ZXIgZm9yIGFscGhh
LXNvZnRtbXUKICBhcm0tc29mdG1tdS9hbGwgICAgICAgICAgICAgICAgLSBCdWlsZCBmb3IgYXJt
LXNvZnRtbXUKICBhcm0tc29mdG1tdS9mdXp6ICAgICAgICAgICAgICAgLSBCdWlsZCBmdXp6ZXIg
Zm9yIGFybS1zb2Z0bW11CiAgLi4uCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwNTE0MTQzNDMzLjE4NTY5
LTMtcGhpbG1kQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgotLS0KIE1ha2VmaWxlIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBi
L01ha2VmaWxlCmluZGV4IDM0Mjc1ZjU3YzkuLjQwZTRmNzY3N2IgMTAwNjQ0Ci0tLSBhL01ha2Vm
aWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMjUyLDcgKzEyNTIsMTEgQEAgZW5kaWYKIAlAJChpZiAk
KFRBUkdFVF9ESVJTKSwgXAogCQllY2hvICdBcmNoaXRlY3R1cmUgc3BlY2lmaWMgdGFyZ2V0czon
OyBcCiAJCSQoZm9yZWFjaCB0LCAkKFRBUkdFVF9ESVJTKSwgXAotCQkkKGNhbGwgcHJpbnQtaGVs
cC1ydW4sJCh0KS9hbGwsQnVpbGQgZm9yICQodCkpOykgXAorCQkkKGNhbGwgcHJpbnQtaGVscC1y
dW4sJCh0KS9hbGwsQnVpbGQgZm9yICQodCkpOyBcCisJCSQoaWYgJChDT05GSUdfRlVaWiksIFwK
KwkJCSQoaWYgJChmaW5kc3RyaW5nIHNvZnRtbXUsJCh0KSksIFwKKwkJCQkkKGNhbGwgcHJpbnQt
aGVscC1ydW4sJCh0KS9mdXp6LEJ1aWxkIGZ1enplciBmb3IgJCh0KSk7IFwKKwkJKSkpIFwKIAkJ
ZWNobyAnJykKIAlAJChpZiAkKFRPT0xTKSwgXAogCQllY2hvICdUb29scyB0YXJnZXRzOic7IFwK
LS0gCjIuMjUuMwoK


