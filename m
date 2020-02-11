Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2581586CE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 01:42:49 +0100 (CET)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1JdX-0002ic-Nq
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 19:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jbs-0000yM-Gw
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jbq-0004xj-S0
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:04 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j1Jbq-0004pJ-EZ
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1581381662; x=1612917662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jPbjPKKM6aQT8sUeZAF+pDxHyZRGLlckJmfZ32+kTS4=;
 b=i3qj+J8RtiyYpaMoce4bG6C1feaVH6r1mEfYSAdGWNFNSe4IAtmTCdgr
 oEcJJiJf26qkEejlShEU+gFA9IcCUa9XXUykOFqrkdvVvGw9fS+KvUFP9
 9W4A2LwHOBL8T0mNSAY0JAQKa65CSRG95Pdz7kFnYovIHA6ThhengTzP5 M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2020 16:40:58 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 10 Feb 2020 16:40:57 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0AAF11B42; Mon, 10 Feb 2020 18:40:57 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/66] Hexagon Maintainers
Date: Mon, 10 Feb 2020 18:39:39 -0600
Message-Id: <1581381644-13678-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
References: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIFRheWxvciBTaW1wc29uIGFzIHRoZSBIZXhhZ29uIHRhcmdldCBtYWludGFpbmVyCgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogTUFJ
TlRBSU5FUlMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBlNzJiNWU1Li5mNDhj
NTY0IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTcyLDYg
KzE3MiwxNCBAQCBGOiBpbmNsdWRlL2h3L2NyaXMvCiBGOiB0ZXN0cy90Y2cvY3Jpcy8KIEY6IGRp
c2FzL2NyaXMuYwogCitIZXhhZ29uIFRDRyBDUFVzCitNOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+CitTOiBTdXBwb3J0ZWQKK0Y6IHRhcmdldC9oZXhhZ29uLworRjogbGlu
dXgtdXNlci9oZXhhZ29uLworRjogZGlzYXMvaGV4YWdvbi5jCitGOiBkZWZhdWx0LWNvbmZpZ3Mv
aGV4YWdvbi1saW51eC11c2VyLm1haworCiBIUFBBIChQQS1SSVNDKSBUQ0cgQ1BVcwogTTogUmlj
aGFyZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxlLm5ldD4KIFM6IE1haW50YWluZWQKLS0gCjIuNy40
Cgo=

