Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC065F302
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:41:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUCZ-0002qa-Ui; Thu, 05 Jan 2023 12:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCT-0002iJ-Kf
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCQ-0007D1-PA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305GWeQ9015968; Thu, 5 Jan 2023 17:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QshigcncMnVpK2odHmDEm1s4pFD6rv00YbsjnaLBV0o=;
 b=SrDq46hdTuTzbaFdpSxh7nU2JytLo060+bCuyXaNKFcmT+NR7rN+HYER3IV4H25nJkCy
 +ILEZkewOasUUGBHGs87+U2pTdORgOsKcrZSU8ewb3X502i3DJx+KA1czT3vVq8oXIU4
 PabSpguvsEhE9eTO8e6Xe7KBcPty/xKDWcRBqAWoj6rJue8KV5paWEKbM8dnuL2sbQpc
 gozgvzMiVIcdGNbmtLB2llrNcRJuVDek4N8V+6+ikxKUYbXEwidcl8qp2h/2Y6zOvNQ/
 ZAtTZBbgFYgKa1Z8O6TeRZSPeZZCMeSEVgICtLKOeGrSJEjvGXqepMv1S1pgWR7o0e8G yg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwpc29jes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305Hcdr5024932; 
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3mx2kp84a8-1;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305Hccne024825;
 Thu, 5 Jan 2023 17:38:38 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 305HccoN024569;
 Thu, 05 Jan 2023 17:38:38 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 5BB7B5000B0; Thu,  5 Jan 2023 09:38:38 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 4/7] target/hexagon/idef-parser: fix two typos in README
Date: Thu,  5 Jan 2023 09:38:23 -0800
Message-Id: <20230105173826.21444-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105173826.21444-1-tsimpson@quicinc.com>
References: <20230105173826.21444-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: b2BHjwP5Blv65gPlO_eq5ev6YwJQw-Fa
X-Proofpoint-ORIG-GUID: b2BHjwP5Blv65gPlO_eq5ev6YwJQw-Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=302
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050139
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVpY19tYXRo
YmVybkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJl
di5uZz4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4KTWVzc2FnZS1JZDogPGZlNjczNzFlMDNmOWRkZTM4ZWI3NTU0OTM3ZGEwYTk2YTIzMDcz
MGUuMTY3MjE3NDEyMi5naXQucXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQv
aGV4YWdvbi9pZGVmLXBhcnNlci9SRUFETUUucnN0IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL2lkZWYtcGFyc2VyL1JFQURNRS5yc3QgYi90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9S
RUFETUUucnN0CmluZGV4IDY1ZTZiZjRlZTUuLmZmNmQxNDE1MGEgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL2lkZWYtcGFyc2VyL1JFQURNRS5yc3QKKysrIGIvdGFyZ2V0L2hleGFnb24vaWRl
Zi1wYXJzZXIvUkVBRE1FLnJzdApAQCAtNTUyLDExICs1NTIsMTEgQEAgdG8gY29tcGFyZSBvdXIg
YnVnZ3kgQ1BVIHN0YXRlIGFnYWluc3QsIHJ1bm5pbmcKIAogOjoKIAotICAgIG1lc29uIGNvbmZp
Z3VyZSAtRGhleGFnb25faWRlZl9wYXJzZXJfZW5hYmxlZD1mYWxzZQorICAgIG1lc29uIGNvbmZp
Z3VyZSAtRGhleGFnb25faWRlZl9wYXJzZXI9ZmFsc2UKIAogd2lsbCBkaXNhYmxlIHRoZSBpZGVm
LXBhcnNlciBmb3IgYWxsIGluc3RydWN0aW9ucyBhbmQgZmFsbGJhY2sgb24gbWFudWFsCiB0aW55
Y29kZSBnZW5lcmF0b3Igb3ZlcnJpZGVzLCBvciBvbiBoZWxwZXIgZnVuY3Rpb24gaW1wbGVtZW50
YXRpb25zLiBSZWNvbXBpbGluZwotZ2l2ZXMgdXMgYGBxZW11LWhleGFnb25gYCB3aGljaCBwYXNz
ZXMgYWxsIHRlc3RzLiBJZiBgYHFlbXUtaGVheGdvbi1idWdneWBgIGlzCitnaXZlcyB1cyBgYHFl
bXUtaGV4YWdvbmBgIHdoaWNoIHBhc3NlcyBhbGwgdGVzdHMuIElmIGBgcWVtdS1oZXhhZ29uLWJ1
Z2d5YGAgaXMKIG91ciBiaW5hcnkgd2l0aCB0aGUgaW5jb3JyZWN0IHRpbnljb2RlIGdlbmVyYXRv
cnMsIHdlIGNhbiBjb21wYXJlIHRoZSBDUFUgc3RhdGUKIGJldHdlZW4gdGhlIHR3byB2ZXJzaW9u
cwogCi0tIAoyLjE3LjEKCg==

