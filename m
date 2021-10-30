Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C294406AD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 03:27:01 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgd9A-00039p-DB
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 21:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3W-0002xJ-OY
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:10 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10779)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mgd3M-0001cz-Dj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 21:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635556860; x=1667092860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1hJ3UZ5nF7quYwvDSNlNNWFNGtGRkO3y+A3Qi9Srf8=;
 b=zUAI1xw4E1PRYB/eNVdIPoIbcTgMgotxUb9dtRYgoFe8D2qnln6PDZw7
 iR1GPNIao61lbQYI9MPNYQWT4TcBdBtKUG9n1bLAaQ85nxpuTTbNSyFyJ
 wYhlsP26Hs9fVFzzN/PZFnIMELyJbO0/eFdVdUAOFJebuw1hpnafoI1H5 M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Oct 2021 18:20:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 29 Oct 2021 18:20:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id E91F117C5; Fri, 29 Oct 2021 20:20:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/30] Hexagon HVX (target/hexagon) register names
Date: Fri, 29 Oct 2021 20:20:22 -0500
Message-Id: <1635556849-18120-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
References: <1635556849-18120-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
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

