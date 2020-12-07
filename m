Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C642D13CE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:33:49 +0100 (CET)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHaF-0003t4-Ur
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blackbeard334@protonmail.com>)
 id 1kmCJT-0001ro-Ak
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:56:08 -0500
Received: from mail-40135.protonmail.ch ([185.70.40.135]:33863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blackbeard334@protonmail.com>)
 id 1kmCJN-0007Ag-MR
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:56:06 -0500
Date: Mon, 07 Dec 2020 08:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1607331354;
 bh=jHEWUu/MbNA4KqKjpJ2LRa4ElZgNbobkCfVnxxEn0B8=;
 h=Date:To:From:Reply-To:Subject:From;
 b=ssvkP+4n9K46ojBxyeGPAofglJ232nNoZBg5Nk5FeQ3VMnaRXxJ6HUiy8Wa0zD++S
 l1Tv17aI25EoBc6k+YkXaKyi/KptMSepSPo/gQZ4ptABof3T0PYwEXKUfXl8ldAV2v
 e9VAkZ7/GbwrMDQGr29tZmfbREoTQL5FwCD0nyhM=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Mahmoud Abdelghany <blackbeard334@protonmail.com>
Subject: [FOSDEM21][CFP] Emulator Development Room
Message-ID: <6LjJh1pvaqybpKm9iq1GJ-UcnFj4mhM_rOMxnqV5x4pM0twcNVVpXRR9pkuj_MpqxD76_3LyVixDnan00p5IXVT_7pg0nvQYVirlErjTTuk=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_SJJaeQEPaCOJGbOTFWXuZE9tfdBVmlbyBK28rzhK6Q"
Received-SPF: pass client-ip=185.70.40.135;
 envelope-from=blackbeard334@protonmail.com; helo=mail-40135.protonmail.ch
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Dec 2020 09:32:40 -0500
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
Reply-To: Mahmoud Abdelghany <blackbeard334@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

--b1_SJJaeQEPaCOJGbOTFWXuZE9tfdBVmlbyBK28rzhK6Q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGV5LAoKU28gd2UncmUgaG9zdGluZyBhbiBlbXVsYXRvciBkZXZyb29tIGF0IGZvc2RlbTIxKG9u
bGluZSBlZGl0aW9uKSwgYW5kIHdvdWxkIHJlYWxseSBsb3ZlIGl0IGlmIEFMTCBvZiB5b3Ugc3Vi
bWl0dGVkIHRhbGtzIDopCgpXZWxsLCBvbmx5IGhhbGYgam9raW5nLCBidXQgaGF2aW5nIGEgUUVN
VSB0YWxrIHdvdWxkIGJlIGFtYXppbmcuCgpTbyBmZWVsIGZyZWUgdG8gc3VibWl0IGFuZC9vciBz
cHJlYWQgdGhlIHdvcmQuCmh0dHBzOi8vZ2l0aHViLmNvbS9ibGFja2JlYXJkMzM0L2Zvc2RlbTIx
LWVtdWxhdG9yLWRldnJvb20tY2ZwCgpSZWdhcmRzLAoKTWFobW91ZCBBYmRlbGdoYW55IC0gb24g
YmVoYWxmIG9mIHRoZSBlbXUtZGV2cm9vbQoKU2VudCB3aXRoIFtQcm90b25NYWlsXShodHRwczov
L3Byb3Rvbm1haWwuY29tKSBTZWN1cmUgRW1haWwu

--b1_SJJaeQEPaCOJGbOTFWXuZE9tfdBVmlbyBK28rzhK6Q
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IZXksPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gd2UncmUgaG9zdGluZyBh
biBlbXVsYXRvciBkZXZyb29tIGF0IGZvc2RlbTIxKG9ubGluZSBlZGl0aW9uKSwgYW5kIHdvdWxk
IHJlYWxseSBsb3ZlIGl0IGlmIEFMTCBvZiB5b3Ugc3VibWl0dGVkIHRhbGtzIDopPGJyPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2VsbCwgb25seSBoYWxmIGpva2luZywgYnV0IGhhdmluZyBh
IFFFTVUgdGFsayB3b3VsZCBiZSBhbWF6aW5nLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlNvIGZlZWwgZnJlZSB0byBzdWJtaXQgYW5kL29yIHNwcmVhZCB0aGUgd29yZC48YnI+PC9kaXY+
PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYmxhY2tiZWFyZDMzNC9mb3NkZW0yMS1l
bXVsYXRvci1kZXZyb29tLWNmcCI+aHR0cHM6Ly9naXRodWIuY29tL2JsYWNrYmVhcmQzMzQvZm9z
ZGVtMjEtZW11bGF0b3ItZGV2cm9vbS1jZnA8L2E+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+UmVnYXJkcyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5N
YWhtb3VkIEFiZGVsZ2hhbnkgLSBvbiBiZWhhbGYgb2YgdGhlIGVtdS1kZXZyb29tPGJyPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIj48
ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIHByb3Rvbm1haWxfc2ln
bmF0dXJlX2Jsb2NrLWVtcHR5Ij48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2stcHJvdG9uIj5TZW50IHdpdGggPGEgaHJlZj0iaHR0cHM6Ly9wcm90b25tYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlByb3Rvbk1haWw8L2E+IFNlY3VyZSBFbWFpbC48YnI+PC9k
aXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+


--b1_SJJaeQEPaCOJGbOTFWXuZE9tfdBVmlbyBK28rzhK6Q--


