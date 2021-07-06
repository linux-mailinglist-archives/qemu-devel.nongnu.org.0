Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093393BDBB8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:56:41 +0200 (CEST)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oNE-00006P-2U
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJX-00006y-GA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJT-00082H-2f
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBZ4003703; Tue, 6 Jul 2021 16:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Y3v75j5hEvii0ehO1Ozh5SnoZ9rUZ5E/qmgoqrB9aR4=;
 b=NEFsU7QQD8+QlxPLCmcSARyJWwTHKsI0MEGsYuBnPE5Db6bZBolNmkTRQRawcDCS04aI
 iIOzEESRZjqJslPWhu93OWssrn9IBvsy6Tw6z0rpdxYM7q+mdcl5vf6IsmZhxeFTLrKS
 p9ljLjzY0DR4yAJlaJKdFXxZ7q2Gere0PonzZss87ck5JZMC+Tw03M8NCAu7773XCOPb
 0VFHeR4XY6s84PDFffififgq+Tm5meotwcldFc7MFjb+6OZbqBGDtKNTlYWiIuQEwFsE
 XkLjiLK3XhOeZSJBdDSWpgXiJciyB6JiklNN6KFccA/v0JkVio/hawWrQrgOnXWJxCRs Vw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166Go40n159172;
 Tue, 6 Jul 2021 16:52:42 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3030.oracle.com with ESMTP id 39jd11nfxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiGPbJIK/+wUdjzYxGpe6axc5TFNzgZONw7aGHZTQP0Rkikrh2+Uo3WFOc+doKG3osGNn3HHE4j+k9FkiG3rY4DDbGOyaioEBSsHyB0WT5novdLfW71RiVsmaF1kzY8m++orSsHMuk1VvXkAeWZfD4/yD0ynrBOb5dL/40Iv1BvnG72+xVo+qz9cHJIGigt4YS9FUort0/S5i3SSL4FYSoKlmc7wjlBPcb7UAdWPlRNOleHegL7AbwUNoMJ9Pbpr0xBCAk16iM28EyzfCMdM3YtogPVvhjDZiZeDnIausqXU0CdqCi5bRM0wBPR4WPweM7+LeOKZQI8ul6WyHpe/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3v75j5hEvii0ehO1Ozh5SnoZ9rUZ5E/qmgoqrB9aR4=;
 b=VRaZIUa0YEdr3h4y0ZdkEBPUoxEJNfq8A+w78smJ+c74/otp27CbzEBegKwEdo2J5G4ljhy9cLvx8Rhjqm41WT7VceIL3WxlXWzemrcFS8tnu87mA6VP8jHHfKJP6Lt2iISqd4Rf5r7UStriUU/f/8e8A1U8P7mo+58Mm5mjXebNuvd/4APcWqvtGXpZSvmX+JvTh/Dtdl1xJZaRgFAJoJzyVKVGlpDbSwwD/WDUs6jHygQTh6NZ3XMM7KApXti6Ku9rGUNYFzfFJWEzZwzU4jLU6skrIH5uddmptOsvifkb7hanBz3s8ov5j4Na/XPfmsprfFP1CRPuz10c//IQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3v75j5hEvii0ehO1Ozh5SnoZ9rUZ5E/qmgoqrB9aR4=;
 b=LqObNkeXMbhB3eHbNq/YLje68yu6ZOykLPr04Gxkpv2Of6KJi4iAMvQczaaJr5gc5Z1dVXbk+gf6aNwzkNLbQTxiNsOemplt0yAsB4/EO4aQWT/Ezy+AhyZH80OB0zqGSuL7MC6YdBIQy4C0WevXxJrtaXH3fWdJSIYdw+/GUTk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:40 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:40 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 02/25] cpr: reboot mode
Date: Tue,  6 Jul 2021 09:45:33 -0700
Message-Id: <1625589956-81651-3-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b8ac77-72b0-411f-b39d-08d9409e776d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB29826FE7B46264DFD86685DFF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMS9UWEfA8vKJgmEY9MMp7jMhljrVnBFE8gmBSZXQhSkPx97/x6JiVkX5XPtJFzDCcVe36s4ZkDVX7ObQdjP2NGFZU+1rjC0TQAHwHOS7pkaGQdNi7XHs9r2sj+5ZsYcDf8n/rDweB0Z1aTHSHoudIvosLeG8g13j/E+eIivJImYE1wev055w9AIkJDeq1BI4uP9HGJJg1WngkxNfRMuR2wfBHEQyAUsHTRpal7HnhU7EK4tEVh5K6xL7va/bnQ4s6OlNF7NnKF+0KEwCY9pKCcAW42Plmd64vbIXmrwk7Gb0ExniUMFI1FUCRCeq4r2QCkr4LQdP1Mw/Bgdd620luKAZy6ntHAMt/TzMY4NVJa9yfycGKHFgQCbT87Jcvyg9RBBjydcbj1hQZK5XwSXh9kJE9q63MNedmUVnT+9b/8vIAJuIBIZk8Y9CCTrHZIXe+FUcQwkEBUjkgxcwvz42nqJcjAvoo8gol7e8+YL8rUgGkZtLTsmM7f0v3p94NYhVZCroicOPtCbbCDeCbGLeNKU8Oy8DYYP87pI58zTCHvYTOnJRphfZzjyVY5UWrl8rTKjzeRMiVG6XxaMKK83KZujQFFTw9Y7+LZrJJVJ9ZhUhsgiHEKTNr+9aUo45mPLLlJGQirWJI87DGrvhNyV+mJDqHUr7ul8rl4OqHnWvvTdnsPej2F7ojXFTQ8PvULe8cDK9TiR8bBRaVpmBHWwxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNHo4yaH37X85ifW6KGz2vPTFOnAV31bZU7vI1ahBs70mLhAMJHBx6L1s3Nn?=
 =?us-ascii?Q?q/DlAwlwPFLqCJHo2keEQZq3tt0vh0hXMHcVg8a8hQ7L5WoCNyyMFU3cV9ci?=
 =?us-ascii?Q?ZBHy048RmPZ5XCHLBHUt4DmyVU5BIhcn4MHtyBdZXHZrbysksgg4V1TpJ7wP?=
 =?us-ascii?Q?hmhALBeeLba6VhwJsGrwaIDX+nVw/bhldgX9ChDHEUYfUGCTP6dsJtiG8gt2?=
 =?us-ascii?Q?1Kv0FW9wq74MKAWmvzgkSOmCHjc4z6QpgxhOp0DjofVURzldNhfXOzWMULBW?=
 =?us-ascii?Q?3IUPRJDQsJWMOvFPnCWqThLxzo+7UfIBOayaduey4qHMy0u+YTRnzFgYwi73?=
 =?us-ascii?Q?f1R8PiVUN3MynIUrnQpQe5G/SXH5EXwtfh3SgQWiILwn1bcFrekM6pGv5/Dp?=
 =?us-ascii?Q?RJhDJHgNc5o2QXzBwihyHKNixbuhu9ctxEnqL1HKoATXJKNibKl+p1xB6o9M?=
 =?us-ascii?Q?4mABYUA7y3GXYOdirCNyB/qMobcsfbadT/WJzjr8QXxck9q5UwlwAkLK/h4+?=
 =?us-ascii?Q?QmLhJ4RPEfFcNBuNWKL5bTTVXcG7wQJzt3GCowaGBFj2hJ7UW2rbq1FrNtl+?=
 =?us-ascii?Q?R4a7LcMtdPbybBtzQyXD7dc5ifNbE236Ss6E4N2N2tzUh4gNHMGvHV7UJFWU?=
 =?us-ascii?Q?YzsNgyBnevwqwqX0X1+BB5gBJnBjGOMIYMB3dTsuKZG3MuAEG7E2fXCF1fpe?=
 =?us-ascii?Q?vsJpUAu9sZiFjbQgQxA/Ok2e/PLou19YT0gTnn1lmVYuU7ByxszeGW9Xc9eI?=
 =?us-ascii?Q?utOKv3BisLyyMbbRj2a6LC7mcVzobqSBNbe9L0z3XJPWKMhOt+XAd6NCQee0?=
 =?us-ascii?Q?zpNuCTtOJRZ8tJzH5qgRvTjHGbb7q4nPRzxdc0xT0fkKtAiBO+eCrSX+APa2?=
 =?us-ascii?Q?l8NTffKywbDPeiy/JdMvMXw1WCqOv3j4uCh3ZEaSi7gD3sHAgu9brDnCcWtL?=
 =?us-ascii?Q?K6zy2tDDxAKn7R+95qNkG1izVm8P9l1fL2VYAdS9H90vguhEhyXKEXazmubG?=
 =?us-ascii?Q?DFqyO2OiOzbKhtoZOQLxyBtxzaxMn7l7HzaSXJC4ofE4859ykkSv53VXEeI4?=
 =?us-ascii?Q?Q8S1oL3HCiT+Aomvg/sbZk34vGwchkKrI1VZBeI8jiMXuFngaNTZp1dgF0qs?=
 =?us-ascii?Q?6qJS5zDyGEid6w2RMPB6c5jqzGmVw5HP4lnZV7dWVYmnryULjtepMWubijhP?=
 =?us-ascii?Q?zNJNdek3XA80Q8xKZ2NCLSfnUosLRowkbwWgjn9dLpfFAkx7P8x5X2AQSRRc?=
 =?us-ascii?Q?7Ax8jdA8tXmfNKY0wBkQsm1Gvf9/YNKZawboSBYKJhIt4RxxKqDEWlE2NTGD?=
 =?us-ascii?Q?PT8WPRxa66qEkGO9I8DBqZv/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b8ac77-72b0-411f-b39d-08d9409e776d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:40.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twmuPvycmcL7XtY5exnx5iL1jC/NTULMy5+9urYoVuFeIrW7bBwt6cbnY6HtuRrLDaFqU0cIypyQbzw3mbEZVc4tIotDT59ZkYJM1hoF5bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: vpEFUNSqUcAVF7Z0VfaxYky7PZjg2Gpd
X-Proofpoint-GUID: vpEFUNSqUcAVF7Z0VfaxYky7PZjg2Gpd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave and cprload functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports any
type of guest image and block device, but the caller must not modify guest
block devices between cprsave and cprload.

cprsave supports several modes, the first of which is reboot.  In this mode,
the caller invokes cprsave and then terminates qemu.  The caller may then
update the host kernel and system software and reboot.  The caller resumes
the guest by running qemu with the same arguments as the original process
and invoking cprload.  To use this mode, guest ram must be mapped to a
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

cprload loads state from the file.  If the VM was running at cprsave time,
then VM execution resumes.  If the VM was suspended at cprsave time, then
the caller must issue a system_wakeup command to resume.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS               |   7 +++
 include/migration/cpr.h   |  17 ++++++
 include/sysemu/runstate.h |   1 +
 migration/cpr.c           | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build     |   1 +
 migration/savevm.h        |   2 +
 softmmu/runstate.c        |  21 ++++++-
 7 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f1..d337446 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2843,6 +2843,13 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: include/migration/cpr.h
+F: migration/cpr.c
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..bffee19
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+#include "qapi/qapi-types-cpr.h"
+
+void cprsave(const char *file, CprMode mode, Error **errp);
+void cprexec(strList *args, Error **errp);
+void cprload(const char *file, Error **errp);
+
+#endif
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691..ed4b735 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
 bool qemu_wakeup_suspend_enabled(void);
+void qemu_system_start_on_wake_request(void);
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..c5bad8a
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,149 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "migration.h"
+#include "migration/snapshot.h"
+#include "chardev/char.h"
+#include "migration/misc.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/replay.h"
+#include "sysemu/xen.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
+
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                              const char *name, Error **errp)
+{
+    QIOChannelFile *fioc;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
+        return 0;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return 0;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    object_unref(OBJECT(fioc));
+    return f;
+}
+
+void cprsave(const char *file, CprMode mode, Error **errp)
+{
+    int ret;
+    QEMUFile *f;
+    int saved_vm_running = runstate_is_running();
+
+    if (mode == CPR_MODE_REBOOT && qemu_ram_volatile(errp)) {
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "error: cprsave does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "error: cprsave does not support replay");
+        return;
+    }
+
+    f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, "cprsave", errp);
+    if (!f) {
+        return;
+    }
+
+    if (global_state_store()) {
+        error_setg(errp, "Error saving global state");
+        qemu_fclose(f);
+        return;
+    }
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while saving VM state", ret);
+        goto err;
+    }
+
+    goto done;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+done:
+    return;
+}
+
+void cprload(const char *file, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cprload called for a running VM");
+        return;
+    }
+
+    f = qf_file_open(file, O_RDONLY, 0, "cprload", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "error: %s is not a vmstate file", file);
+        return;
+    }
+
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        return;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            qemu_system_start_on_wake_request();
+        }
+    }
+}
diff --git a/migration/meson.build b/migration/meson.build
index 3ecedce..c756374 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342..ce5d710 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+QEMUFile *qf_file_open(const char *path, int flags, int mode,
+                       const char *name, Error **errp);
 
 #endif
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c..ccb35cb 100644
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
@@ -334,6 +336,7 @@ void vm_state_notify(bool running, RunState state)
     }
 }
 
+static bool start_on_wake_requested;
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
@@ -561,6 +564,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
     notifier_list_add(&suspend_notifiers, notifier);
 }
 
+void qemu_system_start_on_wake_request(void)
+{
+    start_on_wake_requested = true;
+}
+
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
 {
     trace_system_wakeup_request(reason);
@@ -573,7 +581,18 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    /*
+     * Must call vm_start if it has never been called, to invoke the state
+     * change callbacks for the first time.
+     */
+    if (start_on_wake_requested) {
+        start_on_wake_requested = false;
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


