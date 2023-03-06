Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE036ABEDB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9RU-0002At-Dd; Mon, 06 Mar 2023 06:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZ9RB-0002AU-9D
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:55:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZ9R8-0003V7-MF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:55:28 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3262w1BP028188; Mon, 6 Mar 2023 11:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ubJdzVSlVyQqphpfasiEDxORmd1btScGdCGiL2A6uR8=;
 b=c6IiXsZ+KIbkrPG/eywHUW60TdXVCZEoJaZPm/blczpYcyv9w+j1wgRCRHDOE178P1Bw
 Xizy1coq0eLHhJAW/yDel8vedLBu325jzpaC18ipFHNkWTpsSnEY2yrd9dJV3slvb6LO
 gShHBfunwyXqDFvSKNkOe17Y63jvyQHnbL4EwXfUh46xaC+y3v9PUGj1VW4S8QuWt2DP
 fWjYBEL1AU5DSkSno5MdmVMUcU1QCmZ4a63xE1YmGx7wuktuT6vdAVTJls/fklSScgDc
 HjAl3zDKsirZkjeCe0fgVwfAYryvcixDEHRXyFMacj58BmbCjEE0V2NfKAXy7sEZJ7H9 Sg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p4g3mubyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 11:55:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326BtMIA007462
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 11:55:22 GMT
Received: from NASANPPMTA05.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 6 Mar 2023 03:55:19 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <alex.bennee@linaro.org>
CC: <farosas@suse.de>, <philmd@linaro.org>, <qemu-devel@nongnu.org>,
 <quic_mathbern@quicinc.com>, <tsimpson@quicinc.com>
Subject: Re: hexagon: check-tcg rebuilding up to date image 
Date: Mon, 6 Mar 2023 08:55:07 -0300
Message-ID: <20230306115507.8273-1-quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <87jzzw3c6r.fsf@linaro.org>
References: <87jzzw3c6r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _erqORlxg9zX32dADzKVRqu9g88EuZVh
X-Proofpoint-GUID: _erqORlxg9zX32dADzKVRqu9g88EuZVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_04,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=684 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Alex Bennée <alex.bennee@linaro.org> writes:
> 
> Fabiano Rosas <farosas@suse.de> writes:
> 
> >
> > I think we might need to add DOCKER_BUILDKIT=1 $(RUNC) ... to properly
> > make use of caching with docker. As for podman, I'm seeing conflicting
> > information on the web as to whether it even supports caching.
> 
> As opposed to --build-arg BUILDKIT_INLINE_CACHE=1 or both?

For me, `DOCKER_BUILDKIT=1 $(RUNC)` seems to do the trick with no
need for `--build-arg BUILDKIT_INLINE_CACHE=1`.

In fact, the latter appears to be ignored by my docker instalation:
"[Warning] One or more build-args [BUILDKIT_INLINE_CACHE] were not consumed"

