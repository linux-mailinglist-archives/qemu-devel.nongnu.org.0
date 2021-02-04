Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA830F6D4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:55:01 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gyC-0000qh-3s
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7goB-0007eM-1q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7go7-0004f8-Oo
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYnIq/muqE70iM1x9gQTQYntCfkvidF7ScJ3ch1Fm1Y=;
 b=MJaECFIMgWEu8rGvyugM+h+cZ+pmrK+mIQO0egLrLk5Qz8j4eewAlygIkxK9MNFzQNHPB8
 oI8XFD+Iwdc8YIjrQwk/th/DYLRdp0h9hvZhvK976I++JYaqsbxdMUhF0uoETjjtTW2UTU
 oCZNDP11qUh229Q0HdIgLJVaHEtiIp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-wnFwAfJhPZ-EzrH4hFwggg-1; Thu, 04 Feb 2021 10:44:28 -0500
X-MC-Unique: wnFwAfJhPZ-EzrH4hFwggg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 977D5801965;
 Thu,  4 Feb 2021 15:44:26 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92E8860BE2;
 Thu,  4 Feb 2021 15:44:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 05/27] pc-bios: update mirror URLs to GitLab
Date: Thu,  4 Feb 2021 15:43:05 +0000
Message-Id: <20210204154327.386529-6-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
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

cWVtdS5vcmcgaXMgcnVubmluZyBvdXQgb2YgYmFuZHdpZHRoIGFuZCB0aGUgUUVNVSBwcm9qZWN0
IGlzIG1vdmluZwp0b3dhcmRzIGEgZ2F0aW5nIENJIG9uIEdpdExhYi4gVXNlIHRoZSBHaXRMYWIg
cmVwb3MgaW5zdGVhZCBvZiBxZW11Lm9yZwoodGhleSB3aWxsIGJlY29tZSBtaXJyb3JzKS4KClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IFdhaW5lciBkb3MgU2FudG9zIE1vc2NoZXR0YSA8d2FpbmVyc21AcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAy
MDIxMDExMTExNTAxNy4xNTY4MDItNi1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBwYy1iaW9zL1JFQURN
RSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYy1iaW9zL1JFQURNRSBiL3BjLWJpb3MvUkVBRE1FCmluZGV4IDMz
Zjk3NTRhZDMuLmRiNzEyOWVmNjQgMTAwNjQ0Ci0tLSBhL3BjLWJpb3MvUkVBRE1FCisrKyBiL3Bj
LWJpb3MvUkVBRE1FCkBAIC0yMCw3ICsyMCw3IEBACiAgIGxlZ2FjeSB4ODYgc29mdHdhcmUgdG8g
Y29tbXVuaWNhdGUgd2l0aCBhbiBhdHRhY2hlZCBzZXJpYWwgY29uc29sZSBhcwogICBpZiBhIHZp
ZGVvIGNhcmQgd2VyZSBhdHRhY2hlZC4gIFRoZSBtYXN0ZXIgc291cmNlcyByZXNpZGUgaW4gYSBz
dWJ2ZXJzaW9uCiAgIHJlcG9zaXRvcnkgYXQgaHR0cDovL3NnYWJpb3MuZ29vZ2xlY29kZS5jb20v
c3ZuL3RydW5rLiAgQSBnaXQgbWlycm9yIGlzCi0gIGF2YWlsYWJsZSBhdCBodHRwczovL2dpdC5x
ZW11Lm9yZy9naXQvc2dhYmlvcy5naXQuCisgIGF2YWlsYWJsZSBhdCBodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3NnYWJpb3MuZ2l0LgogCiAtIFRoZSBQWEUgcm9tcyBjb21lIGZyb20g
dGhlIGlQWEUgcHJvamVjdC4gQnVpbHQgd2l0aCBCQU5ORVJfVElNRSAwLgogICBTb3VyY2VzIGF2
YWlsYWJsZSBhdCBodHRwOi8vaXB4ZS5vcmcuICBWZW5kb3I6RGV2aWNlIElEIC0+IFJPTSBtYXBw
aW5nOgpAQCAtMzcsNyArMzcsNyBAQAogCiAtIFRoZSB1LWJvb3QgYmluYXJ5IGZvciBlNTAwIGNv
bWVzIGZyb20gdGhlIHVwc3RyZWFtIGRlbnggdS1ib290IHByb2plY3Qgd2hlcmUKICAgaXQgd2Fz
IGNvbXBpbGVkIHVzaW5nIHRoZSBxZW11LXBwY2U1MDAgdGFyZ2V0LgotICBBIGdpdCBtaXJyb3Ig
aXMgYXZhaWxhYmxlIGF0OiBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvdS1ib290LmdpdAorICBB
IGdpdCBtaXJyb3IgaXMgYXZhaWxhYmxlIGF0OiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9q
ZWN0L3UtYm9vdC5naXQKICAgVGhlIGhhc2ggdXNlZCB0byBjb21waWxlIHRoZSBjdXJyZW50IHZl
cnNpb24gaXM6IDIwNzJlNzIKIAogLSBTa2lib290IChodHRwczovL2dpdGh1Yi5jb20vb3Blbi1w
b3dlci9za2lib290LykgaXMgYW4gT1BBTAotLSAKMi4yOS4yCgo=


