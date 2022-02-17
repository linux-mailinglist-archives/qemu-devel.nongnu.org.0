Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF944B9B27
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:32:43 +0100 (CET)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcDS-0006vg-SG
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:32:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYK-0004Ig-7H
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYE-0004Ty-Jb
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:09 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5WxbN009086; 
 Thu, 17 Feb 2022 07:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=YtwyPyeZLkPGA2UyzFQiulYbfpCHWKzHu6SfZg1oS0Q=;
 b=GgiJf3ppNwzG2ztUZod8fxc2F6pLQOAX/rleeGBk9HWCXjVPmmj0rCEk/gn+suAMI4em
 00xTsM3TYxEamDq9y8XSbd2bpPQPJrHSNnsbWZnG0lH17R9adZ1/ZNfXyxiD57JA7M9L
 zFIK5ILlM0VVJE2dFrGX1iIHIrE+8M55aVj5UQR12NjsJse1TDmOv+sJvLOHJsBdJgs8
 7PyXHMacYnex1UWgU8g3XCSHY0XPmIGloDkLZFXgxSvV2EDLq66us6i+lCHfMcPVsnCu
 Rg/6NDDVVDV1/9VZDf2n6D19uXMlFJjkR3tvoVIDSbXyJsNiAyq0rv3jbzur8PYlzXg/ qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gDWf030241;
 Thu, 17 Feb 2022 07:49:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf6hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCwDHuDbhqC2YRMgBpRFLrSAV/tAHCaWlNhKuVjcYHpwRS+w+57rgN8FrtK/bfOdVJd+8ZpKIddUidKe1zQjPDt8qquqKuot55F0Aj9Ww1XgM4gnnQAuCd9j/7qzXvVUvZ9+gzNatD6F3SusfRZzLGhZi64rX7JdPPQKkz3p1C3j663CvN87oNQgb2XQd6qIu4SR/sjX1DW4u9tCOvJi9v4WwW0+8Tq94M/xuD+o3KHUxyWRmEhe7+iDKwQP4+888ClDg7keBcTEmISU+Yzyl0RfNFFPe6l9gI/bkQN3jtbKK6GdrWoYW9nrAh5R6NKHFdhGu+0gV6u+VfjU/OUhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtwyPyeZLkPGA2UyzFQiulYbfpCHWKzHu6SfZg1oS0Q=;
 b=lWHkLHV4yr9AQM73MJiCi0ChMHvauFczPaUMS6QNWs/A7r80FA5NBpcr+MHiHmSqAtDqY1cFnBCfK4ZTZqlWLjlPkQTaaokMqpSHp2Gxl1CV43CfF6XqfsPoxm939M6+/QIuGB7FFgDYWxmCtG31agG8iWYmd7iVzivCAwWou6Sz0Y7/braWcy0BoUGkE0Nrfg2Z6nazfl6IDF/m7n4AFSXX6RWPJ2Mh7Mfe3m1XTwQHtyUZhVzrz6RQHkUvqJT2pLfpkj6RCvrMdGYzgWrdG7N3ezQD8xsN8+qYFeZY04bqY22GSa4ydqMOAaEPNs3KZXB9FBq/eAVHuIz/1fmyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtwyPyeZLkPGA2UyzFQiulYbfpCHWKzHu6SfZg1oS0Q=;
 b=ZZ77JozQ6Qj+1pghZGZZorJriWpebEXpzvnAucUYok9Ydl49eNG6mqz90eOKpty1R2QSrXGG6B0WRnMXlFfI4eQG0V1KPtX8KPOJy5GGOHN9S070GKuAtZqLXk8oYlOI/H6dLI8vme3Yh0SmOciAo+mKQH8btef448yb292NfJE=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:51 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:51 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/19] vfio-user: handle reset of remote device
Date: Thu, 17 Feb 2022 02:49:05 -0500
Message-Id: <54278334564d9e9f8d2eb3ff884260ac90da44e5.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34331bab-01c0-49d1-e05d-08d9f1ea140a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3211ADE98651B668D1E3C83490369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKX0yXvhQQ50vNdUrjU0nqoq0rpZGBKB/kuwEU5ODlxR6BYBLe548LxXMhsFAuPF+DAtDITyRXkCj+qVqyrNT3q6fRuL7lpxzU2JjKzgJjAAVaZ6p1ZUOCPeCAhTmmKm1M+dVKCULUdXs1xM2Zflx8VpEJNe1eO5r7IMA4pX7PMjH1LrJlJ8goHgRp2KRxJyFc7HdsyqFhAamdVgtmnJtZjoYYilGHnAUyVmFCt9I7yZPgDLJDwXNO3/rIfVeOOwsTNRSLMyURYXKU3pXjO+56OtL8MpVCIUYzozFq6Tlqro+HP2Zs0v+Z+26QECFYGMKDNaCST8zLEM649EjtSdX6URib3nw59wBOaht6Bc0kDYCdFGgXLn/uoiOwy130FRePMJ/246i7eMla39UJDP1+hJ7eKNcOWJrF2whiTaY9WZOthqe4kx6ubtV4vgjBvF3nR3/uxB9oZ7iQTJGAZe9WvxFW962wmqVRwV93iOyZufKk7t+cfSjJxjpsGbtJaY1BkLq8loBqu6HMdu70GVL1uaZWSPAf/hKfSlyKWVVjhMqG9uG9HvZd9Q/pkNEDX1f+q86Nl+yopRL6hT9FfhC4hnsC/PNOlUlQ82P5x4Eh+VPH8vx9qjVk6uY6HdLSgGBfxKcvnnRShUXtzvL0pPePZTWV8XjFF0xQ+LLRdD5cLR8hQWpPYf7rD1SMqLRDp8Izy3G7lcbn6o4vvZqYWlvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wpXj2qsvzX4yOzwnfa8QN8+eUK+BTJb5eTb6rCfey2885J6TygLkX20LQe0I?=
 =?us-ascii?Q?6uzPfz+FykdXEy0Om+JBbDB9OE0ezALjEUn6b9XuyevnClIT7CUPVU7a6AZU?=
 =?us-ascii?Q?S28yNsrUk/jvfdpPFAKDrP6YhXjejIfIMsv34hXDAS83BRIn/sld37VsMHj3?=
 =?us-ascii?Q?qY6efhj+gd6C7yj20csPuDwesWU6IySmCaedhc62Ta+cwmEZQCzyDFmQx15v?=
 =?us-ascii?Q?eYwocjbWefEkl4K6Gj22Cqy6g2Zta4uxt3EfkVzNyLxcHJbmNv38KX6pN+2G?=
 =?us-ascii?Q?pfz/uZfIj+JGI12J67EXB6sRZcxnJHufZCjacyBRYJ8oxQg+mWL4FmKnO76w?=
 =?us-ascii?Q?9JKtYJurBclTqsuLG9qUFSgQUdLTGcAhD0p/zhzHIyqc49OT4h0zHm5Nvtwm?=
 =?us-ascii?Q?lAxmf3ALVS90aiE1WxeqGuyBgRtY+hAPrBc1iTVmpTXTACG8RGV7E/JCRPqs?=
 =?us-ascii?Q?DXxGZYKxDdTf7f7oKwecyHvk5SZslesEaMVZaQbTsbhHoDg7d9gO6UK17imT?=
 =?us-ascii?Q?166He9hxG/SxPurlyYwEPlY5R+3E3ACNap6kgb7WviUwLMbqCbNIie6VJIEt?=
 =?us-ascii?Q?yMyjM6eKOaYmKV5PjUzR9/dxMjNIILhPw+YDEM7qNlyW/QNB/R2p33tSzFeT?=
 =?us-ascii?Q?7xfihe3GWuFOkPlxRiqZVSTjJjs8cdzgWxLO8Tb0fzXyMAk+ru9iUbeGoJWM?=
 =?us-ascii?Q?XUc3xBB/4LJi5PM7DDcbwDLO2aih/YDhh5jvosC4bVeSTS7wOndIhpq0rs9B?=
 =?us-ascii?Q?zvdKVSygRCcfHq6ImVJ2iSFGwbvlNHVCCYKm+NkF4a1xe6PJ8XNvLPA5+y9X?=
 =?us-ascii?Q?PgYbt21EZx+Qssb0HPuGpBXJVQTaROd027bjOnQZsUywhcIeIBR74wBj1DMY?=
 =?us-ascii?Q?8Sbq9f8l9EraMUs5kI7mcIut/ijJxv5496Bb19a/UyWLUMnw/vuLbHvcxj9p?=
 =?us-ascii?Q?L15ztviNmGWKo3/p/MWGexp9mj1kFu7jcHxAKMyCsWahDfahZ/vaPozUAIfk?=
 =?us-ascii?Q?njfH8ilabo81N26UyTUl9XftzWtTkj6hgohLl6eMSHmRvo98wq5m+pTZ/FAs?=
 =?us-ascii?Q?bFGMC/y9hjlkqaH4eoNTeZO805Z2AOFGR+IjgrlYkn7CcGxZ16WqjPQZxqSW?=
 =?us-ascii?Q?MObkrhahhQbE4JT5m9xrKdWX7TlPYuchJ7B8Vmt+blgWEZLEtf+yC7BB7027?=
 =?us-ascii?Q?LMv0jdTZAlgvGm73O/KmK82b4OTd3Y29HKvgvTu67J/r0oSFKEQpwmazsb6I?=
 =?us-ascii?Q?ljH/jDOw6/TmtMsoacSZNwrK+EZZVC6Z9gKSKUfiULRveLQtZFWqqoW//3EB?=
 =?us-ascii?Q?z/svS1FnH/BdMK9JFtROK+3CmeZoqTuu6STlZ/QU+wrMHnwIp2ZV5XKlJhsW?=
 =?us-ascii?Q?MaP4lG2LTbgUdSnrwRNTSeL0ptogtrIMwyB8k+JMd6kO6Rf2y9qopZUx4sd1?=
 =?us-ascii?Q?m7bybWuk88846wocTFyEbNTEIk+TcczMz3V3/9PnRDywA9v06TSkx2UxRI04?=
 =?us-ascii?Q?rVOm7WN+a202sAgysSVCd4dMYAAgTVYd+OmkoF1oWbJVY+vTrenwca9m4wme?=
 =?us-ascii?Q?1CMdx+1xrLxWLWbyRITGUHRe7XWeiZTlQMJwcO9MIOYOEB53FXFPyxkdthaN?=
 =?us-ascii?Q?KBpBND93snkSoHNklbJviYc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34331bab-01c0-49d1-e05d-08d9f1ea140a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:51.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jvnWT+L3WbhRySGyHBYsHYr3L6iKbvECar6Gzh+JwgR8+SJzYJHMsGBbP7j93uQPVrSWRXy1T7IpxoOOcaPUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-GUID: MbNXoCMZ8Jv4OTLqcl-Ze0By9E7QKg8z
X-Proofpoint-ORIG-GUID: MbNXoCMZ8Jv4OTLqcl-Ze0By9E7QKg8z
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 2304643003..55f1bf5e0f 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -989,6 +989,19 @@ static bool vfu_object_migratable(VfuObject *o)
     return dc->vmsd && !dc->vmsd->unmigratable;
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -1105,6 +1118,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     if (!vfu_object_migratable(o)) {
         goto realize_ctx;
     }
-- 
2.20.1


