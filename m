Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110176AD6D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyh-0006pJ-Ot; Tue, 07 Mar 2023 00:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyR-0006bR-RQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyL-0006Zx-Hx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:55 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3275FFli010266; Tue, 7 Mar 2023 05:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DftNTCunuaGpy0SCoHtJ8V095xA9SonOkeK36BnATak=;
 b=CcQ9ASzqD15cANGLMi25Z7Mary+i8OdAK01788G3a2qpkodiNr8FhQ6+cId5U3rQTi5u
 sBmxVxP4htUaJhFbJ9BsnxRcz7dWPBcDYNNno2rHXedjA70Zdje66BqACpOTQjuariLR
 rKeXtWnXXshLkRWVlQfSa5F9kqnmM9+FLNun+FS+k2lW3qqv3CI2k9kBwzct3Ab8ZXKD
 o2hoL0NbWXwNBB1ONo+36h5tR5+kt/eq4qnkUsvcDZA01R7QzcVu4SB5FjFUtt3RAePd
 867bgmSqfhpFNMo/xeqA8KWU2IsnOiXqn5wh7f6JyfogYfDrNPWHqrvmcXDAikI9C42F lA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p418771t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:47 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275TVTM012156; 
 Tue, 7 Mar 2023 05:34:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsvd1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:46 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275YhPA020238;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3275Yhui020226
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 9F403A79; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 11/17] Hexagon (tests/tcg/hexagon) Update preg_alias.c
Date: Mon,  6 Mar 2023 21:34:32 -0800
Message-Id: <20230307053438.2416629-12-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JimDxN4L6VeqgcMC27r090QsVVjR50Bg
X-Proofpoint-ORIG-GUID: JimDxN4L6VeqgcMC27r090QsVVjR50Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=524 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070050
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

QWRkIGNvbnRyb2wgcmVnaXN0ZXJzIChjNCwgYzUpIHRvIGNsb2JiZXJzIGxpc3QKTWFkZSBwb3Nz
aWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNp
bXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIwMjMwMzA3MDI1ODI4LjE2MTI4MDktOS10c2lt
cHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMgfCAx
MCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyBiL3Rlc3Rz
L3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYwppbmRleCBiNDRhODExMmI0Li44Nzk4ZmJjYWYzIDEw
MDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMKKysrIGIvdGVzdHMvdGNn
L2hleGFnb24vcHJlZ19hbGlhcy5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQo
YykgMjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9u
IENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0g
aXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQog
ICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5CkBAIC02NSw3ICs2NSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVn
X2FsaWFzKGludCBjdmFsLCBQUmVncyAqcHJlZ3MpCiAgICAgICA6ICI9ciIocHJlZ3MtPnByZWdz
LnAwKSwgIj1yIihwcmVncy0+cHJlZ3MucDEpLAogICAgICAgICAiPXIiKHByZWdzLT5wcmVncy5w
MiksICI9ciIocHJlZ3MtPnByZWdzLnAzKQogICAgICAgOiAiciIoY3ZhbCkKLSAgICAgIDogInAw
IiwgInAxIiwgInAyIiwgInAzIik7CisgICAgICA6ICJjNCIsICJwMCIsICJwMSIsICJwMiIsICJw
MyIpOwogfQogCiBpbnQgZXJyOwpAQCAtOTIsNyArOTIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
Y3JlZ19hbGlhc19wYWlyKHVuc2lnbmVkIGludCBjdmFsLCBQUmVncyAqcHJlZ3MpCiAgICAgICAg
OiAiPXIiKHByZWdzLT5wcmVncy5wMCksICI9ciIocHJlZ3MtPnByZWdzLnAxKSwKICAgICAgICAg
ICI9ciIocHJlZ3MtPnByZWdzLnAyKSwgIj1yIihwcmVncy0+cHJlZ3MucDMpLCAiPXIiKGM1KQog
ICAgICAgIDogInIiKGN2YWxfcGFpcikKLSAgICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIp
OworICAgICAgIDogImM0IiwgImM1IiwgInAwIiwgInAxIiwgInAyIiwgInAzIik7CiAKICAgY2hl
Y2soYzUsIDB4ZGVhZGJlZWYpOwogfQpAQCAtMTE3LDcgKzExNyw3IEBAIHN0YXRpYyB2b2lkIHRl
c3RfcGFja2V0KHZvaWQpCiAgICAgICAgICAifVxuXHQiCiAgICAgICAgICA6ICIrciIocmVzdWx0
KQogICAgICAgICAgOiAiciIoMHhmZmZmZmZmZiksICJyIigweGZmMDBmZmZmKSwgInIiKDB4ODM3
ZWQ2NTMpCi0gICAgICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIpOworICAgICAgICAgOiAi
YzQiLCAicDAiLCAicDEiLCAicDIiLCAicDMiKTsKICAgICBjaGVjayhyZXN1bHQsIG9sZF92YWwp
OwogCiAgICAgLyogVGVzdCBhIHByZWRpY2F0ZWQgc3RvcmUgKi8KQEAgLTEyOSw3ICsxMjksNyBA
QCBzdGF0aWMgdm9pZCB0ZXN0X3BhY2tldCh2b2lkKQogICAgICAgICAgIn1cblx0IgogICAgICAg
ICAgOgogICAgICAgICAgOiAiciIoMCksICJyIigweGZmZmZmZmZmKSwgInIiKCZyZXN1bHQpCi0g
ICAgICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIsICJtZW1vcnkiKTsKKyAgICAgICAgIDog
ImM0IiwgInAwIiwgInAxIiwgInAyIiwgInAzIiwgIm1lbW9yeSIpOwogICAgIGNoZWNrKHJlc3Vs
dCwgMHgwKTsKIH0KIAotLSAKMi4yNS4xCgo=

