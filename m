Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2B30F6CC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:52:01 +0100 (CET)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gvI-0005bK-Rs
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gnw-0007Vs-No
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gnv-0004ak-28
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrzVu74pwyubTxmbTyPfeQPhaMf2xFrOVxrC6aY1RvY=;
 b=RNLEGZ3llEUYeG5bb/t1Yiymfu0Ald8ERINTLs3K2PvKV/9hjjbT7lRl7SNmeu/DWUmmVP
 K50HrgfiyBHkJ3uO8GwxYmUXJ6qlkGVtz3RCjY8SCyTne2JSH8tGVVTOkAMqE4J0/DEhjJ
 m+GWbUDOpAO8iAb1VSYUgRVetaqk4xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-7QfKc39DORyNCTHJVfth4g-1; Thu, 04 Feb 2021 10:44:18 -0500
X-MC-Unique: 7QfKc39DORyNCTHJVfth4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50D58108C309;
 Thu,  4 Feb 2021 15:44:16 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0395C5DEC1;
 Thu,  4 Feb 2021 15:44:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 04/27] docs: update README to use GitLab repo URLs
Date: Thu,  4 Feb 2021 15:43:04 +0000
Message-Id: <20210204154327.386529-5-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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


