Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FE2EECB4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:56:30 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjp7-00078V-KX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjQE-000052-1f
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:30:46 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:25188)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjQ8-00059i-Di
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610080243; x=1641616243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dt4Xyy9jaGqB39GgjkHe2F6Vhgqxyz2aaXwaS3nqTJ4=;
 b=mvE/cQ3sftvcSOZzK61UELbF0BMX7H9iK25tOvi1p0fMWfg5v9Bf4F7F
 ZuCDK/nyKelBE4JN2T1M7mQ7Ox5ATG5fD7lPJ5G+4rMKsP8jKUlD4Ewlm
 PYorn3pDXZyd4vROOqPn4TVxeFuSpG0l/EsDmFChGBNI+7RztOM4oy+Xl E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jan 2021 20:29:17 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 07 Jan 2021 20:29:16 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6E3DC124C; Thu,  7 Jan 2021 22:29:16 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 35/35] Add newline when generating Dockerfile
Date: Thu,  7 Jan 2021 22:29:06 -0600
Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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
Cc: ale@rev.ng, bcain@quicinc.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 Fam Zheng <fam@euphon.net>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4KClNpZ25lZC1vZmYtYnk6
IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+Ci0tLQogdGVzdHMvZG9ja2VyL2Rv
Y2tlci5weSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5IGIvdGVzdHMvZG9j
a2VyL2RvY2tlci5weQppbmRleCBkNDczNTY2Li41YzMxOGQ5IDEwMDc1NQotLS0gYS90ZXN0cy9k
b2NrZXIvZG9ja2VyLnB5CisrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXIucHkKQEAgLTMzMyw5ICsz
MzMsOSBAQCBjbGFzcyBEb2NrZXIob2JqZWN0KToKICAgICAgICAgICAgICAgICAgICAgICAgICAo
dW5hbWUsIHVpZCwgdW5hbWUpKQogCiAgICAgICAgIHRtcF9kZi53cml0ZSgiXG4iKQotICAgICAg
ICB0bXBfZGYud3JpdGUoIkxBQkVMIGNvbS5xZW11LmRvY2tlcmZpbGUtY2hlY2tzdW09JXMiICUg
KGNoZWNrc3VtKSkKKyAgICAgICAgdG1wX2RmLndyaXRlKCJMQUJFTCBjb20ucWVtdS5kb2NrZXJm
aWxlLWNoZWNrc3VtPSVzXG4iICUgKGNoZWNrc3VtKSkKICAgICAgICAgZm9yIGYsIGMgaW4gZXh0
cmFfZmlsZXNfY2tzdW06Ci0gICAgICAgICAgICB0bXBfZGYud3JpdGUoIkxBQkVMIGNvbS5xZW11
LiVzLWNoZWNrc3VtPSVzIiAlIChmLCBjKSkKKyAgICAgICAgICAgIHRtcF9kZi53cml0ZSgiTEFC
RUwgY29tLnFlbXUuJXMtY2hlY2tzdW09JXNcbiIgJSAoZiwgYykpCiAKICAgICAgICAgdG1wX2Rm
LmZsdXNoKCkKIAotLSAKMi43LjQKCg==

