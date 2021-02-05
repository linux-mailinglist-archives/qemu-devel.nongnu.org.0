Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73423310E4A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:05:52 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84YJ-00035E-Gc
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84FB-0000sS-Aj
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l84F8-0006Kj-Aa
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrzVu74pwyubTxmbTyPfeQPhaMf2xFrOVxrC6aY1RvY=;
 b=O6NMH1c6PWsBS7Z9MSJ2sRae4Ia6cqROST+9z7jA0VwvwrFd48WouCT10SfkgthorPWRP4
 KmjDctg1w0ab4DmGH78o+9Wh3/k/f6MZdJBdhpl4A725ksQjbZF1nJtQY9soWh7j0l6Wcu
 dPbdee8TAdhE3vQqWjsxaGpR8awqvX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-VuyaC9oPNES3tmS9FBfieQ-1; Fri, 05 Feb 2021 11:45:56 -0500
X-MC-Unique: VuyaC9oPNES3tmS9FBfieQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1BB80196C;
 Fri,  5 Feb 2021 16:45:54 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E73E5D9D7;
 Fri,  5 Feb 2021 16:45:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v3 04/27] docs: update README to use GitLab repo URLs
Date: Fri,  5 Feb 2021 16:44:36 +0000
Message-Id: <20210205164459.432714-5-stefanha@redhat.com>
In-Reply-To: <20210205164459.432714-1-stefanha@redhat.com>
References: <20210205164459.432714-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
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

cWVtdS5vcmcgaXMgcnVubmluZyBvdXQgb2YgYmFuZHdpZHRoIGFuZCB0aGUgUUVNVSBwcm9qZWN0
IGlzIG1vdmluZwp0b3dhcmRzIGEgZ2F0aW5nIENJIG9uIEdpdExhYi4gVXNlIHRoZSBHaXRMYWIg
cmVwb3MgaW5zdGVhZCBvZiBxZW11Lm9yZwoodGhleSB3aWxsIGJlY29tZSBtaXJyb3JzKS4KClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3
ZWQtYnk6IFdhaW5lciBkb3MgU2FudG9zIE1vc2NoZXR0YSA8d2FpbmVyc21AcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAy
MDIxMDExMTExNTAxNy4xNTY4MDItNS1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBSRUFETUUucnN0IHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL1JFQURNRS5yc3QgYi9SRUFETUUucnN0CmluZGV4IDU4YjlmMmRjMTUuLmNl
MzlkODkwNzcgMTAwNjQ0Ci0tLSBhL1JFQURNRS5yc3QKKysrIGIvUkVBRE1FLnJzdApAQCAtNjAs
NyArNjAsNyBAQCBUaGUgUUVNVSBzb3VyY2UgY29kZSBpcyBtYWludGFpbmVkIHVuZGVyIHRoZSBH
SVQgdmVyc2lvbiBjb250cm9sIHN5c3RlbS4KIAogLi4gY29kZS1ibG9jazo6IHNoZWxsCiAKLSAg
IGdpdCBjbG9uZSBodHRwczovL2dpdC5xZW11Lm9yZy9naXQvcWVtdS5naXQKKyAgIGdpdCBjbG9u
ZSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUuZ2l0CiAKIFdoZW4gc3VibWl0
dGluZyBwYXRjaGVzLCBvbmUgY29tbW9uIGFwcHJvYWNoIGlzIHRvIHVzZSAnZ2l0CiBmb3JtYXQt
cGF0Y2gnIGFuZC9vciAnZ2l0IHNlbmQtZW1haWwnIHRvIGZvcm1hdCAmIHNlbmQgdGhlIG1haWwg
dG8gdGhlCkBAIC03OCw3ICs3OCw3IEBAIFRoZSBRRU1VIHdlYnNpdGUgaXMgYWxzbyBtYWludGFp
bmVkIHVuZGVyIHNvdXJjZSBjb250cm9sLgogCiAuLiBjb2RlLWJsb2NrOjogc2hlbGwKIAotICBn
aXQgY2xvbmUgaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3FlbXUtd2ViLmdpdAorICBnaXQgY2xv
bmUgaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LXdlYi5naXQKIAogKiBgPGh0
dHBzOi8vd3d3LnFlbXUub3JnLzIwMTcvMDIvMDQvdGhlLW5ldy1xZW11LXdlYnNpdGUtaXMtdXAv
PmBfCiAKLS0gCjIuMjkuMgoK


