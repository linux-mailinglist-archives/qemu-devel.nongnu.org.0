Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC9E48A335
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:52:57 +0100 (CET)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73X6-0007kF-Px
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mz-0004DX-Ht
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mx-0001pE-E1
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:29 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJm25J026247; 
 Mon, 10 Jan 2022 22:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=MQE9ffAldLj6CsUNMHpIZYzpFwQuooZ7bGIxeC8po3Z8hgAQh5oKvsbcwMc4jU9JKcL/
 nFXFli3bfvzkpotedKjs4+uT2B5yL9cE5qp2eWNwU8U0jbnSOGTAfxlVD6ueBuo5Xgv4
 0oNUJKDRxEcirmcSJSrZbpXFktnwN/8ADi6MGfg5EmxSYj2KtCeQW9PYvsta/WFOVkbl
 QjWPhgxRuZdZcqEzc4xNDuFkEDOYuxqK9HT6emGn8vD4yqPZThTTR4mU451+/Sk1WRs+
 4k2ondWUm7ccY2ssEem8MvWz3/QE2pFoFxBpG/8ciQUWNP8pkD4pUPU4FIc5sZ90F0uO WQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgp7nhcjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZaap009147;
 Mon, 10 Jan 2022 22:42:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by userp3020.oracle.com with ESMTP id 3df42kpj4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1nIKlsoFUX2pFQwg8ey8KTRjqdCiaL1/cSpS8UZlw7gLpdRZsIW8DhUcvJ08gkgi1fM3do9MicgCIyRpYus/kedHItyxi/zrBDQq/THn+fND3MX9oI5u1y9hJaJkuJJRIkLZ/N0+MnFm+7MjGkBYRnW4BomVwIHlT0g9E8jFXpv1IDXSmn9PrnhNOb/ua2wMmjsZSpUzxlgGcoyqL4S02bFRTa7jCvfPere0zfBZ8P8hDNfuLRuUx4L+cOFo80U3mT42fAGA2FJqijwKlzbTZg6dJC66NSLupynGPBEvG+X0DrM1SeAXaMEpT91EBzLNsWbGkpmHPsFa/31sECvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=fupyASw0AZni6J113xMPTLmwnMsxvIVyL6kgRlHLqqa3i3FoagmLavNTiYhh5CMUHuFslyv8qyFe2FheTe7JbafMNDmGZsVp07zOTWejBsWOhcqjbA2nxB2m1R/UEgGIusKamby6LxQ+bOZpmuRFOdmcAFHDrICmEGuiQ5Hbd3tyFuU6u6qGtmw4skPavndiJW+eOWiVljh6ufvIi9dHdD/46O4bDN8sVzKWqxJq34ikimkOfL/BxhvXhao+hfioHLIduay19DCi+EqQVWrpsWAvqtB1FpYDPR3s6I7jml+bbIud6ARd5GbUf/Tlgh8WQcpsd2Yqh9EK9pVX+pZPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=JTBhJflKT7lkp9/fZ8XdwC+eKHmrqj0BV8JnEPHwjVd/ElfHCi5fRa2/5B6fLaWhc/5fvKtI9Y9an8ZSZMnzcvRRshAJ9Z2wXHDbuGU7hVZSLHlhI53qcsnpzoWNMXjfl31N/pyYR8W2ypg3k88eYCkrC24l4Vr4LTQVDzenGK4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:19 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 1/9] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Mon, 10 Jan 2022 17:41:56 -0500
Message-Id: <1641854524-11009-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc6dfe8-52ed-49a4-00c9-08d9d48a7568
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB159850F680D23D365AB48D1997509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZRJIVcyliSZE1gUkOFR0cGRbj+jhbYo/czQ9Fx+/Sil6UNsm0H2gmxG21W9GTJmBEl7qQMu9Z8ZO8OroZN70e0Gc8Hj1/AtITbyJGVWfcI0ms1JC3hUdMxnNfkFY6vvP2WFrdWbNW6UGvVZW4JNNhaYc3QHB6TGjDS+Iu0/JFjIg0aBQslNuQs4OOi8BjwXWYbum/F3+dl8c7IimS6Rjyyr7jdbLmpbAtrWaERAGBeLRRrj4PlibMaJO4xUWyJl1YLTDE5GudHVSL0LsC0C/ItmskPNxQJ6uTQUxGtJWqbn0w1fSwUYho/Sm5r41FVh3hNG1ORdoGsN/IwuDlApNFNUX3x5C9ZqqAAVEuQ2rSbhGZG2FT4UsEtUj93On+ens7xgw/SVbV82UYZIrurfo+2kG3yewc752nPpcJGJFXc9W7jSWBRl7pdoJwoSR9JuBw70tqCxU3opVmjdkqtrh1LqHfbFDefT5Bcl3E3CAgt5EIsYNWIJP2GPm45N1u8roqReTujr552aAt2ZCk2FMIJR3pyh2/8oj3/fIf4xCfsBFZ1GeHHZz+ZgzFBIlM1xv4NrLrDckHoRgFtbUgmslwyoP1m+ziofQgsj/oDVX0JrXcThW+BedVM77O5RuLZbVaqQ53OkylNmyQ++ZQqx0pIJbHkZSy7s1oCGz+sPFAbbQ2uZqOqwkS2jyu+MVITnQCTcwGmqcTnBRDcoA5Gktg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4326008)(2616005)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+2P06fgb+kFLi5qvGFnYBTNRgLZgj48aiVfk9m9qgm8zFVxVXoJrq/EgdeCk?=
 =?us-ascii?Q?WmR2UvD3kFFG0ABxvAr65BOvrnd5mPFy3TD7g6CEhklN3osYvNBRUthq5FXv?=
 =?us-ascii?Q?TulMmn2+y/lid+smRuQjdZO/srzQR5TXP1x/BeMoqG0grTYNBMhs8fxcft5q?=
 =?us-ascii?Q?z+wPkUykCUoQJajBIOp0KbHBh7VGEiVxoDi33WQaxMYgm7v51czTcLgqaqYW?=
 =?us-ascii?Q?FNilFL996KyZYsyHuAqtRR0lhdM9RUBjLw3ks06fUJpGBy+AK7fnEWSCpNSJ?=
 =?us-ascii?Q?T4qUSxGidpClxCdzKD/abSX8Bs+RKjZlKMcesj2aSFKbOQlfG55hNZ8bYQdR?=
 =?us-ascii?Q?0/vr3jvDmCvHHitODJlfyAHbqB173bg+cBJoGR55IIBmnIz/XogywpfM2Gkc?=
 =?us-ascii?Q?0udPIRWVi2LvqTS2f1c7OVI5hhD6K3y5htu3nY2TSjhjfAN/ETJC8HZuNKFa?=
 =?us-ascii?Q?gPho4jZYe+3bULKRzShmoF8i8gZZu/dTAy+xgZineoPx5qx0cZoy2kVOthXC?=
 =?us-ascii?Q?Ji+bQ6pJVD2z1UmKuRrQwS0mTPLtbNjBla21sYvUm0Dl/cYLARBIzrmZRZDh?=
 =?us-ascii?Q?kmIYUJCGoLyNHg5sUgmvA4EBBvijPc1YAC+/vuuyUqLT+EJtIb15rcE1en++?=
 =?us-ascii?Q?XjVzSab/h1/UKmXdT8yENZegl7+AWtvpOuUjRUtEsQ0JooFHfQqmb3Zf7KVd?=
 =?us-ascii?Q?DqUG32pV1lVV19+kgfkSF4iHnLmEAKPp8iOQitLd1HoK6MGsYEwEE+6l+Tas?=
 =?us-ascii?Q?xvu1frBSI5QVDAGQGai5PIUvX3ZxzwpbKFFx7HHulzBeE7Gj2jjRt7bJvC08?=
 =?us-ascii?Q?j5gNbO/hsyGL4MO252uV0J9Wa+pRJRakunJ65cjpv3oZgGSuRIss/jpi4xj9?=
 =?us-ascii?Q?yQv3D3elcbmi0qv0sgshD2OeMBJt9Y/zSGgG2CAN7KYgecVM0k4aExFxcnYO?=
 =?us-ascii?Q?IyV49SCEYqIIdj58UM8ZC1qOyVNadO4wbUG9HJlbtlHiTgnbC7excLwdyfvT?=
 =?us-ascii?Q?KbDDCbSMxF5U0ZVYtn+EUDzKTtckT84tYvIuWGLak59XqGW5uAX+DSxjhkMF?=
 =?us-ascii?Q?smQ1BNn+yv+SBYXLLeAttM9o7jJVLK0GqU98h6GlN0NhK+ypG9R7T+bJzkuJ?=
 =?us-ascii?Q?9ks1g8XrtXyYi/hhQknQVvh5p7JhHROHvu2O8tM/EW8aqW2aG3U1jMl4jhph?=
 =?us-ascii?Q?OMqT4tuv01zEoWVkqr7jpUXPJ97AFPB9QE1fcBMYIpGhCGn19+g3fDIjJ02E?=
 =?us-ascii?Q?CtvYGqxNaheNwhU+cOlPEuUspFQj8dmf1JDidobCFOuHirGbIMCRNwGhQ8dr?=
 =?us-ascii?Q?YUkbp1lljYM/L0qVPlCfgeVjcK9YEX4n03ov40nE+Xz4U7Ltvt+VPMuXl6mK?=
 =?us-ascii?Q?+/HJuHGVCzgq3NM10i+Qox86j5PIlpmgVyVWQKHhQ2HLbjUiIgDqtshPWtuR?=
 =?us-ascii?Q?gt+zsC29jtSkd+RylC2W8QpQmdJeZqPY9oj+CYVmemmpa6+b8ev+KzYZoif1?=
 =?us-ascii?Q?BFxbU95HXsBgSfuDhfCEBJSemWd3fJUIVP3yWZLbcxk4rBMPKLTHiqTN2FKb?=
 =?us-ascii?Q?0KMpN47qaAGx/lmu2oIBjT4pv4RxcFnprnRSFzpJPvgLwoteUrXUrmDCvGLM?=
 =?us-ascii?Q?LJL9Ea+aywcvfU/kaUL9r46vTU8gs6mCVhiNvOnedVbf8wq8qRmwbgHlA4yc?=
 =?us-ascii?Q?PwzzEw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc6dfe8-52ed-49a4-00c9-08d9d48a7568
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:19.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBrbJSxqWCB+esTfg4fq16YNHJ78jTOBFqijLMl+vSxURa5bpcQbFVdlaN+zaNvdlA0LkuP91KTq5udH/Cbh7eJdVkT8BSRCz4jfxO6/mlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: 5_4aYSY45A4Yhgu-LFzt5diVR6ec-NpB
X-Proofpoint-ORIG-GUID: 5_4aYSY45A4Yhgu-LFzt5diVR6ec-NpB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..603db07 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


