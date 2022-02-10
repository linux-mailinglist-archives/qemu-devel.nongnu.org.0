Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E674B0E28
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:11:21 +0100 (CET)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9EE-0001bH-2m
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI8Qm-0000TD-Me
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:20:12 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:53038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI8Qh-0002QQ-O0
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:20:10 -0500
Received: from sas2-3f1ffc04228d.qloud-c.yandex.net
 (sas2-3f1ffc04228d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:b7a3:0:640:3f1f:fc04])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 57BF02E1AD1;
 Thu, 10 Feb 2022 15:20:04 +0300 (MSK)
Received: from 2a02:6b8:c08:8889:0:640:bf93:f901
 (2a02:6b8:c08:8889:0:640:bf93:f901 [2a02:6b8:c08:8889:0:640:bf93:f901])
 by sas2-3f1ffc04228d.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 2KZKkA0Gaa61-K4GOIWKA; Thu, 10 Feb 2022 15:20:04 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644495604; bh=enUOyr67vDYVpitu3Y0sTad92M0F272QMsGUhiC8wds=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=eJVlHYf4YwOg2O7WoR/61aEa6nEXeDudVl1I7iO7IFc/fJ38TIHhpcroTUYZS9flS
 ElGA/ju+EQ/nn2uDeEipK/Cqabrop6FRMnLFIjY+Iz+jPVJk0wmvhwfVmwut+T1QtE
 x4bpyn1Mv4YHGqJTYzLsvw9s6Ip14iepgoyY44TE=
Authentication-Results: sas2-3f1ffc04228d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from myt5-132c43df2a33.qloud-c.yandex.net
 (myt5-132c43df2a33.qloud-c.yandex.net [2a02:6b8:c12:3e23:0:640:132c:43df])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 mJZa5C0HDeA1-JsEdNPCv
 for <khlebnikov@yandex-team.ru>; Thu, 10 Feb 2022 15:19:54 +0300
Received: by myt5-132c43df2a33.qloud-c.yandex.net with HTTP;
 Thu, 10 Feb 2022 15:19:54 +0300
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <e8d5554f-d78d-7711-355b-8795559e6075@amsat.org>
References: <164449358353.2210343.10106072767435805975.stgit@dynamic-vpn.dhcp.yndx.net>
 <e8d5554f-d78d-7711-355b-8795559e6075@amsat.org>
Subject: Re: [PATCH] vhost: fix repeated memory unmap in error paths
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 10 Feb 2022 15:20:04 +0300
Message-Id: <271611644494912@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj4xMC4wMi4yMDIyLCAxNTowNiwgIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiAmbHQ7ZjRi
dWdAYW1zYXQub3JnJmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48cD5PbiAxMC8yLzIyIDEyOjQ2LCBL
b25zdGFudGluIEtobGVibmlrb3Ygd3JvdGU6PC9wPjxibG9ja3F1b3RlPsKgRnV6emluZyBmb3Vu
ZCB0aGF0IG9uIHNvbWUgZXJyb3IgcGF0aHMgdmhvc3RfbWVtb3J5X3VubWFwKCkgaXMgY2FsbGVk
IHR3aWNlIG9yPGJyIC8+wqBmb3IgTlVMTCBhZGRyZXNzLiBMZXQncyByZXNldCBwb2ludGVycyBh
ZnRlciB1bm1hcCBhbmQgaW5nbm9yZSB1bm1hcCBmb3IgTlVMTC48YnIgLz7CoDxiciAvPsKgU2ln
bmVkLW9mZi1ieTogS29uc3RhbnRpbiBLaGxlYm5pa292ICZsdDs8YSBocmVmPSJtYWlsdG86a2hs
ZWJuaWtvdkB5YW5kZXgtdGVhbS5ydSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5raGxlYm5p
a292QHlhbmRleC10ZWFtLnJ1PC9hPiZndDs8YnIgLz7CoC0tLTxiciAvPsKgwqDCoGh3L3ZpcnRp
by92aG9zdC5jIHwgNCArKystPGJyIC8+wqDCoMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKTxiciAvPsKgPGJyIC8+wqBkaWZmIC0tZ2l0IGEvaHcvdmlydGlv
L3Zob3N0LmMgYi9ody92aXJ0aW8vdmhvc3QuYzxiciAvPsKgaW5kZXggN2IwM2VmY2NlYy4uNGU1
ZDVmMmVhNCAxMDA2NDQ8YnIgLz7CoC0tLSBhL2h3L3ZpcnRpby92aG9zdC5jPGJyIC8+wqArKysg
Yi9ody92aXJ0aW8vdmhvc3QuYzxiciAvPsKgQEAgLTMzNSw3ICszMzUsNyBAQCBzdGF0aWMgdm9p
ZCB2aG9zdF9tZW1vcnlfdW5tYXAoc3RydWN0IHZob3N0X2RldiAqZGV2LCB2b2lkICpidWZmZXIs
PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBod2FkZHIgbGVuLCBpbnQgaXNfd3JpdGUsPGJyIC8+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBod2FkZHIgYWNjZXNzX2xlbik8YnIgLz7CoMKgwqB7PCEtLSAtLT48YnIgLz7CoC0gaWYgKCF2
aG9zdF9kZXZfaGFzX2lvbW11KGRldikpIHs8IS0tIC0tPjxiciAvPsKgKyBpZiAoYnVmZmVyICZh
bXA7JmFtcDsgIXZob3N0X2Rldl9oYXNfaW9tbXUoZGV2KSkgezwhLS0gLS0+PC9ibG9ja3F1b3Rl
PjxwPjxiciAvPlNob3VsZG4ndCB3ZSBzaW1wbHkgYWRkIGFuICJhc3NlcnQoYnVmZmVyKTsiIGNo
ZWNrIGhlcmUgaW5zdGVhZD88L3A+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2Plllcywg
cHJvYmFibHkgZXJyb3IgcGF0aCBpbiBxdWV1ZSBtYW5hZ2VtZW50IHNob3VsZCBiZSBmaXhlZCBp
bnN0ZWFkLjwvZGl2PjxkaXY+QnV0IGhhbmRsaW5nIE5VTEwgcG9pbnRlcnMgaW4gZnVuY3Rpb25z
IGxpa2UgZnJlZSgpIG1ha2UgY29kZSBjbGVhbmVyLjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2tx
dW90ZT48cD7CoDwvcD48YmxvY2txdW90ZT7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3B1X3BoeXNp
Y2FsX21lbW9yeV91bm1hcChidWZmZXIsIGxlbiwgaXNfd3JpdGUsIGFjY2Vzc19sZW4pOzxiciAv
PsKgwqDCoMKgwqDCoMKgfTxiciAvPsKgwqDCoH08YnIgLz7CoEBAIC0xMTkxLDYgKzExOTEsNyBA
QCBmYWlsX2FsbG9jX2F2YWlsOjxiciAvPsKgwqDCoMKgwqDCoMKgdmhvc3RfbWVtb3J5X3VubWFw
KGRldiwgdnEtJmd0O2Rlc2MsIHZpcnRpb19xdWV1ZV9nZXRfZGVzY19zaXplKHZkZXYsIGlkeCks
PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDAsIDApOzxiciAvPsKgwqDCoGZhaWxfYWxsb2NfZGVzYzo8YnIgLz7CoCsgdnEtJmd0O3VzZWQg
PSB2cS0mZ3Q7YXZhaWwgPSB2cS0mZ3Q7ZGVzYyA9IE5VTEw7PGJyIC8+wqDCoMKgwqDCoMKgwqBy
ZXR1cm4gcjs8YnIgLz7CoMKgwqB9PGJyIC8+wqDCoMKgPGJyIC8+wqBAQCAtMTIzOCw2ICsxMjM5
LDcgQEAgc3RhdGljIHZvaWQgdmhvc3RfdmlydHF1ZXVlX3N0b3Aoc3RydWN0IHZob3N0X2RldiAq
ZGV2LDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAwLCB2aXJ0aW9fcXVldWVfZ2V0X2F2YWlsX3NpemUodmRldiwgaWR4KSk7PGJyIC8+wqDC
oMKgwqDCoMKgwqB2aG9zdF9tZW1vcnlfdW5tYXAoZGV2LCB2cS0mZ3Q7ZGVzYywgdmlydGlvX3F1
ZXVlX2dldF9kZXNjX3NpemUodmRldiwgaWR4KSw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMCwgdmlydGlvX3F1ZXVlX2dldF9kZXNjX3Np
emUodmRldiwgaWR4KSk7PGJyIC8+wqArIHZxLSZndDt1c2VkID0gdnEtJmd0O2F2YWlsID0gdnEt
Jmd0O2Rlc2MgPSBOVUxMOzxiciAvPsKgwqDCoH08L2Jsb2NrcXVvdGU+PHA+PGJyIC8+VGhpcyBw
YXJ0IGlzIE9LLjwvcD48L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2
Pi0twqA8L2Rpdj48ZGl2PtCa0L7QvdGB0YLQsNC90YLQuNC9INCl0LvQtdCx0L3QuNC60L7Qsjwv
ZGl2PjxkaXY+aHR0cHM6Ly9zdGFmZi55YW5kZXgtdGVhbS5ydS9raGxlYm5pa292PC9kaXY+PGRp
dj7CoDwvZGl2Pg==

