Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B676D68DE4F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRGP-0001du-VX; Tue, 07 Feb 2023 11:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pPRGO-0001dO-CD; Tue, 07 Feb 2023 11:56:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pPRGM-0003sP-71; Tue, 07 Feb 2023 11:56:12 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317CFx7i007395; Tue, 7 Feb 2023 16:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=+Oms+9hs5cy4OJZC++KDhwxjq+zCytw15tcx189Dyng=;
 b=Ass2cD+jO1gC4Jhj19f5bVSCUn6ZmYG/dqrckaENQwTrT8TM5EwBfQcJ98GoB40g5Wya
 H7nMIPLtIH5mjufSkTiBWvQPrGmRqnDMlYZuvw0HTKhBKhdfTVuUR0fhIOZ+Muo3hZMB
 buXMtdL6AiCTx+Frhz9tcrBGzrCdxHW3d1c2t2DyRvUDv8jolMVSx7rtBRyT/POD98bI
 s/x025emZ3NljtBZHcG7vYSMjJy4bBPP+fIxEecDo48F3/XXyI6MOWY6wEIxXYLNf+IZ
 tZgxXmJZWcnDNU5IYtPztRoeByBvhWwq32frwIGptWnLQPysyhO1qkyS7d1AEpk1VuzZ bA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkdeya01e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 16:56:07 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 317Gs99F026046; 
 Tue, 7 Feb 2023 16:56:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3nhgem0f3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 16:56:06 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Gr2wj024986;
 Tue, 7 Feb 2023 16:56:06 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 317Gu5CA028416
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 16:56:06 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 8115E6212; Tue,  7 Feb 2023 13:56:05 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: thuth@redhat.com
Cc: anjo@rev.ng, bcain@quicinc.com, berrange@redhat.com, pbonzini@redhat.com, 
 philmd@linaro.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 quic_acaggian@quicinc.com, quic_mathbern@quicinc.com, tsimpson@quicinc.com
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Date: Tue,  7 Feb 2023 13:56:03 -0300
Message-Id: <20230207165603.107707-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
References: <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vloGJuXsUT583xFTa-e2rbxUd3hc6k2M
X-Proofpoint-GUID: vloGJuXsUT583xFTa-e2rbxUd3hc6k2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_09,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=653 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070150
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Thomas Huth <thuth@redhat.com> wrote:
>
> Out of curiosity: Where did you encounter this problem? After having a quick 
> look at https://repology.org/project/bison/versions it seems to me that all 
> our supported OS distros should already ship bison 3.0 or newer...

I actually noticed this when compiling our downstream
qemu-system-hexagon on macOS (Ventura 13.2), where the bundled bison
version is 2.3 (although 3.8.2 is available through brew). I thought
this could affect other upstream users too, but good to know that the
supported OSes already ship bison >= 3.0.

