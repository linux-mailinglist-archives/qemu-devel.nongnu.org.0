Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20016295D91
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 13:41:12 +0200 (CEST)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVYxy-0003K2-68
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 07:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYlp-0004n2-HC
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYlo-00054f-0T
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603366115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZ50qLLD6k1ryEay4NPbvsMG0Teqrn3RbrK7K8ZngAE=;
 b=IWn+HrqQi/29sTW4en/9aIgti6pNGgvyUgYPGHU00qHE9F/Ve26JYGIXMh5ZR0kNmtHt/h
 sjxDvpB7n74A/dF1UK817lwUD+UPzrB/PEd220DlTr1OF7RineheSQP0pi2K/yEA0XQorU
 KcmFgwOHHcY0DFp7RJbt9yzw2P8kOy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-EqwBJLuhPgermCNVfHYnTA-1; Thu, 22 Oct 2020 07:28:31 -0400
X-MC-Unique: EqwBJLuhPgermCNVfHYnTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7E9C64091;
 Thu, 22 Oct 2020 11:28:29 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 735B95C1C7;
 Thu, 22 Oct 2020 11:28:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 09/28] util/vhost-user-server: drop unnecessary QOM cast
Date: Thu, 22 Oct 2020 12:27:07 +0100
Message-Id: <20201022112726.736757-10-stefanha@redhat.com>
In-Reply-To: <20201022112726.736757-1-stefanha@redhat.com>
References: <20201022112726.736757-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 06:53:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2UgYWxyZWFkeSBoYXZlIGFjY2VzcyB0byB0aGUgdmFsdWUgd2l0aCB0aGUgY29ycmVjdCB0eXBl
IChpb2MgYW5kIHNpb2MKYXJlIHRoZSBzYW1lIFFJT0NoYW5uZWwpLgoKU2lnbmVkLW9mZi1ieTog
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIwMDky
NDE1MTU0OS45MTM3MzctNC1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1dGlsL3Zob3N0LXVzZXItc2Vy
dmVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMgYi91dGlsL3Zob3N0LXVz
ZXItc2VydmVyLmMKaW5kZXggOWJkMzNlMGZkYi4uNDQzYWI3NDQ4YyAxMDA2NDQKLS0tIGEvdXRp
bC92aG9zdC11c2VyLXNlcnZlci5jCisrKyBiL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwpAQCAt
MzM3LDcgKzMzNyw3IEBAIHN0YXRpYyB2b2lkIHZ1X2FjY2VwdChRSU9OZXRMaXN0ZW5lciAqbGlz
dGVuZXIsIFFJT0NoYW5uZWxTb2NrZXQgKnNpb2MsCiAgICAgc2VydmVyLT5pb2MgPSBRSU9fQ0hB
Tk5FTChzaW9jKTsKICAgICBvYmplY3RfcmVmKE9CSkVDVChzZXJ2ZXItPmlvYykpOwogICAgIHFp
b19jaGFubmVsX2F0dGFjaF9haW9fY29udGV4dChzZXJ2ZXItPmlvYywgc2VydmVyLT5jdHgpOwot
ICAgIHFpb19jaGFubmVsX3NldF9ibG9ja2luZyhRSU9fQ0hBTk5FTChzZXJ2ZXItPnNpb2MpLCBm
YWxzZSwgTlVMTCk7CisgICAgcWlvX2NoYW5uZWxfc2V0X2Jsb2NraW5nKHNlcnZlci0+aW9jLCBm
YWxzZSwgTlVMTCk7CiAgICAgdnVfY2xpZW50X3N0YXJ0KHNlcnZlcik7CiB9CiAKLS0gCjIuMjYu
MgoK


