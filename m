Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6A456CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:57:35 +0100 (CET)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0eD-0001qd-U8
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <787738581@qq.com>) id 1mo0cM-0000s3-5O
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:55:38 -0500
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211]:54965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <787738581@qq.com>) id 1mo0cG-0005vh-Jn
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1637315723; bh=9j2iKVdgN9B4+sZCx/ZnssbzNRw/0zJpO0dRHEEM+dU=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=y8YZUGft3WfP3YeKuhcO1OJa47+kVb6PWsCg7tI9oZFSXbfTI1jkxW/3AcL/saJqV
 c1KS3ony3TjOSYpYTyUkhanMXNfCQC/HWQ2+AzDx/qbfHRVDkQBEcsvwb4yCKMgdW7
 hy1J+3DE1/sVDS/ZG6PWeg8pCAD0ii5GN9mHwcAg=
X-QQ-FEAT: oHWrrGTW1dBmzhB2GfV7iaAibnObjryY
X-QQ-SSF: 00000000000000F000000000000000Z
X-QQ-XMAILINFO: NEX83TKpr24r5WExQlyovtSrFBQ2NDLKDaSRNGBWlG2dPJSgbxUH3ON2YeAYgY
 gyGOrk5xz9TcEyd3SJABiokEP8mE5pCKByXL6QB9jEcmeEUOvsU493EW80LzKPUxMYiGxymKm8deE
 H0hQnrk9T+H3IzkkxBlGtPFtKZOkgFKvQUYM1RDrhWtNnFjA9znwz+RmeDMMAZJsWDHGKxCFNx48J
 MduIN6C+rgxdltVmY0v0pMWI/wgO7p9Ah8AdPYWkMytAZZXTF8FDAJaWcEBJxk+z0RSOw/A5TQyxp
 35oRJLbPAVm+Yq2WjQt+6uQsgnrlFmD6AmF6TP+xhY8//ubMM55raGuFk+VMj07r0DH9WOTCKmbPU
 pfNcKt4G4HT+zwJmgpJQiHhx3NUBBNjiBWxWZVI9bXnS7ngAhUSPh6d5V/axUJuXeAqDmKbJQJN/w
 GchP15HWzLisQI44EwW1qwmNJH6CY9FT1gEZMy+3ulOoRgbgguvuSeJrZb4CQonMDlPK4c3NNjpOd
 9M68ORQWK82ro8whsSOGp8+a4jF51pazaqt4Zb8s/qzcnCy9v0o2/rhPFzrhq8vpSlw54HI7Y8jHi
 RThrDos3OYHUM9gN05L7bia2Tgvh/PQyVe1K+58DVuGkAZojJBl/spT7LYhY7o/5UZ5SRnwYCCDen
 d51oww08MVuq85rW/xtsPgLSVtFX21VwhMHJtpISwC1/LVRC6sb3/oujK5lSv7NnzbESxmq6M9W8h
 d3qRkCp7IRdQ3gT4f4dgf2geDP44MU0CAGZ9RlWifs1X3qWXO+VEiArxvA0VIEEueBQlYL4PssYft
 bEJ4hmTkGYxB3hOSYV9GX+8+cxHhFEtDqkRfffpO2j3f
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 111.206.242.65
In-Reply-To: <cc793f13-fb5c-f075-3839-e603d727b557@redhat.com>
References: <tencent_C7CEA36B3AB3971A278DFD71F2BBCFF88906@qq.com>
 <CAMxuvaw1+x0FmG_0aW2YCL2pUPFuO=VC=0nv0QA43MkKnMM7fQ@mail.gmail.com>
 <cc793f13-fb5c-f075-3839-e603d727b557@redhat.com>
X-QQ-STYLE: 
X-QQ-mid: webmail333t1637315722t3238130
From: "=?gb18030?B?pNe357n9zt662z8/?=" <787738581@qq.com>
To: "=?gb18030?B?UGFvbG8gQm9uemluaQ==?=" <pbonzini@redhat.com>,
 "=?gb18030?B?TWFyYy1BbmRyqKYgTHVyZWF1?=" <marcandre.lureau@redhat.com>
Cc: "=?gb18030?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Subject: =?gb18030?B?u9i4tKO6IENoYXJkZXY6IGRlbGV0ZSB0aGUgUWVt?=
 =?gb18030?B?dU9wdHMgcmVzZXJ2ZWQgaW4gdm1fY29uZmlnX2dy?=
 =?gb18030?B?b3Vwcw==?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_6197748A_10CA7AC0_57B010F1"
Content-Transfer-Encoding: 8Bit
Date: Fri, 19 Nov 2021 17:55:22 +0800
X-Priority: 3
Message-ID: <tencent_78D73BE67535381AA663CCF7AEF1139D3107@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
Received-SPF: pass client-ip=162.62.58.211; envelope-from=787738581@qq.com;
 helo=out162-62-58-211.mail.qq.com
X-Spam_score_int: 67
X-Spam_score: 6.7
X-Spam_bar: ++++++
X-Spam_report: (6.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HELO_DYNAMIC_IPADDR=1.951, HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45,
 NO_FM_NAME_IP_HOSTN=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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

------=_NextPart_6197748A_10CA7AC0_57B010F1
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

T0ssIHRoYW5rIHlvdSBQYW9sbyEgSSB3aWxsIHdyaXRlIGEmbmJzcDtjaGFyX3VucGFyZW50
IGFzIHlvdXIgY29tbWVudC4NCg0KDQpXaW5kIFl1DQoNCg0KDQoNCi0tLS0tLS0tLS0tLS0t
LS0tLSZuYnNwO9StyrzTyrz+Jm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tDQq3orz+yMs6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIlBhb2xvIEJvbnppbmkiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PHBib256aW5pQHJlZGhhdC5jb20mZ3Q7Ow0Kt6LLzcqxvOQ6Jm5ic3A7MjAyMcTqMTHUwjE5
yNUo0MfG2s7lKSDPws7nNToyNw0KytW8/sjLOiZuYnNwOyJNYXJjLUFuZHKopiBMdXJlYXUi
PG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbSZndDs7IqTXt+e5/c7euts/PyI8Nzg3NzM4
NTgxQHFxLmNvbSZndDs7DQqzrcvNOiZuYnNwOyJxZW11LWRldmVsIjxxZW11LWRldmVsQG5v
bmdudS5vcmcmZ3Q7Ow0K1vfM4jombmJzcDtSZTogQ2hhcmRldjogZGVsZXRlIHRoZSBRZW11
T3B0cyByZXNlcnZlZCBpbiB2bV9jb25maWdfZ3JvdXBzDQoNCg0KDQpPbiAxMS84LzIxIDA5
OjQ2LCBNYXJjLUFuZHKopiBMdXJlYXUgd3JvdGU6DQomZ3Q7Jmd0OyArJm5ic3A7Jm5ic3A7
IFFlbXVPcHRzICpvcHRzOw0KJmd0OyZndDsNCiZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNociA9IHFlbXVfY2hyX2ZpbmQoaWQpOw0KJmd0OyZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGNociA9PSBOVUxMKSB7
DQomZ3Q7Jmd0OyBAQCAtMTE3NSw2ICsxMTc3LDEwIEBAIHZvaWQgcW1wX2NoYXJkZXZfcmVt
b3ZlKGNvbnN0IGNoYXIgKmlkLCBFcnJvciAqKmVycnApDQomZ3Q7Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1
cm47DQomZ3Q7Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9DQom
Z3Q7Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBvYmplY3RfdW5w
YXJlbnQoT0JKRUNUKGNocikpOw0KJmd0OyZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyAvKiBk
ZWxldGUgdGhlIG9wdHMgcmVzZXJ2ZWQgaW4gdm1fY29uZmlnX2dyb3VwcyBsaXN0LiZuYnNw
OyAqLw0KJmd0OyZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBvcHRzID0gcWVtdV9vcHRzX2Zp
bmQocWVtdV9maW5kX29wdHMoImNoYXJkZXYiKSwgaWQpOw0KJmd0OyZndDsgKyZuYnNwOyZu
YnNwOyZuYnNwOyBpZiAob3B0cykNCiZndDsmZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgcWVtdV9vcHRzX2RlbChvcHRzKTsNCiZndDsgVGhhdCBz
ZWVtcyByZWFzb25hYmxlIHRvIG1lLA0KJmd0OyBSZXZpZXdlZC1ieTogTWFyYy1BbmRyqKYg
THVyZWF1PG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbSZndDsNCg0KSSB0aGluayBpdCBz
aG91bGQgYmUgZG9uZSBpbnN0ZWFkIGluIGFuIHVucGFyZW50IGZ1bmN0aW9uLCBpLmUuIHdp
dGggDQpzb21ldGhpbmcgbGlrZSAib2MtJmd0O3VucGFyZW50ID0gY2hyX3VucGFyZW50OyIg
aW4gY2hhcl9jbGFzc19pbml0LiANCmNocl91bnBhcmVudCBkb2VzIHRoZSBxZW11X29wdHNf
ZmluZC9xZW11X29wdHNfZGVsLg0KDQpUaGFua3MsDQoNClBhb2xv

------=_NextPart_6197748A_10CA7AC0_57B010F1
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5PSywgdGhhbmsgeW91IFBhb2xvISBJIHdpbGwgd3JpdGUg
YSZuYnNwO2NoYXJfdW5wYXJlbnQgYXMgeW91ciBjb21tZW50LjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+V2luZCBZdTwvZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOiAxMnB4O2ZvbnQtZmFtaWx5OiBBcmlhbCBOYXJy
b3c7cGFkZGluZzoycHggMCAycHggMDsiPi0tLS0tLS0tLS0tLS0tLS0tLSZuYnNwO9StyrzT
yrz+Jm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXpl
OiAxMnB4O2JhY2tncm91bmQ6I2VmZWZlZjtwYWRkaW5nOjhweDsiPjxkaXY+PGI+t6K8/sjL
OjwvYj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiUGFvbG8gQm9uemluaSIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmbHQ7cGJvbnppbmlAcmVkaGF0LmNvbSZndDs7PC9kaXY+PGRpdj48Yj63osvN
yrG85Do8L2I+Jm5ic3A7MjAyMcTqMTHUwjE5yNUo0MfG2s7lKSDPws7nNToyNzwvZGl2Pjxk
aXY+PGI+ytW8/sjLOjwvYj4mbmJzcDsiTWFyYy1BbmRyqKYgTHVyZWF1IiZsdDttYXJjYW5k
cmUubHVyZWF1QHJlZGhhdC5jb20mZ3Q7OyKk17fnuf3O3rrbPz8iJmx0Ozc4NzczODU4MUBx
cS5jb20mZ3Q7Ozx3YnI+PC9kaXY+PGRpdj48Yj6zrcvNOjwvYj4mbmJzcDsicWVtdS1kZXZl
bCImbHQ7cWVtdS1kZXZlbEBub25nbnUub3JnJmd0Ozs8d2JyPjwvZGl2PjxkaXY+PGI+1vfM
4jo8L2I+Jm5ic3A7UmU6IENoYXJkZXY6IGRlbGV0ZSB0aGUgUWVtdU9wdHMgcmVzZXJ2ZWQg
aW4gdm1fY29uZmlnX2dyb3VwczwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pk9uIDExLzgv
MjEgMDk6NDYsIE1hcmMtQW5kcqimIEx1cmVhdSB3cm90ZTo8YnI+Jmd0OyZndDsgKyZuYnNw
OyZuYnNwOyBRZW11T3B0cyAqb3B0czs8YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgY2hyID0gcWVtdV9jaHJfZmluZChpZCk7
PGJyPiZndDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChj
aHIgPT0gTlVMTCkgezxicj4mZ3Q7Jmd0OyBAQCAtMTE3NSw2ICsxMTc3LDEwIEBAIHZvaWQg
cW1wX2NoYXJkZXZfcmVtb3ZlKGNvbnN0IGNoYXIgKmlkLCBFcnJvciAqKmVycnApPGJyPiZn
dDsmZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJldHVybjs8YnI+Jmd0OyZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgfTxicj4mZ3Q7Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKGNocikpOzxicj4mZ3Q7Jmd0OyAr
Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8qIGRlbGV0ZSB0aGUgb3B0cyByZXNlcnZlZCBpbiB2bV9j
b25maWdfZ3JvdXBzIGxpc3QuJm5ic3A7ICovPGJyPiZndDsmZ3Q7ICsmbmJzcDsmbmJzcDsm
bmJzcDsgb3B0cyA9IHFlbXVfb3B0c19maW5kKHFlbXVfZmluZF9vcHRzKCJjaGFyZGV2Iiks
IGlkKTs8YnI+Jmd0OyZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAob3B0cyk8YnI+Jmd0
OyZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBxZW11
X29wdHNfZGVsKG9wdHMpOzxicj4mZ3Q7IFRoYXQgc2VlbXMgcmVhc29uYWJsZSB0byBtZSw8
YnI+Jmd0OyBSZXZpZXdlZC1ieTogTWFyYy1BbmRyqKYgTHVyZWF1Jmx0O21hcmNhbmRyZS5s
dXJlYXVAcmVkaGF0LmNvbSZndDs8YnI+PGJyPkkgdGhpbmsgaXQgc2hvdWxkIGJlIGRvbmUg
aW5zdGVhZCBpbiBhbiB1bnBhcmVudCBmdW5jdGlvbiwgaS5lLiB3aXRoIDxicj5zb21ldGhp
bmcgbGlrZSAib2MtJmd0O3VucGFyZW50ID0gY2hyX3VucGFyZW50OyIgaW4gY2hhcl9jbGFz
c19pbml0LiA8YnI+Y2hyX3VucGFyZW50IGRvZXMgdGhlIHFlbXVfb3B0c19maW5kL3FlbXVf
b3B0c19kZWwuPGJyPjxicj5UaGFua3MsPGJyPjxicj5QYW9sbzxicj48L2Rpdj4=

------=_NextPart_6197748A_10CA7AC0_57B010F1--


