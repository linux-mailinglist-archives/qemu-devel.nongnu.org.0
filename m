Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60B6EEC60
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 04:32:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prUvi-0002h0-Ep; Tue, 25 Apr 2023 22:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvX-0002du-5s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvT-00028a-OO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:38 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q1NT3Q014634; Wed, 26 Apr 2023 02:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=VvhmmyYG8C+UdsiwwwyNKkxVZ/oae6Htf9S6wsr6Yxw=;
 b=jk18Mxu65nYlod7iACNnZT75c/Tiolj56w5ZZ0VkNix7N7v8KOZtrt0SYmYDCmZVp3PW
 8RJHpvYeUWB3eflXmoPCC6zmAyv5JcbxS0mtnACLOVJ6gZSQ5u5oed3FnWI8Iq53bZBV
 zjCYAflJnM+YKdDkBjFwUjVynmMv5J/rueWs122BjG8FmBxQOfDy0lIll6y7POme5C9H
 WPTYA1AjFgNZ9g9tBjwau+Dy+DANeZ959lf3opwpFs/B7SLBueaUTiFtvjW6Y/WyWH/h
 nPosCt/c7eaG8cTmBDH+G5Ecp0mm+ijTwyYt+K3kQYvVKzEnMKWvYHveG3/QgC3uLeOz dg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6an22gdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q2SegE022915; 
 Wed, 26 Apr 2023 02:30:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmdetu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:20 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q2LqAX016291;
 Wed, 26 Apr 2023 02:30:20 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33Q2UJfd025444
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:20 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 9BA17682; Tue, 25 Apr 2023 19:30:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 0/9] Hexagon (target/hexagon) New architecture support
Date: Tue, 25 Apr 2023 19:30:09 -0700
Message-Id: <20230426023018.1742266-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: iv4eqMd_7b5ShWpN0jxw4KXEGJYMMfWF
X-Proofpoint-ORIG-GUID: iv4eqMd_7b5ShWpN0jxw4KXEGJYMMfWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=626 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260021
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

QWRkIHN1cHBvcnQgZm9yIG5ldyBIZXhhZ29uIGFyY2hpdGVjdHVyZSB2ZXJzaW9ucyB2NjgvdjY5
L3Y3MS92NzMKCgpUYXlsb3IgU2ltcHNvbiAoOSk6CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IEFkZCBzdXBwb3J0IGZvciB2NjgvdjY5L3Y3MS92NzMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgQWRkIHY2OCBzY2FsYXIgaW5zdHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGVzdHMvdGNnL2hleGFn
b24pIEFkZCB2Njggc2NhbGFyIHRlc3RzCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCB2
NjggSFZYIGluc3RydWN0aW9ucwogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBBZGQgdjY4
IEhWWCB0ZXN0cwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgdjY5IEhWWCBpbnN0cnVj
dGlvbnMKICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgQWRkIHY2OSBIVlggdGVzdHMKICBI
ZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIHY3MyBzY2FsYXIgaW5zdHJ1Y3Rpb25zCiAgSGV4
YWdvbiAodGVzdHMvdGNnL2hleGFnb24pIEFkZCB2NzMgc2NhbGFyIHRlc3RzCgogY29uZmlndXJl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGxpbnV4LXVzZXIv
aGV4YWdvbi90YXJnZXRfZWxmLmggICAgICAgICAgICAgIHwgIDEzICstCiB0YXJnZXQvaGV4YWdv
bi9jcHUuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCiB0YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggICAgICAgICAgICAgICAgICAgICB8ICAyMiArKwogdGFyZ2V0L2hleGFnb24vZ2Vu
X3RjZ19odnguaCAgICAgICAgICAgICAgICAgfCAgMTIgKwogdGFyZ2V0L2hleGFnb24vbW12ZWMv
bWFjcm9zLmggICAgICAgICAgICAgICAgfCAgIDkgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL3Y2bXB5
X3JlZi5oICAgICAgICAgICAgICAgIHwgMTYxICsrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2F0
dHJpYnNfZGVmLmguaW5jICAgICAgICAgICAgIHwgIDE2ICsKIHRhcmdldC9oZXhhZ29uL2NwdS5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIwICsrCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuYyAgICAgICAgICAgICAgICAgICB8ICAgMyArCiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMg
ICAgICAgICAgICAgICAgICAgICB8ICAxMiArCiB0ZXN0cy90Y2cvaGV4YWdvbi92NjhfaHZ4LmMg
ICAgICAgICAgICAgICAgICB8ICA5MCArKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL3Y2OF9zY2Fs
YXIuYyAgICAgICAgICAgICAgIHwgMTg2ICsrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi92
NjlfaHZ4LmMgICAgICAgICAgICAgICAgICB8IDMxOCArKysrKysrKysrKysrKysrKysKIHRlc3Rz
L3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYyAgICAgICAgICAgICAgIHwgIDk2ICsrKysrKwogdGFy
Z2V0L2hleGFnb24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5ICAgICAgfCAgIDIgKwogdGFyZ2V0
L2hleGFnb24vaW1wb3J0ZWQvYnJhbmNoLmlkZWYgICAgICAgICAgfCAgIDcgKy0KIHRhcmdldC9o
ZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYgICAgICAgIHwgIDIxICstCiB0YXJnZXQvaGV4
YWdvbi9pbXBvcnRlZC9sZHN0LmlkZWYgICAgICAgICAgICB8ICAyMCArLQogdGFyZ2V0L2hleGFn
b24vaW1wb3J0ZWQvbW12ZWMvZW5jb2RlX2V4dC5kZWYgfCAgMTYgKy0KIHRhcmdldC9oZXhhZ29u
L2ltcG9ydGVkL21tdmVjL2V4dC5pZGVmICAgICAgIHwgMzIxICsrKysrKysrKysrKysrKysrKy0K
IHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCAgICAgICAgICAgIHwgIDEzICsKIDIy
IGZpbGVzIGNoYW5nZWQsIDEzNDkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL2hleGFnb24vdjZtcHlfcmVmLmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdvbi92NjhfaHZ4LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0cy90Y2cvaGV4YWdvbi92Njhfc2NhbGFyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90
Y2cvaGV4YWdvbi92NjlfaHZ4LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvaGV4YWdv
bi92NzNfc2NhbGFyLmMKCi0tIAoyLjI1LjEKCg==

