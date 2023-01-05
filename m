Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92165F300
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUCa-0002sa-PP; Thu, 05 Jan 2023 12:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCU-0002jW-Vf
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:47 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCR-0007Eo-EJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:46 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305DtnXe001270; Thu, 5 Jan 2023 17:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qk7MORsnwrqiX2JX1ght7VshXeSyDvsCqH+l42H1Lo8=;
 b=UseBIhzq51L0/hJY8tqT937AqA6YYo/NVHAsdXRPD7exvB2Lf0qqQK0Inz4xXZ/LXZ+X
 lyL9bbN0fZyHbKdKt6DW77LKo+T9NsAl6QFZynhQ78fgZFE5aTk/0TuRQF5ldATohymH
 yRdiQIO/aR41OcnLkkERE06SJDQ1ft47tO18GcCuNSX8BPRJeT6vSzmzeh8VCz1hoO8Q
 nMbCwUkZa4h4lsPTL4EmjvzI+uq8axgEc6gzha9z9nQiwkVSMr8D/OTBYki0mnYBgDq9
 hugCZasHyQ0iRrJpJIIth7ugumtYgWXSdHC9stUBtUBH+iWR8m+kh9+qrhkSXksXn0l5 2Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwwfs8pvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:38:40 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305Hcdng022305; 
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3mte5kwnrc-1;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305Hcccg022296;
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 305HccSG022292;
 Thu, 05 Jan 2023 17:38:38 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 55D1B5000AE; Thu,  5 Jan 2023 09:38:38 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PULL 2/7] target/hexagon: rename aliased register HEX_REG_P3_0
Date: Thu,  5 Jan 2023 09:38:21 -0800
Message-Id: <20230105173826.21444-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105173826.21444-1-tsimpson@quicinc.com>
References: <20230105173826.21444-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 54b7DIurt49jTl31b8nTLpfu-RXYMnJo
X-Proofpoint-ORIG-GUID: 54b7DIurt49jTl31b8nTLpfu-RXYMnJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=735 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050139
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

RnJvbTogTXVraWxhbiBUaGl5YWdhcmFqYW4gPHF1aWNfbXRoaXlhZ2FAcXVpY2luYy5jb20+CgpU
aGUgcGF0Y2ggcmVuYW1lcyB0aGUgaWRlbnRpZmllciBvZiB0aGUgMzJiaXQgcmVnaXN0ZXIKSEVY
X1JFR19QM18wIHRvIEhFWF9SRUdfUDNfMF9BTElBU0VELgoKVGhpcyBjaGFuZ2UgaXMgdG8gaW50
ZW5kZWQgdG8gcHJvdmlkZSBzb21lIHdhcm5pbmcgdGhhdApIRVhfUkVHX1AzXzAgaXMgYW4gYWxp
YXNlZCByZWdpc3RlciB3aGljaCBoYXMgbXVsdGlwbGUKcmVwcmVzZW50YXRpb25zIGluIENQVSBz
dGF0ZSBhbmQgdGhlcmVmb3JlIG1pZ2h0IHJlcXVpcmUKc3BlY2lhbCBoYW5kbGluZyBpbiBzb21l
IGNvbnRleHRzLiBUaGUgaG9wZSBpcyB0byBwcmV2ZW50CmFjY2lkZW50YWwgbWlzdXNlIG9mIHRo
aXMgcmVnaXN0ZXIgZS5nIHRoZSBpc3N1ZSByZXBvcnRlZApmb3IgdGhlIHNpZ25hbHMgdGVzdHMg
ZmFpbHVyZSBbaGVyZV1bMV0uCgpbMV06IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0
bWwvcWVtdS1kZXZlbC8yMDIxLTExL21zZzAxMTAyLmh0bWwKClNpZ25lZC1vZmYtYnk6IE11a2ls
YW4gVGhpeWFnYXJhamFuIDxxdWljX210aGl5YWdhQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBUYXls
b3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDIyMTIyOTA5
MjAwNi4xMDcwOS0zLXF1aWNfbXRoaXlhZ2FAcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFn
b24vaGV4X3JlZ3MuaCB8ICAyICstCiB0YXJnZXQvaGV4YWdvbi9jcHUuYyAgICAgIHwgIDYgKysr
LS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgIHwgMTIgKysrKysrLS0tLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL2hleF9yZWdzLmggYi90YXJnZXQvaGV4YWdvbi9oZXhfcmVncy5oCmlu
ZGV4IGE2M2MyYzBmZDUuLmJkZGZjMjgwMjEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2hl
eF9yZWdzLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaApAQCAtNTgsNyArNTgsNyBA
QCBlbnVtIHsKICAgICBIRVhfUkVHX0xDMCAgICAgICAgICAgICAgPSAzMywKICAgICBIRVhfUkVH
X1NBMSAgICAgICAgICAgICAgPSAzNCwKICAgICBIRVhfUkVHX0xDMSAgICAgICAgICAgICAgPSAz
NSwKLSAgICBIRVhfUkVHX1AzXzAgICAgICAgICAgICAgPSAzNiwKKyAgICBIRVhfUkVHX1AzXzBf
QUxJQVNFRCAgICAgPSAzNiwKICAgICBIRVhfUkVHX00wICAgICAgICAgICAgICAgPSAzOCwKICAg
ICBIRVhfUkVHX00xICAgICAgICAgICAgICAgPSAzOSwKICAgICBIRVhfUkVHX1VTUiAgICAgICAg
ICAgICAgPSA0MCwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2NwdS5jIGIvdGFyZ2V0L2hl
eGFnb24vY3B1LmMKaW5kZXggNjU4Y2E0ZmY3OC4uODA3MDM3YzU4NiAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vY3B1LmMKKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmMKQEAgLTg2LDcgKzg2
LDcgQEAgc3RhdGljIHRhcmdldF91bG9uZyBhZGp1c3Rfc3RhY2tfcHRycyhDUFVIZXhhZ29uU3Rh
dGUgKmVudiwgdGFyZ2V0X3Vsb25nIGFkZHIpCiAgICAgcmV0dXJuIGFkZHI7CiB9CiAKLS8qIEhF
WF9SRUdfUDNfMCAoYWthIEM0KSBpcyBhbiBhbGlhcyBmb3IgdGhlIHByZWRpY2F0ZSByZWdpc3Rl
cnMgKi8KKy8qIEhFWF9SRUdfUDNfMF9BTElBU0VEIChha2EgQzQpIGlzIGFuIGFsaWFzIGZvciB0
aGUgcHJlZGljYXRlIHJlZ2lzdGVycyAqLwogc3RhdGljIHRhcmdldF91bG9uZyByZWFkX3AzXzAo
Q1BVSGV4YWdvblN0YXRlICplbnYpCiB7CiAgICAgaW50MzJfdCBjb250cm9sX3JlZyA9IDA7CkBA
IC0xMDIsNyArMTAyLDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfcmVnKEZJTEUgKmYsIENQVUhleGFn
b25TdGF0ZSAqZW52LCBpbnQgcmVnbnVtKQogewogICAgIHRhcmdldF91bG9uZyB2YWx1ZTsKIAot
ICAgIGlmIChyZWdudW0gPT0gSEVYX1JFR19QM18wKSB7CisgICAgaWYgKHJlZ251bSA9PSBIRVhf
UkVHX1AzXzBfQUxJQVNFRCkgewogICAgICAgICB2YWx1ZSA9IHJlYWRfcDNfMChlbnYpOwogICAg
IH0gZWxzZSB7CiAgICAgICAgIHZhbHVlID0gcmVnbnVtIDwgMzIgPyBhZGp1c3Rfc3RhY2tfcHRy
cyhlbnYsIGVudi0+Z3ByW3JlZ251bV0pCkBAIC0xOTgsNyArMTk4LDcgQEAgc3RhdGljIHZvaWQg
aGV4YWdvbl9kdW1wKENQVUhleGFnb25TdGF0ZSAqZW52LCBGSUxFICpmLCBpbnQgZmxhZ3MpCiAg
ICAgcHJpbnRfcmVnKGYsIGVudiwgSEVYX1JFR19NMCk7CiAgICAgcHJpbnRfcmVnKGYsIGVudiwg
SEVYX1JFR19NMSk7CiAgICAgcHJpbnRfcmVnKGYsIGVudiwgSEVYX1JFR19VU1IpOwotICAgIHBy
aW50X3JlZyhmLCBlbnYsIEhFWF9SRUdfUDNfMCk7CisgICAgcHJpbnRfcmVnKGYsIGVudiwgSEVY
X1JFR19QM18wX0FMSUFTRUQpOwogICAgIHByaW50X3JlZyhmLCBlbnYsIEhFWF9SRUdfR1ApOwog
ICAgIHByaW50X3JlZyhmLCBlbnYsIEhFWF9SRUdfVUdQKTsKICAgICBwcmludF9yZWcoZiwgZW52
LCBIRVhfUkVHX1BDKTsKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggNmNmMmUwZWQ0My4uNjZhOTY4Yzg4NCAxMDA2NDQK
LS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMKQEAgLTE2Myw3ICsxNjMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3JlYWRfcDNfMChU
Q0d2IGNvbnRyb2xfcmVnKQogCiAvKgogICogQ2VydGFpbiBjb250cm9sIHJlZ2lzdGVycyByZXF1
aXJlIHNwZWNpYWwgaGFuZGxpbmcgb24gcmVhZAotICogICAgIEhFWF9SRUdfUDNfMCAgICAgICAg
ICBhbGlhc2VkIHRvIHRoZSBwcmVkaWNhdGUgcmVnaXN0ZXJzCisgKiAgICAgSEVYX1JFR19QM18w
X0FMSUFTRUQgIGFsaWFzZWQgdG8gdGhlIHByZWRpY2F0ZSByZWdpc3RlcnMKICAqICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLT4gY29uY2F0IHRoZSA0IHByZWRpY2F0ZSByZWdpc3RlcnMgdG9n
ZXRoZXIKICAqICAgICBIRVhfUkVHX1BDICAgICAgICAgICAgYWN0dWFsIHZhbHVlIHN0b3JlZCBp
biBEaXNhc0NvbnRleHQKICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXNzaWduIGZy
b20gY3R4LT5iYXNlLnBjX25leHQKQEAgLTE3Myw3ICsxNzMsNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgZ2VuX3JlYWRfcDNfMChUQ0d2IGNvbnRyb2xfcmVnKQogc3RhdGljIGlubGluZSB2b2lkIGdl
bl9yZWFkX2N0cmxfcmVnKERpc2FzQ29udGV4dCAqY3R4LCBjb25zdCBpbnQgcmVnX251bSwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0d2IGRlc3QpCiB7Ci0gICAgaWYg
KHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7CisgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19Q
M18wX0FMSUFTRUQpIHsKICAgICAgICAgZ2VuX3JlYWRfcDNfMChkZXN0KTsKICAgICB9IGVsc2Ug
aWYgKHJlZ19udW0gPT0gSEVYX1JFR19QQykgewogICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoZGVz
dCwgY3R4LT5iYXNlLnBjX25leHQpOwpAQCAtMTk0LDcgKzE5NCw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fcmVhZF9jdHJsX3JlZyhEaXNhc0NvbnRleHQgKmN0eCwgY29uc3QgaW50IHJlZ19u
dW0sCiBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3JlYWRfY3RybF9yZWdfcGFpcihEaXNhc0NvbnRl
eHQgKmN0eCwgY29uc3QgaW50IHJlZ19udW0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBUQ0d2X2k2NCBkZXN0KQogewotICAgIGlmIChyZWdfbnVtID09IEhFWF9S
RUdfUDNfMCkgeworICAgIGlmIChyZWdfbnVtID09IEhFWF9SRUdfUDNfMF9BTElBU0VEKSB7CiAg
ICAgICAgIFRDR3YgcDNfMCA9IHRjZ190ZW1wX25ldygpOwogICAgICAgICBnZW5fcmVhZF9wM18w
KHAzXzApOwogICAgICAgICB0Y2dfZ2VuX2NvbmNhdF9pMzJfaTY0KGRlc3QsIHAzXzAsIGhleF9n
cHJbcmVnX251bSArIDFdKTsKQEAgLTIzOCw3ICsyMzgsNyBAQCBzdGF0aWMgdm9pZCBnZW5fd3Jp
dGVfcDNfMChEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBjb250cm9sX3JlZykKIAogLyoKICAqIENl
cnRhaW4gY29udHJvbCByZWdpc3RlcnMgcmVxdWlyZSBzcGVjaWFsIGhhbmRsaW5nIG9uIHdyaXRl
Ci0gKiAgICAgSEVYX1JFR19QM18wICAgICAgICAgIGFsaWFzZWQgdG8gdGhlIHByZWRpY2F0ZSBy
ZWdpc3RlcnMKKyAqICAgICBIRVhfUkVHX1AzXzBfQUxJQVNFRCAgYWxpYXNlZCB0byB0aGUgcHJl
ZGljYXRlIHJlZ2lzdGVycwogICogICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBicmVhayB0
aGUgdmFsdWUgYWNyb3NzIDQgcHJlZGljYXRlIHJlZ2lzdGVycwogICogICAgIEhFWF9SRUdfUUVN
VV8qX0NOVCAgICBjaGFuZ2VzIGluIGN1cnJlbnQgVEIgaW4gRGlzYXNDb250ZXh0CiAgKiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtPiBjbGVhciB0aGUgY2hhbmdlcwpAQCAtMjQ2LDcgKzI0
Niw3IEBAIHN0YXRpYyB2b2lkIGdlbl93cml0ZV9wM18wKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2
IGNvbnRyb2xfcmVnKQogc3RhdGljIGlubGluZSB2b2lkIGdlbl93cml0ZV9jdHJsX3JlZyhEaXNh
c0NvbnRleHQgKmN0eCwgaW50IHJlZ19udW0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFRDR3YgdmFsKQogewotICAgIGlmIChyZWdfbnVtID09IEhFWF9SRUdfUDNfMCkg
eworICAgIGlmIChyZWdfbnVtID09IEhFWF9SRUdfUDNfMF9BTElBU0VEKSB7CiAgICAgICAgIGdl
bl93cml0ZV9wM18wKGN0eCwgdmFsKTsKICAgICB9IGVsc2UgewogICAgICAgICBnZW5fbG9nX3Jl
Z193cml0ZShyZWdfbnVtLCB2YWwpOwpAQCAtMjY2LDcgKzI2Niw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fd3JpdGVfY3RybF9yZWcoRGlzYXNDb250ZXh0ICpjdHgsIGludCByZWdfbnVtLAog
c3RhdGljIGlubGluZSB2b2lkIGdlbl93cml0ZV9jdHJsX3JlZ19wYWlyKERpc2FzQ29udGV4dCAq
Y3R4LCBpbnQgcmVnX251bSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUQ0d2X2k2NCB2YWwpCiB7Ci0gICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wKSB7
CisgICAgaWYgKHJlZ19udW0gPT0gSEVYX1JFR19QM18wX0FMSUFTRUQpIHsKICAgICAgICAgVENH
diB2YWwzMiA9IHRjZ190ZW1wX25ldygpOwogICAgICAgICB0Y2dfZ2VuX2V4dHJsX2k2NF9pMzIo
dmFsMzIsIHZhbCk7CiAgICAgICAgIGdlbl93cml0ZV9wM18wKGN0eCwgdmFsMzIpOwotLSAKMi4x
Ny4xCgo=

