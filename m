Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE53BED28
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:34:27 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BRK-0008JN-Lw
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKT-0000BW-0g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006jc-OG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:20 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCl4M005038; Wed, 7 Jul 2021 17:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=QxEkZv7BDVxU5n7Cb0DWUXFhD5bjhZHhOlCFAb616BY=;
 b=CSOvrsxz9uwWhBZtlghKWH2ATVwoHG1U5Kauc/rIXRbg1rcJXMD5l6WffDpvNvmRWtHb
 OSJgDbAPInQd6Qr41OOvHf1iBVTqvhKmB87cD5h7NWQn2wN4NztlKap4dxRNScg5Lcj9
 /xHnt9ZPnDTX4loUAbDbssZuI4ROR0+JetlkovX4aU7QJlMTK6CLlzFEb/itZhlkj4qv
 DgLIeYjfffMQpnigJcworqujNK59d8LirWzdn9TU4XcYPWvqWT5JX/6HShsfq+usnXHJ
 YRG4/oh+DEUzERabSaB0xD8BSM+25FJ0ZOhfRluZkZH15IfdWjuL1ZVlVc/Ftojm0XP+ rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n7wrs7pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAMKo068988;
 Wed, 7 Jul 2021 17:27:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 39jfqayxx9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF/5wxcuuRR0gJLZylUT1SD93OOJ5mTtpCguGLMiKN0tsp5gQBeHPc+Awy2M59BumeMtPE2FwQ2uTD3oiZkqJsMCw1J14vb5z05sJYPepSWK9O19Vitnc3aU0hqRw5YLxLR5I+IM0YdCpEj+1HrT2KrVrbyhtRQGQime74c1sAI//LUzB9nWMotdmth3pIOKYk1J1+tYdWWn+ZN3bLqkTpzDj+4GJ65Edn+oZSU76rFiF/LCKcGekGP9Z6yoJOs/eVKzQv4Nc4kJjJDMfejqB3gXWHWJS4ZaslU7mbioL3WudPiJCVCCo1sHvc6lfI/1iYYhb0TusI0HmeZzbyd+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEkZv7BDVxU5n7Cb0DWUXFhD5bjhZHhOlCFAb616BY=;
 b=k5H/wfJuiT8RX2HmmPhfPcUk4hYxMJWSAX2iqMNJbxn0OfICpjUbb0N7opnvkottL652hryF9cWCbEKfmQ7ulqIuBNM5dfMYoULfu/htwApXP4aREa9K13mTkut5KDCTEfD+q6Q/d1aJYFTAJGG20ZqOEfl0aygVLfyKh63f2Zr9+HTr9OcX2tN0fbQ/ZJxASdXrx8MxwttAQZDmJYXFTdG/SZMX4Wf0rZrS1Y5CepJMZncaTG+ncAiJ7SMYm3D9g398VHrnqkUQ3/GdBArn5wyFWTLToAkah4ZUNnWUbjDWn2RdokGkAB2vHqw67lqbq4bnP3FS3qSA0PkoSE+jaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxEkZv7BDVxU5n7Cb0DWUXFhD5bjhZHhOlCFAb616BY=;
 b=IfRhU1UPqFJPBxiH4uLpbBYTYeISurY6UjBqBNYctqxTQp3fLznKmuWKp+VSlIthHPsvl0pwuxwnnMDoBHU7K25F52j7atuQGxSomE/Yy2p+0S2Asl5zy0rNXXXK2W5qWeGQa10y2IP1P0RdTq0ihpTbjiccWP8BY9V4icjN7B4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:11 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 06/25] oslib: qemu_clr_cloexec
Date: Wed,  7 Jul 2021 10:20:15 -0700
Message-Id: <1625678434-240960-7-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0fe94f3-3801-4973-f8bf-08d9416c7454
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB328568B84FEBBA696AEF8B7BF91A9@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u67upKuRJo4cijwsuyrGOOjSjh6jWctTkd78oMWhOCnU40giSBl/wA91mB1/9qLYTWfvV29p0xFWP0tr44GeKX59aQzr1UHC98+b6Qo9Y/G7uG0IbIASCMvzlIdAh6++yUUmLva9NFj7jOG8l0fQwRq3y+2DETjjAdcwe2F3pCkVaqD/VYHK4UX1m/YwuGnQXg8nT17KctPWRUsmQtkmLtsNGoG/W6ZBDtFrfBA6q8mU681iHkfklbYb96PehHfad5cWXz2wd2fNJYe3egt0mdvV2EQmLJ8RWTqn2+IAPCtn7smBQ8Ki5BsSZaXFKXURiGCzmTScldleZCqFWY34FXlvpeEi3boFPkXZECgWKHCRbcEbYyMZJ36WvxyLFJDTIOre08504SFCZNVW0EnllZWsHYB+VuLcWLg6fhRHUQHtakBQScoDS49Pv5g0fbZ6H1ZL+OoUMZXKiBdNy2+puPgz3H5L+b5V3N7L7oq9TPOjrTOaeHXdv7nh4dAlM7NH7yTLn8q5uxlCR3yOTgGw+gHJlDGWLFd1CehAWGlaHtkYg5tb5NpBbvgNtdI2pkPG7WxKn/bHrzkaTRiO087yoFzwpwFFSO+GpBIANkwuzDg6UgJuZ/wLWFuS39CJw6M+fnWhEzIn4XpUcBVHXf4di/SDhvKY3EqWRKF1MurNw4gqNwTJuT/D8g/SYRUTnYiYgFKyZHG9oAzzydrlhwZ81g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(39860400002)(346002)(4326008)(8936002)(54906003)(7416002)(66946007)(38100700002)(38350700002)(107886003)(86362001)(7696005)(52116002)(66556008)(66476007)(2906002)(36756003)(6486002)(5660300002)(2616005)(316002)(26005)(8676002)(6916009)(186003)(956004)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVcvsO8D2JYBtfLL7bzcSiJSMdoakZY2j5DosL3/IlDQTQR4l1iMrzO027l2?=
 =?us-ascii?Q?C7/hGylbiVUeBZBhz+OEtWd56pk250ek8jJO8tIlxZDQLEo4hsY1yXHWtsyi?=
 =?us-ascii?Q?NQcFXQE+r35H1sZh43CqrfVaE/3Wzlja8uL7DXO5QAbkZUYPD2ysaNmTfoJh?=
 =?us-ascii?Q?vVaPNnZREL14sNadApB49hDtkg9xdhbD2Z0RZXjskSjs2LQpCbiUxbtNfoJ6?=
 =?us-ascii?Q?P0o9w0Pb9z9S6GFjVQfXImkWWMvijQg0++OVsmjNVuiBoVHI0bmBZ+FAb3Q4?=
 =?us-ascii?Q?mC1JWDPr+IfhGcUeV7s1MX8+bXie+0DPO8bfYYy02JVpENU6VdcFpMuUWt9U?=
 =?us-ascii?Q?c0VBsYv9dTdDMj3EkihJNEvHgHc/LfIBBPBGgsUa86WJIa93AryX4UoqYoEL?=
 =?us-ascii?Q?8du+GHnjbihOzkDCH4zvwvrWIr09p0GYzzWuqzpeg6V6AnaxwJxiVmay+ymn?=
 =?us-ascii?Q?Nb7hsn7fleyxBeGnXeFDU52gKCw0PBsl9EegD1VEeuzASWUgw9FJ2zcnomm5?=
 =?us-ascii?Q?X85x1T0Q/cFAAt7KfVbUSvRY2xXQmcPeP7qnOqXhjM4Lpan4dxGOCHyeaoph?=
 =?us-ascii?Q?ogENByh3tNQn5KT0CrO5Q+8OwIm5LdzszBmVH7fzqg+K6FedcofdMZoYBXUp?=
 =?us-ascii?Q?tWTFsZWjAG9k/dmXXl4tS1bVjM4oaNCuoWAcHQsmFQf8RtxRFs/Is/32d2FD?=
 =?us-ascii?Q?Czg0Z4mHg1O8GHCcxRO21znJZ3NwJ1I/nj6K0Ppa4qcarIDYjLCWwEPAk3RV?=
 =?us-ascii?Q?OTURNqpap8YZZCI/ivzo2ZgCdOlIhK8mLuE0QPjcmyTplbn1V0h7J8zDnCqM?=
 =?us-ascii?Q?ToS+UJqezishI+HEdv5clZ6CTphePAGtH4QJjtGrbkeTyUIrKzXRIwVEo+Vk?=
 =?us-ascii?Q?AnCqOzOUd243esZsbP1wEY8C6Bw8BuHkM/Mqn0pJ9GcIR7+yNhz+Zfs6rWp4?=
 =?us-ascii?Q?fu0UHc9HBiu57M27e12zF8haEDwr444ygS44VaFNTyHRkfp5unx/NZMaf9tJ?=
 =?us-ascii?Q?2iMz8Nr56eLqRUOt7s2gryRLXlWRjZePW5yB4AtD9SIl/TNVFOdQT3hlRlBT?=
 =?us-ascii?Q?9tlnah+Iwx9+8dOf34N4H9zmgZKtWjaCKqISkAlQY8TY/CmLvmybbAhbZtGU?=
 =?us-ascii?Q?CUK9YphOyNmcb4vu9VtLlfK4IAkh5IFU7JCqSiKXTuV7YtWqtLM/BCXTwanZ?=
 =?us-ascii?Q?bZM0ZTq4szuB2YDufvCs/rapD/rO0z+9/uaHLWLA/MpRiL5U8TllxDlQg3JL?=
 =?us-ascii?Q?o9ojF4uyntgb/vaWpD/En5MWcPu+TznMCfbcBup7IrPeRKMvisSBTFuseI5C?=
 =?us-ascii?Q?UsA4pQV8Vg1GVlvhBQtSeEMf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fe94f3-3801-4973-f8bf-08d9416c7454
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:11.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRoyYY2YxGeFDVxVWkSuhsLtcRTEW37YnkjSiUGB4oxb+pt0jGoz7JUyQpe+tppnzqujECl69q1nL1s+YNm3Yv7C5OJ7Ct5MHZPY/iWhTxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: ot9MTXs8f2ZbJkkv2MGi3mNBu90E6l64
X-Proofpoint-GUID: ot9MTXs8f2ZbJkkv2MGi3mNBu90E6l64
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
index c91a78b..3d6a6ca 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval *val1,
 #endif
 
 void qemu_set_cloexec(int fd);
+void qemu_clr_cloexec(int fd);
 
 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
  * instead of QEMU_VERSION, so setting hw_version on MachineClass
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02..97577f1 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)
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
index af559ef..46e94d9 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)
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


