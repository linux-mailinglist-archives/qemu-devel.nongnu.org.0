Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791247B275
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:00:19 +0100 (CET)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMxO-0005u5-Jc
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:00:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKiI-0003Jd-Fr
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzKiE-0006Ei-Qy
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:34 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9PFJu023545; 
 Mon, 20 Dec 2021 09:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wlXJpbV1Zyw8VJoTlPhKfxJeRhRuDNEMmk+m10nN+FU=;
 b=vW0KGOmBj8WHf6x7asNs0mTQSSaLytiRvPTqfxEydxacwKKGOWkT3xkg+ltn33xyQlWC
 74Va6M+iVFsow5UXYD0FP5Xl89DIn6RJUpXLWF6bPSh0OEg7IJaRh70aOefxbz01CX01
 OmBED0KwUiHmXyCkwGdrOJ+QWwibvoJvJI06ptBxA09jqh1YjoxLDs4CNWtunQCSXtwp
 TQkf30OhAa6Kz/PyNNvuIdAPIuTu6EPrmLUX56MCk9PwRoNwizoVjMTZlDb6Ti3l2bKQ
 S7t+HaYpkEtCSc7M+Tk8WjRcp4Y5ezZrfpwyWC7OHJQ656GiDOYRLHZD0C3QKNguQ0ZF vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2q6eg0u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BK9UIPX055954;
 Mon, 20 Dec 2021 09:34:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3d193kdpws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 09:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oL8TTIQeh27kDIzKm/KdFvtqbOp7js/7qcPFTvaH+IqER36ZQTpZ3CyKShkHCkMkMHPEcHMcNySGgrfJLYT0bw4QnnE3a4kXkV1tFac+raDiii031a/nHzpupeKxwKJzqRj+qJ3yFTrqZl+KzC/8SGGDEl9+9WmXKmPMBlpoWoHfz72KTdtFdn9E5Y/sdfozYZFDWJ2kgnEImzaGyCHoV9sWfFazVdQg7hLyHftXGhkOW2yybnDMKZGPhBr5AFwL+OXsls1x0w/ukuvu2w7DEhFEH92evdEheaBkBUcWTtGz+eh0FA4IPea4XI5f2gPdNG1vR6+LjiL67TleBatjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlXJpbV1Zyw8VJoTlPhKfxJeRhRuDNEMmk+m10nN+FU=;
 b=PMo3Q+R7yOXYcguQTJCWylCLfh8Hp/H6sNEmr3JTlnILt10xTEZ9RlRt50rUvc1+jy4vF2wp7UNdmGRAj2XRqGUaFXInWLRO9G4Pvpcns2EDdvrXZhRtjNPtRBsj1XfY44dp5SQYEJ6wwFqoPkvi/6ULle6qdgT5mJpckJetZA7hkKP2MWD5Pto8U0Dhj52RWnPgS3ZSeS2o/SOyr0nzfznjyhm6VMJMuw2biB9UFAEvDwoS8zwXBKzrtzypC0nQrJnw3yqxGM7WRgbdvv8NSvomqvwHN6qxhmQR3FkwLwTbtpWmajb4PHhZafeI8PEj+s8csm0NyVJ13/IMapAXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlXJpbV1Zyw8VJoTlPhKfxJeRhRuDNEMmk+m10nN+FU=;
 b=EbqAJfdtkrdiwW53D3fJKWR8FV6bymyzZBEVHWQzwUiSET4WS8U9DZJbUHHJZafk0DyCLFSlMQ4STI2CKV5hTprVLpOapDtsi0xY86FRpDlMyOOZgTZAs9qOZjs/aFCvGew+xGoEpTR7iFOE+qUtG1xzZ2plPLWy1dQCw69lGp4=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 09:34:20 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 09:34:20 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Mon, 20 Dec 2021 09:34:11 +0000
Message-Id: <20211220093413.1383190-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0add7b49-6c0e-4cc1-6c9f-08d9c39be639
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB518448ABF157AD6363960B5D887B9@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1QUtO3w1aTVex16GjU7f9ESxlHrew4WgOkx0zzZRH3VpZdk1z7hJuFA8/NxbxgwdzasoAa7GBLYiAK90sndprw5g15vifLhcORtPrQ+kfFX8M/ZeRnNuWzB9AQ08k0Mw98ftub39gfvyicMk2bmVhWkJ+kmq0CxOVxZPf6NzNedv9XV4WwqJk2N8j+y3g8Fde6fY1xFYqsQj1V5qa2Kos14ihtf61HVkgT651TINRXFIKXqz+vX0+bm63mig6n4coOp3lYrt1JCEB2zXZyeMf4PDU4HB7j9fCbfsdzCrO3FrB4Q2yqR12SdBI3NEz8diPWzYt1LEm7Zvw+1gJ4ymLAjXSDZL3wZGhAUsoWdJBkqeC/3GpTlKL6SK4tAgAtYV8+m5ry/fqJo7vblGQPViV0/WWLO9GkaHazkfe6JAtIOzXKxZFQKI91oek+zQF1VaN2g5ZMUJlJxvL/1ZROXhx1ZmnppLHWuYsms0EsYDxPXRHf+04zuIHGdEVAWaFvhdA4d4xPBGwn3q7FUAObZ57SLqUvuGK2DhO3x0xx1lhV7VtbHDM8mSgf3byb6nfdSnaqTuHucMJGKE28M4ZVj60SIhcJLRbDQVT0LCFHf4CJrrfkvOJBwtfMJvQc09UuuVgXdIboNT+EJDwyzChFN2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(36756003)(1076003)(66476007)(66946007)(6512007)(66556008)(38100700002)(6916009)(52116002)(508600001)(5660300002)(54906003)(4326008)(4744005)(186003)(107886003)(316002)(86362001)(6506007)(8676002)(2616005)(44832011)(6666004)(8936002)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jDkdVodunuYDkSsla17mGq9iiGLhlarCNG7s4KagfQaFBmYttfO6BiuNjmCZ?=
 =?us-ascii?Q?BmzqM7Om0PdjtpmfYVApk6x68gEHvAkwuKFLhv+4hpoTeenDIuKWzEaqUyva?=
 =?us-ascii?Q?E4d2cfX0R5QemJcIcxCKFJOqszVpDGQ5CxEjgvkTK3p3swQnPhFwntw7FrWV?=
 =?us-ascii?Q?/NZYJvO7I9hS17w0MpRW+qBXfJjB7UJani8r+NTryAUs7IbfxtFs4kZBZcqw?=
 =?us-ascii?Q?Uje29I444u7E3jMXw2mKBBTmForigpUs2jboWkrzRE/xW3ogib+xOgFFHNzB?=
 =?us-ascii?Q?ETzyg/YIgKyhcWHnxk3LZAFGxVHX5fhNdd2IQ1mdlfvXmL77VrCiaM+B6VP5?=
 =?us-ascii?Q?LnyCl+8S2+2yEsTDvSXNMILajVDiygiVC5NcrtlovclvS66XSqtDjw2rMe5t?=
 =?us-ascii?Q?hDEajWx4h3D3r4druiJg690UZHMh67bBfYTcIFjcNiavQlr0/E2L/FxfUolR?=
 =?us-ascii?Q?2KrCkTmiwsyIxSsSh6iuhLfsSKj71D8MnyvuKhw5pZ6nIyE5ItEKIEZ8CxtZ?=
 =?us-ascii?Q?yTt9UbH1o+okCRpsfbByEHL9O4YhG2tkHQvyKj9zlyjUFkAKtsVwshF6ErUf?=
 =?us-ascii?Q?PWT6HRUVwhBfxyj7mc+noNNJbxhYMRMPCp8qg1S231aTW5UirGmwc/9gZhq7?=
 =?us-ascii?Q?pp9Qr1CKsolvw8ISUp2Xh5GNdSDSgbuWY/3tT5w8PrGGrEKnP5hU6jhhTCaa?=
 =?us-ascii?Q?7btYl9RqSX+hmt3FPQHVI9XJ4sM/Tck4E13auudonO62OW3XgxYyvyRqT28+?=
 =?us-ascii?Q?Eyqtp+Gw+2SJ0iUFLM6pDsxiV9a9+rTHQZsoxC2Xvdpcxb/+XJPkmLsSRYwj?=
 =?us-ascii?Q?DMgLywxgq5CA+4sz8gs1vZpk7ksPg4hRAoZqPE/aOaxLyfLF8cF6hbeLTCtm?=
 =?us-ascii?Q?+jpWGJ42Rp9Y7lXRwc49PTDkiZ9aQG/PudAidhwNVfOA8NfCJTqyMsPfKLCG?=
 =?us-ascii?Q?g4RJ4YkrgJj8qSW3M9H7L0ae+uXLJH2i+WUqpLM3DzF898k/9OEzOyN2iEwp?=
 =?us-ascii?Q?GoLksttYARO8cXfqoRjrXvxXFbtx0wDwPcIRthsIStJH/mDUNqXpfI8gaDrB?=
 =?us-ascii?Q?F509owx+IJIcQQ8vxng8csQRRofPuGyPTbO1ESHXv2J75f17JM2hoFg30otb?=
 =?us-ascii?Q?RFF2j9yVzvT9/OKI4GlZN2cI6oF8AwLdm/5SK0rWvHEoqZ+D8QA6L44k5VKS?=
 =?us-ascii?Q?eDRish6SrYxJq0ioE0xGvBK6WJ5qXReys1hSayRENpkP4bXzu+gA1ktAjJIw?=
 =?us-ascii?Q?GG0joA9291rGf8L+6y/9ma3Yxf8zS/94eKjhB/CUDkb1bqQQnBErkLJ/LSDb?=
 =?us-ascii?Q?wu7iXVpII7mQOvzubIvPMAnH2dBRvoSQhAyuViJZGHaKNeNgWT2b6Uyv4V2S?=
 =?us-ascii?Q?9ljP6p6FJkqGwgB2+Cr9VwIEpmrG+vGoiCyFjxPREKqUK3d7N+xUnqk625Id?=
 =?us-ascii?Q?F6FyNn7YWO7s9/aQht/o2WGKKOn+yhiksd0hMDMyR3jqxNGfXgg35X+TCoF9?=
 =?us-ascii?Q?WQs56PxzGAvBK2Nm/alDsl/OlHIo7kMRLe4KtBhWMH0jkWtHBH1aCbPMBSoD?=
 =?us-ascii?Q?SUuqaX9UKyerm+nxkQnD+yl9hzH80dILAlHV2GleybDDE6ue8dtJWGegTRGf?=
 =?us-ascii?Q?OxQ52NEFEyGHuifh0IrByFyK9afI6dZSJSM2fiqGgG4sadvSsQb/sa6P3O/2?=
 =?us-ascii?Q?xGcDQ72dNs/W+7jTBwA6qBBZmyTu90VNgUNyhLz4O7Hjb9d6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0add7b49-6c0e-4cc1-6c9f-08d9c39be639
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 09:34:20.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWTtDb4VokT1tkbIDKLdwCdysMZ4SDHlyMF8hkE2tLBZ0RV5uECupu4i1GAdQwFTiB+4I39XngCob9UiAnE6PVIh1xObxwLMe22FawalZqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10203
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=690
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200055
X-Proofpoint-GUID: ArSU1EnPP-CMJYn1wT11aoXzldSHvqan
X-Proofpoint-ORIG-GUID: ArSU1EnPP-CMJYn1wT11aoXzldSHvqan
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When examining a report of poor migration behaviour, it would often be
useful to understand how much data was transferred in different phases
of the migration process.

For example, if the downtime limit is exceeded, to know how much data
was transferred during the downtime.

RFC because the name "ram_transferred_add" doesn't seem great, and I'm
unsure whether the tests to determine the phase in the second patch
are the most appropriate.

v2:
- ram_transferred_add() should be static (Philippe)
- Document the new MigrationStats fields (dme)

David Edmondson (2):
  migration: Introduce ram_transferred_add()
  migration: Tally pre-copy, downtime and post-copy bytes independently

 migration/migration.c |  3 +++
 migration/ram.c       | 30 +++++++++++++++++++++---------
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   | 13 ++++++++++++-
 4 files changed, 48 insertions(+), 10 deletions(-)

-- 
2.33.0


