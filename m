Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97524B0D14
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:02:41 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI89o-0001Up-IN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI847-00085m-4E
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:56:49 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:46434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI83u-0002LH-F4
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:56:44 -0500
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 624E32E0DBE;
 Thu, 10 Feb 2022 14:56:30 +0300 (MSK)
Received: from 2a02:6b8:c0c:150a:0:640:92c9:1fa
 (2a02:6b8:c0c:150a:0:640:92c9:1fa [2a02:6b8:c0c:150a:0:640:92c9:1fa])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 QuYueA0GYiE1-uUGmmkkp; Thu, 10 Feb 2022 14:56:30 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644494190; bh=qwJmz77dgKrzxpmpLtDuIsJksd6WBzRrAcQXAUsr+y0=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=wYOarsMPT+ICgiP/F3pENkZtfzJd/upHBI8GcLmhrDBP1uHQYy8ddwSX0xLgZ3hmx
 5d4k37NaViM53k7yNXy+OKtcK0S2smD+B36NwYLxYOIaZgNOZ78LeubD/Sx7HsLqBZ
 qYf6uNDaE1JxZvnNNqyeUvo976NvmaaG41dWhdqg=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from myt6-af0b0b987ed8.qloud-c.yandex.net
 (myt6-af0b0b987ed8.qloud-c.yandex.net [2a02:6b8:c12:2388:0:640:af0b:b98])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 GuYMlB0HDmI1-OkB2UBRB
 for <khlebnikov@yandex-team.ru>; Thu, 10 Feb 2022 14:56:19 +0300
Received: by myt6-af0b0b987ed8.qloud-c.yandex.net with HTTP;
 Thu, 10 Feb 2022 14:56:19 +0300
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <793c7d61-88ed-2820-5866-c0236cd5ebea@amsat.org>
References: <164449347000.2210159.3879447183273643758.stgit@dynamic-vpn.dhcp.yndx.net>
 <793c7d61-88ed-2820-5866-c0236cd5ebea@amsat.org>
Subject: Re: [PATCH] meson: put custom CFLAGS after default CFLAGS
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 10 Feb 2022 14:56:29 +0300
Message-Id: <221811644493982@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjEwLjAyLjIwMjIsIDE0OjUyLCAiUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kiICZsdDtmNGJ1Z0BhbXNhdC5vcmcmZ3Q7OjwvZGl2PjxibG9ja3F1
b3RlPjxwPkhpIEtvbnN0YW50aW4sPGJyIC8+PGJyIC8+T24gMTAvMi8yMiAxMjo0NCwgS29uc3Rh
bnRpbiBLaGxlYm5pa292IHdyb3RlOjwvcD48YmxvY2txdW90ZT7CoEZsYWdzIHBhc3NlZCB0byBj
b25maWd1cmUgbXVzdCBiZSBhdCB0aGUgZW5kIHRvIG92ZXJyaWRlIGRlZmF1bHRzLjxiciAvPsKg
PGJyIC8+wqBTaWduZWQtb2ZmLWJ5OiBLb25zdGFudGluIEtobGVibmlrb3YgJmx0OzxhIGhyZWY9
Im1haWx0bzpraGxlYm5pa292QHlhbmRleC10ZWFtLnJ1IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJy
ZXIiPmtobGVibmlrb3ZAeWFuZGV4LXRlYW0ucnU8L2E+Jmd0OzxiciAvPsKgLS0tPGJyIC8+wqDC
oMKgbWVzb24uYnVpbGQgfCAxMiArKysrKystLS0tLS08YnIgLz7CoMKgwqAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKTxiciAvPsKgPGJyIC8+wqBkaWZmIC0t
Z2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZDxiciAvPsKgaW5kZXggNWY0MzM1NTA3MS4u
ZDk0ZjNlZTNlMyAxMDA2NDQ8YnIgLz7CoC0tLSBhL21lc29uLmJ1aWxkPGJyIC8+wqArKysgYi9t
ZXNvbi5idWlsZDxiciAvPsKgQEAgLTMyOTMsMTMgKzMyOTMsMTMgQEAgaWYgdGFyZ2V0b3MgPT0g
J3dpbmRvd3MnPGJyIC8+wqDCoMKgwqDCoMKgwqBzdW1tYXJ5X2luZm8gKz0geydXaW5kb3dzIFNE
Syc6IGNvbmZpZ19ob3N0WydXSU5fU0RLJ119PGJyIC8+wqDCoMKgwqDCoGVuZGlmPGJyIC8+wqDC
oMKgZW5kaWY8YnIgLz7CoC1zdW1tYXJ5X2luZm8gKz0geydDRkxBR1MnOiAnICcuam9pbihnZXRf
b3B0aW9uKCdjX2FyZ3MnKTxiciAvPsKgLSArIFsnLU8nICsgZ2V0X29wdGlvbignb3B0aW1pemF0
aW9uJyldPGJyIC8+wqAtICsgKGdldF9vcHRpb24oJ2RlYnVnJykgPyBbJy1nJ10gOiBbXSkpfTxi
ciAvPsKgK3N1bW1hcnlfaW5mbyArPSB7J0NGTEFHUyc6ICcgJy5qb2luKFsnLU8nICsgZ2V0X29w
dGlvbignb3B0aW1pemF0aW9uJyldPGJyIC8+wqArICsgKGdldF9vcHRpb24oJ2RlYnVnJykgPyBb
Jy1nJ10gOiBbXSk8YnIgLz7CoCsgKyBnZXRfb3B0aW9uKCdjX2FyZ3MnKSl9PGJyIC8+wqDCoMKg
aWYgbGlua19sYW5ndWFnZSA9PSAnY3BwJzxiciAvPsKgLSBzdW1tYXJ5X2luZm8gKz0geydDWFhG
TEFHUyc6ICcgJy5qb2luKGdldF9vcHRpb24oJ2NwcF9hcmdzJyk8YnIgLz7CoC0gKyBbJy1PJyAr
IGdldF9vcHRpb24oJ29wdGltaXphdGlvbicpXTxiciAvPsKgLSArIChnZXRfb3B0aW9uKCdkZWJ1
ZycpID8gWyctZyddIDogW10pKX08YnIgLz7CoCsgc3VtbWFyeV9pbmZvICs9IHsnQ1hYRkxBR1Mn
OiAnICcuam9pbihbJy1PJyArIGdldF9vcHRpb24oJ29wdGltaXphdGlvbicpXTxiciAvPsKgKyAr
IChnZXRfb3B0aW9uKCdkZWJ1ZycpID8gWyctZyddIDogW10pPGJyIC8+wqArICsgZ2V0X29wdGlv
bignY3BwX2FyZ3MnKSl9PC9ibG9ja3F1b3RlPjxwPjxiciAvPlRoZXNlIGFyZSBqdXN0IGluZm9y
bWF0aXZlLi4uIFdoYXQgaXMgeW91ciBwcm9ibGVtPyBBRkFJVSBUaGlzIHBhdGNoPGJyIC8+ZG9l
c24ndCBoYXZlIGFueSBsb2dpY2FsIGltcGFjdCBvbiB0aGUgYnVpbGQgc3lzdGVtLjwvcD48L2Js
b2NrcXVvdGU+PGRpdj5Gb3IgZXhhbXBsZSBiZWZvcmUgcGF0Y2ggLi9jb25maWd1cmUgLS1leHRy
YS1jZmxhZ3M9Ii1PMCIgaGFkIG5vIGVmZmVjdC48L2Rpdj48ZGl2Pkl0J3MgZWFzeSB0byBmaW5k
IG1vcmUgY2FzZXMgYmVjYXVzZSBkZWZhdWx0ICItTzIiIGF0IHRoZSBlbmQgaGFzIGJpZyBpbXBh
Y3QuPC9kaXY+PGRpdj7CoDwvZGl2Pg==

