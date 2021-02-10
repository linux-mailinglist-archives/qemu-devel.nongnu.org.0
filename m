Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F097F316278
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:39:04 +0100 (CET)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9lxg-00057o-1P
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmc-0002Rh-RP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmY-0005n0-MK
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612949253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYnIq/muqE70iM1x9gQTQYntCfkvidF7ScJ3ch1Fm1Y=;
 b=EP88sb3KYHj99Dz0LfE5pI2AoPELPyUlRPwFl2raAIjP4UIcKD5atVRMpOlLbgKRLDUSPb
 SYsbTUT/T+L+0HwWk7+f0KBpRycUjRqdytNE303rDPcdYkNYdQNAiun30j0c4TbzNLiwSf
 1UeRH5zeoCDLhwZdzrzmwnRjNeOsR+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-wG8TEhFfP6usUKY7uXx0WA-1; Wed, 10 Feb 2021 04:27:29 -0500
X-MC-Unique: wG8TEhFfP6usUKY7uXx0WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 399B2C73A5;
 Wed, 10 Feb 2021 09:27:28 +0000 (UTC)
Received: from localhost (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C431610013D7;
 Wed, 10 Feb 2021 09:27:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v4 05/27] pc-bios: update mirror URLs to GitLab
Date: Wed, 10 Feb 2021 09:26:06 +0000
Message-Id: <20210210092628.193785-6-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 thuth@redhat.com, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


