Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6448BC23
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:04:12 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7S3f-0006DY-LY
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Re2-0001HU-LM
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdt-0005ig-1s
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:35 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMrG6k019928
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=RlSrKToJ34Fs94Ln5Fpnva0xUkyZ6NjfPsrgWhRgs7g=;
 b=Va5CASmDtC3gV1IkHPhseZvdhtlSiN4Lju42dORf35Ki+LalFGR1ip0ckRXKQIcwCRBG
 a6uEKlNAgj+UkqFwEBoL705GYHT2XKS3lyA13RL6TPEImXIupau+phkJfE0adRM3YpOV
 Qnj3Xhm8yF4uWT5om+Twez2GNZdnWK4W08th8NEVRkF1Ga8MgheW2fL6odKJjN2XTGeN
 mKF22GGzm68nj/2c9tA6ehQ2ilLfTvPmQp5xAaQEr5myfytVYDSpXNEYO30IXqiXZ9JY
 ppDfb4NB6XNQ434GlRNI7686EJ7S2EMCJhBJYXHOVffOqj6vKcA+/iqe98olJUQUwqFs Qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KAjF069368
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3030.oracle.com with ESMTP id 3deyqy1gqq-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR2rHvOOl9h+zrI+k7WNfIdnmaO1kK7FPpefBFRE5BVC74YL5pBPgRb9zSCd7VkJMKt06eFgNwei9lKqhnSULuNHiEOcnMD81v2ae+C4sA6CfCeVLdJa22COsI+icXfcZV9yb1TTYUuUyWfXYSG15IY1Ig8yORH68a4yRtqlCIJqh0dtDmSxG5crsjxMN70aFm9Fsx6By5m6WnDBL4FlCFdjXqz9oiPkczRz06hTAxgYh4IICxuKhyt5aUMxjz8s4bDjmHw9H4iTtRC7LMFaIzjBx8mr5+WowRBku5r8MMOGxuImENa0P7fsPCmYCUNBToq5MPLfowwZHgCp+CZmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlSrKToJ34Fs94Ln5Fpnva0xUkyZ6NjfPsrgWhRgs7g=;
 b=fvvuwWpzeLz/enRE9zRJrhSZZk/F0vJxfNB5xlW86CjyL8QSDM+b5v1WhEpjGrNrePtFWbsg238YmZqlgFynMSPFbAtFAqvUQvluOQ6s2b+Lfr1SKE2dOy6V+msmViurk62vjw8eoIEH0ncfNuy92Yh3MNxNwPny0O2iMH/JI8CkLD1fzkDXbrfCrd13DpHVkJaqQfGTadh7MGXpsEfDvT9BrW7EWuzr/Cf5BUrvIVmRW2IL2IYaq5WjqoSdqU6R2qVzTcFhW5HZhb/XNH7KB4oVPKGZ+c7EjmdRhgwxgrkhONHDFLXOA0j8Z26jIeqK1GKhxcXwKzxkeR3qEK6Ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlSrKToJ34Fs94Ln5Fpnva0xUkyZ6NjfPsrgWhRgs7g=;
 b=zmNQ00+Zn1UfuqLqNlXgqjg+lbaiM/47M48GJovKojQUAtFcurbpu12a7J5JDwtZuKtvXjm+6dHhmZ6T51Ekgu+9cJVjjDGAIXNLYb1Tth+wdkcHN/ZqQgRrHv67RjvCKhzTvJrEsCbcjMamEHpvf4HmbfO/he/8Y5HS3rSdr7Q=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:09 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 19/21] vfio-user: pci reset
Date: Tue, 11 Jan 2022 16:43:55 -0800
Message-Id: <f9d2d8b71a38a88156fa57f641c9b576aac8ce13.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2168e1f3-6fe0-4991-2d04-08d9d563aa83
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB47420ABDA402F930B7662595B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJJm/0/JL6zOHIefUW3R7cn6GcYfZrGkUAHKbeauTT7LAdTHnIQh0jJR4856XZkl7IFQsBl0QWFiSYsEQWE7Dzyqc11AjiP07ydFrOHw1R23s9EWwwKN5Yh3cOWxxOaI1xd8oqg6v0YLt6VTd//fl1EbRSDD/xIGOrOj5jVwqp8DSJCCBPUHZ95q0Y4DAWTzKC76FZz41ED04XrVPqqUra+BmWUQtncaiFGtxBHxnYTI5LEyWlJc2d1Y9CWVrhg5Bz0dd3b0H4kilZYwnnVsXhxpdQFndqwtzIihFD9NWJytPPpTR285Oq6PnbBi7CONK6N5GE74Sy2jtZsBMoAJ+Vudsp67SNYET13bn1fJ08MIw153jQopHOibA9r3fahZg1EgY6BLo5NZn/Z8XWgSx0QDuRVcfQKPnX3RZocV3ELZ7JA5NvK6OknqhQhM+tU1MNmRJtfgTKmksN5eQoiDjjdOLs9kJYSfZ5n1sMXibmcMIW+dG+gtVK1AhFUTM/5FkEBCjQ/5p7Tk/1KklSyTGiie1ONyNlgMVFMxqKmW2FOD2AG7lYUuDEYMLw9xWlY176+jg9DXLoUmD3ilLPKSwkjlixcNXTGhOQLEtROyKWrRUmZKpUnFieYS+0H8gfoOMn4pUWnQVd2Ew+9VocUN3dkEN+Nzq9Dq13gfQvDXUgvCI0n07pmQrLgeassAkPl4BRCmy2ebEtLZsCQj7JEFyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gFa2eYgkJe6DBq2K9I8qPUFC+hV2lVWPb8/MHcqjOCInJvqL8tEg3LY9AMV?=
 =?us-ascii?Q?sD1maIUGvqKCddwhiHBMriYgQfyUpYXwI7ud6bI4QyGJcwc7+lTB2SFFy6fd?=
 =?us-ascii?Q?vLQFoV+GJsXKGqlWq89RY0TX1mjzawyn4UleFqsKybcBOdXUKGGyhREkz/LI?=
 =?us-ascii?Q?PI4Kc8DseWK/PV3lSTSIp0/CZQ5XkRHQIdjRmlwfy+th1QASJR/ZvjrdY5+n?=
 =?us-ascii?Q?K4aukX4GnRgcxcVXFkhN5sWSl0fMErZfQj5Sy6qGRn9QbuOGS2kIvV+RCBWH?=
 =?us-ascii?Q?sm1sFt2lnHMOAPJOlZDhaZVv2sfJ7cw2AEDqE0zB1eHY2qCwFsw1M21R5OyF?=
 =?us-ascii?Q?TWoxwDuViMJmEm7uPONw2kCmR757aaNPp/b65ainGtsCzyukSSLn15SNlehJ?=
 =?us-ascii?Q?QHzVwylfDgeX9W0UaLcELa32/lyAHOCblIdjwnqJoCzJEtLJk/d6g0ijHsXl?=
 =?us-ascii?Q?KY3I9GB/vze+aFt71X+Af7Ro98x3jHOOX+BWdCmmpurefSHwHi5HkB+LnnCH?=
 =?us-ascii?Q?7KCVSECiE6UhZPtKenH+tAXR9dOrEq5YSpXA1U3bcI+pCPfFIHlG0c8joqqd?=
 =?us-ascii?Q?Wfa0RAABjuQucver+6+rqOPHKMSqzmDhgEOkE0aonbzjq7wIC+mYbE1+ACXJ?=
 =?us-ascii?Q?sJ98U0zATS22yZPg0WmjmXaJigCPO5GpGtWBAXwcIekQ6fy43oPapFb6JQzi?=
 =?us-ascii?Q?nYgOdOyx5IY2u/0AXyvoNdlGZgHwRp63GNusv/S5VwhYj8yhKe4238pxAgQA?=
 =?us-ascii?Q?tnbfDmbzU9oLzkajRANXFla9cM261LUUBSVu5Vbqa/N0j1DdkBlQ/mraUrTL?=
 =?us-ascii?Q?E0AkU4O82P3ovgKmQAeWE4P1NheM0hvikcfC0qQ1rgniemq9X01RZ61OxhbE?=
 =?us-ascii?Q?Q7Lxs0TiBcW0WrRrmPzoKfUq0me7tI9DSXZdfAFiXmE+3oeoMXj+GfzdIyHc?=
 =?us-ascii?Q?8GdsP014XVsrxWYiNVPG2ljZ5+FarQqviyaZlirB8o/IwWueM4mprUTiqRIm?=
 =?us-ascii?Q?rOt3KzKROsmCq4YfAxLZ3xhSBLG1gNdvpKxmitAtFvLDNoWfUUQlTTDYD136?=
 =?us-ascii?Q?uHdsRvOkuu5Ejpd7vyioakcyYChdsu7sp1gxPj2a3+gFYu4TIXytNCgYhCRF?=
 =?us-ascii?Q?1+JF/PQUjrgbRCjewrhgeWXlhWVubmS9055T02tiWD3kiQAz2awBS1lSENK9?=
 =?us-ascii?Q?W8HL2xOITYJoY+09KiF3fzHgrBAo/0AWbYkaQuuHoYM2NejuTk+AnI3K08wX?=
 =?us-ascii?Q?4gDzVcze+LYPeokX6Rra1Gwc+FTM2q5SV3EkINcmq0ckZywslOdKkhT+0rRO?=
 =?us-ascii?Q?UA7MehZB8Hq/k/3QwNNKGcBtkhoenoIBM3wBMCrDIJioXNeMpx/JA8tmpJiF?=
 =?us-ascii?Q?0RXo4XbvcI676DheYkApalrwes8zI7fF3wCLpR67l2rbCUdvv8vrC1SnXyMQ?=
 =?us-ascii?Q?LVxwzNE43fpGUa9cPvNgB5nWZItdOh8ZksqOVsCBiGCdColP9TlRc5B/2ERJ?=
 =?us-ascii?Q?08sVmPlyjDMl7H6HYHSgaYCj7iQrd7Zmc6dw/pEEKmNRWWCHi8AW5lKFyTYK?=
 =?us-ascii?Q?a0KMQxU2UYrj3X0ig2No65NtlJVJH1+YOUcELw2RYf/Jv9PJQQM0BPv4M4Xn?=
 =?us-ascii?Q?iP2alfkslbGXWbBYkeuwzK9zT8SHfFe1oE9BsX1JlpvwGjAwHoBMNgelop1O?=
 =?us-ascii?Q?xvTOWA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2168e1f3-6fe0-4991-2d04-08d9d563aa83
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:08.9931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wG1P4JEeQo26q7fjRZtdc0aW5ucsp30Ruwe928NMiVN8zP7zjz61pr+Sci/tkBSlGOaiux/gZk38KNixSz2sojgYOj4J4eGm7YQyp3mN7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: 0Yzw2T10qHItDMPisvWjwujBdV2618BK
X-Proofpoint-ORIG-GUID: 0Yzw2T10qHItDMPisvWjwujBdV2618BK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Message to tell the server to reset the device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  1 +
 hw/vfio/pci.c  | 15 +++++++++++++++
 hw/vfio/user.c | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index e6c1091..7504681 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -88,6 +88,7 @@ void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
 void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
 void vfio_user_putfds(VFIOUserMsg *msg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+void vfio_user_reset(VFIOProxy *proxy);
 
 extern VFIODevIO vfio_dev_io_sock;
 extern VFIOContIO vfio_cont_io_sock;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7479dc4..d47b98e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3713,6 +3713,20 @@ static void vfio_user_instance_finalize(Object *obj)
     }
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev->proxy);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
@@ -3726,6 +3740,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index e377b0f..33d8f06 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1398,6 +1398,18 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
     return ret;
 }
 
+void vfio_user_reset(VFIOProxy *proxy)
+{
+    VFIOUserHdr msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_wait(proxy, &msg, NULL, 0, false);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
+
 
 /*
  * Socket-based io_ops
-- 
1.8.3.1


