Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0E6EAF81
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:50:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptx6-0005vY-Vx; Fri, 21 Apr 2023 12:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptx2-0005sj-Fk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptwy-000440-N8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:36 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LETPgI001223; Fri, 21 Apr 2023 16:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=mbVjADE5RprrjLDBNLUCuW7CKGS42ZxLrlRcWotuIfc=;
 b=bMLQjuA5FyOZY7wy6it6dgYnRVGxowE5UR/LAowBrR9of7EpCQmE9vISSpaoAtOrsETf
 z3lNSkV7PueJWacggXvGhBXHwABZDkxHmplrNVZhxwPAGjJsPsonsH2Bn+xdgmTVG2bQ
 cF3bbQb2qqOkZKuCbUMMrTTK4M7RLJEOp0LoKD03Zpuy58fRklEQbtsjMAlueBs3LcVv
 0yIc9qA7EN/MX9yqBRDO94xuaPJ2Jc2LCibOKD9BQBH+ZMkGnprgDVG4SHf/VL9/EhqZ
 hLccg4xSMnoJFWYwkUbRaCbTgO26rjo3n9uQwISlNwdkiPJtirsT/QnjeTEW8hY+lfhM LA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3qdm8y7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:27 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33LGnQAV006210; 
 Fri, 21 Apr 2023 16:49:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q3ncgk2uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:26 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33LGnQuk006195;
 Fri, 21 Apr 2023 16:49:26 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33LGnQ13006193
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:26 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 170DE682; Fri, 21 Apr 2023 09:49:26 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL v2 00/10] Hexagon queue
Date: Fri, 21 Apr 2023 09:49:12 -0700
Message-Id: <20230421164922.3608183-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: iA3fZMUujXiXbJBCcFnyz87dwGmpIsfs
X-Proofpoint-GUID: iA3fZMUujXiXbJBCcFnyz87dwGmpIsfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=443 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210147
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
dDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIwMjMwNDIx
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYTMwNWExNzAzOThkODBjMDhlMTljMmVm
NGM4NjM3YTRmNGRlNTBlMToKCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlk
ZXMgZm9yIGNhY2hlL3N5bmMvYmFycmllciBpbnN0cnVjdGlvbnMgKDIwMjMtMDQtMjEgMDk6MzI6
NTIgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkhleGFnb24gdXBkYXRlCgoqKioqIENoYW5nZXMgaW4gdjIgKioq
KgpSZW1vdmUgcGF0Y2ggdGhhdCBicmVha3MgY2xhbmcgQ0kKCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hcmNvIExpZWJl
bCAoMik6CiAgICAgIFVzZSBmLXN0cmluZ3MgaW4gcHl0aG9uIHNjcmlwdHMKICAgICAgVXNlIGJs
YWNrIGNvZGUgc3R5bGUgZm9yIHB5dGhvbiBzY3JpcHRzCgpNYXRoZXVzIFRhdmFyZXMgQmVybmFy
ZGlubyAoMSk6CiAgICAgIEhleGFnb24gKHRyYW5zbGF0ZS5jKTogYXZvaWQgcmVkdW5kYW50IFBD
IHVwZGF0ZXMgb24gQ09GCgpUYXlsb3IgU2ltcHNvbiAoNyk6CiAgICAgIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBSZW1vdmUgcmVkdW5kYW50L3VudXNlZCBtYWNyb3MKICAgICAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIE1lcmdlIGFyZ3VtZW50cyB0byBwcm9iZV9wa3Rfc2NhbGFyX2h2eF9z
dG9yZXMKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGNv
dW50IHRyYWlsaW5nIHplcm9zL29uZXMKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFVw
ZGF0ZXMgdG8gVVNSIHNob3VsZCB1c2UgZ2V0X3Jlc3VsdF9ncHIKICAgICAgSGV4YWdvbiAodGVz
dHMvdGNnL2hleGFnb24pIE1vdmUgSFZYIHRlc3QgaW5mcmEgdG8gaGVhZGVyIGZpbGUKICAgICAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlbW92ZSB1bnVzZWQgc2xvdCB2YXJpYWJsZSBpbiBo
ZWxwZXJzCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBj
YWNoZS9zeW5jL2JhcnJpZXIgaW5zdHJ1Y3Rpb25zCgogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5o
ICAgICAgICAgICAgICAgICAgICB8ICA1MiArLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmggICAg
ICAgICAgICAgICAgICAgICB8ICAxMCArLQogdGFyZ2V0L2hleGFnb24vaGVscGVyLmggICAgICAg
ICAgICAgICAgICAgICB8ICAgNCArLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAg
ICAgICAgICAgICB8ICA5MSArLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuaCAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmggICAgICAgICAgICAg
ICAgfCAxNzggKysrKysrKwogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAgICAgICAg
ICAgICB8ICA0OSArLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMu
YyB8ICAgNSArLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgICAgICAgICAgICAgICAgICB8
ICAgNiArLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICB8ICAz
MSArLQogdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYyAgICAgICAgICAgICAgICB8IDE2MCAr
LS0tLS0KIHRlc3RzL3RjZy9oZXhhZ29uL21pc2MuYyAgICAgICAgICAgICAgICAgICAgfCAgNTYg
KystCiB0YXJnZXQvaGV4YWdvbi9kZWN0cmVlLnB5ICAgICAgICAgICAgICAgICAgIHwgMzk2ICsr
KysrKysrLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkgICAgICAg
ICB8IDIyNiArKysrLS0tLS0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkgICAg
ICAgICAgfCAzNjIgKysrKysrKystLS0tLS0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfcHJv
dG9zLnB5ICAgICAgICAgfCAxNjkgKysrKy0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX2lkZWZfcGFy
c2VyX2Z1bmNzLnB5ICAgICB8ICA4NSArKy0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fb3BfYXR0cmli
cy5weSAgICAgICAgICAgIHwgIDEyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fb3BfcmVncy5weSAg
ICAgICAgICAgICAgIHwgIDc5ICstLQogdGFyZ2V0L2hleGFnb24vZ2VuX29wY29kZXNfZGVmLnB5
ICAgICAgICAgICB8ICAgOCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3ByaW50aW5zbi5weSAgICAg
ICAgICAgICB8ICA4NCArKy0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fc2hvcnRjb2RlLnB5ICAgICAg
ICAgICAgIHwgIDE5ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNfdGFibGUucHkgICAg
ICAgIHwgIDE4ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAgICAgICAg
IHwgNzI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL2hleF9j
b21tb24ucHkgICAgICAgICAgICAgICAgfCAxODEgKysrKy0tLQogdGFyZ2V0L2hleGFnb24vaWRl
Zi1wYXJzZXIvaWRlZi1wYXJzZXIueSAgICB8ICAgMiArLQogdGVzdHMvdGNnL2hleGFnb24vTWFr
ZWZpbGUudGFyZ2V0ICAgICAgICAgICB8ICAgMSArCiAyOCBmaWxlcyBjaGFuZ2VkLCAxNjY0IGlu
c2VydGlvbnMoKyksIDEzNTIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMv
dGNnL2hleGFnb24vaHZ4X21pc2MuaAo=

