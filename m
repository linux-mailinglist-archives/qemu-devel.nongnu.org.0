Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E040277523
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 17:22:11 +0200 (CEST)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLT4U-0003Op-BN
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 11:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSyj-00067v-PF
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLSyh-0003ty-CO
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 11:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600960570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LX/tRWhvQdbHE+td9jJrkcTKAjU6Xk+V7/V7qmQ1XQ=;
 b=H0X7fepVHoyyN9lDv0Zzo3Z03C7zc0yimfyM0cLNWRuIo0UltET9ld5eIcrs5d9v7Bl6ce
 hzUzWAeKHphDd5t84QYk3PT/4JOczzQ59DlfXfZboNF2t0i3B9YQSyZ6SgFKP8ygZdWRIJ
 FgfJtzt9bU1Z9fcgCRYWOU8T09qVl70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-sLGXg1tuNVemjALdia9cbw-1; Thu, 24 Sep 2020 11:16:06 -0400
X-MC-Unique: sLGXg1tuNVemjALdia9cbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695F5188C125;
 Thu, 24 Sep 2020 15:16:05 +0000 (UTC)
Received: from localhost (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A5141002C00;
 Thu, 24 Sep 2020 15:16:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] util/vhost-user-server: drop unnecessary QOM cast
Date: Thu, 24 Sep 2020 16:15:39 +0100
Message-Id: <20200924151549.913737-4-stefanha@redhat.com>
In-Reply-To: <20200924151549.913737-1-stefanha@redhat.com>
References: <20200924151549.913737-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2UgYWxyZWFkeSBoYXZlIGFjY2VzcyB0byB0aGUgdmFsdWUgd2l0aCB0aGUgY29ycmVjdCB0eXBl
IChpb2MgYW5kIHNpb2MKYXJlIHRoZSBzYW1lIFFJT0NoYW5uZWwpLgoKU2lnbmVkLW9mZi1ieTog
U3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwvdmhvc3QtdXNl
ci1zZXJ2ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyBiL3V0aWwvdmhv
c3QtdXNlci1zZXJ2ZXIuYwppbmRleCAyY2QwY2Y4Mjc3Li5lYmU0Nzg4NWY1IDEwMDY0NAotLS0g
YS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKKysrIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5j
CkBAIC0zMzcsNyArMzM3LDcgQEAgc3RhdGljIHZvaWQgdnVfYWNjZXB0KFFJT05ldExpc3RlbmVy
ICpsaXN0ZW5lciwgUUlPQ2hhbm5lbFNvY2tldCAqc2lvYywKICAgICBzZXJ2ZXItPmlvYyA9IFFJ
T19DSEFOTkVMKHNpb2MpOwogICAgIG9iamVjdF9yZWYoT0JKRUNUKHNlcnZlci0+aW9jKSk7CiAg
ICAgcWlvX2NoYW5uZWxfYXR0YWNoX2Fpb19jb250ZXh0KHNlcnZlci0+aW9jLCBzZXJ2ZXItPmN0
eCk7Ci0gICAgcWlvX2NoYW5uZWxfc2V0X2Jsb2NraW5nKFFJT19DSEFOTkVMKHNlcnZlci0+c2lv
YyksIGZhbHNlLCBOVUxMKTsKKyAgICBxaW9fY2hhbm5lbF9zZXRfYmxvY2tpbmcoc2VydmVyLT5p
b2MsIGZhbHNlLCBOVUxMKTsKICAgICB2dV9jbGllbnRfc3RhcnQoc2VydmVyKTsKIH0KIAotLSAK
Mi4yNi4yCgo=


