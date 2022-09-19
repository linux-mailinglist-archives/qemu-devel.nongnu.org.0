Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55185BC3B7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:51:35 +0200 (CEST)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaBZ0-0005FA-RC
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1oaBRH-0000pW-Eo
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:43:39 -0400
Received: from m13123.mail.163.com ([220.181.13.123]:6937)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1oaBRF-0003FG-Ae
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=32c7S
 nvtMksrvL7Wwdcqr9NXDgj/lPEq/ylAb/LwJR4=; b=iOXw61tJEonx0163GJqvS
 C5bnXVnqOyrfHB0J87ymkyuDqbMcxDE2jgT5+4w08MF8JekVlWkmVLEzO9ZYrf+E
 x1M3dZUOQwv8Q2I9KAo4U9iEQhhbQAc6ipdzO3XxMJMRbkgFgonmj58EWGJ9dFIS
 lhg9U06/rSLmh0wUnYk+bI=
Received: from leohou163$163.com ( [39.155.188.22] ) by
 ajax-webmail-wmsvr123 (Coremail) ; Mon, 19 Sep 2022 15:43:29 +0800 (CST)
X-Originating-IP: [39.155.188.22]
Date: Mon, 19 Sep 2022 15:43:29 +0800 (CST)
From: leohou <leohou163@163.com>
To: qemu-devel@nongnu.org
Subject: suport sr-iov to virtio-net
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_65661_463916530.1663573409615"
MIME-Version: 1.0
Message-ID: <20664370.45e2.18354b3bf4f.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: e8GowADHa3yhHShjCURhAA--.2119W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.123; envelope-from=leohou163@163.com;
 helo=m13123.mail.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

------=_Part_65661_463916530.1663573409615
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGkgYWxsLAogICAgICAgIEkgd2FudCB0byBzdXBwb3J0IHNyLWlvdiB0byB2aXJ0aW8tbmV0LCBI
b3cgYWJvdXQgdGhpcyBmZWF0dXJlPw==
------=_Part_65661_463916530.1663573409615
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9IndoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQt
YnJlYWs6IGJyZWFrLXdvcmQgIWltcG9ydGFudDsgY29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9u
dC1zaXplOiAxNHB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudDogbm9ybWFsOyBm
b250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBsaW5lLWhlaWdodDog
MjIuNHB4OyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zv
cm06IG5vbmU7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAw
cHg7IGZvbnQtZmFtaWx5OiAnTWljcm9zb2Z0IFlhSGVpIFVJJywgVGFob21hOyBmb250LXZhcmlh
bnQtbGlnYXR1cmVzOiBub3JtYWw7IG9ycGhhbnM6IDI7IHdpZG93czogMjsgYmFja2dyb3VuZC1j
b2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+aGkgYWxsLDwvZGl2PjxkaXYgc3R5bGU9IndoaXRl
LXNwYWNlOiBub3JtYWw7IHdvcmQtYnJlYWs6IGJyZWFrLXdvcmQgIWltcG9ydGFudDsgY29sb3I6
IHJnYig0OSwgNTMsIDU5KTsgZm9udC1zaXplOiAxNHB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZv
bnQtdmFyaWFudDogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzog
bm9ybWFsOyBsaW5lLWhlaWdodDogMjIuNHB4OyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRl
bnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0
LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IGZvbnQtZmFtaWx5OiAnTWljcm9zb2Z0IFlhSGVpIFVJ
JywgVGFob21hOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IG9ycGhhbnM6IDI7IHdp
ZG93czogMjsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEkgd2FudCB0byBzdXBwb3J0IHNyLWlv
diB0byB2aXJ0aW8tbmV0LCBIb3cgYWJvdXQgdGhpcyBmZWF0dXJlPzwvZGl2PjxwIHN0eWxlPSJt
YXJnaW46MDsiPjwvcD48L2Rpdj4=
------=_Part_65661_463916530.1663573409615--


