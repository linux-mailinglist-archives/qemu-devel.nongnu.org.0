Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F747D7F5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:48:31 +0100 (CET)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07bC-0004uo-Dt
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V6-0004Xw-67
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008K9-FR
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:11 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXslZ013624; 
 Wed, 22 Dec 2021 19:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ygiO+IS2ppG8e2kHLFoNy9Ir4dA83tM9aJsf2H7Q5to=;
 b=S8DpysU+cCMYeYY3h1UaYX7Txb3HRNqH4w/CvgeKspatl9bRU0IUSWYAmY6bQs6eVWrJ
 +/ggDmuf3sLeWfhBGnJB3FQnOE4Gp5/alRQmez7UPZQIzRyrbPWZbH5uGBQu4sbfYuQN
 X1/6zVMPU1Z17nOHWprMT5BazOMrumq5AHT+kMlpbJ3BGWVIXI5kKYreRDFSo5e4/neg
 LMf6uW8QHZXDoSgat1cNqh+nOytY+loUE/cSj6jhncyUA4t01lEcN/rgUaz+zk6kGDKa
 m/ISZkHnRrtsa4rsKnNUdk9zPGlH+ZCwDkWDn6g/bFeaTwNm60Rv6GjjRvRMjHKfMWFb 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeS049074;
 Wed, 22 Dec 2021 19:41:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAbvpsCycsRdwFWZEWAsJc2lJqj+0ZZoHCaGp7nez5NXIQVry4L4T9itGv61OCmOmdRAODUwd+MZlEDjTNqB+mVuYuTjr289Gj3GCuq4GxB3k7yIrbjPNWrtKvKoNtm1+ok/QaN/EBKwzUzIQOVqIKAZ+hCvqiNTKuQfilWTKTPu5LDZ0AaOiJHdxl7HiVmNEEobgqJ7jsxUvZIqbx1kgxI1TQgssL6cICKa8ROq13jodnKxWqwECYK4oS+Ab0eHqGx3SSL8vyDdyaKzqIEZK6JM6/30JxP29cY+wYiJryX0rH1YtGKNbWcsBaKPT1ihTIg3zJjEPEa/qtnYRVzJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygiO+IS2ppG8e2kHLFoNy9Ir4dA83tM9aJsf2H7Q5to=;
 b=PYxCXPH7fvZJqG9BKjRxKesh9wNTQDiyamVUX2mbAiylLRzex/GLneAoSJ8s+QxCl9spWIAiKwzhFNspxDfhgFmaGGuwuqEu+Nng+3hradiPEyNHF17bT9Es7u6YNZIllTdoS/aNosUcY8Q3nhRfJycsMY4PRIhECNT2njd4laRp+3LpWT45yhbyDjNlI2ykSeLqXLtueuA8tTtxkCpKuOoJYRpknmSMFrxwCNMj7AAvyyO22qXeifd1Hr3w314+EP3YtU+GRpAg+lGZy7WhrnrKobReh1dPNFwCwzTJmd7QhPopT2cPDMv5LWWYwlp7EOp/oiWsGYQ3pKzuctl9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygiO+IS2ppG8e2kHLFoNy9Ir4dA83tM9aJsf2H7Q5to=;
 b=mTPx1mlAubDQTo/2++UPEjdwY0f0TcjeTCD53JNdTosNwxOdk6d/uiHpdQDexIJg3Q2DOyWFBTB0YyeShg85F71AmxI255WYYPeCo/lynubV31s1R3fqQui2lwjRixmNzCt7Id8S/ocplU+x+9uXx181nteGNAhSLdQlQi3tShs=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:54 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:54 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 01/29] memory: qemu_check_ram_volatile
Date: Wed, 22 Dec 2021 11:05:06 -0800
Message-Id: <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab7dcf2-8c2d-4bae-ca97-08d9c5831b8f
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2888242E425E8DD895442123F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7pXEeG0nsuKXDWv2XhrAFHAh/GPCXm5AACVififP9Gfz6oGlbNMoNfECXgx4hqiHdidqtpFkB8CVotRIIVQn48ekEddw7Z9C454P80NwRnWFJKasNjKKt6BWlxnUY56c0rOKQdRfVtuk3xTvZULu7ouIbShvPUC5lDtr04fry3YrOXZ/fWRqqHLgPmy2g9a6R7t4tOS5fUXtnOeAnT2zLG3wjL2fWxJrhLbZks3F8C2Xf9kkQmdxSrXEcyizCVgQMB3Fo6Wzw3mVaZmPNy900ZDPMgxfzp3FbtOQPK7KtfeGvVMdVpReuZOwbcD3LEjNEm2SQHTcCp6A4TC1u+tDcvP9QOLh/EAyVJudnpyZHJNbHZlGw7/zFHt+XPLlwHf7AZLJKPQBUkKAkRxhblVcssoIcwSEBQZjV1gq6mJOkSLhOfMa0e68HK+TfV1oZJgVOqQrI5GblJL8GDfRAFJWFyejbx22uJaiL0PEWKCLiRUBSS95W8dZSN1ia6F/bdqlDrkXzwBjPvM/jYvcuz0IsiyogKxQXzYQw+C0YAo/lhsZ11Lu658ZmwFVD8qaHGLl4fc/bqgEOV8HPmxTwVUA1y0vJ5dRA0BwoGv07X2Qjlfe3m3n2upO6CESPD0ozNG8PyMx0mIoubThdQc7gP1euxfy0Omjx8QCLnfJbzQb8/8gEWcyPX5he7HPYSjD+oi+eDnVrortiA203rNdEssQYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRByu9cFfupapDol8msY1whYgYB3R9mJqonVqLEZUW4fBv9lq7D54DoicDoA?=
 =?us-ascii?Q?w1r23klWnE1Ylzn4of/CNlA/NsArSwumwtHwKjJdfOZj5GiPfb1Xj4FdQsgO?=
 =?us-ascii?Q?Wg/hJpGaI+nlSStDALVFGVOmDG09LmghhQ+04hG1P5XxnMsK9wWl3pvWWp/q?=
 =?us-ascii?Q?6Kb9TwfaX8BXQZDy8fxairasXjxPXmMqr6F+n1CCqE5QEQx6pQrBJdZBrJii?=
 =?us-ascii?Q?gfrS6rkLIEHk9S2BELfvO1a1aecySP0thoj5HYSea2jqs0O9K/L1gIK44kCc?=
 =?us-ascii?Q?0PyA7VMIV/sPpg5WWdcSAZUaUI1ZalFK21mglEFHmRPb7Tm/lR9i6/Gazaaw?=
 =?us-ascii?Q?BTUQdZkgUg0JkQIHe3BBuoZVnQWS0sqrivvP18SsooM06oRf4z4iGJC3gR2B?=
 =?us-ascii?Q?TP5p3uDRZvTGKaNj08LwOSigutuE6K2u+m0RTILJMbHLWeMHqqhvyO36KrDJ?=
 =?us-ascii?Q?pLcFS8XQKUOQKjpUBhbU4EqgWp5T7QimOlDzJMI0izz2kB62lO0TKmIW9QGG?=
 =?us-ascii?Q?vIfawLBm5KztlgKVn15xS0hoJ5NqWqKCfGbqDBxqX6CMo6oCeUDfP8kgFIQg?=
 =?us-ascii?Q?ySxZpiE3tceXoXn3cTrbJeA3it2nSj+ZtjOqTu63YS6VaZPszZh2QqyhBZZy?=
 =?us-ascii?Q?FAv2xW47IVI7WGBXfFjl56I/pq0mU5Pl3fMbX/ReSZG0mZmIicXz0UABD5Ah?=
 =?us-ascii?Q?VtNDIjqEvzElai4e3puvucM42vl2K5SCpxXIpW12HOHxsY8VTitfDseXs8AR?=
 =?us-ascii?Q?ILa9nFL+m4TdRJyN9ouZPlrOpBo2wrSYsYGN8eHtthkvxOFqy0g9/n6ANqtu?=
 =?us-ascii?Q?RNgbKwKE3gCU8PY2TnXlu4FFWKD2EruCeGaTrOtt4v4FWIYDUr6n5kkFJU/R?=
 =?us-ascii?Q?07/Yb+VK3MSo8NA9rmT75x//yva+vi7I5k5NX2EKxf16hKtQ2Z/9DZOq0umH?=
 =?us-ascii?Q?t7UBe2MQuACyUXpDI82zlgTU3COh/DNDPXgCg4dy5SPr+6SZBN+6hLddsFRW?=
 =?us-ascii?Q?R9UhqGjpKP3N66nBcJE9cI9t9kU6zBB5XU/E8ZORgMsvabGvblhMqrTVuRDu?=
 =?us-ascii?Q?eCLJTwp0UOq1NpBsPkledQsLOjVwzEXy9lqfPfVnyEEhmT8rau9IEptDUz04?=
 =?us-ascii?Q?ObpMo4m2P3Hf0I2KfHCZBqmym7EIhPZuqGmE1Hc9T1IixptNogKc7ytY9gO6?=
 =?us-ascii?Q?FcT7BuDWq/9kHhQ2EwMMC+TFtA8iiUwr6SCysKIoVlwNezlR2wZFoYNCYRu7?=
 =?us-ascii?Q?qpYJVLFqdgJRdqeJTTBP1JlExU/b5ykG6b0feZAIu2SDhDjMOBuIO4oHiPV9?=
 =?us-ascii?Q?aWY5udD4LdNjEAuatfDrl+9WMNMs+At1MohIQjWd41cLWTv9o6/g8vdFGAk8?=
 =?us-ascii?Q?PwTEfu3fu+VVTm++0cawaH0cBO3A9qA4Jh2uaLL1WbbKdprvH5bMecfDw5xk?=
 =?us-ascii?Q?+crDEcc8meDjGvpNDxzA2cwB6kyjYyY7gEouXmPLJX2FJrHs57y4dE+6Plp/?=
 =?us-ascii?Q?eK58B2hLjgajS0fegZSAwJmIz2xOQ1kkP7ThgnAMs2saTIeeXqt7EP95SQbV?=
 =?us-ascii?Q?hXABSDPO9cn/voKum4QPrlYkHi0bebuiqp1pnXZ0iJvd7CoOyxZ5VuPoIk9a?=
 =?us-ascii?Q?j8uPK08zKKE2VsG8+VbKWv2SpN4EyhaUpz7oYavMbFHdQd+wm5BH34E5EV7U?=
 =?us-ascii?Q?aT3aXw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7dcf2-8c2d-4bae-ca97-08d9c5831b8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:54.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW8BXwV53RpNJB9Bv/2BqB/EK3nMngt0Gu6siE1CUwvPSjGTXhkYePjo+ToUpYZVMiUMWew+Ce4+qUOk+fN7TQ6US1pETeJnmh3whWTx3uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: FQcFJt6mlBxirhu7YvgsEmo4MycPPcuM
X-Proofpoint-ORIG-GUID: FQcFJt6mlBxirhu7YvgsEmo4MycPPcuM
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

Add a function that returns an error if any ram_list block represents
volatile memory.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  8 ++++++++
 softmmu/memory.c      | 26 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27..137f5f3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2981,6 +2981,14 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/**
+ * qemu_ram_check_volatile: return 1 if any memory regions are writable and not
+ * backed by shared memory, else return 0.
+ *
+ * @errp: returned error message identifying the first volatile region found.
+ */
+int qemu_check_ram_volatile(Error **errp);
+
 #endif
 
 #endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19..30b2f68 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2837,6 +2837,32 @@ void memory_global_dirty_log_stop(unsigned int flags)
     memory_global_dirty_log_do_stop(flags);
 }
 
+static int check_volatile(RAMBlock *rb, void *opaque)
+{
+    MemoryRegion *mr = rb->mr;
+
+    if (mr &&
+        memory_region_is_ram(mr) &&
+        !memory_region_is_ram_device(mr) &&
+        !memory_region_is_rom(mr) &&
+        (rb->fd == -1 || !qemu_ram_is_shared(rb))) {
+        *(const char **)opaque = memory_region_name(mr);
+        return -1;
+    }
+    return 0;
+}
+
+int qemu_check_ram_volatile(Error **errp)
+{
+    char *name;
+
+    if (qemu_ram_foreach_block(check_volatile, &name)) {
+        error_setg(errp, "Memory region %s is volatile", name);
+        return -1;
+    }
+    return 0;
+}
+
 static void listener_add_address_space(MemoryListener *listener,
                                        AddressSpace *as)
 {
-- 
1.8.3.1


