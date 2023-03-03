Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DD6A9E5B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA0D-0002xo-Bh; Fri, 03 Mar 2023 13:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pYA0A-0002wJ-AI
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:19:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pYA08-0008E7-Kl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:19:30 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323BsdKQ009121; Fri, 3 Mar 2023 18:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=drYSI9fS/tOadsNdAuyS0CWfZQbxAcaI5Kako4ATgWE=;
 b=iq7Twyhd373pSxUm7+xSbshn4tU/hqfMWCpZ3tsUFzrsMeORFJnnUxvLdqbRM3/5kgfm
 bNYs1gZ86+BrhFATPz4ArxtCIik4M+KMNzQZiwP3euaxQjFWKHwtRfbFG+DPLTp5fZ/I
 TssyVdJeMzjFs6b2qm0azwzm+ynC7OlWkaKaFpr/2QkXDMjooiMut3tyHWoHJpR0zYNg
 mGE4NA6WAE+INOG3iPv8G/BhsF8cD5ggMsJCvIZ45YM8mjNkv/gEw1INkqtNReb1LQ4W
 4dT2PPd4rC6Kpmt3urucFrgrMkZSWeBwaeHy7eQYLta/Zj3L1IuDJRCq7Kh7blFW3LPd /w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p2rbgd2tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 18:19:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 323IJN8O007253
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Mar 2023 18:19:23 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 3 Mar 2023 10:19:20 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <philmd@linaro.org>, <tsimpson@quicinc.com>
Subject: hexagon: check-tcg rebuilding up to date image 
Date: Fri, 3 Mar 2023 15:19:03 -0300
Message-ID: <3ccca5373de05be28b861c0e9e780c709703f0f7.1677862556.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TmPclAC1XhLNxEP7Rt9beVQqkI97uYZJ
X-Proofpoint-ORIG-GUID: TmPclAC1XhLNxEP7Rt9beVQqkI97uYZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_03,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=542
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030157
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

We noticed that local `make check-tcg` is rebuilding the docker image
for qemu-hexagon at every run, whereas previously it would say "Image is
up to date" and move on.

This was changed at 0b1a649047 (tests/docker: use direct RUNC call to
build containers, 2023-02-28), where we started to no longer use
docker.py and its image_matches_dockerfile() to skip image builds.

Is this new behavior by design? Or perhaps do we have some local
docker misconfiguration that is not correctly using caches?
 
Thanks,
Matheus

