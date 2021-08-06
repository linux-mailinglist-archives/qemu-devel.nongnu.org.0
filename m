Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595063E3193
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:14:45 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC872-0000gj-8L
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85U-0006Ir-0F
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85Q-0003xZ-VR
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:07 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MC2Vs023286; Fri, 6 Aug 2021 22:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=XGXkQ3jWNIA6ceHjfyYtZYpqUzysLong/ck2LvV2YsE=;
 b=VxKmvbNcVfcp2OPBb9MiQa3BEHAX7BJXJDvjqpJ1WRSztQxx6Se4zbnAqCZCe408OyAf
 mcBDOlxmkgv9oOiGo7hI1I819KiOxRXyPxLdz554cOdWJfOWu3HnfYMD+v6hqfmw680J
 jzssjwrOAQH62XstRDaxVvyIv5e8mW5T+0VjAMqM8x/fbqD/mpHqXpKOOtJEIbRhfA7L
 loPgFuCx53xlPfU0CRfEMHIapuBVFqGMZd7F8UQh3aUqhR156YoqY1hzmmjvcUeQxurC
 vtWugilIKzEijJ6SEcUMAKb05GcnotkooxqfNaMWg7U5kCYDJWCk9tWeHeOtuJ8JiHmG uQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=XGXkQ3jWNIA6ceHjfyYtZYpqUzysLong/ck2LvV2YsE=;
 b=xs6eAzbUGm+DOMyAIe0AQ1rx/iaJfRDK09aT4isnkyW+5a/wkzvf89qgnakVTsDC42Qt
 VtTtekXGF2FXDwOWLErWfJ6+t1HRnezSxNZZeV12y/73Lxpu3IlBQRpBbmycQC/rvVpZ
 Zye0uAYOFpT8kzkUn2jPvmx+hcdlXVBFcnXwsJVEs2qI8MOh6q+gXOh2/PP19OZtAAnU
 y28IQpMAjEwJ8bahU1xREN2YWtNVhe5Nm7LFrgOlf1f7BKLRxARaNPkceNOvyzAMau2p
 nhX2kZDipFN8HqIjycW36RCP1FoC6Zy/58kGJguyrvTkyAiRje1o6LxGA5T4pSh9OCUj kA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8vy3t4x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBiLm013786;
 Fri, 6 Aug 2021 22:12:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3030.oracle.com with ESMTP id 3a962pfak1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbeMFvo8c0KFr6PUrqsP+Bq2RTTsB4RaxuM/Qzve4pxVC3RJ5j9dF3cELyzlr5KB9oeTfI8sYEVMtqn2OybYxib/RerahGuKY+KrrdTt2I2ylqU55s+aENcDfLZxgSODKpw0SpJNrdhcPvdPoavJWQBvqMCc4r/YxMfK5rHQvUB3j6Hw4MlzJiQX6G9iiTmEolYWI2rLFHMIjdgzboGOV3tvY1LJYL2FyJFezxAdtEqPZib9BHDIrw793gOYw94c70UxAER7+/lETPLYuXXaxem2nITtYDrpJ0XnjlS1GqqHtuPQ49Zm/XUg0a5WhDqscc0mJXQYNCZqbsBGXTyxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGXkQ3jWNIA6ceHjfyYtZYpqUzysLong/ck2LvV2YsE=;
 b=TanUzLRWaMMUSOW1SPbO1I9C2NbZ8AG0Cfa20cWRhq7g7aJ76uR+3IMjHjx5rZ0bM49hkbMzUM0xbJKzm8dvg1dj0XADmP5HBTgNIfA0W/VJlY9UE4HNWbRVCM3QvgosxFYKDgo1kYoSg3qT+wBOAE7ooq611AitgtUy+aLwD17uXt3R8ZQwyYNAbCRkmRwSZBYFgsy7wrSBVIUbzC6Crp/DvRalTlIZ2VBRfSBkIyE2aTfQ04o2TRQ0AVAMgleW7TMn9g81HKNd/WacwiJ1lBNj9EMNPj+aBOwUyWkG9ECXKeu5WX+9Aoi4BJuIHX9B7GXyIbm6cFqxwViGI0Y8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGXkQ3jWNIA6ceHjfyYtZYpqUzysLong/ck2LvV2YsE=;
 b=DD7yXHH+kKEFznx2hq70IPVZIf6KHTJtTBeW4kKamnCzExzhNYTR52TutfIj1Lpwgca6e6Sg8izp4WVtJQ9pHfwZWiKBKH/er4k9MVkw9WSZE1e6JZbLZDjWHaxKnZWKbwAQvC7npekCzHLYvm508RMW/C1Lirln8x0jBIIMqV8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:12:52 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:12:52 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 00/27] Live Update
Date: Fri,  6 Aug 2021 14:43:34 -0700
Message-Id: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:12:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1acae859-2ef9-4595-a0e8-08d959275545
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324107B1E3D16B9A819C042F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qNFdGJH4+lJQGJdrNnXeXvq2TDp8xfAK6BIagHr21/kbf7tWu9A3qiBx7CJEE94migAy8nizcfrTeMtI2PJyf4WtRPfpf70l355aoskVWjSKan4g4qLnbGn3buXtVQVceDfozgJIskmC3xtsyNtS/7vI5F9swmr0J6x4nhLEoDYsFgJDLd4K/h94YCYDPJE1Y03SNUypjuFXlEkZ8j/XOMQypxRBrLMI/Xt+EJMg1b6svlG5U79CE6JhjngGEYug3OUTt4YQC+s1vDOePf9pbsM0f/BNn0egDDPEq9R1jRQbjnQPLBY7cij2apPev51J6+0hx1nfkqpSalAUhF/6veGINMNcYWhAF6eAOg837PRXDnXvmw/zXlJsbMryRo74RqJAUcbk85HnbJqzU4lbLrc9HFVukBmwaX8gf8CjuWW/OGY4KSf8m4BCe5UL7cfLnTfi9LtMO+NgJg9E+wlM0i1cFIvbPL+HHetHORw3/ZobW7J3IkJ5CxSDFcZUY3nEXMJEDkluik4bWYyhq1xFPNHVPce/610KIBjHECHY20RqYZDF6W6lGifFg056kWBpK4+PjeSacU1kPyq1YFOnVzBp2CadDfbDVT3tSVMlnLaAZUySIEfF6mCs+Y4/mMZI0OJtu31Z1moLEyVIOc20YzWU8q7ZtEe36q6fkm3zoNOyXHQn4+EVHDYe1x2zRxibWuHTX93QEUeKTY4hzT6+wCyhdnew3OoITx9plhmxRsVcgBGgy4mCj3v1GO/ud7SmkbZloR3NQYSf1sf/Cn85UO3kX1E7nfcQOwdeQ1c/XY4S1Dk16k4Sf/0UU3fEuDTOY5b6dcR//pCdIzFRj+fSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(15650500001)(6916009)(2906002)(36756003)(966005)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(30864003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evmLcACE0kzujThrMk0tIAPPtTD3cSOMvkVteF+KVmwdJJOW4QcPWpMtKS3K?=
 =?us-ascii?Q?uH3w6fvVnBf+uHEN1a9DoDwp4qZKQ6cdUVLikn7kLJf5BXPc7EwCeUycOukc?=
 =?us-ascii?Q?DtW0OQY7nFIzFVMRtdDH/VS7LBo5HoaatUWlEGy60QjBZRv41GVhp6Gpf01b?=
 =?us-ascii?Q?tILkvznEEUWY7hzAfRNAV6ksqx2gDlrgxo46eCljlL5HRGhIDQvu9oZabOIf?=
 =?us-ascii?Q?vZ1fSU7MENYeXQ3Ey82oYFgix4tsE4XZq29bm1Hw22NunjClIyzpCbjQh/cI?=
 =?us-ascii?Q?9JZEXA+3qjjXd/hKh0aq8yxOmSRwoK9lcRQ+M/ge5GfX56IBQX+Jvv7KXA8e?=
 =?us-ascii?Q?u+gys9d3RmIb9WZVzcW24c8XP/HBEVuTTF1hWm6KfzkEZUF24QcEJ9geXoP5?=
 =?us-ascii?Q?49nDIE2XJMJCEgMQyYmLv1l45e9a3L5hNhMK1vrAYcvtPHZ+RUQPRjm3VpPj?=
 =?us-ascii?Q?6WnUBLpRIkG3tc7HFZ/dIA7wV/AO4zQvhesvwIvMwuS4BDszPul+lsJB1yWa?=
 =?us-ascii?Q?BlWTzY4wifwxYBjbPQnqDJw3jA5GpuQudr5dD62F4d+84DO9hBNUECzcynz+?=
 =?us-ascii?Q?yrQ12IkpSsVg5/Z98Ab5R1AsvNIkxMy9qwqx/9kAkg5hUXY1/GzAapI66yI+?=
 =?us-ascii?Q?hd5Cv/iqhgYCdlBwprqktzVtjLTyM14DdrLZP1r8M4pxA/DvP7XT/z3hqzuf?=
 =?us-ascii?Q?XHuXccLOthRXO+gk1peGTov/GRbsHdJh3S6mnl78uB74KBmF/Y3ZAFi3ci+F?=
 =?us-ascii?Q?LDto51N6jz9UJu8sY3IB1gbQbP2kXTuK7ZvY+ZKr0X01a5AVLZ7wkqEGGZcs?=
 =?us-ascii?Q?5D4K89FK32u1I395uG/Shdqje2YXdchYrKiSP40xf66lnTX3HzX7Vsmdi4Bv?=
 =?us-ascii?Q?aLPTEUb1Q3lj3HQOII2dFylfL34wKayTDDHDqCtrpr4fY1PJT+mO3xKYIIZM?=
 =?us-ascii?Q?vW4eGFa0yqv6zWQapDVF7CFrCsL5G49s7+0guRlXS4XsR10ZARUI7m3GMhJO?=
 =?us-ascii?Q?Vq65G//BOfi/lINYbkYOd0lz2RTLM2urLyiZMK0lZUMbRpHSczftmcjMbjQz?=
 =?us-ascii?Q?rvRB9hOI9Yyk4NTtJKR2UA3/2X/WGHd3MwdBubdxSfazFY3bCQHlokWgayl5?=
 =?us-ascii?Q?ecztyGB2TrBVa6vE1w8DiRj6m4pVatVQhnJrjrb9Z5gGZOi1nsjf4s+tTrw1?=
 =?us-ascii?Q?T92wXs1nPIxUdpo7YGQGfjD2xR1GTSRnM9kcQu5fxL6WumYJHX2GrblKB0Zk?=
 =?us-ascii?Q?knyUHve+/uNOqTb4ypLkcZ0STtLsMZSyfUNL8U/S3cldfuAa8FJSJsjzHI9Q?=
 =?us-ascii?Q?i2VV6sxKKGln2hgqgrGsO/gz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acae859-2ef9-4595-a0e8-08d959275545
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:12:52.0018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbKLPr0UiNaYkh4/MBfGJ5A5zrThYMEW89Bku5kt3IxTF7c7D/LLbc/yzqZ6L4IBmkLMWlP+26qlaASqcfhdsQBn4Ol4oCAKO06vomPGACo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: PrnwM97K5plKQH3B3bZaGj635JcrsKF_
X-Proofpoint-ORIG-GUID: PrnwM97K5plKQH3B3bZaGj635JcrsKF_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
These save and restore VM state, with minimal guest pause time, so that
qemu may be updated to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.  It supports two modes:
reboot and restart.

In reboot mode, the caller invokes cpr-save and then terminates qemu.
The caller may then update the host kernel and system software and reboot.
The caller resumes the guest by running qemu with the same arguments as the
original process and invoking cpr-load.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Restart mode preserves the guest VM across a restart of the qemu process.
After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
which directly exec's the new qemu binary.  The arguments must include -S
so new qemu starts in a paused state and waits for the cpr-load command.
The restart mode supports vfio devices by preserving the vfio container,
group, device, and event descriptors across the qemu re-exec, and by
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
and integrated in Linux kernel 5.12.

To use the restart mode, qemu must be started with the memfd-alloc option,
which allocates guest ram using memfd_create.  The memfd's are saved to
the environment and kept open across exec, after which they are found from
the environment and re-mmap'd.  Hence guest ram is preserved in place,
albeit with new virtual addresses in the qemu process.

The caller resumes the guest by invoking cpr-load, which loads state from
the file. If the VM was running at cpr-save time, then VM execution resumes.
If the VM was suspended at cpr-save time (reboot mode), then the caller must
issue a system_wakeup command to resume.

The first patches add reboot mode:
  - memory: qemu_check_ram_volatile
  - migration: fix populate_vfio_info
  - migration: qemu file wrappers
  - migration: simplify savevm
  - vl: start on wakeup request
  - cpr: reboot mode
  - cpr: reboot HMP interfaces

The next patches add restart mode:
  - memory: flat section iterator
  - oslib: qemu_clear_cloexec
  - machine: memfd-alloc option
  - qapi: list utility functions
  - vl: helper to request re-exec
  - cpr: preserve extra state
  - cpr: restart mode
  - cpr: restart HMP interfaces
  - hostmem-memfd: cpr for memory-backend-memfd

The next patches add vfio support for restart mode:
  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1 (fd and dma)
  - vfio-pci: cpr part 2 (msi)
  - vfio-pci: cpr part 3 (intx)

The next patches preserve various descriptor-based backend devices across
cprexec:
  - vhost: reset vhost devices for cpr
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option

Here is an example of updating qemu from v4.2.0 to v4.2.1 using
restart mode.  The software update is performed while the guest is
running to minimize downtime.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...                        |
QEMU 4.2.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update qemu
(qemu) cpr-save /tmp/qemu.sav restart           |
(qemu) cpr-exec qemu-system-x86_64 -S ...       |
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |


Here is an example of updating the host kernel using reboot mode.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update kernel-uek
(qemu) cpr-save /tmp/qemu.sav restart           |
(qemu) quit                                     |
                                                |
# systemctl kexec                               |
kexec_core: Starting new kernel                 |
...                                             |
                                                |
# qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |

Changes from V1 to V2:
  - revert vmstate infrastructure changes
  - refactor cpr functions into new files
  - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
    preserve memory.
  - add framework to filter chardev's that support cpr
  - save and restore vfio eventfd's
  - modify cprinfo QMP interface
  - incorporate misc review feedback
  - remove unrelated and unneeded patches
  - refactor all patches into a shorter and easier to review series

Changes from V2 to V3:
  - rebase to qemu 6.0.0
  - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
  - change memfd-alloc to a machine option
  - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
  - close monitor socket during cpr
  - fix a few unreported bugs
  - support memory-backend-memfd

Changes from V3 to V4:
  - split reboot mode into separate patches
  - add cprexec command
  - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
  - add more checks for vfio and cpr compatibility, and recover after errors
  - save vfio pci config in vmstate
  - rename {setenv,getenv}_event_fd to {save,load}_event_fd
  - use qemu_strtol
  - change 6.0 references to 6.1
  - use strerror(), use EXIT_FAILURE, remove period from error messages
  - distribute MAINTAINERS additions to each patch

Changes from V4 to V5:
  - rebase to master

Changes from V5 to V6:
  vfio:
  - delete redundant bus_master_enable_region in vfio_pci_post_load
  - delete unmap.size warning
  - fix phys_config memory leak
  - add INTX support
  - add vfio_named_notifier_init() helper
  Other:
  - 6.1 -> 6.2
  - rename file -> filename in qapi
  - delete cprinfo.  qapi introspection serves the same purpose.
  - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
  - improve documentation in qapi/cpr.json
  - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
    qemu_ram_foreach_block
  - rename handle -> opaque
  - use ERRP_GUARD
  - use g_autoptr and g_autofree, and glib allocation functions
  - conform to error conventions for bool and int function return values
    and function names.
  - remove word "error" in error messages
  - rename as_flat_walk and its callback, and add comments.
  - rename qemu_clr_cloexec -> qemu_clear_cloexec
  - rename close-on-cpr -> reopen-on-cpr
  - add strList utility functions
  - factor out start on wakeup request to a separate patch
  - deleted unnecessary layer (cprsave etc) and squashed QMP patches
  - conditionally compile for CONFIG_VFIO

Steve Sistare (24):
  memory: qemu_check_ram_volatile
  migration: fix populate_vfio_info
  migration: qemu file wrappers
  migration: simplify savevm
  vl: start on wakeup request
  cpr: reboot mode
  memory: flat section iterator
  oslib: qemu_clear_cloexec
  machine: memfd-alloc option
  qapi: list utility functions
  vl: helper to request re-exec
  cpr: preserve extra state
  cpr: restart mode
  cpr: restart HMP interfaces
  hostmem-memfd: cpr for memory-backend-memfd
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1 (fd and dma)
  vfio-pci: cpr part 2 (msi)
  vfio-pci: cpr part 3 (intx)
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option

Mark Kanda, Steve Sistare (3):
  cpr: reboot HMP interfaces
  vhost: reset vhost devices for cpr
  chardev: cpr for sockets

 MAINTAINERS                   |  12 ++
 backends/hostmem-memfd.c      |  21 +--
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  14 +-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  36 +++++
 chardev/char-stdio.c          |   8 ++
 chardev/char.c                |  43 +++++-
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  50 +++++++
 hw/core/machine.c             |  19 +++
 hw/pci/msix.c                 |  20 ++-
 hw/pci/pci.c                  |   7 +-
 hw/vfio/common.c              |  79 +++++++++--
 hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 | 301 +++++++++++++++++++++++++++++++++++++++---
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 ++
 include/chardev/char.h        |   6 +
 include/exec/memory.h         |  39 ++++++
 include/hw/boards.h           |   1 +
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |   8 ++
 include/hw/virtio/vhost.h     |   1 +
 include/migration/cpr.h       |  31 +++++
 include/monitor/hmp.h         |   3 +
 include/qapi/util.h           |  28 ++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/runstate.h     |   2 +
 include/sysemu/sysemu.h       |   1 +
 linux-headers/linux/vfio.h    |   6 +
 migration/cpr-state.c         | 215 ++++++++++++++++++++++++++++++
 migration/cpr.c               | 176 ++++++++++++++++++++++++
 migration/meson.build         |   2 +
 migration/migration.c         |   5 +
 migration/qemu-file-channel.c |  36 +++++
 migration/qemu-file-channel.h |   6 +
 migration/savevm.c            |  21 +--
 migration/target.c            |  24 +++-
 migration/trace-events        |   5 +
 monitor/hmp-cmds.c            |  68 ++++++----
 monitor/hmp.c                 |   3 +
 monitor/qmp.c                 |   3 +
 qapi/char.json                |   7 +-
 qapi/cpr.json                 |  76 +++++++++++
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qapi/qapi-util.c              |  37 ++++++
 qemu-options.hx               |  40 +++++-
 softmmu/globals.c             |   1 +
 softmmu/memory.c              |  46 +++++++
 softmmu/physmem.c             |  55 ++++++--
 softmmu/runstate.c            |  38 +++++-
 softmmu/vl.c                  |  18 ++-
 stubs/cpr-state.c             |  15 +++
 stubs/cpr.c                   |   3 +
 stubs/meson.build             |   2 +
 trace-events                  |   1 +
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 util/qemu-config.c            |   4 +
 64 files changed, 1732 insertions(+), 111 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr-state.c
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr-state.c
 create mode 100644 stubs/cpr.c

-- 
1.8.3.1


