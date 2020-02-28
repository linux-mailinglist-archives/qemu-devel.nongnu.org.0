Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FEF173D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:50:42 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7iqX-00034d-KT
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ika-0002kG-NN
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ikZ-0005Ve-A5
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:32 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j7ikZ-0005Uc-0m
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1582908271; x=1614444271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xnBk6e5UsXzjCTzORqBQjIiKdDeFASCybuwZ+FK0TNA=;
 b=KDrJoEqeOba/zROwHTur5oZUCeWLisnM0vKk+XYkEGfQp5EhECqwDNbq
 7NT/nlceynRdSs9DRBtAM4akxqan+hRiW2PSA8HJG+JsyEfbfRajs4jwI
 MDBeIJC2R5njm9qnvuSL0jmdgwsYAnTl4TKQy2/dHsHeREztQFBVP5vJD E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Feb 2020 08:44:27 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 28 Feb 2020 08:44:27 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 150141102; Fri, 28 Feb 2020 10:44:27 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/67] Hexagon ELF Machine Definition
Date: Fri, 28 Feb 2020 10:42:59 -0600
Message-Id: <1582908244-304-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
References: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.38
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

RGVmaW5lIEVNX0hFWEFHT04gMTY0CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+ClRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZWxmLmggfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9lbGYuaCBiL2luY2x1ZGUv
ZWxmLmgKaW5kZXggOGZiZmU2MC4uZDUxZTdkNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9lbGYuaAor
KysgYi9pbmNsdWRlL2VsZi5oCkBAIC0xNzAsNiArMTcwLDggQEAgdHlwZWRlZiBzdHJ1Y3QgbWlw
c19lbGZfYWJpZmxhZ3NfdjAgewogCiAjZGVmaW5lIEVNX1VOSUNPUkUzMiAgICAxMTAgICAgIC8q
IFVuaUNvcmUzMiAqLwogCisjZGVmaW5lIEVNX0hFWEFHT04gICAgIDE2NCAgICAgLyogUXVhbGNv
bW0gSGV4YWdvbiAqLworCiAjZGVmaW5lIEVNX1JJU0NWICAgICAgICAyNDMgICAgIC8qIFJJU0Mt
ViAqLwogCiAjZGVmaW5lIEVNX05BTk9NSVBTICAgICAyNDkgICAgIC8qIFdhdmUgQ29tcHV0aW5n
IG5hbm9NSVBTICovCi0tIAoyLjcuNAoK

