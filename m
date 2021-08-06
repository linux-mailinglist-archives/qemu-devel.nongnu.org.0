Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0D3E31A0
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:18:49 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Ay-0003df-T0
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85g-0006tE-42
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85e-00048w-8k
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:19 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBfKo007299; Fri, 6 Aug 2021 22:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=O2bs6zPhIEueAJ7tXmUmg1TALMsfOqWqr1KeX5mlOcim111jQgMI9IQ0nvhxofcPeYmE
 ZKGkoUPgq2lWpH59WXs170Vh41CpsevLcCEYzIOv4G7BRoSVHKSrFHTvxT9jiwrBuzi1
 Wjm2qJbleAyyoGVQorS5xgiONgup45zUOwhlhy6ICKYvioI0k31SD9Fq8E8ZoyoBz6Sh
 812vvYot2iodSnt/GO3Wep3InBNSV0Tbx63Cw08gitHPDUQzMY+6gu++Vw1umS1iXisx
 inVnasxAOOPmIDFBfCiwOXAOON118p+Aro97zXj7vL38JHbHPv4o1z7lN0Er+CN1bkn3 AA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=mn3AG0RRgGU6e1rvzow3xHa8scBbpZmV8p9FJvP28xrZgeB0t97bulH5lY6UZQELKRqI
 UDkXQggj6axE9gRdtDpLjAzPlnoSmfjRUDIzpJC21geBZ0x+X0NoWDK/66eiqGoiROUM
 zrMF+tWrrtpcF1npQZPxcSXPCp7z0jGl9DcxIDxnY0mu5SuTw254ASAmVqFhnq0gwZKC
 ZLH01d6ZuaVLbhbSfUYnkUnJIPDrQvHfuR70zK4mUfg2SY5wL1j3kyNJFM1xm378gLMG
 l2roob/rsvzfKngQeyJ43K1xFYboBadsMwNcuhOAPkBR1HJoY4XDo8B53jyIHRr41jbS 7w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBiK9013868;
 Fri, 6 Aug 2021 22:13:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3030.oracle.com with ESMTP id 3a962pfavd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsMkqwLbvK7LKCN45FPa/PHDcOqJ7noIXte3EJILMWZRBEv6nUF9HAX/VJVouXSiIg2jonE/4C9SJp7BVpyyCti6uxGiisH734tgraoqblwnnS1Sg7Upaocwaj9ubbX4k2rZFfMYmDCk4wnjwb+Lm450JWWpCK2kS19fQkpD/MVnFvEsL941tS46Un8CZbsVzNAlYsL3zXNEVFTK/ErayaJwjWU/HqHnqrOCk6gxGjdv6t9n255K2yycwdZKHl++s/9B1CBoS99W1e1U1H4cdOKiI6wKE5rw/1RC9jNj62UcGwTB7poLyKZQg30n5enoqraOAeq84BGZW/5HAjUJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=MvmYo3nzWsNb05TZM16ki1WJE5dVVBuAHhBb8Cr1jorJiTOwNfTKHX2FRdk7LAPuPvg/Pc19HhR5LLcava2dW6X5vbf4BLjEOtNbSxstTKjN39u0ZQnQUF8V7k3b0wu83mI4jvwxWv2WTNa0kZbW+SXjeXQ/h93ShfMF7bu6H6vWsnty9sgQ8Yz7lt1JRk0g/4FPlFlvbGj9jTlG97zEQ/dz31AdVVjJxlSWChwcMZddIwqmffNcZjQsaTS0iH0VJxc3RM2x6osG4IqFnCT9ll4kf7g8M5+K4zXHEsRHDYASvzsWBt98gI6Vb7Lc3ae7JLyA056mFACSy3OrgatHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OtZ0oN1pLBeExwfEiVml6vg9iyAZzfaCCVKW3ly3sg=;
 b=gZuQEt3XIjDRKKWLn95QVnduMGMweEjXkZ80WnXe7k2kGevLIwzCkug2+GUUnEmqiirgXraKITU+0oquL0pM0lKbJgNZWaOGGUDdJpmKU5jemyA9hYdb9g7gqFxMqXf5xFGMjhVFcff5HoFpaWYPlLP1D82vg/VAFLnkYfZKp/o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:09 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 09/27] oslib: qemu_clear_cloexec
Date: Fri,  6 Aug 2021 14:43:43 -0700
Message-Id: <1628286241-217457-10-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 870ba059-4737-45ab-1273-08d959275fa4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47340715688E1E66805B3AB3F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4IqJzDesksKCxc5FTjX5o4AC1t3TA6X/AaDn0h5aKcOuLuYbYoPUzg14Z0DxqDoiYG8BY/dOEtEOJXeBgA9nPM5gjeTVj9FhgBr5WfIGo+eUbfwGcEEfKKce4MwPu/U0cKFfSy6N54FHrgWLzgXW2t81LrI5M9iFzAMJk3PSaTPvgy+q2SkNcZhTLaG/az8X4tGHrtKsgdL+XSEbV3cJWN8Zd+ynamopcJp7j9D+iNOjDO8wDH9G1L77RGgEJTzWC81JHUZ+LV1qcO0xI1qmG/Ggf8szqgvZPWgScD602vyxfFekM97ZnAkq+NlfPpFqAXqnQF96Q04VCauPQOPS6nsKJzdNFVwDLYqqQRiZM4FFH79RdlfVXyqM4q9/xFZrfA84JzdUOjIBocTbKHlHedvjYFHr0U9OHuz07ZVIElFiL1N9sk6DppkeKs2RPvYQJw0iXPZ6mRhpv/y5WGHnVHy31qYzbXxdm2vlJe6HMw3Ukkuj8XwNImFAkKvYOlUaL7xHgC9DVmU7XqN/JPUhsPkl1ik2sggsPV6R81vBfDCqnJhHWHWb5lzRAlHAAmIQUDnZwwxkjF6yDKvnqcQKr61/+MPw64Sn51KrGCp8QuQULdJrh2u6RcdETC2Lu8cVY027Yls29oLiYT02PIQ3YN6t3ApVODHmxv4wgSt/ecmCuKxIJviE7hIqrdduWxuFnCm02Y8abd28uUhUP8/qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruBItlrABqG0hfo59BN9X4O+kiOz30+oI8L8OUh8zPjbfDFPMnGQ+33NKPim?=
 =?us-ascii?Q?zANjMW+7vM027bv/7nF99pvSE3LmMHvV8pKYC9ZQV8Ji+rXbJ0sXcnDLG464?=
 =?us-ascii?Q?X5gZZH+4v7qBt65xSHbijl5pWLiLx93z7I8J8UzQs9EMPzSR917tUZGbbnwo?=
 =?us-ascii?Q?gkT/ZFveBg5s+UsyQguRxPVshCz8ZAXfms+YN+daoq0AyIrvUmLdvFicwnkk?=
 =?us-ascii?Q?SPo94rRRa5hln4zoLClCbQepfeuyxM2Pm3C4OoWB6q9rUaeWw644ULpaFGeO?=
 =?us-ascii?Q?PLmaIQjJbye7i3oOImZ1N3expfIDtDsDheE4HGNxYVeS3YK6nBDLcBsPitN6?=
 =?us-ascii?Q?BPgXWJ9B+IcqAKNT/sOm/EtlbHnu3K275MKRmhTYPLQmNvPhL/p8NhCjhZXc?=
 =?us-ascii?Q?lPP5CvVE1+6f8DjNmQLRbb9dC0W9kRrJ1PBApD/jz1J6W+I8b16cHWQ2OCce?=
 =?us-ascii?Q?WOrPkylo4yOmiBbC3B/Dz3V03ZOO4XAvhbCRXvCKDe5OpN4Jp/FUFbwn9ONG?=
 =?us-ascii?Q?jGXg73Lw09rWg8HUQNiPV8zd0/czXyd7rzMZMjVIV9+zVVFb70CetAui8/o8?=
 =?us-ascii?Q?d0Ks8wj4RbQTA6O9WlSx9A36rhD/cV8YgM5iRAOTDQ/YOSt+YuoqfT2GsMMy?=
 =?us-ascii?Q?4PxMx/zEgTASN/RNZoiC6Fe0tRu92xne46/0l8XZPK9nAhphJLtc8I2fEQ9r?=
 =?us-ascii?Q?CgZ5p2dCj7kPrJ5uFOFBNlVXC+66UwhwQu7YPTwXaiSxgx8usR5XjINycfuG?=
 =?us-ascii?Q?FW9ozWFKE0MQPwwlOoWK9SL5IisWhb0GiBNNrtdvXRJyX6RkIu6Qpgv/jfKt?=
 =?us-ascii?Q?f6QzexrHV8eQzD6ftfaeChctekLEULh/Asiy27ZwDlK1SXw4WY+TFB1VVCry?=
 =?us-ascii?Q?bgAE+pFbdHiOl3nAxDif3nD4U50ATPXCYXCy5JmkS649r4oW3N5bhUViKNue?=
 =?us-ascii?Q?ISmjS1vaGynR52ng1NF7wbUon07rS17eQ2v4C6XFp/QbHbjGVamRhRUse86M?=
 =?us-ascii?Q?8pbsMbBhppfli1M1/Gn8A2+d8uoskFK1fdvvRtkqFLX0k3qAlvhWMgLxKAfa?=
 =?us-ascii?Q?R2uIqU/9Oit8XPg38wVvedrmR+wsJe0y2hD0u9HJaKXhdVbyvgiXmE3gyi1U?=
 =?us-ascii?Q?jFuDxwoBAPsJFRLxzhORFdueibT1KBGrAt6LxCfadbz1TCZ/7FzyLB8ogJQu?=
 =?us-ascii?Q?qyHbydhdf9LasBtB47YFjZAFntWIbnn4PMz1FecflYC0yVb2Ml4kDeKRxjk8?=
 =?us-ascii?Q?EhlA55iPW6qcil+unkT+bk++Zq4C98z0OFI0IeovQLtNb8j+1gFDfGRjKD3O?=
 =?us-ascii?Q?U8lnt7pqh34gqbdOSLf6c6w7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870ba059-4737-45ab-1273-08d959275fa4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:09.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K1UQ2jR3nuA0yxymweZvXMopMFjIEiJnGQe/+RyfFMcB8UXKoTcnABoUR1uHEYu8YlFcdUb/gAwASoHyM7dXcHsNK0V07dVB6buWrg9ZHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: uze49wiFBay36EcYSZgEE1PQoBZy-aaF
X-Proofpoint-GUID: uze49wiFBay36EcYSZgEE1PQoBZy-aaF
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

Define qemu_clear_cloexec, analogous to qemu_set_cloexec.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/osdep.h | 1 +
 util/oslib-posix.c   | 9 +++++++++
 util/oslib-win32.c   | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc..1ad7714 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -637,6 +637,7 @@ static inline void qemu_timersub(const struct timeval *val1,
 #endif
 
 void qemu_set_cloexec(int fd);
+void qemu_clear_cloexec(int fd);
 
 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
  * instead of QEMU_VERSION, so setting hw_version on MachineClass
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02..7913334 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -309,6 +309,15 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+void qemu_clear_cloexec(int fd)
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
index af559ef..acc3e06 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -265,6 +265,10 @@ void qemu_set_cloexec(int fd)
 {
 }
 
+void qemu_clear_cloexec(int fd)
+{
+}
+
 /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
 #define _W32_FT_OFFSET (116444736000000000ULL)
 
-- 
1.8.3.1


