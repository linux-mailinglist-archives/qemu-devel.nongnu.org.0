Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F365F10D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:24:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT26-0005JD-KT; Thu, 05 Jan 2023 11:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDT25-0005Hd-2I
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:23:57 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDT23-0004za-Cx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:23:56 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305CpSx0014283; Thu, 5 Jan 2023 16:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=K+DUb7UqjC7g3QamCSkA8iwHPAogjEO6oVO5EOWNJ1s=;
 b=D/qtkoaR9601Fx/ySFC+7Ls8CJm0PXE5CtEiSEOHaX8rC+ZzHoUGiKnmeMcxmiX3gOOR
 oSeLBYiAyTvjER7rzz8pDANnjZYBggwR7gxNPJk819qLmVK2pMhxiwA+MIVye7XH3Rbv
 wwmJ5xmSpXUptMsrJXatnCkCV4MZTfADGgcxBth/BTVBoElvv5arvHmckbn/N/q0JqOG
 F4uDuFMBLWUHLkxV4FkJfi8UpL8iCNRJnZUCJMSrJwYeEi4FEnZsdPlk8jBArw/qLBVD
 ZLwOKHZATX42LL/5Mo/+QHm83MsEAAYDqH0DuZX75O5CGAn+4W20MFuObIClVCOongMB ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwxhk8dhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 16:23:51 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305GJRdt002336; 
 Thu, 5 Jan 2023 16:23:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 3mte5kwc8p-1;
 Thu, 05 Jan 2023 16:23:49 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305GNn7i006575;
 Thu, 5 Jan 2023 16:23:49 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 305GNnP2006573;
 Thu, 05 Jan 2023 16:23:49 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 83B365000A7; Thu,  5 Jan 2023 08:23:49 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] linux-test.c: Remove unused but set variable
Date: Thu,  5 Jan 2023 08:23:48 -0800
Message-Id: <20230105162348.16725-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: liPxDGEgA4BBEl6GuGTkbQQm4EXBWyri
X-Proofpoint-ORIG-GUID: liPxDGEgA4BBEl6GuGTkbQQm4EXBWyri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_07,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=690 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301050129
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

U29tZSB2ZXJzaW9ucyBvZiBjbGFuZyB3aWxsIHdhcm4gb24gdGhpcyB3aXRoIC1XYWxsClRoZW4s
IGl0IHdpbGwgYmUgYW4gZXJyb3Igd2l0aCAtV2Vycm9yCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3Ig
U2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL211bHRpYXJjaC9s
aW51eC9saW51eC10ZXN0LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvbXVsdGlhcmNoL2xpbnV4
L2xpbnV4LXRlc3QuYyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgvbGludXgtdGVzdC5jCmlu
ZGV4IDVhMmE0ZjIyNTguLjEwOTQzZDUzMTAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9tdWx0aWFy
Y2gvbGludXgvbGludXgtdGVzdC5jCisrKyBiL3Rlc3RzL3RjZy9tdWx0aWFyY2gvbGludXgvbGlu
dXgtdGVzdC5jCkBAIC0zMzIsMTIgKzMzMiwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X3BpcGUodm9p
ZCkKICAgICBmZF9zZXQgcmZkcywgd2ZkczsKICAgICBpbnQgZmRzWzJdLCBmZF9tYXgsIHJldDsK
ICAgICB1aW50OF90IGNoOwotICAgIGludCB3Y291bnQsIHJjb3VudDsKKyAgICBpbnQgcmNvdW50
OwogCiAgICAgY2hrX2Vycm9yKHBpcGUoZmRzKSk7CiAgICAgY2hrX2Vycm9yKGZjbnRsKGZkc1sw
XSwgRl9TRVRGTCwgT19OT05CTE9DSykpOwogICAgIGNoa19lcnJvcihmY250bChmZHNbMV0sIEZf
U0VURkwsIE9fTk9OQkxPQ0spKTsKLSAgICB3Y291bnQgPSAwOwogICAgIHJjb3VudCA9IDA7CiAg
ICAgZm9yKDs7KSB7CiAgICAgICAgIEZEX1pFUk8oJnJmZHMpOwpAQCAtMzYwLDcgKzM1OSw2IEBA
IHN0YXRpYyB2b2lkIHRlc3RfcGlwZSh2b2lkKQogICAgICAgICAgICAgaWYgKEZEX0lTU0VUKGZk
c1sxXSwgJndmZHMpKSB7CiAgICAgICAgICAgICAgICAgY2ggPSAnYSc7CiAgICAgICAgICAgICAg
ICAgY2hrX2Vycm9yKHdyaXRlKGZkc1sxXSwgJmNoLCAxKSk7Ci0gICAgICAgICAgICAgICAgd2Nv
dW50Kys7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9Ci0tIAoyLjE3LjEKCg==

