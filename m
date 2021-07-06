Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B63BC539
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:19:31 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cYT-00058V-JA
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yindongbest@126.com>)
 id 1m0aXt-000395-Tk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 22:10:45 -0400
Received: from m1591.mail.126.com ([220.181.15.91]:23851
 helo=m1573.mail.126.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yindongbest@126.com>) id 1m0aXp-0001J4-53
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 22:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ZwX5n
 x8CjVeYoINxDG1E0Z9uUjAmR2hvcx+n1rVX9jY=; b=GbOfIRPGMf7W96KzbsBe8
 R5V4mCOJstGFAnVAt+TgExZPvjuRByL0Jw/5EARThprpgrlpKIggR2t5cR2iXR2o
 agbvEtqNcm2sEmlShpKeUhv3BLiFjGVYBE1QVsUDdVdGRgSMogjdnNLBa+3s15FP
 tpACVfrbNJNfGqhZC+v6yI=
Received: from yindongbest$126.com (
 [240e:47d:34c8:9330:796b:2705:9d6a:44b3] ) by ajax-webmail-wmsvr73
 (Coremail) ; Tue, 6 Jul 2021 09:39:38 +0800 (GMT+08:00)
X-Originating-IP: [240e:47d:34c8:9330:796b:2705:9d6a:44b3]
Date: Tue, 6 Jul 2021 09:39:38 +0800 (GMT+08:00)
From: =?GBK?B?0vO2rA==?= <yindongbest@126.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: support for raspberry3/3B/4B
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(88fc36b2)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
Content-Type: multipart/alternative; 
 boundary="----=_Part_8407_2105771468.1625535578485"
MIME-Version: 1.0
Message-ID: <4417b006.b29.17a79788175.Coremail.yindongbest@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ScqowAC3_y5btONg2MmFAA--.27252W
X-CM-SenderInfo: x1lqv05qjev2bw6rjloofrz/1tbiwAnGNVx5Cr4fCQACs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.15.91; envelope-from=yindongbest@126.com;
 helo=m1573.mail.126.com
X-Spam_score_int: 63
X-Spam_score: 6.3
X-Spam_bar: ++++++
X-Spam_report: (6.3 / 5.0 requ) BAYES_50=0.8, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_IMAGE_ONLY_32=0.001, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01 autolearn=no autolearn_force=no
X-Spam_action: reject
X-Mailman-Approved-At: Tue, 06 Jul 2021 00:18:30 -0400
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

------=_Part_8407_2105771468.1625535578485
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgdGVhbSBvZiBxZW11Ckkgc2VlIHRoZSBxZW11Ni4wIGhhcyBzdXBwb3J0ZWQgZm9yIHJhc3Bi
ZXJyeVBpY2sgMkIuIGJ1dCBpIHdhbnQgdXNlIGl0IGZvciByYXNwYmVycnlwaSAzLzNCLzRCLiBT
byBjYW4geW91IHRlbGwgbWUgYWJvdXQgcmFzcGJlcnJ5cGkgMy8zQi80QiBwbGFuID8KCgp8IHwK
0vO2rAp8CnwK08rP5KO6eWluZG9uZ2Jlc3RAMTI2LmNvbQp8CgrHqcP708kgzfjS19PKz+S088qm
ILao1sY=
------=_Part_8407_2105771468.1625535578485
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8ZGl2IHN0eWxlPSJs
aW5lLWhlaWdodDoxLjY7Zm9udC1mYW1pbHk6J8a7t70nLCfOosjt0cW62icsJ3NhbnMtc2VyaWYn
OyI+SGkgdGVhbSBvZiBxZW11PGJyPkkgc2VlIHRoZSBxZW11Ni4wIGhhcyBzdXBwb3J0ZWQgZm9y
IHJhc3BiZXJyeVBpY2sgMkIuIGJ1dCBpIHdhbnQgdXNlIGl0IGZvciByYXNwYmVycnlwaSAzLzNC
LzRCLiBTbyBjYW4geW91IHRlbGwgbWUgYWJvdXQgcmFzcGJlcnJ5cGkgMy8zQi80QiBwbGFuID88
YnI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Im5lLXF1b3RlZCI+ICAgICAgICA8YSBocmVmPSJodHRw
czovL21hYXMubWFpbC4xNjMuY29tL2Rhc2hpLXdlYi1leHRlbmQvaHRtbC9wcm9TaWduYXR1cmUu
aHRtbD9mdGxJZD0xJmFtcDtuYW1lPSVFNiVBRSVCNyVFNSU4NiVBQyZhbXA7dWlkPXlpbmRvbmdi
ZXN0JTQwMTI2LmNvbSZhbXA7aWNvblVybD1odHRwcyUzQSUyRiUyRm1haWwtb25saW5lLm5vc2Ru
LjEyNy5uZXQlMkZxaXllbG9nbyUyRmRlZmF1bHRBdmF0YXIucG5nJmFtcDtpdGVtcz0lNUIlMjIl
RTklODIlQUUlRTclQUUlQjElRUYlQkMlOUF5aW5kb25nYmVzdCU0MDEyNi5jb20lMjIlNUQiIHN0
eWxlPSJkaXNwbGF5OmJsb2NrO2JhY2tncm91bmQ6I2ZmZjsgbWF4LXdpZHRoOiA0MDBweDsgX3dp
ZHRoOiA0MDBweDtwYWRkaW5nOjE1cHggMCAxMHB4IDA7dGV4dC1kZWNvcmF0aW9uOiBub25lOyBv
dXRsaW5lOm5vbmU7LXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOnRyYW5zcGFyZW50Oy13ZWJr
aXQtdGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7dGV4dC1zaXplLWFkanVzdDpub25l
ICFpbXBvcnRhbnQ7Ij4KICAgICAgICAgICAgPHRhYmxlIGNlbGxwYWRkaW5nPSIwIiBzdHlsZT0i
d2lkdGg6IDEwMCU7IG1heC13aWR0aDogMTAwJTsgdGFibGUtbGF5b3V0OiBmaXhlZDsgYm9yZGVy
LWNvbGxhcHNlOiBjb2xsYXBzZTtjb2xvcjogIzliOWVhMTtmb250LXNpemU6IDE0cHg7bGluZS1o
ZWlnaHQ6MS4zOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7dGV4dC1z
aXplLWFkanVzdDpub25lICFpbXBvcnRhbnQ7Ij4KICAgICAgICAgICAgICAgIDx0Ym9keSBzdHls
ZT0iZm9udC1mYW1pbHk6ICdQaW5nRmFuZyBTQycsICdIaXJhZ2lubyBTYW5zIEdCJywnV2VuUXVh
bllpIE1pY3JvIEhlaScsICdNaWNyb3NvZnQgWWFoZWknLCAnzqLI7dHFutonLCB2ZXJkYW5hICFp
bXBvcnRhbnQ7IHdvcmQtd3JhcDpicmVhay13b3JkOyB3b3JkLWJyZWFrOmJyZWFrLWFsbDstd2Vi
a2l0LXRleHQtc2l6ZS1hZGp1c3Q6bm9uZSAhaW1wb3J0YW50O3RleHQtc2l6ZS1hZGp1c3Q6bm9u
ZSAhaW1wb3J0YW50OyI+CiAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPHRkIHdpZHRoPSIzOCIgc3R5bGU9InBhZGRpbmc6MDsgYm94LXNpemluZzog
Ym9yZGVyLWJveDsgd2lkdGg6IDM4cHg7Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8aW1nIHdpZHRoPSIzOCIgaGVpZ2h0PSIzOCIgc3R5bGU9InZlcnRpY2FsLWFsaWduOm1pZGRs
ZTsgd2lkdGg6IDM4cHg7IGhlaWdodDogMzhweDsgYm9yZGVyLXJhZGl1czo1MCU7IiBzcmM9Imh0
dHBzOi8vbWFpbC1vbmxpbmUubm9zZG4uMTI3Lm5ldC9xaXllbG9nby9kZWZhdWx0QXZhdGFyLnBu
ZyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPHRkIHN0eWxlPSJwYWRkaW5nOiAwIDAgMCAxMHB4OyBjb2xvcjogIzMxMzUzYjsi
PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTog
MTZweDtmb250LXdlaWdodDpib2xkOyB3aWR0aDoxMDAlOyB3aGl0ZS1zcGFjZTogbm93cmFwOyBv
dmVyZmxvdzpoaWRkZW47dGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7Ij7S87asPC9kaXY+CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAg
ICAgICAgICAgICAgICAgICAgICAgIDx0ciB3aWR0aD0iMTAwJSIgc3R5bGU9ImZvbnQtc2l6ZTog
MTRweCAhaW1wb3J0YW50OyB3aWR0aDogMTAwJTsiPgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPHRkIGNvbHNwYW49IjIiIHN0eWxlPSJwYWRkaW5nOjEwcHggMCAwIDA7IGZvbnQtc2l6ZTox
NHB4ICFpbXBvcnRhbnQ7IHdpZHRoOiAxMDAlOyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxkaXYgc3R5bGU9IndpZHRoOiAxMDAlO2ZvbnQtc2l6ZTogMTRweCAhaW1wb3J0
YW50O3dvcmQtd3JhcDpicmVhay13b3JkO3dvcmQtYnJlYWs6YnJlYWstYWxsOyI+08rP5KO6eWlu
ZG9uZ2Jlc3RAMTI2LmNvbTwvZGl2PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90ZD4K
ICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgIDwvdGJvZHk+CiAg
ICAgICAgICAgIDwvdGFibGU+CiAgICAgICAgPC9hPjxodG1sPjxib2R5PjxwIHN0eWxlPSJib3Jk
ZXItdG9wOjFweCBzb2xpZCAjZTVlNWU1O3BhZGRpbmctdG9wOiA4cHg7IGZvbnQtc2l6ZTogMTJw
eDsgY29sb3I6I2I2YjhiYjtsaW5lLWhlaWdodDogMS44MzM7Ij7HqcP708kgPGEgaHJlZj0iaHR0
cHM6Ly9tYWlsLjE2My5jb20vZGFzaGkvZGxwcm8uaHRtbD9mcm9tPW1haWw4OCIgc3R5bGU9ImNv
bG9yOiM2YWE4ZjY7dGV4dC1kZWNvcmF0aW9uOiBub25lIj7N+NLX08rP5LTzyqY8L2E+ILao1sY8
L3A+PC9ib2R5PjwvaHRtbD48L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+
------=_Part_8407_2105771468.1625535578485--


