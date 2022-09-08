Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D05B1E3B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:12:19 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHKK-00026K-Lk
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duslabo1@protonmail.com>)
 id 1oWDCs-0000z7-Vn
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:48:19 -0400
Received: from mail-40137.protonmail.ch ([185.70.40.137]:48843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duslabo1@protonmail.com>)
 id 1oWDCq-0003v0-VW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:48:18 -0400
Date: Thu, 08 Sep 2022 08:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1662626892; x=1662886092;
 bh=8YMomrqpWt1KaeG7VDMrGC3mXfXc7BNrigupXYtz0H0=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=HlG6UDkBoYjWhr4jhnkN6Fv55wb25F+p2rFuMkWcDZugK7AByeTG/bd1ZjBe/vG8x
 EJqXJWln5tDE/n7ne6SGQQqL2WiHuRlDMeflBDrTwrmeiWvKRqmiXIRfb5wWjRNYTR
 gtTqZkWIx1s9pvZb7zgsL6S7YV93P7atfq+tbjh/SZiFIIKJN5aTbnM7Tn/ogWgbCC
 yPMvK+pG5pVXTkOpJtVBHxIH74iT1e0gDdlH3NuZnHefmbEvBPugDk/PgNmADP7b7z
 HtC5tF6BDqgzHCMH4NJ7JIMxOtQeN6sWKrUXF/7iZ91+2ZWg1c/y1VDySdqHsZ2qBW
 wkuJkwK8aCtVA==
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: duslabo <duslabo1@protonmail.com>
Subject: Access DomU shared memory in Dom0 Kernel
Message-ID: <UVWDpXSw_NIphj004Ubnz_w7N2rnfilo1-xqUbtoE_VVO8dNZKHL6wvDs-KQvoAdTg-HcHsMpP9UhAB_ZyeeFqWm-AI0uiV4L-Ljmx4i5WM=@protonmail.com>
Feedback-ID: 11769887:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_nbOgAFD9x03C4u1ewn64WUk99Va3GkPeVH8Z4SCA"
Received-SPF: pass client-ip=185.70.40.137;
 envelope-from=duslabo1@protonmail.com; helo=mail-40137.protonmail.ch
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:59:46 -0400
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
Reply-To: duslabo <duslabo1@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

--b1_nbOgAFD9x03C4u1ewn64WUk99Va3GkPeVH8Z4SCA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksCgpJIGFtIG1hcHBpbmcgRG9tVSBETUEgQWRkcmVzcyBpbiBRZW11IHNvdXJjZSB1c2luZyBk
bWFfbWVtb3J5X21hcCBBUEkuIEJ1dCBteSBEb20wJ3Mga2VybmVsIGlzIHVuYWJsZSB0byBhY2Nl
c3MgdGhlIFZBIGFzc2lnbmVkIHRvIGRtYV9tZW1vcnlfbWFwIEFQSSBpbiBRZW11LgoKQW55IFN1
Z2dlc3Rpb24/CgpTZW50IHdpdGggW1Byb3RvbiBNYWlsXShodHRwczovL3Byb3Rvbi5tZS8pIHNl
Y3VyZSBlbWFpbC4=

--b1_nbOgAFD9x03C4u1ewn64WUk99Va3GkPeVH8Z4SCA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij5IaSw8L2Rp
dj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPkkg
YW0gbWFwcGluZyBEb21VIERNQSBBZGRyZXNzIGluIFFlbXUgc291cmNlIHVzaW5nJm5ic3A7Jm5i
c3A7PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OnNlcmlmO2ZvbnQtc2l6ZToxNnB4O2JhY2tncm91
bmQtY29sb3I6cmdiKDI1MiwgMjUyLCAyNTIpO2Rpc3BsYXk6aW5saW5lICFpbXBvcnRhbnQiPmRt
YV9tZW1vcnlfbWFwIEFQSS4gQnV0IG15IERvbTAncyBrZXJuZWwgaXMgdW5hYmxlIHRvIGFjY2Vz
cyB0aGUgVkEgYXNzaWduZWQgdG8mbmJzcDs8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpy
Z2IoMjUyLCAyNTIsIDI1Mik7ZGlzcGxheTppbmxpbmUgIWltcG9ydGFudCI+ZG1hX21lbW9yeV9t
YXAgQVBJIGluIFFlbXUuJm5ic3A7PC9zcGFuPjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWls
eTpzZXJpZjtmb250LXNpemU6MTZweDtiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTIsIDI1MiwgMjUy
KTtkaXNwbGF5OmlubGluZSAhaW1wb3J0YW50Ij48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xv
cjpyZ2IoMjUyLCAyNTIsIDI1Mik7ZGlzcGxheTppbmxpbmUgIWltcG9ydGFudCI+PGJyPjwvc3Bh
bj48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6
IDE0cHg7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6c2VyaWY7Zm9udC1zaXplOjE2cHg7YmFj
a2dyb3VuZC1jb2xvcjpyZ2IoMjUyLCAyNTIsIDI1Mik7ZGlzcGxheTppbmxpbmUgIWltcG9ydGFu
dCI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKDI1MiwgMjUyLCAyNTIpO2Rpc3Bs
YXk6aW5saW5lICFpbXBvcnRhbnQiPkFueSBTdWdnZXN0aW9uPzwvc3Bhbj48L3NwYW4+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6c2VyaWY7Zm9udC1zaXplOjE2cHg7YmFja2dyb3VuZC1jb2xvcjpy
Z2IoMjUyLCAyNTIsIDI1Mik7ZGlzcGxheTppbmxpbmUgIWltcG9ydGFudCI+PHNwYW4gc3R5bGU9
ImJhY2tncm91bmQtY29sb3I6cmdiKDI1MiwgMjUyLCAyNTIpO2Rpc3BsYXk6aW5saW5lICFpbXBv
cnRhbnQiPjxicj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OnNlcmlmO2Zv
bnQtc2l6ZToxNnB4O2JhY2tncm91bmQtY29sb3I6cmdiKDI1MiwgMjUyLCAyNTIpO2Rpc3BsYXk6
aW5saW5lICFpbXBvcnRhbnQiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnJnYigyNTIs
IDI1MiwgMjUyKTtkaXNwbGF5OmlubGluZSAhaW1wb3J0YW50Ij48YnI+PC9zcGFuPjwvc3Bhbj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxi
cj48L2Rpdj4NCjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij4NCiAgICA8ZGl2IGNsYXNzPSJw
cm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIHByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2Nr
LWVtcHR5Ij4NCiAgICAgICAgDQogICAgICAgICAgICA8L2Rpdj4NCiAgICANCiAgICAgICAgICAg
IDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXByb3RvbiI+DQogICAgICAg
IFNlbnQgd2l0aCA8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0iaHR0cHM6Ly9wcm90b24ubWUvIiBy
ZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPlByb3RvbiBNYWlsPC9hPiBzZWN1cmUgZW1haWwuDQog
ICAgPC9kaXY+DQo8L2Rpdj4NCg==


--b1_nbOgAFD9x03C4u1ewn64WUk99Va3GkPeVH8Z4SCA--


