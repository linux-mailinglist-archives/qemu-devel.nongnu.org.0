Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9454259A0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:38:22 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXLZ-00058i-Gx
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz3-0001iT-6B
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz1-0001Xa-B5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:04 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4pHI020991; 
 Thu, 7 Oct 2021 17:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=reLi2kXLXhRbKnWjAw/IvNQkKGM3EQgtkigu+BAB4qs=;
 b=JIjx7nKDmmDwQZ/7hN+WM4tTsO+xyjrfaMpa+eQJpk70Pn64kXN62SgyPrZggDs929y0
 7eSl+xGmoUL6GLSzxeqD+2oKbcehrtavp+aBsMJiqsqTunhqvzQ5g8zxI8jv7ictrqO3
 +sQEyiv7NO/+F/az+1Kq/DRFvkOf5Dgc4gXySilyRhR9PBK6DGiXTavPkL3VNZdpPN+r
 trsqaYskAo4EE38KK1z4Q+R44g++/BO7EGDUB8I9XsBEXf8KyhD+VYPfDLxcR3H3904e
 yN6iTqZ38zOwBPrU0ymLLzOZ3jfMxJi9QIPEtmVyzxUPgrjg08N1YkQwXuTXTbLjGW+7 pg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhwfdkc5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAS8R072649;
 Thu, 7 Oct 2021 17:14:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3020.oracle.com with ESMTP id 3bev91a107-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlbdznhQXLXmgH/SYxRiUmp+pwB3btG2Jo7F/cpP8FGaoGiHTY5L+j7jvPD8PzfalSwbHETqBxCAm6Sa1NMP7L4+oWLi224FGOQ6Pd2MXMtiOOfpxF5Qsbt6dPgV3YJbgeKFopZoYVC6hcwowjT+pMmfXZE7DCUhJbYA+B7i7bdZi4oRWirbIpMF4uJ6lbqJsBJ9LKooPnW+700OOgYDzvzSVhmcptQbhQACLx0PUMGmrAJ9LBuTbzOb4UFLRQ7xAcB0nuKRq2/sPlth0fND8siV4y1lKfKL72qCqkf7q4t+ytxTCK9p6bZuiDzgydCsew0j0+YuAIkDaohBTZJRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reLi2kXLXhRbKnWjAw/IvNQkKGM3EQgtkigu+BAB4qs=;
 b=ndX1+Fg3Ra/FkmOXao7hA9aEP8zaDjfINCp4IMvue/tSLwSW/YADdz9ezVUg+HUp5oa4xALVYaZnMo9jXGr18nw6Lhpvoe2nlD6jJ89jNts3fuXKsJET7ELYWLkeUAUrMvpRQmj7y3749td6VOVl7LaBAfsoSL1O8I8Xv7Q3ngttm/V0ePESs48I1hyUG6usTvNRaEn4qqMi77ZDoicQQYlc/mS8n2b8EkV3mswqiBoe+s4tIP0GqXxPT1RqVFmJa8/qXSNvY57kwMe8l9aE6qJ7bg8zk2Gmcrf9JZT6xDpFbKidUUqnD0aID4zDW4dqbBuPYXWz9wRAVJdutDDZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reLi2kXLXhRbKnWjAw/IvNQkKGM3EQgtkigu+BAB4qs=;
 b=Lbh6METr56/cTSkyMwniOL8mYG0ZumkXGgKWCvXWMr71eZNvmnHwjEf9DXObmWKlf2EY1nWWF8HW2BvFFYOxTkHAd8msTsgygUimZXloV0Fx/glK5Bpm14qpKuyh040XnK76M+SVWyUXP5mPd0FUtp/BBF1Pwdp1MChfSlgOQxg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:14:55 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:14:55 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/10] ACPI ERST: PCI device_id for ERST
Date: Thu,  7 Oct 2021 13:14:28 -0400
Message-Id: <1633626876-12115-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:14:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a714b004-e73c-4bf3-0056-08d989b5fb6e
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB55243538F9055BBBE1CBCD7597B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhLH8IpZ7jSAWR4VJ5KD9jgqVLCCQo6yVIrjt/js38sX6lWfrVoBD1RqUksaWwvlPmeSufCR5AtByWOmx4c8G8PBRlNvR1D5UB7hIHLBeIBBzUXnv53gUGbtg1QILSDIwvbMvL2XOu9qH7AQ4J7rO7wwWveHMAEq2UgovhD1z3rNdjpBrHuDFETCtG0/v9dpQhebGOWto8hmbvvg4iSsZxuTQu9O0qi87xBRyvEgxMb/GfX5cU3+w7uMDX0epDdCVG0YA4QF3oraihIPsCSJmpKhAq7iJRH+aAuu9Ud8WX4Q1MBbpt1/qKLNghyVKl7pDzlOUOkTVY+e3r0qoPeBHtE9O4vAK9Q5cCpVXYcAbwI4QWz7uqLzf/qvdf4z7khralyvLfSCQiY6x2eQY2AcCggAyF/iM9qRv+dgaivLjJ9bUtMLA1AP8ePG3TIq7ScP8EmbcSgScmV2H5LW46RBINUhmMLj9g8La8KMZF2pOkNThgCQJolL3W8IQpi2pNHC4tetBNtPnM/zGuoaGP86N589p239510Pgj+WBGa5UgbawDyQwbDjUCVBberHdkHS2sosx6Q2kEJ8iCfuOolSmt0x9UpWkYvvDS5nfSiDzRoTYmHF5b5SwWz4x4jqqiL9rc3POsWtueozcvrCOAGxVaaSqAz6Cq726nz32mTJVXqyAglE494h/Y/wJuuuFzUFjH1EUgi2JAUbHqFLzAeG3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(4744005)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6ElOi0jnXI/BJOe5KbLiKWGACSILkmELvh3kwObFaHAL+s8P4Re3uQIIJzs?=
 =?us-ascii?Q?XSHFZtjqi1iLMW7OJwdIEC36SM7y5BbeU8bJ0Atw5venvHyJsqvGUerR0ZBa?=
 =?us-ascii?Q?BNiM0PFJehsRYrJdBGufZwYQB97bMGr1kgJ0k5qqg/axxT5Vd+J4nRg7ROOj?=
 =?us-ascii?Q?32L8Cki5SJminaomQwoDC4dPimBSlreGNO4OhIvPBxAsSEPUTD8dXnOe8fCy?=
 =?us-ascii?Q?sbbQNmyb3SwKkwQAU/092O0cfvE9j6A1NT+S8LgZw3Dlt/r7y/kvFacjuRqe?=
 =?us-ascii?Q?Q0LogD9Bo017VVxwlSj4fD4lkr+S5ap/NrphimHVNDwy0aqlA588ykeaV2y8?=
 =?us-ascii?Q?GlXKI4JK5jz/2OBpRY543ZV5+y9WN1u2WyBU5TndT0VpJ/G4WFhfxfTPId32?=
 =?us-ascii?Q?RaRSJ/7/rAU3WjY3X9m0qHk9mLmyax2HeHQ6L9iXlbS2rmSHuv681nVdrqEu?=
 =?us-ascii?Q?TOCvgRjCe95kqWJvIaZo/vKgrYrwNNlR2RkxheTDYh6IHqsG0m0504iTUU9q?=
 =?us-ascii?Q?1zy+l9iDymoQ1s3XePRWCesOdnqOBxB8PfP84qmWnNEC+z1+oot8fhsBfHwv?=
 =?us-ascii?Q?T1hCMSxk0ZONYVZJLvXvkkCxa6dlOSf7YYggf5byVDLG2u902jlT0gUUdubq?=
 =?us-ascii?Q?D2iPAAPBMhh/c558NA40XAqo25tG6BNqODK2lEx2rmojFPGNz6JnuY1lHyLH?=
 =?us-ascii?Q?m6JgyIykXQa7Vt8vLorzRQgkBL2JxBKT5quux0vaFRUbn+nc8qlXusABdgMv?=
 =?us-ascii?Q?C0QFW+1iEqccrBAiiJFtSGmf6lOAmlqAl9t+pbeWlyjBm0qtCWfEuqfJcN91?=
 =?us-ascii?Q?albg2uKRTh8kUB1a1M/Cz6cC98p3Qz5ZnEJ20+oQjkWUK+3iomqrR2q7VlLL?=
 =?us-ascii?Q?XaIYVbEbfJIM6U/X2B5wdbOMbTCwpuk4HC+B9RrFNYYbRnMeMUpn+GT5vkLj?=
 =?us-ascii?Q?CfEQ8lyEJVo8JXd5qZ5Vx976Zb3O+9bs6qP7Yk+a717UjjCPUgLBtVmaMAJ8?=
 =?us-ascii?Q?zophl5touH/N8LriWIrrD6SXgmREVUHTu0gjdymowsuXYBb/VZ3mRdbnTfKC?=
 =?us-ascii?Q?Wm2sEFo2ZlvEOwxS31BQ/ayJPCouYuJZRcNdg8hZ2xRFSJ59ZsA8IrS0jr8b?=
 =?us-ascii?Q?XwjafpY8K54zcqu28EhXgWFKhEvh0ngHIco/vUfLH8YpJbnLX5UQaVwdXjlb?=
 =?us-ascii?Q?ieBJ+8tLH95SosLsb90+J2BhndwD9ABFwmH3ecL8wIs70bEguTHxjuwSqJLt?=
 =?us-ascii?Q?Z9hMcGBD4xn2Gk6+PZ2S79uEUpR5TLNsucTeQsdFZ/wo+nDgAUoOMiqAWBuH?=
 =?us-ascii?Q?OY2SNa8ml6e8Ud8/hClB4ID3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a714b004-e73c-4bf3-0056-08d989b5fb6e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:14:55.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h40umOrsGoks/ZlPaMPQ0B32kS4kveIx7xDQo07kpswbJp1ebiXn5lKOQmn3VMeNJgF3LFR3ZveIN++LHKVMOVz2BkVA9glnQkIQkIulf7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-ORIG-GUID: dweQHbY4Cm5UFTitmbecVkStGNjSH36p
X-Proofpoint-GUID: dweQHbY4Cm5UFTitmbecVkStGNjSH36p
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change reserves the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266..58101d8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
+#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


