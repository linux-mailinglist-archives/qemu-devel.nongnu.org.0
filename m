Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF01586DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 01:46:58 +0100 (CET)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1JhZ-0001s4-L4
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 19:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jc5-0001Fa-9l
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jc2-00060S-W0
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:17 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j1Jc2-0004tJ-HX
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1581381674; x=1612917674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7J02XIJDUNa61CDvaSOSBnTQmnONmNE19JbMqcSXgss=;
 b=KuJygL6WY8Hk/Ubbs8qmv/xZu6DG+OCmjCazzYjhzkTK2/12LRCo+lNQ
 DMkb5oQSIINIZeSHb9uHHsARvL8ZRl/Uy6nqfxuhebh6YJs7YDLsfI5ZB
 D9+45j7LhQkYnfFhKl0RFLq6PIttgOTYp5nC8kO3yhIn0z10OOkXKVvll A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2020 16:41:00 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 10 Feb 2020 16:40:59 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C1BCC1BBA; Mon, 10 Feb 2020 18:40:59 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/66] Hexagon generator phase 2 - op_attribs_generated.h
Date: Mon, 10 Feb 2020 18:40:02 -0600
Message-Id: <1581381644-13678-25-git-send-email-tsimpson@quicinc.com>
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

TGlzdHMgYWxsIHRoZSBhdHRyaWJ1dGVzIGFzc29jaWF0ZWQgd2l0aCBlYWNoIGluc3RydWN0aW9u
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vZG9fcWVtdS5weSB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZG9f
cWVtdS5weSBiL3RhcmdldC9oZXhhZ29uL2RvX3FlbXUucHkKaW5kZXggNTQzOTk2NC4uZjI5Nzkz
MSAxMDA3NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vZG9fcWVtdS5weQorKysgYi90YXJnZXQvaGV4
YWdvbi9kb19xZW11LnB5CkBAIC03OTcsMyArNzk3LDE2IEBAIHJlYWxmLndyaXRlKGYuZ2V0dmFs
dWUoKSkKIHJlYWxmLmNsb3NlKCkKIGYuY2xvc2UoKQogCisjIworIyMgR2VuZXJhdGUgdGhlIG9w
X2F0dHJpYnNfZ2VuZXJhdGVkLmggZmlsZQorIyMgICAgIExpc3RzIGFsbCB0aGUgYXR0cmlidXRl
cyBhc3NvY2lhdGVkIHdpdGggZWFjaCBpbnN0cnVjdGlvbgorIyMKK2YgPSBTdHJpbmdJTygpCitm
b3IgdGFnIGluIHRhZ3M6CisgICAgZi53cml0ZSgnT1BfQVRUUklCKCVzLEFUVFJJQlMoJXMpKVxu
JyAlIFwKKyAgICAgICAgKHRhZyxzdHJpbmcuam9pbihzb3J0ZWQoYXR0cmliZGljdFt0YWddKSwi
LCIpKSkKK3JlYWxmID0gb3Blbignb3BfYXR0cmlic19nZW5lcmF0ZWQuaCcsICd3dCcpCityZWFs
Zi53cml0ZShmLmdldHZhbHVlKCkpCityZWFsZi5jbG9zZSgpCitmLmNsb3NlKCkKKwotLSAKMi43
LjQKCg==

