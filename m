Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3E2FC8F5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:32:29 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24EO-0001ly-Br
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bf-0007B3-4D
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:39 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2879)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24BV-0007VK-UL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611113369; x=1642649369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYOL2GdelB03OmtU5EKQcYAjquWyrLKmUT1zX6DjMyM=;
 b=pWXBZ7nGLeglRbO3jOiCflkixf0nu5zSA7AS8GTRsWjJoC6ejHnbkQr5
 7Lcm+MA8UFKPmhDt47Pu5JgMkfgAvXmjWG4JNmclPVAS4mAdCNnRPhUp6
 5oVPJ9ytGMIFET0JGmuxbAIb3fUryGkRccsmm7IlNgi9TcYyu6e2rnOWy s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 790752A1B; Tue, 19 Jan 2021 21:29:24 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/35] Hexagon (target/hexagon) register names
Date: Tue, 19 Jan 2021 21:28:39 -0600
Message-Id: <1611113349-24906-7-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
Ci0tLQogdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaCB8IDgzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODMgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29uL2hleF9yZWdzLmgKCmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9oZXhfcmVncy5oIGIvdGFyZ2V0L2hleGFnb24vaGV4X3Jl
Z3MuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5mMjkxOTExCi0tLSAvZGV2
L251bGwKKysrIGIvdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaApAQCAtMCwwICsxLDgzIEBACisv
KgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIs
IEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqICBpdCB1
bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxp
c2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVy
c2lvbi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBNRVJDSEFOVEFCSUxJVFkgb3Ig
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiAgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAq
ICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9y
Zy9saWNlbnNlcy8+LgorICovCisKKyNpZm5kZWYgSEVYQUdPTl9SRUdTX0gKKyNkZWZpbmUgSEVY
QUdPTl9SRUdTX0gKKworZW51bSB7CisgICAgSEVYX1JFR19SMDAgICAgICAgICAgICAgID0gMCwK
KyAgICBIRVhfUkVHX1IwMSAgICAgICAgICAgICAgPSAxLAorICAgIEhFWF9SRUdfUjAyICAgICAg
ICAgICAgICA9IDIsCisgICAgSEVYX1JFR19SMDMgICAgICAgICAgICAgID0gMywKKyAgICBIRVhf
UkVHX1IwNCAgICAgICAgICAgICAgPSA0LAorICAgIEhFWF9SRUdfUjA1ICAgICAgICAgICAgICA9
IDUsCisgICAgSEVYX1JFR19SMDYgICAgICAgICAgICAgID0gNiwKKyAgICBIRVhfUkVHX1IwNyAg
ICAgICAgICAgICAgPSA3LAorICAgIEhFWF9SRUdfUjA4ICAgICAgICAgICAgICA9IDgsCisgICAg
SEVYX1JFR19SMDkgICAgICAgICAgICAgID0gOSwKKyAgICBIRVhfUkVHX1IxMCAgICAgICAgICAg
ICAgPSAxMCwKKyAgICBIRVhfUkVHX1IxMSAgICAgICAgICAgICAgPSAxMSwKKyAgICBIRVhfUkVH
X1IxMiAgICAgICAgICAgICAgPSAxMiwKKyAgICBIRVhfUkVHX1IxMyAgICAgICAgICAgICAgPSAx
MywKKyAgICBIRVhfUkVHX1IxNCAgICAgICAgICAgICAgPSAxNCwKKyAgICBIRVhfUkVHX1IxNSAg
ICAgICAgICAgICAgPSAxNSwKKyAgICBIRVhfUkVHX1IxNiAgICAgICAgICAgICAgPSAxNiwKKyAg
ICBIRVhfUkVHX1IxNyAgICAgICAgICAgICAgPSAxNywKKyAgICBIRVhfUkVHX1IxOCAgICAgICAg
ICAgICAgPSAxOCwKKyAgICBIRVhfUkVHX1IxOSAgICAgICAgICAgICAgPSAxOSwKKyAgICBIRVhf
UkVHX1IyMCAgICAgICAgICAgICAgPSAyMCwKKyAgICBIRVhfUkVHX1IyMSAgICAgICAgICAgICAg
PSAyMSwKKyAgICBIRVhfUkVHX1IyMiAgICAgICAgICAgICAgPSAyMiwKKyAgICBIRVhfUkVHX1Iy
MyAgICAgICAgICAgICAgPSAyMywKKyAgICBIRVhfUkVHX1IyNCAgICAgICAgICAgICAgPSAyNCwK
KyAgICBIRVhfUkVHX1IyNSAgICAgICAgICAgICAgPSAyNSwKKyAgICBIRVhfUkVHX1IyNiAgICAg
ICAgICAgICAgPSAyNiwKKyAgICBIRVhfUkVHX1IyNyAgICAgICAgICAgICAgPSAyNywKKyAgICBI
RVhfUkVHX1IyOCAgICAgICAgICAgICAgPSAyOCwKKyAgICBIRVhfUkVHX1IyOSAgICAgICAgICAg
ICAgPSAyOSwKKyAgICBIRVhfUkVHX1NQICAgICAgICAgICAgICAgPSAyOSwKKyAgICBIRVhfUkVH
X0ZQICAgICAgICAgICAgICAgPSAzMCwKKyAgICBIRVhfUkVHX1IzMCAgICAgICAgICAgICAgPSAz
MCwKKyAgICBIRVhfUkVHX0xSICAgICAgICAgICAgICAgPSAzMSwKKyAgICBIRVhfUkVHX1IzMSAg
ICAgICAgICAgICAgPSAzMSwKKyAgICBIRVhfUkVHX1NBMCAgICAgICAgICAgICAgPSAzMiwKKyAg
ICBIRVhfUkVHX0xDMCAgICAgICAgICAgICAgPSAzMywKKyAgICBIRVhfUkVHX1NBMSAgICAgICAg
ICAgICAgPSAzNCwKKyAgICBIRVhfUkVHX0xDMSAgICAgICAgICAgICAgPSAzNSwKKyAgICBIRVhf
UkVHX1AzXzAgICAgICAgICAgICAgPSAzNiwKKyAgICBIRVhfUkVHX00wICAgICAgICAgICAgICAg
PSAzOCwKKyAgICBIRVhfUkVHX00xICAgICAgICAgICAgICAgPSAzOSwKKyAgICBIRVhfUkVHX1VT
UiAgICAgICAgICAgICAgPSA0MCwKKyAgICBIRVhfUkVHX1BDICAgICAgICAgICAgICAgPSA0MSwK
KyAgICBIRVhfUkVHX1VHUCAgICAgICAgICAgICAgPSA0MiwKKyAgICBIRVhfUkVHX0dQICAgICAg
ICAgICAgICAgPSA0MywKKyAgICBIRVhfUkVHX0NTMCAgICAgICAgICAgICAgPSA0NCwKKyAgICBI
RVhfUkVHX0NTMSAgICAgICAgICAgICAgPSA0NSwKKyAgICBIRVhfUkVHX1VQQ1lDTEVMTyAgICAg
ICAgPSA0NiwKKyAgICBIRVhfUkVHX1VQQ1lDTEVISSAgICAgICAgPSA0NywKKyAgICBIRVhfUkVH
X0ZSQU1FTElNSVQgICAgICAgPSA0OCwKKyAgICBIRVhfUkVHX0ZSQU1FS0VZICAgICAgICAgPSA0
OSwKKyAgICBIRVhfUkVHX1BLVENOVExPICAgICAgICAgPSA1MCwKKyAgICBIRVhfUkVHX1BLVENO
VEhJICAgICAgICAgPSA1MSwKKyAgICAvKiBVc2UgcmVzZXJ2ZWQgY29udHJvbCByZWdpc3RlcnMg
Zm9yIHFlbXUgZXhlY3V0aW9uIGNvdW50cyAqLworICAgIEhFWF9SRUdfUUVNVV9QS1RfQ05UICAg
ICAgPSA1MiwKKyAgICBIRVhfUkVHX1FFTVVfSU5TTl9DTlQgICAgID0gNTMsCisgICAgSEVYX1JF
R19VVElNRVJMTyAgICAgICAgICA9IDYyLAorICAgIEhFWF9SRUdfVVRJTUVSSEkgICAgICAgICAg
PSA2MywKK307CisKKyNlbmRpZgotLSAKMi43LjQKCg==

