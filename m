Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B616E88BD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:29:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKwt-0003he-GS; Wed, 19 Apr 2023 23:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwl-0003ga-P3
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:27:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwh-0000IZ-AJ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:59 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K3LW74012703; Thu, 20 Apr 2023 03:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=xotbfyCBuuRf+i6WDqpeTi+JrDKBex0SCLYtR5duzEo=;
 b=WRS7iZ+Ms/2C2xLlzzgnp3iZqAKJCLiOdTEPwsE5nXgC1FvoWP9dvUWRvV9YNubXpnk7
 RkIgIM5JaqtAdCNnM50qag50Tl/kfd94HRq9udosFZJytJ9l0Jq82LJqP3ZUjtNSRL3X
 lBfbAStSMDKMXb03Y6Bw/5J5klXUPkrYUoDmz8bwrfM8uXMl2agpvOiPELUwCMjQayiX
 LbqjP0OmgMEuchElahbIuaFGJUxNffZBB8NYWOopNHv5AMrkGuE5NJub1Suo4hHjbav9
 W1g3LJh6YP3HA2QaCyPeuUmuKb1bcVaCOmsvRhDkQ5yePCAL/0yusd8LYkOMZ781HZ4F yw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p520t7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:49 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3QmoE018914; 
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3pyn0mktbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3PcbY018001;
 Thu, 20 Apr 2023 03:26:47 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33K3Ql3k018895
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:47 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id EE2CA587; Wed, 19 Apr 2023 20:26:46 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 00/11] Hexagon queue
Date: Wed, 19 Apr 2023 20:26:23 -0700
Message-Id: <20230420032634.105311-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: CKsU0VANVTKDDZs23roVQDQnZ6u18Ebk
X-Proofpoint-GUID: CKsU0VANVTKDDZs23roVQDQnZ6u18Ebk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=497 malwarescore=0
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2MGNhNTg0YjhhZjBkZTUyNTY1NmY5
NTk5OTFhNDQwZjhjMTkxZjEyOgoKICBNZXJnZSB0YWcgJ3B1bGwtZm9yLTguMC0yMjAzMjMtMScg
b2YgaHR0cHM6Ly9naXRsYWIuY29tL3N0c3F1YWQvcWVtdSBpbnRvIHN0YWdpbmcgKDIwMjMtMDMt
MjIgMTc6NTg6MTIgKzAwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIwMjMwNDE5
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDczZGU4Y2FhOGY5MDEzYjRkZDg2MTNk
ZjI5ZDE1ZDdjNDJhYThmNDoKCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZGl0aW9uYWwg
aW5zdHJ1Y3Rpb25zIGhhbmRsZWQgYnkgaWRlZi1wYXJzZXIgKDIwMjMtMDQtMTkgMjA6MTM6MjAg
LTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkhleGFnb24gdXBkYXRlCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hcmNvIExpZWJlbCAoMik6
CiAgICAgIFVzZSBmLXN0cmluZ3MgaW4gcHl0aG9uIHNjcmlwdHMKICAgICAgVXNlIGJsYWNrIGNv
ZGUgc3R5bGUgZm9yIHB5dGhvbiBzY3JpcHRzCgpNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyAo
MSk6CiAgICAgIEhleGFnb24gKHRyYW5zbGF0ZS5jKTogYXZvaWQgcmVkdW5kYW50IFBDIHVwZGF0
ZXMgb24gQ09GCgpUYXlsb3IgU2ltcHNvbiAoOCk6CiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uKSBSZW1vdmUgcmVkdW5kYW50L3VudXNlZCBtYWNyb3MKICAgICAgSGV4YWdvbiAodGFyZ2V0
L2hleGFnb24pIE1lcmdlIGFyZ3VtZW50cyB0byBwcm9iZV9wa3Rfc2NhbGFyX2h2eF9zdG9yZXMK
ICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGNvdW50IHRy
YWlsaW5nIHplcm9zL29uZXMKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFVwZGF0ZXMg
dG8gVVNSIHNob3VsZCB1c2UgZ2V0X3Jlc3VsdF9ncHIKICAgICAgSGV4YWdvbiAodGVzdHMvdGNn
L2hleGFnb24pIE1vdmUgSFZYIHRlc3QgaW5mcmEgdG8gaGVhZGVyIGZpbGUKICAgICAgSGV4YWdv
biAodGFyZ2V0L2hleGFnb24pIFJlbW92ZSB1bnVzZWQgc2xvdCB2YXJpYWJsZSBpbiBoZWxwZXJz
CiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBjYWNoZS9z
eW5jL2JhcnJpZXIgaW5zdHJ1Y3Rpb25zCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBB
ZGRpdGlvbmFsIGluc3RydWN0aW9ucyBoYW5kbGVkIGJ5IGlkZWYtcGFyc2VyCgogdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICAgICB8ICA1MiArLQogdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmggICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQogdGFyZ2V0L2hleGFnb24v
aGVscGVyLmggICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogdGFyZ2V0L2hleGFnb24vbWFj
cm9zLmggICAgICAgICAgICAgICAgICAgICB8ICA5MSArLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9o
ZWxwZXIuaCAgICAgICAgICAgICAgICAgIHwgICAyICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuaCAgICAgICAgICAgICAgICAgIHwgICAxICsKIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNj
LmggICAgICAgICAgICAgICAgfCAxNzggKysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMg
ICAgICAgICAgICAgICAgICAgICB8ICA0OSArLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIv
cGFyc2VyLWhlbHBlcnMuYyB8ICAyMSArLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgICAg
ICAgICAgICAgICAgICB8ICAgNiArLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAg
ICAgICAgICAgICB8ICAzMSArLQogdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jICAgICAgICAg
ICAgICAgICB8ICA1NCArKysKIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMgICAgICAgICAg
ICAgICAgfCAxNjAgKy0tLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDU2ICsrLQogdGFyZ2V0L2hleGFnb24vZGVjdHJlZS5weSAgICAgICAgICAgICAg
ICAgICB8IDM5NiArKysrKysrKy0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1
bmNzLnB5ICAgICAgICAgfCAyMjYgKysrKy0tLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVy
X2Z1bmNzLnB5ICAgICAgICAgIHwgMzYyICsrKysrKysrLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9n
ZW5faGVscGVyX3Byb3Rvcy5weSAgICAgICAgIHwgMTY5ICsrKystLS0KIHRhcmdldC9oZXhhZ29u
L2dlbl9pZGVmX3BhcnNlcl9mdW5jcy5weSAgICAgfCAgOTMgKystLQogdGFyZ2V0L2hleGFnb24v
Z2VuX29wX2F0dHJpYnMucHkgICAgICAgICAgICB8ICAxMiArLQogdGFyZ2V0L2hleGFnb24vZ2Vu
X29wX3JlZ3MucHkgICAgICAgICAgICAgICB8ICA3OSArLS0KIHRhcmdldC9oZXhhZ29uL2dlbl9v
cGNvZGVzX2RlZi5weSAgICAgICAgICAgfCAgIDggKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9wcmlu
dGluc24ucHkgICAgICAgICAgICAgfCAgODQgKystLQogdGFyZ2V0L2hleGFnb24vZ2VuX3Nob3J0
Y29kZS5weSAgICAgICAgICAgICB8ICAxOSArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5j
X3RhYmxlLnB5ICAgICAgICB8ICAxOCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5w
eSAgICAgICAgICAgICB8IDcyOSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB0YXJnZXQv
aGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICAgICAgICAgIHwgMTgxICsrKystLS0KIHRhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkgICAgfCAgIDIgKy0KIHRlc3RzL3Rj
Zy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCAgICAgICAgICAgfCAgIDEgKwogMjkgZmlsZXMgY2hh
bmdlZCwgMTczNSBpbnNlcnRpb25zKCspLCAxMzU5IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmgK

