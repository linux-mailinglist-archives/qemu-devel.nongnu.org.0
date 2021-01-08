Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE32EECCC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 06:09:24 +0100 (CET)
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxk1b-0002xR-OS
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 00:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjQ8-0008Up-2T
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:30:41 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:25185)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjQ5-00058Q-38
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610080237; x=1641616237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uwq/v4X+jYQDyHZGi96rTYDLMc0l3iChLfm/yYrpCm0=;
 b=wapUOagB6cEVWeG9Jk8eRJBUvNS24IxsCRxF+F3y7RGEblxo85MyQ+Zz
 qozPBUgB4KB2QxaM7fHOztk6D5+MJ/k1HSOgX1fGRX/WNMZ2ljLcS73ol
 JWmOuZKdpMxJmflx9hMYJRSt/pF9HvBcesiycNHNwG+yFVwAq3ln76UGF Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jan 2021 20:29:17 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 07 Jan 2021 20:29:16 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 5A1C1120C; Thu,  7 Jan 2021 22:29:16 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 34/35] Auto-import Docker support files
Date: Thu,  7 Jan 2021 22:29:05 -0600
Message-Id: <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
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
Y2tlci5weSB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZG9ja2VyL2RvY2tlci5weSBiL3Rlc3Rz
L2RvY2tlci9kb2NrZXIucHkKaW5kZXggMzZiNzg2OC4uZDQ3MzU2NiAxMDA3NTUKLS0tIGEvdGVz
dHMvZG9ja2VyL2RvY2tlci5weQorKysgYi90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5CkBAIC0yOCw2
ICsyOCw3IEBAIGZyb20gaW8gaW1wb3J0IFN0cmluZ0lPLCBCeXRlc0lPCiBmcm9tIHNodXRpbCBp
bXBvcnQgY29weSwgcm10cmVlCiBmcm9tIHB3ZCBpbXBvcnQgZ2V0cHd1aWQKIGZyb20gZGF0ZXRp
bWUgaW1wb3J0IGRhdGV0aW1lLCB0aW1lZGVsdGEKK2Zyb20gZ2xvYiBpbXBvcnQgZ2xvYgogCiAK
IEZJTFRFUkVEX0VOVl9OQU1FUyA9IFsnZnRwX3Byb3h5JywgJ2h0dHBfcHJveHknLCAnaHR0cHNf
cHJveHknXQpAQCAtNDY2LDcgKzQ2Nyw4IEBAIGNsYXNzIEJ1aWxkQ29tbWFuZChTdWJDb21tYW5k
KToKICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDEKIAogICAgICAgICAgICAgIyBJcyB0aGVy
ZSBhIC5wcmUgZmlsZSB0byBydW4gaW4gdGhlIGJ1aWxkIGNvbnRleHQ/Ci0gICAgICAgICAgICBk
b2NrZXJfcHJlID0gb3MucGF0aC5zcGxpdGV4dChhcmdzLmRvY2tlcmZpbGUpWzBdKyIucHJlIgor
ICAgICAgICAgICAgYmFzZW5hbWUgPSBvcy5wYXRoLnNwbGl0ZXh0KGFyZ3MuZG9ja2VyZmlsZSlb
MF0KKyAgICAgICAgICAgIGRvY2tlcl9wcmUgPSBiYXNlbmFtZSArICIucHJlIgogICAgICAgICAg
ICAgaWYgb3MucGF0aC5leGlzdHMoZG9ja2VyX3ByZSk6CiAgICAgICAgICAgICAgICAgc3Rkb3V0
ID0gREVWTlVMTCBpZiBhcmdzLnF1aWV0IGVsc2UgTm9uZQogICAgICAgICAgICAgICAgIHJjID0g
c3VicHJvY2Vzcy5jYWxsKG9zLnBhdGgucmVhbHBhdGgoZG9ja2VyX3ByZSksCkBAIC00ODgsNyAr
NDkwLDkgQEAgY2xhc3MgQnVpbGRDb21tYW5kKFN1YkNvbW1hbmQpOgogICAgICAgICAgICAgICAg
IF9jb3B5X2JpbmFyeV93aXRoX2xpYnMoYXJncy5pbmNsdWRlX2V4ZWN1dGFibGUsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBxcGF0aCwgZG9ja2VyX2RpcikKIAotICAg
ICAgICAgICAgZm9yIGZpbGVuYW1lIGluIGFyZ3MuZXh0cmFfZmlsZXMgb3IgW106CisgICAgICAg
ICAgICBleHRyYV9maWxlcyA9IGFyZ3MuZXh0cmFfZmlsZXMgb3IgW10KKyAgICAgICAgICAgIGV4
dHJhX2ZpbGVzICs9IGdsb2IoYmFzZW5hbWUgKyAiLioiKQorICAgICAgICAgICAgZm9yIGZpbGVu
YW1lIGluIGV4dHJhX2ZpbGVzOgogICAgICAgICAgICAgICAgIF9jb3B5X3dpdGhfbWtkaXIoZmls
ZW5hbWUsIGRvY2tlcl9kaXIpCiAgICAgICAgICAgICAgICAgY2tzdW0gKz0gWyhmaWxlbmFtZSwg
X2ZpbGVfY2hlY2tzdW0oZmlsZW5hbWUpKV0KIAotLSAKMi43LjQKCg==

