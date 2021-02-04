Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47D30F01E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:05:10 +0100 (CET)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bVd-0008Gw-Av
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bQ1-0002wc-Tc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bPx-0000Lc-8g
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01i+kpkwSJc1SA3D/v6Q/qm7cYss6yolEeqBEbsHGpE=;
 b=GiE4SumtEQgoKU7tEJm5c0qH8tjQxxwBnCX8LqvK6VkRGP+ODP1M1aWL1qgNP+bF6+BXJ2
 9xMQhdgkeV8TwiIbzOABYorBu4HTJ0Bs2qXlF5cwWCNfjG9i7HV80SSXCm8pno+w7IKB8i
 HNsHZMsEB6Wnxpdy2DhOdg8/GtXZJSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-urWbbUR3NwCOW7ocmjSb7Q-1; Thu, 04 Feb 2021 04:59:07 -0500
X-MC-Unique: urWbbUR3NwCOW7ocmjSb7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B13B9801962;
 Thu,  4 Feb 2021 09:59:05 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 470591FBC1;
 Thu,  4 Feb 2021 09:58:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/27] gitmodules: use GitLab repos instead of qemu.org
Date: Thu,  4 Feb 2021 09:58:09 +0000
Message-Id: <20210204095834.345749-3-stefanha@redhat.com>
In-Reply-To: <20210204095834.345749-1-stefanha@redhat.com>
References: <20210204095834.345749-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
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
MDIxMDExMTExNTAxNy4xNTY4MDItMy1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiAuZ2l0bW9kdWxlcyB8
IDQ0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
LmdpdG1vZHVsZXMgYi8uZ2l0bW9kdWxlcwppbmRleCAyYmRlZWFjZWY4Li4wOGIxYjQ4YTA5IDEw
MDY0NAotLS0gYS8uZ2l0bW9kdWxlcworKysgYi8uZ2l0bW9kdWxlcwpAQCAtMSw2NiArMSw2NiBA
QAogW3N1Ym1vZHVsZSAicm9tcy9zZWFiaW9zIl0KIAlwYXRoID0gcm9tcy9zZWFiaW9zCi0JdXJs
ID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3NlYWJpb3MuZ2l0LworCXVybCA9IGh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3Qvc2VhYmlvcy5naXQvCiBbc3VibW9kdWxlICJyb21zL1NM
T0YiXQogCXBhdGggPSByb21zL1NMT0YKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQv
U0xPRi5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L1NMT0YuZ2l0
CiBbc3VibW9kdWxlICJyb21zL2lweGUiXQogCXBhdGggPSByb21zL2lweGUKLQl1cmwgPSBodHRw
czovL2dpdC5xZW11Lm9yZy9naXQvaXB4ZS5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20v
cWVtdS1wcm9qZWN0L2lweGUuZ2l0CiBbc3VibW9kdWxlICJyb21zL29wZW5iaW9zIl0KIAlwYXRo
ID0gcm9tcy9vcGVuYmlvcwotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9vcGVuYmlv
cy5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L29wZW5iaW9zLmdp
dAogW3N1Ym1vZHVsZSAicm9tcy9xZW11LXBhbGNvZGUiXQogCXBhdGggPSByb21zL3FlbXUtcGFs
Y29kZQotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9xZW11LXBhbGNvZGUuZ2l0CisJ
dXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LXBhbGNvZGUuZ2l0CiBb
c3VibW9kdWxlICJyb21zL3NnYWJpb3MiXQogCXBhdGggPSByb21zL3NnYWJpb3MKLQl1cmwgPSBo
dHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2dhYmlvcy5naXQKKwl1cmwgPSBodHRwczovL2dpdGxh
Yi5jb20vcWVtdS1wcm9qZWN0L3NnYWJpb3MuZ2l0CiBbc3VibW9kdWxlICJkdGMiXQogCXBhdGgg
PSBkdGMKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvZHRjLmdpdAorCXVybCA9IGh0
dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvZHRjLmdpdAogW3N1Ym1vZHVsZSAicm9tcy91
LWJvb3QiXQogCXBhdGggPSByb21zL3UtYm9vdAotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3Jn
L2dpdC91LWJvb3QuZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC91
LWJvb3QuZ2l0CiBbc3VibW9kdWxlICJyb21zL3NraWJvb3QiXQogCXBhdGggPSByb21zL3NraWJv
b3QKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2tpYm9vdC5naXQKKwl1cmwgPSBo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3NraWJvb3QuZ2l0CiBbc3VibW9kdWxlICJy
b21zL1FlbXVNYWNEcml2ZXJzIl0KIAlwYXRoID0gcm9tcy9RZW11TWFjRHJpdmVycwotCXVybCA9
IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9RZW11TWFjRHJpdmVycy5naXQKKwl1cmwgPSBodHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L1FlbXVNYWNEcml2ZXJzLmdpdAogW3N1Ym1vZHVs
ZSAidWkva2V5Y29kZW1hcGRiIl0KIAlwYXRoID0gdWkva2V5Y29kZW1hcGRiCi0JdXJsID0gaHR0
cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2tleWNvZGVtYXBkYi5naXQKKwl1cmwgPSBodHRwczovL2dp
dGxhYi5jb20vcWVtdS1wcm9qZWN0L2tleWNvZGVtYXBkYi5naXQKIFtzdWJtb2R1bGUgImNhcHN0
b25lIl0KIAlwYXRoID0gY2Fwc3RvbmUKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQv
Y2Fwc3RvbmUuZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9jYXBz
dG9uZS5naXQKIFtzdWJtb2R1bGUgInJvbXMvc2VhYmlvcy1ocHBhIl0KIAlwYXRoID0gcm9tcy9z
ZWFiaW9zLWhwcGEKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2VhYmlvcy1ocHBh
LmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qvc2VhYmlvcy1ocHBh
LmdpdAogW3N1Ym1vZHVsZSAicm9tcy91LWJvb3Qtc2FtNDYwZXgiXQogCXBhdGggPSByb21zL3Ut
Ym9vdC1zYW00NjBleAotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC91LWJvb3Qtc2Ft
NDYwZXguZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC91LWJvb3Qt
c2FtNDYwZXguZ2l0CiBbc3VibW9kdWxlICJ0ZXN0cy9mcC9iZXJrZWxleS10ZXN0ZmxvYXQtMyJd
CiAJcGF0aCA9IHRlc3RzL2ZwL2JlcmtlbGV5LXRlc3RmbG9hdC0zCi0JdXJsID0gaHR0cHM6Ly9n
aXQucWVtdS5vcmcvZ2l0L2JlcmtlbGV5LXRlc3RmbG9hdC0zLmdpdAorCXVybCA9IGh0dHBzOi8v
Z2l0bGFiLmNvbS9xZW11LXByb2plY3QvYmVya2VsZXktdGVzdGZsb2F0LTMuZ2l0CiBbc3VibW9k
dWxlICJ0ZXN0cy9mcC9iZXJrZWxleS1zb2Z0ZmxvYXQtMyJdCiAJcGF0aCA9IHRlc3RzL2ZwL2Jl
cmtlbGV5LXNvZnRmbG9hdC0zCi0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2Jlcmtl
bGV5LXNvZnRmbG9hdC0zLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2pl
Y3QvYmVya2VsZXktc29mdGZsb2F0LTMuZ2l0CiBbc3VibW9kdWxlICJyb21zL2VkazIiXQogCXBh
dGggPSByb21zL2VkazIKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvZWRrMi5naXQK
Kwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L2VkazIuZ2l0CiBbc3VibW9k
dWxlICJzbGlycCJdCiAJcGF0aCA9IHNsaXJwCi0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcv
Z2l0L2xpYnNsaXJwLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qv
bGlic2xpcnAuZ2l0CiBbc3VibW9kdWxlICJyb21zL29wZW5zYmkiXQogCXBhdGggPSByb21zL29w
ZW5zYmkKLQl1cmwgPSAJaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L29wZW5zYmkuZ2l0CisJdXJs
ID0gCWh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qvb3BlbnNiaS5naXQKIFtzdWJtb2R1
bGUgInJvbXMvcWJvb3QiXQogCXBhdGggPSByb21zL3Fib290Ci0JdXJsID0gaHR0cHM6Ly9naXQu
cWVtdS5vcmcvZ2l0L3Fib290LmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXBy
b2plY3QvcWJvb3QuZ2l0CiBbc3VibW9kdWxlICJtZXNvbiJdCiAJcGF0aCA9IG1lc29uCi0JdXJs
ID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L21lc29uLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0
bGFiLmNvbS9xZW11LXByb2plY3QvbWVzb24uZ2l0CiBbc3VibW9kdWxlICJyb21zL3Zib290cm9t
Il0KIAlwYXRoID0gcm9tcy92Ym9vdHJvbQotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dp
dC92Ym9vdHJvbS5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3Zi
b290cm9tLmdpdAotLSAKMi4yOS4yCgo=


