Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B342F11E9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:52:54 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvkj-0002Ru-TP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvin-00019o-Mw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvil-0006qQ-S0
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyyYsePnZo/EFvB/hN4ylAtY6dvZ73qNE2umw5/Ds1g=;
 b=XsyYeSca39qC1cxf35qBmh63mG09pmq3lwK3pTOtyjXLf9dASFH7zAl5slw6yyQKHj6luV
 X98tKxcSw33h0gRROfKFBkS0oBZa1yvOFFTgro3FFR6Rx1WP9n1vAIl6YvMrXchSkzIhdz
 n4R9WUAF5VVtvMFMq+uhK7puZkC4wVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-4_BeafjOOHapaYnIciFfiQ-1; Mon, 11 Jan 2021 06:50:44 -0500
X-MC-Unique: 4_BeafjOOHapaYnIciFfiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43DB018C8C01;
 Mon, 11 Jan 2021 11:50:43 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 258C460C62;
 Mon, 11 Jan 2021 11:50:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] gitmodules: use GitLab repos instead of qemu.org
Date: Mon, 11 Jan 2021 11:50:13 +0000
Message-Id: <20210111115017.156802-3-stefanha@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiAu
Z2l0bW9kdWxlcyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvLmdpdG1vZHVsZXMgYi8uZ2l0bW9kdWxlcwppbmRleCAyYmRlZWFjZWY4Li4w
OGIxYjQ4YTA5IDEwMDY0NAotLS0gYS8uZ2l0bW9kdWxlcworKysgYi8uZ2l0bW9kdWxlcwpAQCAt
MSw2NiArMSw2NiBAQAogW3N1Ym1vZHVsZSAicm9tcy9zZWFiaW9zIl0KIAlwYXRoID0gcm9tcy9z
ZWFiaW9zCi0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3NlYWJpb3MuZ2l0LworCXVy
bCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qvc2VhYmlvcy5naXQvCiBbc3VibW9k
dWxlICJyb21zL1NMT0YiXQogCXBhdGggPSByb21zL1NMT0YKLQl1cmwgPSBodHRwczovL2dpdC5x
ZW11Lm9yZy9naXQvU0xPRi5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9q
ZWN0L1NMT0YuZ2l0CiBbc3VibW9kdWxlICJyb21zL2lweGUiXQogCXBhdGggPSByb21zL2lweGUK
LQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvaXB4ZS5naXQKKwl1cmwgPSBodHRwczov
L2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L2lweGUuZ2l0CiBbc3VibW9kdWxlICJyb21zL29wZW5i
aW9zIl0KIAlwYXRoID0gcm9tcy9vcGVuYmlvcwotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3Jn
L2dpdC9vcGVuYmlvcy5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0
L29wZW5iaW9zLmdpdAogW3N1Ym1vZHVsZSAicm9tcy9xZW11LXBhbGNvZGUiXQogCXBhdGggPSBy
b21zL3FlbXUtcGFsY29kZQotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9xZW11LXBh
bGNvZGUuZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LXBh
bGNvZGUuZ2l0CiBbc3VibW9kdWxlICJyb21zL3NnYWJpb3MiXQogCXBhdGggPSByb21zL3NnYWJp
b3MKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2dhYmlvcy5naXQKKwl1cmwgPSBo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3NnYWJpb3MuZ2l0CiBbc3VibW9kdWxlICJk
dGMiXQogCXBhdGggPSBkdGMKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvZHRjLmdp
dAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvZHRjLmdpdAogW3N1Ym1v
ZHVsZSAicm9tcy91LWJvb3QiXQogCXBhdGggPSByb21zL3UtYm9vdAotCXVybCA9IGh0dHBzOi8v
Z2l0LnFlbXUub3JnL2dpdC91LWJvb3QuZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3Fl
bXUtcHJvamVjdC91LWJvb3QuZ2l0CiBbc3VibW9kdWxlICJyb21zL3NraWJvb3QiXQogCXBhdGgg
PSByb21zL3NraWJvb3QKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2tpYm9vdC5n
aXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3NraWJvb3QuZ2l0CiBb
c3VibW9kdWxlICJyb21zL1FlbXVNYWNEcml2ZXJzIl0KIAlwYXRoID0gcm9tcy9RZW11TWFjRHJp
dmVycwotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9RZW11TWFjRHJpdmVycy5naXQK
Kwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L1FlbXVNYWNEcml2ZXJzLmdp
dAogW3N1Ym1vZHVsZSAidWkva2V5Y29kZW1hcGRiIl0KIAlwYXRoID0gdWkva2V5Y29kZW1hcGRi
Ci0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2tleWNvZGVtYXBkYi5naXQKKwl1cmwg
PSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L2tleWNvZGVtYXBkYi5naXQKIFtzdWJt
b2R1bGUgImNhcHN0b25lIl0KIAlwYXRoID0gY2Fwc3RvbmUKLQl1cmwgPSBodHRwczovL2dpdC5x
ZW11Lm9yZy9naXQvY2Fwc3RvbmUuZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUt
cHJvamVjdC9jYXBzdG9uZS5naXQKIFtzdWJtb2R1bGUgInJvbXMvc2VhYmlvcy1ocHBhIl0KIAlw
YXRoID0gcm9tcy9zZWFiaW9zLWhwcGEKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQv
c2VhYmlvcy1ocHBhLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qv
c2VhYmlvcy1ocHBhLmdpdAogW3N1Ym1vZHVsZSAicm9tcy91LWJvb3Qtc2FtNDYwZXgiXQogCXBh
dGggPSByb21zL3UtYm9vdC1zYW00NjBleAotCXVybCA9IGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dp
dC91LWJvb3Qtc2FtNDYwZXguZ2l0CisJdXJsID0gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJv
amVjdC91LWJvb3Qtc2FtNDYwZXguZ2l0CiBbc3VibW9kdWxlICJ0ZXN0cy9mcC9iZXJrZWxleS10
ZXN0ZmxvYXQtMyJdCiAJcGF0aCA9IHRlc3RzL2ZwL2JlcmtlbGV5LXRlc3RmbG9hdC0zCi0JdXJs
ID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2JlcmtlbGV5LXRlc3RmbG9hdC0zLmdpdAorCXVy
bCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvYmVya2VsZXktdGVzdGZsb2F0LTMu
Z2l0CiBbc3VibW9kdWxlICJ0ZXN0cy9mcC9iZXJrZWxleS1zb2Z0ZmxvYXQtMyJdCiAJcGF0aCA9
IHRlc3RzL2ZwL2JlcmtlbGV5LXNvZnRmbG9hdC0zCi0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5v
cmcvZ2l0L2JlcmtlbGV5LXNvZnRmbG9hdC0zLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNv
bS9xZW11LXByb2plY3QvYmVya2VsZXktc29mdGZsb2F0LTMuZ2l0CiBbc3VibW9kdWxlICJyb21z
L2VkazIiXQogCXBhdGggPSByb21zL2VkazIKLQl1cmwgPSBodHRwczovL2dpdC5xZW11Lm9yZy9n
aXQvZWRrMi5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L2VkazIu
Z2l0CiBbc3VibW9kdWxlICJzbGlycCJdCiAJcGF0aCA9IHNsaXJwCi0JdXJsID0gaHR0cHM6Ly9n
aXQucWVtdS5vcmcvZ2l0L2xpYnNsaXJwLmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9x
ZW11LXByb2plY3QvbGlic2xpcnAuZ2l0CiBbc3VibW9kdWxlICJyb21zL29wZW5zYmkiXQogCXBh
dGggPSByb21zL29wZW5zYmkKLQl1cmwgPSAJaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L29wZW5z
YmkuZ2l0CisJdXJsID0gCWh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3Qvb3BlbnNiaS5n
aXQKIFtzdWJtb2R1bGUgInJvbXMvcWJvb3QiXQogCXBhdGggPSByb21zL3Fib290Ci0JdXJsID0g
aHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3Fib290LmdpdAorCXVybCA9IGh0dHBzOi8vZ2l0bGFi
LmNvbS9xZW11LXByb2plY3QvcWJvb3QuZ2l0CiBbc3VibW9kdWxlICJtZXNvbiJdCiAJcGF0aCA9
IG1lc29uCi0JdXJsID0gaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L21lc29uLmdpdAorCXVybCA9
IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvbWVzb24uZ2l0CiBbc3VibW9kdWxlICJy
b21zL3Zib290cm9tIl0KIAlwYXRoID0gcm9tcy92Ym9vdHJvbQotCXVybCA9IGh0dHBzOi8vZ2l0
LnFlbXUub3JnL2dpdC92Ym9vdHJvbS5naXQKKwl1cmwgPSBodHRwczovL2dpdGxhYi5jb20vcWVt
dS1wcm9qZWN0L3Zib290cm9tLmdpdAotLSAKMi4yOS4yCgo=


