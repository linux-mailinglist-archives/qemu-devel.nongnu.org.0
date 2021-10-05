Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31E422F8E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:01:46 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXol7-0002VN-6P
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnb8-0003Vy-Rk; Tue, 05 Oct 2021 12:47:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnb5-000632-5A; Tue, 05 Oct 2021 12:47:22 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195FuaMV010303; 
 Tue, 5 Oct 2021 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=EtBK1kpAIN7L6BT8jbjRrMakMubGg9NgqUGufjnJNmE=;
 b=VzffYJRczLN/AG5/covXJvg6aTudl/w5c2e+/YeQIUCk+nIupFEAlidw8pF1SlbPh1ir
 4PvKe1Ns5of+5180vvOgXr0UxvOxj+BOtY+PC++Iz7xiPnftUBu9dWhx/Tekf3BNN5sS
 6PviilhXZ4r4CQ8UgsJGlW9MsJsCiw6pj6CcMqk/2Sjuv+9Mac4inMZsF4dMh6jKKXFd
 /Sq9tEa1VFRMgW0Ie9eKoSJfGg/SHie56doFrNbNRyJkk4Rf1FCfd4LJ0u2SaV3sGEbr
 Tw10busa8N9AWuuzcF0xFkYao7R8/DnFwCXUWc5zsLSFiy/trHnDpR5o4T8DwVD6RC2M 6A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3uq1c5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:47:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195Gih7i043251;
 Tue, 5 Oct 2021 16:46:48 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3030.oracle.com with ESMTP id 3bf0s6sh5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoLmBAfu4qGANA1dpIRSies+Js3V0POcl+EdfI9FYBkptGlabrucsVure+O7CGumGEZg6tyWqUxbnLCAr+JrcnlD4FV+8A7hfO16n7RSPGifsPruMamngt0yeaI538BOQ+u4WsfJwCiXy908w+S7IX94aDCPRi12Pv0U2d09M5ojGNlGKB86qfwt3Eu7F24su6AghIk5QgOshifImaYAXgmI2yfY5nMVVNSoAobuxzdFUBkoKRjbNhmmVpTmsIUuJflW16V0EWMB1xyG9bGBwD5+nevt4GiX70QqNBZ7/EW3Q6/MdubSYz9qNJVPiCex397pqbclklacJqeGYBHfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtBK1kpAIN7L6BT8jbjRrMakMubGg9NgqUGufjnJNmE=;
 b=HEmt1sWc9IaKRVY4uMEZ+uFykmX9bTFq39LVEG6yMyX92UH46mUTdtsLxWz6cmv6dHedbVWBllPV0Qk6iL1t3OAqxwRA+6oeiIfceNrqJ/gxYrzRf4jsmWpXXKsuNwcYKkceXr3m+rsWujDwOVFD32uo1GNrBpD7LyCEnCrc6jZ3cVEak13pqr6jD6vhSiO9YEvupKLmpasHPXRwLkeWeLwJnN9KFHeVc6LFv+G2Th4VEn4cEytuw2Bo+irlO8A+x2yT7P42fGYVohGRzT/10y4ZPW5saKcE3R64PlYSK2s0GnadIKLcKufI1QDAKTZnFoOKco/HPKXln9dGvHRTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtBK1kpAIN7L6BT8jbjRrMakMubGg9NgqUGufjnJNmE=;
 b=U/vdoyC20KHU95ZeFtZSI4ODZcibM8vfVF468ly1aeGQZEIZJGex8bmrqQt08LM/s/XXl9nShVuQ48+iqJRQjR2HJyKCZqEsFeREVd6128vvvYcyQuvKASs1JC7l2TVXRt/zgYBHvXFzbLqJ1aDwOmkKbIvSAUjnU5fpD3HNVtU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:46 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:45 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 8/8] hmp: add virtio commands
Date: Tue,  5 Oct 2021 12:45:53 -0400
Message-Id: <1633452353-7169-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad4d13f9-8c1a-466f-ac92-08d9881fb7aa
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB29427A2F52644AD4758930CCE8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXcwD1jNPyJaA3gfYsRYedtYX2MR9VUFPbTj7LAr6GOzO8aF/PyZab9BTrR5Y5Lu1wshRihvmlQfyV0l8LYBdxOPh1Y0TNkz4BzlXIzYEQe8aMeBWAeN36iKRKXK3Y4YRBA3ratdsTtog9OZlw0/x1l7TfqEBXPvHv/1zgmacnzOb6S4lDVx2ognjmDg0mvQRoqXtKrDgwhKadLV2QsfQMNpJfYOSO9eANDaDqZbLLF7DEjNcVFIwOLfx80kiqA+GDBHCun/4UD3Mc1tzhWp9jTQvnUcsWHYS8y7Vuy1MP2tLMdEymUE8m/y2mNKKdpC9Qwq2CMyZb3PjjU3tjJn0r2ToasLBVylXGX3ArMh2xPyk74FeXgx9S5KwSL+AGsPUACK5iGv4suk5wtaBhC17U3LSy6M2ogYqVVRfSXBv2QG/QkPycchPgKSwCajcyjdwhZ4zlBrqMJhaLfqxCijEhbaoDT3JzcLdrO1ibNvWOk8LoAtTjlxlgaApP8s5YJEC4gWZ+lQN8P7Ca45QSkkzQhKsngaI3XbtGaoK2oTV4Y7xdQqBj5tlRDspXo4LDoRFbgbqY2UVF8d1AA3F/k6jwbVrmlJKlosxwN0csxjRVc+jTsoz2yRrnOvapw+wdKJmQLcPkr7gX4AeFIh91gGEfkSY/miXHPggHWl5IEa+r1ujjfTQOSBOLXbHu5G5ohiqG8Ck8H8LuyysajGRBO2lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qg4Ezdv6utEnvdGpvyGy2lD4TZO4I9z71ZuU+mlMvtVdTW5/S9PjFvMb0d5n?=
 =?us-ascii?Q?dQGz8IAn9KHDvQPrGsDJ4j/cbMJyzGuKVtJlRLATY5nrAId29AXsrdTn03VM?=
 =?us-ascii?Q?Tn8Z03BDZdgG6P5QFNinehTUanyivZapgeMgy6DfRvpe5LjgtUoJnW8KyA7b?=
 =?us-ascii?Q?5vqit6N8Gc2hiKkAYesYZH6pakHRbhKc0UHujshulma/wNXvy2b+CRi/KSp6?=
 =?us-ascii?Q?6CCq9Y0H6jo1DdeF7nEfyYwJOCUdmVNaLUNt6EHiRh54uUN4OIxoSCkHtKVJ?=
 =?us-ascii?Q?I3JJ1zByUyIMNncNUqoPABs3om46r1oIeKJLrDVdBoljtHeLOx+QeNx0/9se?=
 =?us-ascii?Q?/N9CK9Z62bv6LTlAmIQmMApwyNK5J7Sk2heiZruU+b7xjJM2px3Oiib+3OP8?=
 =?us-ascii?Q?52d06p2bD+oIW4lncIhPZpvK6ot5AtpclXp8WSNajMKmNNmCCtzczEfifCAo?=
 =?us-ascii?Q?7pHbvjOAzNP4Jw8Aq5kpCtDyRMHY6oKucN4QanNOgQsOgMG3SvZvHZjlIUEV?=
 =?us-ascii?Q?a+pVWgX6b7FNF+oSU34FEBgzZkMqJwHWLE0Gk6kB+UjEq+zA2UqSSHqRmUpC?=
 =?us-ascii?Q?X6XnOKdO3yxFPEi/oqx0ZLgCZCet1xTKceMfYK1cTmtwA2eW47ukNrRgcmjY?=
 =?us-ascii?Q?GtBIPHe8rQ5gnzyXzDE80Lqzo/UkofV4rMog9k6aldOtbVxdbJPGPK6PXvJ+?=
 =?us-ascii?Q?ZoMDMUVRFKsZf38sdPietFpnO0hoBHVF+DRF+13cVwXva/iRXVgB7b1k9oMs?=
 =?us-ascii?Q?Xi2irQwfZ6JzAGAj7GEzyVom422Rq/p9+UDkICSx/TCj3SKKVfzg2Ur6z7SQ?=
 =?us-ascii?Q?qqg2l9viijZPRXkfEwUB4woSvjT3oqWcI/HhKo1B+hhp4mSMnW+sCOT4uVv7?=
 =?us-ascii?Q?igmzxbxaD+AEOZLr+fvq/KswzQF/7rBlOupt2MZYNBfwLXcZkOeB6/P6naLR?=
 =?us-ascii?Q?bX1RMhbucGZ6yF5i/B5IBhwmyBFYnRw0cjgdrs6nK5ZWPRLuccEuVRIl15ta?=
 =?us-ascii?Q?G+WxIHKdkNkhy3RtuhTXLO+f81JyNYgP9ITGg/FGkAnSgDQ01RBp6uxDDGUa?=
 =?us-ascii?Q?CVX4cdiaa//IfPpCmpY1MOoB1PB1qFYlgVj74BHlFgIMsm6S34gjXU1YvOTn?=
 =?us-ascii?Q?N7vXFgg7dsQYSiKUnKOefrsPxxksWrLvzYDds9klI7Wi+/e9PDWt1/ZZPTrj?=
 =?us-ascii?Q?T8EDWXiaVyjH3OIWplDHNyYYJeX5D17nOrt2J6sR86ne0Ecs84UEj2SjT/Jv?=
 =?us-ascii?Q?Ll3HKbv3AtOPEFlqCw56FnapcSIAt+ZOR2QbhM5xCCWQoqchUS5OH04FD2XQ?=
 =?us-ascii?Q?qokuiFzfwIpwwKQMZqMfyfqe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4d13f9-8c1a-466f-ac92-08d9881fb7aa
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:45.8864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c8LsQ+XlTWCk1e8hE/Ncy8+z3lTagBs/VBKbwH4jEwrbXLMvC0nFSikojG3IWk+O2UGTU+Kel6DISZ1uEzwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: hhWar5NCDXPlH0Iy9mLjUGHb4vVLrjgl
X-Proofpoint-GUID: hhWar5NCDXPlH0Iy9mLjUGHb4vVLrjgl
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 docs/system/monitor.rst |   2 +
 hmp-commands-virtio.hx  | 250 ++++++++++++++++++++++++++++++++++
 hmp-commands.hx         |  10 ++
 hw/virtio/virtio.c      | 355 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h   |   5 +
 meson.build             |   1 +
 monitor/misc.c          |  17 +++
 7 files changed, 640 insertions(+)
 create mode 100644 hmp-commands-virtio.hx

 [Jonah: Added new HMP command for vhost queue status
  (virtio vhost-queue-status) as well as HMP helper functions to dump
  decoded vhost protocol features and virtio device configuration
  statuses.]

diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index ff5c434..10418fc 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,6 +21,8 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
+.. hxtool-doc:: hmp-commands-virtio.hx
+
 .. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
new file mode 100644
index 0000000..36aab94
--- /dev/null
+++ b/hmp-commands-virtio.hx
@@ -0,0 +1,250 @@
+HXCOMM Use DEFHEADING() to define headings in both help text and rST.
+HXCOMM Text between SRST and ERST is copied to the rST version and
+HXCOMM discarded from C version.
+HXCOMM
+HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
+HXCOMM monitor info commands.
+HXCOMM
+HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM "virtio" documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
+
+SRST
+  ``virtio`` *subcommand*
+  Show various information about virtio
+
+  Example:
+
+  List all sub-commands::
+
+  (qemu) virtio
+  virtio query  -- List all available virtio devices
+  virtio status path -- Display status of a given virtio device
+  virtio queue-status path queue -- Display status of a given virtio queue
+  virtio vhost-queue-status path queue -- Display status of a given vhost queue
+  virtio queue-element path queue [index] -- Display element of a given virtio queue
+
+ERST
+
+  {
+    .name       = "query",
+    .args_type  = "",
+    .params     = "",
+    .help       = "List all available virtio devices",
+    .cmd        = hmp_virtio_query,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio query``
+  List all available virtio devices
+
+  Example:
+
+  List all available virtio devices in the machine::
+
+  (qemu) virtio query
+  /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
+  /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
+  /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
+  /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
+  /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
+
+ERST
+
+  {
+    .name       = "status",
+    .args_type  = "path:s",
+    .params     = "path",
+    .help       = "Display status of a given virtio device",
+    .cmd        = hmp_virtio_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio status`` *path*
+  Display status of a given virtio device
+
+  Example:
+
+  Dump the status of virtio-net (vhost on)::
+
+  (qemu) virtio status /machine/peripheral-anon/device[1]/virtio-backend
+  /machine/peripheral-anon/device[1]/virtio-backend:
+    device_name:             virtio-net (vhost)
+    device_id:               1
+    vhost_started:           true
+    bus_name:                (null)
+    broken:                  false
+    disabled:                false
+    disable_legacy_check:    false
+    started:                 true
+    use_started:             true
+    start_on_kick:           false
+    use_guest_notifier_mask: true
+    vm_running:              true
+    num_vqs:                 3
+    queue_sel:               2
+    isr:                     1
+    endianness:              little
+    status: acknowledge, driver, features-ok, driver-ok
+    Guest features:   event-idx, indirect-desc, version-1
+                      ctrl-mac-addr, guest-announce, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf,
+                      host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6,
+                      guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    Host features:    protocol-features, event-idx, indirect-desc, version-1, any-layout, notify-on-empty
+                      gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq,
+                      status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn,
+                      guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    Backend features: protocol-features, event-idx, indirect-desc, version-1, any-layout, notify-on-empty
+                      gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq,
+                      status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn,
+                      guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+    VHost:
+      nvqs:           2
+      vq_index:       0
+      max_queues:     1
+      n_mem_sections: 4
+      n_tmp_sections: 4
+      backend_cap:    2
+      log_enabled:    false
+      log_size:       0
+      Features:          event-idx, indirect-desc, iommu-platform, version-1, any-layout, notify-on-empty
+                         log-all, mrg-rxbuf
+      Acked features:    event-idx, indirect-desc, version-1
+                         mrg-rxbuf
+      Backend features:
+      Protocol features:
+
+ERST
+
+  {
+    .name       = "queue-status",
+    .args_type  = "path:s,queue:i",
+    .params     = "path queue",
+    .help       = "Display status of a given virtio queue",
+    .cmd        = hmp_virtio_queue_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio queue-status`` *path* *queue*
+  Display status of a given virtio queue
+
+  Example:
+
+  Dump the status of the 6th queue of virtio-scsi::
+
+  (qemu) virtio queue-status /machine/peripheral-anon/device[2]/virtio-backend 5
+  /machine/peripheral-anon/device[2]/virtio-backend:
+    device_name:          virtio-scsi
+    queue_index:          5
+    inuse:                0
+    used_idx:             605
+    signalled_used:       605
+    signalled_used_valid: true
+    last_avail_idx:       605
+    shadow_avail_idx:     605
+    VRing:
+      num:          256
+      num_default:  256
+      align:        4096
+      desc:         0x000000011f0bc000
+      avail:        0x000000011f0bd000
+      used:         0x000000011f0bd240
+
+ERST
+
+  {
+    .name       = "vhost-queue-status",
+    .args_type  = "path:s,queue:i",
+    .params     = "path queue",
+    .help       = "Display status of a given vhost queue",
+    .cmd        = hmp_vhost_queue_status,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio vhost-queue-status`` *path* *queue*
+  Display status of a given vhost queue
+
+  Example:
+
+  Dump the status of the 2nd queue of vhost-vsock::
+
+  (qemu) virtio vhost-queue-status /machine/peripheral/vsock0/virtio-backend 1
+  /machine/peripheral/vsock0/virtio-backend:
+    device_name:          vhost-vsock (vhost)
+    kick:                 0
+    call:                 0
+    VRing:
+      num:         128
+      desc:        0x00007f44fe5b2000
+      desc_phys:   0x000000011f3fb000
+      desc_size:   2048
+      avail:       0x00007f44fe5b2800
+      avail_phys:  0x000000011f3fb800
+      avail_size:  262
+      used:        0x00007f44fe5b2940
+      used_phys:   0x000000011f3fb940
+      used_size:   1030
+
+ERST
+
+  {
+    .name       = "queue-element",
+    .args_type  = "path:s,queue:i,index:i?",
+    .params     = "path queue [index]",
+    .help       = "Display element of a given virtio queue",
+    .cmd        = hmp_virtio_queue_element,
+    .flags      = "p",
+  },
+
+SRST
+  ``virtio queue-element`` *path* *queue* [*index*]
+  Display element of a given virtio queue
+
+  Example:
+
+  Dump the information of the head element of the first queue of
+  virtio-net (vhost on)::
+
+  (qemu) virtio queue-element /machine/peripheral-anon/device[1]/virtio-backend 0
+  /machine/peripheral-anon/device[1]/virtio-backend:
+    device_name: virtio-net
+    index:       0
+    desc:
+      ndescs:  1
+      descs:   addr 0x1312c8000 len 1536 (write)
+    avail:
+      flags: 0
+      idx:   256
+      ring:  0
+    used:
+      flags: 0
+      idx:   32
+
+  Since device[1] is a virtio-net device, we can see the MAC address
+  of the NIC in the element buffer::
+
+  (qemu) xp/128bx 0x1312c8000
+  00000001312c8000: 0x01 0x00 0x00 0x00 0x00 0x00 0x22 0x00
+  00000001312c8008: 0x06 0x00 0x01 0x00 0x52 0x54 0x00 0x12
+  00000001312c8010: 0x34 0x56 0xe6 0x94 0xf2 0xc1 0x51 0x2a
+  ...
+
+  [root@guest: ~]# ip link show eth0
+  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode
+  DEFAULT group default qlen 1000
+    link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
+
+  And we can see the MAC address of the gateway immediately after::
+
+  [root@guest: ~]# arp -a
+  gateway (192.168.53.1) at e6:94:f2:c1:51:2a [ether] on eth0
+
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce..4ef0630 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1720,6 +1720,16 @@ SRST
 ERST
 
     {
+        .name       = "virtio",
+        .args_type  = "name:S?",
+        .params     = "[cmd]",
+        .help       = "show various information about virtio",
+        .cmd        = hmp_virtio_help,
+        .sub_table  = hmp_virtio_cmds,
+        .flags      = "p",
+    },
+
+    {
         .name       = "info",
         .args_type  = "item:s?",
         .params     = "[subcommand]",
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 0d67a36..f8923d5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-virtio.h"
 #include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qdict.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -31,6 +32,8 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/vhost_types.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
 #include CONFIG_DEVICES
 
 /* QAPI list of VirtIODevices */
@@ -4035,6 +4038,31 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_debug_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->type);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
 static VirtIODevice *virtio_device_find(const char *path)
 {
     VirtIODevice *vdev;
@@ -4074,6 +4102,116 @@ static VirtIODevice *virtio_device_find(const char *path)
         list;                                       \
     })
 
+#define DUMP_FEATURES(type, field)                                        \
+    do {                                                                  \
+        type##FeatureList *list = features->u.field.features;             \
+        if (list) {                                                       \
+            monitor_printf(mon, "                    ");                  \
+            while (list) {                                                \
+                monitor_printf(mon, "%s", type##Feature_str(list->value));\
+                list = list->next;                                        \
+                if (list != NULL) {                                       \
+                    monitor_printf(mon, ", ");                            \
+                }                                                         \
+            }                                                             \
+            monitor_printf(mon, "\n");                                    \
+        }                                                                 \
+    } while (0)
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    VhostProtocolFeatureList *pcol_list = pcol->features;
+    while (pcol_list) {
+        monitor_printf(mon, "%s",
+                       VhostProtocolFeature_str(pcol_list->value));
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    VirtioConfigStatusList *status_list = status->dev_status;
+    while (status_list) {
+        monitor_printf(mon, "%s",
+                       VirtioConfigStatus_str(status_list->value));
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    VirtioTransportFeatureList *transport_list = features->transport;
+    while (transport_list) {
+        monitor_printf(mon, "%s",
+                       VirtioTransportFeature_str(transport_list->value));
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    switch (features->type) {
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        DUMP_FEATURES(VirtioSerial, virtio_serial);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        DUMP_FEATURES(VirtioBlk, virtio_blk);
+        break;
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        DUMP_FEATURES(VirtioGpu, virtio_gpu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_NET:
+        DUMP_FEATURES(VirtioNet, virtio_net);
+        break;
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        DUMP_FEATURES(VirtioScsi, virtio_scsi);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        DUMP_FEATURES(VirtioBalloon, virtio_balloon);
+        break;
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        DUMP_FEATURES(VirtioIommu, virtio_iommu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        DUMP_FEATURES(VirtioInput, virtio_input);
+        break;
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        DUMP_FEATURES(VhostUserFs, vhost_user_fs);
+        break;
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        DUMP_FEATURES(VhostVsock, vhost_vsock);
+        break;
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        DUMP_FEATURES(VirtioCrypto, virtio_crypto);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (features->has_unknown_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_features);
+    }
+}
+
 static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
 {
     VirtioDeviceStatus *status;
@@ -4297,6 +4435,86 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_debug_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %ld\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   VirtioStatusEndianness_str(s->device_endian));
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %ld\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %lu\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %ld\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %ld\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %lu\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %lu\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
 VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
                                                             uint16_t queue,
                                                             Error **errp)
@@ -4341,6 +4559,41 @@ VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
     return status;
 }
 
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_debug_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->device_name);
+    monitor_printf(mon, "  kick:                 %ld\n", s->kick);
+    monitor_printf(mon, "  call:                 %ld\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %ld\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
 VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
                                                  uint16_t queue,
                                                  Error **errp)
@@ -4400,6 +4653,51 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->device_name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
 static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
 {
     VirtioRingDescFlagsList *list = NULL;
@@ -4541,6 +4839,63 @@ done:
     return element;
 }
 
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_debug_virtio_queue_element(path, queue, index != -1,
+                                               index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->device_name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    ndescs:  %d\n", e->ndescs);
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            VirtioRingDescFlagsList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s",
+                               VirtioRingDescFlags_str(flag->value));
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa105..16fc94c 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -94,6 +94,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/meson.build b/meson.build
index 7d7d14a..9473587 100644
--- a/meson.build
+++ b/meson.build
@@ -2030,6 +2030,7 @@ if have_system
   hx_headers += [
     ['hmp-commands.hx', 'hmp-commands.h'],
     ['hmp-commands-info.hx', 'hmp-commands-info.h'],
+    ['hmp-commands-virtio.hx', 'hmp-commands-virtio.h'],
   ]
 endif
 foreach d : hx_headers
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966..5e4cd88 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
 #include "hw/usb.h"
@@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
     help_cmd(mon, "info");
 }
 
+static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
+{
+#if defined(CONFIG_VIRTIO)
+    help_cmd(mon, "virtio");
+#else
+    monitor_printf(mon, "Virtio is disabled\n");
+#endif
+}
+
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -1433,6 +1443,13 @@ static HMPCommand hmp_info_cmds[] = {
     { NULL, NULL, },
 };
 
+static HMPCommand hmp_virtio_cmds[] = {
+#if defined(CONFIG_VIRTIO)
+#include "hmp-commands-virtio.h"
+#endif
+    { NULL, NULL, },
+};
+
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
 #include "hmp-commands.h"
-- 
1.8.3.1


