Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BE27ACF9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 13:37:11 +0200 (CEST)
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMrSw-00075B-Dz
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 07:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kMrRn-0006Bo-TO
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 07:36:00 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:54190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kMrRh-0005mt-78
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 07:35:56 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 40ABE2E14DD;
 Mon, 28 Sep 2020 14:35:44 +0300 (MSK)
Received: from localhost (localhost [::1])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 el3WZ6xI7y-ZdwaBA0c; Mon, 28 Sep 2020 14:35:44 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1601292944; bh=4K9fhz9Zo3wctfj4kRjV0oZJ0T+GsuP7Z7g0f62cUxs=;
 h=Message-Id:Cc:Subject:Date:References:To:From;
 b=Gya247ubRcX/rf8IydOviurkUtG2DM1FqSBv38jCv09yHa9SnLJz8R9Q2mwG7eQ0c
 S12JbgPkAT5L/CqmId+ZFQtAN7r+uq3AdlzkiV8Je3haY/b9AOLyfk/VIDXdiJ8fTq
 EzSGIKZXVWhTpm1b45IPx5Bd/q1W/zGWDJ9JIoYw=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
Received: by myt5-25048b11116f.qloud-c.yandex.net with HTTP;
 Mon, 28 Sep 2020 14:35:39 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20200921191912.105305-1-lekiravi@yandex-team.ru>
Subject: Re: [PATCH v4 0/4] Introducing QMP query-netdev command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 28 Sep 2020 14:35:39 +0300
Message-Id: <f5c36663-0845-c9fa-1e3b-636aef2ccd4a@yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

PGRpdj5QaW5nPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MjEuMDkuMjAyMCAyMjoxOSwgQWxleGV5
IEtpcmlsbG92IHdyaXRlczo8L2Rpdj48ZGl2PiZndDsgVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9k
dWNlcyBhIG5ldyBRTVAgY29tbWFuZCAicXVlcnktbmV0ZGV2IiB0byBnZXQ8L2Rpdj48ZGl2PiZn
dDsgaW5mb3JtYXRpb24gYWJvdXQgY3VycmVudGx5IGF0dGFjaGVkIGJhY2tlbmQgbmV0d29yayBk
ZXZpY2VzIChuZXRkZXZzKS48L2Rpdj48ZGl2PiZndDsgQWxzbywgc2luY2UgdGhlICJpbmZvX3N0
ciIgZmllbGQgb2YgIk5ldENsaWVudFN0YXRlIiBpcyBub3cgZGVwcmVjYXRlZCw8L2Rpdj48ZGl2
PiZndDsgd2Ugbm8gbG9uZ2VyIHVzZSBpdCBmb3IgbmV0ZGV2cywgb25seSBmb3IgTklDL2h1YnBv
cnRzLjwvZGl2PjxkaXY+Jmd0OyBUaGUgSE1QIGNvbW1hbmQgImluZm8gbmV0d29yayIgbm93IGFs
c28gdXNlcyB0aGUgbmV3IFFNUCBjb21tYW5kIGluc2lkZS48L2Rpdj48ZGl2PiZndDs8L2Rpdj48
ZGl2PiZndDsgVXNhZ2UgZXhhbXBsZTo8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsgLSZn
dDsgeyAiZXhlY3V0ZSI6ICJxdWVyeS1uZXRkZXYiIH08L2Rpdj48ZGl2PiZndDsgJmx0Oy0geyAi
cmV0dXJuIjogWzwvZGl2PjxkaXY+Jmd0OyB7PCEtLSAtLT48L2Rpdj48ZGl2PiZndDsgImxpc3Rl
biI6ICIxMjcuMC4wLjE6OTAiLDwvZGl2PjxkaXY+Jmd0OyAidHlwZSI6ICJzb2NrZXQiLDwvZGl2
PjxkaXY+Jmd0OyAicGVlci1pZCI6ICJodWIwcG9ydDEiLDwvZGl2PjxkaXY+Jmd0OyAiaWQiOiAi
X19vcmcucWVtdS5uZXQxIjwvZGl2PjxkaXY+Jmd0OyB9LDwvZGl2PjxkaXY+Jmd0OyB7PCEtLSAt
LT48L2Rpdj48ZGl2PiZndDsgInNjcmlwdCI6ICIvZXRjL3FlbXUtaWZ1cCIsPC9kaXY+PGRpdj4m
Z3Q7ICJkb3duc2NyaXB0IjogIi9ldGMvcWVtdS1pZmRvd24iLDwvZGl2PjxkaXY+Jmd0OyAiaWZu
YW1lIjogInRhcDAiLDwvZGl2PjxkaXY+Jmd0OyAidHlwZSI6ICJ0YXAiLDwvZGl2PjxkaXY+Jmd0
OyAicGVlci1pZCI6ICJuZXQ1Iiw8L2Rpdj48ZGl2PiZndDsgInZuZXRfaGRyIjogdHJ1ZSw8L2Rp
dj48ZGl2PiZndDsgImlkIjogInRhcDAiPC9kaXY+PGRpdj4mZ3Q7IH0sPC9kaXY+PGRpdj4mZ3Q7
IHs8IS0tIC0tPjwvZGl2PjxkaXY+Jmd0OyAiaXB2NiI6IHRydWUsPC9kaXY+PGRpdj4mZ3Q7ICJp
cHY0IjogdHJ1ZSw8L2Rpdj48ZGl2PiZndDsgImhvc3QiOiAiMTAuMC4yLjIiLDwvZGl2PjxkaXY+
Jmd0OyAiaXB2Ni1kbnMiOiAiZmVjMDo6MyIsPC9kaXY+PGRpdj4mZ3Q7ICJpcHY2LXByZWZpeCI6
ICJmZWMwOjoiLDwvZGl2PjxkaXY+Jmd0OyAibmV0IjogIjEwLjAuMi4wLzI1NS4yNTUuMjU1LjAi
LDwvZGl2PjxkaXY+Jmd0OyAiaXB2Ni1ob3N0IjogImZlYzA6OjIiLDwvZGl2PjxkaXY+Jmd0OyAi
dHlwZSI6ICJ1c2VyIiw8L2Rpdj48ZGl2PiZndDsgInBlZXItaWQiOiAibmV0MCIsPC9kaXY+PGRp
dj4mZ3Q7ICJkbnMiOiAiMTAuMC4yLjMiLDwvZGl2PjxkaXY+Jmd0OyAiaG9zdGZ3ZCI6IFs8L2Rp
dj48ZGl2PiZndDsgezwhLS0gLS0+PC9kaXY+PGRpdj4mZ3Q7ICJzdHIiOiAidGNwOjoyMDAwNC06
MjIiPC9kaXY+PGRpdj4mZ3Q7IH08L2Rpdj48ZGl2PiZndDsgXSw8L2Rpdj48ZGl2PiZndDsgImlw
djYtcHJlZml4bGVuIjogNjQsPC9kaXY+PGRpdj4mZ3Q7ICJpZCI6ICJuZXRkZXYwIiw8L2Rpdj48
ZGl2PiZndDsgInJlc3RyaWN0IjogZmFsc2U8L2Rpdj48ZGl2PiZndDsgfTwvZGl2PjxkaXY+Jmd0
OyBdPC9kaXY+PGRpdj4mZ3Q7IH08L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsgdjMtJmd0
O3Y0OjwvZGl2PjxkaXY+Jmd0OyAtIFJlbmFtZSAicXVlcnktbmV0ZGV2cyIgdG8gInF1ZXJ5LW5l
dGRldiIuPC9kaXY+PGRpdj4mZ3Q7IC0gQ29weSBuZXRkZXYgZHJpdmVycyB0byBuZXcgUUFQSSBl
bnVtICJOZXRCYWNrZW5kIi48L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsgdjItJmd0O3Yz
OjwvZGl2PjxkaXY+Jmd0OyAtIFJlbW92ZSBOSUMgYW5kIGh1YnBvcnRzIGZyb20gcXVlcnktbmV0
ZGV2cy48L2Rpdj48ZGl2PiZndDsgLSBSZW1vdmUgc2V2ZXJhbCBmaWVsZHMgZnJvbSBOZXRkZXZJ
bmZvIHNpbmNlIHRoZXkgYXJlIHVubmVjZXNzYXJ5LjwvZGl2PjxkaXY+Jmd0OyAtIFJlbmFtZSBm
aWVsZCBAcGVlciB0byBAcGVlci1pZC48L2Rpdj48ZGl2PiZndDsgLSBBZGQgc3VwcG9ydCBvZiB2
aG9zdC12ZHBhLjwvZGl2PjxkaXY+Jmd0OyAtIEtlZXAgImluZm9fc3RyIiBmb3IgTklDL2h1YnBv
cnRzLCBidXQgcmVtb3ZlIGl0IGZvciBuZXRkZXZzLjwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+
Jmd0OyB2MS0mZ3Q7djI6PC9kaXY+PGRpdj4mZ3Q7IC0gUmV3cml0ZSBITVAgImluZm8gbmV0d29y
ayIgdG8gZ2V0IGluZm9ybWF0aW9uIGZyb20gcmVzdWx0cyBvZiBRTVAgY29tbWFuZC48L2Rpdj48
ZGl2PiZndDsgLSBSZW1vdmUgb2Jzb2xldGUgZmllbGQgImluZm9fc3RyIiBmcm9tICJOZXRDbGll
bnRTdGF0ZSIuPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IEFsZXhleSBLaXJpbGxvdiAo
NCk6PC9kaXY+PGRpdj4mZ3Q7IHFhcGk6IG5ldDogQWRkIHF1ZXJ5LW5ldGRldiBjb21tYW5kPC9k
aXY+PGRpdj4mZ3Q7IHRlc3RzOiBBZGQgdGVzdHMgZm9yIHF1ZXJ5LW5ldGRldiBjb21tYW5kPC9k
aXY+PGRpdj4mZ3Q7IGhtcDogVXNlIFFNUCBxdWVyeS1uZXRkZXYgaW4gaG1wX2luZm9fbmV0d29y
azwvZGl2PjxkaXY+Jmd0OyBuZXQ6IERvIG5vdCB1c2UgbGVnYWN5IGluZm9fc3RyIGZvciBiYWNr
ZW5kczwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyBpbmNsdWRlL25ldC9uZXQuaCB8IDQg
Ky08L2Rpdj48ZGl2PiZndDsgbmV0L2NsaWVudHMuaCB8IDEgKzwvZGl2PjxkaXY+Jmd0OyBuZXQv
aHViLmMgfCA0ICstPC9kaXY+PGRpdj4mZ3Q7IG5ldC9odWIuaCB8IDIgKy08L2Rpdj48ZGl2PiZn
dDsgbmV0L2wydHB2My5jIHwgMjEgKysrLTwvZGl2PjxkaXY+Jmd0OyBuZXQvbmV0LmMgfCAyMTMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy08L2Rpdj48ZGl2PiZndDsgbmV0L25ldG1h
cC5jIHwgMTMgKys8L2Rpdj48ZGl2PiZndDsgbmV0L3NsaXJwLmMgfCAxMjggKysrKysrKysrKysr
KysrKysrLTwvZGl2PjxkaXY+Jmd0OyBuZXQvc29ja2V0LmMgfCA5MSArKysrKysrKysrLS0tLTwv
ZGl2PjxkaXY+Jmd0OyBuZXQvdGFwLXdpbjMyLmMgfCAxMCArLTwvZGl2PjxkaXY+Jmd0OyBuZXQv
dGFwLmMgfCAxMDcgKysrKysrKysrKysrKystLTwvZGl2PjxkaXY+Jmd0OyBuZXQvdmRlLmMgfCAz
OSArKysrKy08L2Rpdj48ZGl2PiZndDsgbmV0L3Zob3N0LXVzZXIuYyB8IDIwICsrLTwvZGl2Pjxk
aXY+Jmd0OyBuZXQvdmhvc3QtdmRwYS5jIHwgMTUgKystPC9kaXY+PGRpdj4mZ3Q7IHFhcGkvbmV0
Lmpzb24gfCA4MCArKysrKysrKysrKys8L2Rpdj48ZGl2PiZndDsgdGVzdHMvcXRlc3QvbWVzb24u
YnVpbGQgfCAzICs8L2Rpdj48ZGl2PiZndDsgdGVzdHMvcXRlc3QvdGVzdC1xdWVyeS1uZXRkZXYu
YyB8IDExNSArKysrKysrKysrKysrKysrKzwvZGl2PjxkaXY+Jmd0OyAxNyBmaWxlcyBjaGFuZ2Vk
LCA4MDcgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pPC9kaXY+PGRpdj4mZ3Q7IGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy9xdGVzdC90ZXN0LXF1ZXJ5LW5ldGRldi5jPC9kaXY+PGRpdj4m
Z3Q7PC9kaXY+PGRpdj4mZ3Q7IC0tPC9kaXY+PGRpdj4mZ3Q7IDIuMjUuMTwvZGl2PjxkaXY+wqA8
L2Rpdj48ZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QWxleGV5IEtpcmlsbG92PC9kaXY+PGRpdj5Z
YW5kZXguQ2xvdWQ8L2Rpdj48L2Rpdj4=

