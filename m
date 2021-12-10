Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B168147029B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:19:07 +0100 (CET)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgjp-0006x7-TP
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:19:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghe-0005Ly-CI; Fri, 10 Dec 2021 09:16:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghc-0000KR-5g; Fri, 10 Dec 2021 09:16:50 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAE8fHA012455; 
 Fri, 10 Dec 2021 14:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=fYhYAAEJ5NhuLKqCOFue1jdSHmeJwZR8GCOVaZjXxaI=;
 b=XR7tIl5uMtZlXISGguJgLjogh4MLbzXGLe5e7InsTgOJIxZohCSZJBHtjCIBMos8BZca
 doTSeSqZds2oAzN6sN0/AabMcHXmaoIIOK83dWeSEaezeGRCFfDhA1rqAhEi1Drmun7a
 VrqHK+7X0r3jiZc5wQH6wsbP/J4IuaGQccgEXRNg+vhUfuHSICUJ7JtGv+x4y7waaJd+
 8c2FQU1NEDodwqNk1F/TxDAjbKcd54GmdvImtBenLQGTZqVilcvRIgVAEsO/c56fUdv5
 tbFoIVjG0RAbnfZcklQ+yy3AfmEkLIwJlTyY0uPszC2KPjmeIlJglyKUFjgtbP8XcV2Q Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96wyxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BAEFafV049225;
 Fri, 10 Dec 2021 14:16:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3030.oracle.com with ESMTP id 3csc4xrju9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMu63hU+usSrvK4vZwbHjj8AmAjO9wTR7GXfEIwiKvHiuXPLDfv3Kv5fpMbzBz3p0AS42IaxpkokBuuLuksQ+Y5LQDYMCxi0ijgEX9Gn7HJpSYeo+nHcFUB6S7ckWZfYlbZVkGechCZzfaIm7QSt+RCAbAqbzeHDdtCn0w6gRKTLPXwQF8R8KmKfsZ6QClue4ddv7T2pWb0Trl+BYYC4xY9fwn3NW+Z9P18lsmhT5V5ga1cmh1dybS9eY46eM7DJfVNALOEN+8lNDaqx0KPWgiKg66Nu8CCo7c++rUmsmigWxrqfLCyL9fT4wRFPXH9hxbG9rmUi7wf1N9nYapb0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYhYAAEJ5NhuLKqCOFue1jdSHmeJwZR8GCOVaZjXxaI=;
 b=FTy9ZRa7YI4I8u/0C1LmP9okPKTonyS96Pa8mfGLx03AEmIeIG2yQQT/dHBn5PKwPXJsGf44GAIDUScjyuch1HQqDhkcqY9nUy4kajAc6DCpXqKg075OrcipDf4fhCAIMuJ7eDS/RcGeRaIvNKN5ei020YtlAa2FF800QaUm08S95N14htMh1RNWkAO04J2q4PIeLk/K7/cBJ82D+lyCXREA+65+kqTti149kU1AzmC7oh5sw+DB95GUS9BJRtFTny1ZUjk5fkWLre8Fgqd1jfDt5piPDvj0PYttmHH3/cZ7hrSU1ry4QmmU27MuktRyq31GI67OqvZ/Of/V/q5sqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYhYAAEJ5NhuLKqCOFue1jdSHmeJwZR8GCOVaZjXxaI=;
 b=d/XjelfYraV1aB8WtnmhumEw6xbU4tRib3sIYKdLhAIJX4R5LFM30IkSvjXIMaoqz+AENu5szyfvgY3CrYAKMWTNeu5773xph6nWIZoU5lMaBYEud80uZK1U2vWIYtjzVFY/WnYlOrlUA+tY8OYUx2OfnRe5lnKPno53/pZLmc4=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 14:16:33 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b%6]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 14:16:33 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] scsi: to fix issue on passing host_status to the guest
 kernel
Date: Fri, 10 Dec 2021 06:16:13 -0800
Message-Id: <20211210141615.2585-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:806:121::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c91b9ff3-b807-4b51-424b-08d9bbe7aada
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB44637543559810E171DA1494F0719@SJ0PR10MB4463.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0fuIAcyC9AtffScjMpDk6nt6GzMpahwXk/BxUkc+2VeIxPcrd2o1bZt6YZesXZc1xsX3LRYwd/uN3svUJqpZLyH/gcgbhVHZ8FOGW2/DnL5i690Oy0zz3Oh42T2iTL3DgbAfLun8FZ1Hqkl9BMmZyJW3tS43UIZCraD80FuvUnauA9Kjwn+DNQg5vePutVBAWvjF2v3KZcVffiDRXmiUeiM60gkkGzzbyu7F8030UQuqyerAZ2F8gNMsilyCLHW6C+Rw+t+jZ79Q9gWpRTpe0+MoFmP8T8JXEKZPoyEWWg4sxsqMDJfjb58J4loo2cRU0g8d5MklSh4v8giDuikFpf+4PSPNbLb7vzWWqJqHQdk1LUMVYOuC6aLLn+fcrM/52yvRFtiXEsurvebVR8HvMvKBuPeQmryowz6Z1ch2TJ47d6yqPYaoCZLsHkEyEPfmsk05VK0gepveb45Eo4X6UITZwdMpqWqYLVTXkB+hdMfpFe6W8FUxv33eVAsPiZai567GAT5yb15qCCqMenUUUZTzK1MEq+97cbW1QceqSUbB3kElgStTEZ3Ri50reFd2OtTq7MPAwilxxUdb9pfjlikzhm9gTx/NBOghyqU0qJi8Qn8nESFBvTaSdgeIt3N1ntyUeo5T1UnmZDJH7D/cuYhKAa25jE3tWEqdSXvs/ZZa/1tg44zRkh65TMmCtD7FGTHGApbV8BC30cTThFdGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6666004)(6506007)(36756003)(26005)(2616005)(4326008)(508600001)(107886003)(186003)(52116002)(44832011)(6486002)(38100700002)(1076003)(316002)(8676002)(8936002)(66556008)(66476007)(4744005)(5660300002)(86362001)(66946007)(38350700002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nk5iBHP2aY5GkqxS3BK9J7v5BhihY3Uc0oUzutV6dOJ2HdW2PkPgTkzn1fp2?=
 =?us-ascii?Q?BAPdYMJxc8EmdyoqkwDVzLYN6DV2JqolI0rL19Kt5hIWqbshgCw1mDQIaTu4?=
 =?us-ascii?Q?nEeXQW/kK1WyxZS0yconZtqd9zypr18eaASCvGF0Afp+bcwFuf+IC+PzsHR/?=
 =?us-ascii?Q?kNOoh1LM/yej5QUwmIQkS704ocqqJ7koO68pvGT515sFA7n7bahgZFKYP7Vx?=
 =?us-ascii?Q?XeMC08QaLEDOQT8Gr8CZZg/gW4InNKf7M9guZUtJWVRe60tyMY6z2mjQG4xi?=
 =?us-ascii?Q?85IYdoNf8xWpgxz7BAEsBEKz+RmIp8xwhJQK5pGzzCde3dLyxUJlzblD17Q5?=
 =?us-ascii?Q?Tj9XW1JBgN220u68zFDUnQHtaRUhT26hivu2obhgY1ZiCARU9ZDxTRRFEmDq?=
 =?us-ascii?Q?w7QpoXE7V0IHOStD47XLPlmGDtHNzJ8It7m7NsChLHOlzOXGNEv3jgikazy1?=
 =?us-ascii?Q?kI/51o1OUHRa4fSLJeBy+MBHrrk/ZlyZ9mRkkJv5FdpHw14/reJY98DZ46oA?=
 =?us-ascii?Q?E/pgvkFp7uMI/dspvpyt7UapD4tfsC/Rr0iW1IIKMJPL+daMsRqXeOwGu+gC?=
 =?us-ascii?Q?uhB+BXbrRUBcYKSEiOKeQ4wozfZvyMmK4ZM/a6whdY3rxu10yziG+vbs1YzX?=
 =?us-ascii?Q?1rDpvXd7c+s9gbg8wzesA/TZjDgdiOUUEvjbOqT/gZueLUZA7i0sGO+X6t1g?=
 =?us-ascii?Q?jcYZcHMoEkh2CLPq1DzzSL7GCkz1CqCov7VD8c/mQXAEsNlwi1NxKDKyMsOn?=
 =?us-ascii?Q?x0Dg+JZJCTU276uDyv0FTiTT/e3PWLeefXiquY+pDmmZkH7/+8jKDIsuiCrR?=
 =?us-ascii?Q?ZgosAKMRpS7l05OhJeFO56Nz3AvlthpBjO1grpozJ9LhnJz8ZD72mZjiwlwS?=
 =?us-ascii?Q?X7R/BVsjXDFCS9LOPthxx/3SA1ck3K8kp5ohKJ5Svb2BGQRmpm/v6cLhMct7?=
 =?us-ascii?Q?am8fK030M4529Bwbk2mi4A7v4DVR20Va+hrpMF7ymy+1vIK48XvaCYHP8eOj?=
 =?us-ascii?Q?NESXweekdY3usrhTn6n7MZrhyiuRcDquKWMFwCBjji4ziLHNa67JJu7RL2cN?=
 =?us-ascii?Q?T1lqqL8evWEVOn9KlCMcHUUXejKnDmTU3RqGUKxc1zjShAWnsRJxRLALdP4y?=
 =?us-ascii?Q?gUqnF5DpPHG46t+vsNRiuCOUNLI01TBFfxRLEOeRlGoC82T1wMm23jDI+iU0?=
 =?us-ascii?Q?jBmoNIOUXwH2H9dC1Vu5ztjkd7J4OwfCMb5ckksGnV099uoVPuk1pTq8KOTG?=
 =?us-ascii?Q?AnUHMwFSJuaBb5/jzE5ivDXbv7fHadbpcOlwOMDTrfB+B8c/DzkNyb0+giEt?=
 =?us-ascii?Q?hl6thw69BYo40TJaN4ov6K3y6E7VeUnpvA4Ds1QAAGWniFTKFCoVJgChZFvX?=
 =?us-ascii?Q?3jONSY19ZvKimB0Mn8nJ1G79IzwJNGHhLlFCsmaGkYyzm7MZNp1gweHLXBc/?=
 =?us-ascii?Q?STyWcNklEOlfqs+lw8b9Ztjmffve1090i+VvRXJ+BJ/tMOCkzBxmagCALKZd?=
 =?us-ascii?Q?zSn7bfBBuCqUuSFpu7qqmce8jE9RW+oZd7qinpPySpu0KoBAxOzbGOHFqIIn?=
 =?us-ascii?Q?ODAf5DEMo+K6ucY0ABUD3XxK3DwRSxgtYydLK1fmhU6JT/UyGcs6+xFPhVzZ?=
 =?us-ascii?Q?YNLDTxqfkf9cNeHCSdhg3jU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91b9ff3-b807-4b51-424b-08d9bbe7aada
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:16:33.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJ/dxO0/rJHCGWGz21vUzSzKCYqGVYi7IUx+Lpgw+hYizcatAxiGRfnh2y3uUgfjV8qsYn2Phs6d5UqRqYs6ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=764
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100082
X-Proofpoint-GUID: Cj1iiq0syZdzqPH48L4cwe5aMAy0EMZl
X-Proofpoint-ORIG-GUID: Cj1iiq0syZdzqPH48L4cwe5aMAy0EMZl
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: fam@euphon.net, pbonzini@redhat.com, rui.loura@oracle.com,
 joe.jin@oracle.com, adnan.misherfi@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes the issue on passing 'host_status' to the guest kernel.

The 1st patch fixes the erroneous usage of req->host_status.

The 2nd patch is to pass the SCSI_HOST_ERROR to the guest kernel when the
req->bus->info->fail() is not implemented. I do not add 'Fixes:' because I
am not sure if to not pass SCSI_HOST_ERROR was on purpose, especially for
security reason.

Thank you very much!

Dongli Zhang



