Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1D3657332
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 07:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAPsf-0006OQ-FF; Wed, 28 Dec 2022 01:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <503386372@qq.com>)
 id 1pAPsc-0006MA-H1; Wed, 28 Dec 2022 01:25:34 -0500
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <503386372@qq.com>)
 id 1pAPsW-0001xT-2C; Wed, 28 Dec 2022 01:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1672208715; bh=PycctqZ75LViXQjsVYDxOPRIRofpQBSxpDYwXam8WLM=;
 h=From:To:Cc:Subject:Date;
 b=NnBCrCvGu9zs3xJUrNEb6tJX5uvt3UxvZedz9NfHMfcNnU/AUTgiTD9Ux9TjPwvca
 xJwqNCG5arXggC4y6CpQe/7PBiLl/N8RruU4uF7LabB0njhIRrpM8LJZQaXuR3YeNY
 1gQkbExjWLL8+Bi/VfI/RQttXvpOijxCx86OOC8o=
X-QQ-XMAILINFO: NSdk79fbXCzSquUl27zCYmZnJ4MZC4N/Qo/N0I/yWd2Fv0Mb1JyX+1JfvIawBz
 /vhgYgKAjsQAjkp8UTAKGHM+XBxdUEg999aBSohdt5EvbbIWFXTPkMezaJ6uxZYX7OxjYlieORM4V
 9c6wDLYswdA+Z8OOErkXGq7uSETXLkK43cccjRC4vwiclAxe6jYYjinkVs3WK6AwXQIFZ7dUrj3O6
 I2MCWH+NDNI7q1L4cHT9pXCAU0/pj18dSJUX0cQTHiN6aqEgXd/RIwE3ub9NRmzwMFaLX7wDpi8UK
 hGtg1Dwt62ldMl8S+nS4ZfbqXqTAgUSpKrDBL+qHVYoDtNFJBYMps2cBM38bjABpcePtg4923fzek
 RzjLz1yOIABIws//6nx+CXU+Gev07UBss2tPWDHUnVOF4S0XCINa4jm3TTcPWGGFVPJNjJJeuVjV0
 s47DimCSnimHbiwn/W1jir05aV8fnXYBcgZDaFm6aKdlmZf61jdXaA+Z7GAQA2OdwINWMvcB9I+Rp
 sf781EKqV2C5qp6n6KACLDAsSiXTIBgZiOSzXZLYRQheYR99uajyMF349EmSs/zUrgR4otl7p4ebr
 NslgVpFqlOm1aLUZUhF7w5WfHgzSITtdEeIF/CMQVgvu245zHPwCwAdAa6YIAwUsn4WwDc2IoFYcl
 A6DwjFa/aRsWVvZTCb51//SBCvJSJ0ShCVYObrp5mNWqjN0cUEk2qvtC/VIkaLokW78GjsBOMcXAh
 Jrgo8A7kWy3HTEfObv28OAeU8OKb+G4z8pKn4fZRzgpnX+B9gCf8RYECdopsXZa5WPzF8rYoID95v
 EFlxLtYSEQ8PzxD7+FIhNKra0O8jR6W5axnweoikhKLi5mlpVlngaiNox66IwC5J7UAO8C7QaiP40
 y7A9VsMcOZZ1xqx5nzWE9vWFsyAZ1Cl3Y7CMh237KHZctSNMi812/er9FPvwcdE6+ZX+5I5pYM42V
 FF0ImVEFtIXS1SdxdhFw1MxcFl+wHIYZcooDkDYPHycvMlc/pp8NFbOMIpAT7fyuMOljNcfA==
From: "=?utf-8?B?NTAzMzg2Mzcy?=" <503386372@qq.com>
To: "=?utf-8?B?NTAzMzg2Mzcy?=" <503386372@qq.com>,
 "=?utf-8?B?YWxpc3RhaXIyMw==?=" <alistair23@gmail.com>
Cc: "=?utf-8?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>,
 "=?utf-8?B?cGFsbWVy?=" <palmer@dabbelt.com>,
 "=?utf-8?B?YWxpc3RhaXIuZnJhbmNpcw==?=" <alistair.francis@wdc.com>,
 "=?utf-8?B?YmluLm1lbmc=?=" <bin.meng@windriver.com>,
 "=?utf-8?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Subject: re:Re: [PATCH] target/riscv/cpu.c: Fix elen check
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_63ABE104_4ED33440_71621EE4"
Content-Transfer-Encoding: 8Bit
Date: Wed, 28 Dec 2022 14:24:04 +0800
X-Priority: 3
Message-ID: <tencent_21C1EAD87616BB36013654A6@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmmaszb1-0t1672208644t8406duzb
Received-SPF: pass client-ip=162.62.57.64; envelope-from=503386372@qq.com;
 helo=out162-62-57-64.mail.qq.com
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001, HELO_DYNAMIC_IPADDR=1.951,
 HTML_MESSAGE=0.001, NO_FM_NAME_IP_HOSTN=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=1 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.

------=_NextPart_63ABE104_4ED33440_71621EE4
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

c29ycnkmbmJzcDtmb3ImbmJzcDt0aGF0LCZuYnNwO2kmbmJzcDt3aWxsJm5ic3A7dHJ5Jm5i
c3A7YWdhaW4mbmJzcDt3aXRoJm5ic3A7Z2l0LnNyLnRoLg0KDQoNCi0tLS0tLS0tLS0tLS0t
LS0tLSDljp/lp4vpgq7ku7YgLS0tLS0tLS0tLS0tLS0tLS0tDQrlj5Hku7bkuro6ICJBbGlz
dGFpciBGcmFuY2lzIjsNCuWPkeS7tuaXtumXtDogMjAyMi0xMi0yOCAxMzo0Ng0K5pS25Lu2
5Lq6OiAiRWx0YSI8NTAzMzg2MzcyQHFxLmNvbSZndDs7DQrmlLbku7bkuro6IA0KInFlbXUt
ZGV2ZWwiOyJwYWxtZXIiOyJhbGlzdGFpci5mcmFuY2lzIjsiYmluLm1lbmciOyJxZW11LXJp
c2N2IjsNCuS4u+mimDogUmU6IFtQQVRDSF0gdGFyZ2V0L3Jpc2N2L2NwdS5jOiBGaXggZWxl
biBjaGVjaw0KDQoNCg0KT24gRnJpLCBEZWMgMTYsIDIwMjIgYXQgMToxMCBBTSBFbHRhIDw1
MDMzODYzNzJAcXEuY29tJmd0OyB3cm90ZToNCiZndDsNCiZndDsgU2hvdWxkIGJlIGNwdS0m
Z3Q7Y2ZnLmVsZW4gaW4gcmFuZ2UgWzgsIDY0XS4NCiZndDsNCiZndDsgU2lnbmVkLW9mZi1i
eTogRG9uZ3h1ZSBaaGFuZyANCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2ghDQoNCkknbSBzZWVp
bmcgd2VpcmQgZm9ybWF0dGluZyBpc3N1ZXMgdGhvdWdoLCBpdCBsb29rcyBsaWtlIHRoZSBl
bmNvZGluZw0KaXMgaW5jb3JyZWN0Lg0KDQpEaWQgeW91IHVzZSBgZ2l0IHNlbmQtZW1haWxg
IHRvIHNlbmQgdGhlIHBhdGNoPyBJZiBub3QgY2FuIHlvdSB0cnkNCnNlbmRpbmcgaXQgYWdh
aW4gZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbnMgaGVyZQ0KaHR0cHM6Ly93d3cucWVtdS5v
cmcvZG9jcy9tYXN0ZXIvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLmh0bWwjc3VibWl0dGlu
Zy15b3VyLXBhdGNoZXMNCg0KQWxpc3RhaXINCg0KJmd0OyAtLS0NCiZndDsgIHRhcmdldC9y
aXNjdi9jcHUuYyB8IDIgKy0NCiZndDsgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KJmd0Ow0KJmd0OyBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2
L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jDQomZ3Q7IGluZGV4IGQxNGU5NWM5ZGMuLjFl
ODAzMmM5NjkgMTAwNjQ0DQomZ3Q7IC0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYw0KJmd0OyAr
KysgYi90YXJnZXQvcmlzY3YvY3B1LmMNCiZndDsgQEAgLTg3MCw3ICs4NzAsNyBAQCBzdGF0
aWMgdm9pZCByaXNjdl9jcHVfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVy
cnApDQomZ3Q7ICAgICAgICAgICAgICAgICAgICAgICAgICAiVmVjdG9yIGV4dGVuc2lvbiBF
TEVOIG11c3QgYmUgcG93ZXIgb2YgMiIpOw0KJmd0OyAgICAgICAgICAgICAgICAgIHJldHVy
bjsNCiZndDsgICAgICAgICAgICAgIH0NCiZndDsgLSAgICAgICAgICAgIGlmIChjcHUtJmd0
O2NmZy5lbGVuICZndDsgNjQgfHwgY3B1LSZndDtjZmcudmxlbiA8IDgpIHsNCiZndDsgKyAg
ICAgICAgICAgIGlmIChjcHUtJmd0O2NmZy5lbGVuICZndDsgNjQgfHwgY3B1LSZndDtjZmcu
ZWxlbiA8IDgpIHsNCiZndDsgICAgICAgICAgICAgICAgICBlcnJvcl9zZXRnKGVycnAsDQom
Z3Q7ICAgICAgICAgICAgICAgICAgICAgICAgICAiVmVjdG9yIGV4dGVuc2lvbiBpbXBsZW1l
bnRhdGlvbiBvbmx5IHN1cHBvcnRzIEVMRU4gIg0KJmd0OyAgICAgICAgICAgICAgICAgICAg
ICAgICAgImluIHRoZSByYW5nZSBbOCwgNjRdIik7DQomZ3Q7IC0tDQomZ3Q7IDIuMTcuMQ0K
Jmd0Ow==

------=_NextPart_63ABE104_4ED33440_71621EE4
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHA+c29ycnkmbmJzcDtmb3ImbmJzcDt0aGF0LCZuYnNwO2kmbmJzcDt3aWxsJm5ic3A7dHJ5
Jm5ic3A7YWdhaW4mbmJzcDt3aXRoJm5ic3A7Z2l0LnNyLnRoLjwvcD48YnIgIC8+PGJyICAv
Pi0tLS0tLS0tLS0tLS0tLS0tLSDljp/lp4vpgq7ku7YgLS0tLS0tLS0tLS0tLS0tLS0tPGJy
ICAvPjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDsgYmFja2dyb3VuZDogbm9uZSByZXBl
YXQgc2Nyb2xsIDAlIHJnYigyMzksIDIzOSwgMjM5KTsgcGFkZGluZzogOHB4OyI+PGRpdj48
Yj7lj5Hku7bkuro6IDwvYj4iQWxpc3RhaXIgRnJhbmNpcyI8YWxpc3RhaXIyM0BnbWFpbC5j
b20+PC9hbGlzdGFpcjIzQGdtYWlsLmNvbT47PC9kaXY+PGRpdj48Yj7lj5Hku7bml7bpl7Q6
IDwvYj4yMDIyLTEyLTI4IDEzOjQ2PC9kaXY+PGRpdj48Yj7mlLbku7bkuro6IDwvYj4iRWx0
YSImbHQ7NTAzMzg2MzcyQHFxLmNvbSZndDs7PC9kaXY+PGRpdj48Yj7mlLbku7bkuro6IDwv
Yj48cD4icWVtdS1kZXZlbCI8cWVtdS1kZXZlbEBub25nbnUub3JnPjwvcWVtdS1kZXZlbEBu
b25nbnUub3JnPjsicGFsbWVyIjxwYWxtZXJAZGFiYmVsdC5jb20+PC9wYWxtZXJAZGFiYmVs
dC5jb20+OyJhbGlzdGFpci5mcmFuY2lzIjxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+PC9h
bGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyJiaW4ubWVuZyI8YmluLm1lbmdAd2luZHJpdmVy
LmNvbT48L2Jpbi5tZW5nQHdpbmRyaXZlci5jb20+OyJxZW11LXJpc2N2IjxxZW11LXJpc2N2
QG5vbmdudS5vcmc+PC9xZW11LXJpc2N2QG5vbmdudS5vcmc+OzwvZGl2PjxkaXY+PGI+5Li7
6aKYOiA8L2I+UmU6IFtQQVRDSF0gdGFyZ2V0L3Jpc2N2L2NwdS5jOiBGaXggZWxlbiBjaGVj
azwvZGl2PjwvZGl2PjxiciAgLz48YnIgIC8+T24gRnJpLCBEZWMgMTYsIDIwMjIgYXQgMTox
MCBBTSBFbHRhICZsdDs1MDMzODYzNzJAcXEuY29tJmd0OyB3cm90ZTo8YnIgIC8+Jmd0Ozxi
ciAgLz4mZ3Q7IFNob3VsZCBiZSBjcHUtJmd0O2NmZy5lbGVuIGluIHJhbmdlIFs4LCA2NF0u
PGJyICAvPiZndDs8YnIgIC8+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBEb25neHVlIFpoYW5nIDxl
bHRhLmVyYUBnbWFpbC5jb20+PC9lbHRhLmVyYUBnbWFpbC5jb20+PGJyICAvPjxiciAgLz5U
aGFua3MgZm9yIHRoZSBwYXRjaCE8YnIgIC8+PGJyICAvPkknbSBzZWVpbmcgd2VpcmQgZm9y
bWF0dGluZyBpc3N1ZXMgdGhvdWdoLCBpdCBsb29rcyBsaWtlIHRoZSBlbmNvZGluZzxiciAg
Lz5pcyBpbmNvcnJlY3QuPGJyICAvPjxiciAgLz5EaWQgeW91IHVzZSBgZ2l0IHNlbmQtZW1h
aWxgIHRvIHNlbmQgdGhlIHBhdGNoPyBJZiBub3QgY2FuIHlvdSB0cnk8YnIgIC8+c2VuZGlu
ZyBpdCBhZ2FpbiBmb2xsb3dpbmcgdGhlIGluc3RydWN0aW9ucyBoZXJlPGJyICAvPmh0dHBz
Oi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1Ym1pdHRpbmctYS1wYXRjaC5o
dG1sI3N1Ym1pdHRpbmcteW91ci1wYXRjaGVzPGJyICAvPjxiciAgLz5BbGlzdGFpcjxiciAg
Lz48YnIgIC8+Jmd0OyAtLS08YnIgIC8+Jmd0OyAgdGFyZ2V0L3Jpc2N2L2NwdS5jIHwgMiAr
LTxiciAgLz4mZ3Q7ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSk8YnIgIC8+Jmd0OzxiciAgLz4mZ3Q7IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yv
Y3B1LmMgYi90YXJnZXQvcmlzY3YvY3B1LmM8YnIgIC8+Jmd0OyBpbmRleCBkMTRlOTVjOWRj
Li4xZTgwMzJjOTY5IDEwMDY0NDxiciAgLz4mZ3Q7IC0tLSBhL3RhcmdldC9yaXNjdi9jcHUu
YzxiciAgLz4mZ3Q7ICsrKyBiL3RhcmdldC9yaXNjdi9jcHUuYzxiciAgLz4mZ3Q7IEBAIC04
NzAsNyArODcwLDcgQEAgc3RhdGljIHZvaWQgcmlzY3ZfY3B1X3JlYWxpemUoRGV2aWNlU3Rh
dGUgKmRldiwgRXJyb3IgKiplcnJwKTxiciAgLz4mZ3Q7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAiVmVjdG9yIGV4dGVuc2lvbiBFTEVOIG11c3QgYmUgcG93ZXIgb2YgMiIpOzxiciAg
Lz4mZ3Q7ICAgICAgICAgICAgICAgICAgcmV0dXJuOzxiciAgLz4mZ3Q7ICAgICAgICAgICAg
ICB9PGJyICAvPiZndDsgLSAgICAgICAgICAgIGlmIChjcHUtJmd0O2NmZy5lbGVuICZndDsg
NjQgfHwgY3B1LSZndDtjZmcudmxlbiAmbHQ7IDgpIHs8YnIgIC8+Jmd0OyArICAgICAgICAg
ICAgaWYgKGNwdS0mZ3Q7Y2ZnLmVsZW4gJmd0OyA2NCB8fCBjcHUtJmd0O2NmZy5lbGVuICZs
dDsgOCkgezxiciAgLz4mZ3Q7ICAgICAgICAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLDxi
ciAgLz4mZ3Q7ICAgICAgICAgICAgICAgICAgICAgICAgICAiVmVjdG9yIGV4dGVuc2lvbiBp
bXBsZW1lbnRhdGlvbiBvbmx5IHN1cHBvcnRzIEVMRU4gIjxiciAgLz4mZ3Q7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAiaW4gdGhlIHJhbmdlIFs4LCA2NF0iKTs8YnIgIC8+Jmd0OyAt
LTxiciAgLz4mZ3Q7IDIuMTcuMTxiciAgLz4mZ3Q7

------=_NextPart_63ABE104_4ED33440_71621EE4--


