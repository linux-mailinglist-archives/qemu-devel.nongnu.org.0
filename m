Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047383C9416
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 00:57:07 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3noP-00089k-US
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 18:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nmp-00061J-K9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:27 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12363)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m3nmo-0002re-5G
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 18:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626303326; x=1657839326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OD1OD6POPBTd8z08uayN2Tkv4UvAaQ0VAfNXqf1Peu0=;
 b=spjdh9P7JlCR6iKtfcc3b9OCTrkED1rzaVSwTsaKVkVOLWrcLmKm+l46
 Pj1WP4eeDbpNiZlBU/Tl6f5+94sxmkDldBd4mqYdiltjaV1eZ8bxZSoWK
 SCm26KdkrEMN5ohj2trK3v98h7ZZoGpA2AhuY7dmq47FGZnbn4fkK6/gy E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2021 15:55:19 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 14 Jul 2021 15:55:19 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D7143E5F; Wed, 14 Jul 2021 17:55:18 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] linux-test (tests/tcg/multiarch/linux-test.c) add check
Date: Wed, 14 Jul 2021 17:55:09 -0500
Message-Id: <1626303309-7946-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
References: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
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
Cc: ale@rev.ng, bcain@quicinc.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGEgY2hlY2sgdGhhdCB0aGUgU0lHU0VHViBoYW5kbGVyIGlzIGNhbGxlZAoKUmV2aWV3ZWQt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVz
dHMvdGNnL211bHRpYXJjaC9saW51eC10ZXN0LmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL211bHRpYXJjaC9saW51
eC10ZXN0LmMgYi90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYwppbmRleCBjOGM2YWVk
Li5lMmQ4OGY4IDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYwor
KysgYi90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYwpAQCAtNDM5LDEwICs0MzksMTQg
QEAgc3RhdGljIHZvaWQgc2lnX2FsYXJtKGludCBzaWcpCiAgICAgYWxhcm1fY291bnQrKzsKIH0K
IAorLyogQ291bnQgdGhlIG51bWJlciBvZiB0aW1lcyBoYW5kbGVyIGlzIGNhbGxlZCAqLworc3Rh
dGljIGludCBzaWdfc2Vndl9jYWxsZWQ7CisKIHN0YXRpYyB2b2lkIHNpZ19zZWd2KGludCBzaWcs
IHNpZ2luZm9fdCAqaW5mbywgdm9pZCAqcHVjKQogewogICAgIGlmIChzaWcgIT0gU0lHU0VHVikK
ICAgICAgICAgZXJyb3IoInNpZ25hbCIpOworICAgIHNpZ19zZWd2X2NhbGxlZCsrOwogICAgIGxv
bmdqbXAoam1wX2VudiwgMSk7CiB9CiAKQEAgLTQ5Miw2ICs0OTYsMTAgQEAgc3RhdGljIHZvaWQg
dGVzdF9zaWduYWwodm9pZCkKICAgICAgICAgKih2b2xhdGlsZSB1aW50OF90ICopMCA9IDA7CiAg
ICAgfQogCisgICAgaWYgKHNpZ19zZWd2X2NhbGxlZCA9PSAwKSB7CisgICAgICAgIGVycm9yKCJT
SUdTRUdWIGhhbmRsZXIgbm90IGNhbGxlZCIpOworICAgIH0KKwogICAgIGFjdC5zYV9oYW5kbGVy
ID0gU0lHX0RGTDsKICAgICBzaWdlbXB0eXNldCgmYWN0LnNhX21hc2spOwogICAgIGFjdC5zYV9m
bGFncyA9IDA7Ci0tIAoyLjcuNAoK

