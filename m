Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468047D820
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:05:46 +0100 (CET)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07rt-00078y-AT
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:05:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VR-000578-Si
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VP-0008On-SP
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:33 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsli013624; 
 Wed, 22 Dec 2021 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Y5g3tYwoOio6haCICRgNzdV2wUuK+KL6/UlZTAYnNKY=;
 b=YavX52ABU//texm8L2VgEXiGj4bZaF8BrO4W9+tBybICjcuIpX5g2DcyBJwGpRxeDLus
 T5d18O4dkOtmKMkrpcIAb27z6Nfy1EJldpDgKrWFAG3GVS4rPMmEUIGeKWijeVpxfJ0P
 Kx7q09h1D4iijM9UroBurL4XiElaDWbn1ooT1n9/yXr3M3yueYgtWuGzW+q5teUerdkK
 eRi+ztAP3I2yoaDwyjaqYfm9ek0m8kWVhGxDF+2FdHcdkrw1kLxASxl9QAF+6lIyk8HY
 b3pEYMp8FNzl/52TFOT0ePHJXtrOkFNcq+OIjp7xvI6bwXruyIm/h3MwcYBdF0GUz4Kk 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqT030437;
 Wed, 22 Dec 2021 19:42:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKdk4MBn0JtZwG2LH4ZdmVO9uVTrxcNaQKSAP9xYNf6MCO4BtdAncPuuMn1oAfBslSro4OWQe+k9GqPHojCRLlju1x4oWvjoLnFU2kRqpxNMbfk3hE4sPFjguRSTVmTtrQs4SkoBAkGRapZlNdAC6rL3pqsz1Z2kFSGlTjFoQF58vH5EkywCCyZyqmFNqvhzuxGcDbW0JM5UPrsmjOAhs/eyCIa2tKitLlA7stcOhwFJ+/WUJW9Su7i06G6FZu2gB5cEKC4Gm/VxtuWTGxWv00tAPFlXAkTlKOq/LqkXrJYTyKXk8X0cJyKWlt/QwF2u3guUMJi3P0rWo67hfG+BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5g3tYwoOio6haCICRgNzdV2wUuK+KL6/UlZTAYnNKY=;
 b=AAN2X1ZRSKl1Fl56Hz3k0x554IF+M4rv/O5pST53Z/+YCko4yquINE5DYqiUYzueOp0J3D85BX0Kgj6/8FlttbnW4dE5ZQTGt0eLrH2wJzEzBDpFmHnOo5vXoNDa+QU5P9Rlt/D3Dzrp6SbiKq568+JaFDw221MprAQPhZhdHy74Iu8q3L2zY1r9UAnG4vdbALyE15u4u5T7LEz3MPYONnuKlykIy6D8LUQWcxcTewehaHZCX+r0aGFVxsSntg4UobGWsaO+9lCFfmoK6WJlrxfsu9ROds03pHi6V6Xd/3b8vfZdST8mKkKQzdx0JYr0h4oG1KE8VjeebVamTtEtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5g3tYwoOio6haCICRgNzdV2wUuK+KL6/UlZTAYnNKY=;
 b=pNRgmKdN1VZ53E07tasMCUJJ0DXXuHinvhBD5gZ/xgLLUvqRMNzOUJre4euVgRAEOlZHRUfSqB/JTxkuEjRr3txSM/AYEBnH6iNfjN4LEL+n618cU1DNtcm61reSt0iMW68VT3F8W/kYfVnYegkwlgI4uD+OWBJUAzaQfRnEUDw=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:09 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 29/29] cpr: only-cpr-capable option
Date: Wed, 22 Dec 2021 11:05:34 -0800
Message-Id: <1640199934-455149-30-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ca95e36-35db-4f6d-b52f-08d9c583245c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424231428EB2E2A13E0E4EB8F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2H7AI1H4DY+XUD/CZin+cgyedIFPNbGFp7MCBceA15FMs50MJDqlztzsWtnOh3eYhHS/1x7YbEinKCq7D+ArbcL8ju10ZaQKyXpaY2yYgHusx3u2dvspGMMSo6YJ9R/e+vZ6PUxKAp8s9xZdwFDTKUHZR68p8gnw7YUI+9iLxH8RnE721WkuNzLnBOThenU5RsBhQULj8m3qyIxxo/s/hD5WWFJjJnWaTU0UARe0agvjHMSC8dSGge9EIwUks5jKOnu5iOY4eD1jZOOymmE4OCO4QHsuG42sm6S7hYRdV3+jooN8+y9SBzrtXnrcLT2L+RGBp+vpS45qLf84CLda53OM6Py2daOgp+hilspO0Byy9t6M6uvJ9Tt2L76SXv8PFJdls86g39qjgIvX1B+ZriunlpYOXiab5eIIXW1+Ri8tnnIOhQtAfQm3f+Rak0lmByY/zJPgnZ79aFavJZzpPmztIV9kHqyt/IAn9dTa1TZizSReT5l4tuoW/jsPCnObNr6/fBa1E2okWWqnl9O7GUNcj0JgIPyeYfQYhgHHkwdQ/LDjdtuX35BWwcz4lG3Becy/8KE2Q9R2PWqcYSDhfj0tbffYSUoUn62VR+K0X8SW/J/ZCqLI5jrNIBjo+P/3ldbvg0SxE247ILU/0m9GJLxyxl845QjB0MxATkg88bWB8jbTWNk1xRg7jFxJV1ZWY7ZbS/ztgiMrD8Wg9YzBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMeW7W2LTTOT6UNcGUKn9zSMYkWpjtmtZwtN6EelmEX2wssF4tYBpRGWsG3v?=
 =?us-ascii?Q?EE7Bj/yn46zEYu99qq0a1/qncmsgQhhT+pwC3LLOp6+mcFCTOJEgeXf371Mx?=
 =?us-ascii?Q?yxWPw5sbB5dY/tcnqjEloGLutqQDnELgh9AbpgWyxCgT4Gcca0op/yyqC4JR?=
 =?us-ascii?Q?QEusy8vSEGCRvvwI+uzOLXUAsXgPHY9LaxBXcEtLFK5f7Im4db+kGzeruJ1v?=
 =?us-ascii?Q?Vg4tFK/kBgXQPDWCIqH1gk9P5e+HooZ5ME5anHIrUn1vqB7of8yydwSmJbgH?=
 =?us-ascii?Q?opWZ5odmHfLykN3KO/yUFlemofIPB1Sx/lT5gJT5/5JcnVsFFtdko47KjHaB?=
 =?us-ascii?Q?8jjhWqURjM47s194iB0R+MEwE7rBSBdGTlIhrxfxms9dTGsArZZpONOI1d6K?=
 =?us-ascii?Q?s7Oowf9FVaqcxXsqWK9wm50Ljky6x5eEcrRbpCo54cdAWBhyZXsa2FKLhfTJ?=
 =?us-ascii?Q?0DV+wHeW+Go9BmhUOoVxJUgb2DVWwdAXOfsuF55wVX/SKzc6ya0Q1U57pJ13?=
 =?us-ascii?Q?6SPFv34VBpzqR1kqXGhESuj7ZRtL3LHtb/X5yEghjYMrebO3cEhei6aiCacU?=
 =?us-ascii?Q?vVphfuV8jKBeWBdOtWHTxzlyvln+U9YRBRIRPLpyK9HcIlm1b9as0bYAnQmq?=
 =?us-ascii?Q?xcOg/bhToT3a8YX6MzePFYPAj3Zf9OcM53w9+bPJ61Eeu0FyFzU8eGHNs2hi?=
 =?us-ascii?Q?QWWXMIg3/cV2s9GbYTHCpJdPGdQrJPvIXoQn0xtfqclqRn0MwslRyAZrRVbO?=
 =?us-ascii?Q?h3A0HYm3bpNK+OX82YHaCqAQcAFOEq0/bVKXQxO7CBsFmBcbUt+TxHZa68Bs?=
 =?us-ascii?Q?xvaaTEGfPxqUhHeghpknm4f0OoQbfRt2HSRJpw+EqMqQcZwcwqai7qznM6fX?=
 =?us-ascii?Q?INO25hQMC9It8BtvZ/tJmsO6HWcPp33oi8Ilw2P4OKs8SDqfZLdVDBnAuUzU?=
 =?us-ascii?Q?hX7hXjn6y5II2Geqr8Kq128kbe0aReXR2axu23gFEFkHe5IWioo1xw50tMRT?=
 =?us-ascii?Q?CMHjtVy34/ferKKQxpFt67+kSAHXZWQM81GqgPIY1xsuIROKf62ARJx9r6o+?=
 =?us-ascii?Q?5vWcBzqgkHNiWpKEZ185jxMFkAwj6ADv2V8bcv+RZDc3vfgapgMYk5lcIOfs?=
 =?us-ascii?Q?oTuRQkpGstOnulNgH2JO/c/SvttqITk7ldpnNFdXIljtBaiTlvpXE9Zfe1zW?=
 =?us-ascii?Q?tzewzAdyO6/bqY1OXGHXhyg3LhhZdi/QxVh8Opzryi4fIsAj8oqLYta1Pio0?=
 =?us-ascii?Q?pOlgnPVMq8huZwfz1JXts6Sv4xCiFyBOUHiDdeAwNXpKBs/Es+kLVvnDHk0j?=
 =?us-ascii?Q?FYyG1+PAEZ8cnQLHMPKOCU0Vto1yndLMawRNgfjC0PgaXtmlWk+hwG0s8OUJ?=
 =?us-ascii?Q?MbXaF4I5nmuunUAPXY2wrJL4KhA4jhPDOYsXuw+CgrD9+1Akof0rRUSKjqWQ?=
 =?us-ascii?Q?Oo3l718uaSm43byCrBekT5h8zy/DIL4jMWUQU3QDDG243D0KuG8hcbg5RVli?=
 =?us-ascii?Q?KXaKX+Sukw9gWeDS2IZyQgEMynVPqmpDq0cnxBgCq6eI459YIq1zSzw+QjvA?=
 =?us-ascii?Q?9As0mLDJWnAICcx4EjKTqUiSysgBK8pYWu/LyTg4p2/aq+GT8O/QJEYbaONw?=
 =?us-ascii?Q?bpC2VL0jqE1V/tJzxzlxQbfxGpXy9N8zmFjNc9JEbRM4mAaTtOPMh5qyuORp?=
 =?us-ascii?Q?9xzi8Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca95e36-35db-4f6d-b52f-08d9c583245c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:09.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8K/iOIeCj4tKU+RtoHhzjidKHN+fxZGdnr1x9RPt2Kqi6IxFcBMqYGd7pm3CUka4qKKjZNrjL/0WPWDUQ9JZMwBlkLP0BUHqziDduGMEDAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: 53XPxPsGkw8M1m9X9SJA5DqeOCMHlfVq
X-Proofpoint-ORIG-GUID: 53XPxPsGkw8M1m9X9SJA5DqeOCMHlfVq
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

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
a cpr-exec operation will not fail with an unsupported device error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |  1 +
 chardev/char-socket.c   |  4 ++++
 hw/vfio/common.c        |  6 ++++++
 include/sysemu/sysemu.h |  1 +
 migration/migration.c   |  5 +++++
 qemu-options.hx         |  8 ++++++++
 softmmu/globals.c       |  1 +
 softmmu/physmem.c       |  5 +++++
 softmmu/vl.c            | 14 +++++++++++++-
 stubs/cpr.c             |  3 +++
 stubs/meson.build       |  1 +
 11 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 stubs/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index feed239..af5abc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2998,6 +2998,7 @@ F: migration/cpr.c
 F: qapi/cpr.json
 F: migration/cpr-state.c
 F: stubs/cpr-state.c
+F: stubs/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c111e17..a4513a7 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -34,6 +34,7 @@
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/yank.h"
+#include "sysemu/sysemu.h"
 
 #include "chardev/char-io.h"
 #include "chardev/char-socket.h"
@@ -1416,6 +1417,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
 
     if (!s->tls_creds && !s->is_websock) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (only_cpr_capable) {
+        error_setg(errp, "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
     }
 
     /* be isn't opened until we get a connection */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f2b4a81..605ffbb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -38,6 +38,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
@@ -1923,12 +1924,17 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
 static int vfio_get_iommu_type(VFIOContainer *container,
                                Error **errp)
 {
+    ERRP_GUARD();
     int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
                           VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
     int i;
 
     for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
+            if (only_cpr_capable && !vfio_is_cpr_capable(container, errp)) {
+                error_prepend(errp, "only-cpr-capable is specified: ");
+                return -EINVAL;
+            }
             return iommu_types[i];
         }
     }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667..6241c20 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern bool only_cpr_capable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae..f08db0d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1257,6 +1257,11 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
+        error_setg(errp, "x-colo is not compatible with -only-cpr-capable");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 1859b55..0cbf2e3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4434,6 +4434,14 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cpr-save and
+    cpr-exec will not fail with an unsupported device error.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81..a18fd8d 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -59,6 +59,7 @@ int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
+bool only_cpr_capable;
 int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e227195..e7869f8 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -47,6 +47,7 @@
 #include "sysemu/dma.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/xen-mapcache.h"
 #include "trace/trace-root.h"
 
@@ -2010,6 +2011,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_setg(errp,
+                    "only-cpr-capable requires -machine memfd-alloc=on");
+                return;
             } else {
                 addr = qemu_anon_ram_alloc(maxlen, &mr->align,
                                            shared, noreserve);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4319e1a..f14e29e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2743,11 +2743,20 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
+    if (only_cpr_capable && !qemu_chr_is_cpr_capable(errp)) {
+        ;    /* not reached due to error_fatal */
+    }
+
     if (loadvm) {
         load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
     }
     if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
+        if (only_cpr_capable) {
+            error_setg(errp, "replay is not compatible with -only-cpr-capable");
+            /* not reached due to error_fatal */
+        } else {
+            replay_vmstate_init();
+        }
     }
 
     if (incoming) {
@@ -3507,6 +3516,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..aaa189e
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,3 @@
+#include "qemu/osdep.h"
+
+bool only_cpr_capable;
diff --git a/stubs/meson.build b/stubs/meson.build
index 9565c7d..4c9c4ea 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr.c'))
 stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
-- 
1.8.3.1


