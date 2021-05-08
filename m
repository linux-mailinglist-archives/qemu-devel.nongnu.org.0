Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F637377016
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:29:58 +0200 (CEST)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGTL-0003j0-Tk
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lfGQX-0001fd-5B
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:27:01 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:42380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lfGQU-0004Bb-RV
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:27:00 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1486PFlN086908
 for <qemu-devel@nongnu.org>; Sat, 8 May 2021 06:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=V1MPb/ekqmvjTOmPG3wmSDCIWiMQ3CfWo2lFJH4h0hA=;
 b=xSl/K2PIq5m+WikYIUj9QbtwPctoKGP7Jh8xb2qjWOjJOdbmZPigQa33dZXsqiLr1V+h
 xsGyRxA+eh64i+UyPMF6nYCaGk4OXO7Lero9v3ipkFRb8I70K0zoI24HBnoiMOtcu0Ge
 hY/74XvBvPn8IBGP0JRvkctOjrmwGoJ6cFxO9fsB+MYfi45zwW8q0vROEbRew2q104wA
 LHWkswYbwd8WMPgMvUKy5an+g4ny3mDfrXZ4Q5t6rZ5qaU0iA5ptigXmP/nnZLqNasWo
 i21xlzv1XaEHKzdC1jnj7fwGt76PIiwLb71rBN/ZYVzkydqVTkZRtZoBeXFalUCWjMtS lA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 38dj2r03rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:26:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1486PVSQ067169
 for <qemu-devel@nongnu.org>; Sat, 8 May 2021 06:26:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by userp3030.oracle.com with ESMTP id 38dfrru7qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkpahrK0QpSaXGaiR6i4WAots6GkyTRE8wHHMT/HfE61Xl+CBRB6Ax4uQY80O6J6CmV6D2kxkpFDT1jNViLJMfgHhnkIolTfDkpDNV4zpIuIxj0JNKMpzRJuva19TlbZ+SQL5OkG7o6UFb+myEf/cuesn6ZjWzzRet0ClJMsLCpq2/a3KDJcwkCfTJvklQwiwnxMkVf8KO6dcu3ku0jbRbC18Ft/NNtXDtJJ3qdVObFjFo7o74gIlYnOkX14cM4d3wZkvC9tEMEt/ptKZj++Ii2aoGjF98VoTPrGb+8R48obWcaGH53w4wLHk01JvWs2lE1u3xTlML6muNgODbkG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1MPb/ekqmvjTOmPG3wmSDCIWiMQ3CfWo2lFJH4h0hA=;
 b=LpZ09OAVjj9WuOwgKBUcdKUuwWVuE383MvaQPu+k0aBiBitzQjVHMueSQJaesikPc35dJXymrUkXQXBpDqZSheRCpbekpeUWy/LGWlh42i3qXq5dY4k/n6Y4QnnEeKT3Cvnqarlums/kJW1Acs9iC2M6AbE5YzJcqrebmTTKjSlVxhybYPV3/M/irHLOJjhuwrjKA4TNA+Lru2ntAC3CvK9+K0ue8gJnqmBuBrtnm61rpSMAHzGRqooOfmOidkK0lsCuI6EuxsCqOLpyn6wR7fU2SBIulP/amby4nCZp/cfBxdNVwE+/yn3HS3yfpKmEFuzS1aO6jCE9wus+6SRWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1MPb/ekqmvjTOmPG3wmSDCIWiMQ3CfWo2lFJH4h0hA=;
 b=GKSqfIht4u4Qch0OjbynhJH5RMgV9a9Vdxce/+AbhWNzuLuzje6XaEUj+ub4Ecr2CQTBVEvSaB2JXS4eApJybH7dnk9rWt/wOSen8VDAUn3NO3X537BEkzMUb+6r3EnfYH4l9d/5PXCB6Lgxxl9PJvrG67fpGhc7iJ9S07f/XIQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3301.namprd10.prod.outlook.com (2603:10b6:a03:14d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Sat, 8 May
 2021 06:26:52 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4087.044; Sat, 8 May 2021
 06:26:52 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] multi-process: fix usage information
Date: Fri,  7 May 2021 23:26:32 -0700
Message-Id: <20210508062632.9039-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: SA0PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:d3::28) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0023.namprd11.prod.outlook.com (2603:10b6:806:d3::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sat, 8 May 2021 06:26:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b6e0f7d-11ff-4e10-e533-08d911ea4485
X-MS-TrafficTypeDiagnostic: BYAPR10MB3301:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33016DD891C51D3823C4F589F0569@BYAPR10MB3301.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APFcxnv1D8Y1QW6ffipMt7EugvDyJB6mTnEbbMLWYBiZPJVT/mMARxvw/nRH2FIs+Phsa9DVRppWyhkUFIRo/r3ATelZHFPSeLW8WkAp4xkSSbtMrp+SByyqfUiVjQEeU7A66WGoSdSCEGpyo94r3tWmGEuHh8tY0Q2dgE0eT4qgIdbCm49Eie6drGWlsdLXcGo7qAerTow7ePkUJCPC5py+xEnWErCz0vjt0pMKzH5WObq15XE3BigudSyu4V1X2DeI5nXteWVmir1cOslee8Tw35JIFa1nVsMUh6t9BSBNqwevsMDYNg3gF2cJviqhjPp6/9HwzFH0NgPnQVUDTG7WW5NbImThovgwSymeAuEePKjfigI2SJO3VyfcF+OQfKxeRwT9eOp3Yu66/TUzJ/NIdqrSlwyRUmUMHDtKl5Fv033BUtIFQd6TCnMnxIZbGtqRglGaMkF9vL7CqLMXm39iY4pJIcW0x/ipFfOiUMt6nUluQt2B4x0LAWR2sqOwU/fD+McaD6BqmpB7ejg9PER+sEvshPCuAa0Ai7rl52dL0/iyZUxFTzWtbjSO8rnWLfG3WZJq67bP8K4NR0uLEkn0KzWZA9EHSmTdLv304iochevb5mnhYYZ9rqJFzS1OJMnaXx/vUPI3eh7DQ6xuC9wPM7juijP39tEsBKNgR/fYbN988w4keUTnKHFrUjiJQ78HA666q1J01DIq2qHjpyI/fpW/GGjs+j3l9M1QmyU+xcgA5IKDg7FNs1WRuPio/bqWClmFiC+CrERKqButzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(136003)(396003)(376002)(6666004)(66946007)(66556008)(66476007)(5660300002)(2906002)(16526019)(83380400001)(107886003)(186003)(478600001)(4326008)(6506007)(316002)(8936002)(8676002)(1076003)(86362001)(6512007)(6486002)(36756003)(4744005)(26005)(2616005)(956004)(52116002)(6916009)(966005)(38350700002)(38100700002)(44832011)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/RJl7Xx9ZtdN8lNOn5BwF61pd0tUQC2xjmgi0IY1KrZcx6V57TcpMqhl3RXw?=
 =?us-ascii?Q?Ud7tFj+yn/bcCBdXJoYyxy3q5r83kVLsPD3xTRmKLeV/6ZQj4rGmxAn9A0AQ?=
 =?us-ascii?Q?q541ym/9R+gEdw8OYvZNTVoZ43S4DcLOlMnmfcl8Na0LEnfovlfshxT+Lnb5?=
 =?us-ascii?Q?q2dPZ0mE5KLOrHcU0ohCkITS0/hE5Kn74yrrR+NSVdAIo1M9GgSQnxOCN4Sx?=
 =?us-ascii?Q?niwGkyyRKkyZnvxujxugJuOTcdGn4skBwf3Dv1ie5IoQhzM6+pBjPblF2JMD?=
 =?us-ascii?Q?iUkwhyePnO/ymQISIQNtQGGdpTVS/w3YsfYmSYD1YXGy1061S5kRZxeyFQIu?=
 =?us-ascii?Q?V7gJ4nP3LStgDJeBJVJojpKKD8XWO9PDTMr0P/ZpUnxSqwICM6FMjlVIvfKG?=
 =?us-ascii?Q?Y2mYQGaJjQ+BiXFSStu8zAm9nJPDy1Rry1mubuS9ejxGBeQsCGY2Hd9q6C3b?=
 =?us-ascii?Q?fWRrRfh4G7O/UHfJB6eXqlJtnPrLJifoOEGplRePsYrIjsPJNtHHE5fV0Rdz?=
 =?us-ascii?Q?M39N7CObLpCSd1YiyBA6g6WxupMtBTOcfq7p39ybeEKRG+0mmUcWtVqT0OnI?=
 =?us-ascii?Q?swDibKAox9lOcG5zNeQNi2EnPauv//pmQOsvenw4K4EyVwvwETkFljxEP93a?=
 =?us-ascii?Q?OsUw4lDZ+og6mL9vBHXxA6V2Vefm6OSYOv1Bwb0jv2rVqi0vtO0QfPbyo5L+?=
 =?us-ascii?Q?qtaJdvThJjM+VmuXidNDBrkOjgyWfY74+GONjVHAxw+LsQo+jmgSRnHbrCTw?=
 =?us-ascii?Q?tVkr8NzO9Nr3e8UFpGk+yDokPI3wQ4Er4DhL6Xipe+LpPnHMtJ8477nSpLSZ?=
 =?us-ascii?Q?M4RAqsIb//+OPgSDTcpqxeeSaVkQXbLHoFmo7Sl2IO3J0ZQk646jAumt5dGf?=
 =?us-ascii?Q?B4oXM3BETN4AwCuEdEYHcWD/dGOAp41m4rxi8Ha2iG0EMRGzeOYKcNRMaeyV?=
 =?us-ascii?Q?PGrg6p7iMo2JwXRvrSnaYp27P6EAzOfr93dfmFMKpuRIZzBRDslYcnIc0wJg?=
 =?us-ascii?Q?NrlvUGq44iGVH8Hal7o3ydvMffRfBP8yaBNIAKTF6NGRRujXRPt4vS3bVHWK?=
 =?us-ascii?Q?HQmTRPc48fw7DNLhwNSHnHgxjf83/++YPCq67tKIY2pF++Aejcu1RffAd1gh?=
 =?us-ascii?Q?9L+HqxQZUS+ZTIQQEqh03q/NBT5DJy+leVJQ0rz/m76UHEz6q9nD85zZjALW?=
 =?us-ascii?Q?ygZSINBGR805RNXIt3CKn39CnWF1mM6N0N9V8CF1EQPerKmLGa+Zxn6eK9Mq?=
 =?us-ascii?Q?Ggp42ZzMawf5ggrOPnN+D7GNpdPdS/5WHwXqxbsvpnPaONOwaY1znqMr5kmU?=
 =?us-ascii?Q?LPRahX9CRF6iATGs7Iw6EBid?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6e0f7d-11ff-4e10-e533-08d911ea4485
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 06:26:52.1519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMR+OjbRIWKSctrj6hnzooRg+yepApHp5pteDslzP3lClDoT8UYDCx5s0HnZeqyhqxF9fxa4lnYdViTBlLpLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3301
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105080046
X-Proofpoint-ORIG-GUID: 8PZndBZ5LtkXTf5EHnjWqBQH4h2b-y-i
X-Proofpoint-GUID: 8PZndBZ5LtkXTf5EHnjWqBQH4h2b-y-i
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105080046
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From source code, the 'devid' of x-remote-object should be one of devices
in remote QEMU process.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
I have verified by reading the code and playing with below orchestrator.
https://github.com/finallyjustice/sample/blob/master/kvm/multiprocess/orchestrator.py

 docs/system/multi-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
index 46bb0cafc2..210531ee17 100644
--- a/docs/system/multi-process.rst
+++ b/docs/system/multi-process.rst
@@ -45,7 +45,7 @@ Following is a description of command-line used to launch mpqemu.
       -device lsi53c895a,id=lsi0                                         \
       -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
       -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
-      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
 
 * QEMU:
 
-- 
2.17.1


