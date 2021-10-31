Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FE440F90
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 17:52:47 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhE4c-0007HC-RC
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 12:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvm-0001YW-3F
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:61927)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvk-0008B2-Fr
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635698616; x=1667234616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITRDH6jVME6ePg7atny8ShXneIJSliVfuzvjirIwLtM=;
 b=b06G53qFJEuSqAzYgcgN1nWMhXgzg77efZvpDWaVRhLoDphhS5vlzA2x
 7UdEDx3+QHq3P2JuEW8BAYu8/j6e1EYr0rA6Yjjls8hqN1l/W3wETb/r8
 Lynqw1bAqemzNUgAv9UFpHOhEm7OChaZdjAaR2PXxHBxRRJUgSGcQwPqM I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6224B2B62; Sun, 31 Oct 2021 11:43:29 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] Hexagon HVX (target/hexagon) C preprocessor for decode
 tree
Date: Sun, 31 Oct 2021 11:42:48 -0500
Message-Id: <1635698589-31849-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

QWNrZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMgfCAxMyArKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydC5jIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVf
aW1wb3J0LmMKaW5kZXggNWI3ZWNmYy4uZWUzNTQ2NyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVf
aW1wb3J0LmMKQEAgLTQwLDYgKzQwLDExIEBAIGNvbnN0IGNoYXIgKiBjb25zdCBvcGNvZGVfbmFt
ZXNbXSA9IHsKICAqICAgICAgICAgUTZJTlNOKEEyX2FkZCwiUmQzMj1hZGQoUnMzMixSdDMyKSIs
QVRUUklCUygpLAogICogICAgICAgICAiQWRkIDMyLWJpdCByZWdpc3RlcnMiLAogICogICAgICAg
ICB7IFJkVj1Sc1YrUnRWO30pCisgKiAgICAgSFZYIGluc3RydWN0aW9ucyBoYXZlIHRoZSBmb2xs
b3dpbmcgZm9ybQorICogICAgICAgICBFWFRJTlNOKFY2X3ZpbnNlcnR3ciwgIlZ4MzIudz12aW5z
ZXJ0KFJ0MzIpIiwKKyAqICAgICAgICAgQVRUUklCUyhBX0VYVEVOU0lPTixBX0NWSSxBX0NWSV9W
WCxBX0NWSV9MQVRFKSwKKyAqICAgICAgICAgIkluc2VydCBXb3JkIFNjYWxhciBpbnRvIFZlY3Rv
ciIsCisgKiAgICAgICAgIFZ4Vi51d1swXSA9IFJ0VjspCiAgKi8KIGNvbnN0IGNoYXIgKiBjb25z
dCBvcGNvZGVfc3ludGF4W1hYX0xBU1RfT1BDT0RFXSA9IHsKICNkZWZpbmUgUTZJTlNOKFRBRywg
QkVILCBBVFRSSUJTLCBERVNDUiwgU0VNKSBcCkBAIC0xMDUsNiArMTEwLDE0IEBAIHN0YXRpYyBj
b25zdCBjaGFyICpnZXRfb3Bjb2RlX2VuYyhpbnQgb3Bjb2RlKQogCiBzdGF0aWMgY29uc3QgY2hh
ciAqZ2V0X29wY29kZV9lbmNfY2xhc3MoaW50IG9wY29kZSkKIHsKKyAgICBjb25zdCBjaGFyICp0
bXAgPSBvcGNvZGVfZW5jb2RpbmdzW29wY29kZV0uZW5jb2Rpbmc7CisgICAgaWYgKHRtcCA9PSBO
VUxMKSB7CisgICAgICAgIGNvbnN0IGNoYXIgKnRlc3QgPSAiVjZfIjsgICAgICAgIC8qIEhWWCAq
LworICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gb3Bjb2RlX25hbWVzW29wY29kZV07CisgICAg
ICAgIGlmIChzdHJuY21wKG5hbWUsIHRlc3QsIHN0cmxlbih0ZXN0KSkgPT0gMCkgeworICAgICAg
ICAgICAgcmV0dXJuICJFWFRfbW12ZWMiOworICAgICAgICB9CisgICAgfQogICAgIHJldHVybiBv
cGNvZGVfZW5jX2NsYXNzX25hbWVzW29wY29kZV9lbmNvZGluZ3Nbb3Bjb2RlXS5lbmNfY2xhc3Nd
OwogfQogCi0tIAoyLjcuNAoK

