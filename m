Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA15BD58D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 22:14:41 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaNA7-0002yD-T4
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 16:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7h-00008r-Ny
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:61434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7f-0005UM-3T
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:08 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JJQ2mS017448;
 Mon, 19 Sep 2022 20:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=z9Z57NN5dicnKzAS0RizoxIFLbVlv8RX0BJbbie23L4=;
 b=PfA9wVQgAeJ/GpW52odrs0//jXkAIHzAj5QSmZG8kIhO96Fye1PnCt6wZTfT2apZryVm
 D/V7jWgT63dQjF3of+e1B2ypf09F/l6Hkb/OMQd9bxiKjGk88Y9Lp4FnaMQC/Cz2ieRW
 8qYC522ixVX57tjP8f1Fn07XvEG8YpHZ7K1AtjNbVPExwenBjc+S4lFwgrIrP8GUH8xd
 sTX+1vwQI4voagJliERP/aG68dTnHbmbNOvftepo5NGfmN2uYNujZUmwsQOhxoHgeHhi
 5hmdVFDLXy5efTU/6RPCzKg63xVaDh1K8kcuDlQgOfKpzPXaHdmYkwiMdoSVDPrKI6eq PQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6bunn0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 20:12:02 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28JKA29W005104; 
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jnqnp5xw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Sep 2022 20:12:01 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28JKC1Kf006555;
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 28JKC0Mf006552;
 Mon, 19 Sep 2022 20:12:01 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 96E045000A7; Mon, 19 Sep 2022 13:12:00 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PULL 0/2] Hexagon target update
Date: Mon, 19 Sep 2022 13:11:57 -0700
Message-Id: <20220919201159.31838-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Proofpoint-ORIG-GUID: M7AoxFr8Pi88GFtBsm3laZ8pfruNTP7Z
X-Proofpoint-GUID: M7AoxFr8Pi88GFtBsm3laZ8pfruNTP7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 mlxlogscore=237 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190135
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkMjkyMDFmZjM0YTEzNWNkZmMxOTdm
NDQxM2MxYzUwNDdlNGY1OGJiOgoKICBNZXJnZSB0YWcgJ3B1bGwtaG1wLTIwMjIwOTE1YScgb2Yg
aHR0cHM6Ly9naXRsYWIuY29tL2RhZ3JoL3FlbXUgaW50byBzdGFnaW5nICgyMDIyLTA5LTE3IDEw
OjMxOjExIC0wNDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhleC0yMDIyMDkxOQoKZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDg4ODhlZTQyYWY3MjZiOWFiYTgyNDUwMjJmZDRi
NzM1MGExMmFjZDM6CgogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKTogYWRkIGZtaW4vZm1h
eCB0ZXN0cyBmb3Igc2lnbmVkIHplcm8gKDIwMjItMDktMTkgMTE6NTU6MjMgLTA3MDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCkhleGFnb24gdGFyZ2V0IHVwZGF0ZQogICAgcmVtb3ZlIHVudXNlZCBlbmNvZGluZ3MKICAg
IGFkZCBmbWluL2ZtYXggdGVzdHMgZm9yIHNpZ25lZCB6ZXJvCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hdGhldXMgVGF2
YXJlcyBCZXJuYXJkaW5vICgxKToKICAgICAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFnb24pOiBh
ZGQgZm1pbi9mbWF4IHRlc3RzIGZvciBzaWduZWQgemVybwoKVGF5bG9yIFNpbXBzb24gKDEpOgog
ICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgcmVtb3ZlIHVudXNlZCBlbmNvZGluZ3MKCiB0
ZXN0cy90Y2cvaGV4YWdvbi91c3IuYyAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwogdGFy
Z2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiB8IDIzIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygt
KQo=

