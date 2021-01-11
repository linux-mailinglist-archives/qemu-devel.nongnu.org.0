Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460D2F1F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:37:51 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz30g-00044h-DT
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <18401698361@126.com>)
 id 1kyzNQ-0004tx-WF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:45:05 -0500
Received: from m1565.mail.126.com ([220.181.15.65]:20939)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <18401698361@126.com>)
 id 1kyzND-0007Ng-8B
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=oLQQD
 O2TG2YlpjHZctyOzZOLGA3NewQ/5WjC82LvjM4=; b=ZP/7t2XgrsYvoc1l1Efpa
 d4jcsyXcwjjf3c57VxmTUx3b6hFydsAn3yVmXHGjTGEKNSRqLQT/smWY/BP8eHl8
 0kyikP7Ko0p0EG7zuU2irYl49BwZ6gv/wV7AqzgQbN+q5fiQgkhJx+iYWsk5who+
 fJgMAZDW3ITjw8X5k7c1Ck=
Received: from 18401698361$126.com ( [120.245.132.83] ) by
 ajax-webmail-wmsvr65 (Coremail) ; Mon, 11 Jan 2021 23:43:53 +0800 (CST)
X-Originating-IP: [120.245.132.83]
Date: Mon, 11 Jan 2021 23:43:53 +0800 (CST)
From: =?GBK?B?va23vL3c?= <18401698361@126.com>
To: qemu-devel@nongnu.org
Subject: Ask for suggestions for CVE-2019-12928
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
Content-Type: multipart/alternative; 
 boundary="----=_Part_89785_2125655425.1610379833290"
MIME-Version: 1.0
Message-ID: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QcqowEBZM0M5cvxfWhMOAQ--.6022W
X-CM-SenderInfo: xvkxvxpdqbuqqrswhudrp/1tbiexkXq1pEBe9KiAAAso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.15.65; envelope-from=18401698361@126.com;
 helo=m1565.mail.126.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_LOCAL_DIGITS=0.001,
 FROM_LOCAL_HEX=0.006, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jan 2021 14:19:15 -0500
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
Cc: berrange@redhat.com, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_89785_2125655425.1610379833290
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGk6CiAgICBTb3JyeSB0byBib3RoZXIgeW91fgogICAgSSBoYXZlIHJlYWQgdGhlIGRpc2N1c3Np
b25zIGFib3V0IENWRS0tMjAxOS0xMjkyOCAoIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvcWVtdS1kZXZlbC8yMDE5LTA3L21zZzAxMTUzLmh0bWwpLgpCdXQsIGZvciB0aGUgc2Nl
bmFyaW8gb2YgUEMgdXNlcnMsIHdoaWNoIGlzIG5vIHJlcXVpcmVtZW50IG9mIG5ldHdvcmsgYWNj
ZXNzIHRvIFFNUCwgdGhlcmUgYXJlIHNvbWUgbWl0aWdhdGluZyBwcm9wb3Nlcy4KMS4gTW9kaWZ5
IHRoZSBjb21waWxhdGlvbiBvcHRpb25zIHRvIGRpc2FibGUgUU1QLgoyLiBNb2RpZnkgY29tbWFu
ZCBsaW5lIHBhcnNpbmcgZnVuY3Rpb24gdG8gZGlzY2FyZCB0aGUgUU1QIHBhcmFtZXRlcnMgd2l0
aCBuZXR3b3JrIGNvbmZpZ3VyYXRpb25zLgozLiBQQyBtYW5hZ2VyIG9yIG90aGVyIG1hbmFnZSBz
b2Z0d2FyZSBtYWtlIHN1cmUgb25seSB0aGUgdHJ1c3RlZCB1c2VyIGNhbiB1c2UgUU1QLgo0LiBP
dGhlciBpZGVhcz8KSSB3YW50IHRvIGhhdmUgeW91ciBzdWdnZXN0aW9ucy4KVGhhbmtzLApCZXN0
IHJlZ2FyZHMu
------=_Part_89785_2125655425.1610379833290
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OiAxLjc7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGZvbnQtc2l6ZTogMTRweDsiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cmlhbDsgbWFyZ2luOiAwcHg7Ij5IaTo8L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJp
YWw7IG1hcmdpbjogMHB4OyI+Jm5ic3A7ICZuYnNwOyBTb3JyeSB0byBib3RoZXIgeW91fjwvZGl2
PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbDsgbWFyZ2luOiAwcHg7Ij4mbmJzcDsgJm5i
c3A7IEkgaGF2ZSByZWFkIHRoZSBkaXNjdXNzaW9ucyBhYm91dCBDVkUtPHNwYW4gc3R5bGU9ImZv
bnQtZmFtaWx5OiBhcmlhbDsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyI+LTIwMTktMTI5MjggKCA8
L3NwYW4+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJlLXdy
YXA7Ij48YSBocmVmPSJodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2
ZWwvMjAxOS0wNy9tc2cwMTE1My5odG1sKS4iIF9zcmM9Imh0dHBzOi8vbGlzdHMuZ251Lm9yZy9h
cmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE5LTA3L21zZzAxMTUzLmh0bWwpLiI+aHR0cHM6Ly9s
aXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTktMDcvbXNnMDExNTMuaHRt
bCkuPC9hPjwvc3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFs
OyBtYXJnaW46IDBweDsiPjxmb250IGZhY2U9ImFyaWFsIj48c3BhbiBzdHlsZT0id2hpdGUtc3Bh
Y2U6IHByZS13cmFwOyI+ICAgIEJ1dCwgZm9yIHRoZSBzY2VuYXJpbyBvZiBQQyB1c2Vycywgd2hp
Y2ggaXMgbm8gcmVxdWlyZW1lbnQgb2YgbmV0d29yayBhY2Nlc3MgdG8gUU1QLCB0aGVyZSBhcmUg
c29tZSBtaXRpZ2F0aW5nIHByb3Bvc2VzLjwvc3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFyaWFsOyBtYXJnaW46IDBweDsiPjxmb250IGZhY2U9ImFyaWFsIj48c3Bh
biBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyI+ICAgIDwvc3Bhbj48L2ZvbnQ+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBtYXJnaW46IDBweDsiPjxmb250IGZhY2U9
ImFyaWFsIj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyI+ICAgIDEuIE1vZGlm
eSB0aGUgY29tcGlsYXRpb24gb3B0aW9ucyB0byBkaXNhYmxlIFFNUC48L3NwYW4+PC9mb250Pjwv
ZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbDsgbWFyZ2luOiAwcHg7Ij48Zm9udCBm
YWNlPSJhcmlhbCI+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPiAgICAyLiBN
b2RpZnkgY29tbWFuZCBsaW5lIHBhcnNpbmcgZnVuY3Rpb24gdG8gZGlzY2FyZCB0aGUgUU1QIHBh
cmFtZXRlcnMgd2l0aCBuZXR3b3JrIGNvbmZpZ3VyYXRpb25zLjwvc3Bhbj48L2ZvbnQ+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBtYXJnaW46IDBweDsiPjxmb250IGZhY2U9
ImFyaWFsIj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyI+ICAgIDMuIFBDIG1h
bmFnZXIgb3Igb3RoZXIgbWFuYWdlIHNvZnR3YXJlIG1ha2Ugc3VyZSBvbmx5IHRoZSB0cnVzdGVk
IHVzZXIgY2FuIHVzZSBRTVAuPC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogQXJpYWw7IG1hcmdpbjogMHB4OyI+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxl
PSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij4gICAgNC4gT3RoZXIgaWRlYXM/PC9zcGFuPjwvZm9u
dD48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IG1hcmdpbjogMHB4OyI+PGZv
bnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij4gICAg
SSB3YW50IHRvIGhhdmUgeW91ciBzdWdnZXN0aW9ucy48L3NwYW4+PC9mb250PjwvZGl2PjxkaXYg
c3R5bGU9Im1hcmdpbjogMHB4OyI+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTogcHJlLXdyYXA7Ij5UaGFua3MsPC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46IDBweDsiPjxmb250IGZhY2U9ImFyaWFsIj48c3BhbiBzdHlsZT0id2hpdGUtc3Bh
Y2U6IHByZS13cmFwOyI+QmVzdCByZWdhcmRzLjwvc3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBtYXJnaW46IDBweDsiPjxmb250IGZhY2U9ImFyaWFsIj48
c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyI+ICAgICA8L3NwYW4+PC9mb250Pjwv
ZGl2PjwvZGl2PjwvZGl2Pg==
------=_Part_89785_2125655425.1610379833290--


