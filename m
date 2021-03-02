Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078A329598
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:02:43 +0100 (CET)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuMz-0002Ji-O6
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lGuLi-0001pq-1a
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 21:01:22 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:25499 helo=mxct.zte.com.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1lGuLd-0000y4-V2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 21:01:21 -0500
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id A08B9D4B2AD56D3E531F
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 10:01:06 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
 by mse-fl2.zte.com.cn with SMTP id 12220w6Z085090
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 10:00:58 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Tue, 2 Mar 2021 10:00:58 +0800
X-Zmail-TransId: 3e88603d9c5901b-9ac6d
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] block: Change write_threshold to uint64 in BlockDeviceInfo
Date: Tue,  2 Mar 2021 10:06:08 +0800
Message-Id: <20210302020608.13563-1-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 2.29.0-rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse-fl2.zte.com.cn 12220w6Z085090
Received-SPF: pass client-ip=202.103.147.169;
 envelope-from=wang.yi59@zte.com.cn; helo=mxct.zte.com.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wang.yi59@zte.com.cn, renlei4 <ren.lei4@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTogcmVubGVpNCA8cmVuLmxlaTRAenRlLmNvbS5jbj4NCg0Kd3JpdGVfdGhyZXNob2xkIGlz
IHNhdmVkIGFzIHVpbnQ2NCwgYnV0IEJsb2NrRGV2aWNlSW5mbyB1c2UgaW50IHRvIGRlc2NyaWJl
IGl0Lg0KDQpub3JtYWxseSBpdCB3b3JrcyB3ZWxsIGlmIHRocmVzaG9sZCBsZXNzIHRoYW4gbWF4
IGludDoNCiAjIHZpcnNoIGRvbWJsa3RocmVzaG9sZCB2Nl8xNjMgc2RhIDkyMjMzNzIwMzY4NTQ3
NzU4MDcNCiAjIHZpcnNoIHFlbXUtbW9uaXRvci1jb21tYW5kIHY2XzE2MyAgJ3sgImV4ZWN1dGUi
OiAicXVlcnktbmFtZWQtYmxvY2stbm9kZXMiIH0nIHxncmVwIHRocmVzaG9sZA0KICAgICAgICAg
ICAgIndyaXRlX3RocmVzaG9sZCI6IDkyMjMzNzIwMzY4NTQ3NzU4MDcsDQoNCm92ZXJmbG93IGhh
cHBlbmVkIGlmIHRocmVzaG9sZCBncmVhdGVyIHRoYW4gbWF4IGludDoNCiAjIHZpcnNoIGRvbWJs
a3RocmVzaG9sZCB2Nl8xNjMgc2RhIDkyMjMzNzIwMzY4NTQ3NzU4MTENCiAjIHZpcnNoIHFlbXUt
bW9uaXRvci1jb21tYW5kIHY2XzE2MyAgICd7ICJleGVjdXRlIjogInF1ZXJ5LW5hbWVkLWJsb2Nr
LW5vZGVzIiB9JyB8Z3JlcCB0aHJlc2hvbGQNCiAgICAgICAgICAgICJ3cml0ZV90aHJlc2hvbGQi
OiAtOTIyMzM3MjAzNjg1NDc3NTgwNSwNCg0KRml4ZXM6IGUyNDYyMTEzYjIwMCAiYmxvY2s6IGFk
ZCBldmVudCB3aGVuIGRpc2sgdXNhZ2UgZXhjZWVkcyB0aHJlc2hvbGQiDQoNClNpZ25lZC1vZmYt
Ynk6IFJlbiBMZWkgPHJlbi5sZWk0QHp0ZS5jb20uY24+DQpTaWduZWQtb2ZmLWJ5OiBZaSBXYW5n
IDx3YW5nLnlpNTlAenRlLmNvbS5jbj4NCi0tLQ0KIHFhcGkvYmxvY2stY29yZS5qc29uIHwgMiAr
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEvcWFwaS9ibG9jay1jb3JlLmpzb24gYi9xYXBpL2Jsb2NrLWNvcmUuanNvbg0KaW5k
ZXggOWY1NTVkNS4uMDBiODcyOSAxMDA2NDQNCi0tLSBhL3FhcGkvYmxvY2stY29yZS5qc29uDQor
KysgYi9xYXBpL2Jsb2NrLWNvcmUuanNvbg0KQEAgLTQwOSw3ICs0MDksNyBAQA0KICAgICAgICAg
ICAgICcqYnBzX3dyX21heF9sZW5ndGgnOiAnaW50JywgJyppb3BzX21heF9sZW5ndGgnOiAnaW50
JywNCiAgICAgICAgICAgICAnKmlvcHNfcmRfbWF4X2xlbmd0aCc6ICdpbnQnLCAnKmlvcHNfd3Jf
bWF4X2xlbmd0aCc6ICdpbnQnLA0KICAgICAgICAgICAgICcqaW9wc19zaXplJzogJ2ludCcsICcq
Z3JvdXAnOiAnc3RyJywgJ2NhY2hlJzogJ0Jsb2NrZGV2Q2FjaGVJbmZvJywNCi0gICAgICAgICAg
ICAnd3JpdGVfdGhyZXNob2xkJzogJ2ludCcsICcqZGlydHktYml0bWFwcyc6IFsnQmxvY2tEaXJ0
eUluZm8nXSB9IH0NCisgICAgICAgICAgICAnd3JpdGVfdGhyZXNob2xkJzogJ3VpbnQ2NCcsICcq
ZGlydHktYml0bWFwcyc6IFsnQmxvY2tEaXJ0eUluZm8nXSB9IH0NCiANCiAjIw0KICMgQEJsb2Nr
RGV2aWNlSW9TdGF0dXM6DQotLSANCjEuOC4zLjE=


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbTombmJzcDtyZW5sZWk0Jm5ic3A7Jmx0O3Jlbi5sZWk0QHp0ZS5jb20uY24mZ3Q7DTxiciAv
Pg08YnIgLz53cml0ZV90aHJlc2hvbGQmbmJzcDtpcyZuYnNwO3NhdmVkJm5ic3A7YXMmbmJzcDt1
aW50NjQsJm5ic3A7YnV0Jm5ic3A7QmxvY2tEZXZpY2VJbmZvJm5ic3A7dXNlJm5ic3A7aW50Jm5i
c3A7dG8mbmJzcDtkZXNjcmliZSZuYnNwO2l0LjxiciAvPg08YnIgLz5ub3JtYWxseSZuYnNwO2l0
Jm5ic3A7d29ya3MmbmJzcDt3ZWxsJm5ic3A7aWYmbmJzcDt0aHJlc2hvbGQmbmJzcDtsZXNzJm5i
c3A7dGhhbiZuYnNwO21heCZuYnNwO2ludDo8YnIgLz4mbmJzcDsjJm5ic3A7dmlyc2gmbmJzcDtk
b21ibGt0aHJlc2hvbGQmbmJzcDt2Nl8xNjMmbmJzcDtzZGEmbmJzcDs5MjIzMzcyMDM2ODU0Nzc1
ODA3PGJyIC8+Jm5ic3A7IyZuYnNwO3ZpcnNoJm5ic3A7cWVtdS1tb25pdG9yLWNvbW1hbmQmbmJz
cDt2Nl8xNjMmbmJzcDsmbmJzcDsmYXBvczt7Jm5ic3A7JnF1b3Q7ZXhlY3V0ZSZxdW90OzombmJz
cDsmcXVvdDtxdWVyeS1uYW1lZC1ibG9jay1ub2RlcyZxdW90OyZuYnNwO30mYXBvczsmbmJzcDt8
Z3JlcCZuYnNwO3RocmVzaG9sZDxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZxdW90O3dyaXRlX3RocmVz
aG9sZCZxdW90OzombmJzcDs5MjIzMzcyMDM2ODU0Nzc1ODA3LDxiciAvPg08YnIgLz5vdmVyZmxv
dyZuYnNwO2hhcHBlbmVkJm5ic3A7aWYmbmJzcDt0aHJlc2hvbGQmbmJzcDtncmVhdGVyJm5ic3A7
dGhhbiZuYnNwO21heCZuYnNwO2ludDo8YnIgLz4mbmJzcDsjJm5ic3A7dmlyc2gmbmJzcDtkb21i
bGt0aHJlc2hvbGQmbmJzcDt2Nl8xNjMmbmJzcDtzZGEmbmJzcDs5MjIzMzcyMDM2ODU0Nzc1ODEx
PGJyIC8+Jm5ic3A7IyZuYnNwO3ZpcnNoJm5ic3A7cWVtdS1tb25pdG9yLWNvbW1hbmQmbmJzcDt2
Nl8xNjMmbmJzcDsmbmJzcDsmbmJzcDsmYXBvczt7Jm5ic3A7JnF1b3Q7ZXhlY3V0ZSZxdW90Ozom
bmJzcDsmcXVvdDtxdWVyeS1uYW1lZC1ibG9jay1ub2RlcyZxdW90OyZuYnNwO30mYXBvczsmbmJz
cDt8Z3JlcCZuYnNwO3RocmVzaG9sZDxiciAvPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZxdW90O3dyaXRlX3Ro
cmVzaG9sZCZxdW90OzombmJzcDstOTIyMzM3MjAzNjg1NDc3NTgwNSw8YnIgLz4NPGJyIC8+Rml4
ZXM6Jm5ic3A7ZTI0NjIxMTNiMjAwJm5ic3A7JnF1b3Q7YmxvY2s6Jm5ic3A7YWRkJm5ic3A7ZXZl
bnQmbmJzcDt3aGVuJm5ic3A7ZGlzayZuYnNwO3VzYWdlJm5ic3A7ZXhjZWVkcyZuYnNwO3RocmVz
aG9sZCZxdW90Ow08YnIgLz4NPGJyIC8+U2lnbmVkLW9mZi1ieTombmJzcDtSZW4mbmJzcDtMZWkm
bmJzcDsmbHQ7cmVuLmxlaTRAenRlLmNvbS5jbiZndDsNPGJyIC8+U2lnbmVkLW9mZi1ieTombmJz
cDtZaSZuYnNwO1dhbmcmbmJzcDsmbHQ7d2FuZy55aTU5QHp0ZS5jb20uY24mZ3Q7DTxiciAvPi0t
LTxiciAvPiZuYnNwO3FhcGkvYmxvY2stY29yZS5qc29uJm5ic3A7fCZuYnNwOzImbmJzcDsrLTxi
ciAvPiZuYnNwOzEmbmJzcDtmaWxlJm5ic3A7Y2hhbmdlZCwmbmJzcDsxJm5ic3A7aW5zZXJ0aW9u
KCspLCZuYnNwOzEmbmJzcDtkZWxldGlvbigtKTxiciAvPg08YnIgLz5kaWZmJm5ic3A7LS1naXQm
bmJzcDthL3FhcGkvYmxvY2stY29yZS5qc29uJm5ic3A7Yi9xYXBpL2Jsb2NrLWNvcmUuanNvbjxi
ciAvPmluZGV4Jm5ic3A7OWY1NTVkNS4uMDBiODcyOSZuYnNwOzEwMDY0NDxiciAvPi0tLSZuYnNw
O2EvcWFwaS9ibG9jay1jb3JlLmpzb248YnIgLz4rKysmbmJzcDtiL3FhcGkvYmxvY2stY29yZS5q
c29uPGJyIC8+QEAmbmJzcDstNDA5LDcmbmJzcDsrNDA5LDcmbmJzcDtAQDxiciAvPiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZhcG9zOypicHNfd3JfbWF4X2xlbmd0aCZhcG9zOzombmJzcDsmYXBvcztp
bnQmYXBvczssJm5ic3A7JmFwb3M7KmlvcHNfbWF4X2xlbmd0aCZhcG9zOzombmJzcDsmYXBvcztp
bnQmYXBvczssPGJyIC8+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7JmFwb3M7KmlvcHNfcmRfbWF4X2xl
bmd0aCZhcG9zOzombmJzcDsmYXBvcztpbnQmYXBvczssJm5ic3A7JmFwb3M7KmlvcHNfd3JfbWF4
X2xlbmd0aCZhcG9zOzombmJzcDsmYXBvcztpbnQmYXBvczssPGJyIC8+Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7JmFwb3M7KmlvcHNfc2l6ZSZhcG9zOzombmJzcDsmYXBvcztpbnQmYXBvczssJm5ic3A7
JmFwb3M7Kmdyb3VwJmFwb3M7OiZuYnNwOyZhcG9zO3N0ciZhcG9zOywmbmJzcDsmYXBvcztjYWNo
ZSZhcG9zOzombmJzcDsmYXBvcztCbG9ja2RldkNhY2hlSW5mbyZhcG9zOyw8YnIgLz4tJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7JmFwb3M7d3JpdGVfdGhyZXNob2xkJmFwb3M7OiZuYnNwOyZhcG9zO2ludCZhcG9z
OywmbmJzcDsmYXBvczsqZGlydHktYml0bWFwcyZhcG9zOzombmJzcDtbJmFwb3M7QmxvY2tEaXJ0
eUluZm8mYXBvcztdJm5ic3A7fSZuYnNwO308YnIgLz4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7JmFwb3M7d3Jp
dGVfdGhyZXNob2xkJmFwb3M7OiZuYnNwOyZhcG9zO3VpbnQ2NCZhcG9zOywmbmJzcDsmYXBvczsq
ZGlydHktYml0bWFwcyZhcG9zOzombmJzcDtbJmFwb3M7QmxvY2tEaXJ0eUluZm8mYXBvcztdJm5i
c3A7fSZuYnNwO308YnIgLz4mbmJzcDsNPGJyIC8+Jm5ic3A7IyM8YnIgLz4mbmJzcDsjJm5ic3A7
QEJsb2NrRGV2aWNlSW9TdGF0dXM6PGJyIC8+LS0mbmJzcDsNPGJyIC8+MS44LjMuMTxiciAvPg==

--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--


