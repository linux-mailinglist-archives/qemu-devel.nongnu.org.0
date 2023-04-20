Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585AC6E88BC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:29:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKws-0003hB-P7; Wed, 19 Apr 2023 23:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwl-0003g0-5p
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwh-0000Io-AL
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K37evo013870; Thu, 20 Apr 2023 03:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=50OsvpRrBPJdukAjztDTtCcoxO+thbRN3RSNqie1GkA=;
 b=dquF7gRGzhE5q8kic1aMnWzgS9I4VVucTlpXLV4iNmkP7flm70JnbadDxR6e+9VsF+Yx
 +wYYFZBpDQbqVz3M7WjQwg18MVwnXE7QfXqlsggVDy8orT4mbCh+3oiWVD5TfU5mB8qG
 EKrY8kCFirH4HrBDi68HP5PtvZ9Intx1v9AqOna7SpnsWDWNGdazQ7Tdjw47ilTFZtk7
 L6DRlpJLHD5rM5eI7tTfNR4ZQygoFWBvjG+ucYCPht269kNpUnRN4zmLn4qZC/BQkBD0
 XhvbyeMCbkkbfr9Z7z26Rdzk3405F8MpnF2MWvTZleVAKtGuy4NqzXbs9vTtnWQ5DdRr 8A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p520t7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:49 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3QmY3006594; 
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3pyn0mbucn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3Qm3S006580;
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33K3Ql4f006569
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 1165F6A2; Wed, 19 Apr 2023 20:26:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 09/11] Hexagon (target/hexagon) Remove unused slot variable in
 helpers
Date: Wed, 19 Apr 2023 20:26:32 -0700
Message-Id: <20230420032634.105311-10-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420032634.105311-1-tsimpson@quicinc.com>
References: <20230420032634.105311-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9TZ_cMq1q4hl4T6B4OSDmj7ELk6Dp3Nz
X-Proofpoint-GUID: 9TZ_cMq1q4hl4T6B4OSDmj7ELk6Dp3Nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=531 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200025
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

VGhlIHNsb3QgdmFyaWFibGUgaW4gaGVscGVycyB3YXMgb25seSBwYXNzZWQgdG8gbG9nX3JlZ193
cml0ZSBmdW5jdGlvbgp3aGVyZSB0aGUgYXJndW1lbnQgaXMgdW51c2VkLgotIFJlbW92ZSBkZWNs
YXJhdGlvbiBmcm9tIGdlbmVyYXRlZCBoZWxwZXIgZnVuY3Rpb25zCi0gUmVtb3ZlIHNsb3QgYXJn
dW1lbnQgZnJvbSBsb2dfcmVnX3dyaXRlCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIwMjMwNDA3MjA0NTIxLjM1
NzI0NC0xLXRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5o
ICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVy
LmggICAgICAgICB8ICAyICstCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgIHwg
IDIgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkgfCAgMiAtLQogNCBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXgg
MjFiNWI1YTA2Yy4uOWRkZmM5MWIxZCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKQEAgLTM0Nyw5ICszNDcsOSBAQCBzdGF0
aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2YWwsIGludCBz
aGlmdCkKIAogI2RlZmluZSBmUkVBRF9MUigpIChlbnYtPmdwcltIRVhfUkVHX0xSXSkKIAotI2Rl
ZmluZSBmV1JJVEVfTFIoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTFIsIEEsIHNsb3Qp
Ci0jZGVmaW5lIGZXUklURV9GUChBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19GUCwgQSwg
c2xvdCkKLSNkZWZpbmUgZldSSVRFX1NQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX1NQ
LCBBLCBzbG90KQorI2RlZmluZSBmV1JJVEVfTFIoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9S
RUdfTFIsIEEpCisjZGVmaW5lIGZXUklURV9GUChBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JF
R19GUCwgQSkKKyNkZWZpbmUgZldSSVRFX1NQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVH
X1NQLCBBKQogCiAjZGVmaW5lIGZSRUFEX1NQKCkgKGVudi0+Z3ByW0hFWF9SRUdfU1BdKQogI2Rl
ZmluZSBmUkVBRF9MQzAgKGVudi0+Z3ByW0hFWF9SRUdfTEMwXSkKQEAgLTM3NywxMyArMzc3LDEz
IEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVzdWx0LCBUQ0d2IHZh
bCwgaW50IHNoaWZ0KQogI2RlZmluZSBmSElOVEpSKFRBUkdFVCkgeyAvKiBOb3QgbW9kZWxsZWQg
aW4gcWVtdSAqL30KICNkZWZpbmUgZldSSVRFX0xPT1BfUkVHUzAoU1RBUlQsIENPVU5UKSBcCiAg
ICAgZG8geyBcCi0gICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX0xDMCwgQ09VTlQs
IHNsb3QpOyAgXAotICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19TQTAsIFNUQVJU
LCBzbG90KTsgXAorICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19MQzAsIENPVU5U
KTsgIFwKKyAgICAgICAgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfU0EwLCBTVEFSVCk7IFwK
ICAgICB9IHdoaWxlICgwKQogI2RlZmluZSBmV1JJVEVfTE9PUF9SRUdTMShTVEFSVCwgQ09VTlQp
IFwKICAgICBkbyB7IFwKLSAgICAgICAgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTEMxLCBD
T1VOVCwgc2xvdCk7ICBcCi0gICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX1NBMSwg
U1RBUlQsIHNsb3QpO1wKKyAgICAgICAgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTEMxLCBD
T1VOVCk7ICBcCisgICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX1NBMSwgU1RBUlQp
O1wKICAgICB9IHdoaWxlICgwKQogCiAjZGVmaW5lIGZTRVRfT1ZFUkZMT1coKSBTRVRfVVNSX0ZJ
RUxEKFVTUl9PVkYsIDEpCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuaCBi
L3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5oCmluZGV4IDM0YjNhNTM5NzUuLmRiMjJiNTQ0MDEg
MTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5oCisrKyBiL3RhcmdldC9oZXhh
Z29uL29wX2hlbHBlci5oCkBAIC0yNyw3ICsyNyw3IEBAIHVpbnQzMl90IG1lbV9sb2FkNChDUFVI
ZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCwgdGFyZ2V0X3Vsb25nIHZhZGRyKTsKIHVp
bnQ2NF90IG1lbV9sb2FkOChDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDMyX3Qgc2xvdCwgdGFy
Z2V0X3Vsb25nIHZhZGRyKTsKIAogdm9pZCBsb2dfcmVnX3dyaXRlKENQVUhleGFnb25TdGF0ZSAq
ZW52LCBpbnQgcm51bSwKLSAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsLCB1aW50
MzJfdCBzbG90KTsKKyAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsKTsKIHZvaWQg
bG9nX3N0b3JlNjQoQ1BVSGV4YWdvblN0YXRlICplbnYsIHRhcmdldF91bG9uZyBhZGRyLAogICAg
ICAgICAgICAgICAgICBpbnQ2NF90IHZhbCwgaW50IHdpZHRoLCBpbnQgc2xvdCk7CiB2b2lkIGxv
Z19zdG9yZTMyKENQVUhleGFnb25TdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgYWRkciwKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVs
cGVyLmMKaW5kZXggMDk5YzExMWE4Yy4uM2NjNzFiNjlkOSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTUz
LDcgKzUzLDcgQEAgR19OT1JFVFVSTiB2b2lkIEhFTFBFUihyYWlzZV9leGNlcHRpb24pKENQVUhl
eGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBleGNwKQogfQogCiB2b2lkIGxvZ19yZWdfd3JpdGUo
Q1BVSGV4YWdvblN0YXRlICplbnYsIGludCBybnVtLAotICAgICAgICAgICAgICAgICAgIHRhcmdl
dF91bG9uZyB2YWwsIHVpbnQzMl90IHNsb3QpCisgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vs
b25nIHZhbCkKIHsKICAgICBIRVhfREVCVUdfTE9HKCJsb2dfcmVnX3dyaXRlWyVkXSA9ICIgVEFS
R0VUX0ZNVF9sZCAiICgweCIgVEFSR0VUX0ZNVF9seCAiKSIsCiAgICAgICAgICAgICAgICAgICBy
bnVtLCB2YWwsIHZhbCk7CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX2Z1
bmNzLnB5IGIvdGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9mdW5jcy5weQppbmRleCBjNGUwNDUw
OGY4Li5jNzNkNzkyNTgwIDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX2Z1
bmNzLnB5CisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkKQEAgLTMwOCw4
ICszMDgsNiBAQCBkZWYgZ2VuX2hlbHBlcl9mdW5jdGlvbihmLCB0YWcsIHRhZ3JlZ3MsIHRhZ2lt
bXMpOgogICAgICAgICAgICAgICAgIGYud3JpdGUoIiwgIikKICAgICAgICAgICAgIGYud3JpdGUo
InVpbnQzMl90IHBhcnQxIikKICAgICAgICAgZi53cml0ZSgiKVxue1xuIikKLSAgICAgICAgaWYg
bm90IGhleF9jb21tb24ubmVlZF9zbG90KHRhZyk6Ci0gICAgICAgICAgICBmLndyaXRlKCIgICAg
dWludDMyX3Qgc2xvdCBfX2F0dHJpYnV0ZV9fKCh1bnVzZWQpKSA9IDQ7XG4iKQogICAgICAgICBp
ZiBoZXhfY29tbW9uLm5lZWRfZWEodGFnKToKICAgICAgICAgICAgIGdlbl9kZWNsX2VhKGYpCiAg
ICAgICAgICMjIERlY2xhcmUgdGhlIHJldHVybiB2YXJpYWJsZQotLSAKMi4yNS4xCgo=

