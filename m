Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1517A49A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 12:52:15 +0100 (CET)
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9p2z-0006UD-Qc
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 06:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j9p1s-0005uZ-9C
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 06:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j9p1q-0008OD-Le
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 06:51:03 -0500
Resent-Date: Thu, 05 Mar 2020 06:51:03 -0500
Resent-Message-Id: <E1j9p1q-0008OD-Le@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j9p1q-0008Id-E8; Thu, 05 Mar 2020 06:51:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1583409043; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FZo36Klv87yBwocJ1jjU4MnFIBhIUiOXayEDEd6nX9frLr2USAjw9k2fAv+qXFUK/we4hSpLUNNlzqbUJVXefQFy10laWsejM2q5jmYoZql+O0BQrTEVcwtJWe5q/ESpgl9VrThwo+iSeWQnyhpuPhp4q9m9n7Kh8Dzs9P1J36w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583409043;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ObuItj0yVyl7r+k1sW1+9JRYY6PxUTnKFj0mFzn1Isg=; 
 b=cNFAX/3RY4qJsC9ZnQnOor7vu5dD447KaOjGyi/6uZGj8sGKW2TTDwvBvbZbruii/coYeAbr3lszDj+lgHNrD2IQ02QceBNRFfTYzlbKc8MBk3d46C5duw+1vQPvCIueX9fXGHQ+eDBgbiPwgFTXPgI8Guq9ZEHOAXQlJ7PNpu8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583409040195125.2156715996407;
 Thu, 5 Mar 2020 03:50:40 -0800 (PST)
In-Reply-To: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Message-ID: <158340903834.357.4597260091882685075@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kuhn.chenqun@huawei.com
Date: Thu, 5 Mar 2020 03:50:40 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, jasowang@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, euler.robot@huawei.com,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMwNTEwNTMyNS4zMTI2
NC0xLWt1aG4uY2hlbnF1bkBodWF3ZWkuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgZG9ja2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBW
PTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5W
PTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnc2xp
cnAnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvbGlic2xpcnAuZ2l0KSByZWdpc3RlcmVkIGZv
ciBwYXRoICdzbGlycCcKQ2xvbmluZyBpbnRvICdzbGlycCcuLi4KcmVtb3RlOiBDb3VudGluZyBv
YmplY3RzOiAzMDk1LCBkb25lLiAgICAgICAgCmVycm9yOiBSUEMgZmFpbGVkOyByZXN1bHQ9MTgs
IEhUVFAgY29kZSA9IDIwMApmYXRhbDogVGhlIHJlbW90ZSBlbmQgaHVuZyB1cCB1bmV4cGVjdGVk
bHkKZmF0YWw6IHByb3RvY29sIGVycm9yOiBiYWQgcGFjayBoZWFkZXIKQ2xvbmUgb2YgJ2h0dHBz
Oi8vZ2l0LnFlbXUub3JnL2dpdC9saWJzbGlycC5naXQnIGludG8gc3VibW9kdWxlIHBhdGggJ3Ns
aXJwJyBmYWlsZWQKZmFpbGVkIHRvIHVwZGF0ZSBzdWJtb2R1bGUgc2xpcnAKQ2xlYXJlZCBkaXJl
Y3RvcnkgJ2R0YycKU3VibW9kdWxlICdkdGMnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvZHRj
LmdpdCkgdW5yZWdpc3RlcmVkIGZvciBwYXRoICdkdGMnClN1Ym1vZHVsZSAnc2xpcnAnIChodHRw
czovL2dpdC5xZW11Lm9yZy9naXQvbGlic2xpcnAuZ2l0KSB1bnJlZ2lzdGVyZWQgZm9yIHBhdGgg
J3NsaXJwJwptYWtlWzFdOiAqKiogWy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC12bWRwaXFl
Zi9zcmMvZG9ja2VyLXNyYy4yMDIwLTAzLTA1LTA2LjQxLjAyLjE0NTY5XSBFcnJvciAxCm1ha2Vb
MV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtdm1kcGlx
ZWYvc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVzdC1xdWlja0BjZW50b3M3XSBFcnJvciAy
CgpyZWFsICAgIDltMzYuNjMwcwp1c2VyICAgIDBtNC4xMTdzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDMwNTEwNTMyNS4zMTI2NC0x
LWt1aG4uY2hlbnF1bkBodWF3ZWkuY29tL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

