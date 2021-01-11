Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3372F11F5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:56:23 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvo6-0006Db-BI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvit-0001Nm-UT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvir-0006t3-Lv
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foEz25oRSlk1MQCgKmvxVTdCtAxHJ50PLba1apEi/mc=;
 b=iLBW1+lCYy6s/hYMNr7WC18BC8gEDuHfj0Yz+HXGTWP+Ufwk0tDSrDOElVRLEvb6RITX2S
 BF30KuyKrb9lDUmPZGkTDiM+0cyOeurpWOyBNkCfMcd9zQrr89rduCnKcmhFxKLTT8kzGI
 OIklG8MU0BFKc8cSP3sCU7Mu17js1/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-D_H83ql-Oa-ccg8WGa43mQ-1; Mon, 11 Jan 2021 06:50:54 -0500
X-MC-Unique: D_H83ql-Oa-ccg8WGa43mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5283B425C8;
 Mon, 11 Jan 2021 11:50:53 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F22F60854;
 Mon, 11 Jan 2021 11:50:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] docs: update README to use GitLab repo URLs
Date: Mon, 11 Jan 2021 11:50:15 +0000
Message-Id: <20210111115017.156802-5-stefanha@redhat.com>
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cWVtdS5vcmcgaXMgcnVubmluZyBvdXQgb2YgYmFuZHdpZHRoIGFuZCB0aGUgUUVNVSBwcm9qZWN0
IGlzIG1vdmluZwp0b3dhcmRzIGEgZ2F0aW5nIENJIG9uIEdpdExhYi4gVXNlIHRoZSBHaXRMYWIg
cmVwb3MgaW5zdGVhZCBvZiBxZW11Lm9yZwoodGhleSB3aWxsIGJlY29tZSBtaXJyb3JzKS4KClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBS
RUFETUUucnN0IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL1JFQURNRS5yc3QgYi9SRUFETUUucnN0CmluZGV4IDU4
YjlmMmRjMTUuLmNlMzlkODkwNzcgMTAwNjQ0Ci0tLSBhL1JFQURNRS5yc3QKKysrIGIvUkVBRE1F
LnJzdApAQCAtNjAsNyArNjAsNyBAQCBUaGUgUUVNVSBzb3VyY2UgY29kZSBpcyBtYWludGFpbmVk
IHVuZGVyIHRoZSBHSVQgdmVyc2lvbiBjb250cm9sIHN5c3RlbS4KIAogLi4gY29kZS1ibG9jazo6
IHNoZWxsCiAKLSAgIGdpdCBjbG9uZSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvcWVtdS5naXQK
KyAgIGdpdCBjbG9uZSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUuZ2l0CiAK
IFdoZW4gc3VibWl0dGluZyBwYXRjaGVzLCBvbmUgY29tbW9uIGFwcHJvYWNoIGlzIHRvIHVzZSAn
Z2l0CiBmb3JtYXQtcGF0Y2gnIGFuZC9vciAnZ2l0IHNlbmQtZW1haWwnIHRvIGZvcm1hdCAmIHNl
bmQgdGhlIG1haWwgdG8gdGhlCkBAIC03OCw3ICs3OCw3IEBAIFRoZSBRRU1VIHdlYnNpdGUgaXMg
YWxzbyBtYWludGFpbmVkIHVuZGVyIHNvdXJjZSBjb250cm9sLgogCiAuLiBjb2RlLWJsb2NrOjog
c2hlbGwKIAotICBnaXQgY2xvbmUgaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3FlbXUtd2ViLmdp
dAorICBnaXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LXdlYi5n
aXQKIAogKiBgPGh0dHBzOi8vd3d3LnFlbXUub3JnLzIwMTcvMDIvMDQvdGhlLW5ldy1xZW11LXdl
YnNpdGUtaXMtdXAvPmBfCiAKLS0gCjIuMjkuMgoK


