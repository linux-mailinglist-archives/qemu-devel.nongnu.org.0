Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96C6DB56E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:46:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pksxo-0005ro-Bj; Fri, 07 Apr 2023 16:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pksxi-0005r6-RJ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:45:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pksxe-0004uF-TL
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:45:33 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337KXYuW009619; Fri, 7 Apr 2023 20:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=W/erd8CBZtNGhOURkIvOv6t+x3nxJRlJnYVI1d4fXNs=;
 b=E6mtiFbTalDyEuxDqnQCDRc1evgLxTIgfJhwZIDcVkeyzVR5LPZOc36R2sEIBuIHYIrp
 +GLgM1KE8IFM47xKo/ovCjwN5J903Sgs/MBaj+FohEqi2xsn8mbpzWs1WKv/Lm47EHDq
 YRV6eSHzhdhH+91jMmzKZgIUN+dDnrok8ejORPhHmGehJjDmFWlEhcw8q0ONB9AzEwAW
 DQ7lm42opbCDhLofWVl6LiHFDepHH4qSsDMd1Xx14Olp+Nb/np5Uht2nwRyluiKr6ug0
 2ccbruMuH+A+FS9FfY3YNe4K8ek53SQzPu+0HkImGnEB+/IhaESJ2C4hOxjTq7DbeYGN eA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pt5s9tj8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:45:25 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 337KjOb7009029; 
 Fri, 7 Apr 2023 20:45:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3ppdpmdh7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:45:24 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 337KjOZX009024;
 Fri, 7 Apr 2023 20:45:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 337KjN5S009023
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 20:45:24 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A66BA586; Fri,  7 Apr 2023 13:45:23 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Remove unused slot variable in
 helpers
Date: Fri,  7 Apr 2023 13:45:21 -0700
Message-Id: <20230407204521.357244-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: uYVu4SgmsbkMY9JI20okE74ukpDt_ZG6
X-Proofpoint-ORIG-GUID: uYVu4SgmsbkMY9JI20okE74ukpDt_ZG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_13,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=474 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070187
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

VGhlIHNsb3QgdmFyaWFibGUgaW4gaGVscGVycyB3YXMgb25seSBwYXNzZWQgdG8gbG9nX3JlZ193
cml0ZSBmdW5jdGlvbgp3aGVyZSB0aGUgYXJndW1lbnQgaXMgdW51c2VkLgotIFJlbW92ZSBkZWNs
YXJhdGlvbiBmcm9tIGdlbmVyYXRlZCBoZWxwZXIgZnVuY3Rpb25zCi0gUmVtb3ZlIHNsb3QgYXJn
dW1lbnQgZnJvbSBsb2dfcmVnX3dyaXRlCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAg
ICAgICB8IDIgKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5oICAgICAgICAgfCAyICstCiB0
YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgIHwgMiArLQogdGFyZ2V0L2hleGFnb24v
Z2VuX2hlbHBlcl9mdW5jcy5weSB8IDIgLS0KIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5o
IGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggNDgyYTljNzg3Zi4uYjk3OGZkMTg0MCAx
MDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmgKQEAgLTI4LDcgKzI4LDcgQEAKICNkZWZpbmUgUkVBRF9SRUcoTlVNKSAgICAgICAg
ICAgICAgICAgICAgKGVudi0+Z3ByWyhOVU0pXSkKICNkZWZpbmUgUkVBRF9QUkVHKE5VTSkgICAg
ICAgICAgICAgICAgICAgKGVudi0+cHJlZFtOVU1dKQogCi0jZGVmaW5lIFdSSVRFX1JSRUcoTlVN
LCBWQUwpICAgICAgICAgICAgIGxvZ19yZWdfd3JpdGUoZW52LCBOVU0sIFZBTCwgc2xvdCkKKyNk
ZWZpbmUgV1JJVEVfUlJFRyhOVU0sIFZBTCkgICAgICAgICAgICAgbG9nX3JlZ193cml0ZShlbnYs
IE5VTSwgVkFMKQogI2RlZmluZSBXUklURV9QUkVHKE5VTSwgVkFMKSAgICAgICAgICAgICBsb2df
cHJlZF93cml0ZShlbnYsIE5VTSwgVkFMKQogI2VuZGlmCiAKZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5oIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmgKaW5kZXggMzRi
M2E1Mzk3NS4uZGIyMmI1NDQwMSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVy
LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmgKQEAgLTI3LDcgKzI3LDcgQEAgdWlu
dDMyX3QgbWVtX2xvYWQ0KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LCB0YXJn
ZXRfdWxvbmcgdmFkZHIpOwogdWludDY0X3QgbWVtX2xvYWQ4KENQVUhleGFnb25TdGF0ZSAqZW52
LCB1aW50MzJfdCBzbG90LCB0YXJnZXRfdWxvbmcgdmFkZHIpOwogCiB2b2lkIGxvZ19yZWdfd3Jp
dGUoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBybnVtLAotICAgICAgICAgICAgICAgICAgIHRh
cmdldF91bG9uZyB2YWwsIHVpbnQzMl90IHNsb3QpOworICAgICAgICAgICAgICAgICAgIHRhcmdl
dF91bG9uZyB2YWwpOwogdm9pZCBsb2dfc3RvcmU2NChDUFVIZXhhZ29uU3RhdGUgKmVudiwgdGFy
Z2V0X3Vsb25nIGFkZHIsCiAgICAgICAgICAgICAgICAgIGludDY0X3QgdmFsLCBpbnQgd2lkdGgs
IGludCBzbG90KTsKIHZvaWQgbG9nX3N0b3JlMzIoQ1BVSGV4YWdvblN0YXRlICplbnYsIHRhcmdl
dF91bG9uZyBhZGRyLApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90
YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRleCBjOWExNTYwMzBlLi42M2E1YjliMjAyIDEw
MDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdv
bi9vcF9oZWxwZXIuYwpAQCAtNTMsNyArNTMsNyBAQCBHX05PUkVUVVJOIHZvaWQgSEVMUEVSKHJh
aXNlX2V4Y2VwdGlvbikoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQzMl90IGV4Y3ApCiB9CiAK
IHZvaWQgbG9nX3JlZ193cml0ZShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IHJudW0sCi0gICAg
ICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhbCwgdWludDMyX3Qgc2xvdCkKKyAgICAgICAg
ICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsKQogewogICAgIEhFWF9ERUJVR19MT0coImxvZ19y
ZWdfd3JpdGVbJWRdID0gIiBUQVJHRVRfRk1UX2xkICIgKDB4IiBUQVJHRVRfRk1UX2x4ICIpIiwK
ICAgICAgICAgICAgICAgICAgIHJudW0sIHZhbCwgdmFsKTsKZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkgYi90YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX2Z1
bmNzLnB5CmluZGV4IDdhMjI0YjY2ZTYuLjZlZGQ4MmM0MjMgMTAwNzU1Ci0tLSBhL3RhcmdldC9o
ZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBl
cl9mdW5jcy5weQpAQCAtMjY1LDggKzI2NSw2IEBAIGRlZiBnZW5faGVscGVyX2Z1bmN0aW9uKGYs
IHRhZywgdGFncmVncywgdGFnaW1tcyk6CiAgICAgICAgICAgICBpZiBpID4gMDogZi53cml0ZSgi
LCAiKQogICAgICAgICAgICAgZi53cml0ZSgidWludDMyX3QgcGFydDEiKQogICAgICAgICBmLndy
aXRlKCIpXG57XG4iKQotICAgICAgICBpZiAobm90IGhleF9jb21tb24ubmVlZF9zbG90KHRhZykp
OgotICAgICAgICAgICAgZi53cml0ZSgiICAgIHVpbnQzMl90IHNsb3QgX19hdHRyaWJ1dGVfXygo
dW51c2VkKSkgPSA0O1xuIiApCiAgICAgICAgIGlmIGhleF9jb21tb24ubmVlZF9lYSh0YWcpOiBn
ZW5fZGVjbF9lYShmKQogICAgICAgICAjIyBEZWNsYXJlIHRoZSByZXR1cm4gdmFyaWFibGUKICAg
ICAgICAgaT0wCi0tIAoyLjI1LjEKCg==

