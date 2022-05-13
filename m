Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18052650F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:46:03 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWYM-0005GL-V4
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1npWSO-0005zI-D2
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:39:52 -0400
Received: from [106.39.185.58] (port=51226 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1npWSH-0005Yo-Nl
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:39:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 2D7563000019C;
 Fri, 13 May 2022 22:39:36 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from desktop-emk286e
 (220.39.88.218.broad.cd.sc.dynamic.163data.com.cn [218.88.39.220])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P4032146T281471990100336S1652452775147059_; 
 Fri, 13 May 2022 22:39:35 +0800 (CST)
X-UNIQUE-TAG: <3530dd775e14542bc1b328d29f7f69c0>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: kkostiuk@redhat.com
X-RCPT-COUNT: 6
X-SENDER-IP: 218.88.39.220
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date: Fri, 13 May 2022 22:39:34 +0800
From: "luzhipeng@cestc.cn" <luzhipeng@cestc.cn>
To: "Konstantin Kostiuk" <kkostiuk@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 "Michael Roth" <michael.roth@amd.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?RGFuaWVsIFAgLiBCZXJyYW5nw6k=?= <berrange@redhat.com>, 
 "Michal Privoznik" <mprivozn@redhat.com>
Subject: Re: Re: [PATCH v2] qga: add guest-get-diskstats command for Linux
 guests
References: <20220513103924.1332-1-luzhipeng@cestc.cn>, 
 <CAPMcbCqXGMOC-z+LQgduJ98uk68Jk=+UyPD0es8O-h-RiBXQdA@mail.gmail.com>, 
 <CAPMcbCr6=gcByro+GZYsU_Mh7PuPRz1mLhdsxQG219zPcov_FQ@mail.gmail.com>
X-Priority: 3
X-GUID: 20510E2F-47B7-4467-9BE1-2D2F74AA13DD
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[cn]
Mime-Version: 1.0
Message-ID: <202205132239339365862@cestc.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart751050633102_=----"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.58 (failed)
Received-SPF: pass client-ip=106.39.185.58; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
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

This is a multi-part message in MIME format.

------=_001_NextPart751050633102_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

T0ssICBpbmRlZWQgbGVhayBtZW1vcnkNCnRoYW5rcywgDQoNCg0KDQpsdXpoaXBlbmdAY2VzdGMu
Y24NCiANCkZyb206IEtvbnN0YW50aW4gS29zdGl1aw0KRGF0ZTogMjAyMi0wNS0xMyAyMjozMw0K
VG86IGx1emhpcGVuZw0KQ0M6IHFlbXUtZGV2ZWw7IE1pY2hhZWwgUm90aDsgTWFyYy1BbmRyw6kg
THVyZWF1OyBEYW5pZWwgUCAuIEJlcnJhbmfDqTsgTWljaGFsIFByaXZvem5paw0KU3ViamVjdDog
UmU6IFtQQVRDSCB2Ml0gcWdhOiBhZGQgZ3Vlc3QtZ2V0LWRpc2tzdGF0cyBjb21tYW5kIGZvciBM
aW51eCBndWVzdHMNCg0KT24gRnJpLCBNYXkgMTMsIDIwMjIgYXQgMTo1MCBQTSBLb25zdGFudGlu
IEtvc3RpdWsgPGtrb3N0aXVrQHJlZGhhdC5jb20+IHdyb3RlOg0KDQoNCk9uIEZyaSwgTWF5IDEz
LCAyMDIyIGF0IDE6NDAgUE0gbHV6aGlwZW5nIDxsdXpoaXBlbmdAY2VzdGMuY24+IHdyb3RlOg0K
QWRkIGEgbmV3ICdndWVzdC1nZXQtZGlza3N0YXRzJyBjb21tYW5kIGZvciByZXBvcnQgZGlzayBp
byBzdGF0aXN0aWNzDQpmb3IgTGludXggZ3Vlc3RzLiBUaGlzIGNhbiBiZSB1c2VmdWxsIGZvciBn
ZXR0aW5nIGlvIGZsb3cgb3IgaGFuZGxpbmcNCklPIGZhdWx0LCBubyBuZWVkIHRvIGVudGVyIGd1
ZXN0cy4NCg0KU2lnbmVkLW9mZi1ieTogbHV6aGlwZW5nIDxsdXpoaXBlbmdAY2VzdGMuY24+DQoN
Ci0tLQ0KQ2hhbmdlcyB2MS0+djI6DQogdjE6aHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMjIw
NTEyMDExOTMwLjIxNC0xLWx1emhpcGVuZ0BjZXN0Yy5jbi8NCg0KIHFnYS9jb21tYW5kcy1wb3Np
eC5jIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBx
Z2EvY29tbWFuZHMtd2luMzIuYyB8ICA2ICsrKw0KIHFnYS9xYXBpLXNjaGVtYS5qc29uIHwgODYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2Vk
LCAxODkgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvcWdhL2NvbW1hbmRzLXBvc2l4LmMg
Yi9xZ2EvY29tbWFuZHMtcG9zaXguYw0KaW5kZXggNjlmMjA5YWY4Ny4uN2ExNmQ4NGUzYSAxMDA2
NDQNCi0tLSBhL3FnYS9jb21tYW5kcy1wb3NpeC5jDQorKysgYi9xZ2EvY29tbWFuZHMtcG9zaXgu
Yw0KQEAgLTI3ODMsNiArMjc4Myw5NiBAQCBHdWVzdE1lbW9yeUJsb2NrSW5mbyAqcW1wX2d1ZXN0
X2dldF9tZW1vcnlfYmxvY2tfaW5mbyhFcnJvciAqKmVycnApDQogICAgIHJldHVybiBpbmZvOw0K
IH0NCg0KKyNkZWZpbmUgTUFYX05BTUVfTEVOIDEyOA0KK3N0YXRpYyBHdWVzdERpc2tTdGF0c0lu
Zm9MaXN0ICpndWVzdF9nZXRfZGlza3N0YXRzKEVycm9yICoqZXJycCkNCit7DQorI2lmZGVmIENP
TkZJR19MSU5VWA0KKyAgICBHdWVzdERpc2tTdGF0c0luZm9MaXN0ICpoZWFkID0gTlVMTCwgKip0
YWlsID0gJmhlYWQ7DQorICAgIGNvbnN0IGNoYXIgKmRpc2tzdGF0cyA9ICIvcHJvYy9kaXNrc3Rh
dHMiOw0KKyAgICBGSUxFICpmcDsNCisgICAgc2l6ZV90IG47DQorICAgIGNoYXIgKmxpbmUgPSBO
VUxMOw0KKyAgICBjaGFyIGRldl9uYW1lW01BWF9OQU1FX0xFTl07DQorICAgIGludCBpOw0KKyAg
ICB1bnNpZ25lZCBpbnQgaW9zX3BnciwgdG90X3RpY2tzLCBycV90aWNrcywgd3JfdGlja3MsIGRj
X3RpY2tzLCBmbF90aWNrczsNCisgICAgdW5zaWduZWQgbG9uZyByZF9pb3MsIHJkX21lcmdlc19v
cl9yZF9zZWMsIHJkX3RpY2tzX29yX3dyX3NlYywgd3JfaW9zOw0KKyAgICB1bnNpZ25lZCBsb25n
IHdyX21lcmdlcywgcmRfc2VjX29yX3dyX2lvcywgd3Jfc2VjOw0KKyAgICB1bnNpZ25lZCBsb25n
IGRjX2lvcywgZGNfbWVyZ2VzLCBkY19zZWMsIGZsX2lvczsNCisgICAgdW5zaWduZWQgaW50IG1h
am9yLCBtaW5vcjsNCisNCisgICAgZnAgPSBmb3BlbihkaXNrc3RhdHMsICJyIik7DQorICAgIGlm
IChmcCAgPT0gTlVMTCkgew0KKyAgICAgICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJubywg
Im9wZW4oXCIlc1wiKSIsIGRpc2tzdGF0cyk7DQorICAgICAgICByZXR1cm4gTlVMTDsNCisgICAg
fQ0KKyAgICB3aGlsZSAoZ2V0bGluZSgmbGluZSwgJm4sIGZwKSAhPSAtMSkgew0KKyAgICAgICAg
R3Vlc3REaXNrU3RhdHNJbmZvICpkaXNrc3RhdGluZm87DQorICAgICAgICBHdWVzdERpc2tTdGF0
cyAqZGlza3N0YXQ7DQorICAgICAgICBpID0gc3NjYW5mKGxpbmUsICIldSAldSAlcyAlbHUgJWx1
ICVsdSINCisgICAgICAgICAgICAgICAgICAgIiVsdSAlbHUgJWx1ICVsdSAldSAldSAldSAldSIN
CisgICAgICAgICAgICAgICAgICAgIiVsdSAlbHUgJWx1ICV1ICVsdSAldSIsDQorICAgICAgICAg
ICAgICAgICAgJm1ham9yLCAmbWlub3IsIGRldl9uYW1lLA0KKyAgICAgICAgICAgICAgICAgICZy
ZF9pb3MsICZyZF9tZXJnZXNfb3JfcmRfc2VjLCAmcmRfc2VjX29yX3dyX2lvcywNCisgICAgICAg
ICAgICAgICAgICAmcmRfdGlja3Nfb3Jfd3Jfc2VjLCAmd3JfaW9zLCAmd3JfbWVyZ2VzLCAmd3Jf
c2VjLA0KKyAgICAgICAgICAgICAgICAgICZ3cl90aWNrcywgJmlvc19wZ3IsICZ0b3RfdGlja3Ms
ICZycV90aWNrcywNCisgICAgICAgICAgICAgICAgICAmZGNfaW9zLCAmZGNfbWVyZ2VzLCAmZGNf
c2VjLCAmZGNfdGlja3MsDQorICAgICAgICAgICAgICAgICAgJmZsX2lvcywgJmZsX3RpY2tzKTsN
CisNCisgICAgICAgIGRpc2tzdGF0aW5mbyA9IGdfbmV3MChHdWVzdERpc2tTdGF0c0luZm8sIDEp
Ow0KKyAgICAgICAgZGlza3N0YXQgPSBnX25ldzAoR3Vlc3REaXNrU3RhdHMsIDEpOw0KKyAgICAg
ICAgaWYgKGkgPCA3KSB7DQoNCmRpc2tzdGF0aW5mbyBhbmQgZGlza3N0YXQgcG9pbnRlcnMgZG8g
bm90IGhhdmUgZ19hdXRvcHRyIGF0dHJpYnV0ZSBhbmQNCndpbGwgYmUgbm90IGFkZGVkIHRvIHRo
ZSByZXN1bHRzIGxpc3QuDQpTbywgbG9va3MgbGlrZSB3ZSBoYXZlIGEgbWVtb3J5IGxlYWsgaW4g
dGhpcyBjYXNlLg0KDQpjaGVja2VkIHdpdGggdmFsZ3JpbmQuIA0Kd2UgaGF2ZSBhIG1lbW9yeSBs
ZWFrIG9mIGRpc2tzdGF0aW5mbyBhbmQgZGlza3N0YXQgd2hlbiBpIDwgNw0KDQpJIHN1Z2dlc3Qg
YWxsb2NhdGluZyB0aGVzZSB2YXJpYWJsZXMgYWZ0ZXIgdGhpcyBjb25kaXRpb24uDQogDQogDQor
ICAgICAgICAgICAgY29udGludWU7DQorICAgICAgICB9DQorICAgICAgICBkaXNrc3RhdGluZm8t
Pm5hbWUgPSBnX3N0cmR1cChkZXZfbmFtZSk7DQorICAgICAgICBkaXNrc3RhdGluZm8tPm1ham9y
ID0gbWFqb3I7DQorICAgICAgICBkaXNrc3RhdGluZm8tPm1pbm9yID0gbWlub3I7DQorICAgICAg
ICBpZiAoaSA9PSA3KSB7DQorICAgICAgICAgICAgZGlza3N0YXQtPnJlYWRfaW9zID0gcmRfaW9z
Ow0KKyAgICAgICAgICAgIGRpc2tzdGF0LT5yZWFkX3NlY3RvcnMgPSByZF9tZXJnZXNfb3JfcmRf
c2VjOw0KKyAgICAgICAgICAgIGRpc2tzdGF0LT53cml0ZV9pb3MgPSByZF9zZWNfb3Jfd3JfaW9z
Ow0KKyAgICAgICAgICAgIGRpc2tzdGF0LT53cml0ZV9zZWN0b3JzID0gcmRfdGlja3Nfb3Jfd3Jf
c2VjOw0KKyAgICAgICAgfQ0KKyAgICAgICAgaWYgKGkgPj0gMTQpIHsNCisgICAgICAgICAgICBk
aXNrc3RhdC0+cmVhZF9pb3MgPSByZF9pb3M7DQorICAgICAgICAgICAgZGlza3N0YXQtPnJlYWRf
c2VjdG9ycyA9IHJkX3NlY19vcl93cl9pb3M7DQorICAgICAgICAgICAgZGlza3N0YXQtPnJlYWRf
bWVyZ2VzID0gcmRfbWVyZ2VzX29yX3JkX3NlYzsNCisgICAgICAgICAgICBkaXNrc3RhdC0+cmVh
ZF90aWNrcyA9IHJkX3RpY2tzX29yX3dyX3NlYzsNCisgICAgICAgICAgICBkaXNrc3RhdC0+d3Jp
dGVfaW9zID0gd3JfaW9zOw0KKyAgICAgICAgICAgIGRpc2tzdGF0LT53cml0ZV9zZWN0b3JzID0g
d3Jfc2VjOw0KKyAgICAgICAgICAgIGRpc2tzdGF0LT53cml0ZV9tZXJnZXMgPSB3cl9tZXJnZXM7
DQorICAgICAgICAgICAgZGlza3N0YXQtPndyaXRlX3RpY2tzID0gd3JfdGlja3M7DQorICAgICAg
ICAgICAgZGlza3N0YXQtPmlvc19wZ3IgPSBpb3NfcGdyOw0KKyAgICAgICAgICAgIGRpc2tzdGF0
LT50b3RhbF90aWNrcyA9IHRvdF90aWNrczsNCisgICAgICAgICAgICBkaXNrc3RhdC0+d2VpZ2h0
X3RpY2tzID0gcnFfdGlja3M7DQorICAgICAgICB9DQorICAgICAgICBpZiAoaSA+PSAxOCkgew0K
KyAgICAgICAgICAgIGRpc2tzdGF0LT5kaXNjYXJkX2lvcyA9IGRjX2lvczsNCisgICAgICAgICAg
ICBkaXNrc3RhdC0+ZGlzY2FyZF9tZXJnZXMgPSBkY19tZXJnZXM7DQorICAgICAgICAgICAgZGlz
a3N0YXQtPmRpc2NhcmRfc2VjdG9ycyA9IGRjX3NlYzsNCisgICAgICAgICAgICBkaXNrc3RhdC0+
ZGlzY2FyZF90aWNrcyA9IGRjX3RpY2tzOw0KKyAgICAgICAgfQ0KKyAgICAgICAgaWYgKGkgPj0g
MjApIHsNCisgICAgICAgICAgICBkaXNrc3RhdC0+Zmx1c2hfaW9zID0gZmxfaW9zOw0KKyAgICAg
ICAgICAgIGRpc2tzdGF0LT5mbHVzaF90aWNrcyA9IGZsX3RpY2tzOw0KKyAgICAgICAgfQ0KKw0K
KyAgICAgICAgZGlza3N0YXRpbmZvLT5zdGF0cyA9IGRpc2tzdGF0Ow0KKyAgICAgICAgUUFQSV9M
SVNUX0FQUEVORCh0YWlsLCBkaXNrc3RhdGluZm8pOw0KKyAgICB9DQorICAgIGdfZnJlZShsaW5l
KTsNCisgICAgZmNsb3NlKGZwKTsNCisgICAgcmV0dXJuIGhlYWQ7DQorI2Vsc2UNCisgICAgZ19k
ZWJ1ZygiZGlzayBzdGF0cyByZXBvcnRpbmcgYXZhaWxhYmxlIG9ubHkgZm9yIExpbnV4Iik7DQor
ICAgIHJldHVybiBOVUxMOw0KKyNlbmRpZg0KK30NCisNCitHdWVzdERpc2tTdGF0c0luZm9MaXN0
ICpxbXBfZ3Vlc3RfZ2V0X2Rpc2tzdGF0cyhFcnJvciAqKmVycnApDQorew0KKyAgICByZXR1cm4g
Z3Vlc3RfZ2V0X2Rpc2tzdGF0cyhlcnJwKTsNCit9DQorDQogI2Vsc2UgLyogZGVmaW5lZChfX2xp
bnV4X18pICovDQoNCiB2b2lkIHFtcF9ndWVzdF9zdXNwZW5kX2Rpc2soRXJyb3IgKiplcnJwKQ0K
QEAgLTMxMzEsNiArMzIyMSwxMyBAQCBHdWVzdERpc2tJbmZvTGlzdCAqcW1wX2d1ZXN0X2dldF9k
aXNrcyhFcnJvciAqKmVycnApDQogICAgIHJldHVybiBOVUxMOw0KIH0NCg0KK0d1ZXN0RGlza1N0
YXRzSW5mb0xpc3QgKnFtcF9ndWVzdF9nZXRfZGlza3N0YXRzKEVycm9yICoqZXJycCkNCit7DQor
ICAgIGVycm9yX3NldGcoZXJycCwgUUVSUl9VTlNVUFBPUlRFRCk7DQorICAgIHJldHVybiBOVUxM
Ow0KK30NCisNCisNCiAjZW5kaWYgLyogQ09ORklHX0ZTRlJFRVpFICovDQoNCiAjaWYgIWRlZmlu
ZWQoQ09ORklHX0ZTVFJJTSkNCmRpZmYgLS1naXQgYS9xZ2EvY29tbWFuZHMtd2luMzIuYyBiL3Fn
YS9jb21tYW5kcy13aW4zMi5jDQppbmRleCBkNTZiNWZkMmE3Li5kY2RlYjc2YTY4IDEwMDY0NA0K
LS0tIGEvcWdhL2NvbW1hbmRzLXdpbjMyLmMNCisrKyBiL3FnYS9jb21tYW5kcy13aW4zMi5jDQpA
QCAtMjUzMiwzICsyNTMyLDkgQEAgY2hhciAqcWdhX2dldF9ob3N0X25hbWUoRXJyb3IgKiplcnJw
KQ0KDQogICAgIHJldHVybiBnX3V0ZjE2X3RvX3V0ZjgodG1wLCBzaXplLCBOVUxMLCBOVUxMLCBO
VUxMKTsNCiB9DQorDQorR3Vlc3REaXNrU3RhdHNJbmZvTGlzdCAqcW1wX2d1ZXN0X2dldF9kaXNr
c3RhdHMoRXJyb3IgKiplcnJwKQ0KK3sNCisgICAgZXJyb3Jfc2V0ZyhlcnJwLCBRRVJSX1VOU1VQ
UE9SVEVEKTsNCisgICAgcmV0dXJuIE5VTEw7DQorfQ0KZGlmZiAtLWdpdCBhL3FnYS9xYXBpLXNj
aGVtYS5qc29uIGIvcWdhL3FhcGktc2NoZW1hLmpzb24NCmluZGV4IDRkOGU1MDZjOWUuLjk0YWFk
NGYyYWUgMTAwNjQ0DQotLS0gYS9xZ2EvcWFwaS1zY2hlbWEuanNvbg0KKysrIGIvcWdhL3FhcGkt
c2NoZW1hLmpzb24NCkBAIC0xNDkwLDMgKzE0OTAsODkgQEANCiB7ICdjb21tYW5kJzogJ2d1ZXN0
LXNzaC1yZW1vdmUtYXV0aG9yaXplZC1rZXlzJywNCiAgICdkYXRhJzogeyAndXNlcm5hbWUnOiAn
c3RyJywgJ2tleXMnOiBbJ3N0ciddIH0sDQogICAnaWYnOiAnQ09ORklHX1BPU0lYJyB9DQorDQor
IyMNCisjIEBHdWVzdERpc2tTdGF0czoNCisjDQorIyBAcmVhZC1zZWN0b3JzOiBzZWN0b3JzIHJl
YWQNCisjDQorIyBAd3JpdGUtc2VjdG9yczogc2VjdG9ycyB3cml0dGVuDQorIw0KKyMgQGRpc2Nh
cmQtc2VjdG9yczogc2VjdG9ycyBkaXNjYXJkZWQNCisjDQorIyBAcmVhZC1pb3M6IHJlYWRzIGNv
bXBsZXRlZCBzdWNjZXNzZnVsbHkNCisjDQorIyBAcmVhZC1tZXJnZXM6IE51bWJlciBvZiByZWFk
IHJlcXVlc3RzIG1lcmdlZA0KKyMNCisjIEB3cml0ZS1pb3M6IHdyaXRlcyBjb21wbGV0ZWQNCisj
DQorIyBAd3JpdGUtbWVyZ2VzOiBOdW1iZXIgb2Ygd3JpdGUgcmVxdWVzdHMgbWVyZ2VkDQorIw0K
KyMgQGRpc2NhcmQtaW9zOiBOdW1iZXIgb2YgZGlzY2FyZHMgY29tcGxldGVkIHN1Y2Nlc3NmdWxs
eQ0KKyMNCisjIEBkaXNjYXJkLW1lcmdlczogTlVtYmVyIG9mIGRpc2NhcmQgcmVxdWVzdHMgbWVy
Z2VkDQorIw0KKyMgQGZsdXNoLWlvczogTnVtYmVyIG9mIGZsdXNoIHJlcXVlc3RzIGNvbXBsZXRl
ZCBzdWNjZXNzZnVsbHkNCisjDQorIyBAcmVhZC10aWNrczogdGltZSBzcGVudCByZWFkaW5nKG1z
KQ0KKyMNCisjIEB3cml0ZS10aWNrczogdGltZSBzcGVudCB3cml0aW5nKG1zKQ0KKyMNCisjIEBk
aXNjYXJkLXRpY2tzOiB0aW1lIHNwZW50IGRpc2NhcmRpbmcobXMpDQorIw0KKyMgQGZsdXNoLXRp
Y2tzOiB0aW1lIHNwZW50IGZsdXNoaW5nKG1zKQ0KKyMNCisjIEBpb3MtcGdyOiBOdW1iZXIgb2Yg
SS9PcyBjdXJyZW50bHkgaW4gZmxpZ2h0DQorIw0KKyMgQHRvdGFsLXRpY2tzOiB0aW1lIHNwZW50
IGRvaW5nIEkvT3MgKG1zKQ0KKyMNCisjIEB3ZWlnaHQtdGlja3M6IHdlaWdodGVkIHRpbWUgc3Bl
bnQgZG9pbmcgSS9PcyBzaW5jZSB0aGUgbGFzdCB1cGRhdGUgb2YgdGhpcyBmaWVsZChtcykNCisj
DQorIyBTaW5jZTogNy4xDQorIyMNCit7ICdzdHJ1Y3QnOiAnR3Vlc3REaXNrU3RhdHMnLA0KKyAg
J2RhdGEnOiB7J3JlYWQtc2VjdG9ycyc6ICd1aW50NjQnLA0KKyAgICAgICAgICAgICd3cml0ZS1z
ZWN0b3JzJzogJ3VpbnQ2NCcsDQorICAgICAgICAgICAgJ2Rpc2NhcmQtc2VjdG9ycyc6ICd1aW50
NjQnLA0KKyAgICAgICAgICAgICdyZWFkLWlvcyc6ICd1aW50NjQnLA0KKyAgICAgICAgICAgICdy
ZWFkLW1lcmdlcyc6ICd1aW50NjQnLA0KKyAgICAgICAgICAgICd3cml0ZS1pb3MnOiAndWludDY0
JywNCisgICAgICAgICAgICAnd3JpdGUtbWVyZ2VzJzogJ3VpbnQ2NCcsDQorICAgICAgICAgICAg
J2Rpc2NhcmQtaW9zJzogJ3VpbnQ2NCcsDQorICAgICAgICAgICAgJ2Rpc2NhcmQtbWVyZ2VzJzog
J3VpbnQ2NCcsDQorICAgICAgICAgICAgJ2ZsdXNoLWlvcyc6ICd1aW50NjQnLA0KKyAgICAgICAg
ICAgICdyZWFkLXRpY2tzJzogJ3VpbnQ2NCcsDQorICAgICAgICAgICAgJ3dyaXRlLXRpY2tzJzog
J3VpbnQ2NCcsDQorICAgICAgICAgICAgJ2Rpc2NhcmQtdGlja3MnOiAndWludDY0JywNCisgICAg
ICAgICAgICAnZmx1c2gtdGlja3MnOiAndWludDY0JywNCisgICAgICAgICAgICAnaW9zLXBncic6
ICd1aW50NjQnLA0KKyAgICAgICAgICAgICd0b3RhbC10aWNrcyc6ICd1aW50NjQnLA0KKyAgICAg
ICAgICAgICd3ZWlnaHQtdGlja3MnOiAndWludDY0Jw0KKyAgICAgICAgICAgfSB9DQorDQorIyMN
CisjIEBHdWVzdERpc2tTdGF0c0luZm86DQorIw0KKyMgQG5hbWUgZGlzayBuYW1lDQorIw0KKyMg
QG1ham9yIG1ham9yIG9mIGRpc2sNCisjDQorIyBAbWlub3IgbWlub3Igb2YgZGlzaw0KKyMjDQor
eyAnc3RydWN0JzogJ0d1ZXN0RGlza1N0YXRzSW5mbycsDQorICAnZGF0YSc6IHsnbmFtZSc6ICdz
dHInLA0KKyAgICAgICAgICAgJ21ham9yJzogJ3VpbnQ2NCcsDQorICAgICAgICAgICAnbWlub3In
OiAndWludDY0JywNCisgICAgICAgICAgICdzdGF0cyc6ICdHdWVzdERpc2tTdGF0cycgfSB9DQor
DQorIyMNCisjIEBndWVzdC1nZXQtZGlza3N0YXRzOg0KKyMNCisjIFJldHJpZXZlIGluZm9ybWF0
aW9uIGFib3V0IGRpc2sgc3RhdHMuDQorIyBSZXR1cm5zOiBMaXN0IG9mIGRpc2sgc3RhdHMgb2Yg
Z3Vlc3QuDQorIw0KKyMgU2luY2U6IDcuMQ0KKyMjDQoreyAnY29tbWFuZCc6ICdndWVzdC1nZXQt
ZGlza3N0YXRzJywNCisgICdyZXR1cm5zJzogWydHdWVzdERpc2tTdGF0c0luZm8nXQ0KK30NCi0t
IA0KMi4zMS4xDQoNCg0KDQo=

------=_001_NextPart751050633102_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20220513223715376640 { =
}body { font-size: 14px; font-family: "Microsoft YaHei UI"; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div><span></span>OK,&nb=
sp; indeed leak memory</div><div><span style=3D"background-color: transpar=
ent;">thanks,&nbsp;</span></div>=0A<div><br></div><hr style=3D"width: 210p=
x; height: 1px;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span=
><div style=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><div>l=
uzhipeng@cestc.cn</div></div></span></div>=0A<blockquote style=3D"margin-T=
op: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><d=
iv>&nbsp;</div><div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;pa=
dding:3.0pt 0cm 0cm 0cm"><div style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8=
px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COLOR:#000000; BACKGROUND: #efefef;=
 PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"=
mailto:kkostiuk@redhat.com">Konstantin Kostiuk</a></div><div><b>Date:</b>&=
nbsp;2022-05-13&nbsp;22:33</div><div><b>To:</b>&nbsp;<a href=3D"mailto:luz=
hipeng@cestc.cn">luzhipeng</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto=
:qemu-devel@nongnu.org">qemu-devel</a>; <a href=3D"mailto:michael.roth@amd=
.com">Michael Roth</a>; <a href=3D"mailto:marcandre.lureau@redhat.com">Mar=
c-Andr=C3=A9 Lureau</a>; <a href=3D"mailto:berrange@redhat.com">Daniel P .=
 Berrang=C3=A9</a>; <a href=3D"mailto:mprivozn@redhat.com">Michal Privozni=
k</a></div><div><b>Subject:</b>&nbsp;Re: [PATCH v2] qga: add guest-get-dis=
kstats command for Linux guests</div></div></div><div><div class=3D"FoxDiv=
20220513223715376640"><div dir=3D"ltr"><div dir=3D"ltr"></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 13, 2=
022 at 1:50 PM Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.co=
m">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May=
 13, 2022 at 1:40 PM luzhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" t=
arget=3D"_blank">luzhipeng@cestc.cn</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Add a new 'guest-get-diskstats' comma=
nd for report disk io statistics<br>=0Afor Linux guests. This can be usefu=
ll for getting io flow or handling<br>=0AIO fault, no need to enter guests=
.<br>=0A<br>=0ASigned-off-by: luzhipeng &lt;<a href=3D"mailto:luzhipeng@ce=
stc.cn" target=3D"_blank">luzhipeng@cestc.cn</a>&gt;<br>=0A<br>=0A---<br>=
=0AChanges v1-&gt;v2:<br>=0A&nbsp;v1:<a href=3D"https://patchew.org/QEMU/2=
0220512011930.214-1-luzhipeng@cestc.cn/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/</a><=
br>=0A<br>=0A&nbsp;qga/commands-posix.c | 97 +++++++++++++++++++++++++++++=
+++++++++++++++<br>=0A&nbsp;qga/commands-win32.c |&nbsp; 6 +++<br>=0A&nbsp=
;qga/qapi-schema.json | 86 +++++++++++++++++++++++++++++++++++++++<br>=0A&=
nbsp;3 files changed, 189 insertions(+)<br>=0A<br>=0Adiff --git a/qga/comm=
ands-posix.c b/qga/commands-posix.c<br>=0Aindex 69f209af87..7a16d84e3a 100=
644<br>=0A--- a/qga/commands-posix.c<br>=0A+++ b/qga/commands-posix.c<br>=
=0A@@ -2783,6 +2783,96 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block=
_info(Error **errp)<br>=0A&nbsp; &nbsp; &nbsp;return info;<br>=0A&nbsp;}<b=
r>=0A<br>=0A+#define MAX_NAME_LEN 128<br>=0A+static GuestDiskStatsInfoList=
 *guest_get_diskstats(Error **errp)<br>=0A+{<br>=0A+#ifdef CONFIG_LINUX<br=
>=0A+&nbsp; &nbsp; GuestDiskStatsInfoList *head =3D NULL, **tail =3D &amp;=
head;<br>=0A+&nbsp; &nbsp; const char *diskstats =3D "/proc/diskstats";<br=
>=0A+&nbsp; &nbsp; FILE *fp;<br>=0A+&nbsp; &nbsp; size_t n;<br>=0A+&nbsp; =
&nbsp; char *line =3D NULL;<br>=0A+&nbsp; &nbsp; char dev_name[MAX_NAME_LE=
N];<br>=0A+&nbsp; &nbsp; int i;<br>=0A+&nbsp; &nbsp; unsigned int ios_pgr,=
 tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;<br>=0A+&nbsp; &nbsp; u=
nsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;<br>=
=0A+&nbsp; &nbsp; unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;<br>=
=0A+&nbsp; &nbsp; unsigned long dc_ios, dc_merges, dc_sec, fl_ios;<br>=0A+=
&nbsp; &nbsp; unsigned int major, minor;<br>=0A+<br>=0A+&nbsp; &nbsp; fp =
=3D fopen(diskstats, "r");<br>=0A+&nbsp; &nbsp; if (fp&nbsp; =3D=3D NULL) =
{<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; error_setg_errno(errp, errno, "open(\=
"%s\")", diskstats);<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; return NULL;<br>=
=0A+&nbsp; &nbsp; }<br>=0A+&nbsp; &nbsp; while (getline(&amp;line, &amp;n,=
 fp) !=3D -1) {<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; GuestDiskStatsInfo *dis=
kstatinfo;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; GuestDiskStats *diskstat;<br=
>=0A+&nbsp; &nbsp; &nbsp; &nbsp; i =3D sscanf(line, "%u %u %s %lu %lu %lu"=
<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;"%lu %lu %lu %lu %u %u %u %u"<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"%lu %lu %lu %u %lu %u",<br>=0A+&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;major, &amp;m=
inor, dev_name,<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &amp;rd_ios, &amp;rd_merges_or_rd_sec, &amp;rd_sec_or_wr_ios,<=
br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp=
;rd_ticks_or_wr_sec, &amp;wr_ios, &amp;wr_merges, &amp;wr_sec,<br>=0A+&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;wr_ticks, =
&amp;ios_pgr, &amp;tot_ticks, &amp;rq_ticks,<br>=0A+&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;dc_ios, &amp;dc_merges, &amp=
;dc_sec, &amp;dc_ticks,<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &amp;fl_ios, &amp;fl_ticks);<br>=0A+<br>=0A+&nbsp; &nb=
sp; &nbsp; &nbsp; diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);<br>=0A+&=
nbsp; &nbsp; &nbsp; &nbsp; diskstat =3D g_new0(GuestDiskStats, 1);<br></bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=0A+&nbsp; &nb=
sp; &nbsp; &nbsp; if (i &lt; 7) {<br></blockquote><div><br></div><div>disk=
statinfo and diskstat pointers do not have <span>g_<span>autoptr attribute=
 and</span></span></div><div><span><span>will be not added to the results =
list.</span></span></div><div><span><span>So, looks like we have a memory =
leak in this case.</span></span></div></div></div></blockquote><div><br></=
div><div>checked with valgrind. <br></div><div>we have a memory leak of di=
skstatinfo and diskstat when i &lt; 7<br></div><div><br></div><div>I sugge=
st allocating these variables after this condition.<br></div><div>&nbsp;</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><div><span><span><code></code></span></span></div=
><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=0A+&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;<br>=0A+&nbsp; &nbsp; &n=
bsp; &nbsp; }<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; diskstatinfo-&gt;name =3D=
 g_strdup(dev_name);<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; diskstatinfo-&gt;m=
ajor =3D major;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; diskstatinfo-&gt;minor =
=3D minor;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; if (i =3D=3D 7) {<br>=0A+&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;read_ios =3D rd_ios;<b=
r>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;read_sectors =
=3D rd_merges_or_rd_sec;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
diskstat-&gt;write_ios =3D rd_sec_or_wr_ios;<br>=0A+&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; diskstat-&gt;write_sectors =3D rd_ticks_or_wr_sec;<br>=
=0A+&nbsp; &nbsp; &nbsp; &nbsp; }<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; if (i=
 &gt;=3D 14) {<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&=
gt;read_ios =3D rd_ios;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d=
iskstat-&gt;read_sectors =3D rd_sec_or_wr_ios;<br>=0A+&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; diskstat-&gt;read_merges =3D rd_merges_or_rd_sec;<br=
>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;read_ticks =3D=
 rd_ticks_or_wr_sec;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; disk=
stat-&gt;write_ios =3D wr_ios;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; diskstat-&gt;write_sectors =3D wr_sec;<br>=0A+&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; diskstat-&gt;write_merges =3D wr_merges;<br>=0A+&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;write_ticks =3D wr_ticks;=
<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;ios_pgr =3D=
 ios_pgr;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;to=
tal_ticks =3D tot_ticks;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
diskstat-&gt;weight_ticks =3D rq_ticks;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp;=
 }<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; if (i &gt;=3D 18) {<br>=0A+&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;discard_ios =3D dc_ios;<br>=
=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;discard_merges =
=3D dc_merges;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&=
gt;discard_sectors =3D dc_sec;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; diskstat-&gt;discard_ticks =3D dc_ticks;<br>=0A+&nbsp; &nbsp; &nbsp;=
 &nbsp; }<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; if (i &gt;=3D 20) {<br>=0A+&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;flush_ios =3D fl_ios;=
<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diskstat-&gt;flush_ticks=
 =3D fl_ticks;<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; }<br>=0A+<br>=0A+&nbsp; =
&nbsp; &nbsp; &nbsp; diskstatinfo-&gt;stats =3D diskstat;<br>=0A+&nbsp; &n=
bsp; &nbsp; &nbsp; QAPI_LIST_APPEND(tail, diskstatinfo);<br>=0A+&nbsp; &nb=
sp; }<br>=0A+&nbsp; &nbsp; g_free(line);<br>=0A+&nbsp; &nbsp; fclose(fp);<=
br>=0A+&nbsp; &nbsp; return head;<br>=0A+#else<br>=0A+&nbsp; &nbsp; g_debu=
g("disk stats reporting available only for Linux");<br>=0A+&nbsp; &nbsp; r=
eturn NULL;<br>=0A+#endif<br>=0A+}<br>=0A+<br>=0A+GuestDiskStatsInfoList *=
qmp_guest_get_diskstats(Error **errp)<br>=0A+{<br>=0A+&nbsp; &nbsp; return=
 guest_get_diskstats(errp);<br>=0A+}<br>=0A+<br>=0A&nbsp;#else /* defined(=
__linux__) */<br>=0A<br>=0A&nbsp;void qmp_guest_suspend_disk(Error **errp)=
<br>=0A@@ -3131,6 +3221,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error=
 **errp)<br>=0A&nbsp; &nbsp; &nbsp;return NULL;<br>=0A&nbsp;}<br>=0A<br>=
=0A+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>=0A+{=
<br>=0A+&nbsp; &nbsp; error_setg(errp, QERR_UNSUPPORTED);<br>=0A+&nbsp; &n=
bsp; return NULL;<br>=0A+}<br>=0A+<br>=0A+<br>=0A&nbsp;#endif /* CONFIG_FS=
FREEZE */<br>=0A<br>=0A&nbsp;#if !defined(CONFIG_FSTRIM)<br>=0Adiff --git =
a/qga/commands-win32.c b/qga/commands-win32.c<br>=0Aindex d56b5fd2a7..dcde=
b76a68 100644<br>=0A--- a/qga/commands-win32.c<br>=0A+++ b/qga/commands-wi=
n32.c<br>=0A@@ -2532,3 +2532,9 @@ char *qga_get_host_name(Error **errp)<br=
>=0A<br>=0A&nbsp; &nbsp; &nbsp;return g_utf16_to_utf8(tmp, size, NULL, NUL=
L, NULL);<br>=0A&nbsp;}<br>=0A+<br>=0A+GuestDiskStatsInfoList *qmp_guest_g=
et_diskstats(Error **errp)<br>=0A+{<br>=0A+&nbsp; &nbsp; error_setg(errp, =
QERR_UNSUPPORTED);<br>=0A+&nbsp; &nbsp; return NULL;<br>=0A+}<br>=0Adiff -=
-git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>=0Aindex 4d8e506c9e.=
.94aad4f2ae 100644<br>=0A--- a/qga/qapi-schema.json<br>=0A+++ b/qga/qapi-s=
chema.json<br>=0A@@ -1490,3 +1490,89 @@<br>=0A&nbsp;{ 'command': 'guest-ss=
h-remove-authorized-keys',<br>=0A&nbsp; &nbsp;'data': { 'username': 'str',=
 'keys': ['str'] },<br>=0A&nbsp; &nbsp;'if': 'CONFIG_POSIX' }<br>=0A+<br>=
=0A+##<br>=0A+# @GuestDiskStats:<br>=0A+#<br>=0A+# @read-sectors: sectors =
read<br>=0A+#<br>=0A+# @write-sectors: sectors written<br>=0A+#<br>=0A+# @=
discard-sectors: sectors discarded<br>=0A+#<br>=0A+# @read-ios: reads comp=
leted successfully<br>=0A+#<br>=0A+# @read-merges: Number of read requests=
 merged<br>=0A+#<br>=0A+# @write-ios: writes completed<br>=0A+#<br>=0A+# @=
write-merges: Number of write requests merged<br>=0A+#<br>=0A+# @discard-i=
os: Number of discards completed successfully<br>=0A+#<br>=0A+# @discard-m=
erges: NUmber of discard requests merged<br>=0A+#<br>=0A+# @flush-ios: Num=
ber of flush requests completed successfully<br>=0A+#<br>=0A+# @read-ticks=
: time spent reading(ms)<br>=0A+#<br>=0A+# @write-ticks: time spent writin=
g(ms)<br>=0A+#<br>=0A+# @discard-ticks: time spent discarding(ms)<br>=0A+#=
<br>=0A+# @flush-ticks: time spent flushing(ms)<br>=0A+#<br>=0A+# @ios-pgr=
: Number of I/Os currently in flight<br>=0A+#<br>=0A+# @total-ticks: time =
spent doing I/Os (ms)<br>=0A+#<br>=0A+# @weight-ticks: weighted time spent=
 doing I/Os since the last update of this field(ms)<br>=0A+#<br>=0A+# Sinc=
e: 7.1<br>=0A+##<br>=0A+{ 'struct': 'GuestDiskStats',<br>=0A+&nbsp; 'data'=
: {'read-sectors': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 'write-sectors': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 'discard-sectors': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 'read-ios': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 'read-merges': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 'write-ios': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; 'write-merges': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 'discard-ios': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 'discard-merges': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 'flush-ios': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 'read-ticks': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 'write-ticks': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; 'discard-ticks': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'flush-ticks': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 'ios-pgr': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 'total-ticks': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; 'weight-ticks': 'uint64'<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;} }<br>=0A+<br>=0A+##<br>=0A+# @GuestDiskStatsInfo:<br>=0A+#<br>=0A+# @=
name disk name<br>=0A+#<br>=0A+# @major major of disk<br>=0A+#<br>=0A+# @m=
inor minor of disk<br>=0A+##<br>=0A+{ 'struct': 'GuestDiskStatsInfo',<br>=
=0A+&nbsp; 'data': {'name': 'str',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;'major': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;'minor': 'uint64',<br>=0A+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'stat=
s': 'GuestDiskStats' } }<br>=0A+<br>=0A+##<br>=0A+# @guest-get-diskstats:<=
br>=0A+#<br>=0A+# Retrieve information about disk stats.<br>=0A+# Returns:=
 List of disk stats of guest.<br>=0A+#<br>=0A+# Since: 7.1<br>=0A+##<br>=
=0A+{ 'command': 'guest-get-diskstats',<br>=0A+&nbsp; 'returns': ['GuestDi=
skStatsInfo']<br>=0A+}<br>=0A-- <br>=0A2.31.1<br>=0A<br>=0A<br>=0A<br>=0A<=
/blockquote></div></div>=0A</blockquote></div></div>=0A</div></div></block=
quote>=0A</body></html>
------=_001_NextPart751050633102_=------




