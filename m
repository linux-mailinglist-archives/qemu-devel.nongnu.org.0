Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107FD2972F2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:54:52 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzOz-0005iq-D5
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyvZ-0007sg-Lh
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyvT-00011J-FE
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Itz/H77O8YQ99CGzsq9afhukogYzz/U6DlCXeUrgRFQ=;
 b=BZaBvvFnRfW5Y2HLtDdP8z1S8V4CdhGUZt4QnanCHXXkHWjx0sjRIRYPCCNqYNf0iJsVSE
 sQmqVsmg4Z8f9fsPew2NP+Wl3ko+Ygmj3PQkhSEcEGv/SZaii+C7zHUanGZBGgiUrk5u1a
 x1qlp5YwocIdvXGrudf0Y+5Ngo3Dfr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-mhvkXWAYN8W6KKZ2M-_9jw-1; Fri, 23 Oct 2020 11:24:15 -0400
X-MC-Unique: mhvkXWAYN8W6KKZ2M-_9jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC57106B491;
 Fri, 23 Oct 2020 15:23:54 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B30919646;
 Fri, 23 Oct 2020 15:23:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 28/28] iotests: add commit top->base cases to 274
Date: Fri, 23 Oct 2020 16:21:47 +0100
Message-Id: <20201023152147.1016281-29-stefanha@redhat.com>
In-Reply-To: <20201023152147.1016281-1-stefanha@redhat.com>
References: <20201023152147.1016281-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPgoKVGhlc2UgY2FzZXMgYXJlIGZpeGVkIGJ5IHByZXZpb3VzIHBhdGNoZXMgYXJvdW5kIGJs
b2NrX3N0YXR1cyBhbmQKaXNfYWxsb2NhdGVkLgoKU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgpSZXZpZXdlZC1ieTog
RXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBBbGJlcnRvIEdhcmNp
YSA8YmVydG9AaWdhbGlhLmNvbT4KTWVzc2FnZS1pZDogMjAyMDA5MjQxOTQwMDMuMjIwODAtNi12
c2VtZW50c292QHZpcnR1b3p6by5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRlc3RzL3FlbXUtaW90ZXN0cy8yNzQgICAgIHwgMjAg
KysrKysrKysrKysKIHRlc3RzL3FlbXUtaW90ZXN0cy8yNzQub3V0IHwgNjggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3FlbXUtaW90ZXN0cy8yNzQgYi90ZXN0cy9xZW11LWlv
dGVzdHMvMjc0CmluZGV4IGQ0NTcxYzU0NjUuLjc2YjFiYTZhNTIgMTAwNzU1Ci0tLSBhL3Rlc3Rz
L3FlbXUtaW90ZXN0cy8yNzQKKysrIGIvdGVzdHMvcWVtdS1pb3Rlc3RzLzI3NApAQCAtMTE1LDYg
KzExNSwyNiBAQCB3aXRoIGlvdGVzdHMuRmlsZVBhdGgoJ2Jhc2UnKSBhcyBiYXNlLCBcCiAgICAg
aW90ZXN0cy5xZW11X2lvX2xvZygnLWMnLCAncmVhZCAtUCAxIDAgJWQnICUgc2l6ZV9zaG9ydCwg
bWlkKQogICAgIGlvdGVzdHMucWVtdV9pb19sb2coJy1jJywgJ3JlYWQgLVAgMCAlZCAlZCcgJSAo
c2l6ZV9zaG9ydCwgc2l6ZV9kaWZmKSwgbWlkKQogCisgICAgaW90ZXN0cy5sb2coJz09PSBUZXN0
aW5nIHFlbXUtaW1nIGNvbW1pdCAodG9wIC0+IGJhc2UpID09PScpCisKKyAgICBjcmVhdGVfY2hh
aW4oKQorICAgIGlvdGVzdHMucWVtdV9pbWdfbG9nKCdjb21taXQnLCAnLWInLCBiYXNlLCB0b3Ap
CisgICAgaW90ZXN0cy5pbWdfaW5mb19sb2coYmFzZSkKKyAgICBpb3Rlc3RzLnFlbXVfaW9fbG9n
KCctYycsICdyZWFkIC1QIDEgMCAlZCcgJSBzaXplX3Nob3J0LCBiYXNlKQorICAgIGlvdGVzdHMu
cWVtdV9pb19sb2coJy1jJywgJ3JlYWQgLVAgMCAlZCAlZCcgJSAoc2l6ZV9zaG9ydCwgc2l6ZV9k
aWZmKSwgYmFzZSkKKworICAgIGlvdGVzdHMubG9nKCc9PT0gVGVzdGluZyBRTVAgYWN0aXZlIGNv
bW1pdCAodG9wIC0+IGJhc2UpID09PScpCisKKyAgICBjcmVhdGVfY2hhaW4oKQorICAgIHdpdGgg
Y3JlYXRlX3ZtKCkgYXMgdm06CisgICAgICAgIHZtLmxhdW5jaCgpCisgICAgICAgIHZtLnFtcF9s
b2coJ2Jsb2NrLWNvbW1pdCcsIGRldmljZT0ndG9wJywgYmFzZV9ub2RlPSdiYXNlJywKKyAgICAg
ICAgICAgICAgICAgICBqb2JfaWQ9J2pvYjAnLCBhdXRvX2Rpc21pc3M9RmFsc2UpCisgICAgICAg
IHZtLnJ1bl9qb2IoJ2pvYjAnLCB3YWl0PTUpCisKKyAgICBpb3Rlc3RzLmltZ19pbmZvX2xvZyht
aWQpCisgICAgaW90ZXN0cy5xZW11X2lvX2xvZygnLWMnLCAncmVhZCAtUCAxIDAgJWQnICUgc2l6
ZV9zaG9ydCwgYmFzZSkKKyAgICBpb3Rlc3RzLnFlbXVfaW9fbG9nKCctYycsICdyZWFkIC1QIDAg
JWQgJWQnICUgKHNpemVfc2hvcnQsIHNpemVfZGlmZiksIGJhc2UpCiAKICAgICBpb3Rlc3RzLmxv
ZygnPT0gUmVzaXplIHRlc3RzID09JykKIApkaWZmIC0tZ2l0IGEvdGVzdHMvcWVtdS1pb3Rlc3Rz
LzI3NC5vdXQgYi90ZXN0cy9xZW11LWlvdGVzdHMvMjc0Lm91dAppbmRleCBiZjVhYmQ0YzEwLi5j
ZmUxN2E4NjU5IDEwMDY0NAotLS0gYS90ZXN0cy9xZW11LWlvdGVzdHMvMjc0Lm91dAorKysgYi90
ZXN0cy9xZW11LWlvdGVzdHMvMjc0Lm91dApAQCAtMTM1LDYgKzEzNSw3NCBAQCByZWFkIDEwNDg1
NzYvMTA0ODU3NiBieXRlcyBhdCBvZmZzZXQgMAogcmVhZCAxMDQ4NTc2LzEwNDg1NzYgYnl0ZXMg
YXQgb2Zmc2V0IDEwNDg1NzYKIDEgTWlCLCBYIG9wczsgWFg6WFg6WFguWCAoWFhYIFlZWS9zZWMg
YW5kIFhYWCBvcHMvc2VjKQogCis9PT0gVGVzdGluZyBxZW11LWltZyBjb21taXQgKHRvcCAtPiBi
YXNlKSA9PT0KK0Zvcm1hdHRpbmcgJ1RFU1RfRElSL1BJRC1iYXNlJywgZm10PXFjb3cyIGNsdXN0
ZXJfc2l6ZT02NTUzNiBleHRlbmRlZF9sMj1vZmYgY29tcHJlc3Npb25fdHlwZT16bGliIHNpemU9
MjA5NzE1MiBsYXp5X3JlZmNvdW50cz1vZmYgcmVmY291bnRfYml0cz0xNgorCitGb3JtYXR0aW5n
ICdURVNUX0RJUi9QSUQtbWlkJywgZm10PXFjb3cyIGNsdXN0ZXJfc2l6ZT02NTUzNiBleHRlbmRl
ZF9sMj1vZmYgY29tcHJlc3Npb25fdHlwZT16bGliIHNpemU9MTA0ODU3NiBiYWNraW5nX2ZpbGU9
VEVTVF9ESVIvUElELWJhc2UgYmFja2luZ19mbXQ9cWNvdzIgbGF6eV9yZWZjb3VudHM9b2ZmIHJl
ZmNvdW50X2JpdHM9MTYKKworRm9ybWF0dGluZyAnVEVTVF9ESVIvUElELXRvcCcsIGZtdD1xY293
MiBjbHVzdGVyX3NpemU9NjU1MzYgZXh0ZW5kZWRfbDI9b2ZmIGNvbXByZXNzaW9uX3R5cGU9emxp
YiBzaXplPTIwOTcxNTIgYmFja2luZ19maWxlPVRFU1RfRElSL1BJRC1taWQgYmFja2luZ19mbXQ9
cWNvdzIgbGF6eV9yZWZjb3VudHM9b2ZmIHJlZmNvdW50X2JpdHM9MTYKKword3JvdGUgMjA5NzE1
Mi8yMDk3MTUyIGJ5dGVzIGF0IG9mZnNldCAwCisyIE1pQiwgWCBvcHM7IFhYOlhYOlhYLlggKFhY
WCBZWVkvc2VjIGFuZCBYWFggb3BzL3NlYykKKworSW1hZ2UgY29tbWl0dGVkLgorCitpbWFnZTog
VEVTVF9JTUcKK2ZpbGUgZm9ybWF0OiBJTUdGTVQKK3ZpcnR1YWwgc2l6ZTogMiBNaUIgKDIwOTcx
NTIgYnl0ZXMpCitjbHVzdGVyX3NpemU6IDY1NTM2CitGb3JtYXQgc3BlY2lmaWMgaW5mb3JtYXRp
b246CisgICAgY29tcGF0OiAxLjEKKyAgICBjb21wcmVzc2lvbiB0eXBlOiB6bGliCisgICAgbGF6
eSByZWZjb3VudHM6IGZhbHNlCisgICAgcmVmY291bnQgYml0czogMTYKKyAgICBjb3JydXB0OiBm
YWxzZQorICAgIGV4dGVuZGVkIGwyOiBmYWxzZQorCityZWFkIDEwNDg1NzYvMTA0ODU3NiBieXRl
cyBhdCBvZmZzZXQgMAorMSBNaUIsIFggb3BzOyBYWDpYWDpYWC5YIChYWFggWVlZL3NlYyBhbmQg
WFhYIG9wcy9zZWMpCisKK3JlYWQgMTA0ODU3Ni8xMDQ4NTc2IGJ5dGVzIGF0IG9mZnNldCAxMDQ4
NTc2CisxIE1pQiwgWCBvcHM7IFhYOlhYOlhYLlggKFhYWCBZWVkvc2VjIGFuZCBYWFggb3BzL3Nl
YykKKworPT09IFRlc3RpbmcgUU1QIGFjdGl2ZSBjb21taXQgKHRvcCAtPiBiYXNlKSA9PT0KK0Zv
cm1hdHRpbmcgJ1RFU1RfRElSL1BJRC1iYXNlJywgZm10PXFjb3cyIGNsdXN0ZXJfc2l6ZT02NTUz
NiBleHRlbmRlZF9sMj1vZmYgY29tcHJlc3Npb25fdHlwZT16bGliIHNpemU9MjA5NzE1MiBsYXp5
X3JlZmNvdW50cz1vZmYgcmVmY291bnRfYml0cz0xNgorCitGb3JtYXR0aW5nICdURVNUX0RJUi9Q
SUQtbWlkJywgZm10PXFjb3cyIGNsdXN0ZXJfc2l6ZT02NTUzNiBleHRlbmRlZF9sMj1vZmYgY29t
cHJlc3Npb25fdHlwZT16bGliIHNpemU9MTA0ODU3NiBiYWNraW5nX2ZpbGU9VEVTVF9ESVIvUElE
LWJhc2UgYmFja2luZ19mbXQ9cWNvdzIgbGF6eV9yZWZjb3VudHM9b2ZmIHJlZmNvdW50X2JpdHM9
MTYKKworRm9ybWF0dGluZyAnVEVTVF9ESVIvUElELXRvcCcsIGZtdD1xY293MiBjbHVzdGVyX3Np
emU9NjU1MzYgZXh0ZW5kZWRfbDI9b2ZmIGNvbXByZXNzaW9uX3R5cGU9emxpYiBzaXplPTIwOTcx
NTIgYmFja2luZ19maWxlPVRFU1RfRElSL1BJRC1taWQgYmFja2luZ19mbXQ9cWNvdzIgbGF6eV9y
ZWZjb3VudHM9b2ZmIHJlZmNvdW50X2JpdHM9MTYKKword3JvdGUgMjA5NzE1Mi8yMDk3MTUyIGJ5
dGVzIGF0IG9mZnNldCAwCisyIE1pQiwgWCBvcHM7IFhYOlhYOlhYLlggKFhYWCBZWVkvc2VjIGFu
ZCBYWFggb3BzL3NlYykKKworeyJleGVjdXRlIjogImJsb2NrLWNvbW1pdCIsICJhcmd1bWVudHMi
OiB7ImF1dG8tZGlzbWlzcyI6IGZhbHNlLCAiYmFzZS1ub2RlIjogImJhc2UiLCAiZGV2aWNlIjog
InRvcCIsICJqb2ItaWQiOiAiam9iMCJ9fQoreyJyZXR1cm4iOiB7fX0KK3siZXhlY3V0ZSI6ICJq
b2ItY29tcGxldGUiLCAiYXJndW1lbnRzIjogeyJpZCI6ICJqb2IwIn19Cit7InJldHVybiI6IHt9
fQoreyJkYXRhIjogeyJkZXZpY2UiOiAiam9iMCIsICJsZW4iOiAxMDQ4NTc2LCAib2Zmc2V0Ijog
MTA0ODU3NiwgInNwZWVkIjogMCwgInR5cGUiOiAiY29tbWl0In0sICJldmVudCI6ICJCTE9DS19K
T0JfUkVBRFkiLCAidGltZXN0YW1wIjogeyJtaWNyb3NlY29uZHMiOiAiVVNFQ1MiLCAic2Vjb25k
cyI6ICJTRUNTIn19Cit7ImRhdGEiOiB7ImRldmljZSI6ICJqb2IwIiwgImxlbiI6IDEwNDg1NzYs
ICJvZmZzZXQiOiAxMDQ4NTc2LCAic3BlZWQiOiAwLCAidHlwZSI6ICJjb21taXQifSwgImV2ZW50
IjogIkJMT0NLX0pPQl9DT01QTEVURUQiLCAidGltZXN0YW1wIjogeyJtaWNyb3NlY29uZHMiOiAi
VVNFQ1MiLCAic2Vjb25kcyI6ICJTRUNTIn19Cit7ImV4ZWN1dGUiOiAiam9iLWRpc21pc3MiLCAi
YXJndW1lbnRzIjogeyJpZCI6ICJqb2IwIn19Cit7InJldHVybiI6IHt9fQoraW1hZ2U6IFRFU1Rf
SU1HCitmaWxlIGZvcm1hdDogSU1HRk1UCit2aXJ0dWFsIHNpemU6IDEgTWlCICgxMDQ4NTc2IGJ5
dGVzKQorY2x1c3Rlcl9zaXplOiA2NTUzNgorYmFja2luZyBmaWxlOiBURVNUX0RJUi9QSUQtYmFz
ZQorYmFja2luZyBmaWxlIGZvcm1hdDogSU1HRk1UCitGb3JtYXQgc3BlY2lmaWMgaW5mb3JtYXRp
b246CisgICAgY29tcGF0OiAxLjEKKyAgICBjb21wcmVzc2lvbiB0eXBlOiB6bGliCisgICAgbGF6
eSByZWZjb3VudHM6IGZhbHNlCisgICAgcmVmY291bnQgYml0czogMTYKKyAgICBjb3JydXB0OiBm
YWxzZQorICAgIGV4dGVuZGVkIGwyOiBmYWxzZQorCityZWFkIDEwNDg1NzYvMTA0ODU3NiBieXRl
cyBhdCBvZmZzZXQgMAorMSBNaUIsIFggb3BzOyBYWDpYWDpYWC5YIChYWFggWVlZL3NlYyBhbmQg
WFhYIG9wcy9zZWMpCisKK3JlYWQgMTA0ODU3Ni8xMDQ4NTc2IGJ5dGVzIGF0IG9mZnNldCAxMDQ4
NTc2CisxIE1pQiwgWCBvcHM7IFhYOlhYOlhYLlggKFhYWCBZWVkvc2VjIGFuZCBYWFggb3BzL3Nl
YykKKwogPT0gUmVzaXplIHRlc3RzID09CiA9PT0gcHJlYWxsb2NhdGlvbj1vZmYgPT09CiBGb3Jt
YXR0aW5nICdURVNUX0RJUi9QSUQtYmFzZScsIGZtdD1xY293MiBjbHVzdGVyX3NpemU9NjU1MzYg
ZXh0ZW5kZWRfbDI9b2ZmIGNvbXByZXNzaW9uX3R5cGU9emxpYiBzaXplPTY0NDI0NTA5NDQgbGF6
eV9yZWZjb3VudHM9b2ZmIHJlZmNvdW50X2JpdHM9MTYKLS0gCjIuMjYuMgoK


