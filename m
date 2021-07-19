Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48743CCDFF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:34:49 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MrW-0001Zu-1A
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlJ-0004Cn-Mw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlE-0002KX-Mh
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:21 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GQT1021865; Mon, 19 Jul 2021 06:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=OKiTuGzWvSN5SkZe9+4oARYCgcVyj2tZdnAtp/n8nYY=;
 b=hPe57ahM3zrMnYjBWK7fw3uUhkZCkhrcFK1FhofSTAtULoSF/eAm+gqnYRS3mcJXnUu5
 T/HQddx5Cd4tO2lU+4/R2cTQUDuF8AdwoIFKQwDvHRUmm5DJQ6ZE5I2vB9hVm3VFUEqA
 5BQvrg1+v0vFAx8aQJB44p7FiYNUvzZDSajLycbOWmReBcm/So4aI8K3KMZVzyCY6HGK
 hB1pgUxprlJwBXj7cMD8wqZBg0T5qbi3DJ9epgibfVqOwxsoyDE3uQ19lfz/FgQ5biUE
 2zYwlNdrCxehCZWnUxgq9de5hbysKjXVndiCInxWIrIgi8usn7OtV1BTvIi4YQCoaZ6X fQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=OKiTuGzWvSN5SkZe9+4oARYCgcVyj2tZdnAtp/n8nYY=;
 b=Z35A4Mt48AK6eV/0MXemDw+PtkETYQfXgK5epGqZdfgY0O2lODxIeyft7E2+Twmr4AUP
 dFNUvif+hUPdbwDozkzOnnKWal4phlJoYWhN2ImUGarmrft9dbRoN/602KCWCMJdDAHn
 mxh8CYzw+kWSexhWNSCsAz7er7Gv2VEBtXEaWv8Lu3IiKlKXk06AdM5bL6dqh6i2/LJ/
 hRDdGHPDVqDfxwby1tdIgVWYpipI9h4n6QudOg/r8ebn92YCz+x/iwX0glj1Pgwqwjfk
 OoDoHlJQohZOgNwvPkRLD1FC1qbx/qH6r1yh5HavjmtUhKqN42rRrkG8BQeFTGk//jRU hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uptrt6c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GMKP099799;
 Mon, 19 Jul 2021 06:28:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 39umawam46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpr2dT2keogzYsZxcE0kUiayYmgX7lEFZE1gDBNTk61hl5jBo1fex1vI9CLE2WnOAaH61wlIBkVplRLAvMtuEJKrRC86buuISJqtdL7SIXzh3oU8MoRAna+BhOmnuXjBQm0tQoSXqeI76Xjk3olas2K5IOASb0AfnmLhD7zfhhsODE7Oy1lEcjFt3G90596oYsCF9gk0U4+AOcQbLL4Gldgfu/9GC/wx2bbj/4kJ3iWYxKAAskj6X9bSjpZUpBk3HRnePRUKgK0Hf/Er+lMXpUzKMrJurfjvXr/0mnel0m0J4ho7gR2oFf/rGiuPQTE4VIdt3RYbsP9toeW/uXHaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKiTuGzWvSN5SkZe9+4oARYCgcVyj2tZdnAtp/n8nYY=;
 b=YzGi9yNwLl7rzqaASlG4616aO9JXSDD5qo9y9I7CLodo1hocx2eTqio8hdAM24QlxoLNLOcZln/AXtKF8FjCkx9Rp/xcSTVC4xDFygi05O1hfW/GO19z/xteuzEVYIyn2sXnNx9hHmlE0qGg7xjxDpf+wM37Hg9KvjA15phzhMRx0xVsSRAW409LkEGSjBIHaFAiXUv5LYf68Bmjae0PzbL4c4AfLc5gYMCcpkPnuEzN8jmnDqzNntsHguc8geH3Hv0bDb4cQukBVtHAt3JbffXzxxihlCVUSrW87dDd9hhJd+8xywwQk2kjP7hYC96579hqSrkaRYRIE/Lygql8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKiTuGzWvSN5SkZe9+4oARYCgcVyj2tZdnAtp/n8nYY=;
 b=f1C9e08FJw36FVZx6lmpXnWnpXsnmcxKzPVGFibDHeM/D0/2tK01oa89L36lQgnhL4tB2+9Cp00VctnNnrX92wKsep4qZ0O/aas0ZTy42Xr+ZoA/9CBtDSNbaNjft+ljhpH2SpR0+S81PZzaqoNlj+Sh2rlZy7L7NcZwNUxLUCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:11 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:11 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 14/19] vfio_user: setup MSI/X interrupts and PCI config
 operations
Date: Sun, 18 Jul 2021 23:27:53 -0700
Message-Id: <89ac29a87ee532702079075ab5aee58744f9216a.1626675354.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 19 Jul 2021 06:28:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2e4434-0143-4940-43ea-08d94a7e6180
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814E8A1ED1532F030DB65388CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgX8ryoe+kZ3j+kx4mdeP/uF8Im8a5ObfwARfBfXqZPN/xQBvbt6tWgmLTXISYwCPGZCJ2aOxmmJqmS3B0nKY8RuKMCr9cFN17y9ZIW3UYx5h0C1AriYBI/6xnYIRxLfaV5uI69dE/aMj0IucIXNfbxqGPVN3NmBnzuVGoKXeLVL9u4DHpawVv+42KsWu/eeM40u/2p0lYDdRv8GKUaHjkegamRpkSLgWq3j/G+BXQSL9A2LUgWVYZoTu7U5WVHyEtq7Rb7iOcV6B+h2HzXB+GlvqGEn/GzSX8D3lpLAAZuUjLczgyHgZcoVaDRBCis8E1DPat3529RrJOq++UUaas7krjQu1bQStwIIdQpPx3GTFbWunE5N3b4OeHSq1UZgkRptEwL4Kq7nfrh1D8pxulYj62MqM4tRkXgFxpfgRu19KiFAFSvS0Apzec4zDYl2WafebX6Drg54O/3ysNUJMB45zTw0GtNFAJePdDhPksNxHrXHtOSA13opd4mzceAqxCiU6H+22HPpnsBRkguNS+pD6+C/DbhbpmPgfx+dyIY2WbShJ7CnL60VjyhEQprs29s7aTtruwvakJ9Lqf2O4wXaUqVqmDmGPLfZjaWcX47XvfhOeNbLVZ+VzSir8pTT9cACeWxplVPJIzEEUYZhGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EVlrdfmhz8jjX7ET/6+BIxNUmbc1zxHs63mJT723SH997odq5gI6l4rXiDAp?=
 =?us-ascii?Q?4YJbI5VS4eecAA03gJtRRo7Yc1Y/Ai/H7wgJPf/D4SZh38yRIxJcUOgnnj7w?=
 =?us-ascii?Q?OUQE4MheAnp8Sm1D6EOKbOo3qZiInRHI2SacUmLcAnVfWqu1P6B6sFoDfMpj?=
 =?us-ascii?Q?d39WN1jgLRcoGk+RFHqWgdieBx6pkuR/beqQzdSvq/Xml0jMsM2+eh47fZWr?=
 =?us-ascii?Q?BoAWApAsPcuFwwaykhLSczDPMG581PJfAUs72pp8jh25nyb6aTV5ryXLPAVG?=
 =?us-ascii?Q?1vmXpxbA//MSix4LZRVQJVpup8lM5tjifQj4RFy9sba6eTGS84CsUxrJdt1h?=
 =?us-ascii?Q?1uZDdgs+BNBCEU7uEKIKu4b+aKlKcOWMREeD+bUr0y1bVzi5BZMJ6ui4I2Rj?=
 =?us-ascii?Q?bxkVDYns304SgcBO01XZ3biSwwybEuvHC4vK6rLOnTTEl4yQzSMXeMql6/oQ?=
 =?us-ascii?Q?f4Ll0M8R5rd4FjOp2DO9hM75URrmTIkpHQdWh2cy+RYqoqV6m1n2Ws0NoIoE?=
 =?us-ascii?Q?xgxgX3U2hGWp8g8V4Frsuf3b6dTOZ8oejPaeIq0AZisMvDg7MFStGzGNkW3K?=
 =?us-ascii?Q?v4SRn3XETvB9Np7fzUhDecX110lZ34QrPezoSG+2OO9JWDBSCd65MtTZvQ0v?=
 =?us-ascii?Q?dFVjbJxXYhlfyfnuU965lUDqXdh48vRmXnSi1nn+gFVmQAgpT+9UEFD7Ba53?=
 =?us-ascii?Q?ldViU+jaw9bw8jQo8ZSeDU/HXv1Q1RsB3mjzt45TP9FfhdXbPgV6oeCzUpDo?=
 =?us-ascii?Q?oRIOFOq+8YfYh9aLZWi+M9dzzeTC60VH8UUE11vPNOyiu48WKLP/KsSbqjRo?=
 =?us-ascii?Q?mLqjeF9WnpREEC3tePgWhps6MZBm8IA+EWoCwFUVpnYkoPX5Q9M6KlKfFOuz?=
 =?us-ascii?Q?b4GgelEC9Jqfbvblr0cxmDq0vDkAajQ7ehpJcWi10om4VWZaXczY00jb1LmJ?=
 =?us-ascii?Q?fVuU7sa6gRqK0FLpoonrW+aYrHiHhBl8bE3euVDx4vtSR+Gvt+72VI5F6i8L?=
 =?us-ascii?Q?l9KTECKxeLiF5N4+y6f0vGbJ62aV/dG+JucALpcb2teZNHBv32WL9f2g7YKO?=
 =?us-ascii?Q?oWGoWtSj+YHXxVNDe7za/qFZA3uK1Y9pSF3XTWrJ/FyeTIGZf6yuf3HQpr7X?=
 =?us-ascii?Q?LlWapIQ2W6HxeYKm1Xq/adK+a9D4IBot5W7UsbOgoZn6sxZy3i+o6XF47/ob?=
 =?us-ascii?Q?KAkp85nrPXirYVsI7r65TB0GE2xGwePsR1nWxqZOuk/4QX7g0S8KcNppwPi6?=
 =?us-ascii?Q?JDdPFv03xr//3UT0PxDfVVJOQ1QlCGmpk/U4UmJbQIRmLM2Jiej3PpNhrsEy?=
 =?us-ascii?Q?ccv4S9UodPDEfP65MdcddaXD7qt3gClUfYLna3v9PfUiYCnQ+h2SFpa8f/e7?=
 =?us-ascii?Q?fk0ngMuYQ+6LZ1I7JMM9kIH9QWPS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2e4434-0143-4940-43ea-08d94a7e6180
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:11.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAtFNQwZ3TttKcYIrUSDNdfAD9MVmD9ZGhWSteq6smpR/MheYV25mj7lBYJnFsIbw5Sa00oKPcykfksJ/9XLtxH9THThMVbwXH2Ez+zG3dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: Li6I39BQa4Et2PTxlr0Hpd-nHbvPW17W
X-Proofpoint-GUID: Li6I39BQa4Et2PTxlr0Hpd-nHbvPW17W
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Send VFIO_USER_DEVICE_SET_IRQS to setup interrup configuration.
vfio_pci_write_config/vfio_pci_read_config iforms the remote
server of PCI config space reads and writes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h   | 14 ++++++++
 hw/vfio/common.c | 26 ++++++++++++---
 hw/vfio/pci.c    | 71 ++++++++++++++++++++++++++++-----------
 hw/vfio/user.c   | 87 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index d08d94ed92..afb85952da 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -217,6 +217,19 @@ struct vfio_user_dma_rw {
     char data[];
 };
 
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+struct vfio_user_irq_set {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
@@ -240,4 +253,5 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                               int (*handler)(void *opaque, char *buf,
                                              VFIOUserFDs *fds),
                                              void *reqarg);
+int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 52a092e168..9b68416599 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -71,7 +71,11 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -84,7 +88,11 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -97,7 +105,11 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 static inline const char *action_to_str(int action)
@@ -178,8 +190,12 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_set_irqs(vbasedev, irq_set);
+    } else {
+        if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
+            ret = -errno;
+        }
     }
     g_free(irq_set);
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7042c178dd..3362e8f3f5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -403,7 +403,11 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    if (vdev->vbasedev.proxy != NULL) {
+        ret = vfio_user_set_irqs(&vdev->vbasedev, irq_set);
+    } else {
+        ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    }
 
     g_free(irq_set);
 
@@ -1123,8 +1127,14 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        if (vdev->vbasedev.proxy != NULL) {
+            ret = vfio_user_region_read(&vdev->vbasedev,
+                                        VFIO_PCI_CONFIG_REGION_INDEX,
+                                        addr, len, &phys_val);
+        } else {
+            ret = pread(vdev->vbasedev.fd, &phys_val, len,
+                        vdev->config_offset + addr);
+        }
         if (ret != len) {
             error_report("%s(%s, 0x%x, 0x%x) failed: %m",
                          __func__, vdev->vbasedev.name, addr, len);
@@ -1145,12 +1155,20 @@ void vfio_pci_write_config(PCIDevice *pdev,
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
+    if (vdev->vbasedev.proxy != NULL) {
+        ret = vfio_user_region_write(&vdev->vbasedev,
+                                     VFIO_PCI_CONFIG_REGION_INDEX,
+                                     addr, len, &val_le);
+    } else {
+        ret = pwrite(vdev->vbasedev.fd, &val_le, len,
+                     vdev->config_offset + addr);
+    }
+    if (ret != len) {
         error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
                      __func__, vdev->vbasedev.name, addr, val, len);
     }
@@ -1175,7 +1193,7 @@ void vfio_pci_write_config(PCIDevice *pdev,
                 vfio_update_msi(vdev);
             }
         }
-    } else if (pdev->cap_present & QEMU_PCI_CAP_MSIX &&
+  } else if (pdev->cap_present & QEMU_PCI_CAP_MSIX &&
         ranges_overlap(addr, len, pdev->msix_cap, MSIX_CAP_LENGTH)) {
         int is_enabled, was_enabled = msix_enabled(pdev);
 
@@ -1456,22 +1474,30 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
-    }
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&ctrl, vdev->pdev.config + pos + PCI_MSIX_FLAGS, sizeof(ctrl));
+        memcpy(&table, vdev->pdev.config + pos + PCI_MSIX_TABLE, sizeof(table));
+        memcpy(&pba, vdev->pdev.config + pos + PCI_MSIX_PBA, sizeof(pba));
+    } else {
+        if (pread(fd, &ctrl, sizeof(ctrl),
+                  vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
+            return;
+        }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
-    }
+        if (pread(fd, &table, sizeof(table),
+                  vdev->config_offset + pos +
+                  PCI_MSIX_TABLE) != sizeof(table)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
+            return;
+        }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+        if (pread(fd, &pba, sizeof(pba),
+                  vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
+            error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
+            return;
+        }
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -3530,6 +3556,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 
     vfio_bars_prepare(vdev);
 
+    vfio_msix_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
 
     return;
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 8bedbc19f3..6afbde8ba8 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -798,3 +798,90 @@ void vfio_user_set_reqhandler(VFIODevice *vbasedev,
                                    iothread_get_aio_context(vfio_user_iothread),
                                    vfio_user_recv, NULL, vbasedev);
 }
+
+static int irq_howmany(int *fdp, int cur, int max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1 && n < max_send_fds);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1 && n < max_send_fds);
+    }
+
+    return n;
+}
+
+int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq)
+{
+    g_autofree struct vfio_user_irq_set *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(vfio_user_hdr_t) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        send_fds = irq_howmany((int *)irq->data, sent_fds, nfds - sent_fds);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, arg_fds, 0);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
-- 
2.25.1


