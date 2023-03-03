Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62026AA421
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:21:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDm7-00081F-JZ; Fri, 03 Mar 2023 17:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pYDm5-00080u-Vy
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:21:14 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pYDm4-0003GB-Cf
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:21:13 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LEbQ5011841; Fri, 3 Mar 2023 22:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8FRj2ZJ7JtCdwzvLIfPI1cFyoqFH+MfUyCKAFUSO4qQ=;
 b=EoxsCgn7TgXSRYTLV/mGrm8vvoluokZMqHnqW9gA29+XKeyndyG+Pu/Nqfri476ubldS
 SWPj/6JOvgyLSAyCQ1+VzCiBuUpsAUTGHrgPXUNM+H0oSnP9r5vUXqQMp3Ww30JK9Mtf
 dgg+vZPpJnSaztQEvoomgWXcIZXXqvJQITKL2jy5TZ3his7wo0cGBDzsetz/+J/KK0Yp
 KClWNC+SpTEwxkJ6GSCs/GSNqF+ve8xQ0WwGimG6YGgF+iUNvgwBL7eg7UQLlB28UzIP
 XLsu+EDzJ7ebjfz8w+ACR/qzszmjEFWPhjDOasBM9fSXV9S54FMjxurgYm/Mt5g2SISS gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3bsbtfsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 22:21:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 323ML5d9010225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Mar 2023 22:21:05 GMT
Received: from NASANPPMTA05.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 3 Mar 2023 14:21:03 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <farosas@suse.de>
CC: <alex.bennee@linaro.org>, <philmd@linaro.org>, <qemu-devel@nongnu.org>,
 <quic_mathbern@quicinc.com>, <tsimpson@quicinc.com>
Subject: Re: hexagon: check-tcg rebuilding up to date image 
Date: Fri, 3 Mar 2023 19:20:51 -0300
Message-ID: <3ccca5373de05be28b861c0e9e780c709703f0f7.1677862556.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <87mt4twl2l.fsf@suse.de>
References: <87mt4twl2l.fsf@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m4qrz4x8CqT31asIKgae9vxZke-sePzK
X-Proofpoint-ORIG-GUID: m4qrz4x8CqT31asIKgae9vxZke-sePzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=733 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030189
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

From: Fabiano Rosas <farosas@suse.de>
>
> We started relying on docker for the cache. Are you using docker or
> podman? There should be a RUNC variable in config-host.mak that you can
> check.

I'm using docker.

> And for the record, which version of either podman or docker?

Docker version 20.10.12, build 20.10.12-0ubuntu2~20.04.1

> I think we might need to add DOCKER_BUILDKIT=1 $(RUNC) ... to properly
> make use of caching with docker.

I just tested it and can confirm that, with that change, `docker build`
indeed uses the cache instead of rebuilding the image. Thanks!

