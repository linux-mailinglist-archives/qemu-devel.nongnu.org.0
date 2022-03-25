Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A825D4E7544
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:43:56 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlAR-0001PB-9h
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:43:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liucong2@kylinos.cn>)
 id 1nXl97-0000Z4-Cc
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:42:33 -0400
Received: from mailgw.kylinos.cn ([123.150.8.42]:14142 helo=nksmu.kylinos.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liucong2@kylinos.cn>)
 id 1nXl8y-00021N-2L
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:42:32 -0400
X-UUID: 9d55fc60accd42c7ac7ae249c07a4462-20220325
X-UUID: 9d55fc60accd42c7ac7ae249c07a4462-20220325
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1976352412; Fri, 25 Mar 2022 22:41:16 +0800
Received: by cs2c.com.cn (NSMail, from userid 10001)
 id 3E67A383C640; Fri, 25 Mar 2022 22:42:03 +0800 (CST)
From: <liucong2@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFJlOiBbUEFUQ0hdIGt2bS9hcm02NDogRml4IG1lbW9yeSBzZWN0aW9uIGRpZCBub3Qgc2V0IHRvIGt2bQ==?=
To: =?UTF-8?B?UGV0ZXIgTWF5ZGVsbA==?= <peter.maydell@linaro.org>,
Date: Fri, 25 Mar 2022 22:42:03 +0800
X-Mailer: NSMAIL 6.0
Message-ID: <mw2ty4ijin-mw2ty4ijio@nsmail6.0>
References: CAFEAcA8uqRbZzEaZOh4xjeqhEbxy82UxjeRBMfhNsbAoXzk_Vg@mail.gmail.com
X-Delaysendtime: Fri, 25 Mar 2022 22:42:03 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-mxe1pczf4i-mxe1pczf4j
X-ns-mid: webmail-623dd4bb-mxbhtq5b
Received-SPF: permerror client-ip=123.150.8.42;
 envelope-from=liucong2@kylinos.cn; helo=nksmu.kylinos.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, KHOP_HELO_FCRDNS=0.187, MIME_HTML_ONLY=0.1,
 MSGID_RANDY=2.599, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This message is in MIME format.

--nsmail-mxe1pczf4i-mxe1pczf4j
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PHA+PGJyPjwvcD48cD5IaSBQZXRlciw8L3A+PHA+PGJyPjwvcD48cD5JIGZv
dW5kIHRoaXMgaXNzdWUgb24gcW1ldSA0LjIgd2l0aCBob3N0IGxpbnV4IDQu
MTksIEkgd2FudCB0bzwvcD48cD51c2UgcXhsIG9uIGFybTY0LiBvbiBhcm02
NCwgZGVmYXVsdCBwYWdlIHNpemUgaXMgNjRrLCBhbmQgdGhlPC9wPjxwPnF4
bF9yb21fc2l6ZSBpcyBmaXhlZCA4MTkyLjwvcD48cD48YnI+PC9wPjxwPmJ1
dCB3aGVuIEkgcmVhZCBxeGxfcm9tIHJlZ2lvbiBpbiBndWVzdCwgZ3Vlc3Qg
b3Mgc3RvcHBlZCBhbmQ8L3A+PHA+SSBjYW4gc2VlIGVycm9yIG1lc3NhZ2Ug
ImxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb24gZGVjb2RlaW5nIG5vdCZuYnNwOzwv
cD48cD5pbXBsZW1lbnRlZCIgaW4gaG9zdCBzaWRlLiBpdCBpcyBiZWNhdXNl
IHF4bCByb20gYmFyIG1lbW9yeTwvcD48cD5yZWdpb24gZGlkbid0IGNvbW1p
dCB0byBrdm0uPC9wPjxwPjxicj48L3A+PHA+SSBvbmx5IHRyeSBxZW11IDYu
MCByYXRoZXIgdGhhbiB0aGUgbGF0ZXN0IHZlcnNpb24gYmVjYXVzZSZuYnNw
OzwvcD48cD5JIG1lZXQgc29tZSBjb21waWxlIGlzc3VlLiBjb21taXQgY2U3
MDE1ZDllODY2OWU8L3A+PHA+c3RhcnQgdjYuMS4wLXJjMCwgaXQgd2lsbCBj
aGFuZ2UgdGhlIGRlZmF1bHQgcXhsIHJvbSBiYXIgc2l6ZTwvcD48cD50byA2
NGsgb24gbXkgcGxhdGZvcm0uIHRoZW4gbXkgcHJvYmxlbSBkaXNhcHBlYXIu
IGJ1dCB3aGVuJm5ic3A7PC9wPjxwPm90aGVycyBjcmVhdGUgYSBtZW1vcnkg
cmVnaW9uIHdpdGggdGhlIHNpemUgbGVzcyB0aGFuIG9uZTwvcD48cD5wYWdl
LiB3aGVuIGl0IHJ1biBpbnRvIGt2bV9hbGlnbl9zZWN0aW9uLCBpdCByZXR1
cm4gMDwvcD48cD5hZ2Fpbi48L3A+PHA+PGJyPjwvcD48cD5SZWdhcmRzPC9w
PjxwPkNvbmcuPC9wPjxkaXYgaWQ9InJlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6
MC41ZW07cGFkZGluZy1sZWZ0OjAuNWVtO2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCBncmVlbjsiPjxicj48YnI+PGJyPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7PGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZjVmN2ZhIj48
Yj7kuLvjgIDpopjvvJo8L2I+PHNwYW4gaWQ9InN1YmplY3QiPlJlOiBbUEFU
Q0hdIGt2bS9hcm02NDogRml4IG1lbW9yeSBzZWN0aW9uIGRpZCBub3Qgc2V0
IHRvIGt2bTwvc3Bhbj4KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7PGJyPjxiPuaXpeOAgOacn++8mjwvYj48c3BhbiBpZD0i
ZGF0ZSI+MjAyMi0wMy0yNSAyMToxMjwvc3Bhbj4KICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PGJyPjxiPuWPkeS7tuS6uu+8
mjwvYj48c3BhbiBpZD0iZnJvbSI+UGV0ZXIgTWF5ZGVsbDwvc3Bhbj4KICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PGJyPjxi
PuaUtuS7tuS6uu+8mjwvYj48c3BhbiBpZD0idG8iPkNvbmcgTGl1PC9zcGFu
PgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsK
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzwvZGl2Pjxicj4KICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOzxkaXYgaWQ9ImNvbnRlbnQiPjxkaXYg
Y2xhc3M9InZpZXdlcl9wYXJ0Ij48ZGl2Pk9uIEZyaSwgMTggTWFyIDIwMjIg
YXQgMTQ6MjQsIENvbmcgTGl1PGxpdWNvbmcyQGt5bGlub3MuY24+d3JvdGU6
PGJyPiZndDs8YnI+Jmd0OyBvbiB0aGUgYXJtNjQgcGxhdGZvcm0sIHRoZSBQ
QUdFU0laRSBpcyA2NGssIHRoZSBkZWZhdWx0IHF4bCByb208YnI+Jmd0OyBi
YXIgc2l6ZSBpcyA4ayhRWExfUk9NX1NaKSwgaW4gdGhlIGNhc2UgbWVtb3J5
IHNpemUgbGVzcyB0aGFuPGJyPiZndDsgb25lIHBhZ2Ugc2l6ZSwga3ZtX2Fs
aWduX3NlY3Rpb24gcmV0dXJuIHplcm8sICZuYnNwO3RoZSBtZW1vcnkgc2Vj
dGlvbjxicj4mZ3Q7IGRpZCBub3QgY29tbWl0IGt2bS48YnI+PGJyPkNhbiB5
b3UgZ2l2ZSBtb3JlIGRldGFpbHMgb24gaG93IHRoaXMgaGFwcGVucz8gVGhl
IG9ubHkgcGxhY2U8YnI+d2UgdXNlIFFYTF9ST01fU1ogaXMgaW4gdGhlIHF4
bF9yb21fc2l6ZSgpIGZ1bmN0aW9uLCBhbmQgdGhhdDxicj5yb3VuZHMgdXAg
dGhlIHZhbHVlIGl0IHJldHVybnMgdG8gdGhlIHFlbXVfcmVhbF9ob3N0X3Bh
Z2Vfc2l6ZS48YnI+VGhhdCBjaGFuZ2Ugd2FzIGFkZGVkIGluIGNvbW1pdCBj
ZTcwMTVkOWU4NjY5ZSwgZXhhZ2N0bHkgdG88YnI+Zml4IHdoYXQgc291bmRz
IGxpa2UgdGhlIHNhbWUgcHJvYmxlbSB5b3UncmUgaGl0dGluZyB3aGVyZTxi
cj5LVk0gaXMgaW4gdXNlIGFuZCB0aGUgaG9zdCBwYWdlIHNpemUgaXMgbGFy
Z2VyIHRoYW4gOEsuPGJyPkFyZSB5b3UgdXNpbmcgYW4gb2xkIHZlcnNpb24g
b2YgUUVNVSB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGF0IGZpeCA/PGJyPjxicj4m
Z3Q7IFNpZ25lZC1vZmYtYnk6IENvbmcgTGl1PGxpdWNvbmcyQGt5bGlub3Mu
Y24+PGJyPiZndDsgLS0tPGJyPiZndDsgJm5ic3A7YWNjZWwva3ZtL2t2bS1h
bGwuYyB8IDEgKzxicj4mZ3Q7ICZuYnNwOzEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKTxicj4mZ3Q7PGJyPiZndDsgZGlmZiAtLWdpdCBhL2FjY2Vs
L2t2bS9rdm0tYWxsLmMgYi9hY2NlbC9rdm0va3ZtLWFsbC5jPGJyPiZndDsg
aW5kZXggMjc4NjRkZmFlYS4uZjU3Y2FiODExYiAxMDA2NDQ8YnI+Jmd0OyAt
LS0gYS9hY2NlbC9rdm0va3ZtLWFsbC5jPGJyPiZndDsgKysrIGIvYWNjZWwv
a3ZtL2t2bS1hbGwuYzxicj4mZ3Q7IEBAIC0zMTgsNiArMzE4LDcgQEAgc3Rh
dGljIGh3YWRkciBrdm1fYWxpZ25fc2VjdGlvbihNZW1vcnlSZWdpb25TZWN0
aW9uICpzZWN0aW9uLDxicj4mZ3Q7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDtod2FkZHIgKnN0YXJ0KTxicj4mZ3Q7ICZuYnNwO3s8YnI+Jmd0OyAm
bmJzcDsgJm5ic3A7ICZuYnNwO2h3YWRkciBzaXplID0gaW50MTI4X2dldDY0
KHNlY3Rpb24tJmd0O3NpemUpOzxicj4mZ3Q7ICsgJm5ic3A7ICZuYnNwO3Np
emUgPSBST1VORF9VUChzaXplLCBxZW11X3JlYWxfaG9zdF9wYWdlX3NpemUp
Ozxicj4mZ3Q7ICZuYnNwOyAmbmJzcDsgJm5ic3A7aHdhZGRyIGRlbHRhLCBh
bGlnbmVkOzxicj4mZ3Q7PGJyPiZndDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsv
KiBrdm0gd29ya3MgaW4gcGFnZSBzaXplIGNodW5rcywgYnV0IHRoZSBmdW5j
dGlvbiBtYXkgYmUgY2FsbGVkPGJyPjxicj5UaGUgY29tbWVudCB3ZSBjYW4g
anVzdCBzZWUgc3RhcnRpbmcgaGVyZSBzYXlzOjxicj48YnI+ICZuYnNwOyAm
bmJzcDsvKiBrdm0gd29ya3MgaW4gcGFnZSBzaXplIGNodW5rcywgYnV0IHRo
ZSBmdW5jdGlvbiBtYXkgYmUgY2FsbGVkPGJyPiAmbmJzcDsgJm5ic3A7ICZu
YnNwOyB3aXRoIHN1Yi1wYWdlIHNpemUgYW5kIHVuYWxpZ25lZCBzdGFydCBh
ZGRyZXNzLiBQYWQgdGhlIHN0YXJ0PGJyPiAmbmJzcDsgJm5ic3A7ICZuYnNw
OyBhZGRyZXNzIHRvIG5leHQgYW5kIHRydW5jYXRlIHNpemUgdG8gcHJldmlv
dXMgcGFnZSBib3VuZGFyeS4gKi88YnI+PGJyPmJ1dCB5b3VyIGNoYW5nZSBt
ZWFucyB0aGF0J3Mgbm8gbG9uZ2VyIHRydWUuPGJyPjxicj5Nb3JlIGdlbmVy
YWxseSwgcm91bmRpbmcgdXAgdGhlIHNpemUgaGVyZSBzZWVtcyBkdWJpb3Vz
IC0tIHRoZXJlPGJyPmlzIG5vIGd1YXJhbnRlZSB0aGF0IHdoYXRldmVyIGZv
bGxvd3MgdGhlIHNtYWxsIGx1bXAgb2YgUkFNPGJyPmluIHRoZSBhZGRyZXNz
IHNwYWNlIGlzIHNlbnNpYmxlIHRvIHRyZWF0IGFzIHJlYWxseSBiZWluZzxi
cj5wYXJ0IG9mIHRoZSBzYW1lIHRoaW5nLjxicj48YnI+dGhhbmtzPGJyPi0t
IFBNTTxicj48L2xpdWNvbmcyQGt5bGlub3MuY24+PC9saXVjb25nMkBreWxp
bm9zLmNuPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg==

--nsmail-mxe1pczf4i-mxe1pczf4j--

