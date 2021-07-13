Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7633C7780
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:49:24 +0200 (CEST)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OPD-0006aN-SW
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON3-0003uZ-HS
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:09 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23159)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3ON1-0002K9-J4
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626205627; x=1657741627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNddvIau1IUhI6HbeGHihQhGOyut/P2fC5BWq18f60A=;
 b=dLtxu10tKdUDj8/ko15gUoCLmZVRXy9a3X7nKEV1AdaZEi9DiwwvrZbz
 MNnoOFfTe2SJP4j4TRs9NvvOyfJwJTszgReuGzpQXu3KcnW7DJwNS7D/X
 Lz+VWrqjBQ5h7zp1AgUMHbJ+bxjVpcEzufXg2kmiskluMkdqiRrcLF2O4 Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2021 12:47:04 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 13 Jul 2021 12:47:03 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 02D46F45; Tue, 13 Jul 2021 14:47:03 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-test (tests/tcg/multiarch/linux-test.c) add check
Date: Tue, 13 Jul 2021 14:46:29 -0500
Message-Id: <1626205589-19208-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
References: <1626205589-19208-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGEgY2hlY2sgdGhhdCB0aGUgU0lHU0VHViBoYW5kbGVyIGlzIGNhbGxlZAoKU2lnbmVkLW9m
Zi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRlc3RzL3Rj
Zy9tdWx0aWFyY2gvbGludXgtdGVzdC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL211bHRpYXJjaC9saW51eC10ZXN0
LmMgYi90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYwppbmRleCBjOGM2YWVkLi5jYjg0
NWM5IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYworKysgYi90
ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYwpAQCAtNDM5LDEwICs0MzksMTMgQEAgc3Rh
dGljIHZvaWQgc2lnX2FsYXJtKGludCBzaWcpCiAgICAgYWxhcm1fY291bnQrKzsKIH0KIAorc3Rh
dGljIGludCBzaWdfc2Vndl9jYWxsZWQ7CisKIHN0YXRpYyB2b2lkIHNpZ19zZWd2KGludCBzaWcs
IHNpZ2luZm9fdCAqaW5mbywgdm9pZCAqcHVjKQogewogICAgIGlmIChzaWcgIT0gU0lHU0VHVikK
ICAgICAgICAgZXJyb3IoInNpZ25hbCIpOworICAgIHNpZ19zZWd2X2NhbGxlZCA9IDE7CiAgICAg
bG9uZ2ptcChqbXBfZW52LCAxKTsKIH0KIApAQCAtNDkyLDYgKzQ5NSwxMCBAQCBzdGF0aWMgdm9p
ZCB0ZXN0X3NpZ25hbCh2b2lkKQogICAgICAgICAqKHZvbGF0aWxlIHVpbnQ4X3QgKikwID0gMDsK
ICAgICB9CiAKKyAgICBpZiAoc2lnX3NlZ3ZfY2FsbGVkID09IDApIHsKKyAgICAgICAgZXJyb3Io
IlNJR1NFR1YgaGFuZGxlciBub3QgY2FsbGVkIik7CisgICAgfQorCiAgICAgYWN0LnNhX2hhbmRs
ZXIgPSBTSUdfREZMOwogICAgIHNpZ2VtcHR5c2V0KCZhY3Quc2FfbWFzayk7CiAgICAgYWN0LnNh
X2ZsYWdzID0gMDsKLS0gCjIuNy40Cgo=

