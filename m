Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349172CF55B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:13:39 +0100 (CET)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHSU-000090-9k
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1klF6i-00033e-Tj
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:43:01 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1klF6O-0004iO-Ay
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:42:49 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id D93A32E12F1;
 Fri,  4 Dec 2020 20:34:52 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 S7Aawz9R9b-YowSGgCJ; Fri, 04 Dec 2020 20:34:52 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1607103292; bh=/Jb1+d3I4I/RYBDb31FgsgRBuRoFU2a0RW+VZ7X8n1c=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=zAVhKWqegAMoiUN00wZLtT3+jYI7l7Vh+0yB5A8tdeTUtBOBzHcNiNz9UdGUCG8jd
 51HiwVLJputXEv24iaoSq0xHnwg24rxQW2+KHEY5b427hnlM0HismFeN9+Ipb2LU/D
 Ei/W7Bw3nYzF5Tilf8nmt+oXhT+L0x+v/3mbB1vk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net [2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by myt5-ca7361f95f04.qloud-c.yandex.net with LMTP id BY3gE42e2J-9WiHznFe
 for <lekiravi@yandex-team.ru>; Fri, 04 Dec 2020 20:34:40 +0300
Received: by myt5-25048b11116f.qloud-c.yandex.net with HTTP;
 Fri, 04 Dec 2020 20:34:39 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
In-Reply-To: <20201108235952.107961-1-lekiravi@yandex-team.ru>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
Subject: Re: [PATCH v5 0/4] Introducing QMP query-netdev command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 04 Dec 2020 20:34:49 +0300
Message-Id: <113211607103209@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj48ZGl2PnBpbmcgYWdhaW48YnIgLz48YnIgLz5QYXRjaHdvcmsgcGFnZTogPGEgaHJlZj0i
aHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9saXN0Lz9zZXJp
ZXM9MjEyOTgzIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9xZW11LWRldmVsL2xpc3QvP3Nlcmllcz0y
MTI5ODM8L2E+PC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MDkuMTEuMjAyMCwgMDM6MDIs
ICJBbGV4ZXkgS2lyaWxsb3YiICZsdDtsZWtpcmF2aUB5YW5kZXgtdGVhbS5ydSZndDs6PC9kaXY+
PGJsb2NrcXVvdGU+PHA+VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyBRTVAgY29t
bWFuZCAicXVlcnktbmV0ZGV2IiB0byBnZXQ8YnIgLz5pbmZvcm1hdGlvbiBhYm91dCBjdXJyZW50
bHkgYXR0YWNoZWQgYmFja2VuZCBuZXR3b3JrIGRldmljZXMgKG5ldGRldnMpLjxiciAvPkFsc28s
IHNpbmNlIHRoZSAiaW5mb19zdHIiIGZpZWxkIG9mICJOZXRDbGllbnRTdGF0ZSIgaXMgbm93IGRl
cHJlY2F0ZWQsPGJyIC8+d2Ugbm8gbG9uZ2VyIHVzZSBpdCBmb3IgbmV0ZGV2cywgb25seSBmb3Ig
TklDL2h1YnBvcnRzLjxiciAvPlRoZSBITVAgY29tbWFuZCAiaW5mbyBuZXR3b3JrIiBub3cgYWxz
byB1c2VzIHRoZSBuZXcgUU1QIGNvbW1hbmQgaW5zaWRlLjxiciAvPjxiciAvPlVzYWdlIGV4YW1w
bGU6PGJyIC8+PGJyIC8+LSZndDsgeyAiZXhlY3V0ZSI6ICJxdWVyeS1uZXRkZXYiIH08YnIgLz4m
bHQ7LSB7ICJyZXR1cm4iOiBbPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgezwhLS0gLS0+PGJyIC8+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAibGlzdGVuIjogIjEyNy4wLjAuMTo5MCIsPGJyIC8+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAidHlwZSI6ICJzb2NrZXQiLDxiciAvPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgInBlZXItaWQiOiAiaHViMHBvcnQxIiw8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCJpZCI6ICJfX29yZy5xZW11Lm5ldDEiPGJyIC8+wqDCoMKgwqDCoMKg
wqDCoMKgfSw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqB7PCEtLSAtLT48YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCJzY3JpcHQiOiAiL2V0Yy9xZW11LWlmdXAiLDxiciAvPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgImRvd25zY3JpcHQiOiAiL2V0Yy9xZW11LWlmZG93biIsPGJyIC8+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiaWZuYW1lIjogInRhcDAiLDxiciAvPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgInR5cGUiOiAidGFwIiw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCJwZWVyLWlkIjogIm5ldDUiLDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
InZuZXRfaGRyIjogdHJ1ZSw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJpZCI6ICJ0
YXAwIjxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoH0sPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgezwh
LS0gLS0+PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiaXB2NiI6IHRydWUsPGJyIC8+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiaXB2NCI6IHRydWUsPGJyIC8+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAiaG9zdCI6ICIxMC4wLjIuMiIsPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAiaXB2Ni1kbnMiOiAiZmVjMDo6MyIsPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAiaXB2Ni1wcmVmaXgiOiAiZmVjMDo6Iiw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCJuZXQiOiAiMTAuMC4yLjAvMjU1LjI1NS4yNTUuMCIsPGJyIC8+wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAiaXB2Ni1ob3N0IjogImZlYzA6OjIiLDxiciAvPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgInR5cGUiOiAidXNlciIsPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAi
cGVlci1pZCI6ICJuZXQwIiw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJkbnMiOiAi
MTAuMC4yLjMiLDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImhvc3Rmd2QiOiBbPGJy
IC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHs8IS0tIC0tPjxiciAvPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJzdHIiOiAidGNwOjoyMDAwNC06
MjIiPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH08YnIgLz7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoF0sPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiaXB2
Ni1wcmVmaXhsZW4iOiA2NCw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJpZCI6ICJu
ZXRkZXYwIiw8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJyZXN0cmljdCI6IGZhbHNl
PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgfTxiciAvPsKgwqDCoMKgwqBdPGJyIC8+wqDCoMKgfTxi
ciAvPjxiciAvPnY0LSZndDt2NTo8YnIgLz4tIEVuYWJsZSBxdGVzdCBvZiBxdWVyeS1uZXRkZXZz
IGZvciBBVlIgYW5kIFJYIGFyY2hzLjxiciAvPi0gQnVtcCAiU2luY2UiIHZlcnNpb24gaW4gUUFQ
SSB0byA2LjAuPGJyIC8+PGJyIC8+djMtJmd0O3Y0OjxiciAvPi0gUmVuYW1lICJxdWVyeS1uZXRk
ZXZzIiB0byAicXVlcnktbmV0ZGV2Ii48YnIgLz4tIENvcHkgbmV0ZGV2IGRyaXZlcnMgdG8gbmV3
IFFBUEkgZW51bSAiTmV0QmFja2VuZCIuPGJyIC8+PGJyIC8+djItJmd0O3YzOjxiciAvPi0gUmVt
b3ZlIE5JQyBhbmQgaHVicG9ydHMgZnJvbSBxdWVyeS1uZXRkZXZzLjxiciAvPi0gUmVtb3ZlIHNl
dmVyYWwgZmllbGRzIGZyb20gTmV0ZGV2SW5mbyBzaW5jZSB0aGV5IGFyZSB1bm5lY2Vzc2FyeS48
YnIgLz4tIFJlbmFtZSBmaWVsZCBAcGVlciB0byBAcGVlci1pZC48YnIgLz4tIEFkZCBzdXBwb3J0
IG9mIHZob3N0LXZkcGEuPGJyIC8+LSBLZWVwICJpbmZvX3N0ciIgZm9yIE5JQy9odWJwb3J0cywg
YnV0IHJlbW92ZSBpdCBmb3IgbmV0ZGV2cy48YnIgLz48YnIgLz52MS0mZ3Q7djI6PGJyIC8+LSBS
ZXdyaXRlIEhNUCAiaW5mbyBuZXR3b3JrIiB0byBnZXQgaW5mb3JtYXRpb24gZnJvbSByZXN1bHRz
IG9mIFFNUCBjb21tYW5kLjxiciAvPi0gUmVtb3ZlIG9ic29sZXRlIGZpZWxkICJpbmZvX3N0ciIg
ZnJvbSAiTmV0Q2xpZW50U3RhdGUiLjxiciAvPjxiciAvPkFsZXhleSBLaXJpbGxvdiAoNCk6PGJy
IC8+wqDCoHFhcGk6IG5ldDogQWRkIHF1ZXJ5LW5ldGRldiBjb21tYW5kPGJyIC8+wqDCoHRlc3Rz
OiBBZGQgdGVzdHMgZm9yIHF1ZXJ5LW5ldGRldiBjb21tYW5kPGJyIC8+wqDCoGhtcDogVXNlIFFN
UCBxdWVyeS1uZXRkZXYgaW4gaG1wX2luZm9fbmV0d29yazxiciAvPsKgwqBuZXQ6IERvIG5vdCB1
c2UgbGVnYWN5IGluZm9fc3RyIGZvciBiYWNrZW5kczxiciAvPjxiciAvPsKgaW5jbHVkZS9uZXQv
bmV0LmggfCA0ICstPGJyIC8+wqBuZXQvY2xpZW50cy5oIHwgMSArPGJyIC8+wqBuZXQvaHViLmMg
fCA0ICstPGJyIC8+wqBuZXQvaHViLmggfCAyICstPGJyIC8+wqBuZXQvbDJ0cHYzLmMgfCAyMSAr
KystPGJyIC8+wqBuZXQvbmV0LmMgfCAyMTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky08YnIgLz7CoG5ldC9uZXRtYXAuYyB8IDEzICsrPGJyIC8+wqBuZXQvc2xpcnAuYyB8IDEyOCAr
KysrKysrKysrKysrKysrKystPGJyIC8+wqBuZXQvc29ja2V0LmMgfCA5MSArKysrKysrKysrLS0t
LTxiciAvPsKgbmV0L3RhcC13aW4zMi5jIHwgMTAgKy08YnIgLz7CoG5ldC90YXAuYyB8IDEwNyAr
KysrKysrKysrKysrKy0tPGJyIC8+wqBuZXQvdmRlLmMgfCAzOSArKysrKy08YnIgLz7CoG5ldC92
aG9zdC11c2VyLmMgfCAyMCArKy08YnIgLz7CoG5ldC92aG9zdC12ZHBhLmMgfCAxNSArKy08YnIg
Lz7CoHFhcGkvbmV0Lmpzb24gfCA4MCArKysrKysrKysrKys8YnIgLz7CoHRlc3RzL3F0ZXN0L21l
c29uLmJ1aWxkIHwgMyArPGJyIC8+wqB0ZXN0cy9xdGVzdC90ZXN0LXF1ZXJ5LW5ldGRldi5jIHwg
MTIwICsrKysrKysrKysrKysrKysrKzxiciAvPsKgMTcgZmlsZXMgY2hhbmdlZCwgODEyIGluc2Vy
dGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKTxiciAvPsKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L3F0ZXN0L3Rlc3QtcXVlcnktbmV0ZGV2LmM8YnIgLz7CoDwvcD4tLTxiciAvPjIuMjUuMTxiciAv
PjxiciAvPsKgPC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKg
PC9kaXY+PGRpdj5BbGV4ZXkgS2lyaWxsb3Y8L2Rpdj48ZGl2PllhbmRleC5DbG91ZDwvZGl2Pjxk
aXY+wqA8L2Rpdj4=

