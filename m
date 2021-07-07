Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCAD3BED30
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:36:48 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BTb-0004yp-Ig
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKT-0000D3-KG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006jH-Dz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:21 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCEqN003527; Wed, 7 Jul 2021 17:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=1QZTvYAJi0a+xjzUiWVOa0M109U7m9mKLQJiOLgpkIg=;
 b=uWqkmOUbG/jBugoZLuhqhQsdjdWFbYuBBypZwhU9nDE8H29W66YHgFnS/1M+hE+Z3TP3
 Hd10MYVn13yk0q4tv/T84ly9EBmj04vZ0uZCMMYJcQR+uvmI+y1OMdgiZRZ9AI9wU9v9
 degVHVQ9QhS5BrFTcf4QJ1DpFksmZLmSKaWgf+5aHZ0DH29c6alhnJo9m3xaAf6vyYOs
 GSa3BSiuEtS9eULsgrM4lzqYCz31rhUzksQnJBFQg0+EVbbo+8iI+nlViQB0EFYWxfd5
 WwblwpZSsP50EYqL5Kc3ESiIZCth4eNY0xpzxsl9fE5Tb9RmlGEiEYcaQ/HHQ+Sd90iH 2w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n4yd1er7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9YU026110;
 Wed, 7 Jul 2021 17:27:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 39jd13ub9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Shl08xvwjazsvDPUXU7+Y1PaU7sC/pkdK9WiWkuUj7y4o4/WUiaGT17zgdxOR+bhBCiMIoc8Ekodel0Y57EqTUpHGZVtUEQoqhczxTfqIk4I8mUkR66HH1FIuvmftpOUZIyCuQbqV7W82eYGpgL4iy6hVw2NdW4y7jHbVj/swI6wLaAdVx9fq5BlQZDRV4j5i67FZoRWa+OaeXBH6dm1aEbaZ4HWDWAWWwBjcDy7/Uc2rJjGAazP2ClI8YOhCdNIS0UCA3dhgx1zOoAomkp9EjZAu9xpTrL7YGLOoUOgbm1CBSYopfuseTK+pD/CCW7GNXcYQsF71JqQSRwIolHVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QZTvYAJi0a+xjzUiWVOa0M109U7m9mKLQJiOLgpkIg=;
 b=dw6ifdUhCnuolpKqF86UHkMhz5UtvwjUZyo4KddJHHZRSYOSiaS2upJgI4LC7UiDF9o5PIPtxeahG38qw8ywCUNR8ptyhFvEP01JUAIv5FGQgdObyI6v7Om2VTEYNzsYNzthJJXJiGp1WMYzlW4HpdkXb2zYMjnFMxd2WajvkHKoCqbMTsLnMUvjr4nlgYohDEuaf6GmjFQhYKZRSn3dsfXLsJM+T9aC9Lca8lerSGsN/yhasmo488Q+XtA4kk+zduTcLtAZZgo3EC8rTJHQ3HRx0a3BN6tGvOB0Jxv61DGOd/LcjE8I9OtBgAW9OyBG5Hdn03EBqxgQgJzMy0io2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QZTvYAJi0a+xjzUiWVOa0M109U7m9mKLQJiOLgpkIg=;
 b=a/WQ7p0/E9QKFJ+SYtLRrt7+Ly/MCNXRb3uZVvxCxbd+bU67+FQSmC2NJWcCn0I2zkEPrxztQh2D66mobldACX5Q8C/N/xNd80eI+PNQxDMxCQ+yCMQfCj54vKnIRzDwQj6anM4Ksqi16bAqcsu1M/QETdqnjYIfO32lIB0M/bo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:08 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 01/25] qemu_ram_volatile
Date: Wed,  7 Jul 2021 10:20:10 -0700
Message-Id: <1625678434-240960-2-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cbf9a56-9ea9-4ee8-9006-08d9416c7220
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB4104F04D0EC749755F656AF3F91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCXQGACru4O5OATG7wGlJwiyU+pz+4bZZKDGIoEtgzP48Q0YgVbRMRVyWNf0JJsZ2RTBLXbQbknEvHNDjKd+76sT77nwU14RCvrOgyqU9HyTJF95Bh7VOQFQtC72LGm3J3cOVSs8JZxDp8Yhm6Q6HAYNYcNQDNqo9vzVYdPlJ5/CWaN/7KykiLRag910BtyUNjFQgvMmvtSPhfLhxhpJvMmwLTA1vi4dzXnQMkamdIvFLxmU1NP0LrB5vkWlMVKMXjUakr9139w0deEaHN+K3Joq3xjh6be3dyyXV5miiMVk/02fLdtx3gSXCNFX1w887YQoO0UuKcUlMlfXnZtufYqImutyHlFq7LKEvKVc07R2jlbSMNwfKAOKrDqM2qxK+dTMnAJVgMl+wefzJQB7IAv8AGf/mIn2AF6eFhPzYaToKbpfObxen5nSwdsuAPBK3zofy5MB/cs3J8ozfQFTMdN3A3wp+jJthDCZ0nDFwRSmeD9Ckh4md0Itp0wbUznWo5N2c8xFvJA3QYH7ftyhILtCiAazWvCMPG2ytawOZi4wdSpMpliEl0EuTgdqqoSqdjNSYh1Pu1WALqtZnwznHbmRAYPMgostog1bIAzMf71kIGrHOp6gOeldSRZ35QbgYCECwY5VPp0V+WjrUU5COFDM0nukAIbjRAupgE6APZGAhF1L+HJyENqGkKRkHWDixgiiDyvd5nXQF7MfuxcBag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBEJBpvk2Jk8I3SS0xqg1BdstXpkPWKQAi40eYnvzBphgJpsVZeTyX5gSLm+?=
 =?us-ascii?Q?dGr0gGht3C/Za8/rJoKsGWDhTmrBJkOG3MchqrVWnxCI0gNvHR88GNIYu4wj?=
 =?us-ascii?Q?l/2eCbTejScuINH8eI6HjGlG3QTqQmEl6knvD0LfGgYDcrALCOz942Zo3Lux?=
 =?us-ascii?Q?Pi6WQESPxFu0P+x+8v7fMMacsTfJjTwjVCD/8i7oXdc6vvNyCeTWOMNZbXZk?=
 =?us-ascii?Q?idPaBeFCyX/VFpOV7bwihqoQKuPCIgfU8+agBGdnNclCxDi0Ur5HmX2eHE8w?=
 =?us-ascii?Q?OkSXd3+aNLuI1XxF6xwtzE13Lkd2gFm5IjOB/t/v+mBjgKIrvgKeQ8vz66m1?=
 =?us-ascii?Q?EB7krRsLuSfWvykgTLpuzrSzGP1DABLlWq1kojLSQDQJjHPwTNT6Vhfbta3I?=
 =?us-ascii?Q?/HK70ZZyMjmfaJLLg9xiLTVgWi59NF/2b9f4GWiSAeOItINJz/raPVsxCckj?=
 =?us-ascii?Q?JVXtJGzQKwkVqhMbB1hUjM+zyZyfv2Jq7palXoEFk7qQcRTupSVR1fmmuy66?=
 =?us-ascii?Q?t3aqMLi3cJoyBij0HGrspN0tH9S7Ge95X58F9klMTLeP95Zfj1pe+DtF9qa0?=
 =?us-ascii?Q?sO2lMPFh6jms2wK4wBYJKQsuwvZKaoTCnpWPThwAPy2CPcxsXa8x+QlGrvXg?=
 =?us-ascii?Q?av2z7w5n6V1xBcsNu5fzCmKAEDB31ckLXgPXMKXYLSuDOF21AuUIRxckra8h?=
 =?us-ascii?Q?0tEufFwhTlXMhh5W97F8FLF0JqgHsJqGZHpF4/npxzuesGGKQ7mqQC97i7F4?=
 =?us-ascii?Q?TVKqrcNAOS/zZTElaHMPAPzcW6lAbOC+l9V0drigc8dq5GnfVhbja3qnpz4V?=
 =?us-ascii?Q?6WmaD7jt6ppi9oKkj6Cpv4nf1dVXyG3DNNog6gwm982E/oNfpbdA9zWN6SpJ?=
 =?us-ascii?Q?uFwg1l6brSm9TVYxjb9xYjm5p8eJcKf+qQXC+DYg3h3Vgq6HzYWbxaFVXUtX?=
 =?us-ascii?Q?kOKwmYnRCu4EHRk4sgDXWMq7fwY5axJOrUA26SAucNufNSKsBq1n35Kuqyyk?=
 =?us-ascii?Q?39WCyHrTWG64quNy8GGUQy2iEgzZ/ARZEBX7cQXYM+zL3ValkxGFXxKfeAiO?=
 =?us-ascii?Q?QyXmvzSaT5elPqcEYWL8L37C8UYU3RvCEMryv1D5v08tLaB/iMdygBKEiKgq?=
 =?us-ascii?Q?remuVatvnANi1WhfS4aV81xoqFZA1ln28fw6rq5dksHkXzv4I8yfXRKaP4ds?=
 =?us-ascii?Q?CJCxulKg+ZBPmXVg2vXsUgOejvtLV0pvXSRU0XwSs0U9z75O4DTRsZ65B9aY?=
 =?us-ascii?Q?Gldftl9n9ESfaqbJFiVSrP5+22o1xUPo8NvhHtXcUjsdyCZxGWd9fH1OckDk?=
 =?us-ascii?Q?TNo8x+mcH4RnpH1k0M0Gy8vT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbf9a56-9ea9-4ee8-9006-08d9416c7220
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:07.7795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw73V1q2FcmdphE/nwowfPTkUGQtmjtrq0nqG2GEbEuk1zd3zNp7Pk9fslIJht7mXvG7qqFSsbA4RXbAWl6/7AEgOfegiEVNyVySylDhSfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: f1ZaQlggTU05qErZ4pE1InlIWTsemwLc
X-Proofpoint-ORIG-GUID: f1ZaQlggTU05qErZ4pE1InlIWTsemwLc
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
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that returns true if any ram_list block represents
volatile memory.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  8 ++++++++
 softmmu/memory.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b116f7c..7ad63f8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2649,6 +2649,14 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/**
+ * qemu_ram_volatile: return true if any memory regions are writable and not
+ * backed by shared memory.
+ *
+ * @errp: returned error message identifying the bad region.
+ */
+bool qemu_ram_volatile(Error **errp);
+
 #endif
 
 #endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index f016151..e9536bc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2714,6 +2714,36 @@ void memory_global_dirty_log_stop(void)
     memory_global_dirty_log_do_stop();
 }
 
+/*
+ * Return true if any memory regions are writable and not backed by shared
+ * memory.
+ */
+bool qemu_ram_volatile(Error **errp)
+{
+    RAMBlock *block;
+    MemoryRegion *mr;
+    bool ret = false;
+
+    rcu_read_lock();
+    QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
+        mr = block->mr;
+        if (mr &&
+            memory_region_is_ram(mr) &&
+            !memory_region_is_ram_device(mr) &&
+            !memory_region_is_rom(mr) &&
+            (block->fd == -1 || !qemu_ram_is_shared(block))) {
+
+            error_setg(errp, "Memory region %s is volatile",
+                       memory_region_name(mr));
+            ret = true;
+            break;
+        }
+    }
+
+    rcu_read_unlock();
+    return ret;
+}
+
 static void listener_add_address_space(MemoryListener *listener,
                                        AddressSpace *as)
 {
-- 
1.8.3.1


