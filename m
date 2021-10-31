Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9103A440F7E
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 17:46:31 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhDyY-0004H9-3b
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 12:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvj-0001VN-1j
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:31506)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvg-0008Ap-Vx
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635698613; x=1667234613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1hJ3UZ5nF7quYwvDSNlNNWFNGtGRkO3y+A3Qi9Srf8=;
 b=vD010VvoqG0hKVpaxY3s52PmqS8DzF1wjXjxLhqoyMTzxmJBJYGEIEht
 mIuf+3Db0YRumn2SAjVa7e3aEzl8LtWcL35xSolQJSLXDFSQn4FY/Zskf
 m1qCiPB6o6KQSzHzEpCLbtpIXBblW+myuJCU1syO2xrWT7SGFwC0NnGgq 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 31 Oct 2021 09:43:29 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 51E9024EE; Sun, 31 Oct 2021 11:43:29 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] Hexagon HVX (target/hexagon) register names
Date: Sun, 31 Oct 2021 11:42:42 -0500
Message-Id: <1635698589-31849-4-git-send-email-tsimpson@quicinc.com>
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

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaCB8IDEgKwogdGFyZ2V0L2hleGFnb24vY3B1
LmMgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaCBiL3RhcmdldC9o
ZXhhZ29uL2hleF9yZWdzLmgKaW5kZXggZjI5MTkxMS4uZTFiMzE0OSAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vaGV4X3JlZ3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9oZXhfcmVncy5oCkBA
IC03Niw2ICs3Niw3IEBAIGVudW0gewogICAgIC8qIFVzZSByZXNlcnZlZCBjb250cm9sIHJlZ2lz
dGVycyBmb3IgcWVtdSBleGVjdXRpb24gY291bnRzICovCiAgICAgSEVYX1JFR19RRU1VX1BLVF9D
TlQgICAgICA9IDUyLAogICAgIEhFWF9SRUdfUUVNVV9JTlNOX0NOVCAgICAgPSA1MywKKyAgICBI
RVhfUkVHX1FFTVVfSFZYX0NOVCAgICAgID0gNTQsCiAgICAgSEVYX1JFR19VVElNRVJMTyAgICAg
ICAgICA9IDYyLAogICAgIEhFWF9SRUdfVVRJTUVSSEkgICAgICAgICAgPSA2MywKIH07CmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9jcHUuYyBiL3RhcmdldC9oZXhhZ29uL2NwdS5jCmluZGV4
IDk4OWJkNzYuLjNiZDNmMTAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5jCisrKyBi
L3RhcmdldC9oZXhhZ29uL2NwdS5jCkBAIC01OSw3ICs1OSw3IEBAIGNvbnN0IGNoYXIgKiBjb25z
dCBoZXhhZ29uX3JlZ25hbWVzW1RPVEFMX1BFUl9USFJFQURfUkVHU10gPSB7CiAgICJyMjQiLCAi
cjI1IiwgInIyNiIsICJyMjciLCAicjI4IiwgICJyMjkiLCAicjMwIiwgInIzMSIsCiAgICJzYTAi
LCAibGMwIiwgInNhMSIsICJsYzEiLCAicDNfMCIsICJjNSIsICAibTAiLCAgIm0xIiwKICAgInVz
ciIsICJwYyIsICAidWdwIiwgImdwIiwgICJjczAiLCAgImNzMSIsICJjMTQiLCAiYzE1IiwKLSAg
ImMxNiIsICJjMTciLCAiYzE4IiwgImMxOSIsICJwa3RfY250IiwgICJpbnNuX2NudCIsICJjMjIi
LCAiYzIzIiwKKyAgImMxNiIsICJjMTciLCAiYzE4IiwgImMxOSIsICJwa3RfY250IiwgICJpbnNu
X2NudCIsICJodnhfY250IiwgImMyMyIsCiAgICJjMjQiLCAiYzI1IiwgImMyNiIsICJjMjciLCAi
YzI4IiwgICJjMjkiLCAiYzMwIiwgImMzMSIsCiB9OwogCi0tIAoyLjcuNAoK

