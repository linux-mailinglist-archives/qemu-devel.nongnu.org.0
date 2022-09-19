Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108B5BC385
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:34:43 +0200 (CEST)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaBIf-00052i-Pu
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1oaBAU-0007J8-Mc
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:26:15 -0400
Received: from m13193.mail.163.com ([220.181.13.193]:32667)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1oaBAO-0000Nr-D5
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=2GNhj
 qn3xlxfpoQ2+pT5AJuKyy2QBf/TSG+OAH6Wqqg=; b=LqYUnAw9mAMhCvJIFuU6I
 bLRunz0rgNG7nUlK+KwClL4lkURQ6chBP5c8xrC8wakh65skDyhmOKuJPz66gfWw
 +T5qSJG+lzNhPinSb/y/T6BSSf2qU+d9nrhYuZCebfQEg0V/ZiDP0xqeF6aYDOsg
 Kx81t0lR54XTTsE/OO41Y4=
Received: from leohou163$163.com ( [114.249.224.138] ) by
 ajax-webmail-wmsvr193 (Coremail) ; Mon, 19 Sep 2022 15:25:45 +0800
 (GMT+08:00)
X-Originating-IP: [114.249.224.138]
Date: Mon, 19 Sep 2022 15:25:45 +0800 (GMT+08:00)
From: leohou <leohou163@163.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: suport sr-iov to virtio-net
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 MailMasterPC/4.17.5.1008_(Win10_21H1) Copyright (c) 2002-2022
 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_45883_680555459.1663572345595"
MIME-Version: 1.0
Message-ID: <29d09a8.3cb1.18354a382fb.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: wcGowABXX3t5GShju1BTAA--.38796W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.193; envelope-from=leohou163@163.com;
 helo=m13193.mail.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_45883_680555459.1663572345595
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

aGkgYWxsLAogICAgICAgIEkgd2FudCB0byBzdXBwb3J0IHNyLWlvdiB0byB2aXJ0aW8tbmV0LCBI
b3cgYWJvdXQgdGhpcyBmZWF0dXJlPwoK
------=_Part_45883_680555459.1663572345595
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8c3R5bGU+CiAgICBm
b250ewogICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7CiAgICB9CiAgICB1bCxvbHsKICAgICAgICBw
YWRkaW5nLWxlZnQ6IDIwcHg7CiAgICAgICAgbGlzdC1zdHlsZS1wb3NpdGlvbjogaW5zaWRlOwog
ICAgfQo8L3N0eWxlPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsVmVyZGFu
YSwmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssU2ltU3VuLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHg7IGxpbmUtaGVpZ2h0OjEuNjsiPgogICAgPGRpdj48L2Rpdj4KPHN0eWxlPgogICAgZm9u
dHsKICAgICAgICBsaW5lLWhlaWdodDogMS42OwogICAgfQogICAgdWwsb2x7CiAgICAgICAgcGFk
ZGluZy1sZWZ0OiAyMHB4OwogICAgICAgIGxpc3Qtc3R5bGUtcG9zaXRpb246IGluc2lkZTsKICAg
IH0KPC9zdHlsZT4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk65b6u6L2v6ZuF6buRLFZlcmRhbmEs
JnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5zLXNlcmlmO2ZvbnQtc2l6ZTox
NHB4OyBsaW5lLWhlaWdodDoxLjY7Ij4KICAgIDxkaXY+PGRpdj4KICAgIDxkaXY+CiAgICAgICAg
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICdNaWNyb3NvZnQgWWFIZWkgVUknLCBUYWhvbWE7IGZv
bnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgb3JwaGFuczogMjsgd2lkb3dzOiAyOyBiYWNr
Z3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5oaSBhbGwsPC9kaXY+PGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6ICdNaWNyb3NvZnQgWWFIZWkgVUknLCBUYWhvbWE7IGZvbnQtdmFyaWFu
dC1saWdhdHVyZXM6IG5vcm1hbDsgb3JwaGFuczogMjsgd2lkb3dzOiAyOyBiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgSSB3YW50IHRvIHN1cHBvcnQgc3ItaW92IHRvIHZpcnRpby1uZXQsIEhvdyBh
Ym91dCB0aGlzIGZlYXR1cmU/PC9kaXY+PHNwYW4+CiAgICAgICAgICAgIAogICAgICAgIDwvc3Bh
bj4KICAgIDwvZGl2PgogICAgPGRpdj4KICAgICAgICA8c3Bhbj4KICAgICAgICAgICAgPGJyPgog
ICAgICAgIDwvc3Bhbj4KICAgIDwvZGl2PgogICAgPGRpdiBpZD0ibnRlcy1wY21hYy1zaWduYXR1
cmUiIHN0eWxlPSJmb250LWZhbWlseTon5b6u6L2v6ZuF6buRJyI+CiAgICAgICAgCiAgICAgICAg
PGRpdiBzdHlsZT0iZm9udC1zaXplOjE0cHg7IHBhZGRpbmc6IDA7ICBtYXJnaW46MDsiPgoKICAg
ICAgICA8L2Rpdj4KICAgIDwvZGl2Pgo8L2Rpdj48L2Rpdj4KPC9kaXY+PCEtLfCfmIAtLT4KPC9k
aXY+CjwvYm9keT4KPC9odG1sPg==
------=_Part_45883_680555459.1663572345595--


