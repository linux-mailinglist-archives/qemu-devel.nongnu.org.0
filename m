Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829B481BD0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 12:54:05 +0100 (CET)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2u0R-0007Ap-St
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 06:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kvmluck@163.com>) id 1n2tzI-0006M2-9A
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 06:52:52 -0500
Received: from m1337.mail.163.com ([220.181.13.37]:42500)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kvmluck@163.com>) id 1n2tzD-0000Xe-7f
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 06:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=pwwH2
 rRYKT/iZOoxI4rArDd4vq8QG+Lu+oYmJTNJydI=; b=jKQ3Ch7tfZywpmTHLFLk/
 6y5xrtSqx1Qj/DrSXrFEHMPYQcisEEaR97fAT7amTgKMPaF9aDAqTyOsN6srqU/l
 Zd/EUoWtJCDDhoEwqHyUx/RdnM1lDtOjHgvkFlOvHYWnLt6/BcLLzCz9F5h5MYT8
 nWxwMMNhUQ/M3BmjHRBKRw=
Received: from kvmluck$163.com ( [114.247.186.102] ) by ajax-webmail-wmsvr37
 (Coremail) ; Thu, 30 Dec 2021 19:52:37 +0800 (CST)
X-Originating-IP: [114.247.186.102]
Date: Thu, 30 Dec 2021 19:52:37 +0800 (CST)
From: yue <kvmluck@163.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: why tx_queue_size must be  256 for non-vhost-user tap nic
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: EI0Oa2Zvb3Rlcl9odG09NzExOjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_99328_268332727.1640865157493"
MIME-Version: 1.0
Message-ID: <6b6667f5.6a04.17e0b2f5176.Coremail.kvmluck@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: JcGowAD3_x+Fnc1hfAUPAA--.42985W
X-CM-SenderInfo: xnypz3lfn6il2tof0z/1tbiFBN5iVaD+rESywAAsw
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.37; envelope-from=kvmluck@163.com;
 helo=m1337.mail.163.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

------=_Part_99328_268332727.1640865157493
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIGFsbDoKCgogIEkgdHJpZWQgdG8gdGVzdCB0aGUgZWZmb3J0IG9mIG5pYyBxdWV1ZSdzIHJp
bmctc2l6ZSwgYnV0ICBuaWMnIHR4IHZyaW5nLXNpemUgaXMgYWx3YXlzIDI1Ni4gIGZpbmFsbHkg
aSBmb3VuZCAgdGhlIGNvZGUuICAgCmNvdWxkIHlvdSB0ZWxsIHdoeSA/CnRoYW5rcwotLS0tLQpu
LT5uZXRfY29uZi50eF9xdWV1ZV9zaXplID0gTUlOKHZpcnRpb19uZXRfbWF4X3R4X3F1ZXVlX3Np
emUobiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG4tPm5ldF9jb25mLnR4
X3F1ZXVlX3NpemUpOwpuLT5uZXRfY29uZi50eF9xdWV1ZV9zaXplIGlzIDI1NiBpZiBwZWVyLT5p
bmZvLT50eXBlICE9IE5FVF9DTElFTlRfRFJJVkVSX1ZIT1NUX1VTRVIu
------=_Part_99328_268332727.1640865157493
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGksIGFsbDo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PiZuYnNwOyBJIHRyaWVkIHRvIHRlc3QgdGhlIGVmZm9ydCBvZiBuaWMgcXVldWUncyByaW5nLXNp
emUsIGJ1dCAmbmJzcDtuaWMnIHR4IHZyaW5nLXNpemUgaXMgYWx3YXlzIDI1Ni4gJm5ic3A7Zmlu
YWxseSBpIGZvdW5kICZuYnNwO3RoZSBjb2RlLiAmbmJzcDsmbmJzcDs8L2Rpdj48ZGl2PmNvdWxk
IHlvdSB0ZWxsIHdoeSA/PC9kaXY+PGRpdj50aGFua3M8L2Rpdj48ZGl2Pi0tLS0tPC9kaXY+PGRp
dj48ZGl2Pm4tJmd0O25ldF9jb25mLnR4X3F1ZXVlX3NpemUgPSBNSU4odmlydGlvX25ldF9tYXhf
dHhfcXVldWVfc2l6ZShuKSw8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IG4tJmd0O25ldF9jb25mLnR4
X3F1ZXVlX3NpemUpOzwvZGl2PjwvZGl2PjxkaXY+bi0mZ3Q7bmV0X2NvbmYudHhfcXVldWVfc2l6
ZSBpcyAyNTYgaWYmbmJzcDtwZWVyLSZndDtpbmZvLSZndDt0eXBlICE9IE5FVF9DTElFTlRfRFJJ
VkVSX1ZIT1NUX1VTRVIuPC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZv
b3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_99328_268332727.1640865157493--


