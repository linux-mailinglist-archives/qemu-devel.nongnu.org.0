Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401C5B6B37
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:55:37 +0200 (CEST)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2df-0001Dt-HS
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1oY2ZU-0006mq-4J
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:51:14 -0400
Received: from m13193.mail.163.com ([220.181.13.193]:61000)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1oY2ZO-0007wY-4b
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=xfMpW
 lM19fLg5DZCChZzeBaWAR0AoCwmZww6zQTqqWQ=; b=l1VEL0G9SleSi5srwHR3r
 wQFmxOOfdywlyYk/sNIMEpYe7pvRqMpe2+10UcQYBNpQXVCnLTn3o0t2dKQvTHxY
 u/jP5DBQXrJbouDLwBDYuRmjpdzDIzyK7fhaigtYvdzvaMGZ0m03OP1c19Df/ZB7
 GahsS9jiH2tg6OXG8wMFl0=
Received: from leohou163$163.com ( [221.221.157.100] ) by
 ajax-webmail-wmsvr193 (Coremail) ; Tue, 13 Sep 2022 17:35:50 +0800
 (GMT+08:00)
X-Originating-IP: [221.221.157.100]
Date: Tue, 13 Sep 2022 17:35:50 +0800 (GMT+08:00)
From: leohou <leohou163@163.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: suport sr-iov to virtio-net
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 MailMasterPC/4.17.3.1009_(Win10_21H1) Copyright (c) 2002-2022
 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_62641_966827958.1663061750240"
MIME-Version: 1.0
Message-ID: <4e7380df.52cf.183363471e0.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: wcGowAAHF3v2TiBjEMBPAA--.63300W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/1tbiFRl7Pl5mMjIeUgABs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.193; envelope-from=leohou163@163.com;
 helo=m13193.mail.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

------=_Part_62641_966827958.1663061750240
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

aGkgYWxsLAogICAgICAgIEkgd2FudCB0byBzdXBwb3J0IHNyLWlvdiB0byB2aXJ0aW8tbmV0LCBI
b3cgYWJvdXQgdGhpcyBmZWF0dXJlPwoK
------=_Part_62641_966827958.1663061750240
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8c3R5bGU+CiAgICBm
b250ewogICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7CiAgICB9CiAgICB1bCxvbHsKICAgICAgICBw
YWRkaW5nLWxlZnQ6IDIwcHg7CiAgICAgICAgbGlzdC1zdHlsZS1wb3NpdGlvbjogaW5zaWRlOwog
ICAgfQo8L3N0eWxlPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsVmVyZGFu
YSwmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssU2ltU3VuLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHg7IGxpbmUtaGVpZ2h0OjEuNjsiPgogICAgPGRpdj48ZGl2PgogICAgPGRpdj4KICAgICAg
ICA8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogJ01pY3Jvc29mdCBZYUhlaSBVSScsIFRhaG9tYTsg
Zm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBvcnBoYW5zOiAyOyB3aWRvd3M6IDI7IGJh
Y2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmhpIGFsbCw8L2Rpdj48ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogJ01pY3Jvc29mdCBZYUhlaSBVSScsIFRhaG9tYTsgZm9udC12YXJp
YW50LWxpZ2F0dXJlczogbm9ybWFsOyBvcnBoYW5zOiAyOyB3aWRvd3M6IDI7IGJhY2tncm91bmQt
Y29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyBJIHdhbnQgdG8gc3VwcG9ydCBzci1pb3YgdG8gdmlydGlvLW5ldCwgSG93
IGFib3V0IHRoaXMgZmVhdHVyZT88L2Rpdj48c3Bhbj4KICAgICAgICAgICAgCiAgICAgICAgPC9z
cGFuPgogICAgPC9kaXY+CiAgICA8ZGl2PgogICAgICAgIDxzcGFuPgogICAgICAgICAgICA8YnI+
CiAgICAgICAgPC9zcGFuPgogICAgPC9kaXY+CiAgICA8ZGl2IGlkPSJudGVzLXBjbWFjLXNpZ25h
dHVyZSIgc3R5bGU9ImZvbnQtZmFtaWx5Oiflvq7ova/pm4Xpu5EnIj4KICAgICAgICAKICAgICAg
ICA8ZGl2IHN0eWxlPSJmb250LXNpemU6MTRweDsgcGFkZGluZzogMDsgIG1hcmdpbjowOyI+Cgog
ICAgICAgIDwvZGl2PgogICAgPC9kaXY+CjwvZGl2PjwvZGl2PjwhLS3wn5iALS0+CjwvZGl2Pgo8
L2JvZHk+CjwvaHRtbD4=
------=_Part_62641_966827958.1663061750240--


