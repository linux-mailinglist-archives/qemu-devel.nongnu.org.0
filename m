Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546816D8608
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 20:32:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk7uj-0001tj-Rd; Wed, 05 Apr 2023 14:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk7uh-0001sa-9R
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:31:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pk7ue-0000no-VF
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 14:31:18 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335HUdMV025868; Wed, 5 Apr 2023 18:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=R+SuZrPR6LbNiE7ywi0/ayBHOilhQVC4NHZvrhy/4+o=;
 b=D7cyp5hts6LgbQqlWW2jGUEbgtH4YXClQE7ulIwvMloWTxRczaayujbQQB+xxtjlhWWc
 8C6TQcQhrvuuR2OZpzyQMN+FhFaiVyIxaFb1F2c3L/8ef3o1OApb819bkzuumnyfMj8V
 r6JRI17pi04FolYT0n1z3yrNdTLN3Sixs7roiIoHdvNcDxzzaWXdwfvU31cEIyI/Y1Ux
 WBZENc38a12Jw8bMaYIaAjopd+Ls+Xf6HOt1xxhdWKC5SMYG3L9LFwzXlnAHtWsfsFd2
 XDaLuMdIAI4Tt46qZ47yQT5TO1gGs6eJ4/kgfZTSx7k7ji4AbefopJaXhzmW9M/O0FbG 4g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prmkmuu6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 18:31:14 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 335IUWgu017168; 
 Wed, 5 Apr 2023 18:30:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3ppdpm0n48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 18:30:54 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 335IUWGa017176;
 Wed, 5 Apr 2023 18:30:54 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 335IUrKx017348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 18:30:54 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 7435C68F; Wed,  5 Apr 2023 11:30:53 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Remove redundant/unused macros
Date: Wed,  5 Apr 2023 11:30:48 -0700
Message-Id: <20230405183048.147767-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ji5Owi0pluc12rwPDTIcLPylmGnzghQB
X-Proofpoint-ORIG-GUID: Ji5Owi0pluc12rwPDTIcLPylmGnzghQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_13,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=476 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050166
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

UmVtb3ZlIHRoZSBmb2xsb3dpbmcgbWFjcm9zIChyZW1uYW50cyBvZiB0aGUgb2xkIGdlbmVyYXRv
ciBkZXNpZ24pCiAgICBSRUFEX1JFRwogICAgUkVBRF9QUkVHCiAgICBXUklURV9SUkVHCiAgICBX
UklURV9QUkVHCk1vZGlmeSBtYWNyb3MgdGhhdCByZWx5IG9uIHRoZSBhYm92ZQoKVGhlIGZvbGxv
d2luZyBhcmUgdW51c2VkCiAgICBSRUFEX0lSRUcKICAgIGZHRVRfRklFTEQKICAgIGZTRVRfRklF
TEQKICAgIGZSRUFEX1AzCiAgICBmUkVBRF9OUEMKICAgIGZXUklURV9MQzAKICAgIGZXUklURV9M
QzEKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4K
LS0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCB8IDY1ICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJn
ZXQvaGV4YWdvbi9tYWNyb3MuaAppbmRleCA0ODJhOWM3ODdmLi5mNWYzMWI2OTMwIDEwMDY0NAot
LS0gYS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3Mu
aApAQCAtMjIsMTYgKzIyLDYgQEAKICNpbmNsdWRlICJoZXhfcmVncy5oIgogI2luY2x1ZGUgInJl
Z19maWVsZHMuaCIKIAotI2lmZGVmIFFFTVVfR0VORVJBVEUKLSNkZWZpbmUgUkVBRF9SRUcoZGVz
dCwgTlVNKSAgICAgICAgICAgICAgZ2VuX3JlYWRfcmVnKGRlc3QsIE5VTSkKLSNlbHNlCi0jZGVm
aW5lIFJFQURfUkVHKE5VTSkgICAgICAgICAgICAgICAgICAgIChlbnYtPmdwclsoTlVNKV0pCi0j
ZGVmaW5lIFJFQURfUFJFRyhOVU0pICAgICAgICAgICAgICAgICAgIChlbnYtPnByZWRbTlVNXSkK
LQotI2RlZmluZSBXUklURV9SUkVHKE5VTSwgVkFMKSAgICAgICAgICAgICBsb2dfcmVnX3dyaXRl
KGVudiwgTlVNLCBWQUwsIHNsb3QpCi0jZGVmaW5lIFdSSVRFX1BSRUcoTlVNLCBWQUwpICAgICAg
ICAgICAgIGxvZ19wcmVkX3dyaXRlKGVudiwgTlVNLCBWQUwpCi0jZW5kaWYKLQogI2RlZmluZSBQ
Q0FMSUdOIDQKICNkZWZpbmUgUENBTElHTl9NQVNLIChQQ0FMSUdOIC0gMSkKIApAQCAtMzYxLDM3
ICszNTEsMzAgQEAgc3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFkX2lyZWcoVENHdiByZXN1bHQs
IFRDR3YgdmFsLCBpbnQgc2hpZnQpCiAgICAgdGNnX2dlbl9zaGxpX3RsKHJlc3VsdCwgcmVzdWx0
LCBzaGlmdCk7CiAgICAgcmV0dXJuIHJlc3VsdDsKIH0KLSNkZWZpbmUgZlJFQURfSVJFRyhWQUws
IFNISUZUKSBnZW5fcmVhZF9pcmVnKGlyZWcsIChWQUwpLCAoU0hJRlQpKQotI2Vsc2UKLSNkZWZp
bmUgZlJFQURfSVJFRyhWQUwpIFwKLSAgICAoZlNYVE4oMTEsIDY0LCAoKChWQUwpICYgMHhmMDAw
MDAwMCkgPj4gMjEpIHwgKChWQUwgPj4gMTcpICYgMHg3ZikpKQogI2VuZGlmCiAKLSNkZWZpbmUg
ZlJFQURfTFIoKSAoUkVBRF9SRUcoSEVYX1JFR19MUikpCisjZGVmaW5lIGZSRUFEX0xSKCkgKGVu
di0+Z3ByW0hFWF9SRUdfTFJdKQogCi0jZGVmaW5lIGZXUklURV9MUihBKSBXUklURV9SUkVHKEhF
WF9SRUdfTFIsIEEpCi0jZGVmaW5lIGZXUklURV9GUChBKSBXUklURV9SUkVHKEhFWF9SRUdfRlAs
IEEpCi0jZGVmaW5lIGZXUklURV9TUChBKSBXUklURV9SUkVHKEhFWF9SRUdfU1AsIEEpCisjZGVm
aW5lIGZXUklURV9MUihBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19MUiwgQSwgc2xvdCkK
KyNkZWZpbmUgZldSSVRFX0ZQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX0ZQLCBBLCBz
bG90KQorI2RlZmluZSBmV1JJVEVfU1AoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfU1As
IEEsIHNsb3QpCiAKLSNkZWZpbmUgZlJFQURfU1AoKSAoUkVBRF9SRUcoSEVYX1JFR19TUCkpCi0j
ZGVmaW5lIGZSRUFEX0xDMCAoUkVBRF9SRUcoSEVYX1JFR19MQzApKQotI2RlZmluZSBmUkVBRF9M
QzEgKFJFQURfUkVHKEhFWF9SRUdfTEMxKSkKLSNkZWZpbmUgZlJFQURfU0EwIChSRUFEX1JFRyhI
RVhfUkVHX1NBMCkpCi0jZGVmaW5lIGZSRUFEX1NBMSAoUkVBRF9SRUcoSEVYX1JFR19TQTEpKQot
I2RlZmluZSBmUkVBRF9GUCgpIChSRUFEX1JFRyhIRVhfUkVHX0ZQKSkKKyNkZWZpbmUgZlJFQURf
U1AoKSAoZW52LT5ncHJbSEVYX1JFR19TUF0pCisjZGVmaW5lIGZSRUFEX0xDMCAoZW52LT5ncHJb
SEVYX1JFR19MQzBdKQorI2RlZmluZSBmUkVBRF9MQzEgKGVudi0+Z3ByW0hFWF9SRUdfTEMxXSkK
KyNkZWZpbmUgZlJFQURfU0EwIChlbnYtPmdwcltIRVhfUkVHX1NBMF0pCisjZGVmaW5lIGZSRUFE
X1NBMSAoZW52LT5ncHJbSEVYX1JFR19TQTFdKQorI2RlZmluZSBmUkVBRF9GUCgpIChlbnYtPmdw
cltIRVhfUkVHX0ZQXSkKICNpZmRlZiBGSVhNRQogLyogRmlndXJlIG91dCBob3cgdG8gZ2V0IGlu
c24tPmV4dGVuc2lvbl92YWxpZCB0byBoZWxwZXIgKi8KICNkZWZpbmUgZlJFQURfR1AoKSBcCi0g
ICAgKGluc24tPmV4dGVuc2lvbl92YWxpZCA/IDAgOiBSRUFEX1JFRyhIRVhfUkVHX0dQKSkKKyAg
ICAoaW5zbi0+ZXh0ZW5zaW9uX3ZhbGlkID8gMCA6IGVudi0+Z3ByW0hFWF9SRUdfR1BdKQogI2Vs
c2UKLSNkZWZpbmUgZlJFQURfR1AoKSBSRUFEX1JFRyhIRVhfUkVHX0dQKQorI2RlZmluZSBmUkVB
RF9HUCgpIChlbnYtPmdwcltIRVhfUkVHX0dQXSkKICNlbmRpZgogI2RlZmluZSBmUkVBRF9QQygp
IChQQykKIAotI2RlZmluZSBmUkVBRF9OUEMoKSAobmV4dF9QQyAmICgweGZmZmZmZmZlKSkKLQot
I2RlZmluZSBmUkVBRF9QMCgpIChSRUFEX1BSRUcoMCkpCi0jZGVmaW5lIGZSRUFEX1AzKCkgKFJF
QURfUFJFRygzKSkKKyNkZWZpbmUgZlJFQURfUDAoKSAoZW52LT5wcmVkWzBdKQogCiAjZGVmaW5l
IGZDSEVDS19QQ0FMSUdOKEEpCiAKQEAgLTQwMiwyNCArMzg1LDIyIEBAIHN0YXRpYyBpbmxpbmUg
VENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVzdWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogI2Rl
ZmluZSBmSElOVEpSKFRBUkdFVCkgeyAvKiBOb3QgbW9kZWxsZWQgaW4gcWVtdSAqL30KICNkZWZp
bmUgZldSSVRFX0xPT1BfUkVHUzAoU1RBUlQsIENPVU5UKSBcCiAgICAgZG8geyBcCi0gICAgICAg
IFdSSVRFX1JSRUcoSEVYX1JFR19MQzAsIENPVU5UKTsgIFwKLSAgICAgICAgV1JJVEVfUlJFRyhI
RVhfUkVHX1NBMCwgU1RBUlQpOyBcCisgICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVH
X0xDMCwgQ09VTlQsIHNsb3QpOyAgXAorICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JF
R19TQTAsIFNUQVJULCBzbG90KTsgXAogICAgIH0gd2hpbGUgKDApCiAjZGVmaW5lIGZXUklURV9M
T09QX1JFR1MxKFNUQVJULCBDT1VOVCkgXAogICAgIGRvIHsgXAotICAgICAgICBXUklURV9SUkVH
KEhFWF9SRUdfTEMxLCBDT1VOVCk7ICBcCi0gICAgICAgIFdSSVRFX1JSRUcoSEVYX1JFR19TQTEs
IFNUQVJUKTtcCisgICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX0xDMSwgQ09VTlQs
IHNsb3QpOyAgXAorICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19TQTEsIFNUQVJU
LCBzbG90KTtcCiAgICAgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZldSSVRFX0xDMChWQUwpIFdSSVRF
X1JSRUcoSEVYX1JFR19MQzAsIFZBTCkKLSNkZWZpbmUgZldSSVRFX0xDMShWQUwpIFdSSVRFX1JS
RUcoSEVYX1JFR19MQzEsIFZBTCkKIAogI2RlZmluZSBmU0VUX09WRVJGTE9XKCkgU0VUX1VTUl9G
SUVMRChVU1JfT1ZGLCAxKQogI2RlZmluZSBmU0VUX0xQQ0ZHKFZBTCkgU0VUX1VTUl9GSUVMRChV
U1JfTFBDRkcsIChWQUwpKQogI2RlZmluZSBmR0VUX0xQQ0ZHIChHRVRfVVNSX0ZJRUxEKFVTUl9M
UENGRykpCi0jZGVmaW5lIGZXUklURV9QMChWQUwpIFdSSVRFX1BSRUcoMCwgVkFMKQotI2RlZmlu
ZSBmV1JJVEVfUDEoVkFMKSBXUklURV9QUkVHKDEsIFZBTCkKLSNkZWZpbmUgZldSSVRFX1AyKFZB
TCkgV1JJVEVfUFJFRygyLCBWQUwpCi0jZGVmaW5lIGZXUklURV9QMyhWQUwpIFdSSVRFX1BSRUco
MywgVkFMKQorI2RlZmluZSBmV1JJVEVfUDAoVkFMKSBsb2dfcHJlZF93cml0ZShlbnYsIDAsIFZB
TCkKKyNkZWZpbmUgZldSSVRFX1AxKFZBTCkgbG9nX3ByZWRfd3JpdGUoZW52LCAxLCBWQUwpCisj
ZGVmaW5lIGZXUklURV9QMihWQUwpIGxvZ19wcmVkX3dyaXRlKGVudiwgMiwgVkFMKQorI2RlZmlu
ZSBmV1JJVEVfUDMoVkFMKSBsb2dfcHJlZF93cml0ZShlbnYsIDMsIFZBTCkKICNkZWZpbmUgZlBB
UlQxKFdPUkspIGlmIChwYXJ0MSkgeyBXT1JLOyByZXR1cm47IH0KICNkZWZpbmUgZkNBU1Q0dShB
KSAoKHVpbnQzMl90KShBKSkKICNkZWZpbmUgZkNBU1Q0cyhBKSAoKGludDMyX3QpKEEpKQpAQCAt
NTc2LDcgKzU1Nyw3IEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVz
dWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogCiAjZGVmaW5lIGZNRU1PUChOVU0sIFNJWkUsIFNJ
R04sIEVBLCBGTlRZUEUsIFZBTFVFKQogCi0jZGVmaW5lIGZHRVRfRlJBTUVLRVkoKSBSRUFEX1JF
RyhIRVhfUkVHX0ZSQU1FS0VZKQorI2RlZmluZSBmR0VUX0ZSQU1FS0VZKCkgKGVudi0+Z3ByW0hF
WF9SRUdfRlJBTUVLRVldKQogI2RlZmluZSBmRlJBTUVfU0NSQU1CTEUoVkFMKSAoKFZBTCkgXiAo
ZkNBU1Q4dShmR0VUX0ZSQU1FS0VZKCkpIDw8IDMyKSkKICNkZWZpbmUgZkZSQU1FX1VOU0NSQU1C
TEUoVkFMKSBmRlJBTUVfU0NSQU1CTEUoVkFMKQogCkBAIC02ODYsOCArNjY3LDYgQEAgc3RhdGlj
IGlubGluZSBUQ0d2IGdlbl9yZWFkX2lyZWcoVENHdiByZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hp
ZnQpCiAgICAgZkVYVFJBQ1RVX0JJVFMoZW52LT5ncHJbSEVYX1JFR18jI1JFR10sIFwKICAgICAg
ICAgICAgICAgICAgICByZWdfZmllbGRfaW5mb1tGSUVMRF0ud2lkdGgsIFwKICAgICAgICAgICAg
ICAgICAgICByZWdfZmllbGRfaW5mb1tGSUVMRF0ub2Zmc2V0KQotI2RlZmluZSBmR0VUX0ZJRUxE
KFZBTCwgRklFTEQpCi0jZGVmaW5lIGZTRVRfRklFTEQoVkFMLCBGSUVMRCwgTkVXVkFMKQogI2Rl
ZmluZSBmQkFSUklFUigpCiAjZGVmaW5lIGZTWU5DSCgpCiAjZGVmaW5lIGZJU1lOQygpCi0tIAoy
LjI1LjEKCg==

