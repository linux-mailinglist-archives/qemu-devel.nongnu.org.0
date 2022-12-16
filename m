Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75664F2E7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6He8-0002ps-F3; Fri, 16 Dec 2022 15:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6He6-0002oz-Oy
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6He3-0004PU-Gu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:30 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGKDsNi003494; Fri, 16 Dec 2022 20:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2n3vpXOFsoAMeZMe182TMAkb4qCUxFy3tNc4I4882m8=;
 b=K9hR5DWBKY6Hf/KRGTfhbXkgP6h7iZRbM94JlWs4YrTi4BOCMJ236KrboFsmw+Kvoo9G
 +DgRX8SEuFrEp4RiW0p+g3kmZhjbUia0wk6xNELq4/zEtL6shxWCTnb787yJMGOMIZy3
 xARsrJBlNebl2FvXk2Qoxh+J5h2yOCsC97shjY+Ao25dJFUFiOJv9XkAwkebWtFxdEO2
 MIVZhWstctLgTuoRpSKwITrtC95l2M9RL0ZZL/DKhJjV62xcOtXIRtxEzJ767KjrRg6x
 QLWjv5sLFW01pzcBep6XDMxXK65wAgPOhMEvtndu9nI/Rvi+8QdVJX/mcZWa0NjiPNAf zQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg06rws5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:49:15 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BGKeL61027274; 
 Fri, 16 Dec 2022 20:49:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 3mgwcgrm6q-1;
 Fri, 16 Dec 2022 20:49:14 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGKlbCw004194;
 Fri, 16 Dec 2022 20:49:14 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 2BGKnDmb005677;
 Fri, 16 Dec 2022 20:49:14 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0234D500119; Fri, 16 Dec 2022 12:49:13 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Alessandro Di Federico <ale@rev.ng>,
 Anton Johansson <anjo@rev.ng>
Subject: [PULL 12/21] target/hexagon: update MAINTAINERS for idef-parser
Date: Fri, 16 Dec 2022 12:48:36 -0800
Message-Id: <20221216204845.19290-13-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yip_L8ho3KizDLL6SWsAQRypyG_sqCn6
X-Proofpoint-ORIG-GUID: yip_L8ho3KizDLL6SWsAQRypyG_sqCn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=792 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160185
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

RnJvbTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5uZz4KClNpZ25lZC1vZmYtYnk6
IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+ClNpZ25lZC1vZmYtYnk6IEFudG9u
IEpvaGFuc3NvbiA8YW5qb0ByZXYubmc+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0
c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRz
aW1wc29uQHF1aWNpbmMuY29tPgpNZXNzYWdlLUlkOiA8MjAyMjA5MjMxNzM4MzEuMjI3NTUxLTIt
YW5qb0ByZXYubmc+Ci0tLQogTUFJTlRBSU5FUlMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKaW5kZXggM2JkNDMzYjY1YS4uNzE2ZDVhMjRhZCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMK
KysrIGIvTUFJTlRBSU5FUlMKQEAgLTE5Nyw2ICsxOTcsOCBAQCBIZXhhZ29uIFRDRyBDUFVzCiBN
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+CiBTOiBTdXBwb3J0ZWQKIEY6
IHRhcmdldC9oZXhhZ29uLworWDogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvCitYOiB0YXJn
ZXQvaGV4YWdvbi9nZW5faWRlZl9wYXJzZXJfZnVuY3MucHkKIEY6IGxpbnV4LXVzZXIvaGV4YWdv
bi8KIEY6IHRlc3RzL3RjZy9oZXhhZ29uLwogRjogZGlzYXMvaGV4YWdvbi5jCkBAIC0yMDQsNiAr
MjA2LDEzIEBAIEY6IGNvbmZpZ3MvdGFyZ2V0cy9oZXhhZ29uLWxpbnV4LXVzZXIvZGVmYXVsdC5t
YWsKIEY6IGRvY2tlci9kb2NrZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9zcy5kb2NrZXIKIEY6
IGRvY2tlci9kb2NrZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9zcy5kb2NrZXIuZC9idWlsZC10
b29sY2hhaW4uc2gKIAorSGV4YWdvbiBpZGVmLXBhcnNlcgorTTogQWxlc3NhbmRybyBEaSBGZWRl
cmljbyA8YWxlQHJldi5uZz4KK006IEFudG9uIEpvaGFuc3NvbiA8YW5qb0ByZXYubmc+CitTOiBT
dXBwb3J0ZWQKK0Y6IHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyLworRjogdGFyZ2V0L2hleGFn
b24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5CisKIEhQUEEgKFBBLVJJU0MpIFRDRyBDUFVzCiBN
OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KIFM6IE1h
aW50YWluZWQKLS0gCjIuMTcuMQoK

