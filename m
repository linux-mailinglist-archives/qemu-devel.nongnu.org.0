Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911C65F6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYUc-000714-F4; Thu, 05 Jan 2023 17:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUY-0006xi-O2
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUU-00028F-JL
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:42 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305M2GYG009553; Thu, 5 Jan 2023 22:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D5dOBpBJxUrzbTzscFNevYsa/fPS6s0arse/NPqbhKs=;
 b=jO50xnIBc9FWvYlGJ8rJEkfdd0ACgEl9xMT843CadLVaLuqTqsI5oYSwnquVoE0AJRF5
 aDi3EsoVLqWA7k+CcOIfzqItzvV/FQMsDS0UHJJ9cV5IIyBrTnhrhxp+UC2yO1ujM9hN
 q0dmJNemqDKoHnlhbTlel0/qSIV0h82Fuq7yaaI2JZnPzPljE/klOrzfAos9VpCQfb+L
 dgXBa4vYXkhXxft0M7VKo8ZSjEGytowPl9FZlq2b4l3pdFoK9LU0HKja3zTgUEjc+GwM
 DAQlNJiohPYh4gXEXo5eN/cYplXGLhF0YbH0sBtcm8zXVqA4duywq5O4z7UuphibZQyl 8Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwpwnt16r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:13:36 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305MDZhF003977; 
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3mte5kxjw3-1;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305MDZkS003969;
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 305MDYir003957;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 47AE9500102; Thu,  5 Jan 2023 14:13:34 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 7/9] Hexagon (tests/tcg/hexagon) Update preg_alias.c
Date: Thu,  5 Jan 2023 14:13:29 -0800
Message-Id: <20230105221331.12069-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105221331.12069-1-tsimpson@quicinc.com>
References: <20230105221331.12069-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1X2NJkELaI8tCoaw9i9DKlZmkGW9SJS-
X-Proofpoint-GUID: 1X2NJkELaI8tCoaw9i9DKlZmkGW9SJS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=707
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050174
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QWRkIGNvbnRyb2wgcmVnaXN0ZXJzIChjNCwgYzUpIHRvIGNsb2JiZXJzIGxpc3QKTWFkZSBwb3Nz
aWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNp
bXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRlc3RzL3RjZy9oZXhhZ29uL3ByZWdf
YWxpYXMuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlh
cy5jIGIvdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jCmluZGV4IGI0NGE4MTEyYjQuLjg3
OThmYmNhZjMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYworKysg
Yi90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMKQEAgLTEsNSArMSw1IEBACiAvKgotICog
IENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4g
QWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIzIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTY1LDcgKzY1LDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGNyZWdfYWxpYXMoaW50IGN2YWwsIFBSZWdzICpwcmVncykKICAgICAgIDogIj1yIihw
cmVncy0+cHJlZ3MucDApLCAiPXIiKHByZWdzLT5wcmVncy5wMSksCiAgICAgICAgICI9ciIocHJl
Z3MtPnByZWdzLnAyKSwgIj1yIihwcmVncy0+cHJlZ3MucDMpCiAgICAgICA6ICJyIihjdmFsKQot
ICAgICAgOiAicDAiLCAicDEiLCAicDIiLCAicDMiKTsKKyAgICAgIDogImM0IiwgInAwIiwgInAx
IiwgInAyIiwgInAzIik7CiB9CiAKIGludCBlcnI7CkBAIC05Miw3ICs5Miw3IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBjcmVnX2FsaWFzX3BhaXIodW5zaWduZWQgaW50IGN2YWwsIFBSZWdzICpwcmVn
cykKICAgICAgICA6ICI9ciIocHJlZ3MtPnByZWdzLnAwKSwgIj1yIihwcmVncy0+cHJlZ3MucDEp
LAogICAgICAgICAgIj1yIihwcmVncy0+cHJlZ3MucDIpLCAiPXIiKHByZWdzLT5wcmVncy5wMyks
ICI9ciIoYzUpCiAgICAgICAgOiAiciIoY3ZhbF9wYWlyKQotICAgICAgIDogInAwIiwgInAxIiwg
InAyIiwgInAzIik7CisgICAgICAgOiAiYzQiLCAiYzUiLCAicDAiLCAicDEiLCAicDIiLCAicDMi
KTsKIAogICBjaGVjayhjNSwgMHhkZWFkYmVlZik7CiB9CkBAIC0xMTcsNyArMTE3LDcgQEAgc3Rh
dGljIHZvaWQgdGVzdF9wYWNrZXQodm9pZCkKICAgICAgICAgICJ9XG5cdCIKICAgICAgICAgIDog
IityIihyZXN1bHQpCiAgICAgICAgICA6ICJyIigweGZmZmZmZmZmKSwgInIiKDB4ZmYwMGZmZmYp
LCAiciIoMHg4MzdlZDY1MykKLSAgICAgICAgIDogInAwIiwgInAxIiwgInAyIiwgInAzIik7Cisg
ICAgICAgICA6ICJjNCIsICJwMCIsICJwMSIsICJwMiIsICJwMyIpOwogICAgIGNoZWNrKHJlc3Vs
dCwgb2xkX3ZhbCk7CiAKICAgICAvKiBUZXN0IGEgcHJlZGljYXRlZCBzdG9yZSAqLwpAQCAtMTI5
LDcgKzEyOSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfcGFja2V0KHZvaWQpCiAgICAgICAgICAifVxu
XHQiCiAgICAgICAgICA6CiAgICAgICAgICA6ICJyIigwKSwgInIiKDB4ZmZmZmZmZmYpLCAiciIo
JnJlc3VsdCkKLSAgICAgICAgIDogInAwIiwgInAxIiwgInAyIiwgInAzIiwgIm1lbW9yeSIpOwor
ICAgICAgICAgOiAiYzQiLCAicDAiLCAicDEiLCAicDIiLCAicDMiLCAibWVtb3J5Iik7CiAgICAg
Y2hlY2socmVzdWx0LCAweDApOwogfQogCi0tIAoyLjE3LjEKCg==

