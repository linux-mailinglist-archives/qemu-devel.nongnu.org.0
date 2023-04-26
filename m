Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E56EEB87
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:41:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTDb-0006Nk-ON; Tue, 25 Apr 2023 20:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTDV-0006IP-Pk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTDT-00066d-Lk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:05 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PMgDoT011460; Wed, 26 Apr 2023 00:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Tln5Z8rgrKabzydfokTlrySbRE3+BDvbctQ2deTzFL0=;
 b=ZU3HvXAdX8J3yuZUs6pb2IR1TSrm9aU+Asql+9NL+hbTVWNvbcpq94LMecPVe6a0Q+X5
 q2qYrQAjewrolLK1n82cJYQImV5yR82+jCvP6NDpnHhOMmLD9C9YSADNFlU5TwOi7j+T
 3haHExGX9KtP00n2bXKE5eK1rWrc5/Xo6dVOADbI6Jze6pjUJH5yf84HesDAcgBLdtXZ
 fN3Eh0ffu/fZ0C/Zpf1BHUACpEpXXAElBz4OKeIPllC87C7YaqKZoECHn6bhmy7oCd/7
 W74DNjvWtmphvb2umlI+dy0bzT8zXC/ZQq6r0rzjYgZ2wIhOLQXQgsS9eiNOeKCtlUaj 2w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6gak1ben-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:00 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0exOe000766; 
 Wed, 26 Apr 2023 00:40:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmcywd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:40:59 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0ex47000755;
 Wed, 26 Apr 2023 00:40:59 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33Q0exAG000754
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:40:59 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 0C66D532; Tue, 25 Apr 2023 17:40:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com
Subject: [PATCH 01/21] meson.build Add CONFIG_HEXAGON_IDEF_PARSER
Date: Tue, 25 Apr 2023 17:40:57 -0700
Message-Id: <20230426004057.1318768-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pOGLwSYHAZ5ntcKL02icWyax3UjFlaFL
X-Proofpoint-GUID: pOGLwSYHAZ5ntcKL02icWyax3UjFlaFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=616 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
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

RW5hYmxlIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGRlcGVuZGluZyBvbiB3aGV0aGVyIGlkZWYt
cGFyc2VyCmlzIGNvbmZpZ3VyZWQKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2lt
cHNvbkBxdWljaW5jLmNvbT4KLS0tCiBtZXNvbi5idWlsZCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZApp
bmRleCBjNDRkMDVhMTNmLi5kNGU0MzhiMDMzIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysg
Yi9tZXNvbi5idWlsZApAQCAtMTg1OSw2ICsxODU5LDcgQEAgZW5kaWYKIGNvbmZpZ19ob3N0X2Rh
dGEuc2V0KCdDT05GSUdfR1RLJywgZ3RrLmZvdW5kKCkpCiBjb25maWdfaG9zdF9kYXRhLnNldCgn
Q09ORklHX1ZURScsIHZ0ZS5mb3VuZCgpKQogY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19H
VEtfQ0xJUEJPQVJEJywgaGF2ZV9ndGtfY2xpcGJvYXJkKQorY29uZmlnX2hvc3RfZGF0YS5zZXQo
J0NPTkZJR19IRVhBR09OX0lERUZfUEFSU0VSJywgZ2V0X29wdGlvbignaGV4YWdvbl9pZGVmX3Bh
cnNlcicpKQogY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19MSUJBVFRSJywgaGF2ZV9vbGRf
bGliYXR0cikKIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdDT05GSUdfTElCQ0FQX05HJywgbGliY2Fw
X25nLmZvdW5kKCkpCiBjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX0VCUEYnLCBsaWJicGYu
Zm91bmQoKSkKLS0gCjIuMjUuMQoK

