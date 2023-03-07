Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6776AD6D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyg-0006pB-4F; Tue, 07 Mar 2023 00:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyM-0006XC-Dg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyJ-0006Ye-2h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:49 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3274uMrJ026564; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=9iCQNNltaNdvZTpJnmCrL82qfnt+yXx6hfcxQrx9xfU=;
 b=kjtCUOlKdwrqRqXiGeZKbvF1BVCANMJ4U6JWpIQhH4f3N3s68Sj7nCx0ftqOeX5D+/A1
 HKFfCBCIkbNSYFKRhbaFnGL6ZdIwjXlhxYF3Pkrc+il73bSnkgtbZWO9lukd5NatiSR5
 0BM9EGhGqkW/mhacLCCU2cAAdEDfHHEcTi8CAYX+eBOZkpbOYtnX1UPAWbZ3SCTAc65U
 8Vk3BY4MYpuE2Cr7Z4ESxcXk8oXT0joTz+oFOvFG4A47ZMBLPHvJQyTPDqQB7zGLGMql
 FfZyEbE4ZFdmVdeaQLlm3lto7dkTcz8pWj3ublTw6RYxfb92B08r+Wsi9ouPnAp3J4eM hg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5wee882v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275YhH5020228; 
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsvd15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275Yh9N020216;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3275YgU3020211
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 84BFA676; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 00/17] Hexagon (target/hexagon) updates
Date: Mon,  6 Mar 2023 21:34:21 -0800
Message-Id: <20230307053438.2416629-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: H7F7B4nm-lIMQ4VNS9a_eeJkqmltDFa2
X-Proofpoint-ORIG-GUID: H7F7B4nm-lIMQ4VNS9a_eeJkqmltDFa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=6
 mlxscore=6 suspectscore=0
 spamscore=6 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=118 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070049
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmMDAzZGQ4ZDgxZjdkODhmNGIxZjg4
MDIzMDllYWE3NmY2ZWIyMjNhOgoKICBNZXJnZSB0YWcgJ3B1bGwtdGNnLTIwMjMwMzA1JyBvZiBo
dHRwczovL2dpdGxhYi5jb20vcnRoNzY4MC9xZW11IGludG8gc3RhZ2luZyAoMjAyMy0wMy0wNiAx
MDoyMDowNCArMDAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVsbC1oZXgtMjAyMzAzMDYKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjMmIzM2QwYmU5OThiZjUzOTk1M2YxZGFkMGFh
MGQxY2M4ZDlkMDY5OgoKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgSW1wcm92ZSBjb2RlIGdl
biBmb3IgcHJlZGljYXRlZCBIVlggaW5zdHJ1Y3Rpb25zICgyMDIzLTAzLTA2IDIwOjQ3OjEyIC0w
ODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgdXBkYXRlcwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpB
bnRvbiBKb2hhbnNzb24gKDEpOgogICAgICB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlcjogUmVt
b3ZlIHVudXNlZCBjb2RlIHBhdGhzCgpSaWNoYXJkIEhlbmRlcnNvbiAoMSk6CiAgICAgIHRhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyOiBFbGlkZSBtb3YgaW4gZ2VuX3ByZWRfYXNzaWduCgpUYXls
b3IgU2ltcHNvbiAoMTUpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVzdG9yZSAt
LWRpc2FibGUtaGV4YWdvbi1pZGVmLXBhcnNlciBidWlsZAogICAgICBIZXhhZ29uICh0YXJnZXQv
aGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IganVtcHIzMSBpbnN0cnVjdGlvbnMKICAgICAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGNhbGxyCiAgICAgIEhleGFn
b24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBlbmRsb29wMS9lbmRsb29wMDEK
ICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGRlYWxsb2Mt
cmV0dXJuIGluc3RydWN0aW9ucwogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQW5hbHl6
ZSBwYWNrZXQgYmVmb3JlIGdlbmVyYXRpbmcgVENHCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uKSBEb24ndCBzZXQgcGt0X2hhc19zdG9yZV9zMSB3aGVuIG5vdCBuZWVkZWQKICAgICAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIEFuYWx5emUgcGFja2V0IGZvciBIVlgKICAgICAgSGV4YWdv
biAodGVzdHMvdGNnL2hleGFnb24pIFVwZGF0ZSBwcmVnX2FsaWFzLmMKICAgICAgSGV4YWdvbiAo
dGVzdHMvdGNnL2hleGFnb24pIFJlbW92ZSBfX2J1aWx0aW4gZnJvbSBzY2F0dGVyX2dhdGhlcgog
ICAgICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgRW5hYmxlIEhWWCB0ZXN0cwogICAgICBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQ2hhbmdlIHN1YnRyYWN0IGZyb20gemVybyB0byBjaGFu
Z2Ugc2lnbgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIGdlbl9sb2dfcHJl
ZGljYXRlZF9yZWdfd3JpdGVbX3BhaXJdCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBS
ZWR1Y2UgbWFuaXB1bGF0aW9uIG9mIHNsb3RfY2FuY2VsbGVkCiAgICAgIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBJbXByb3ZlIGNvZGUgZ2VuIGZvciBwcmVkaWNhdGVkIEhWWCBpbnN0cnVjdGlv
bnMKCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICst
CiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgICAgICAgIHwgIDkwICsrKyst
CiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oICAgICAgICAgICAgICAgIHwgIDE3ICstCiB0
YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci5oICAgIHwgICAxIC0KIHRhcmdl
dC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgICAgICAgICAgfCAgMjkgKy0KIHRhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIHRhcmdldC9oZXhh
Z29uL3RyYW5zbGF0ZS5oICAgICAgICAgICAgICAgICAgfCAgODYgKysrLS0KIHRhcmdldC9oZXhh
Z29uL2F0dHJpYnNfZGVmLmguaW5jICAgICAgICAgICAgfCAgIDEgKwogdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMgICAgICAgICAgICAgICAgICAgICB8IDI5NiArKysrKysrKysrLS0tLS0tCiB0YXJn
ZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgIDE5ICstCiB0YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICAgICAgICAgIHwgIDYwICsrLS0KIHRhcmdldC9o
ZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgICAgICAgICAgfCAyODggKysrKysrKysrLS0tLS0t
LQogdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jICAgICAgICAgICAgICAgICB8ICAzMSArLQog
dGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jICAgICAgICAgICAgICB8ICAxMCArLQogdGVz
dHMvdGNnL2hleGFnb24vc2NhdHRlcl9nYXRoZXIuYyAgICAgICAgICB8IDUxMyArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9SRUFETUUgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMxICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weSAgICAg
ICAgIHwgMjUyICsrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX2Z1bmNz
LnB5ICAgICAgICAgIHwgIDE5ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX3Byb3Rvcy5w
eSAgICAgICAgIHwgIDEyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAg
ICAgICAgIHwgMTUyICsrKy0tLS0tLQogdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAg
ICAgICAgICAgICB8ICAxMCArLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJz
ZXIubGV4ICB8ICAzMSArLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIu
eSAgICB8ICA0OSArLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL21hY3Jvcy5pbmMgICAg
ICAgfCAgIDkgLQogdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICB8
ICAxMSArLQogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0ICAgICAgICAgICB8ICAx
MyArLQogMjYgZmlsZXMgY2hhbmdlZCwgMTIwOSBpbnNlcnRpb25zKCspLCA4MjkgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3Mu
cHkK

