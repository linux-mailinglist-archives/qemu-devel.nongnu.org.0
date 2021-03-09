Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CABC331E0C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 05:47:46 +0100 (CET)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJUHZ-0007Jc-29
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 23:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJTjh-0006s6-2b
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:12:45 -0500
Received: from m1363.mail.163.com ([220.181.13.63]:13266)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJTja-0004EW-BP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=K1iAG
 uF/1A4atisSacBktnHxuvyFrc+4WHxzqsCyWio=; b=Q6GPl3C8TnSqwqfu1mwOy
 lCOhkVonuLkq1Z/XPBQ12zWyux42A8nInUxoSzupCEylizDDJdyElyYxhZF3hODv
 zX3HODeaoTqjMcu9oAzPuJrKcB5I0uaKEIqvG4BhhYzf+1kviKpsb/r29hh2xgbc
 Bc87HCSo5JjIq0ZrmkctBQ=
Received: from a_lijiejun$163.com ( [121.201.121.142] ) by
 ajax-webmail-wmsvr63 (Coremail) ; Tue, 9 Mar 2021 11:57:02 +0800 (CST)
X-Originating-IP: [121.201.121.142]
Date: Tue, 9 Mar 2021 11:57:02 +0800 (CST)
From: =?GBK?B?wO691L+h?= <a_lijiejun@163.com>
To: kraxel@redhat.com, mst@redhat.com
Subject: [PATCH] virtio-gpu: Add spaces around operator
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: I7ZQeGZvb3Rlcl9odG09MTc5NTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_49398_836465282.1615262222000"
MIME-Version: 1.0
Message-ID: <62fc3043.352f.178152186b1.Coremail.a_lijiejun@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: P8GowAA3TsIO8kZgzWEDAQ--.7440W
X-CM-SenderInfo: pdboxyplhm30i6rwjhhfrp/xtbBXhVNFFaD6CAZ8wABsk
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.63; envelope-from=a_lijiejun@163.com;
 helo=m1363.mail.163.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Mar 2021 23:46:06 -0500
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_49398_836465282.1615262222000
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RnJvbSAwNTEyZDFjYmU1YzAxODQ0YjRhY2EyNjAwMjQwMDZlMDU4ZGMxYjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQoKRnJvbTogbGlqaWVqdW4gPGFfbGlqaWVqdW5AMTYzLmNvbT4KCkRhdGU6
IFR1ZSwgOSBNYXIgMjAyMSAxMToxNzo1OSArMDgwMAoKU3ViamVjdDogW1BBVENIXSB2aXJ0aW8t
Z3B1OiBBZGQgc3BhY2VzIGFyb3VuZCBvcGVyYXRvcgoKCgoKRml4IGNvZGUgc3R5bGUuIE9wZXJh
dG9yIG5lZWRzIHNwYWNlcyBmb3JlbmQgc2lkZXMuCgoKCgpTaWduZWQtb2ZmLWJ5OiBsaWppZWp1
biA8YV9saWppZWp1bkAxNjMuY29tPgoKLS0tCgogaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMg
fCAyICstCgogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgoK
CgpkaWZmIC0tZ2l0IGEvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMgYi9ody9kaXNwbGF5L3Zp
cnRpby1ncHUtM2QuYwoKaW5kZXggOWViNDg5MC4uZmIxMWU1ZiAxMDA2NDQKCi0tLSBhL2h3L2Rp
c3BsYXkvdmlydGlvLWdwdS0zZC5jCgorKysgYi9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2QuYwoK
QEAgLTQzOCw3ICs0MzgsNyBAQCB2b2lkIHZpcnRpb19ncHVfdmlyZ2xfcHJvY2Vzc19jbWQoVmly
dElPR1BVICpnLAoKICAgICAgICAgYnJlYWs7CgogICAgIGNhc2UgVklSVElPX0dQVV9DTURfUkVT
T1VSQ0VfRkxVU0g6CgogICAgICAgICB2aXJnbF9jbWRfcmVzb3VyY2VfZmx1c2goZywgY21kKTsK
Ci0gICAgICAgYnJlYWs7CgorICAgICAgICBicmVhazsKCiAgICAgY2FzZSBWSVJUSU9fR1BVX0NN
RF9SRVNPVVJDRV9VTlJFRjoKCiAgICAgICAgIHZpcmdsX2NtZF9yZXNvdXJjZV91bnJlZihnLCBj
bWQpOwoKICAgICAgICAgYnJlYWs7CgotLQoKMS44LjMuMQ==
------=_Part_49398_836465282.1615262222000
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46MDsiPkZyb20gMDUxMmQxY2JlNWMw
MTg0NGI0YWNhMjYwMDI0MDA2ZTA1OGRjMWI2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDE8L3A+
PHAgc3R5bGU9Im1hcmdpbjowOyI+RnJvbTogbGlqaWVqdW4gJmx0O2FfbGlqaWVqdW5AMTYzLmNv
bSZndDs8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+RGF0ZTogVHVlLCA5IE1hciAyMDIxIDExOjE3
OjU5ICswODAwPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPlN1YmplY3Q6IFtQQVRDSF0gdmlydGlv
LWdwdTogQWRkIHNwYWNlcyBhcm91bmQgb3BlcmF0b3I8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+
PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij5GaXggY29kZSBzdHlsZS4gT3BlcmF0b3IgbmVl
ZHMgc3BhY2VzIGZvcmVuZCBzaWRlcy48L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+PGJyPjwvcD48
cCBzdHlsZT0ibWFyZ2luOjA7Ij5TaWduZWQtb2ZmLWJ5OiBsaWppZWp1biAmbHQ7YV9saWppZWp1
bkAxNjMuY29tJmd0OzwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij4tLS08L3A+PHAgc3R5bGU9Im1h
cmdpbjowOyI+Jm5ic3A7aHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMgfCAyICstPC9wPjxwIHN0
eWxlPSJtYXJnaW46MDsiPiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKTwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJn
aW46MDsiPmRpZmYgLS1naXQgYS9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2QuYyBiL2h3L2Rpc3Bs
YXkvdmlydGlvLWdwdS0zZC5jPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPmluZGV4IDllYjQ4OTAu
LmZiMTFlNWYgMTAwNjQ0PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPi0tLSBhL2h3L2Rpc3BsYXkv
dmlydGlvLWdwdS0zZC5jPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPisrKyBiL2h3L2Rpc3BsYXkv
dmlydGlvLWdwdS0zZC5jPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPkBAIC00MzgsNyArNDM4LDcg
QEAgdm9pZCB2aXJ0aW9fZ3B1X3ZpcmdsX3Byb2Nlc3NfY21kKFZpcnRJT0dQVSAqZyw8L3A+PHAg
c3R5bGU9Im1hcmdpbjowOyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2JyZWFr
OzwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwO2Nhc2UgVklSVElP
X0dQVV9DTURfUkVTT1VSQ0VfRkxVU0g6PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt2aXJnbF9jbWRfcmVzb3VyY2VfZmx1c2goZywgY21k
KTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+LSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2Jy
ZWFrOzwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij4rJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IGJyZWFrOzwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwO2Nhc2Ug
VklSVElPX0dQVV9DTURfUkVTT1VSQ0VfVU5SRUY6PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPiZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt2aXJnbF9jbWRfcmVzb3VyY2VfdW5yZWYo
ZywgY21kKTs8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO2JyZWFrOzwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij4tLTwvcD48cCBzdHlsZT0i
bWFyZ2luOjA7Ij4xLjguMy4xPC9wPjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vm
b290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_49398_836465282.1615262222000--


