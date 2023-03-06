Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AF6ACA04
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEaU-0002oq-51; Mon, 06 Mar 2023 12:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZEaS-0002oT-DG
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:25:24 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZEaQ-0000V9-Vb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:25:24 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32652mfO027385; Mon, 6 Mar 2023 17:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=gfhc6dHXxVBFwbcJwt6skudsWvWsrwWNNioS3/GuVxw=;
 b=QrTSxFBe33ndvYFQrKvDEYtF2ker4DpozfTDU43uIZoVj3mm92MQSDJ5DxZzvR4pDg8c
 wNR7WFaR7goHaVV+bVOoEKwceLltBMZs7Gq6t1jhGdTCztX08ugaS+4NSeJukuMJ1DVI
 ViwtlKiqz5bXNiNK6m7E08DCNC/ayTFrzx4lYCu3g0iTldeUSW3CMs8leUKdZEZpn4O0
 n0P3pQAiN4uljDNOnZ3DlmtZ1nVOaHug1klCKg8LSRxN958S13tejK/WGMKEOnCq6dgG
 jTCIKKLHAtYQH0ufb+Ei7a7lEAQ5G8uW1Ky/1NupfjzQy/KONnixy9ve7at2DOvg5ZeQ OA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p4g3mva5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 17:25:19 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 326HPIrg015604; 
 Mon, 6 Mar 2023 17:25:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjssa40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 17:25:18 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326HPHXS015598;
 Mon, 6 Mar 2023 17:25:17 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 326HPHTx015597
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 17:25:17 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 56EFB67E; Mon,  6 Mar 2023 09:25:17 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Restore
 --disable-hexagon-idef-parser build
Date: Mon,  6 Mar 2023 09:25:15 -0800
Message-Id: <20230306172515.346813-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ZiXbW_rWLM5SkMsbbAAM3eqjPjDC8Psp
X-Proofpoint-GUID: ZiXbW_rWLM5SkMsbbAAM3eqjPjDC8Psp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_10,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=692 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060154
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

VGhlIC0tZGlzYWJsZS1oZXhhZ29uLWlkZWYtcGFyc2VyIGNvbmZpZ3VyYXRpb24gd2FzIGJyb2tl
biBieSB0aGlzIHBhdGNoCjJmZWFjZjYwYzIzYmE2ICh0YXJnZXQvaGV4YWdvbjogRHJvcCB0Y2df
dGVtcF9mcmVlIGZyb20gQyBjb2RlKQoKVGhhdCBjb25maWcgaXMgbm90IHRlc3RlZCBieSBDSQoK
Rml4IGlzIHNpbXBsZTogTWFyayBhIGZldyBUQ0d2IHZhcmlhYmxlcyBhcyB1bnVzZWQKClNpZ25l
ZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2cuaCBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCBiMmU3ODgwYjVjLi5iMTk1
NWEwOGYwIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZy5oCkBAIC00MTksMTYgKzQxOSwxNiBAQAogCiAjZGVmaW5lIGZHRU5f
VENHX1NUT1JFKFNIT1JUQ09ERSkgXAogICAgIGRvIHsgXAotICAgICAgICBUQ0d2IEhBTEYgPSB0
Y2dfdGVtcF9uZXcoKTsgXAotICAgICAgICBUQ0d2IEJZVEUgPSB0Y2dfdGVtcF9uZXcoKTsgXAor
ICAgICAgICBUQ0d2IEhBTEYgR19HTlVDX1VOVVNFRCA9IHRjZ190ZW1wX25ldygpOyBcCisgICAg
ICAgIFRDR3YgQllURSBHX0dOVUNfVU5VU0VEID0gdGNnX3RlbXBfbmV3KCk7IFwKICAgICAgICAg
U0hPUlRDT0RFOyBcCiAgICAgfSB3aGlsZSAoMCkKIAogI2RlZmluZSBmR0VOX1RDR19TVE9SRV9w
Y3IoU0hJRlQsIFNUT1JFKSBcCiAgICAgZG8geyBcCiAgICAgICAgIFRDR3YgaXJlZyA9IHRjZ190
ZW1wX25ldygpOyBcCi0gICAgICAgIFRDR3YgSEFMRiA9IHRjZ190ZW1wX25ldygpOyBcCi0gICAg
ICAgIFRDR3YgQllURSA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIFRDR3YgSEFMRiBHX0dO
VUNfVU5VU0VEID0gdGNnX3RlbXBfbmV3KCk7IFwKKyAgICAgICAgVENHdiBCWVRFIEdfR05VQ19V
TlVTRUQgPSB0Y2dfdGVtcF9uZXcoKTsgXAogICAgICAgICB0Y2dfZ2VuX21vdl90bChFQSwgUnhW
KTsgXAogICAgICAgICBnZW5fcmVhZF9pcmVnKGlyZWcsIE11ViwgU0hJRlQpOyBcCiAgICAgICAg
IGdlbl9oZWxwZXJfZmNpcmNhZGQoUnhWLCBSeFYsIGlyZWcsIE11ViwgaGV4X2dwcltIRVhfUkVH
X0NTMCArIE11Tl0pOyBcCi0tIAoyLjI1LjEKCg==

