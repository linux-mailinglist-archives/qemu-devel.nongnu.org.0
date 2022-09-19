Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9DA5BD59E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 22:19:25 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaNEh-0005zO-Om
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 16:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7i-000094-4c
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:61674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaN7f-0005US-Rj
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:12:09 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JK7EPY029019;
 Mon, 19 Sep 2022 20:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zPQ/yCaP0e928u0eHzVvboqAzLQyRRbggqx4A1Kb9QE=;
 b=XtV1rcFVdytcEE5u25DKD5tWPaVICKrR0zDaz1kJWhiU4Mna4Y1DBDa9AR4a9hW914C6
 5DYrQr6H9LAwzM+Xm4ZQYycNd5OLgs77biYpE+AwDMIIl8p5yx6JSofbqeU8yedVIt5r
 /4cLe21ekWaO+omNjWPtYKaWua1O7ELktkarAu9NDDul3kebJkNcj6W9712AmES9kMnT
 detnSOoCfup1LpSAcx83I0v0D8UaSfbD824M1II9eNm8c+qkpcyfIafEKYkq7K3UYMBw
 0DDWGr79YqTpcy69eXQ5W9VyVQgGlaaTCboWMSJ6IsHEanmV0Nr3QMgZ6qCu2mnXwaFZ UQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jprv7sc7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 20:12:02 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28JKC1X1006571; 
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3jnqnp5xw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Sep 2022 20:12:01 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28JKC1kj006554;
 Mon, 19 Sep 2022 20:12:01 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 28JKC0Wt006553;
 Mon, 19 Sep 2022 20:12:01 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 989E15000A8; Mon, 19 Sep 2022 13:12:00 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PULL 1/2] Hexagon (target/hexagon) remove unused encodings
Date: Mon, 19 Sep 2022 13:11:58 -0700
Message-Id: <20220919201159.31838-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220919201159.31838-1-tsimpson@quicinc.com>
References: <20220919201159.31838-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: Iy9OlJhANKQ_XxG57ynhf2_gfyNFHFUl
X-Proofpoint-ORIG-GUID: Iy9OlJhANKQ_XxG57ynhf2_gfyNFHFUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=387 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

UmVtb3ZlIGVuY29kaW5ncyBndWFyZGVkIGJ5IGlmZGVmIHRoYXQgaXMgbm90IGRlZmluZWQKClNp
Z25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ck1lc3NhZ2Ut
SWQ6IDwyMDIyMDYwNjIyMjMyNy43NjgyLTQtdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFy
Z2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiB8IDIzIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZiBiL3RhcmdldC9oZXhhZ29uL2ltcG9y
dGVkL2VuY29kZV9wcC5kZWYKaW5kZXggOTM5YzZmYzU1Zi4uZDcxYzA0Y2QzMCAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZgorKysgYi90YXJnZXQvaGV4
YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmCkBAIC05NDQsMTMgKzk0NCw2IEBAIE1QWV9FTkMo
RjJfZGZtcHlmaXgsICAgICAgICAgIjEwMDAiLCJkZGRkZCIsIjAiLCIwIiwiMSIsIjAiLCIxMSIp
CiBNUFlfRU5DKEYyX2RmbWluLCAgICAgICAgICAgICIxMDAwIiwiZGRkZGQiLCIwIiwiMCIsIjEi
LCIxIiwiMTEiKQogTVBZX0VOQyhGMl9kZm1heCwgICAgICAgICAgICAiMTAwMCIsImRkZGRkIiwi
MCIsIjEiLCIwIiwiMCIsIjExIikKIE1QWV9FTkMoRjJfZGZtcHlsbCwgICAgICAgICAgIjEwMDAi
LCJkZGRkZCIsIjAiLCIxIiwiMCIsIjEiLCIxMSIpCi0jaWZkZWYgQUREX0RQX09QUwotTVBZX0VO
QyhGMl9kZmRpdmNoZWF0LCAgICAgICAiMTAwMCIsImRkZGRkIiwiMCIsIjAiLCIwIiwiMSIsIjAw
IikKLQotTVBZX0VOQyhGMl9kZmZpeHVwbiwgICAgICAgICAiMTAwMCIsImRkZGRkIiwiMCIsIjEi
LCIwIiwiMSIsIjExIikKLU1QWV9FTkMoRjJfZGZmaXh1cGQsICAgICAgICAgIjEwMDAiLCJkZGRk
ZCIsIjAiLCIxIiwiMSIsIjAiLCIxMSIpCi1NUFlfRU5DKEYyX2RmcmVjaXBhLCAgICAgICAgICIx
MDAwIiwiZGRkZGQiLCIwIiwiMSIsIjEiLCIxIiwiZWUiKQotI2VuZGlmCiAKIE1QWV9FTkMoTTdf
ZGNtcHlydywgICAgICAgICAgIjEwMDAiLCJkZGRkZCIsIjAiLCIwIiwiMCIsIjEiLCIxMCIpCiBN
UFlfRU5DKE03X2RjbXB5cndjLCAgICAgICAgICIxMDAwIiwiZGRkZGQiLCIwIiwiMCIsIjEiLCIx
IiwiMTAiKQpAQCAtMTAyNCwxNSArMTAxNyw2IEBAIE1QWV9FTkMoTTVfdmRtYWNic3UsICAgICAg
ICAgIjEwMTAiLCJ4eHh4eCIsIjAiLCIxIiwiMCIsIjAiLCIwMSIpCiAKIE1QWV9FTkMoRjJfZGZt
cHlsaCwgICAgICAgICAgIjEwMTAiLCJ4eHh4eCIsIjAiLCIwIiwiMCIsIjAiLCIxMSIpCiBNUFlf
RU5DKEYyX2RmbXB5aGgsICAgICAgICAgICIxMDEwIiwieHh4eHgiLCIwIiwiMCIsIjAiLCIxIiwi
MTEiKQotI2lmZGVmIEFERF9EUF9PUFMKLU1QWV9FTkMoRjJfZGZtcHloaCwgICAgICAgICAgIjEw
MTAiLCJ4eHh4eCIsIjAiLCIwIiwiMSIsIjAiLCIxMSIpCi1NUFlfRU5DKEYyX2RmZm1hLCAgICAg
ICAgICAgICIxMDEwIiwieHh4eHgiLCIwIiwiMCIsIjAiLCIwIiwiMTEiKQotTVBZX0VOQyhGMl9k
ZmZtcywgICAgICAgICAgICAiMTAxMCIsInh4eHh4IiwiMCIsIjAiLCIwIiwiMSIsIjExIikKLQot
TVBZX0VOQyhGMl9kZmZtYV9saWIsICAgICAgICAiMTAxMCIsInh4eHh4IiwiMCIsIjAiLCIxIiwi
MCIsIjExIikKLU1QWV9FTkMoRjJfZGZmbXNfbGliLCAgICAgICAgIjEwMTAiLCJ4eHh4eCIsIjAi
LCIwIiwiMSIsIjEiLCIxMSIpCi1NUFlfRU5DKEYyX2RmZm1hX3NjLCAgICAgICAgICIxMDEwIiwi
eHh4eHgiLCIwIiwiMSIsIjEiLCIxIiwidXUiKQotI2VuZGlmCiAKIAogTVBZX0VOQyhNN19kY21w
eXJ3X2FjYywgICAgICAiMTAxMCIsInh4eHh4IiwiMCIsIjAiLCIwIiwiMSIsIjEwIikKQEAgLTE1
NDcsMTUgKzE1MzEsOCBAQCBTSDJfUlJfRU5DKEYyX2NvbnZfZGYyZCwgICAgICAiMDAwMCIsIjEx
MSIsIjAiLCIwIDAwIiwiZGRkZGQiKQogU0gyX1JSX0VOQyhGMl9jb252X2RmMnVkLCAgICAgIjAw
MDAiLCIxMTEiLCIwIiwiMCAwMSIsImRkZGRkIikKIFNIMl9SUl9FTkMoRjJfY29udl91ZDJkZiwg
ICAgICIwMDAwIiwiMTExIiwiMCIsIjAgMTAiLCJkZGRkZCIpCiBTSDJfUlJfRU5DKEYyX2NvbnZf
ZDJkZiwgICAgICAiMDAwMCIsIjExMSIsIjAiLCIwIDExIiwiZGRkZGQiKQotI2lmZGVmIEFERF9E
UF9PUFMKLVNIMl9SUl9FTkMoRjJfZGZmaXh1cHIsICAgICAgICIwMDAwIiwiMTExIiwiMCIsIjEg
MDAiLCJkZGRkZCIpCi1TSDJfUlJfRU5DKEYyX2Rmc3FydGNoZWF0LCAgICAiMDAwMCIsIjExMSIs
IjAiLCIxIDAxIiwiZGRkZGQiKQotI2VuZGlmCiBTSDJfUlJfRU5DKEYyX2NvbnZfZGYyZF9jaG9w
LCAiMDAwMCIsIjExMSIsIjAiLCIxIDEwIiwiZGRkZGQiKQogU0gyX1JSX0VOQyhGMl9jb252X2Rm
MnVkX2Nob3AsIjAwMDAiLCIxMTEiLCIwIiwiMSAxMSIsImRkZGRkIikKLSNpZmRlZiBBRERfRFBf
T1BTCi1TSDJfUlJfRU5DKEYyX2RmaW52c3FydGEsICAgICAiMDAwMCIsIjExMSIsIjEiLCIwIGVl
IiwiZGRkZGQiKQotI2VuZGlmCiAKIAogCi0tIAoyLjE3LjEKCg==

