Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE36173E1A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 18:14:30 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7jDZ-0007kj-8T
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 12:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ikb-0002nH-Tz
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ikY-0005VN-V5
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:33 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j7ikY-0005U4-KC
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1582908270; x=1614444270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EpT/fY72vQZzvrRSVg37o9wPuWlpvCpVQuMiC95LhA=;
 b=XIMnVNvXOZV2QtWecnv0hHN9rHjdrmGYnJnSfT6FEnPX1K5AOrIdrWfW
 WCEewL4jXSU76uW66FyEjWXerpZ2cPWLNQQVhxS8ALf0KQgbtVwu87Kov
 FGRRrxiLfkfXgC+bOWqVcfXn2vs5du3qX0uX84Q3MNhFuf8UUZDuBHXwC k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2020 08:44:27 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 28 Feb 2020 08:44:27 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id E0EE6FCD; Fri, 28 Feb 2020 10:44:26 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/67] Hexagon Maintainers
Date: Fri, 28 Feb 2020 10:42:57 -0600
Message-Id: <1582908244-304-2-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
References: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
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
aWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAzNmQ5NGMxLi44NWZj
MGFlIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTcyLDYg
KzE3MiwxNCBAQCBGOiBpbmNsdWRlL2h3L2NyaXMvCiBGOiB0ZXN0cy90Y2cvY3Jpcy8KIEY6IGRp
c2FzL2NyaXMuYwogCitIZXhhZ29uIFRDRyBDUFVzCitNOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+CitTOiBTdXBwb3J0ZWQKK0Y6IHRhcmdldC9oZXhhZ29uLworRjogbGlu
dXgtdXNlci9oZXhhZ29uLworRjogZGlzYXMvaGV4YWdvbi5jCitGOiBkZWZhdWx0LWNvbmZpZ3Mv
aGV4YWdvbi1saW51eC11c2VyLm1haworCiBIUFBBIChQQS1SSVNDKSBUQ0cgQ1BVcwogTTogUmlj
aGFyZCBIZW5kZXJzb24gPHJ0aEB0d2lkZGxlLm5ldD4KIFM6IE1haW50YWluZWQKLS0gCjIuNy40
Cgo=

