Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA332611
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:06:34 +0100 (CET)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJc4H-0007w8-RO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJbSS-0001kW-05
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:27:28 -0500
Received: from m13109.mail.163.com ([220.181.13.109]:23783)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1lJbSH-00071i-Vs
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 07:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=hIKQ9
 XTWwF2qAn/ZIOOIhZj+bRhaaf3Wa5aEmlZNmxQ=; b=gGG5pSb9XAb7MKpsxpnZ7
 5cOkJIbLC7/69X2cDYW0l0lx/kP94q9Ucytnb7RD8G2W811+5zaskQcIRd/JWwNo
 rO9XikdWpNL6+iDogzvW2McLG97TLOF1s47HusA7KBUzV3gyquR7RxEKAChOJFg+
 UHCY59r6DEjIN3Pz60ROGo=
Received: from a_lijiejun$163.com ( [121.201.121.142] ) by
 ajax-webmail-wmsvr109 (Coremail) ; Tue, 9 Mar 2021 20:27:06 +0800 (CST)
X-Originating-IP: [121.201.121.142]
Date: Tue, 9 Mar 2021 20:27:06 +0800 (CST)
From: =?GBK?B?wO691L+h?= <a_lijiejun@163.com>
To: =?GBK?Q?Philippe_Mathieu-Daud=A8=A6?= <philmd@redhat.com>
Subject: Re:Re: [PATCH] virtio-gpu: Add spaces around operator
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <c7918046-a99e-663e-355c-0b9b1c4d817c@redhat.com>
References: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
 <c7918046-a99e-663e-355c-0b9b1c4d817c@redhat.com>
X-CM-CTRLDATA: JHFKSmZvb3Rlcl9odG09MTk3ODo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_127007_152833634.1615292826979"
MIME-Version: 1.0
Message-ID: <168ecce2.896f.17816f48563.Coremail.a_lijiejun@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bcGowADXUZSbaUdgeJcDAQ--.58413W
X-CM-SenderInfo: pdboxyplhm30i6rwjhhfrp/xtbBohtQFFaD-GNzWgAAse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.109; envelope-from=a_lijiejun@163.com;
 helo=m13109.mail.163.com
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_127007_152833634.1615292826979
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgoKCgoKCgoKCgoKCgoKCgoKCkF0IDIwMjEtMDMtMDkgMTc6MDg6MDgsICJQaGlsaXBwZSBNYXRo
aWV1LURhdWSopiIgPHBoaWxtZEByZWRoYXQuY29tPiB3cm90ZToKPihDYydpbmcgcWVtdS10cml2
aWFsQCkKPgo+T24gMy85LzIxIDg6NDIgQU0sIGxpamllanVuIHdyb3RlOgo+PiBGaXggY29kZSBz
dHlsZS4gT3BlcmF0b3IgbmVlZHMgc3BhY2VzIGZvcmVuZCBzaWRlcywgYW5kIGRlbGV0ZSBsaW5l
IHNwYWNlLgo+Cgo+ImZvcmVuZCI/CgoKZG9uZSB3aXRoOgpGaXggY29kZSBzdHlsZS4gT3BlcmF0
b3IgbmVlZHMgYWxpZ24gd2l0aCBlaWdodCBzcGFjZXMsIGFuZCBkZWxldGUgbGluZSBzcGFjZS4K
Cgo+Cj5PdGhlcndpc2U6Cj5SZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkqKYgPHBo
aWxtZEByZWRoYXQuY29tPgo+Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBsaWppZWp1biA8YV9saWpp
ZWp1bkAxNjMuY29tPgo+PiAtLS0KPj4gIGh3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jIHwgMyAr
LS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPj4g
Cj4+IGRpZmYgLS1naXQgYS9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2QuYyBiL2h3L2Rpc3BsYXkv
dmlydGlvLWdwdS0zZC5jCj4+IGluZGV4IDllYjQ4OTAuLmQ5ODk2NDggMTAwNjQ0Cj4+IC0tLSBh
L2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jCj4+ICsrKyBiL2h3L2Rpc3BsYXkvdmlydGlvLWdw
dS0zZC5jCj4+IEBAIC00MzgsNyArNDM4LDcgQEAgdm9pZCB2aXJ0aW9fZ3B1X3ZpcmdsX3Byb2Nl
c3NfY21kKFZpcnRJT0dQVSAqZywKPj4gICAgICAgICAgYnJlYWs7Cj4+ICAgICAgY2FzZSBWSVJU
SU9fR1BVX0NNRF9SRVNPVVJDRV9GTFVTSDoKPj4gICAgICAgICAgdmlyZ2xfY21kX3Jlc291cmNl
X2ZsdXNoKGcsIGNtZCk7Cj4+IC0gICAgICAgYnJlYWs7Cj4+ICsgICAgICAgIGJyZWFrOwo+PiAg
ICAgIGNhc2UgVklSVElPX0dQVV9DTURfUkVTT1VSQ0VfVU5SRUY6Cj4+ICAgICAgICAgIHZpcmds
X2NtZF9yZXNvdXJjZV91bnJlZihnLCBjbWQpOwo+PiAgICAgICAgICBicmVhazsKPj4gQEAgLTQ1
Niw3ICs0NTYsNiBAQCB2b2lkIHZpcnRpb19ncHVfdmlyZ2xfcHJvY2Vzc19jbWQoVmlydElPR1BV
ICpnLAo+PiAgICAgIGNhc2UgVklSVElPX0dQVV9DTURfR0VUX0NBUFNFVDoKPj4gICAgICAgICAg
dmlyZ2xfY21kX2dldF9jYXBzZXQoZywgY21kKTsKPj4gICAgICAgICAgYnJlYWs7Cj4+IC0KPj4g
ICAgICBjYXNlIFZJUlRJT19HUFVfQ01EX0dFVF9ESVNQTEFZX0lORk86Cj4+ICAgICAgICAgIHZp
cnRpb19ncHVfZ2V0X2Rpc3BsYXlfaW5mbyhnLCBjbWQpOwo+PiAgICAgICAgICBicmVhazsKPj4g
Cg==
------=_Part_127007_152833634.1615292826979
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxl
PSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxk
aXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlO3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2TmV0
ZWFzZU1haWxDYXJkIj48L2Rpdj48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cHJlPjxi
cj5BdCAyMDIxLTAzLTA5IDE3OjA4OjA4LCAiUGhpbGlwcGUgTWF0aGlldS1EYXVkqKYiICZsdDtw
aGlsbWRAcmVkaGF0LmNvbSZndDsgd3JvdGU6CiZndDsoQ2MnaW5nIHFlbXUtdHJpdmlhbEApCiZn
dDsKJmd0O09uIDMvOS8yMSA4OjQyIEFNLCBsaWppZWp1biB3cm90ZToKJmd0OyZndDsgRml4IGNv
ZGUgc3R5bGUuIE9wZXJhdG9yIG5lZWRzIHNwYWNlcyBmb3JlbmQgc2lkZXMsIGFuZCBkZWxldGUg
bGluZSBzcGFjZS4KJmd0Owo8ZGl2PiZndDsiZm9yZW5kIj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PmRvbmUgd2l0aDo8L2Rpdj48ZGl2PkZpeCBjb2RlIHN0eWxlLiBPcGVyYXRvciBuZWVkcyBh
bGlnbiB3aXRoIGVpZ2h0IHNwYWNlcywgYW5kIGRlbGV0ZSBsaW5lIHNwYWNlLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PiZndDsKJmd0O090aGVyd2lzZToKJmd0O1Jldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWSopiAmbHQ7cGhpbG1kQHJlZGhhdC5jb20mZ3Q7CiZndDsKJmd0OyZndDsgCiZn
dDsmZ3Q7IFNpZ25lZC1vZmYtYnk6IGxpamllanVuICZsdDthX2xpamllanVuQDE2My5jb20mZ3Q7
CiZndDsmZ3Q7IC0tLQomZ3Q7Jmd0OyAgaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMgfCAzICst
LQomZ3Q7Jmd0OyAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQomZ3Q7Jmd0OyAKJmd0OyZndDsgZGlmZiAtLWdpdCBhL2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0z
ZC5jIGIvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMKJmd0OyZndDsgaW5kZXggOWViNDg5MC4u
ZDk4OTY0OCAxMDA2NDQKJmd0OyZndDsgLS0tIGEvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMK
Jmd0OyZndDsgKysrIGIvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMKJmd0OyZndDsgQEAgLTQz
OCw3ICs0MzgsNyBAQCB2b2lkIHZpcnRpb19ncHVfdmlyZ2xfcHJvY2Vzc19jbWQoVmlydElPR1BV
ICpnLAomZ3Q7Jmd0OyAgICAgICAgICBicmVhazsKJmd0OyZndDsgICAgICBjYXNlIFZJUlRJT19H
UFVfQ01EX1JFU09VUkNFX0ZMVVNIOgomZ3Q7Jmd0OyAgICAgICAgICB2aXJnbF9jbWRfcmVzb3Vy
Y2VfZmx1c2goZywgY21kKTsKJmd0OyZndDsgLSAgICAgICBicmVhazsKJmd0OyZndDsgKyAgICAg
ICAgYnJlYWs7CiZndDsmZ3Q7ICAgICAgY2FzZSBWSVJUSU9fR1BVX0NNRF9SRVNPVVJDRV9VTlJF
RjoKJmd0OyZndDsgICAgICAgICAgdmlyZ2xfY21kX3Jlc291cmNlX3VucmVmKGcsIGNtZCk7CiZn
dDsmZ3Q7ICAgICAgICAgIGJyZWFrOwomZ3Q7Jmd0OyBAQCAtNDU2LDcgKzQ1Niw2IEBAIHZvaWQg
dmlydGlvX2dwdV92aXJnbF9wcm9jZXNzX2NtZChWaXJ0SU9HUFUgKmcsCiZndDsmZ3Q7ICAgICAg
Y2FzZSBWSVJUSU9fR1BVX0NNRF9HRVRfQ0FQU0VUOgomZ3Q7Jmd0OyAgICAgICAgICB2aXJnbF9j
bWRfZ2V0X2NhcHNldChnLCBjbWQpOwomZ3Q7Jmd0OyAgICAgICAgICBicmVhazsKJmd0OyZndDsg
LQomZ3Q7Jmd0OyAgICAgIGNhc2UgVklSVElPX0dQVV9DTURfR0VUX0RJU1BMQVlfSU5GTzoKJmd0
OyZndDsgICAgICAgICAgdmlydGlvX2dwdV9nZXRfZGlzcGxheV9pbmZvKGcsIGNtZCk7CiZndDsm
Z3Q7ICAgICAgICAgIGJyZWFrOwomZ3Q7Jmd0OyAKPC9wcmU+PC9kaXY+PGJyPjxicj48c3BhbiB0
aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_127007_152833634.1615292826979--


