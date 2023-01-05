Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4865F306
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUCZ-0002pY-Qs; Thu, 05 Jan 2023 12:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCT-0002iD-JI
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCQ-0007FG-OW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305Fu0Tw007568; Thu, 5 Jan 2023 17:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S91fG3LMnqwwuvB7CvvvQEK+lMhfM/hlZi/Y7dwLh9I=;
 b=UD5rc3EuP0c04HUvxaYxvyw7BI+tSujOkRW4OwT/GJXbKfCj3aDPZXCS05KVwMGFLzC3
 K9UT37bhxVVFkLrlVWPb+W55J+lljGQynWgbn8BBIqgNA+gH9KvkKy9V463bWXdz2MIA
 60RuJwxCXxKpt+ZU6HpE7tBNM0uL7EmNQ8fUgBzN9++FKqXS/4qYFJiuZXdqvna7vqbx
 gNRV40OWLuWXjr2pPt4Jcd92GaUBk0CUXIuy6ezbaO0uyaU3V1LZiCkfQ6RE5m+Dcmsp
 0wYZtsTq2UHZ1TlI8l3LHW0WYCrQ6h9M8L21hKHsD5fH4e8nCNKq1OidWiZd8ABi8tv5 vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwdckjh45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:38:40 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305HcdXx022309; 
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3mte5kwnrf-1;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305Hcdlc022302;
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 305HccRv022297;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 5E68A5000B1; Thu,  5 Jan 2023 09:38:38 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Alessandro Di Federico <ale@rev.ng>
Subject: [PULL 5/7] target/hexagon: suppress unused variable warning
Date: Thu,  5 Jan 2023 09:38:24 -0800
Message-Id: <20230105173826.21444-6-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105173826.21444-1-tsimpson@quicinc.com>
References: <20230105173826.21444-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VHPINHTHzSzkE4GA7Hwm4swu6bUHURg4
X-Proofpoint-ORIG-GUID: VHPINHTHzSzkE4GA7Hwm4swu6bUHURg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=390 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050139
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

RnJvbTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4KClRoaXMgcGF0Y2ggbWFu
dWFsbHkgc3VwcHJlc3NlcyBhIHdhcm5pbmcgZm9yIGFuIHVudXNlZCB2YXJpYWJsZQooeXluZXJy
cykgZW1pdHRlZCBieSBiaXNvbi4KClRoaXMgd2FybmluZyBoYXMgYmVlbiB0cmlnZ2VyZWQgZm9y
IHRoZSBmaXJzdCB0aW1lIGJ5IGNsYW5nIDE1LgoKVGhpcyBwYXRjaCBhbHNvIGRpc2FibGVzIGAt
V2V4dHJhYCwgd2hpY2ggaXMgbm90IHVzdWFsbHkgYWRvcHRlZCBpbgpRRU1VLiBIb3dldmVyLCBj
bGFuZyAxNSB0cmlnZ2VycyB0aGUgd2FybmluZyBmaXhlZCBpbiB0aGlzIHBhdGNoIGV2ZW4gaW4K
YWJzZW5jZSBvZiBgLVdleHRyYWAuCgpTaWduZWQtb2ZmLWJ5OiBBbGVzc2FuZHJvIERpIEZlZGVy
aWNvIDxhbGVAcmV2Lm5nPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QGxpbmFyby5vcmc+ClRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPgpUZXN0ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVz
c2FnZS1JZDogPDIwMjIxMjIxMTU1MzI3LjE1MDQxMTctMS1hbGVAcmV2Lm5nPgotLS0KIHRhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkgfCAyICsrCiB0YXJnZXQvaGV4YWdv
bi9tZXNvbi5idWlsZCAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2lk
ZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkgYi90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVm
LXBhcnNlci55CmluZGV4IDhiZTQ0YTBhZDEuLmMxNGNiMzk1MDAgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkKKysrIGIvdGFyZ2V0L2hleGFnb24v
aWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIueQpAQCAtOTksNiArOTksOCBAQAogLyogSW5wdXQgZmls
ZSBjb250YWluaW5nIHRoZSBkZXNjcmlwdGlvbiBvZiBlYWNoIGhleGFnb24gaW5zdHJ1Y3Rpb24g
Ki8KIGlucHV0IDogaW5zdHJ1Y3Rpb25zCiAgICAgICB7CisgICAgICAgICAgLyogU3VwcHJlc3Mg
d2FybmluZyBhYm91dCB1bnVzZWQgeXluZXJycyAqLworICAgICAgICAgICh2b2lkKSB5eW5lcnJz
OwogICAgICAgICAgIFlZQUNDRVBUOwogICAgICAgfQogICAgICAgOwpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vbWVzb24uYnVpbGQgYi90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZAppbmRl
eCBlOGYyNTBmY2FjLi5jOWQzMWQwOTVjIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9tZXNv
bi5idWlsZAorKysgYi90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZApAQCAtMTk3LDcgKzE5Nyw2
IEBAIGlmIGlkZWZfcGFyc2VyX2VuYWJsZWQgYW5kICdoZXhhZ29uLWxpbnV4LXVzZXInIGluIHRh
cmdldF9kaXJzCiAgICAgICAgICBpZGVmX3BhcnNlcl9kaXIgLyAncGFyc2VyLWhlbHBlcnMuYydd
LAogICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVzOiBbJ2lkZWYtcGFyc2VyJywgJy4uLy4uL2lu
Y2x1ZGUvJ10sCiAgICAgICAgIGRlcGVuZGVuY2llczogW2dsaWJfZGVwXSwKLSAgICAgICAgY19h
cmdzOiBbJy1XZXh0cmEnXSwKICAgICAgICAgbmF0aXZlOiB0cnVlCiAgICAgKQogCi0tIAoyLjE3
LjEKCg==

