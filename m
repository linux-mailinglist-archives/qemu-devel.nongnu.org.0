Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302859EA49
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 19:52:08 +0200 (CEST)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQY4N-0005XT-2q
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 13:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oQY1U-0002Z5-QV
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 13:49:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:7880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oQY1P-0006qW-FK
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 13:49:07 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGjciu019210;
 Tue, 23 Aug 2022 17:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : mime-version : content-type; s=qcppdkim1;
 bh=v4ZohmMZILuJ4spMsiNzyFkFCY3MpVE6yhY95I2ipHE=;
 b=bkNBSnsk4ZwE9D+9Cdh1rU/GRb3F3E/jJjY+fAqTe1M0Yn+Q80AnRUUFXwXXBuRZUMAg
 E8qGfvEOKy8UIeNakY4dcTOWjHgpNfliQHC0SLfYRKdfHmFG61wOFo/I6BU3z55dhy1U
 ROU5FhJuTtmNF3YDzMCjCcaMOj6mJehafd6SSk5B1iVTeVZf8qv9UXOtly9OoqEpX6Q3
 zyEQDNlpgKosCDKu1OTiHn2R3C5WPJBZhUNJqmluu+nBfk/5NzC93n6J4g5tIeNZLrCj
 OaakXNWDzFp05dFHGy/C4HyMG65n5c/0hSMfo9bbPtGFsgiwjoTLKkGhcPaS1rvgsTOW dg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pj09a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:48:59 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NHmwNV010382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:48:58 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 10:48:57 -0700
Date: Tue, 23 Aug 2022 18:48:54 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>
Subject: Leif's email issues resolved
Message-ID: <YwUTBhIArWLn6+ye@qc-i7.hemma.eciton.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UyXaZrVI7kZtb3A9ZILg49TA6nshoOzH
X-Proofpoint-ORIG-GUID: UyXaZrVI7kZtb3A9ZILg49TA6nshoOzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=629 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone,

As some of you might have noticed, my email setup broke a little over
a month ago. At the time I was on leave, so did not notice for a
while. And upon my return, it turned out it had broken in New and
Exciting ways - so it took some time to restore.

This has now been achieved, and I am back on the list and able to
post. (And hopefully a bit more attentive than before my break.)

/
    Leif

