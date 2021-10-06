Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D442421F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:03:24 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9O7-0003w4-5O
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mY99E-0007yo-W1
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:48:01 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:26526)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mY99A-0001oQ-LT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1633535276; x=1665071276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kK55BTGlnO5r+0tTOJB1JI6pvd84uIcQRKa1pgFifHk=;
 b=ibmaJK25Znvejv2vCO048+vn4TbkSUMLs/LeY7vHF3JqgkeookncY32g
 WYJs3ixmYorN1BONU7S+Qrofa61XjbzKNbmP60z2HAIujV+wm4WhxWA/r
 1gh21Eb3n8JNb+qKoGNif9UgqLY3p3V1eK/rAKyFdr3pX/NWbW4c6+xXP A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Oct 2021 08:47:54 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 06 Oct 2021 08:47:53 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 4C76C1107; Wed,  6 Oct 2021 10:47:53 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Hexagon (target/hexagon) update
Date: Wed,  6 Oct 2021 10:47:48 -0500
Message-Id: <1633535271-17986-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlM2FjYzJjMTk2MWNiZTIyY2E0NzRj
ZDVkYTQxNjNiN2JiZjdjZWEzOgoKICB0ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXM6IEJ1bXAgZmVk
b3JhLWkzODYtY3Jvc3MgdG8gZmVkb3JhIDM0ICgyMDIxLTEwLTA1IDE2OjQwOjM5IC0wNzAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHVi
LmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhleC0yMDIxMTAwNgoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDIzODAzYmJlNTI0YzM0ZDU3MjU1MDhmMTY5YTBhMjNmNjUyZTY1ODQ6Cgog
IHRhcmdldC9oZXhhZ29uOiBVc2UgdGNnX2NvbnN0YW50XyogKDIwMjEtMTAtMDYgMTA6Mjk6NTYg
LTA1MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNoYW5nZSBmcm9tIFBoaWxpcHBlIC0gVXNlIHRjZ19jb25zdGFudF8q
CkNoYW5nZSBmcm9tIFBoaWxpcHBlIC0gUmVtb3ZlIHVudXNlZCBUQ0cgdGVtcApDaGFuZ2UgZnJv
bSBUYXlsb3IgLSBQcm9iZSB0aGUgc3RvcmVzIGluIGEgcGFja2V0IGF0IHN0YXJ0IG9mIGNvbW1p
dAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoMik6CiAgICAgIHRhcmdldC9oZXhh
Z29uOiBSZW1vdmUgdW51c2VkIFRDRyB0ZW1wb3JhcnkgZnJvbSBwcmVkaWNhdGVkIGxvYWRzCiAg
ICAgIHRhcmdldC9oZXhhZ29uOiBVc2UgdGNnX2NvbnN0YW50XyoKClRheWxvciBTaW1wc29uICgx
KToKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHByb2JlIHRoZSBzdG9yZXMgaW4gYSBw
YWNrZXQgYXQgc3RhcnQgb2YgY29tbWl0CgogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAg
ICAgIHwgICA2ICstLQogdGFyZ2V0L2hleGFnb24vaGVscGVyLmggICAgICAgICAgIHwgICAyICsK
IHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICB8ICAgNSArLQogdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMgICAgICAgICAgIHwgIDM5ICsrKysrLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdv
bi9vcF9oZWxwZXIuYyAgICAgICAgfCAgMTYgKysrKysrCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuYyAgICAgICAgfCAgNjQgKysrKysrKysrKysrKysrLS0tLS0tLS0KIHRlc3RzL3RjZy9oZXhh
Z29uL2hleF9zaWdzZWd2LmMgICB8IDEwNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgIHwgICA0ICstCiB0ZXN0
cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgfCAgIDEgKwogOSBmaWxlcyBjaGFuZ2VkLCAx
ODUgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVz
dHMvdGNnL2hleGFnb24vaGV4X3NpZ3NlZ3YuYwo=

