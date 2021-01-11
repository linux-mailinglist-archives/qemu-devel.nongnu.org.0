Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417642F1FB3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:45:47 +0100 (CET)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz38M-0003t9-9d
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <18401698361@126.com>)
 id 1kyzjD-0006vP-VG
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:07:35 -0500
Received: from [220.181.15.65] (port=21758 helo=m1565.mail.126.com)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <18401698361@126.com>)
 id 1kyzj6-0002wS-5C
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=DCYKi
 AFOIheC4i+6z7vvXNZo291sU4JIC8gfOQoMG1s=; b=FDHo2yG3ZKHyxMmeQQyUV
 M95CJk/afF7TrUOwxcLaidOEg+/xUjNT+6GH/wemzu0MEqzMs9d5MuYvruKGUQ4E
 9mb5Fbr6ObjJV0g4tq8T0o2LV2oz8wQp3VlZlSeHIPO43f3fsZG8EUbHMrR5N4z2
 mFPpTmHqcv7KwtT5fxGIt8=
Received: from 18401698361$126.com ( [120.245.132.83] ) by
 ajax-webmail-wmsvr65 (Coremail) ; Mon, 11 Jan 2021 23:36:12 +0800 (CST)
X-Originating-IP: [120.245.132.83]
Date: Mon, 11 Jan 2021 23:36:12 +0800 (CST)
From: =?GBK?B?va23vL3c?= <18401698361@126.com>
To: qemu-devel@nongnu.org
Subject: =?GBK?Q?=C0=B4=D7=D4JackJF=B5=C4=D3=CA=BC=FE?=
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
Content-Type: multipart/alternative; 
 boundary="----=_Part_89688_1017487375.1610379372435"
MIME-Version: 1.0
Message-ID: <57d49983.6048.176f2172793.Coremail.18401698361@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QcqowED5sUFtcPxfOhMOAQ--.6591W
X-CM-SenderInfo: xvkxvxpdqbuqqrswhudrp/1tbiew0Xq1pEBe8g7AACsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Host-Lookup-Failed: Reverse DNS lookup failed for 220.181.15.65 (deferred)
Received-SPF: pass client-ip=220.181.15.65; envelope-from=18401698361@126.com;
 helo=m1565.mail.126.com
X-Spam_score_int: 46
X-Spam_score: 4.6
X-Spam_bar: ++++
X-Spam_report: (4.6 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FROM_LOCAL_DIGITS=0.001,
 FROM_LOCAL_HEX=0.006, HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jan 2021 14:19:27 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_89688_1017487375.1610379372435
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGk6CiAgICBTb3JyeSB0byBib3RoZXIgeW91fgogICAgSSBoYXZlIHJlYWQgdGhlIGRpc2N1c3Np
b25zIGFib3V0IENWRS0tMjAxOS0xMjkyOCAoIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvcWVtdS1kZXZlbC8yMDE5LTA3L21zZzAxMTUzLmh0bWwpLgpCdXQsIGZvciB0aGUgc2Nl
bmFyaW8gb2YgUEMgdXNlcnMsIHdoaWNoIGlzIG5vIHJlcXVpcmVtZW50IG9mIG5ldHdvcmsgYWNj
ZXNzIHRvIFFNUCwgdGhlcmUgYXJlIHNvbWUgbWl0aWdhdGluZyBwcm9wb3Nlcy4KSSB3YW50IHRv
IGhhdmUgeW91ciBzdWdnZXN0aW9ucy4=
------=_Part_89688_1017487375.1610379372435
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+SGk6PC9kaXY+PGRpdiBz
dHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7IFNvcnJ5IHRvIGJvdGhlciB5b3V+PC9kaXY+
PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7IEkgaGF2ZSByZWFkIHRoZSBkaXNj
dXNzaW9ucyBhYm91dCBDVkUtPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgd2hpdGUt
c3BhY2U6IHByZS13cmFwOyI+LTIwMTktMTI5MjggKCA8L3NwYW4+PGZvbnQgZmFjZT0iYXJpYWwi
PjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij48YSBocmVmPSJodHRwczovL2xp
c3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxOS0wNy9tc2cwMTE1My5odG1s
KS4iIF9zcmM9Imh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8y
MDE5LTA3L21zZzAxMTUzLmh0bWwpLiI+aHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRt
bC9xZW11LWRldmVsLzIwMTktMDcvbXNnMDExNTMuaHRtbCkuPC9hPjwvc3Bhbj48L2ZvbnQ+PC9k
aXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij48Zm9udCBmYWNlPSJhcmlhbCI+PHNwYW4gc3R5bGU9
IndoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPiAgICBCdXQsIGZvciB0aGUgc2NlbmFyaW8gb2YgUEMg
dXNlcnMsIHdoaWNoIGlzIG5vIHJlcXVpcmVtZW50IG9mIG5ldHdvcmsgYWNjZXNzIHRvIFFNUCwg
dGhlcmUgYXJlIHNvbWUgbWl0aWdhdGluZyBwcm9wb3Nlcy48L3NwYW4+PC9mb250PjwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjowOyI+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxlPSJ3aGl0
ZS1zcGFjZTogcHJlLXdyYXA7Ij4gICAgPC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2IHN0eWxlPSJt
YXJnaW46MDsiPjxmb250IGZhY2U9ImFyaWFsIj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6IHBy
ZS13cmFwOyI+SSB3YW50IHRvIGhhdmUgeW91ciBzdWdnZXN0aW9ucy48L3NwYW4+PC9mb250Pjwv
ZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxl
PSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij4gICAgIDwvc3Bhbj48L2ZvbnQ+PC9kaXY+PC9kaXY+

------=_Part_89688_1017487375.1610379372435--


