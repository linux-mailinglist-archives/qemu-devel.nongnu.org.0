Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA893BC437
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 01:46:48 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0YIZ-0003Q3-NF
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 19:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y74-0003Ut-2l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:54 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37367)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y72-0004gT-FM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1625528092; x=1657064092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t7UsYp9Mb+EMbWuE9H4legd3PjeTPnf6svUownQDEMk=;
 b=YzeptwR1kCKpuf7KWdoNoMMpvGO6NOu/oO6qjRW5r0V/uNgT22ojnphh
 PfIXwh6QlX7OY897hRfhJWHrC6sm64+fEds9UlnzWKJwOpi9FlVrrJe41
 aFMEyp4SQnTDhosYPqQPgUvbGjGp/FwhBWUEBurEPcWDCZe5wgZ4RMWvS 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Jul 2021 16:34:39 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D694FC90; Mon,  5 Jul 2021 18:34:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] Hexagon HVX (target/hexagon) register names
Date: Mon,  5 Jul 2021 18:34:17 -0500
Message-Id: <1625528074-19440-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2hleF9yZWdzLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2hleF9yZWdzLmggYi90YXJnZXQv
aGV4YWdvbi9oZXhfcmVncy5oCmluZGV4IGYyOTE5MTEuLmUxYjMxNDkgMTAwNjQ0Ci0tLSBhL3Rh
cmdldC9oZXhhZ29uL2hleF9yZWdzLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaApA
QCAtNzYsNiArNzYsNyBAQCBlbnVtIHsKICAgICAvKiBVc2UgcmVzZXJ2ZWQgY29udHJvbCByZWdp
c3RlcnMgZm9yIHFlbXUgZXhlY3V0aW9uIGNvdW50cyAqLwogICAgIEhFWF9SRUdfUUVNVV9QS1Rf
Q05UICAgICAgPSA1MiwKICAgICBIRVhfUkVHX1FFTVVfSU5TTl9DTlQgICAgID0gNTMsCisgICAg
SEVYX1JFR19RRU1VX0hWWF9DTlQgICAgICA9IDU0LAogICAgIEhFWF9SRUdfVVRJTUVSTE8gICAg
ICAgICAgPSA2MiwKICAgICBIRVhfUkVHX1VUSU1FUkhJICAgICAgICAgID0gNjMsCiB9OwotLSAK
Mi43LjQKCg==

