Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30834E5DCC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 05:16:15 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXEtS-0002cg-KA
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 00:16:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1nXErZ-0001uL-C2
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 00:14:17 -0400
Received: from m1346.mail.163.com ([220.181.13.46]:5823)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1nXErP-0003Xs-Gs
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 00:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=P5LiF
 3CDAwcutgLtonRmdYksbgzrPmogsxt/tjTDsUA=; b=lk0z8stYjKlLrfw3pjLqT
 EeGZBH0+juAQ7kAE+ofMDPZcfSubbZzYfVOMyGf5thcs/JrjxcvfmRLS0hufd90n
 3WB8YOpbIoatvSPTH9iOdnCYnOnV1QxAX0ZXeL5fOcH/+bjbvPCnRKCDhcU9pi9S
 U2XyBskDOJQTlktjn4oAMI=
Received: from leohou163$163.com ( [114.249.224.138] ) by
 ajax-webmail-wmsvr46 (Coremail) ; Thu, 24 Mar 2022 11:58:28 +0800 (CST)
X-Originating-IP: [114.249.224.138]
Date: Thu, 24 Mar 2022 11:58:28 +0800 (CST)
From: leohou <leohou163@163.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Address mapping for vIOMMU
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
X-CM-CTRLDATA: Qz8U5WZvb3Rlcl9odG09MTYzNzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_36697_1111223167.1648094308784"
MIME-Version: 1.0
Message-ID: <155d85bb.2709.17fba1369b0.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LsGowADnm+xl7DtiOukNAA--.62098W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/xtbBOQTNPl-PMC4YnQAAsF
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.46; envelope-from=leohou163@163.com;
 helo=m1346.mail.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

------=_Part_36697_1111223167.1648094308784
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGkgYWxsLApXaGVuIEkgdXNlIERQREsgaW4gZ3Vlc3RPUyAgYW5kICBjb25maWdlcmluZyB0aGUg
Vk0gd2l0aCB2SU9NTVUsIEkgZm91bmQgdGhhdCAgc2VuZGluZyB0aGUgZ1ZBIHRvIHRoZSBoYXJk
d2FyZSBkZXZpY2UgLCB0aGUgaGFyZHdhcmUgZGV2aWNlIGNhbid0ICBmaW5kIHRoZSByZWFsIGRh
dGEuCkJ1dCBzZW5kaW5nIHRoZSBnUEEgdG8gdGhlIGhhcmR3YXJlIGRldmljZSwgdGhlIGhhcmR3
YXJlIGRldmljZSBjYW4gIGZpbmQgdGhlIHJlYWwgZGF0YS4KCgpFbnZpcm9ubWVudDoKT1M6IExp
bnV4IHZlcnNpb24gNS40LjAtMTA0LWdlbmVyaWMgKGJ1aWxkZEB1YnVudHUpIChnY2MgdmVyc2lv
biA5LjMuMCAoVWJ1bnR1IDkuMy4wLTE3dWJ1bnR1MX4yMC4wNCkpICMxMTgtVWJ1bnR1IFNNUCBX
ZWQgTWFyIDIgMTk6MDI6NDEgVVRDIDIwMjIKUUVNVTogUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDQu
Mi4xIChEZWJpYW4gMTo0LjItM3VidW50dTYuMjEpCkRldmljZTogdmlydGlvLW5ldAoKCgpRdWVz
dGlvbjoKClRoZSB2SU9NTVUgZG9lc24ndCB3b3JrPyAKCkkga25vdyB2aXJ0aW8tbmV0IGRvZXMg
bm90IGhhdmUgRE1BLCBzbyB3aGVuIHZpcnRpby1uZXQgYW5kIERQREsgYXJlIGNvbWJpbmVkLCBJ
T01NVSBpcyBub3QgbmVlZGVkPwo=
------=_Part_36697_1111223167.1648094308784
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+aGkgYWxsLDwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjowOyI+V2hlbiBJIHVzZSBEUERLIGluIGd1ZXN0T1MmbmJzcDsgYW5k
Jm5ic3A7IGNvbmZpZ2VyaW5nIHRoZSBWTSB3aXRoIHZJT01NVSwgSSBmb3VuZCB0aGF0Jm5ic3A7
IHNlbmRpbmcgdGhlIGdWQSB0byB0aGUgaGFyZHdhcmUgZGV2aWNlICwgdGhlIGhhcmR3YXJlIGRl
dmljZSBjYW4ndCZuYnNwOyBmaW5kIHRoZSByZWFsIGRhdGEuPC9kaXY+PGRpdiBzdHlsZT0ibWFy
Z2luOjA7Ij5CdXQgIHNlbmRpbmcgdGhlIGdQQSB0byB0aGUgaGFyZHdhcmUgZGV2aWNlLCB0aGUg
aGFyZHdhcmUgZGV2aWNlIGNhbiZuYnNwOyBmaW5kIHRoZSByZWFsIGRhdGEuPC9kaXY+PGRpdiBz
dHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5FbnZpcm9u
bWVudDo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPk9TOiBMaW51eCB2ZXJzaW9uIDUuNC4w
LTEwNC1nZW5lcmljIChidWlsZGRAdWJ1bnR1KSAoZ2NjIHZlcnNpb24gOS4zLjAgKFVidW50dSA5
LjMuMC0xN3VidW50dTF+MjAuMDQpKSAjMTE4LVVidW50dSBTTVAgV2VkIE1hciAyIDE5OjAyOjQx
IFVUQyAyMDIyPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5RRU1VOiBRRU1VIGVtdWxhdG9y
IHZlcnNpb24gNC4yLjEgKERlYmlhbiAxOjQuMi0zdWJ1bnR1Ni4yMSk8L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPkRldmljZTogdmlydGlvLW5ldDxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJn
aW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPlF1ZXN0aW9uOiA8YnI+PC9k
aXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5UaGUgdklPTU1VIGRvZXNuJ3Qgd29yaz8mbmJzcDsg
PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+SSBrbm93IHZpcnRpby1uZXQgZG9lcyBu
b3QgaGF2ZSBETUEsIHNvIHdoZW4gdmlydGlvLW5ldCBhbmQgRFBESyBhcmUgY29tYmluZWQsIElP
TU1VIGlzIG5vdCBuZWVkZWQ/PGJyPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDUxLCA1MSwgNTEp
OyBmb250LWZhbWlseTogdGFob21hLCAnTWljcm9zb2Z0IFlhSGVpJywgzqLI7dHFutosIMvOzOUs
ICdNYWxndW4gR290aGljJywgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMy42MDAwMDEzMzUxNDQw
NDNweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQ6IG5vcm1hbDsgZm9udC13ZWln
aHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgbGluZS1oZWlnaHQ6IDI1Ljk4NzUw
MzA1MTc1NzgxM3B4OyBvcnBoYW5zOiBhdXRvOyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB0ZXh0LWlu
ZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lk
b3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDog
MHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ3LCAyNDgsIDI1MCk7IGRpc3BsYXk6IGlubGlu
ZSAhaW1wb3J0YW50OyBmbG9hdDogbm9uZTsiPjwvc3Bhbj48L2Rpdj48L2Rpdj48YnI+PGJyPjxz
cGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_36697_1111223167.1648094308784--


