Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A51333922
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:46:32 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvQF-0003Mv-H8
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJvOm-0002gc-CL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJvOh-0007ox-Kq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615369494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d16dU2IxH6UpFXampFW8Rqk4w2I7OZ8pQ+WMUnUd3n8=;
 b=SWU4zMgFPoKgBthYSr1yXiQ8mcIqxY/EujUkNIFyPDmuEJR2bcnH+nS2Q8vgqWHpyo5Y8g
 adgSkWnnKdRhbljVnLAPwRbJ8x7ZEOqP7rIX/NQIKKtPw+YZcBvM9pqaUUHUUu0g+9gSm2
 l7uMdtM91tdo1RB3xJmES1PZozex3rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-jKYLzUyEO1CLBn94zLV2dg-1; Wed, 10 Mar 2021 04:44:46 -0500
X-MC-Unique: jKYLzUyEO1CLBn94zLV2dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC6738018A7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:44:45 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34E065D9DB;
 Wed, 10 Mar 2021 09:44:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Add GSoC 2021 timeline
Date: Wed, 10 Mar 2021 09:44:41 +0000
Message-Id: <20210310094441.294746-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUVNVSBoYXMgYmVlbiBhY2NlcHRlZCBpbnRvIEdvb2dsZSBTdW1tZXIgb2YgQ29kZSAyMDIxLiBU
aGlzIGJsb2cgcG9zdApsZXRzIHByb3NwZWN0aXZlIGFwcGxpY2FudHMga25vdyBob3cgdG8gYXBw
bHkgYW5kIHdoYXQgdGhlIHRpbWVsaW5lIGlzLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIC4uLjAzLTEwLWdzb2MtYW5kLW91dHJlYWNo
eS0yMDIxLXRpbWVsaW5lcy5tZCB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAzNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgX3Bvc3RzLzIwMjEtMDMt
MTAtZ3NvYy1hbmQtb3V0cmVhY2h5LTIwMjEtdGltZWxpbmVzLm1kCgpkaWZmIC0tZ2l0IGEvX3Bv
c3RzLzIwMjEtMDMtMTAtZ3NvYy1hbmQtb3V0cmVhY2h5LTIwMjEtdGltZWxpbmVzLm1kIGIvX3Bv
c3RzLzIwMjEtMDMtMTAtZ3NvYy1hbmQtb3V0cmVhY2h5LTIwMjEtdGltZWxpbmVzLm1kCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjJjMTkxOTYKLS0tIC9kZXYvbnVsbAorKysg
Yi9fcG9zdHMvMjAyMS0wMy0xMC1nc29jLWFuZC1vdXRyZWFjaHktMjAyMS10aW1lbGluZXMubWQK
QEAgLTAsMCArMSwzNCBAQAorLS0tCitsYXlvdXQ6IHBvc3QKK3RpdGxlOiAgIkdvb2dsZSBTdW1t
ZXIgb2YgQ29kZSAyMDIxIGlzIG9uISIKK2RhdGU6ICAgMjAyMS0wMy0xMCAwNzowMDowMCArMDAw
MAorYXV0aG9yOiBTdGVmYW4gSGFqbm9jemkKK2NhdGVnb3JpZXM6IFtnc29jLCBpbnRlcm5zaGlw
c10KKy0tLQorUUVNVSBoYXMgYmVlbiBhY2NlcHRlZCBpbnRvIFtHb29nbGUgU3VtbWVyIG9mIENv
ZGUKKzIwMjFdKGh0dHBzOi8vc3VtbWVyb2Zjb2RlLndpdGhnb29nbGUuY29tLykgYW5kIHdlIGxv
b2sgZm9yd2FyZCB0byBtZW50b3JpbmcKK3RhbGVudGVkIHN0dWRlbnRzIGZyb20gYXJvdW5kIHRo
ZSB3b3JsZCBhcyB0aGV5IG1ha2Ugb3BlbiBzb3VyY2UgY29udHJpYnV0aW9ucwordGhpcyBzdW1t
ZXIuIEdTb0MgaXMgYSByZW1vdGUgd29yayBvcGVuIHNvdXJjZSBpbnRlcm5zaGlwIHByb2dyYW0g
d2hlcmUKK3N0dWRlbnRzIHdvcmsgb24gYSBwcm9qZWN0IGZvciBhbiBvcGVuIHNvdXJjZSBvcmdh
bml6YXRpb24gbGlrZSBRRU1VLgorCitDaGVjayBvdXQgdGhlIFtwcm9qZWN0IGlkZWFzCitwYWdl
XShodHRwczovL3dpa2kucWVtdS5vcmcvR29vZ2xlX1N1bW1lcl9vZl9Db2RlXzIwMjEpIHdoZXJl
IHRoZXJlIGFyZSAxMAorcHJvamVjdHMgdGhhdCBbZWxpZ2libGUKK3N0dWRlbnRzXShodHRwczov
L2RldmVsb3BlcnMuZ29vZ2xlLmNvbS9vcGVuLXNvdXJjZS9nc29jL2ZhcSN3aGF0X2FyZV90aGVf
ZWxpZ2liaWxpdHlfcmVxdWlyZW1lbnRzX2Zvcl9wYXJ0aWNpcGF0aW9uKQorY2FuIGFwcGx5IGZv
ci4gVGhpcyB5ZWFyIHdlIGhhdmUgQywgUnVzdCwgYW5kIFB5dGhvbiBwcm9qZWN0cyBpbiB2YXJp
b3VzIGFyZWFzCityZWxhdGVkIHRvIGVtdWxhdGlvbiBhbmQgdmlydHVhbGl6YXRpb24uCisKK0lm
IHlvdSBhcmUgYSBzdHVkZW50IHdobyBpcyBpbnRlcmVzdGVkIGluIGRvaW5nIGFuIGludGVybnNo
aXAgdGhpcyBzdW1tZXIsIGhlYWQKK292ZXIgdG8gUUVNVSdzIFtHU29DIG9yZ2FuaXphdGlvbgor
cGFnZV0oaHR0cHM6Ly9zdW1tZXJvZmNvZGUud2l0aGdvb2dsZS5jb20vb3JnYW5pemF0aW9ucy81
MDI2NjU1MDg2NTc1NjE2LykKK3doZXJlIHlvdSBjYW4gcmVhZCBhYm91dCBob3cgdG8gYXBwbHkg
YW5kIGxlYXJuIG1vcmUgYWJvdXQgR29vZ2xlIFN1bW1lciBvZgorQ29kZSBpbiBnZW5lcmFsLgor
CitUaGUgR1NvQyAyMDIxIHRpbWVsaW5lIGlzOgorKiBTdHVkZW50IGFwcGxpY2F0aW9uIHBlcmlv
ZCAtIE1hcmNoIDI5IC0gQXByaWwgMTMKKyogU3R1ZGVudCBwcm9qZWN0cyBhbm5vdW5jZWQgLSBN
YXkgMTcKKyogQ29tbXVuaXR5IGJvbmRpbmcgcGVyaW9kIC0gTWF5IDE3IC0gSnVuZSA3CisqIENv
ZGluZyAtIEp1bmUgNyAtIEF1Z3VzdCAxNgorCitXZSBsb29rIGZvcndhcmQgdG8gbWVldGluZyB5
b3UgYW5kIGFuc3dlcmluZyBxdWVzdGlvbnMgb24gdGhlICNxZW11LWdzb2MgSVJDCitjaGFubmVs
IG9uIGlyYy5vZnRjLm5ldCEKLS0gCjIuMjkuMgoK


