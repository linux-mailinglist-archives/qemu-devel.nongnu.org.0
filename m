Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026547D812
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:58:57 +0100 (CET)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07lI-0006MK-6P
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VJ-0004yC-4V
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VH-0008Lp-2R
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:24 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoH028486; 
 Wed, 22 Dec 2021 19:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dcymkrLro6szr/jsVlrewrkKxi1RbRxnsECnbznFHY4=;
 b=H3Z7JvhMsCikfNWSs3c4bh0AHhhiheashOre14tiWYUg9X9DP464lXXNUjAd0FiiHRVZ
 X73PX4h+TQKLfRYpvsadwE7JZRryoq7/PnNyGksWDMfC6yIgcX9ThcA/U3BfKLqjH43E
 m5+utSgQm7Huty5QJm+RLjbt/PbIxcCoKvOz8j6V6QlZ/Hc+Cf3NyRH4GJ/HGa0iaB4t
 MRIf/TdmHTPJx8ARwPFYRJ44MOzsLiR3TuQAp2KRqzoXPf9qaxgtZ0Eg45kSIPeGBDwx
 d6VhmThgQKAAVCP7Qqj/kV4hTc0TdlU/MSi6zrno+nhIiGHTIOpFduOXkN7j+9uH3bDz nQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCF1049078;
 Wed, 22 Dec 2021 19:42:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3d17f5rftb-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOOkGJfOJkgwMJz7DotOynzsmzVPZDa3Bz2UOETWLfw6g1GH0zNKWTsfwKFzm93v4ZQPOUInADUQ7lznhqcpkEjPQZsyZqHWuWynK1qq0TAfxZfqBCgX9sVVprKMbfeCnE5Qd168vFu4vFRAX4B6mA76tJK8rzjCxOdYNKLdNZb/Bjd7pQPJPQX0XJsq5cowiSn8tNwT7wI4qhpm4gSMdpknTPRCpQd9mAqMbuJO4IeUQ4f24YPIJDOpQRrcTwEX0hNJY18YUyWIOa2tgm5slLBdIiV+xLCTPRVv0acnElB9aML9NK/HJJWMxL+ZW+ziI6CD5PgHWkfScBHNMEuHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcymkrLro6szr/jsVlrewrkKxi1RbRxnsECnbznFHY4=;
 b=bwDmldrEaRSwMEUBrotkvzE7nbDTcfczKTtAJa+jWEMoNM9OWovxohEuK/CEPbMeDrdorur6dRbtokV0mErIJzWku5TRMpuiNRDh6t6eVgBu5a5iMpZYKU6Ap7/V0cbO+sx+VOnsLNTVfkNDub86sxvNGXBfVFmEMWJpU7/hPI6YghGT17iiz3gNUvDZf24+2kR1LfPqYnjq6pqQ1TgvY1/HLVVfDq1j4NZCL2E3fbsaepwXG44ytNoIpWwm81O9uUFWeQx+oZpFDsGLlNqUljVv6hUuPloeeJE6iCs6DBLhtlpANWxAfB4vPXf/4dNKQPWjB1Ab9jqSQ7xj9tyL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcymkrLro6szr/jsVlrewrkKxi1RbRxnsECnbznFHY4=;
 b=tE9C59CeJBJf6/cDa5TMnBcEWVpuU7Hf6Sv+L0TzgjXtBtA5wpii7/NYCRcHDLyfp9frTPlWesEYtl3OQ7kTK8OQMHAjOr2EREQB2e1Jf0vBKLw0KFQLX4LOyLHL+v2PBr4TWWz/wm9ADXbwfE37Hq0zRuI6cMdgh8xZgYwfMLU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3746.namprd10.prod.outlook.com (2603:10b6:a03:1b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:02 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 14/29] cpr: restart mode
Date: Wed, 22 Dec 2021 11:05:19 -0800
Message-Id: <1640199934-455149-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a890827c-06d0-49ed-4832-08d9c583200f
X-MS-TrafficTypeDiagnostic: BY5PR10MB3746:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3746C81BBA4AE4943B2399B1F97D9@BY5PR10MB3746.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTEwLHshDgRSeZz4MRh5N4ckIfmeTBf6UV9ZCnjlpn+svMkxCj1xBYKDiruwPumVWov67A2j4SV/uVdRW9snT+4vTbyXCuZfOE/3y/oB8vuMmu/7hSx3f9QoT40iNhIR4RYhHOHPSA8UJahfERVFWDfEjm97VoEniirPZkw1sxV7XqJDyXAHRT//6gy4Tq3iWn691dFpBLfht7gm6JfWPMcIbL7LVNIbZ9FnQeNS5yuw7nzphIrRR1KQTSY24IPiqgSNbgouSehaIXmNcMzVa6gB1RnHio9IqeniKDfCiZD/n1RUJOnZyGuSSTXnxdRnRPHLaJJxyx9kC5sD8+eIfWtkMO2RoFKRigH6ZPedJl47VOwpiqpqyrJgwceSRwMJFud5rb/N+yCbXEgd0Bkc/yPL461ClsLfWgZx36g57TZiWE9FyMHBluDO277VCweKAGlT3NcQnBDqLp6y/N4YU+RXbbPMfPcs1Y0iWWKLyW7NGVn8NjnKGiqaoq51zmlt4Ptb/PSdMAjPl5z37Q4uJue56wRe4b3N8B1t7+DrQw40gmSOMF08bDIM3YeywL6+Lfulj4DK/TAgFlbH+sqqquwqbJ+9bx79F+qSItHJVYWSnAjSnpcO4GE6UVNsT7igScFYM0klrJGGHeIDJX/Ihgi+g45zXjDcufkxMQO3sFbsdwy0cD6+i09grwBxNhTpts3PZX3CPcdbd05fV12fhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66946007)(66476007)(508600001)(83380400001)(38350700002)(38100700002)(4326008)(2616005)(52116002)(107886003)(5660300002)(36756003)(186003)(2906002)(8936002)(7416002)(8676002)(6486002)(26005)(86362001)(54906003)(6666004)(6916009)(6512007)(316002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlGXS0ijlEFEr4H+sMYsUvcfXbJ4F49TjjfUpqBgQzPgeUYqcGNvU0kp/XEi?=
 =?us-ascii?Q?Whp/3O4QRP/gTX482SdwCJi9FPF0HkxaC2PnFFBr0QsC0JpXibnEnBh9Bz2j?=
 =?us-ascii?Q?pRCMHFbzU7SFPY9bh5e0Q39Zt0aYwa1VszAkVi5+37kp2NEgOV6tVDRMuDuu?=
 =?us-ascii?Q?39YkOad58olCm0yf0CdsE9wjrMErCQVotOrf5UixduG2Ea3JD6mF2djc/Spu?=
 =?us-ascii?Q?HTcTEXxsp7Y0tYiBB5xJ1Nzvy0JKPaGXv9GAgqpL0oDKQoUdqp57Ae6PUUtl?=
 =?us-ascii?Q?102VR2UL3jjiBjan0qGp7ZXVbcxEFZ0kEAU6hMBBxWousFZVYVrIzKzl64kG?=
 =?us-ascii?Q?IECpjn7ndiI6TDPfRaIheejWMz08PC0rRhx4LDAUO7e2scVrKTaHFaSA7hz8?=
 =?us-ascii?Q?VIoxhzi6X3HeUzDJIxg7548RYOdV6fhMFwefS1Ah5KqAUMtPLopJ8rvwadjb?=
 =?us-ascii?Q?XAufDbzk6Hj63vziEZnqpcuHWLjIBhIkQguWNZSQfD8bWfstIBNGDzIre1AV?=
 =?us-ascii?Q?e7ebFtlWA/lGH64ZyJ27lHr/gwA0AdrSR4aD0tzJ9dJvItk8nRKryaD42jdT?=
 =?us-ascii?Q?MzwXZQo+XmJKlGqPqWpmAXnBA8SJxbUlxFdqz9Oc0RJqwixomdLZdxAt8Ga5?=
 =?us-ascii?Q?32EpCo9aLfT8NCMzmUFvt6IGHmem8aKS4q2Mi7YUc/LUk7eo86HD5/Jsf4/+?=
 =?us-ascii?Q?nYBq0R1h7JKfEY1iuySGlzMgB491SH5CIA71d/gZZjnSD3NokJkyURh2RlYO?=
 =?us-ascii?Q?NFvPRfwT1KGW1p43g7ff/hh4J9LNvsZ5nylzgqWfBMekhWuC8DzpT1inVcl1?=
 =?us-ascii?Q?OI2m85mpcjUjzwfnbVAmr3SN8Np374guBj4ChWfDtS+F2RcQK/kdKurVXz1g?=
 =?us-ascii?Q?WYzlJVNUPW9Y5BM7kP4WWKBbq+z7fMy/cVkVpaLieWUBjFTgGJwzKX84UF47?=
 =?us-ascii?Q?SMlMPNYn8wqsoIHSPTQDcAm6tPA99dYdDYX2J7hAwu/5ntCyYs6c3FS3yhtH?=
 =?us-ascii?Q?6TUteemIaNFKncLM5Lh8WKXi1wtH0FZEcWBEZlODsWfLgNJIjJhcpcHlKaaZ?=
 =?us-ascii?Q?8pMD5vuc0pt3AZTBiP5fVjnM3rKQQCorfXkgvExpNP6AUQw7HmDKurazWW8F?=
 =?us-ascii?Q?gjwi9NEmZ9o4tuitYKRBTLRIMDtOtFCxJDiOjmdpIphxcfShcPOlNKxkJDHg?=
 =?us-ascii?Q?PHAfekfk0egWvTCNeXPQY/kovMLZo6Hu7U72CxvJN6h4e4pBn+t+UyC5pF+k?=
 =?us-ascii?Q?Ut+CPDITl2JqMLK+ok6cD63npyLVg5FmzxiR1grcYhSbnhXRs3rMj/9hlxc2?=
 =?us-ascii?Q?kUHH4UJnZBwDGvm8HWctxUAEnD/fvR7pBXlhTDIOFIyTqaLYzldvTuYIuWca?=
 =?us-ascii?Q?zKsggpVtIYnA3pUAPYIDpZlrHUjypXBU59OMFymM3A+oyTPELllvj4jww2tn?=
 =?us-ascii?Q?j21utjZLVS8vCKXB6QRyBuv7ROqDgdGXWcwiEym/d2YBY3wKgLaPCm+YGjFQ?=
 =?us-ascii?Q?AlfvWkFFZQsITGIZVG23XJJygqeoYcl6RTe7u2Um9Py2rw/1Xibbq53y1zH/?=
 =?us-ascii?Q?EhE0FqS+lvlw+uM31pBh5NAH2BPzLjIOVW4Euq1RL7Xdkc8u+pU7ypwOFQ2F?=
 =?us-ascii?Q?3pEyIostCqKW4ehWzK07nxPJc+TCXILWpXrW1VbjJFiun3WI38iDbmBDvK0r?=
 =?us-ascii?Q?o13MVQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a890827c-06d0-49ed-4832-08d9c583200f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:02.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzDm2/5A6gtakXiP80WjLzr7LpGMV0B2KP4HuDMm6Hf2g1d1zgFT61tqdeWp5hBy6HWJHY2aaa66x12kPgdIa5pS0vEiXtdBKasTsE5KYoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3746
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: jdngL4HiqpQ-7uMjQl4BjbC8NTrR_o-6
X-Proofpoint-GUID: jdngL4HiqpQ-7uMjQl4BjbC8NTrR_o-6
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

Provide the cpr-save restart mode, which preserves the guest VM across a
restart of the qemu process.  After cpr-save, the caller passes qemu
command-line arguments to cpr-exec, which directly exec's the new qemu
binary.  The arguments must include -S so new qemu starts in a paused state.
The caller resumes the guest by calling cpr-load.

To use the restart mode, all guest RAM objects must be shared.  The
share=on property is required for memory created with an explicit -object
option.  The memfd-alloc machine property is required for memory that is
implicitly created.  The memfd values are saved in special cpr state which
is retrieved after exec, and are kept open across exec, after which they
are retrieved and re-mmap'd.  Hence guest RAM is preserved in place,
albeit with new virtual addresses in the qemu process.

The restart mode supports vfio devices and explicit memory-backend-memfd
objects in subsequent patches.

cpr-exec syntax:
  { 'command': 'cpr-exec', 'data': { 'argv': [ 'str' ] } }

Add the restart mode:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/cpr.c   | 29 ++++++++++++++++++++++++++++-
 qapi/cpr.json     | 22 +++++++++++++++++++++-
 softmmu/physmem.c |  5 ++++-
 softmmu/vl.c      |  3 +++
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/migration/cpr.c b/migration/cpr.c
index ca76124..37eca66 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -81,6 +81,34 @@ err:
     cpr_set_mode(CPR_MODE_NONE);
 }
 
+static int preserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_clear_cloexec(fd);
+    return 0;
+}
+
+void qmp_cpr_exec(strList *args, Error **errp)
+{
+    if (xen_enabled()) {
+        error_setg(errp, "xen does not support cpr-exec");
+        return;
+    }
+    if (!runstate_check(RUN_STATE_SAVE_VM)) {
+        error_setg(errp, "runstate is not save-vm");
+        return;
+    }
+    if (cpr_get_mode() != CPR_MODE_RESTART) {
+        error_setg(errp, "cpr-exec requires cpr-save with restart mode");
+        return;
+    }
+
+    cpr_walk_fd(preserve_fd, 0);
+    if (cpr_state_save(errp)) {
+        return;
+    }
+    qemu_system_exec_request(args);
+}
+
 void qmp_cpr_load(const char *filename, Error **errp)
 {
     QEMUFile *f;
@@ -104,7 +132,6 @@ void qmp_cpr_load(const char *filename, Error **errp)
         return;
     }
 
-    cpr_set_mode(CPR_MODE_REBOOT);
     ret = qemu_load_device_state(f);
     qemu_fclose(f);
     if (ret < 0) {
diff --git a/qapi/cpr.json b/qapi/cpr.json
index 2edd08e..56be0e5 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -15,11 +15,12 @@
 # @CprMode:
 #
 # @reboot: checkpoint can be cpr-load'ed after a host kexec reboot.
+# @restart: checkpoint can be cpr-load'ed after restarting qemu.
 #
 # Since: 6.2
 ##
 { 'enum': 'CprMode',
-  'data': [ 'reboot' ] }
+  'data': [ 'reboot', 'restart' ] }
 
 ##
 # @cpr-save:
@@ -33,6 +34,11 @@
 # For reboot mode, all guest RAM objects must be non-volatile across reboot,
 # and created with the share=on parameter.
 #
+# For restart mode, all guest RAM objects must be shared.  The share=on
+# property is required for memory created with an explicit -object option,
+# and the memfd-alloc machine property is required for memory that is
+# implicitly created.
+#
 # @filename: name of checkpoint file
 # @mode: @CprMode mode
 #
@@ -43,6 +49,20 @@
             'mode': 'CprMode' } }
 
 ##
+# @cpr-exec:
+#
+# exec() a command and replace the qemu process.  The PID remains the same.
+# @argv[0] should be the path of a new qemu binary, or a prefix command that
+# in turn exec's the new qemu binary.  Must be called after cpr-save restart.
+#
+# @argv: arguments to be passed to exec().
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-exec',
+  'data': { 'argv': [ 'str' ] } }
+
+##
 # @cpr-load:
 #
 # Start virtual machine from checkpoint file that was created earlier using
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 95e2b49..e227195 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -65,6 +65,7 @@
 
 #include "qemu/pmem.h"
 
+#include "migration/cpr.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1991,7 +1992,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
             name = memory_region_name(mr);
             if (ms->memfd_alloc) {
                 Object *parent = &mr->parent_obj;
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = cpr_find_fd(name, 0);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -1999,6 +2000,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                     if (mfd < 0) {
                         return;
                     }
+                    cpr_save_fd(name, 0, mfd);
                 }
                 qemu_set_cloexec(mfd);
                 /* The memory backend already set its desired flags. */
@@ -2255,6 +2257,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    cpr_delete_fd(memory_region_name(block->mr), 0);
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ab3648a..4319e1a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -76,6 +76,7 @@
 #include "hw/i386/pc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
+#include "migration/cpr.h"
 #include "sysemu/tpm.h"
 #include "sysemu/dma.h"
 #include "hw/audio/soundhw.h"
@@ -3675,6 +3676,8 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_validate_options(machine_opts_dict);
     qemu_process_sugar_options();
 
+    cpr_state_load(&error_fatal);
+
     /*
      * These options affect everything else and should be processed
      * before daemonizing.
-- 
1.8.3.1


