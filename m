Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4647D7F2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:48:25 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07b6-0004de-1R
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V6-0004Xv-65
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008KR-4M
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:11 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxQF028537; 
 Wed, 22 Dec 2021 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=IY0FEfHELZaaBJ0LLTfmGgxv67Otmd0wbjno/C9Cqb5bcL7r+bBVMXuAGRCsJ87MXjj5
 jdiJqQhfvzdPqfs+KW0QeXEbrem8XNZkK5Mazz5D1a1GJPRcqaKTHYhWUH6hJLx4yQMy
 YLbM4++cDD6GtThdNaxqqt+TUVsfzPXyes994YEYxZUvsC+AmMVch8xUmDQnh1DKC3rZ
 jgtud/lU0h0qmO0cJBGcJMu8C2DKgxEqmzhuNr2yeV/fPIFnvQvN3MxYu0QvMJ6m5JjV
 DiPfMNx8j7Bo3/ZiOhqgS9ttfFDnSXpynKPdRwgnW5INHrZKRsBqUWkpbpbYay0+9BMI Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeX049074;
 Wed, 22 Dec 2021 19:42:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHR/TXEgLjgFie+++HD0LTlb/T/M6D0AUVrlsstz3UDyz+oUwif6bKbeCqMRTjlrLT2H/n7psVwuloq0Rc5hJC2qkfVC+u8X8AIzo76VPXsWTaSU/izhCovdJVMxb1kQFRej061VfG1V7M/fASTgxK/HUkj0kXROvFNg6QnuohNbfyF5powNVI/0xTx7+DBAL1VC6rbNfHipZWJa+Waf5mhrcUENrvo5uXdnvgxuEBn+7Lg1cUb98Hd8BY2A/GqK4/T35cc98uvkcAtoY2iCO21OKDDXeuz/WxtMcX9KaGNNO0w3KFS+fAob/vNQKdkRctnEzeRiUnBtvzYaGlHHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=mWb9wjb8J8VZ+G2wtYqADRY2FRwURZzHttpTo7iDUha0WHHAG5ug49qNOUHYCsv5O38+TwGQnBKeYBljTyuAfPv6NZD7kKIX+SQG4/4ttAhLlda7cCNsjHwTS6rbaqsTQEYb+mbznbh54JEtVNb6Gv5mJXKiimjIsyjEHFuPrd5GVjBwV9TRBZxC5Rmg1caNj/eUfojmPsaTusGGDmIdQAJlUFJru2o9k2wE6zkMK4W9DXFeLdKZ33nXum2efCZ5gv+VYAd5+6lrygN0304O38w5uY6508P9+euTCUi81LRjGHLgGLWbmNNzNMXN1hBZPitIMkfyAGLrbKM9m+svpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=pltakAes9s21LVplU0CvDklzEGalGyufiEonIVF2BYHj/gzTFvtwRJvA5EJHQme0RVxCdwZPT3+DwnTqJtb5r1ZS3SBmsUlqz2OcrDmXym++SStNFA6IG1DJKFUTducnIFGxftPssit3X5Cc5o0TKP80XBXPvTA6aXexRcLpeRU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:57 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:57 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 05/29] vl: start on wakeup request
Date: Wed, 22 Dec 2021 11:05:10 -0800
Message-Id: <1640199934-455149-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfbd6b61-65db-4ae9-c806-08d9c5831cf7
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2888ED9FA15F0A89B9D3FF6DF97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NexJOJiDDwo3/a2bovLUrvfgWEX5LGBDak967hmgVNBbyqA5AOljNY+u1G0oJvZw2PnE88VOM70DHuwyhtz2HIYi5EhPIX07NCZz3iXQamHCusjS24KxdAsV6FoijKnEKhVYxjTFc6IX3rbXfqtF1umSYmcbD/lah92zneAT9z348lh5V/4YlBdztLUWC8LlIM3mvu9itk4qeAJd1Bk+hZw2xB7YJFE3BIEoK1OZ0NhSjBUHGNBrN7xf9rKKANY072BFI1egbLrtQG+7vVtBdx+rdBJvDuyU2lpaIZr3SZO9V3BbSy81wakFNx1m7RBHs/M8FNYWnr0j0CTGI94UHB65U6lOh7+7oPovB80iakFHvQKIHFo5JLqgGGVaDjtBk670L6fmWpzQ+qt54iz5ktQ54W7fLzbaJeOiHdxnxVvxlNLv1/Qokdc4WIg+Jk3rR/yE/llEN696yKk7VA9/mmS5ED/Jgp3YzW1DbzSnAPYoxk6voVmU+gKuWaIrRbQ1Fiwi1FzdYdTPuwfZbMLKSJ3UFNvpEHZ/jF8/39Gcq3+/ETmOu1reVr98c4FKPGK2UhTFbo/tEWMX03XcZ3tfM4MAdcHxQlrvLgZLtkrgvaJb1tbMGLU5owU8UqYrvA/uxWcr4L57jZo2r2danyptd0bw9/3/3UJ/P4yytD4g3NHyh3FpLdXxSOc86AQlp9FBZd4mOvlmawtd+kBGpRHxUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Tx0uR+8gXWHuvknXVzgQJuUZ1L6J2/Cnl3NBsHEm5gbiIXRjUEOW5YLFxsR?=
 =?us-ascii?Q?26Y6crNSP91xRcoskOpjT54R6pJUVqCwEa0dREQquOxgzgV6iYAEAWcT1Nst?=
 =?us-ascii?Q?cHwN3TAh+7FovjOteI87gyvaRx3Hs+bPdaogewILVFHPNKS32VM9xhyDF6Mh?=
 =?us-ascii?Q?5gipqs741Cvht5wWSrbFQuaOzzFOtgkYrCa6OHll5GLcYMONvT8Egkv3do0r?=
 =?us-ascii?Q?xx8IvJPjQOGlIWi9JRoCCSqnRbhxZyv8vlKEojAh1aWS87g5aEQBkmDVmEj4?=
 =?us-ascii?Q?gUvfFQdu/5yQJTWgSFGOrXhX972RVf7P5Kahi0o9h6GC06/ETFxoHyHJpBvE?=
 =?us-ascii?Q?ukQM++PrfVE1vGFDL9tbD0U5V9pwiZTPS7tsmptuOxD6ejZ0SsEEB6ujpyii?=
 =?us-ascii?Q?q8Pdc3hZa1DhaSJrYgc6wrO5Ay1louhDXRIDOjoRTc4oeo3vrcfJ47V60IxO?=
 =?us-ascii?Q?ssqwXChpjj6r5ndI5ctVYpgiSmERaBpsIKL3tCZGa+v+eBskR0rsLhbAu/xP?=
 =?us-ascii?Q?StYQ0NM05gYT34+PIIDZL+Fb0Fwn93Zh2gsh/b/kPvuVJGdgpyDtPIYklfqA?=
 =?us-ascii?Q?Ao2WwB8ldz5+mCYyQ9/uPuDEr9JrK3dgdD/xphBeWKXVsnq8/KFqogi7rBy7?=
 =?us-ascii?Q?o0rZKL8/FNsXPTlB7XVRyeN7f0ip+pXJ8mQTmIAG20tnku+IVcpx52iPAAaa?=
 =?us-ascii?Q?diXYGeUjeGde96Z45/8ADXTZxd68JWumiypCNi0CAY3pfafDamKSr1nijC3P?=
 =?us-ascii?Q?d8t11lLukOAOkFzYTX+1MVN/q2iriWzYZtzVbiqXymDa6t6cVxwCPorRpFTd?=
 =?us-ascii?Q?9VqmIXOyrXodXi/SVq4QvKr/e3KnAq/JgzNAXYLU3vRKrpxBZo9qIcpva4QR?=
 =?us-ascii?Q?a95KHUjZ6609LDA1rLZeajLuoR/sYMfWNI13zhMfo9cy/PtbQWIFBzkuLBBg?=
 =?us-ascii?Q?YILxtHSzNJe0zD1pCIvw4AZqiIa+pKnf3zbGaujjcga0GsbZjQAWf7zlAkDQ?=
 =?us-ascii?Q?SFIKPzURrbvcUdAM+q02z8U/SYhqkQtbDJxr2WBr7xF1+9Sp0anzgs3dG2Ol?=
 =?us-ascii?Q?NphnWml0ko9IiuvG4CRAvcswuDHr1WSR8RRtJB0jLRC3QsB11rPr19boU5hE?=
 =?us-ascii?Q?xyJpGLCdwF1yA5a137A2B39QL10CWeikMeC0vN4zswl+aAHk1rpuN/w5nM27?=
 =?us-ascii?Q?hzTtz+TQvc2TFW/0HFv6ngJTTupELEI7qlMzc3ELEM3jE+heku7v6Te1OAfF?=
 =?us-ascii?Q?khl5qXvAd9aiJGJOH2mZ3S9V+3woaYLzdJm50nTK3r+NgK4awjfF0fZ7s0f2?=
 =?us-ascii?Q?QDo+zD/x5QFgQIkyF7x/p3ZNvSo36pUXzglFnQunzgZL8ftqCW/edZ7sBc0t?=
 =?us-ascii?Q?gNUoevVvSm58L38IEiPndjTkZI8erJmGRbuTLuJDQ4b/KUNzWWf+oQj6oPmE?=
 =?us-ascii?Q?NY7Yccw4kcO2Oj5uJshTaddKahhrkH0rNjCZf5od+YfhdVIDf+TLAMK1lD0B?=
 =?us-ascii?Q?K8H6Kz324ORZK/OtJ/kU2oGjf4paJ1L7xCSRIvloBBZYz9uL5JVv4KKZpE9K?=
 =?us-ascii?Q?xdA0d3dCKqtVf/raGwk8zDppayFCtzL6rRPF5ZbB9aHhlsy9T93OxIFivySP?=
 =?us-ascii?Q?kTEPR/+J+cPa9m+N219pZVc8j6a8psACDIyhIAnTu7HxOdljmyFOXaiZKr4a?=
 =?us-ascii?Q?2mEIdQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbd6b61-65db-4ae9-c806-08d9c5831cf7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:56.9211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVTO8wiDVcZSgGche2r7YQ/xDxtJoNEeq+PN2iujTFVrBhQBJqODg2guprzInm+uxEZj149UFIauXUwiJDNMsDddzU7b+qQVo2sfZIY6Dys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: av_PZOQCeI9iutFU2nIjGs32aGc6dzm8
X-Proofpoint-GUID: av_PZOQCeI9iutFU2nIjGs32aGc6dzm8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qemu starts and loads a VM in the suspended state, then a later wakeup
request will set the state to running, which is not sufficient to initialize
the vm, as vm_start was never called during this invocation of qemu.  See
qemu_system_wakeup_request().

Define the start_on_wakeup_requested() hook to cause vm_start() to be called
when processing the wakeup request.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691..b655c7b 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
 bool qemu_wakeup_suspend_enabled(void);
+void qemu_system_start_on_wakeup_request(void);
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b73..3d344c9 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
@@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
     }
 }
 
+static bool start_on_wakeup_requested;
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
@@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
     notifier_list_add(&suspend_notifiers, notifier);
 }
 
+void qemu_system_start_on_wakeup_request(void)
+{
+    start_on_wakeup_requested = true;
+}
+
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
 {
     trace_system_wakeup_request(reason);
@@ -574,7 +582,14 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    if (start_on_wakeup_requested) {
+        start_on_wakeup_requested = false;
+        vm_start();
+    } else {
+        runstate_set(RUN_STATE_RUNNING);
+    }
+
     wakeup_reason = reason;
     qemu_notify_event();
 }
-- 
1.8.3.1


