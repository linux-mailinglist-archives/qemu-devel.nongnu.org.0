Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9565F2F2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUCd-0002zA-DV; Thu, 05 Jan 2023 12:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCb-0002vg-3r
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCY-0007jP-T4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:52 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305H1ZTh002265; Thu, 5 Jan 2023 17:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=ZoDFzHFtQK6m5S447iKiwwslGEVgWYfvFHGroqEmw88=;
 b=dJR4/18W7Hua3uf6PfMMDkGbMREoi/i7xwx5T0PoW8CIM6/IgINhfrEOaIkE1MaEwh2p
 ahh12iycflG71bjWbk0nCOU7s7kgiGreVWBESretNvS0mtSAGaeoZ0uPHYFG1+Y70BBF
 JF7iKNLSkEA2OPLP2RMTqxGiIXA6AQ94uXgZGFdTMmqq/Eb9x2MKYWMuPxA4+pCxxPoX
 G2bxFFTww1/9vP0uc9jyhjnp7U4k7fW5WJQS0hKRu464LgUKP+1koPARKokGeaaacG4s
 pUfWWLw9hXyjstmJ1xBbVTEmwYwAzQJtzHTwL/aAgQtzk7KapsDaITUxw60PaOGrHHpA IQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwj1rt0rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:38:48 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305HcdjZ028946; 
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 3mte5kwntx-1;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305HccHl028938;
 Thu, 5 Jan 2023 17:38:38 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 305Hccam028937;
 Thu, 05 Jan 2023 17:38:38 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 51D815000A7; Thu,  5 Jan 2023 09:38:38 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 0/7] Hexagon update
Date: Thu,  5 Jan 2023 09:38:19 -0800
Message-Id: <20230105173826.21444-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kPvkAkKduS9YVi8b-xYYzvuoKv9_ite0
X-Proofpoint-GUID: kPvkAkKduS9YVi8b-xYYzvuoKv9_ite0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=639 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301050140
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjYjljNmE4ZTVhZDZhMWYwY2UxNjRk
MzUyZTMxMDJkZjQ2OTg2ZTIyOgoKICAuZ2l0bGFiLWNpLmQvd2luZG93czogV29yay1hcm91bmQg
dGltZW91dCBhbmQgT3BlbkdMIHByb2JsZW1zIG9mIHRoZSBNU1lTMiBqb2JzICgyMDIzLTAxLTA0
IDE4OjU4OjMzICswMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3FlbXUgdGFncy9wdWxsLWhleC0yMDIzMDEwNQoK
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGRjNjNiMTQ5MmMyZDgxNDBkM2I0NzA5Mzcw
MGJiOWJiNTJjMGQ5N2I6CgogIFVwZGF0ZSBzY3JpcHRzL21lc29uLWJ1aWxkb3B0aW9ucy5zaCAo
MjAyMy0wMS0wNSAwOToxOTowMiAtMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSGV4YWdvbiB1cGRhdGU6IHBhdGNo
ZXMgZnJvbSBzZXZlcmFsIGZvbGtzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsZXNzYW5kcm8gRGkgRmVkZXJpY28gKDIp
OgogICAgICB0YXJnZXQvaGV4YWdvbjogc3VwcHJlc3MgdW51c2VkIHZhcmlhYmxlIHdhcm5pbmcK
ICAgICAgVXBkYXRlIHNjcmlwdHMvbWVzb24tYnVpbGRvcHRpb25zLnNoCgpNYXJjbyBMaWViZWwg
KDEpOgogICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgaW1wbGVtZW50IG11dGFiaWxpdHkg
bWFzayBmb3IgR1BScwoKTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gKDEpOgogICAgICB0YXJn
ZXQvaGV4YWdvbi9pZGVmLXBhcnNlcjogZml4IHR3byB0eXBvcyBpbiBSRUFETUUKCk11a2lsYW4g
VGhpeWFnYXJhamFuICgzKToKICAgICAgbGludXgtdXNlci9oZXhhZ29uOiBmaXggc2lnbmFsIGNv
bnRleHQgc2F2ZSAmIHJlc3RvcmUKICAgICAgdGFyZ2V0L2hleGFnb246IHJlbmFtZSBhbGlhc2Vk
IHJlZ2lzdGVyIEhFWF9SRUdfUDNfMAogICAgICB0ZXN0cy90Y2cvaGV4YWdvbjogZml4IHVuZGVy
c3BlY2lmZWQgYXNtIGNvbnN0cmFpbnRzCgogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvUkVB
RE1FLnJzdCAgICB8ICAgNCArLQogdGFyZ2V0L2hleGFnb24vaGV4X3JlZ3MuaCAgICAgICAgICAg
ICAgICB8ICAgMiArLQogbGludXgtdXNlci9oZXhhZ29uL3NpZ25hbC5jICAgICAgICAgICAgICB8
ICAxNyArKy0tCiB0YXJnZXQvaGV4YWdvbi9jcHUuYyAgICAgICAgICAgICAgICAgICAgIHwgICA2
ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgICAgIHwgIDU2ICsrKysr
KysrKystLQogdGVzdHMvdGNnL2hleGFnb24vbWVtX25vc2h1Zi5jICAgICAgICAgICB8ICAgMiAr
LQogdGVzdHMvdGNnL2hleGFnb24vbWlzYy5jICAgICAgICAgICAgICAgICB8ICAgNiArLQogdGVz
dHMvdGNnL2hleGFnb24vcmVnX211dC5jICAgICAgICAgICAgICB8IDE1MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9zaWduYWxfY29udGV4dC5jICAg
ICAgIHwgIDg0ICsrKysrKysrKysrKysrKysrCiBzY3JpcHRzL21lc29uLWJ1aWxkb3B0aW9ucy5z
aCAgICAgICAgICAgIHwgIDE4ICsrLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL2lkZWYt
cGFyc2VyLnkgfCAgIDIgKwogdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgICAgICAgICAgICAg
ICB8ICAgMSAtCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgICAgICAgIHwgICAy
ICsKIDEzIGZpbGVzIGNoYW5nZWQsIDMyMSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi9yZWdfbXV0LmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi9zaWduYWxfY29udGV4dC5jCg==

