Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB346BD27
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:01:41 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mub2J-00055g-TU
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muazs-0004Ao-Ic
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:59:08 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muazo-0003O4-Gf
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:59:07 -0500
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F064F2E1337;
 Tue,  7 Dec 2021 16:58:56 +0300 (MSK)
Received: from 2a02:6b8:c08:78a:0:640:7f17:9212
 (2a02:6b8:c08:78a:0:640:7f17:9212 [2a02:6b8:c08:78a:0:640:7f17:9212])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 qwThHX0Lh0U1-wuLWKlum; Tue, 07 Dec 2021 16:58:56 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638885536; bh=IUsDmnoZim+V9/O6s7u4SnnALbHTRsEli4fPMGr/4CA=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=iMNjP7LYDayEP0+T2iiNLd58vDp+cu5gD9E2aoPH6anrtkIE4EAcRwMZFCVjwcusM
 EiNf5wu63hwsykep5cX6e3GQhDfZmO6osb09/BmFYcbDOL5rRecfRo/m9fuckWizei
 UrtU8hebP7PDBOPxyKx5Wx0K1YiuL9v/7MrTeZr8=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from iva8-dc7983bf477b.qloud-c.yandex.net
 (iva8-dc7983bf477b.qloud-c.yandex.net [2a02:6b8:c0c:1086:0:640:dc79:83bf])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 hwTlXO1LP8c1-5A1s7R54
 for <d-tatianin@yandex-team.ru>; Tue, 07 Dec 2021 16:58:46 +0300
X-Yandex-Fwd: 2
Received: by iva8-dc7983bf477b.qloud-c.yandex.net with HTTP;
 Tue, 07 Dec 2021 16:58:46 +0300
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <3af46862-7c8d-dcdd-9ca8-8ace4f3a554a@redhat.com>
References: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
 <20211207070607.1422670-2-d-tatianin@yandex-team.ru>
 <3af46862-7c8d-dcdd-9ca8-8ace4f3a554a@redhat.com>
Subject: Re: [PATCH v1 2/2] osdep: support mempolicy for preallocation in
 os_mem_prealloc
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 07 Dec 2021 16:58:56 +0300
Message-Id: <227321638883575@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "sw@weilnetz.de" <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj5JIGJlbGlldmUgeW91J3JlIHJpZ2h0LiBMb29raW5nIGF0IHRoZSBpbXBsZW1lbnRhdGlv
biBvZiBzaG1lbV9hbGxvY19wYWdlLCBpdCB1c2VzIHRoZSBpbm9kZSBwb2xpY3ksIHdoaWNoIGlz
IHNldCB2aWE8YnIgLz52bWEtJmd0O3NldF9wb2xpY3kgKGZyb20gdGhlIG1iaW5kKCkgY2FsbCBp
biB0aGlzIGNhc2UpLiBzZXRfbWVtcG9saWN5IGlzIGJvdGggdXNlbGVzcyBhbmQgcmVkdW5kYW50
IGhlcmUsIGFzIHRocmVhZCdzPGJyIC8+cG9saWN5IGlzIG9ubHkgZXZlciB1c2VkIGluIGNhc2Ug
dm1hLSZndDtnZXRfcG9saWN5IHJldHVybnMgTlVMTCAod2hpY2ggaXQgZG9lc24ndCBpbiBvdXIg
Y2FzZSkuPGJyIC8+U29ycnkgZm9yIHRoZSBjb25mdXNpb24uPGJyIC8+PGJyIC8+VGhhbmtzLDxi
ciAvPkRhbmlpbDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjA3LjEyLjIwMjEsIDExOjEzLCAiRGF2
aWQgSGlsZGVuYnJhbmQiICZsdDtkYXZpZEByZWRoYXQuY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90
ZT48cD5PbiAwNy4xMi4yMSAwODowNiwgRGFuaWlsIFRhdGlhbmluIHdyb3RlOjwvcD48YmxvY2tx
dW90ZT7CoFRoaXMgaXMgbmVlZGVkIGZvciBjYXNlcyB3aGVyZSB3ZSB3YW50IHRvIG1ha2Ugc3Vy
ZSB0aGF0IGEgc2hhcmVkIG1lbW9yeTxiciAvPsKgcmVnaW9uIGdldHMgYWxsb2NhdGVkIGZyb20g
YSBzcGVjaWZpYyBOVU1BIG5vZGUuIFRoaXMgaXMgaW1wb3NzaWJsZSB0byBkbzxiciAvPsKgd2l0
aCBtYmluZCgyKSBiZWNhdXNlIGl0IGlnbm9yZXMgdGhlIHBvbGljeSBmb3IgbWVtb3J5IG1hcHBl
ZCB3aXRoPGJyIC8+wqBNQVBfU0hBUkVELiBXZSB3b3JrIGFyb3VuZCB0aGlzIGJ5IGNhbGxpbmcg
c2V0X21lbXBvbGljeSBmcm9tIHByZWFsbG9jPGJyIC8+wqB0aHJlYWRzIGluc3RlYWQuPC9ibG9j
a3F1b3RlPjxwPjxiciAvPlRoYXQncyBub3QgcXVpdGUgdHJ1ZSBJIHRoaW5rLCBob3cgd2VyZSB5
b3UgYWJsZSB0byBvYnNlcnZlIHRoaXM/IERvIHlvdTxiciAvPmhhdmUgYSByZXByb2R1Y2VyPzxi
ciAvPjxiciAvPldoaWxlIHRoZSBtYW4gcGFnZSBzYXlzOjxiciAvPjxiciAvPiI8YnIgLz5UaGUg
c3BlY2lmaWVkIHBvbGljeSB3aWxsIGJlIGlnbm9yZWQgZm9yIGFueSBNQVBfU0hBUkVEIG1hcHBp
bmdzIGluPGJyIC8+dGhlIHNwZWNpZmllZCBtZW1vcnkgcmFuZ2UuIFJhdGhlciB0aGUgcGFnZXMg
d2lsbCBiZSBhbGxvY2F0ZWQ8YnIgLz5hY2NvcmRpbmcgdG8gdGhlIG1lbW9yeSBwb2xpY3kgb2Yg
dGhlIHRocmVhZCB0aGF0IGNhdXNlZCB0aGUgcGFnZSB0byBiZTxiciAvPmFsbG9jYXRlZC4gQWdh
aW4sIHRoaXMgbWF5IG5vdCBiZSB0aGUgdGhyZWFkIHRoYXQgY2FsbGVkIG1iaW5kKCkuPGJyIC8+
IjxiciAvPjxiciAvPldoYXQgaXQgcmVhbGx5IG1lYW5zIGlzIHRoYXQgYXMgbG9uZyBhcyB3ZSBh
Y2Nlc3MgdGhhdCBtZW1vcnkgdmlhIHRoZTxiciAvPipWTUEqIGZvciB3aGljaCB3ZSBjYWxsZWQg
bWJpbmQoKSwgd2hpY2ggaXMgdGhlIGNhc2Ugd2hlbiAqbm90KiB1c2luZzxiciAvPmZhbGxvY2F0
ZSgpIHRvIHByZWFsbG9jYXRlIG1lbW9yeSwgd2UgZW5kIHVwIHVzaW5nIHRoZSBjb3JyZWN0IHBv
bGljeS48YnIgLz48YnIgLz48YnIgLz5JIGRpZCBleHBlcmltZW50cyBhIHdoaWxlIGFnbyB3aXRo
IGh1Z2V0bGJmcyBzaGFyZWQgbWVtb3J5IGFuZCBpdDxiciAvPnByb3Blcmx5IGFsbG9jYXRlZCBm
cm9tIHRoZSByaWdodCBub2RlLiBTbyBJJ2QgYmUgY3VyaW91cyBob3cgeW91PGJyIC8+dHJpZ2dl
ciB0aGlzLjxiciAvPsKgPC9wPi0tPGJyIC8+VGhhbmtzLDxiciAvPjxiciAvPkRhdmlkIC8gZGhp
bGRlbmI8YnIgLz7CoDwvYmxvY2txdW90ZT4=

