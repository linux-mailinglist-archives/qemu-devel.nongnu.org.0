Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E638B2F11F0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:54:37 +0100 (CET)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvmP-0004OU-1P
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyviw-0001Tk-OH
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyviu-0006ug-PJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8oZ40uuTfpEFn4M/n8M30DZl635hS9uL0mhIHhzZmQ=;
 b=SB8WObajnyMb6JmNnRJHjtnXfaHcp3te0sGHllFYHSz99p/kwEmUzfQ21A5uz56o56OWn7
 xhTjgvusdk93GJhNYIKOn9KrOIuQAkK8zERAnPa8qYtHcDxEq6eoWabui6AwG+8LRZzbmu
 dxpNEJMulbwK21wm56/zh/gbj1XTYzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-qdxo-1-4MxK9WI8k8rrCfA-1; Mon, 11 Jan 2021 06:50:56 -0500
X-MC-Unique: qdxo-1-4MxK9WI8k8rrCfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 038C418C8C00;
 Mon, 11 Jan 2021 11:50:55 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D88060C67;
 Mon, 11 Jan 2021 11:50:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] pc-bios: update mirror URLs to GitLab
Date: Mon, 11 Jan 2021 11:50:16 +0000
Message-Id: <20210111115017.156802-6-stefanha@redhat.com>
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBw
Yy1iaW9zL1JFQURNRSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYy1iaW9zL1JFQURNRSBiL3BjLWJpb3MvUkVB
RE1FCmluZGV4IDMzZjk3NTRhZDMuLmRiNzEyOWVmNjQgMTAwNjQ0Ci0tLSBhL3BjLWJpb3MvUkVB
RE1FCisrKyBiL3BjLWJpb3MvUkVBRE1FCkBAIC0yMCw3ICsyMCw3IEBACiAgIGxlZ2FjeSB4ODYg
c29mdHdhcmUgdG8gY29tbXVuaWNhdGUgd2l0aCBhbiBhdHRhY2hlZCBzZXJpYWwgY29uc29sZSBh
cwogICBpZiBhIHZpZGVvIGNhcmQgd2VyZSBhdHRhY2hlZC4gIFRoZSBtYXN0ZXIgc291cmNlcyBy
ZXNpZGUgaW4gYSBzdWJ2ZXJzaW9uCiAgIHJlcG9zaXRvcnkgYXQgaHR0cDovL3NnYWJpb3MuZ29v
Z2xlY29kZS5jb20vc3ZuL3RydW5rLiAgQSBnaXQgbWlycm9yIGlzCi0gIGF2YWlsYWJsZSBhdCBo
dHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2dhYmlvcy5naXQuCisgIGF2YWlsYWJsZSBhdCBodHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3NnYWJpb3MuZ2l0LgogCiAtIFRoZSBQWEUgcm9t
cyBjb21lIGZyb20gdGhlIGlQWEUgcHJvamVjdC4gQnVpbHQgd2l0aCBCQU5ORVJfVElNRSAwLgog
ICBTb3VyY2VzIGF2YWlsYWJsZSBhdCBodHRwOi8vaXB4ZS5vcmcuICBWZW5kb3I6RGV2aWNlIElE
IC0+IFJPTSBtYXBwaW5nOgpAQCAtMzcsNyArMzcsNyBAQAogCiAtIFRoZSB1LWJvb3QgYmluYXJ5
IGZvciBlNTAwIGNvbWVzIGZyb20gdGhlIHVwc3RyZWFtIGRlbnggdS1ib290IHByb2plY3Qgd2hl
cmUKICAgaXQgd2FzIGNvbXBpbGVkIHVzaW5nIHRoZSBxZW11LXBwY2U1MDAgdGFyZ2V0LgotICBB
IGdpdCBtaXJyb3IgaXMgYXZhaWxhYmxlIGF0OiBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvdS1i
b290LmdpdAorICBBIGdpdCBtaXJyb3IgaXMgYXZhaWxhYmxlIGF0OiBodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3UtYm9vdC5naXQKICAgVGhlIGhhc2ggdXNlZCB0byBjb21waWxlIHRo
ZSBjdXJyZW50IHZlcnNpb24gaXM6IDIwNzJlNzIKIAogLSBTa2lib290IChodHRwczovL2dpdGh1
Yi5jb20vb3Blbi1wb3dlci9za2lib290LykgaXMgYW4gT1BBTAotLSAKMi4yOS4yCgo=


