Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF43CCE19
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:45:57 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5N2K-0002cx-TI
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlS-0004Rs-D3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlP-0002LR-Qv
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:30 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6HgWt031091; Mon, 19 Jul 2021 06:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=fSz+4zFsi1bH47MrTWLJVuf2Yo02EDh5t6GoiFdDNis=;
 b=Nn5WFb7TbS1WQt3QRfTfhw7wnnnlrJbS4g5BNE5aMaS18uhH8y/msIVot4AvgnRSHdsC
 fAY24iUW9EQMDwnnWHp/o+TbjIadMggOqrVbgjZTqAKUyKMYb7G5fYC9fqLwhbuh7ISb
 H6NXPR7xHCD1nKRo8FrVPLyeoj0TBySxB5Yxy/vi/FSigz+QFEHNQ2JAUagdh/ZJz0Nl
 0jvOHKQR7y2OCUuz7iz2yWQ0KicnO6uFsiGBJm+q+7B9RGU1J0uXukjNpRn/kdEZNb9L
 LyHsosXff5qf6p6QrxL1x00zCj8KThGy8Bd8L013UVyA/5V6uUhSYVpxKq6uc0pkszbJ pg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=fSz+4zFsi1bH47MrTWLJVuf2Yo02EDh5t6GoiFdDNis=;
 b=uj8ONkHHSKE4sDh9xeG1YmhwTg0BU70TDB3UZRcRw2H2FGEGJ4cvY+kto/w2wW30uOnb
 wR7BZchvoNjlxtYoR2nARKdv3WojHCZW2OOqm2GQBae0UHGHoES8a0GUKwIncMWmTdUp
 +uiK0gKi1Rk8JqPClQM8/8Kgc2SBrp6ps4vIm5OnhvR5fkUWvT277tTtsBLTU7znUqx9
 Ywo1nWH5YBYYUAcp+BHo05Og2l/Fx67deFCjmPxaM95wKZ+x2uJPaIPGr44hsb+0y9Yi
 9CkI7YqK9XMjq/zi139YOxwq6RDKVVYDZu7CmX6riJZpWksYU/+rvYa4UuMg4RuS/aLU xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39up0327pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GAHR086933;
 Mon, 19 Jul 2021 06:28:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3020.oracle.com with ESMTP id 39v8ys1vy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ0VTfcqo4jfHiFlepfJ4TvFGFMG+Yk+CVjDLVGqWEMNm95+Qae6EF46oVi2976q7dTmVPU8Nvv7qPuxfmTy8xEUsxnptXfkpriLDpSeaX/rmQopfFTIQKwYDH6RaPH3YRO1HRbcJiQs5VIpg9YZuvyv497V6WAGGxU5zR4gCcB57onvFnhktVolGM2HG+6cxbW2xgUm/c1mxOgJRaUy5Svgti5mxQtiW4vCJLxJUMHvvH3tJhVb0JQdKOqdxG/jsMhOwlemCLXrOetA3htFQu2ymHwobqXHBz/lbUmLK5lDiEW5KpKrqWOqNVN6VpA0LzrM9ecfPSKe0r3NfBE5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSz+4zFsi1bH47MrTWLJVuf2Yo02EDh5t6GoiFdDNis=;
 b=LcT2/WvzcDXPw7cM4MUM7wxgkahThke3V82XQblYPVz7olU+6eCpqyYhzctE9dziOCHH4MmEcWzizn+k6piTdhwBokh8+RNsv60Utp19Mj4qn77Fi5YdHMplncNxeHj1DVsOxgbnIzZDfD0eNXqhxhFfAmTZBEtifrj3CN/cxu5xIKVPGZx9f6+4NtJWtDm9vWNW8JVCqqRYyHjLvJTOvf+ZuDk7+QSixis/0nx83lPidO1XQFOX6SeCFJ0a85U45bTajzxGuZ2mPL4j933lj08ZnkUjlCxQOTAzBVfzEFrMbVL+W3TNLBOPZIUy+2AWPpiMasl9b+vZyXM3zdBKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSz+4zFsi1bH47MrTWLJVuf2Yo02EDh5t6GoiFdDNis=;
 b=lKZSvqRKcgVjBZtiSzT2GdEKtYZ3AW0hSVPK+CppSTEyYYN8l/N4taYRnH9WPy8mlwHEeIrMqQGEW2U2rR+F30hZTwY17xImBvoqhR+SHubuFe1OczDh3GoBe8TJ8ouL0qyDBjHPCbr86mLtq55gO4YgcJ0viGJCePNpf3McBgc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BY5PR10MB4033.namprd10.prod.outlook.com (2603:10b6:a03:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 06:28:13 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:13 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 18/19] vfio-user: migration support
Date: Sun, 18 Jul 2021 23:27:57 -0700
Message-Id: <df0d1a424490a3f9f6c176c92e2776ea065ededf.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3e8b3a-973c-4e22-d705-08d94a7e62be
X-MS-TrafficTypeDiagnostic: BY5PR10MB4033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4033AD5ECF77BA127FA019A98CE19@BY5PR10MB4033.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wi44g+vhNQm6oW4RCqpMXHos1WZhfBvVLp63pp+LNMhPxSjUgSfp52UCsiEMmTOqqe3vz2vYPAs5Btny+faa+MRyW7c9BgVeXfac3DgDcnAtwZYeEpifJ2Y1CbC8VTOSOJhUmP61fxY7WMymUsx2cc9HSg8F3K2ykczmhSg6jGtZ7uAsknZLdBYz64PIPBNLOMVWlARJ0tLU6SrcAtYPIBryXMNGhqAsDpCXxZ0BEQv1Mhal0PAJfq1+1vg3FLiVxZ52uPXliik2RNFqGDO3T8b2F4wsyRKTReV6hR8p55sHaJ3bkHoUeY2BLllGWtnR7m0zaOnRuhW3LILfJQtC0akc5CijKtfjX+uZ0PKG6wSA/V+lnSaCBfWkh+AWp4AlY7T5pzVF5Se/7ur421GrxlgW421XNuOJB7vledRdz+1w0vfiLe5AXjaB2B8qvWw4gDJ38xbwE05xLSqv0X8ze/Mz7lHrZO6aYsEfywzk/QI/cRLYjw0djUVLUQBk84luWtseg6HoX4JzbA/dqYIOnfZ/5/z+KFA28u5s1bFKzPMryUBTQmI1HHpE07XWSMTeUX/L2qTxPIQbqyyvwOFaicCJYAiL9gkhFkOaL2b+Opb+tuazgcdtY5JLtoCUtN3O+TK3I4kUUf6NSFvKJ2R8RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(376002)(346002)(366004)(38100700002)(6506007)(30864003)(83380400001)(186003)(52116002)(6512007)(2906002)(6666004)(8936002)(478600001)(2616005)(44832011)(36756003)(5660300002)(86362001)(107886003)(6486002)(6916009)(8676002)(4326008)(66946007)(66556008)(66476007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xtsL8WopPu1PDQV0nFmSEkjDWHFhJf0PiruLSdEYAIala9TO/2hui3qKCs/z?=
 =?us-ascii?Q?w5ewLOvaKdZH8aYskIcfxMaU5lHiFJWqRjIFr6IHFD0xTNL4A+YHIRGnROtB?=
 =?us-ascii?Q?M1jvHFfAGhpFCEajggFoNuKO3npEizzd19Y95WrKv+PNL+DE8ykcbjDU6eoO?=
 =?us-ascii?Q?H3UjeYz+8Azh9My5XfFivY+vCBWAefackORwp27iFXbqIGpSrfb4ycE2lQPp?=
 =?us-ascii?Q?BxBeij0HQ3kHtvp+rMGQ2OCzQRF7Ub382n+rrhQNW13DevALXFK3xv4g5Kgl?=
 =?us-ascii?Q?vqlOCQxskEOrosfCr7aHlhaCY4dwbKhDJyoUncsAU3M32hw47/94tn178ipI?=
 =?us-ascii?Q?wLEPh8yopOxhMH/evRL8+uUCkb8cw+NRgIjhvLmYI+lWxhGGCnD5Tx4XOi8F?=
 =?us-ascii?Q?UxIDiOyqhuVjYyjXhAaYvv1oPdWD97UevLeze3JBQN8Js7Q0WrHt7c1MQkAr?=
 =?us-ascii?Q?+GDNsOxOiZmD6oqkcQKoCp4zWzU0N/zYUJth6XzXA8PPrvcwKm+T3vo7Rtmc?=
 =?us-ascii?Q?AKgrEa2ZbAw5FFMm3iHlnRQGRHNGKxGoN4vYb8ELKAKaJE5eFdXcCoSDdSYP?=
 =?us-ascii?Q?9ITPiOYYDkQrMIPVshTZIFIaC6TerquJxe/TEXK74OCgGl0hmLeGMxmb4Yna?=
 =?us-ascii?Q?jUt9Jo4JM1UeQD0eYHTByGjMqvMhovCfwPNCX+7zNFpv2gW3EUgr7DSCRJQ+?=
 =?us-ascii?Q?Q2RXxO7Lmk1WyfoC81jmnRFalfoU0YExSkQo8irmPGIe48jsa2SnIPTmQJYn?=
 =?us-ascii?Q?tR8WiGdykocQdMHm+dBfT1au7bEQCa+oiWze83FjnV7QRbSXXEeoPYbnYnn+?=
 =?us-ascii?Q?EdKq149wDR0EWn4LEZIjsqGhozK8OcTZC2O40lUJyC8bDX0U7a3MQWES4c5O?=
 =?us-ascii?Q?J47DLuAnf+LRn4TkitKGXg4slvtNJYwUi3P+Dnloio2liI+pO7oSAt4YGD50?=
 =?us-ascii?Q?FRTUzrlnQDrfvY/P7ISHiBQwZNwO9unc9beGGr4GT/po4QNwH4AwB6ZW4DWI?=
 =?us-ascii?Q?l706m8an8po8w9VxeXxi6RrB+m7uoAtIc+OUmLEwRxynKW1eQ7svLvf4fqJK?=
 =?us-ascii?Q?Sfv5Mais317+BbgqeAQRwUf8BPlzHZKIBn42upvfhDXzi7unkbhkHmJYiE5x?=
 =?us-ascii?Q?oI6sXUA4/v5W4pxdXN+t2I26HbqcGrM44tuQlWK+jAnA1Pi9isNM0TQdEAOE?=
 =?us-ascii?Q?S13vwoydpxKyxwdyKjAydZ4NzSCDyTwi8G4ukZaOXswgqX6QygliuEB9tpUh?=
 =?us-ascii?Q?dqmvNDT29WTSlDeByE9+Cpwhf0tns1rHY5fCP+bmvympmU4flACmlbA3cxdn?=
 =?us-ascii?Q?hmHH34MOOSxcCA5lp/4w3dmCSRg2ZG/7I//g7CQyiB6HSsflDyjJBMBImv9x?=
 =?us-ascii?Q?w7wrdhMSXrhBh2kvbDsAbapiEemG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3e8b3a-973c-4e22-d705-08d94a7e62be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:13.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcAcKezU1nq2yvOAEZ5TTBh9NdtfSMcI1qRmAM/5Y3HlXxRU00nwXL+ocKTRzDLy6pc76ZSm/u3nq768CzF0aMbxj6oZDL8VDnMsRNw1VnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4033
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: qK5rEcSl19WJtJ7ZkydGPcjDJV6RRyui
X-Proofpoint-ORIG-GUID: qK5rEcSl19WJtJ7ZkydGPcjDJV6RRyui
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Send migration region operations to remote server.
Send VFIO_USER_USER_DIRTY_PAGES to get remote dirty bitmap.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h      | 17 +++++++++++++++
 hw/vfio/common.c    | 51 ++++++++++++++++++++++++++++++++++++---------
 hw/vfio/migration.c | 35 ++++++++++++++++++-------------
 hw/vfio/pci.c       |  7 +++++++
 hw/vfio/user.c      | 45 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 95c2fb1707..eeb328c0a9 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -230,6 +230,20 @@ struct vfio_user_irq_set {
     uint32_t count;
 };
 
+/* imported from struct vfio_iommu_type1_dirty_bitmap_get */
+struct vfio_user_bitmap_range {
+    uint64_t iova;
+    uint64_t size;
+    struct vfio_user_bitmap bitmap;
+};
+
+/* imported from struct vfio_iommu_type1_dirty_bitmap */
+struct vfio_user_dirty_pages {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
@@ -255,4 +269,7 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                                              void *reqarg);
 int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq);
 void vfio_user_reset(VFIODevice *vbasedev);
+int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                           struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                           struct vfio_iommu_type1_dirty_bitmap_get *range);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 953d9e7b55..bd31731c0f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -460,7 +460,11 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dma_unmap(container->proxy, unmap, bitmap);
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    }
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
@@ -1278,10 +1282,19 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
-    if (ret) {
-        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dirty_bitmap(container->proxy, &dirty, NULL);
+        if (ret) {
+            error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                         dirty.flags, -ret);
+        }
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+        if (ret) {
+            error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                         dirty.flags, errno);
+            ret = -errno;
+        }
     }
 }
 
@@ -1331,7 +1344,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dirty_bitmap(container->proxy, dbitmap, range);
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    }
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
@@ -2282,6 +2299,12 @@ void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
     VFIOAddressSpace *space;
     VFIOContainer *container;
 
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
     /*
      * try to mirror vfio_connect_container()
      * as much as possible
@@ -2292,18 +2315,26 @@ void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = -1;
+    QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     container->proxy = proxy;
 
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Use TYPE1 with the
+     * target's page size for maximum capatibility
+     */
     container->iommu_type = VFIO_TYPE1_IOMMU;
-    vfio_host_win_add(container, 0, (hwaddr)-1, 4096);
-    container->pgsizes = 4096;
+    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
+    container->pgsizes = TARGET_PAGE_SIZE;
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = VFIO_USER_DEF_MAX_XFER;
+    container->dirty_pgsizes = TARGET_PAGE_SIZE;
 
     QLIST_INIT(&container->group_list);
     QLIST_INSERT_HEAD(&space->containers, container, next);
 
-    QLIST_INIT(&container->giommu_list);
-
     group->container = container;
     QLIST_INSERT_HEAD(&container->group_list, group, container_next);
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 82f654afb6..8005b1171a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -27,6 +27,7 @@
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
+#include "user.h"
 
 /*
  * Flags to be used as unique delimiters for VFIO devices in the migration
@@ -49,10 +50,18 @@ static int64_t bytes_transferred;
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
+    VFIORegion *region = &vbasedev->migration->region;
     int ret;
 
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
+    if (vbasedev->proxy != NULL) {
+        ret = iswrite ?
+            vfio_user_region_write(vbasedev, region->nr, off, count, val) :
+            vfio_user_region_read(vbasedev, region->nr, off, count, val);
+    } else {
+        off += region->fd_offset;
+        ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
+                        pread(vbasedev->fd, val, count, off);
+    }
     if (ret < count) {
         error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
                      HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
@@ -111,9 +120,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
                                     uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
+    off_t dev_state_off = VFIO_MIG_STRUCT_OFFSET(device_state);
     uint32_t device_state;
     int ret;
 
@@ -201,13 +208,13 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     int ret;
 
     ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                        VFIO_MIG_STRUCT_OFFSET(data_offset));
     if (ret < 0) {
         return ret;
     }
 
     ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                        VFIO_MIG_STRUCT_OFFSET(data_size));
     if (ret < 0) {
         return ret;
     }
@@ -233,8 +240,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
             }
             buf_allocated = true;
 
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
+            ret = vfio_mig_read(vbasedev, buf, sec_size, data_offset);
             if (ret < 0) {
                 g_free(buf);
                 return ret;
@@ -269,7 +275,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 
     do {
         ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                            VFIO_MIG_STRUCT_OFFSET(data_offset));
         if (ret < 0) {
             return ret;
         }
@@ -309,8 +315,8 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             qemu_get_buffer(f, buf, sec_size);
 
             if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
+
+                ret = vfio_mig_write(vbasedev, buf, sec_size, data_offset);
                 g_free(buf);
 
                 if (ret < 0) {
@@ -322,7 +328,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
         }
 
         ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                             VFIO_MIG_STRUCT_OFFSET(data_size));
         if (ret < 0) {
             return ret;
         }
@@ -334,12 +340,11 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
     uint64_t pending_bytes = 0;
     int ret;
 
     ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
+                        VFIO_MIG_STRUCT_OFFSET(pending_bytes));
     if (ret < 0) {
         migration->pending_bytes = 0;
         return ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index bed8eaa4c2..36f8524e7c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3633,6 +3633,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    if (!pdev->failover_pair_id) {
+        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        if (ret) {
+            error_report("%s: Migration disabled", vdev->vbasedev.name);
+        }
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 8917596a2f..eceaeeccea 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -917,3 +917,48 @@ void vfio_user_reset(VFIODevice *vbasedev)
         error_printf("reset reply error %d\n", msg.error_reply);
     }
 }
+
+int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                           struct vfio_iommu_type1_dirty_bitmap *cmd,
+                           struct vfio_iommu_type1_dirty_bitmap_get *dbitmap)
+{
+    g_autofree struct {
+        struct vfio_user_dirty_pages msg;
+        struct vfio_user_bitmap_range range;
+    } *msgp = NULL;
+    int msize, rsize;
+
+    /*
+     * If just the command is sent, the returned bitmap isn't needed.
+     * The bitmap structs are different from the ioctl() versions,
+     * ioctl() returns the bitmap in a local VA
+     */
+    if (dbitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + dbitmap->bitmap.size;
+        msgp = g_malloc0(rsize);
+        msgp->range.iova = dbitmap->iova;
+        msgp->range.size = dbitmap->size;
+        msgp->range.bitmap.pgsize = dbitmap->bitmap.pgsize;
+        msgp->range.bitmap.size = dbitmap->bitmap.size;
+    } else {
+        msize = rsize = sizeof(struct vfio_user_dirty_pages);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DIRTY_PAGES, msize, 0);
+    msgp->msg.argsz = msize - sizeof(msgp->msg.hdr);
+    msgp->msg.flags = cmd->flags;
+
+    vfio_user_send_recv(proxy, &msgp->msg.hdr, NULL, rsize);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (dbitmap != NULL) {
+        memcpy(dbitmap->bitmap.data, &msgp->range.bitmap.data,
+               dbitmap->bitmap.size);
+    }
+
+    return 0;
+}
-- 
2.25.1


