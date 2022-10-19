Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDCA605357
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 00:46:29 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olHpU-0005jF-Hy
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 18:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHhF-0002EC-O4
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:37:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:27622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHh7-00029d-VI
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:37:57 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JLjg2U027057;
 Wed, 19 Oct 2022 22:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=3eOqIAYEBfNvtsW1xRxUDaMjhhmdY81GFNT3q7I3ABA=;
 b=CVcVvrzGEiHfZI6qGm4w2rMemN8CHPuMG5FL7rS5he3jVvW2FxFC/BWT9GwmoQKK9dkc
 0KNYHU1iaGHNsb4h1dfM+//OlDwVEDe1eufPjPFGOUWqprAvqlPVSstbu8OJu9CZI/pO
 2FbYlv4pwsA3yXRgwwRY2qLEiNdGuXHRtIaYYfBBLJt30SF0uWtLsIJ0z53EIdcu0HxD
 Ceu2WWzECxwNmSQHaMlWCH+IefrFtdn4tB9y/9bPR2sv+3eKXia13AP4qhkeAM07PmRT
 MmkbHilR7KdDsW5EI4Ab9rwfVlEvWm9iV6nR+bPcUEb9/MA+D3WeQQDcQTZ/DaVNw3oY BA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kak1c1111-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 22:37:44 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29JMbgob012896; 
 Wed, 19 Oct 2022 22:37:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3kam15seey-1;
 Wed, 19 Oct 2022 22:37:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JMbgbM012890;
 Wed, 19 Oct 2022 22:37:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 29JMbfo0012889;
 Wed, 19 Oct 2022 22:37:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id B17305000A7; Wed, 19 Oct 2022 15:37:41 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 0/8] Hexagon (target/hexagon) Improve change-of-flow
Date: Wed, 19 Oct 2022 15:37:31 -0700
Message-Id: <20221019223739.3868-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: f6bDeWRlm7Sg1v_6FZFeGdXbkBcgNFMQ
X-Proofpoint-ORIG-GUID: f6bDeWRlm7Sg1v_6FZFeGdXbkBcgNFMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=4
 lowpriorityscore=0
 spamscore=4 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=4
 mlxlogscore=137 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210190125
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhpcyBwYXRjaCBzZXJpZXMgaW1wcm92ZXMgY2hhbmdlLW9mLWZsb3cgaGFuZGxpbmcuCgpDdXJy
ZW50bHksIHdlIHNldCB0aGUgUEMgdG8gYSBuZXcgYWRkcmVzcyBiZWZvcmUgZXhpdGluZyBhIFRC
LiAgVGhlCnVsdGltYXRlIGdvYWwgaXMgdG8gdXNlIGRpcmVjdCBibG9jayBjaGFpbmluZy4gIEhv
d2V2ZXIsIHNldmVyYWwgc3RlcHMKYXJlIG5lZWRlZCBhbG9uZyB0aGUgd2F5LgoKMSkKV2hlbiBh
IHBhY2tldCBoYXMgbW9yZSB0aGFuIG9uZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlv
biwgb25seQp0aGUgZmlyc3Qgb25lIHRha2VuIGlzIGNvbnNpZGVyZWQuICBUaGUgcnVudGltZSBi
b29ra2VlcGluZyBpcyBvbmx5Cm5lZWRlZCB3aGVuIHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgQ09G
IGluc3RydWN0aW9uIGluIGEgcGFja2V0LgoKMiwgMykKUmVtb3ZlIFBDIGFuZCBuZXh0X1BDIGZy
b20gdGhlIHJ1bnRpbWUgc3RhdGUgYW5kIGFsd2F5cyB1c2UgYQp0cmFuc2xhdGlvbi10aW1lIGNv
bnN0YW50LiAgTm90ZSB0aGF0IG5leHRfUEMgaXMgdXNlZCBieSBjYWxsIGluc3RydWN0aW9ucwp0
byBzZXQgTFIgYW5kIGJ5IGNvbmRpdGlvbmFsIENPRiBpbnN0cnVjdGlvbnMgdG8gc2V0IHRoZSBm
YWxsLXRocm91Z2gKYWRkcmVzcy4KCjQsIDUsIDYpCkFkZCBoZWxwZXIgb3ZlcnJpZGVzIGZvciBD
T0YgaW5zdHJ1Y3Rpb25zLiAgSW4gcGFydGljdWxhciwgd2UgbXVzdApkaXN0aW5ndWlzaCB0aG9z
ZSB0aGF0IHVzZSBhIFBDLXJlbGF0aXZlIGFkZHJlc3MgZm9yIHRoZSBkZXN0aW5hdGlvbi4KVGhl
c2UgYXJlIGNhbmRpZGF0ZXMgZm9yIGRpcmVjdCBibG9jayBjaGFpbmluZyBsYXRlci4KCjcpClVz
ZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIHBhY2tldHMgdGhhdCBoYXZlIGEgc2luZ2xlIFBD
LXJlbGF0aXZlCkNPRiBpbnN0cnVjdGlvbi4gIEluc3RlYWQgb2YgZ2VuZXJhdGluZyB0aGUgY29k
ZSB3aGlsZSBwcm9jZXNzaW5nIHRoZQppbnN0cnVjdGlvbiwgd2UgcmVjb3JkIHRoZSBlZmZlY3Qg
aW4gRGlzYXNDb250ZXh0IGFuZCBnZW5lcmF0ZSB0aGUgY29kZQpkdXJpbmcgZ2VuX2VuZF90Yi4K
CjgpClVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIHRpZ2h0IGxvb3BzLiAgV2UgbG9vayBm
b3IgVEJzIHRoYXQgZW5kCndpdGggYW4gZW5kbG9vcDAgdGhhdCB3aWxsIGJyYW5jaCBiYWNrIHRv
IHRoZSBUQiBzdGFydCBhZGRyZXNzLgoKCgoKVGF5bG9yIFNpbXBzb24gKDgpOgogIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSBPbmx5IHVzZSBicmFuY2hfdGFrZW4gd2hlbiBwYWNrZXQgaGFzIG11
bHRpCiAgICBjb2YKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIFBDIGZyb20gdGhl
IHJ1bnRpbWUgc3RhdGUKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIG5leHRfUEMg
ZnJvbSBydW50aW1lIHN0YXRlCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlk
ZXMgZm9yIGRpcmVjdCBjYWxsIGluc3RydWN0aW9ucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBBZGQgb3ZlcnJpZGVzIGZvciBjb21wb3VuZCBjb21wYXJlIGFuZCBqdW1wCiAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIHZhcmlvdXMgZm9ybXMgb2YganVtcAog
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBVc2UgZGlyZWN0IGJsb2NrIGNoYWluaW5nIGZvciBk
aXJlY3QKICAgIGp1bXAvYnJhbmNoCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFVzZSBkaXJl
Y3QgYmxvY2sgY2hhaW5pbmcgZm9yIHRpZ2h0IGxvb3BzCgogdGFyZ2V0L2hleGFnb24vY3B1Lmgg
ICAgICAgICAgICAgICAgfCAgMTggKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAgICAg
ICAgIHwgMzkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2lu
c24uaCAgICAgICAgICAgICAgIHwgICAyICsKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAg
ICAgICAgIHwgICA2ICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICB8ICAg
NiArLQogdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgICAgICAgICAgICAgfCAgMTUgKy0KIHRhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgIHwgMjc4ICsrKysrKysrKysrKysrKysrKysr
CiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICB8ICAyOCArLQogdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgfCAxMjAgKysrKysrKy0tCiB0YXJnZXQvaGV4YWdv
bi9nZW5faGVscGVyX2Z1bmNzLnB5ICB8ICAxMSArCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVy
X3Byb3Rvcy5weSB8ICAxMiArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgICAg
fCAgMTEgKwogdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgfCAgMzQgKystCiAx
MyBmaWxlcyBjaGFuZ2VkLCA4ODcgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCgotLSAK
Mi4xNy4xCgo=

