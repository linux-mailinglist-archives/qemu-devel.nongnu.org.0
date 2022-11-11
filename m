Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A113624F1B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 01:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otIHV-0008Vk-Vc; Thu, 10 Nov 2022 19:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1otIHS-0008Tl-OS
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:52:26 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1otIHP-0008Ia-BX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:52:26 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB0hh6v017073; Fri, 11 Nov 2022 00:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=XiwHAvmAS2lZSO1rjdBPFy7JEd3cpJ2TrkBkaZzjowU=;
 b=L1vap3yZIX7NU20Z0TBogCyiIM4pv1LOjfeJA55xEOJGtzf4QvrbeeF4yEy0ju73GoH4
 QZirVxJUdtCiyk4U8fTWjaDdIPuUDl3ykL2BGyw+yQmGXRAr1vZpG/M/SzwNbmQjRcu0
 mAdJVlYaUEvBSpnCHDu0e2u1GgvWJ97I33qD/Kpb/GW/Rz0sU/5WZ30DcqGl+8pNULGl
 X1FmiIOvvR3mnJ3oTTIZWNUHirpNh/k0E82XmWI2eJWQWeNY9mO50VXEs0CDwepekiNf
 l9I5fnk5W4TxBmHggYknMX4fO5iJC33ZeklFOpgWAcNsu3hpUt7XulGjkUoRwU6Rx02/ 8w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksah806hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 00:52:18 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AB0mK8H018108; 
 Fri, 11 Nov 2022 00:52:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3kngwmeu82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 11 Nov 2022 00:52:17 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AB0mLgB018128;
 Fri, 11 Nov 2022 00:52:16 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2AB0qGhA021257;
 Fri, 11 Nov 2022 00:52:16 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 4372C5000A7; Thu, 10 Nov 2022 16:52:16 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 00/11] Hexagon bug fixes and performance improvement
Date: Thu, 10 Nov 2022 16:52:03 -0800
Message-Id: <20221111005214.22764-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Tudjle8Xa_a6gBTYt9IU-j7tadZKZcwt
X-Proofpoint-GUID: Tudjle8Xa_a6gBTYt9IU-j7tadZKZcwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_14,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=744
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyY2NhZDYxNzQ2Y2E3ZGU1ZGQzZTI1
MTQ2MDYyMjY0Mzg3ZTQzYmQ0OgoKICBNZXJnZSB0YWcgJ3B1bGwtdGNnLTIwMjIxMTA5JyBvZiBo
dHRwczovL2dpdGxhYi5jb20vcnRoNzY4MC9xZW11IGludG8gc3RhZ2luZyAoMjAyMi0xMS0wOSAx
MzoyNjo0NSAtMDUwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVsbC1oZXgtMjAyMjExMTAKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmMjYzMGQ1OTk0ZmI3MTZhMzAyMjg5ZDk3ODQ0
ZDFjOTYyMmYzYWZmOgoKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVXNlIGRpcmVjdCBibG9j
ayBjaGFpbmluZyBmb3IgdGlnaHQgbG9vcHMgKDIwMjItMTEtMTAgMDk6NDk6MzUgLTA4MDApCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCgoxKQpQZXJmb3JtYW5jZSBpbXByb3ZlbWVudApBZGQgcGt0IGFuZCBpbnNuIHRvIERp
c2FzQ29udGV4dApNYW55IGZ1bmN0aW9ucyBuZWVkIGluZm9ybWF0aW9uIGZyb20gYWxsIDMgc3Ry
dWN0dXJlcywgc28gbWVyZ2UKdGhlbSB0b2dldGhlci4KCjIpCkJ1ZyBmaXgKRml4IHByZWRpY2F0
ZWQgYXNzaWdubWVudCB0byAudG1wIGFuZCAuY3VyCgozKQpQZXJmb3JtYW5jZSBpbXByb3ZlbWVu
dApBZGQgb3ZlcnJpZGVzIGZvciBTMl9hc3Jfcl9yX3NhdC9TMl9hc2xfcl9yX3NhdApUaGVzZSBm
dW5jdGlvbnMgd2lsbCBub3QgYmUgaGFuZGxlZCBieSBpZGVmLXBhcnNlcgoKNC0xMSkKVGhlIGZp
bmFsIDggcGF0Y2hlcyBpbXByb3ZlIGNoYW5nZS1vZi1mbG93IGhhbmRsaW5nLgoKQ3VycmVudGx5
LCB3ZSBzZXQgdGhlIFBDIHRvIGEgbmV3IGFkZHJlc3MgYmVmb3JlIGV4aXRpbmcgYSBUQi4gIFRo
ZQp1bHRpbWF0ZSBnb2FsIGlzIHRvIHVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcuICBIb3dldmVy
LCBzZXZlcmFsIHN0ZXBzCmFyZSBuZWVkZWQgYWxvbmcgdGhlIHdheS4KCjQpCldoZW4gYSBwYWNr
ZXQgaGFzIG1vcmUgdGhhbiBvbmUgY2hhbmdlLW9mLWZsb3cgKENPRikgaW5zdHJ1Y3Rpb24sIG9u
bHkKdGhlIGZpcnN0IG9uZSB0YWtlbiBpcyBjb25zaWRlcmVkLiAgVGhlIHJ1bnRpbWUgYm9va2tl
ZXBpbmcgaXMgb25seQpuZWVkZWQgd2hlbiB0aGVyZSBpcyBtb3JlIHRoYW4gb25lIENPRiBpbnN0
cnVjdGlvbiBpbiBhIHBhY2tldC4KCjUsIDYpClJlbW92ZSBQQyBhbmQgbmV4dF9QQyBmcm9tIHRo
ZSBydW50aW1lIHN0YXRlIGFuZCBhbHdheXMgdXNlIGEKdHJhbnNsYXRpb24tdGltZSBjb25zdGFu
dC4gIE5vdGUgdGhhdCBuZXh0X1BDIGlzIHVzZWQgYnkgY2FsbCBpbnN0cnVjdGlvbnMKdG8gc2V0
IExSIGFuZCBieSBjb25kaXRpb25hbCBDT0YgaW5zdHJ1Y3Rpb25zIHRvIHNldCB0aGUgZmFsbC10
aHJvdWdoCmFkZHJlc3MuCgo3LCA4LCA5KQpBZGQgaGVscGVyIG92ZXJyaWRlcyBmb3IgQ09GIGlu
c3RydWN0aW9ucy4gIEluIHBhcnRpY3VsYXIsIHdlIG11c3QKZGlzdGluZ3Vpc2ggdGhvc2UgdGhh
dCB1c2UgYSBQQy1yZWxhdGl2ZSBhZGRyZXNzIGZvciB0aGUgZGVzdGluYXRpb24uClRoZXNlIGFy
ZSBjYW5kaWRhdGVzIGZvciBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgbGF0ZXIuCgoxMCkKVXNlIGRp
cmVjdCBibG9jayBjaGFpbmluZyBmb3IgcGFja2V0cyB0aGF0IGhhdmUgYSBzaW5nbGUgUEMtcmVs
YXRpdmUKQ09GIGluc3RydWN0aW9uLiAgSW5zdGVhZCBvZiBnZW5lcmF0aW5nIHRoZSBjb2RlIHdo
aWxlIHByb2Nlc3NpbmcgdGhlCmluc3RydWN0aW9uLCB3ZSByZWNvcmQgdGhlIGVmZmVjdCBpbiBE
aXNhc0NvbnRleHQgYW5kIGdlbmVyYXRlIHRoZSBjb2RlCmR1cmluZyBnZW5fZW5kX3RiLgoKMTEp
ClVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIHRpZ2h0IGxvb3BzLiAgV2UgbG9vayBmb3Ig
VEJzIHRoYXQgZW5kCndpdGggYW4gZW5kbG9vcDAgdGhhdCB3aWxsIGJyYW5jaCBiYWNrIHRvIHRo
ZSBUQiBzdGFydCBhZGRyZXNzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUYXlsb3IgU2ltcHNvbiAoMTEpOgogICAgICBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIHBrdCBhbmQgaW5zbiB0byBEaXNhc0NvbnRleHQK
ICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEZpeCBwcmVkaWNhdGVkIGFzc2lnbm1lbnQg
dG8gLnRtcCBhbmQgLmN1cgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJy
aWRlcyBmb3IgUzJfYXNyX3Jfcl9zYXQvUzJfYXNsX3Jfcl9zYXQKICAgICAgSGV4YWdvbiAodGFy
Z2V0L2hleGFnb24pIE9ubHkgdXNlIGJyYW5jaF90YWtlbiB3aGVuIHBhY2tldCBoYXMgbXVsdGkg
Y29mCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBSZW1vdmUgUEMgZnJvbSB0aGUgcnVu
dGltZSBzdGF0ZQogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgUmVtb3ZlIG5leHRfUEMg
ZnJvbSBydW50aW1lIHN0YXRlCiAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3Zl
cnJpZGVzIGZvciBkaXJlY3QgY2FsbCBpbnN0cnVjdGlvbnMKICAgICAgSGV4YWdvbiAodGFyZ2V0
L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGNvbXBvdW5kIGNvbXBhcmUgYW5kIGp1bXAKICAg
ICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIHZhcmlvdXMgZm9y
bXMgb2YganVtcAogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVXNlIGRpcmVjdCBibG9j
ayBjaGFpbmluZyBmb3IgZGlyZWN0IGp1bXAvYnJhbmNoCiAgICAgIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBVc2UgZGlyZWN0IGJsb2NrIGNoYWluaW5nIGZvciB0aWdodCBsb29wcwoKIHRhcmdl
dC9oZXhhZ29uL2NwdS5oICAgICAgICAgICAgICAgIHwgIDE0ICstCiB0YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggICAgICAgICAgICB8IDQxMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggICAgICAgIHwgICA2ICstCiB0YXJn
ZXQvaGV4YWdvbi9pbnNuLmggICAgICAgICAgICAgICB8ICAgOSArLQogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggICAgICAgICAgICAgfCAgMTYgKy0KIHRhcmdldC9oZXhhZ29uL21tdmVjL21hY3Jv
cy5oICAgICAgIHwgICA0ICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICB8
ICAyMCArLQogdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgICAgICAgICAgICAgfCAgMTUgKy0KIHRh
cmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgIHwgMzkyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgIHwg
IDI4ICsrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgfCAyMjkgKysrKysr
KysrKysrKy0tLS0tLS0KIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMgICAgICAgIHwgIDcy
ICsrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL3Vzci5jICAgICAgICAgICAgIHwgIDM0ICsrLQog
dGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9mdW5jcy5weSAgfCAgMTMgKy0KIHRhcmdldC9oZXhh
Z29uL2dlbl9oZWxwZXJfcHJvdG9zLnB5IHwgIDE0ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNn
X2Z1bmNzLnB5ICAgICB8ICAzOCArKystCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAg
ICAgICB8ICAyOSArKy0KIDE3IGZpbGVzIGNoYW5nZWQsIDEyMDcgaW5zZXJ0aW9ucygrKSwgMTM4
IGRlbGV0aW9ucygtKQo=

