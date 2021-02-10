Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906DA31624A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:33:39 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9lsP-0006wX-EQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmj-0002Yp-Lj
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9lmh-0005sc-UB
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612949263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvDGnRUv5wT2KbwhR5NLSIqtzmu0pc/0V9amir1wNv0=;
 b=AB2CZQTT32VJTxLm305+kn74gpXXxmbkcrb3q0j4KQbrRAm39OsHxoTmnBhi2vOakd5OdX
 gNv2duTVFHGOhny6WNQ9uZwrS9lwyR+Iv4Mzdo17TTo6AN3zVZSJpuQ057dtsbCguqrsKj
 tkAyGPWtvHCLRzI176ihdWOdPWpcPok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-3wc7g3UaMBmnsCSQkNw1bg-1; Wed, 10 Feb 2021 04:27:41 -0500
X-MC-Unique: 3wc7g3UaMBmnsCSQkNw1bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E42107ACE4;
 Wed, 10 Feb 2021 09:27:39 +0000 (UTC)
Received: from localhost (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88FA119C59;
 Wed, 10 Feb 2021 09:27:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v4 06/27] get_maintainer: update repo URL to GitLab
Date: Wed, 10 Feb 2021 09:26:07 +0000
Message-Id: <20210210092628.193785-7-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
MDIxMDExMTExNTAxNy4xNTY4MDItNy1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBzY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3Njcmlw
dHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggMjcxZjVmZjQyYS4uZTU0OTliOTRiNCAxMDA3NTUK
LS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAorKysgYi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsCkBAIC0xMzc3LDcgKzEzNzcsNyBAQCBzdWIgdmNzX2V4aXN0cyB7CiAJd2FybigiJFA6
IE5vIHN1cHBvcnRlZCBWQ1MgZm91bmQuICBBZGQgLS1ub2dpdCB0byBvcHRpb25zP1xuIik7CiAJ
d2FybigiVXNpbmcgYSBnaXQgcmVwb3NpdG9yeSBwcm9kdWNlcyBiZXR0ZXIgcmVzdWx0cy5cbiIp
OwogCXdhcm4oIlRyeSBsYXRlc3QgZ2l0IHJlcG9zaXRvcnkgdXNpbmc6XG4iKTsKLQl3YXJuKCJn
aXQgY2xvbmUgaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3FlbXUuZ2l0XG4iKTsKKwl3YXJuKCJn
aXQgY2xvbmUgaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LmdpdFxuIik7CiAJ
JHByaW50ZWRfbm92Y3MgPSAxOwogICAgIH0KICAgICByZXR1cm4gMDsKLS0gCjIuMjkuMgoK


