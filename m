Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145D3BDBC8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:58:45 +0200 (CEST)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oPE-00059F-GI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJc-0000I0-HV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:8016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJa-000837-Gn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:56 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBRL003724; Tue, 6 Jul 2021 16:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=N+f3B62Uq69OXUk1DnFhmpdUjDdZh056FJ3uuY5Hj7Y=;
 b=UrY6tJreR0JdxQk6+nr02htxLCWz7QroUterExiRF3BJFDZQwPhAZaT2xQdkJchNlkkK
 eijotgavoH/iTeGDHF3n/CdEQ3no/BH23CI8w+hFwXPbBi1sf38Ypd7sgDi8Ag5tJRgm
 PG5VXsqr6DK10L7SLVV7enF4Y5i7IieCTQSWlJf9+xYb2cYKnPiW3rIpfJ7YKSfr5T9a
 dQP1YLaWVHqTFWhrpvl5iUWue0y6Oo80u9a+0EOilYmqW99UqFshluYKyUY22Xi+1eOe
 4VOqVLmvbsS84bnRBucYiXbRtbRwUKWZk4KfWS7Mp14TvKmhMEBljBaDSdllZVXJJ+Yl rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoTNd003614;
 Tue, 6 Jul 2021 16:52:50 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
 by aserp3030.oracle.com with ESMTP id 39jdxhgbmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+S3QDD+Wn/v0lI9WM9qcb/4EKq4nz5jGap+8d6qe/Z9wibH3UUWrzQZbJOWsSga81I4j2FMy88FwNGQDc8ZWIivlieduNIOyOK0ur5NkYFizQ3jD/xbfl3gU/e0vupLPkCqdQE2o8ToMRPsJ15v1XTFkmVA9JFU+r+iLWSV+X7O21CiInAv02HOu93VE3aoCFWqHdmMLNo+TUx2I1K1KPlXdWEdDqbjNdC54ZDxmlLIcu/0R+nk/MPs6n9lnyv6WjBGWAeRs6WDpaV1E9ZueYnPiPsa8OAtTjKF0iRAg6rTd21bqHaAlhlpI3hNykRNOaUxIRdVAgYqFKiImzKeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+f3B62Uq69OXUk1DnFhmpdUjDdZh056FJ3uuY5Hj7Y=;
 b=byTD1W/PuG8BqCfV6B042q2J8GsVvUp92XDas9vARj7+aW+J0bo9pFVkDKK/EJsVme0wJv7tXoBNV8v0pdVwaMKApqTJ1K87R834WKcggeQQY0lM+9Nx1JfIyIHCukbYab0R9mWt6b/JGaTaRWl0Sdbzj5p8wU4BVvgYkXtDedy/SyUCwPmAGSPdJ1iHDlREfyJbh1pi0cWGcxfd9GnpAMhe1B6rv/8OoWgD9yW4chbi1U9urlNWLJKe0oMQtoeajdi2zCMVhhlk2tJLze41NDpcLk8psuBQ0S8U4ZpzIokAFW4xoKEjKJ6xpunbvIrOp/LHWsv2Zt585EyTBGNpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+f3B62Uq69OXUk1DnFhmpdUjDdZh056FJ3uuY5Hj7Y=;
 b=HGD1TKNrAC5dZVN1Y21GVR3I7ysxJ6dXG3QreHWYSP1/7Kgxb31JmN53GJ4tjLtzggsavjSK9QX1t3KuGl4f/Qsr/M2q1D0l4MWHI0EtVW/Q8eLJNPHw8ZPtjkAFfsPI+kdDlY/XvonmRa800oBio7APRrPEBqRtAgu2hoQ/jnE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:47 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:47 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 06/25] oslib: qemu_clr_cloexec
Date: Tue,  6 Jul 2021 09:45:37 -0700
Message-Id: <1625589956-81651-7-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a8fc8a-2d5d-479c-e999-08d9409e7bcc
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2982E7706F14411E41A953C2F91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nLy7lkzHsOvSQEJGod0y4xAuvNymiMRs4rWgqf7NnRAxNpz6vLA4DlkBdEOHcqJKtqSr3TzNo6bIu5yZGeILUxgH7tV63pP0uG12oUnZhXM1y1rch7DxRnaTeonqdBZeXCLoJ01UY9bp1SBt/BB0yNDo0SD5+MPFSLM2Z5zUtrWt+bBpS6PxJgSo7St5VJx7wg1MG2cz+UbOprfsncIg6gc0fs9ei/V+AJKea4b/XWk9mhshw38E4qG5HaaBye8Q2Fs0eKfeuglAPZ9Vma0U0SEzvTeu8QjEDeeIMGGlvPMj8EJ7xQi2CsPhwyQdtA5ONp0eJNngLceYUoaJ/WvJTEwADl/uc2Z8p1jXiFjq9Tef7YeGe3sY4C4FBiTD6saSiIVphijC1Y2ZOxCJSMLIuYEjF4CNzEoEYP3rYwKP9VSPsuLsgEiwxlkgGKUBCFSyE2PKyZ6UhCIvw0NPqUUkWczrgCCajHnaggHogDiW1rtz60L+Q1gNes3bVvRLmVQnC3IvdP9cvq5mJghV9sQ9FHB26ixDiJOuOueuF0aSW6ZPE0z3p09Zcjn10Ra5BO8d9Wz1ABCeMoVBdO7Oocx9rG78w1r2LGDbnKTjBamhdV6QpmMtspuqdh/Nuul8RWFnt04aKnthhSiDLpoA8gMs2qOsrRDKHLJOexKw6HykMOUZMDKdCUc8W7AB55ailjSNTAxKLXKUwU2dm9ZmKa2Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TX6vkmQhsCIIjnKr1wUtjdoRbU4J4hFHmXpILgj0sEK79fZlb5AwRpG1JoQa?=
 =?us-ascii?Q?F5QJCqF4q55yJ1GZcw24k4ryC0cnXUQnz4I6ulzdUONP1WfOqJbY5vO2AJs9?=
 =?us-ascii?Q?s3ED6k5u6TWDDqVwoft9Tg9iagzgqNiKzQCFCHu/kxPI3lLeuVSIMVoLQ7Sx?=
 =?us-ascii?Q?c2afGUA1vEobr4yUO+Dz34s/0Hx5uuhZkhbENnbmL3uZF/rpIcals4WiNxHy?=
 =?us-ascii?Q?ozDi+S4Mfeot2P8LA+xuQa+sLe66kOCryPY8gaVGvimNZtFJJzRcsvfKPTPN?=
 =?us-ascii?Q?Nhw+30wOPRYwhLAmh67qfPE4ZOCNQLsHXMgxABD+BDmqiSM8kRXv8ApQsumI?=
 =?us-ascii?Q?K47B+YnX8w4vODIr7gXEyBuGIhvB8VsM1bm4o8Xj4K/dWSex5UxtT5D104N+?=
 =?us-ascii?Q?/mwd8JrHNqMbSFvw2bPuizoL060QjxjKjW4UM2M5NUJkIc6PKoI7VtmEG1hP?=
 =?us-ascii?Q?1g6IYo2srjg4D6FgpW0LPJ2bO4zUST8fN1MDYabUSe/BBUoUGRus7Eqy0Blu?=
 =?us-ascii?Q?ZROlDo8BD5wRWy21v+/PPyLt8OEfIpWUlXPkEvMRzsYmaZ5OcV4PfM2YGFk/?=
 =?us-ascii?Q?Plq5cvc9wu1xwOqEWcfK3ugVVVMz0ZvP8q61rrGSYOBm3JfPhxhCzi6U73G0?=
 =?us-ascii?Q?fWaX1J5BQbJ2L1w/ocFoq6Ipp7TJwOu+3QG+s9JnLZKuo+3A0jCJSgMtJvso?=
 =?us-ascii?Q?qnXZZD0vFixoGljGt7AyQAfcI0lSaTx+uHILAtJLnc4Li+72Yu4wiDZLM4zy?=
 =?us-ascii?Q?HGYYbnr2Q0RurN3FShouJx9cg4q15cENYgTK0UNEkDyq3J9C1m4XU2OateWq?=
 =?us-ascii?Q?3Vc7TybpLrZkDvf4Au6ITlQRdMequHQ+b1Q+sVs6GynBTiTqA/KLWMcUdJCn?=
 =?us-ascii?Q?ABkxX1LVCnNKMl/KxVul+V/306Y/zhybiM8Kl46sUHbDDTFf+k/zn9cXArIc?=
 =?us-ascii?Q?O1kPMzJ7rNozbU4h3Saf2nIXNWZ0p+EKtaia21QHMcmXsxYy/h7U1rl+F7g6?=
 =?us-ascii?Q?vRIOP/5Zq+BoL4oucggQNFVjBg0cVLWX3fQt5d9UmA03+jp0+AquIHOZuW/7?=
 =?us-ascii?Q?GedIWrhGA5raGbF6oPn95conf13jS26zdrGiBnJyUD1+H0omjCoG4fWgUCGO?=
 =?us-ascii?Q?8EUUGj9PubM9ciJ8XTJ8ihzKQ6RaUB3BFAGcSGfxtMo/PZrFlIM7UlMbqe/L?=
 =?us-ascii?Q?hRA174EV+oNVqHyKtOps6VXXcYajYt1bhfwOlQcTnUSfjjZM+CZ8XVPlUF2X?=
 =?us-ascii?Q?PbK3Tgvdc9QBhBz+OBDZtwZws54+p0SRII5OS3t4KbOJkW77eGkQ/JwMYuBd?=
 =?us-ascii?Q?4EGdUFX8VrwrrbmMhMvFqrvB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a8fc8a-2d5d-479c-e999-08d9409e7bcc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:47.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faZitj48k7mHbSj8SxtsMaGrM8QvWwj96P2Uf+kWieKtShEQKd8VPPRkkCDvSibzTixSIvyZk3yTSZnlg0janhqwrLn50ZzTd4+Nkzv5C4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: mGQd6HFv2RAa5UfHL48KLLH1HeShsWGz
X-Proofpoint-GUID: mGQd6HFv2RAa5UfHL48KLLH1HeShsWGz
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

Define qemu_clr_cloexec, analogous to qemu_set_cloexec.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/osdep.h | 1 +
 util/oslib-posix.c   | 9 +++++++++
 util/oslib-win32.c   | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cb2a07e..de06e60 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -577,6 +577,7 @@ static inline void qemu_timersub(const struct timeval *val1,
 #endif
 
 void qemu_set_cloexec(int fd);
+void qemu_clr_cloexec(int fd);
 
 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
  * instead of QEMU_VERSION, so setting hw_version on MachineClass
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 36820fe..ac9229d 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -317,6 +317,15 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+void qemu_clr_cloexec(int fd)
+{
+    int f;
+    f = fcntl(fd, F_GETFD);
+    assert(f != -1);
+    f = fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
+    assert(f != -1);
+}
+
 /*
  * Creates a pipe with FD_CLOEXEC set on both file descriptors
  */
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f68b801..b5c53b3 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -251,6 +251,10 @@ void qemu_set_cloexec(int fd)
 {
 }
 
+void qemu_clr_cloexec(int fd)
+{
+}
+
 /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
 #define _W32_FT_OFFSET (116444736000000000ULL)
 
-- 
1.8.3.1


