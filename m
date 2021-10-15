Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EF42FBB6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:09:54 +0200 (CEST)
Received: from localhost ([::1]:41792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSaX-0003nF-Lo
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUV-0003uL-Bz
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUR-0007h8-DJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIgHi1024951; 
 Fri, 15 Oct 2021 19:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=YAds516/q87hcNcdCwpORYCSGHgFFpt6wTupTBgtmA2wNjG9bLFUO2gOp2zSNWMZjW4d
 OafyUgxbtNjKsl1B15ZtyDGa3+ZxX3HTXg4jIRxw3Q7tm3jTEC+gA42e26nqFXxTFoVc
 aHzjM2X0ZQOSzQniKCjhBZ554JKSA8FWkMGpXO6PjJFLFzE/x0X01e/HHxOWsflitg1i
 Xfj9HCb2RDmd+rrmUHHuV394Kkhd9MiIuXZFE9P/PJI+dKrEPrT7yRyQx7MnL4CUGfH+
 Q72KyB6VyiJTs34Q6Mbhl4Irrdzieq6PVylxBwWVTIE1hPclWVqT9/sAESv5tuw0Y9E9 1A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgfseqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0tso180973;
 Fri, 15 Oct 2021 19:03:27 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by aserp3020.oracle.com with ESMTP id 3bmae4nd20-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU1LH/bsYCGTJYkOh2gbAcGbvq6/JJyGacfT+Ca0HrIHb9M3SPqdZYnBx1SC3nj4Q5htY2QIiXAWDwE+I83US2pQ3MlO3/Le8UPiHGEnbSHA4xJpKXeJq7XZij+39yyemW6XBXyUJNm9nDkGRReoQXP+k0XzeA28Gf9a7rCWdcXkup4ivgC7wxJ9yIclmuiCf09tmzIC94vB5siuRQX3Yz7hNniWnbp0ZWOeOFFUaePNEnCqAOAFW58cavewqz5RqwKxo6dDYgvv4vVNrAqpLUmLyrPnD7Y5hkbqBtT3rXirN6Oll7MBaQfTETQVk29XOZDAS98475DAdAiZVcxe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=LWkCJNJ8ZJ6vMq5yd9fQXrkTZaa9+Ty4wGw2x+96LKfApTZ+DaMxre/2rI9knlirmMJJFYldsB7hLPDLWLTIqJ2GnkQRSBeJpu4Ju+KHfxEC4Z78zGug8fsDd4Ty7Wn2jhcoRQMmDeOX2J1Eg5kAgPPvUMy3KnQF0bhLV5YyZoV8DBG7qDldnwPrAEBV2JTpEL06ZuccGY9z8/45DtlM3MKKv/xp3GnRa8s5snuhJJHd0DupbxOhTO5lHLIfj57Da+8GZ+Rn7qZfzWpjMeVsG8HYO3g4LIb+ufpxocShjAps5e9c6EGNa4vg35HKFXt6GgFc66IqGuh4g9ZeV5EsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=t6cMg1kKigiTv2ifdFxRCamEmDguCferVtuyTCmf1/b0kUQL94tsSBpPcZ92Tenxohl+1k4OwBXuI3Zp5neHelKtzbS/RcKP8jy/bLEm/TN+tzmjrVAxAI11NyUT8ZzcrUW8zI/3+IAYM12woRolXyvbK6VY5cls+AO5e5vm3oQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Fri, 15 Oct 2021 15:02:51 -0400
Message-Id: <1634324580-27120-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 851028dd-84ab-41d9-7873-08d9900e77dd
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB544139A2F4A749B8C82AEA1897B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Zmvx+yMuwskMTpOe2up6YQlFsjRXrqpZ4onXMvyOztwK8iRHAp9dbCpu8Lfl3SxUmFJEITykVSj5DBrBfrMEMePKNQshGe6KCG0mZCkK9HQfADnzfC9jVqUSi40IRKF7TspFC239l4hhIYIfRSyLAKK9zk05XzCqSfLJ3XOXf33qvNw9p9UAOaStDR65QLxf6yyeBL3AKAt/hUJ0Eev3G0vHzp7dD8Ps0yCDfQJmSn253eYPTJBQgTfQ2f1q5gV+g+5rgYlSWzQYuI3wACrTrQLEfB8rDcMm6IvH2uMtYEH/HYhbz5ADsw5o3HpODfWjXdUsvmDZaKWAtKX5BBN/tTFHVUDGuk39myR9V7H2Y47bKS1+urXd1hZqwqFhnwhwOW9MQqkM7IWlbOikSg/RhAWQL0zUsKYM9dQj6FqciIR/mZ3GDmqrNSxGeJGLTWVa2JjsOAlE9lNT5K9p2UtstnB33voSXSIlZwAkS6Od78Sbqkh5v7iqDSSlhS3I1CVCfHpgthpNTqlZonZmx/P7uIttn7NUWsPkix9OkCA+2CT+cfOsETwP74BU7+/rx2A/uaY4krkyX+2EOwQMvKgPuf+aeS+jVv+/1qGZdJzHjHwITyaVqhf6UMkX+biPGzj1V3Ryf5e6BcPRWL9WQh1guxvbWdkJzlLUsG5TjCo4m+apIvJ0P2CsQl+KOUePsfiJK9cdqiN5+y8EWaV947HDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dFzNkt3zpdVzeQl/sT2vBqbMpkIkVDndkTKGrzPGWPQJ2/SsYKTrt1cylLl+?=
 =?us-ascii?Q?oEznFnBfwN67qsP9aOIZ4/Zx+eUaCsd4Mn24i5C8DdUOCKtbMPmCyC/Unszm?=
 =?us-ascii?Q?EQS3vCol6cCG47enmGvBZXwpKitro+yLGvg8py2daMOiJE1bhNUDfvLWBCM2?=
 =?us-ascii?Q?AnSyL1DNzRVHcQJtku2KFKVJ9VBOALm+nDU3npmsfo8gbZoAQb8K2CTvJIRC?=
 =?us-ascii?Q?ETcipD9SDj9gLHNV7CO3DS+iA1ZVyAsbB3Hq2vpfdQPK7De4fCOd5q9jGhT0?=
 =?us-ascii?Q?tGGdQ0yOX8+kNaq+40XS3ngf96/cEerr+5TUQ9ouXFcQIGE130eLqrn11JrO?=
 =?us-ascii?Q?6AlWw4qgEah0W1EHP3txe2uXKeFEiEEUCm+ZzBcOgBQKrhvzV1ep5i0S9uMl?=
 =?us-ascii?Q?vQQCREMwGCMNkNfbd7SVJsEJHggARH6mgODl/RWJ3EtrYCbDk7gZ6qFxxGPD?=
 =?us-ascii?Q?I/a8N1Dt8PqFPfglzvxCVqTdIHclay5UAhGvXhHZpDoumzLt8gmnu/JHQjYd?=
 =?us-ascii?Q?gnyyGs6n11kaAbiQnxwJ8sBJDt5ecRkMnM9z5AfJDxqt3S3TVOZam1L/mFrt?=
 =?us-ascii?Q?K3AXbVBPX6jzh5pyznGj0P7+Y/xLnNEgmXO7Q7fhx77N6pydJIoKHAw6RKYl?=
 =?us-ascii?Q?YXa3abHDfP203PRBUsHxOlSFMAnP0rmxbnnOzetfDAUO35pDIAAXDSLjCPAy?=
 =?us-ascii?Q?AZbxJx6ACrA1rWJRw9IZT63OchiiND9HmdHy3YI+iv/N04x0PBkbF91fT5Le?=
 =?us-ascii?Q?UK5aWeqvfBD1vG/mzApqAdSfmXkom/89rycO0Gvpeo4doGvBiq7JZPqJYmfn?=
 =?us-ascii?Q?brOZgQ9YpqHn+eLQz1XGW29GvFQhnAm+KRJsseHjXFacq+70LMtqjAGGywb8?=
 =?us-ascii?Q?21RdLv6egYwUViC1wvLC51Dz4hrD9BBsE2AuF9h9NKR5DrnBeCnh7E4QHMc1?=
 =?us-ascii?Q?PGq43AW9MT8OMCodFDWGYjcSl9OCC37gQTHgjPR9GaFjbaUkvOdAOCTCnCr2?=
 =?us-ascii?Q?W/tWHIp/ElW3d23CQlcfJKZyGQDUMQ3R41lQvgzWfDPSb0UI4B0I6iYPaaK/?=
 =?us-ascii?Q?SvgRDpLXI29hjJ0cw3mt0Q5N4ytJ0D6PfokrMYpFuosgfNSdMQ4EeKCVzCNo?=
 =?us-ascii?Q?JBt4IDMWcZz2kAx/TeorAAbw8lMD2Wh5OwLwff1sr1eiRwls0k9SRHeRM+zQ?=
 =?us-ascii?Q?itNsKG1k1vqt3tcNvPKpeA6DdRoN4DyhV0jIW8YYiWhxsJPf/UPB3k3hPHQd?=
 =?us-ascii?Q?E3Hi8WoVsRv/cXTOa9qrPRfa1kie0Gvt9hcGxbpxu8T7qVVDtlE/cyCLGs/s?=
 =?us-ascii?Q?P8yawRT8rkwlfY10l4Vr4AHk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851028dd-84ab-41d9-7873-08d9900e77dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:26.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc7tUxXmnsMtBeAgWLQsABCgIehB1FYxQ0qA+JB0xWTJtSf3Ptl8YHK7hpIPMhpKknVw7UZ6gwmO8wZzycK4ygMocPaxPlJPvt0TtYc2PAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150116
X-Proofpoint-ORIG-GUID: 0ZD75m9-BGTI5txXFhJfbjLhuKTWfr0e
X-Proofpoint-GUID: 0ZD75m9-BGTI5txXFhJfbjLhuKTWfr0e
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..c06241a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


