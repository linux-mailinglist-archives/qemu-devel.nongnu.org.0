Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDB3D18FC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:21:59 +0200 (CEST)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6JfC-0006n6-OE
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m6JdI-0004l5-G8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:20:00 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:21464)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m6JdG-0001L4-NO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1626902398; x=1658438398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iZD97eBIZucwiK0wtpAYBTW7dL93qQwl4FOpc+wIOK8=;
 b=ti0bvSxn5uc1h0wz+9kTdBTV+FRTklxG27on7x1lcOZz3cos/hyG9y0p
 DiHspdpY2B6+E7XoERbrzUdHdkMel11z1cP+A3Yl7rewdTr7AJDhgPmOo
 oCToAwmbYk/JSOGK2irbsX47VgHfL+XZUCBp+J0luhsuxgrq0rZcfkmcz s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jul 2021 14:19:53 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 21 Jul 2021 14:19:51 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id B4BC411B8; Wed, 21 Jul 2021 16:19:51 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] linux-test (tests/tcg/multiarch/linux-test.c) add check
Date: Wed, 21 Jul 2021 16:19:35 -0500
Message-Id: <1626902375-7002-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
References: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGEgY2hlY2sgdGhhdCB0aGUgU0lHU0VHViBoYW5kbGVyIGlzIGNhbGxlZAoKUmV2aWV3ZWQt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ck1lc3NhZ2Ut
SWQ6IDwxNjI2Mzg0MTU2LTYyNDgtMy1naXQtc2VuZC1lbWFpbC10c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4LXRlc3QuYyB8IDggKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvbXVs
dGlhcmNoL2xpbnV4LXRlc3QuYyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgtdGVzdC5jCmlu
ZGV4IGM4YzZhZWQuLmUyZDg4ZjggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGlu
dXgtdGVzdC5jCisrKyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgtdGVzdC5jCkBAIC00Mzks
MTAgKzQzOSwxNCBAQCBzdGF0aWMgdm9pZCBzaWdfYWxhcm0oaW50IHNpZykKICAgICBhbGFybV9j
b3VudCsrOwogfQogCisvKiBDb3VudCB0aGUgbnVtYmVyIG9mIHRpbWVzIGhhbmRsZXIgaXMgY2Fs
bGVkICovCitzdGF0aWMgaW50IHNpZ19zZWd2X2NhbGxlZDsKKwogc3RhdGljIHZvaWQgc2lnX3Nl
Z3YoaW50IHNpZywgc2lnaW5mb190ICppbmZvLCB2b2lkICpwdWMpCiB7CiAgICAgaWYgKHNpZyAh
PSBTSUdTRUdWKQogICAgICAgICBlcnJvcigic2lnbmFsIik7CisgICAgc2lnX3NlZ3ZfY2FsbGVk
Kys7CiAgICAgbG9uZ2ptcChqbXBfZW52LCAxKTsKIH0KIApAQCAtNDkyLDYgKzQ5NiwxMCBAQCBz
dGF0aWMgdm9pZCB0ZXN0X3NpZ25hbCh2b2lkKQogICAgICAgICAqKHZvbGF0aWxlIHVpbnQ4X3Qg
KikwID0gMDsKICAgICB9CiAKKyAgICBpZiAoc2lnX3NlZ3ZfY2FsbGVkID09IDApIHsKKyAgICAg
ICAgZXJyb3IoIlNJR1NFR1YgaGFuZGxlciBub3QgY2FsbGVkIik7CisgICAgfQorCiAgICAgYWN0
LnNhX2hhbmRsZXIgPSBTSUdfREZMOwogICAgIHNpZ2VtcHR5c2V0KCZhY3Quc2FfbWFzayk7CiAg
ICAgYWN0LnNhX2ZsYWdzID0gMDsKLS0gCjIuNy40Cgo=

