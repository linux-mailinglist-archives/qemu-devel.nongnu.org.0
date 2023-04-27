Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CD6F0E63
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 00:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAIc-0001uB-DL; Thu, 27 Apr 2023 18:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIY-0001sv-Pi
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIU-0005M9-Bd
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:10 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMVCLY027383; Thu, 27 Apr 2023 22:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=r2m5doEhNQiyAm3rQsANP0eNKyYO9f1xPJ2sUZkyYHs=;
 b=Zv2mJHeMTEojQvEyPLmf+1vAoHNiSPo0enFuNazUrWprCGI094Co1/GEZq5BEtASriax
 l77fXrOHDLfvL0QaMNNZpZafwFZ3Qr2vy1LvWHhvZ7dRTf8AYeM1m6X+I2OVa98pkGVE
 hCPIdzxtQ31dvi9zGqMUE837y5s7keHBovhrSKwvoFguM2DVeRssgVhP8NXPHEy63KXo
 WC2FWNFGBLxAM/s+fpYu6FXKvlrYwRtlbhpvmXDP5yt54sP5HPycRIKWbLuwkATUoPaG
 rNcVSNO/QIAvNmFdDZlcXTD9mWZbKKcl6PEyqqvpa81qXJkPIqcB85yHLwNZnhgoGlC+ OQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7wq88fvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMeWmD027165; 
 Thu, 27 Apr 2023 22:41:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q48nmj5ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:00 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RMf0Bi027707;
 Thu, 27 Apr 2023 22:41:00 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33RMexPY027694
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:00 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C91DE5A5; Thu, 27 Apr 2023 15:40:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Date: Thu, 27 Apr 2023 15:40:48 -0700
Message-Id: <20230427224057.3766963-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: gHToVQihNNcFnJZncEeg8D8PnhMGAzNZ
X-Proofpoint-ORIG-GUID: gHToVQihNNcFnJZncEeg8D8PnhMGAzNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=716
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270199
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

QWRkIHN1cHBvcnQgZm9yIG5ldyBIZXhhZ29uIGFyY2hpdGVjdHVyZSB2ZXJzaW9ucyB2NjgvdjY5
L3Y3MS92NzMKCioqKiogQ2hhbmdlcyBpbiB2MiAqKioqCkFkZHJlc3MgZmVlZGJhY2sgZnJvbSBB
bnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPgogICAgUmVuYW1lIHY2bXB5X3JlZi5oIHRvIHY2
bXB5X3JlZi5jLmluYwogICAgU2hvcnRlbiBmb3JtYXQgb2YgaGV4YWdvbl92Kl9jcHVfaW5pdF9m
dW5jdGlvbnMKICAgIENoYW5nZSBsb29wIGNvdW50cyBNQVhfVkVDX1NJWkVfQllURVMgLyAyIHRv
IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQKCgoKVGF5bG9yIFNpbXBzb24gKDkpOgogIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSBBZGQgc3VwcG9ydCBmb3IgdjY4L3Y2OS92NzEvdjczCiAgSGV4YWdv
biAodGFyZ2V0L2hleGFnb24pIEFkZCB2Njggc2NhbGFyIGluc3RydWN0aW9ucwogIEhleGFnb24g
KHRlc3RzL3RjZy9oZXhhZ29uKSBBZGQgdjY4IHNjYWxhciB0ZXN0cwogIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBBZGQgdjY4IEhWWCBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0ZXN0cy90Y2cv
aGV4YWdvbikgQWRkIHY2OCBIVlggdGVzdHMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRk
IHY2OSBIVlggaW5zdHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIEFkZCB2
NjkgSFZYIHRlc3RzCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCB2NzMgc2NhbGFyIGlu
c3RydWN0aW9ucwogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBBZGQgdjczIHNjYWxhciB0
ZXN0cwoKIGNvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICstCiBsaW51eC11c2VyL2hleGFnb24vdGFyZ2V0X2VsZi5oICAgICAgICAgICAgICB8ICAxMyAr
LQogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwog
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICAgICAgfCAgMjIgKysKIHRh
cmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggICAgICAgICAgICAgICAgIHwgIDEyICsKIHRhcmdl
dC9oZXhhZ29uL21tdmVjL21hY3Jvcy5oICAgICAgICAgICAgICAgIHwgICA5ICstCiB0YXJnZXQv
aGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyAgICAgICAgICAgICB8ICAxNiArCiB0YXJnZXQvaGV4
YWdvbi9jcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArLQogdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogdGVzdHMvdGNnL2hleGFn
b24vbWlzYy5jICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKwogdGVzdHMvdGNnL2hleGFnb24v
djY4X2h2eC5jICAgICAgICAgICAgICAgICAgfCAgOTAgKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdv
bi92Njhfc2NhbGFyLmMgICAgICAgICAgICAgICB8IDE4NiArKysrKysrKysrKwogdGVzdHMvdGNn
L2hleGFnb24vdjY5X2h2eC5jICAgICAgICAgICAgICAgICAgfCAzMTggKysrKysrKysrKysrKysr
KysrCiB0ZXN0cy90Y2cvaGV4YWdvbi92NzNfc2NhbGFyLmMgICAgICAgICAgICAgICB8ICA5NiAr
KysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL3Y2bXB5X3JlZi5jLmluYyAgICAgICAgICAgIHwgMTYx
ICsrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weSAgICAg
IHwgICAyICsKIHRhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2JyYW5jaC5pZGVmICAgICAgICAgIHwg
ICA3ICstCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmICAgICAgICB8ICAy
MSArLQogdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvbGRzdC5pZGVmICAgICAgICAgICAgfCAgMjAg
Ky0KIHRhcmdldC9oZXhhZ29uL2ltcG9ydGVkL21tdmVjL2VuY29kZV9leHQuZGVmIHwgIDE2ICst
CiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9tbXZlYy9leHQuaWRlZiAgICAgICB8IDMyMSArKysr
KysrKysrKysrKysrKystCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgICAgICAg
ICAgICB8ICAxMyArCiAyMiBmaWxlcyBjaGFuZ2VkLCAxMzM5IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Y2OF9odngu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Y2OF9zY2FsYXIuYwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Y2OV9odnguYwogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL3RjZy9oZXhhZ29uL3Y2bXB5X3JlZi5jLmluYwoKLS0gCjIuMjUuMQoK

