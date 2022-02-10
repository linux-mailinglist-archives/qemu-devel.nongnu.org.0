Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D344B0D7A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:23:08 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8Tb-0000GX-Bz
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI8El-0005b6-5W
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:07:48 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:33148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI8EZ-0004WN-8Q
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:07:45 -0500
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id EC37E2E0E7D;
 Thu, 10 Feb 2022 15:06:56 +0300 (MSK)
Received: from 2a02:6b8:c0c:150a:0:640:92c9:1fa
 (2a02:6b8:c0c:150a:0:640:92c9:1fa [2a02:6b8:c0c:150a:0:640:92c9:1fa])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 r6ZCpA0Ga0U1-6uGG7hSX; Thu, 10 Feb 2022 15:06:56 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644494816; bh=QIu7SL0SGoXTNZQ0WOrXY/wU0H5t8qzKsjlIGTulyZI=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=AoxN6TYQsRmwaIO0Py0d6bkjYOzqJF2rWaOoiX5SSovBkDyWv6YuxLG9m6WonfMZt
 Dik3uxsmcF90P2yn/Jg/nrMvvbFhlRtWcf3D1vw7ShhiIgvD6KhkDNt52VT/wqTd5x
 mg7T4DyJnKxrP2dRZtMPTOfL5OJeNdgWFbBtYyg0=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vla1-36b7415cbc1b.qloud-c.yandex.net
 (vla1-36b7415cbc1b.qloud-c.yandex.net [2a02:6b8:c0d:3192:0:640:36b7:415c])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 e6ZuT70HBW21-U9BrEYjg
 for <khlebnikov@yandex-team.ru>; Thu, 10 Feb 2022 15:06:45 +0300
Received: by vla1-36b7415cbc1b.qloud-c.yandex.net with HTTP;
 Thu, 10 Feb 2022 15:06:45 +0300
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <9f4f0f8a-fa0d-7ca6-122c-4fa538109e65@amsat.org>
References: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
 <9f4f0f8a-fa0d-7ca6-122c-4fa538109e65@amsat.org>
Subject: Re: [PATCH 1/2] vhost-user-blk: handle errors in
 vhost_user_blk_connect
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 10 Feb 2022 15:06:55 +0300
Message-Id: <217111644494255@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjEwLjAyLjIwMjIsIDE0OjU2LCAiUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kiICZsdDtmNGJ1Z0BhbXNhdC5vcmcmZ3Q7OjwvZGl2PjxibG9ja3F1
b3RlPjxwPk9uIDEwLzIvMjIgMTI6NDYsIEtvbnN0YW50aW4gS2hsZWJuaWtvdiB3cm90ZTo8L3A+
PGJsb2NrcXVvdGU+wqBDbGVhbnVwIHZob3N0IGRldmljZSBhbmQgdXBkYXRlIGNvbm5lY3Rpb24g
c3RhdGUgd2hlbiBpbml0aWFsaXphdGlvbiBmYWlscy48YnIgLz7CoDxiciAvPsKgU2lnbmVkLW9m
Zi1ieTogS29uc3RhbnRpbiBLaGxlYm5pa292ICZsdDs8YSBocmVmPSJtYWlsdG86a2hsZWJuaWtv
dkB5YW5kZXgtdGVhbS5ydSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5raGxlYm5pa292QHlh
bmRleC10ZWFtLnJ1PC9hPiZndDs8YnIgLz7CoC0tLTxiciAvPsKgwqDCoGh3L2Jsb2NrL3Zob3N0
LXVzZXItYmxrLmMgfCAxMCArKysrKysrKy0tPGJyIC8+wqDCoMKgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSk8YnIgLz7CoDxiciAvPsKgZGlmZiAtLWdpdCBh
L2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgYi9ody9ibG9jay92aG9zdC11c2VyLWJsay5jPGJy
IC8+wqBpbmRleCAxYTQyYWU5MTg3Li4zNWFjMTg4Y2E0IDEwMDY0NDxiciAvPsKgLS0tIGEvaHcv
YmxvY2svdmhvc3QtdXNlci1ibGsuYzxiciAvPsKgKysrIGIvaHcvYmxvY2svdmhvc3QtdXNlci1i
bGsuYzxiciAvPsKgQEAgLTM0MCwxOCArMzQwLDI0IEBAIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9i
bGtfY29ubmVjdChEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApPGJyIC8+wqDCoMKgwqDC
oMKgwqByZXQgPSB2aG9zdF9kZXZfaW5pdCgmYW1wO3MtJmd0O2RldiwgJmFtcDtzLSZndDt2aG9z
dF91c2VyLCBWSE9TVF9CQUNLRU5EX1RZUEVfVVNFUiwgMCw8YnIgLz7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVycnApOzxiciAvPsKgwqDC
oMKgwqDCoMKgaWYgKHJldCAmbHQ7IDApIHs8IS0tIC0tPjxiciAvPsKgLSByZXR1cm4gcmV0Ozxi
ciAvPsKgKyBnb3RvIGVycl9pbml0OzxiciAvPsKgwqDCoMKgwqDCoMKgfTxiciAvPsKgwqDCoDxi
ciAvPsKgwqDCoMKgwqDCoMKgLyogcmVzdG9yZSB2aG9zdCBzdGF0ZSAqLzxiciAvPsKgwqDCoMKg
wqDCoMKgaWYgKHZpcnRpb19kZXZpY2Vfc3RhcnRlZCh2ZGV2LCB2ZGV2LSZndDtzdGF0dXMpKSB7
PCEtLSAtLT48YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdmhvc3RfdXNlcl9ibGtf
c3RhcnQodmRldiwgZXJycCk7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgJmx0
OyAwKSB7PCEtLSAtLT48YnIgLz7CoC0gcmV0dXJuIHJldDs8YnIgLz7CoCsgZ290byBlcnJfc3Rh
cnQ7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH08YnIgLz7CoMKgwqDCoMKgwqDCoH08L2Js
b2NrcXVvdGU+PHA+PGJyIC8+V2hhdCBhYm91dCBtb3ZpbmcgaGVyZSAuLi46PGJyIC8+PGJyIC8+
wqDCoMKgwqDCoHMtJmd0O2Nvbm5lY3RlZCA9IHRydWU7PGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+
wqDCoMKgPGJyIC8+wqDCoMKgwqDCoMKgwqByZXR1cm4gMDs8YnIgLz7CoCs8YnIgLz7CoCtlcnJf
c3RhcnQ6PGJyIC8+wqArIHZob3N0X2Rldl9jbGVhbnVwKCZhbXA7cy0mZ3Q7ZGV2KTs8YnIgLz7C
oCtlcnJfaW5pdDo8YnIgLz7CoCsgcy0mZ3Q7Y29ubmVjdGVkID0gZmFsc2U7PC9ibG9ja3F1b3Rl
PjxwPjxiciAvPi4uLiB0byBoYXZlIGEgc2luZ2xlICdlcnInIGxhYmVsPzwvcD48L2Jsb2NrcXVv
dGU+PGRpdj7CoDwvZGl2PjxkaXY+VGhpcyBtaWdodCBjb25mdXNlIGNvZGUgY2FsbGVkIGhlcmUg
Zm9yIGluaXRpYWxpemF0aW9uLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pk1vcmUgbGlrZWx5IHRo
aXMgZmxhZyBtdXN0IGJlIG1haW50YWluZWQgYnkgdmhvc3QgdHJhbnNwb3J0IGxheWVyLjwvZGl2
PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZT48cD7CoDwvcD48YmxvY2txdW90ZT7CoCsgcmV0dXJu
IHJldDs8YnIgLz7CoMKgwqB9PGJyIC8+wqDCoMKgPGJyIC8+wqDCoMKgc3RhdGljIHZvaWQgdmhv
c3RfdXNlcl9ibGtfZGlzY29ubmVjdChEZXZpY2VTdGF0ZSAqZGV2KTxiciAvPsKgPGJyIC8+wqA8
L2Jsb2NrcXVvdGU+PHA+wqA8L3A+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj4tLcKgPC9kaXY+PGRpdj7QmtC+0L3RgdGC0LDQvdGC0LjQvSDQpdC70LXQsdC90LjQ
utC+0LI8L2Rpdj48ZGl2Pmh0dHBzOi8vc3RhZmYueWFuZGV4LXRlYW0ucnUva2hsZWJuaWtvdjwv
ZGl2PjxkaXY+wqA8L2Rpdj4=

