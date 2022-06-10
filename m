Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2D546DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 22:01:27 +0200 (CEST)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkow-0005qQ-Dt
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 16:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf9-0000QH-Qq
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf7-0000Xy-IE
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:19 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhvHF021493;
 Fri, 10 Jun 2022 19:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9oE7nv4UN98dpjHJ+kWUFMPHqGsWZViNlu0UZ2S2HYM=;
 b=dbxsRHD6NaX9sW2y/39jFcNW/gk7cS5wBkm2eyd+NxnkXsLbmuFObQ9bEp2bLtkno7sM
 1PYGrUNB8j9qcQMkevq7KpRC39toMBbdx0hg7sFE8lvaGj9m3Wkor4Rq4xLSyN66s/Za
 Gw4ZKhW/GzThcmI6FhKmsnikxhNaO9uyenJknXbfuMH7yh4xX12na/U/PzhGmNjEnZ6r
 eo2wdDEb3eMaqPH4JWINQidv5aTnW5HoPHsLj1bM7hlaICDT35Z+xVtDrKH8OiMoQc9Q
 mZvR0vXwllbmk8YBYlK/RGFXFgo/jlMXQhkBASUvO7u9MEhiM7ZlKZ1cgkfQVlB/I1wz 0A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexem0v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:15 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkRgU012900; Fri, 10 Jun 2022 19:51:14 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6v6ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrQQe9aGdqZRQ6E2c2D0fk1tRdS42pkgT3h5LdYLgjfYJDdkiF9jpyF4Smi+pBZT3q5ca7eNDDmR3clEbz0x8x9tMwizOFtDWHbBrY2CydXM0YmKKn5fin8Kplzl4+FoagRBmQF/oprVkEfq/M33n6ivGOxTutB1JLWw637vDKeT+ignQreJLdVSMBNppUIiMEg0EfuoxQNMKWfpiUoJoULGKVuH6//vyOPiT9qSEP5esvdOKBbY9fC2kMUEpmyemxw52fM78hJ4ovlOe2Fsih6obb/oJ+7xe5l2FvIDoQGy0qFbMu/Z1+q9FTXI4STMKCeavUrORJDlbuG1jOpPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oE7nv4UN98dpjHJ+kWUFMPHqGsWZViNlu0UZ2S2HYM=;
 b=T5LRouzJ6fi4wcQYnC6i2CD5w0PZ/ScqVZDaVZFxsl+gDc0q1C7ddf+T2i2OmQsiVjMl5aDB7Ni7C9+T9vfDFCBIA/Z0OdQ6VsiUmQrubky16LOP2YUlgJfF/ALYRpKfvSZ0lCF6eWTOX9MJVRctsGBKt9+m37MjoXp5Dw6R5uXCr+V0DTx15Qr48NghJwaKep9abNgZJ+1cmlZF5gXndjUDXgdzhVBBfo6MfIfriCjfzjiF7y7C658V4R2gFkwXC6RT7BfHF5XFsyY14j5oIR1chi4MEaZelzW8PeDMTHhs8F77KpG8ip5Ycsl1GuZOuFxm/+8UEetJpnzU77EtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oE7nv4UN98dpjHJ+kWUFMPHqGsWZViNlu0UZ2S2HYM=;
 b=R/5wtc5CWlWAOZ3n0lXFTI3U2jJ57CIFpY8z9CViJjSO39AAENcI51A4ixJ18Jb4HLScKqUTT/TFoUP5e+N63qDrmxmD10Rw44iGhvYU98bIE/1Cbx/obathrhn7uX1Q/tTCnurN67/Mzrk9ohI1RHUJcqhZ88ql3klD34cRFIY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR1001MB2410.namprd10.prod.outlook.com (2603:10b6:4:2e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Fri, 10 Jun
 2022 19:51:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 10/14] vfio-user: IOMMU support for remote device
Date: Fri, 10 Jun 2022 15:50:37 -0400
Message-Id: <e85af6718990e01d067928d625bd68710e10db97.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0188381-8545-4fba-c06f-08da4b1a91ce
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2410:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB241078715F35DFB97943492790A69@DM5PR1001MB2410.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ay5B1lXmanaFswlznWk9EehXxlJHJJJs+eOGgXgEUkQd/PB4sVJNlm+TBzpJzk+jGPLmYauDDh5wz3yW8PrDIQ/HbCBXAerJrMKyRnc/4NSzyRvVOsjEQ46O233pV9p++svmixhc9QvsSPC45QoVYX85z9lhFiL9cHC6TDWPY3IrcFTwjJPN98AeDnx3MJCIGE3KOp3gei5z0RPsPRSzwCaIN6j4sLyDot8aesChOMjGPjAxpHRV9U/Lz1drLgLj4Mb1a5+6z0ab2issQemhz1l649r3CdHlLgf33sA2l5fAjd6/qUT1vnO9hL8gQK4IIEdpjCRTFZZDD1Ssy5857nFOFOcCg2tj8eXJXTR7xZkogX6U5NCemqOYCk6q8fWO3MZZrOu6iM3rX37dtB4unBvowRlrI4XeY6N4s37c8EErdd5CxDU7O894JGwgQp9+OGyE/KEh52z0fTdDMgfhUQvA39z+n9RdfkGYXcIW6iPkuU9QyY/SBrlsV1wmyhK3Vz3Rwfo6xRV5jNggizaJisB1LKITpmySHZShB65HCzH8B5hUyaAf1cPLXc0r161bXDIb6VUGPG33uH8iM5Wd6ZKzU2zM33t/3V7qT0tOU4dNofK1dCr9DzKo9zyxbTEnhZMlqSFuAL3W/eu34hKx5I/Dx2izkbSlbjwLEvyOBYbKQ2NTrO/rIKvg7m2NT1Y/oEu+JlCFEtOuhlhuR9umKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(86362001)(66476007)(6512007)(26005)(6506007)(6666004)(107886003)(6486002)(186003)(508600001)(2906002)(8936002)(2616005)(36756003)(316002)(6916009)(52116002)(66556008)(38350700002)(38100700002)(8676002)(5660300002)(4326008)(66946007)(83380400001)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJQdzFMcEp0NE5ZWFdBb2owcXJ3dTI4eGtXSWo5NjNDQ0hiZlV4LzYrRUNO?=
 =?utf-8?B?UWkrSFRLSUwxbS9MYXZLRHFqWkxrM2d2bTk0YjA2QUlpUFhJSmN6TUNJMytr?=
 =?utf-8?B?OGpUbDE2RnNEL1g1em9hRVgwUlNhenJ6WkZidjgrV2llMlhUVTQxSWVBYmdM?=
 =?utf-8?B?ZnpSUkVHL3J4aUhaQ1NTQ1RNdGJsbWg0Z1BGZTVHZ2Zid2NlalZtWjdBSnV1?=
 =?utf-8?B?WVVUWUo5dHRCcklJODdUTy9VYktCbXFoelNTd2llSG4zOTRicEpZbVBIWVA5?=
 =?utf-8?B?aVN3eUh5REYvbG1PamtiazFEcUJrdG1TajhVMk0ya09NTmdFaUQ0QnVia2dK?=
 =?utf-8?B?eVpOYTJYaXZzWFhKUHBBMXIyMDZ0M09CS0RudnhCdFp6QlhGa3ZTaU0vb0Zp?=
 =?utf-8?B?WllqMnZ5Wk51MWMzZHpIRW85a3g4K3Nid2QxRVBqQkhWQWEwb1YwZW9vY3gx?=
 =?utf-8?B?elFybGZJcVVvZ0k4MnErY1FzWkdmSHRHaGZiclZsWGtKZEN2Q1U2WVIwNnJ4?=
 =?utf-8?B?UU4zbmNVVFJLSzhzbkZHT29ZazZuUHcrU1dZZ3lmS3o5aXlVOVRlaHBubnRj?=
 =?utf-8?B?aGlZSjZiWVlrK09ST3pReWZoRjBZUTZWL1JEREo2SmpDQlQzWHpUSjhrcnV3?=
 =?utf-8?B?SkYxSmcrTjdJWWtheXNGaDZNT05rYndiQjJrd0JMR21Oai9paGRIOU9ZMlhz?=
 =?utf-8?B?eFdoQUZaTHBMSldUNE92b1psRXNIWU5HcXo3WU53K1ZuNVdtdlI0SVR1UmR6?=
 =?utf-8?B?TEV5ZC9YVXRaM2cyeHhsaDRtd0poWmh5ZTRBMElObDBuMExISWNHdUFpc01l?=
 =?utf-8?B?L3pxR0RSV09wS3Q4ZDNyTWNNNGozUDdhemdmeXhaSysrTHQ0NUp5MGVpczhK?=
 =?utf-8?B?OTJTT2N4UzZESDRCVHo1bE1lZkw3UUZHZEhnVm5PZUV1MEx1SlFaVjJHVUpt?=
 =?utf-8?B?UmVCVUJrWkd0ZEh4T2dSR2QxcUgrK0ZCUEd3NWpYdVY3TmFoUnhMRi9wc2xL?=
 =?utf-8?B?NUZnTStmTGZDcFk4SXM4T1QzUDJlZytKeXdrd2ovUHBSSzZoN0poajloT1Zo?=
 =?utf-8?B?eEJCanZtMDlOb2hhMzcwbE1BYlZzK1VPNVR2MWZsbS9wRmp5ME11VytBVWFx?=
 =?utf-8?B?Qi92SEZxeC9jS1FmM3lsSDFUQ1VUYi9VdVpURlBUbC9WSE0rYlE0dHo1R2F4?=
 =?utf-8?B?NkJUdnJsSC9IQXR6S3lkNlNremhvTUpKRnVxK1Fqa2ZPbmxjeWo4VzlmbVhz?=
 =?utf-8?B?dFBUVXJsc3NKZzZaL0I4NnZGUGVvd3RxQ0QydGdDc0x4eU5yR3V0ajBpVElD?=
 =?utf-8?B?blBpU0N2OGlJd3lzQWxQdUFJdzNSN0Q5V2pURWpyL1Fodzg1ckhQVlhpUVVL?=
 =?utf-8?B?cGFsOG5OdFZ2TzFRMXlmaWcwTWgwK29TZTIvMEdFS0NVaytsbytnbkVYQ2JZ?=
 =?utf-8?B?dWJNS3lJRngyWVRBUW5YTnZXdEl4V1JLQ3hub2VDcDM2bHMyU2VkMDJUK2pm?=
 =?utf-8?B?b2F5WFNuQkdWQ01KMFRCMFZXdEsvUURHc24rNnlxcll5dzFkenQwdEc0dWg2?=
 =?utf-8?B?Nnh5RnBETWZlb0tvQUFibGQ1b05iNytKU2JNT0NxallmQTBOaHZoNHNpNDZ4?=
 =?utf-8?B?QTRyN2VmSWU0UEorR3AzZU91dWswcnIwL3Y1V2g5Rnh6MkpIY21FZEh2aXhD?=
 =?utf-8?B?L2VrQTIwcmJ4OWdhSktzSU9UcUIzUUErbUZNOGFBTkwrcElMdnVtMkpIb1Np?=
 =?utf-8?B?c2ZZMTRrdXN3UENnMlppZ3pjczcraEZVUWduWHhOMFpIa0E2eU1QRzl6emlK?=
 =?utf-8?B?TVlCbE5uL3BBeDB2RkpGNUxCcy9SOEpKakFVUXV5WC9aYlROQUt1T0MrNXNl?=
 =?utf-8?B?dVZSUGJWTkZYQkZ2UUg5alRDVzNiMnRYOWoyckNSUTF6TlJUcnpOWHR1OGVD?=
 =?utf-8?B?MWJhTjZDaHBhbjFuZmNnbG14YTVqWU9HNUxxVmVSWEpRL1F1MUJLYi9aMGNz?=
 =?utf-8?B?NWZFQmtLZzJyd0tHajN3bWRhUjJEMXl0aUltd1NCWGU4MWE2Mi93dXhoeWUx?=
 =?utf-8?B?ZXhVbFB3cFFJdm1Kd3VUdUhlaUlqaElvTlJiY1dmZXlCYWhrS0xBN0o4RG9J?=
 =?utf-8?B?ZWh3YlFJcXpvNTM1L0dSdUE5NW5xSjZjdlVqK2pXSVJEbTloUEkyblJxMi9p?=
 =?utf-8?B?M2kvYnloa1NZZ0V3NjFINTl6bTlDNm1Ma3dMMW1FUXpRMVFYNHFWQlJSMTRB?=
 =?utf-8?B?bUJQblJBUkFaQlE2djliMFFsUEJaR1JXUFRZa0tLT2hRZkdGVS9mc1NncEpv?=
 =?utf-8?B?YnNVR2lvd3oyTGdZQStHQTFkajBCV0NCdHduMWwralNXNUtCQ2YvQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0188381-8545-4fba-c06f-08da4b1a91ce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:11.5544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhYjcfsbPWaMVBGQA5UZEYTy+5/Zfk7FsNUZg8CRSTpfyEY/s234gEj+rIwD2nXDRWPrYwJIcOCCIQoMThteRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2410
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100076
X-Proofpoint-GUID: b6Krr6SDlXyRlQmC_vJ5g60-TMfxZjmw
X-Proofpoint-ORIG-GUID: b6Krr6SDlXyRlQmC_vJ5g60-TMfxZjmw
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/iommu.h |  40 ++++++++++++
 hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 +++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..fd723d91f3
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,131 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+/**
+ * IOMMU for TYPE_REMOTE_MACHINE - manages DMA address space isolation
+ *     for remote machine. It is used by TYPE_VFIO_USER_SERVER.
+ *
+ * - Each TYPE_VFIO_USER_SERVER instance handles one PCIDevice on a PCIBus.
+ *   There is one RemoteIommu per PCIBus, so the RemoteIommu tracks multiple
+ *   PCIDevices by maintaining a ->elem_by_devfn mapping.
+ *
+ * - memory_region_init_iommu() is not used because vfio-user MemoryRegions
+ *   will be added to the elem->mr container instead. This is more natural
+ *   than implementing the IOMMUMemoryRegionClass APIs since vfio-user
+ *   provides something that is close to a full-fledged MemoryRegion and
+ *   not like an IOMMU mapping.
+ *
+ * - When a device is hot unplugged, the elem->mr reference is dropped so
+ *   all vfio-user MemoryRegions associated with this vfio-user server are
+ *   destroyed.
+ */
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    g_hash_table_destroy(iommu->elem_by_devfn);
+
+    iommu->elem_by_devfn = NULL;
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 4d008ed721..cbb2add291 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -99,6 +100,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -107,7 +118,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/MAINTAINERS b/MAINTAINERS
index 3518833711..2e84bce970 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3633,6 +3633,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 0eb5a0f375..ab25c04906 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
-- 
2.20.1


