Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19875BEEEB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:04:07 +0200 (CEST)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakPW-0003gt-CV
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oafkT-0005iC-Gm
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:05:31 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:42014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oafkP-0005iW-2N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:05:23 -0400
Received: from vla1-f615dbed14ca.qloud-c.yandex.net
 (vla1-f615dbed14ca.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3183:0:640:f615:dbed])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2C2132E1470;
 Tue, 20 Sep 2022 19:05:14 +0300 (MSK)
Received: from 2a02:6b8:c1f:6255:0:640:95c3:0 (2a02:6b8:c1f:6255:0:640:95c3:0
 [2a02:6b8:c1f:6255:0:640:95c3:0])
 by vla1-f615dbed14ca.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 t4kKK31J1Os1-5EJaKZ40; Tue, 20 Sep 2022 19:05:14 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663689914; bh=jSYsxRJyGJKXVzCAdQoiFgQIz8eg9G/O6BWNsUNlTGw=;
 h=Cc:Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=weWGLxGdqpVsyzUYvEQ18C+RYkHjCltlFgQO4VQn8CHITguvbJ7/t+b8C/TxccjTd
 BsKUiRiyqrWmnVCT0mAwgzRMkVXPoskXYQFbGKcBI+gNwPJ4Qz5Xb7XwYHr3RczkK/
 3zz/Eg7yGPzuhZKckJfutCatqRBrEoWXYespA4Po=
Authentication-Results: vla1-f615dbed14ca.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from 25wc44h4wzm3vfpi.iva.yp-c.yandex.net
 (25wc44h4wzm3vfpi.iva.yp-c.yandex.net [2a02:6b8:c0c:3ad:0:640:89df:0])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 k2kaIZ1KbqM1-acadAL2X
 for <davydov-max@yandex-team.ru>; Tue, 20 Sep 2022 19:05:04 +0300
Received: by 25wc44h4wzm3vfpi.iva.yp-c.yandex.net with HTTP;
 Tue, 20 Sep 2022 19:05:04 +0300
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
In-Reply-To: <CAJ+F1CKj5zELJ=HHOde4FMk_q9P3-o4qD+0J0iO-LaSKJZievw@mail.gmail.com>
References: <20220825165247.33704-1-davydov-max@yandex-team.ru>
 <CAJ+F1CKj5zELJ=HHOde4FMk_q9P3-o4qD+0J0iO-LaSKJZievw@mail.gmail.com>
Subject: Re: [PATCH] chardev: fix segfault in finalize
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 20 Sep 2022 19:05:14 +0300
Message-Id: <155421663689437@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj5IaSE8YnIgLz5Db3VsZCB5b3Ugc2VuZCBhIHB1bGwgcmVxdWVzdD88L2Rpdj48ZGl2PsKg
PC9kaXY+PGRpdj4yNi4wOC4yMDIyLCAxMToyMSwgIk1hcmMtQW5kcsOpIEx1cmVhdSIgJmx0O21h
cmNhbmRyZS5sdXJlYXVAZ21haWwuY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48ZGl2PkhpPGRp
dj7CoDwvZGl2PsKgPGRpdj48ZGl2Pk9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDk6MDIgUE0gTWFr
c2ltIERhdnlkb3YgJmx0OzxhIGhyZWY9Im1haWx0bzpkYXZ5ZG92LW1heEB5YW5kZXgtdGVhbS5y
dSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5kYXZ5ZG92LW1heEB5YW5kZXgtdGVhbS5ydTwv
YT4mZ3Q7IHdyb3RlOjwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXItbGVmdC1jb2xvcjpy
Z2IoIDIwNCAsIDIwNCAsIDIwNCApO2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0
LXdpZHRoOjFweDttYXJnaW46MHB4IDBweCAwcHggMC44ZXg7cGFkZGluZy1sZWZ0OjFleCI+SWYg
ZmluYWxpemUgY2hhcmRldi1tc21vdXNlIG9yIGNoYXJkZXYtd2N0YWJsZSBpcyBjYWxsZWQgaW1t
ZWRpYXRlbHkgYWZ0ZXI8YnIgLz5pbml0IGl0IGNhc2VzIFFFTVUgdG8gY3Jhc2ggd2l0aCBzZWdm
YXVsdC4gVGhpcyBoYXBwZW5zIGJlY2F1c2Ugb2Y8YnIgLz5RVEFJTFFfUkVNT1ZFIGluIHFlbXVf
aW5wdXRfaGFuZGxlcl91bnJlZ2lzdGVyIHRyaWVzIHRvIGRlcmVmZXJlbmNlPGJyIC8+TlVMTCBw
b2ludGVyLjxiciAvPkZvciBpbnN0YW5jZSwgdGhpcyBlcnJvciBjYW4gYmUgcmVwcm9kdWNlZCB2
aWEgYHFvbS1saXN0LXByb3BlcnRpZXNgPGJyIC8+Y29tbWFuZC48YnIgLz48YnIgLz5TaWduZWQt
b2ZmLWJ5OiBNYWtzaW0gRGF2eWRvdiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhdnlkb3YtbWF4QHlh
bmRleC10ZWFtLnJ1IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5k
YXZ5ZG92LW1heEB5YW5kZXgtdGVhbS5ydTwvYT4mZ3Q7PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rp
dj48ZGl2PlJldmlld2VkLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgJmx0OzxhIGhyZWY9Im1haWx0
bzptYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+
bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPC9hPiZndDs8L2Rpdj48ZGl2PsKgPC9kaXY+PGJs
b2NrcXVvdGUgc3R5bGU9ImJvcmRlci1sZWZ0LWNvbG9yOnJnYiggMjA0ICwgMjA0ICwgMjA0ICk7
Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O21hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtwYWRkaW5nLWxlZnQ6MWV4Ij4tLS08YnIgLz7CoGNoYXJkZXYvbXNtb3Vz
ZS5jwqAgfCA0ICsrKy08YnIgLz7CoGNoYXJkZXYvd2N0YWJsZXQuYyB8IDQgKysrLTxiciAvPsKg
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pPGJyIC8+PGJy
IC8+ZGlmZiAtLWdpdCBhL2NoYXJkZXYvbXNtb3VzZS5jIGIvY2hhcmRldi9tc21vdXNlLmM8YnIg
Lz5pbmRleCBlYjkyMzFkY2RiLi4yY2MxYjE2NTYxIDEwMDY0NDxiciAvPi0tLSBhL2NoYXJkZXYv
bXNtb3VzZS5jPGJyIC8+KysrIGIvY2hhcmRldi9tc21vdXNlLmM8YnIgLz5AQCAtMTQ2LDcgKzE0
Niw5IEBAIHN0YXRpYyB2b2lkIGNoYXJfbXNtb3VzZV9maW5hbGl6ZShPYmplY3QgKm9iaik8YnIg
Lz7CoHs8IS0tIC0tPjxiciAvPsKgIMKgIMKgTW91c2VDaGFyZGV2ICptb3VzZSA9IE1PVVNFX0NI
QVJERVYob2JqKTs8YnIgLz48YnIgLz4twqAgwqAgcWVtdV9pbnB1dF9oYW5kbGVyX3VucmVnaXN0
ZXIobW91c2UtJmd0O2hzKTs8YnIgLz4rwqAgwqAgaWYgKG1vdXNlLSZndDtocykgezwhLS0gLS0+
PGJyIC8+K8KgIMKgIMKgIMKgIHFlbXVfaW5wdXRfaGFuZGxlcl91bnJlZ2lzdGVyKG1vdXNlLSZn
dDtocyk7PGJyIC8+K8KgIMKgIH08YnIgLz7CoH08YnIgLz48YnIgLz7CoHN0YXRpYyBRZW11SW5w
dXRIYW5kbGVyIG1zbW91c2VfaGFuZGxlciA9IHs8IS0tIC0tPjxiciAvPmRpZmYgLS1naXQgYS9j
aGFyZGV2L3djdGFibGV0LmMgYi9jaGFyZGV2L3djdGFibGV0LmM8YnIgLz5pbmRleCBlOGIyOTJj
NDNjLi40M2JkZjZiNjA4IDEwMDY0NDxiciAvPi0tLSBhL2NoYXJkZXYvd2N0YWJsZXQuYzxiciAv
PisrKyBiL2NoYXJkZXYvd2N0YWJsZXQuYzxiciAvPkBAIC0zMTksNyArMzE5LDkgQEAgc3RhdGlj
IHZvaWQgd2N0YWJsZXRfY2hyX2ZpbmFsaXplKE9iamVjdCAqb2JqKTxiciAvPsKgezwhLS0gLS0+
PGJyIC8+wqAgwqAgwqBUYWJsZXRDaGFyZGV2ICp0YWJsZXQgPSBXQ1RBQkxFVF9DSEFSREVWKG9i
aik7PGJyIC8+PGJyIC8+LcKgIMKgIHFlbXVfaW5wdXRfaGFuZGxlcl91bnJlZ2lzdGVyKHRhYmxl
dC0mZ3Q7aHMpOzxiciAvPivCoCDCoCBpZiAodGFibGV0LSZndDtocykgezwhLS0gLS0+PGJyIC8+
K8KgIMKgIMKgIMKgIHFlbXVfaW5wdXRfaGFuZGxlcl91bnJlZ2lzdGVyKHRhYmxldC0mZ3Q7aHMp
OzxiciAvPivCoCDCoCB9PGJyIC8+wqB9PGJyIC8+PGJyIC8+wqBzdGF0aWMgdm9pZCB3Y3RhYmxl
dF9jaHJfb3BlbihDaGFyZGV2ICpjaHIsPGJyIC8+LS08YnIgLz4yLjI1LjE8YnIgLz48YnIgLz7C
oDwvYmxvY2txdW90ZT48L2Rpdj48YnIgLz48YnIgLz4tLTxkaXY+TWFyYy1BbmRyw6kgTHVyZWF1
PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4t
LcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5NYWtzaW0gRGF2eWRvdjwvZGl2
PjxkaXY+wqA8L2Rpdj4=

