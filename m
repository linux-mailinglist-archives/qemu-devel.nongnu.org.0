Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7861586E7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 01:49:12 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Jjj-00058B-UB
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 19:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jbu-0000yR-EL
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jbs-00056y-94
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:06 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j1Jbr-0004tJ-SO
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1581381663; x=1612917663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XvPDQ06QJAnE0LvuEKqjARcpYRacbb4M49NBEs3Qx5s=;
 b=jcOq5E4hF6kf+R1AdWpy3kwKO/q47Es5+j31gj64Rqy0o49sHewA3fUm
 0nfkLKZrnHuJVjJ5q1PkUIYwchgIdNMk6M3SzDF/WHjpzpWseg9n7ne+u
 5NVABj0eM1beXjZimdsy8ulVoSYnWvdIKZx+FJva0b9zU0K2yXLtn0n8t s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2020 16:41:00 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 10 Feb 2020 16:40:59 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 9DA2F1BB0; Mon, 10 Feb 2020 18:40:59 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/66] Hexagon generator phase 2 - qemu_wrap_generated.h
Date: Mon, 10 Feb 2020 18:40:00 -0600
Message-Id: <1581381644-13678-23-git-send-email-tsimpson@quicinc.com>
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

R2l2ZXMgYSBkZWZhdWx0IGRlZmluaXRpb24gb2YgZldSQVBfPHRhZz4gZm9yIGVhY2ggaW5zdHJ1
Y3Rpb24KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9kb19xZW11LnB5IHwgMTQgKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vZG9fcWVtdS5weSBiL3RhcmdldC9oZXhhZ29uL2RvX3FlbXUucHkKaW5kZXggOTkyZGJjMy4u
NDNhY2RkNyAxMDA3NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vZG9fcWVtdS5weQorKysgYi90YXJn
ZXQvaGV4YWdvbi9kb19xZW11LnB5CkBAIC03NzEsMyArNzcxLDE3IEBAIHJlYWxmLndyaXRlKGYu
Z2V0dmFsdWUoKSkKIHJlYWxmLmNsb3NlKCkKIGYuY2xvc2UoKQogCisjIworIyMgR2VuZXJhdGUg
dGhlIHFlbXVfd3JhcF9nZW5lcmF0ZWQuaCBmaWxlCisjIyAgICAgR2l2ZXMgYSBkZWZhdWx0IGRl
ZmluaXRpb24gb2YgZldSQVBfPHRhZz4gZm9yIGVhY2ggaW5zdHJ1Y3Rpb24KKyMjCitmID0gU3Ry
aW5nSU8oKQorZm9yIHRhZyBpbiB0YWdzOgorICAgIGYud3JpdGUoICIjaWZuZGVmIGZXUkFQXyVz
XG4iICUgdGFnICkKKyAgICBmLndyaXRlKCAiI2RlZmluZSBmV1JBUF8lcyhHRU5ITFBSLCBTSE9S
VENPREUpIEdFTkhMUFJcbiIgJSB0YWcgKQorICAgIGYud3JpdGUoICIjZW5kaWZcblxuIiApCity
ZWFsZiA9IG9wZW4oJ3FlbXVfd3JhcF9nZW5lcmF0ZWQuaCcsICd3dCcpCityZWFsZi53cml0ZShm
LmdldHZhbHVlKCkpCityZWFsZi5jbG9zZSgpCitmLmNsb3NlKCkKKwotLSAKMi43LjQKCg==

