Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8A3B8909
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:13:31 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfeM-0006iK-3r
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZI-0007FS-Ga
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZE-0005qN-IB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6TBj005967; Wed, 30 Jun 2021 19:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mhNYiOFuVI28aIKqgsbIaBXkfHGJBIZ1UWDAsqZ/WfY=;
 b=o8kbdtwMwMCu6RTsWxV9Zhp766niTuRZ/vHOqvCLD98JSltFsqxAU7RUhEIk3o/6gwJb
 esoAXJy2xHyKLwvNjADmknisA2TNgbWnAVMbHpUA9fxk4Stz6C/n2aK618WV4QJSl9oL
 YgaCVYreE1XH3vOMYND84sBQbuvdZ8+NaJ6PO20xj915ABsoavC6hM+is7iPYWoR6Rna
 bHc1PDrWUc/UEvFCVnklUeX9a9NewRxvFfPwjg0onb5ag24mp5dtWQ7Po2BYqNbCSvLD
 BPJJYDOtVvpRxXJJxPn5bzywO0PUDeMkQVIVBqn72qpsDKrzbMHWUCFQgsW/zc/7typm pQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ0Akh101205;
 Wed, 30 Jun 2021 19:08:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 39dt9hqpat-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRypbo2updzC0gJDmHvLKzATaZHUcBhOaaMpONHxMrRI8rIJZbvklQ0SptbJkD4O656S2T5JGUKRs9/UmcijEtTf/4D1UvSY/MXirBb4owd6xT2rqbCOHlmNQne2KACFxLqAN7tPMnbIJ9rRw7e/ikfdt3DVxxHwKnlLXv9FNv+XXjE+Co5agaNxdVVrcfevMbdkmc6W9bFnENDZ87UzVr10EgLP8xHf/HZlrAeZu+zNvu/qLHxeUYPh7TfGojTHD+W7K3SVHorDApjQFKkV17Wjcha4kH9036kNpDkLryo6fZE4mPurW0Lk9lCCRv30EI/VQeq4odzUSmAx3QZ4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhNYiOFuVI28aIKqgsbIaBXkfHGJBIZ1UWDAsqZ/WfY=;
 b=fKYqrNd3nGIqBqlWFj+TV+ELeFV07RxDD04ajeARNpNOAM27tj220c6cOk4PKgNF2gyVIIZVZIRG+yHRitwFmaHUrx9x/UlvqLXcIpnu9ADN5mER4EFyNPWesadvKpvookqSFgCSRXPqgT6XwUUmcke4q9yK81krIeV1/RKIp56xMxA4g6npGp6t3WyCKo+yJ7osod7vsosoCdFEx63Ro8LjzY61rvDxAcAS8EWQXCc5N9/iv0nrtWkjA8tFkcwb1bj77Inij0HUNuoSVfF6uTmcdmyjvYHgZf2hIUIA1Jgio/NhdoZEyOaTI8TlSV1wm5zrAsNsoVCaT2+LWjZY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhNYiOFuVI28aIKqgsbIaBXkfHGJBIZ1UWDAsqZ/WfY=;
 b=IV9eONEa9NxnHP1oVqXBGyC+ef5VKs8SQJv/miOvN1lk0+8ldpwOnOAJl4zTs5QiJx43M4oAhUb/7XoFUADYZprju0t1Oj/6msekxyibw/U0v76tEQLx5G8UemJ+TzE8STmjOngvdsbRiSzPr+gthEsV+L0VK6qlKdAm6FzkSCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1758.namprd10.prod.outlook.com (2603:10b6:301:9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 19:08:07 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:08:07 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/10] ACPI ERST: step 6 of bios-tables-test.c
Date: Wed, 30 Jun 2021 15:07:21 -0400
Message-Id: <1625080041-29010-11-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5afefdc-55e5-4c79-6dac-08d93bfa64fd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB175855B4CD2728D2230C36B297019@MWHPR10MB1758.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hepGNAMpqfCgvpiQAm+Gda3C+uqikRdT+DI3oJrlVOn0zhP5sPz9ueXxt1onnO2KcfKswh76nOxU9duH405dHe1k0uqv+UcIHfOTfk6fTW8dD0YBER432A7BMfEnlOl06JkdPBmSmHvQqJdjKiFYAnLdE74fTYAIJM4sQdTy7Uo58SBqfihp6KJuk/BTnhF45EfCDptpVffM2FdWo++NmEqqXgW5+jHdhKn09+cypeGKwrG9qyYGiIchoN4lht443/2lX4aiCxx1Rwh1zc2C4A3MYiQ5X3wNecGQbE1NZe52tnXLOvD+3QJwPNeOAHw2F/IO+mad2j7VmMIAZVFx7eHVaeHwXpTLTfbnmrZUTwd0O6hzf/t4mqrymo47UebeYYo1KUxEVOcVReUyUP9xHAWQS23trLBMCRGBt1QF1mYhSmLRI/TVj3LLX5EOkgvugFbfD+/81eCfgL73iMTNlCMx5NfUkn13jDu+SSeTZ2+CF99PcVBFGRubsYuf5wXmyzqpluwBvLGNdZekgUz8w9c5M8HUNgew25XVxjCFJDJYoT7FhIYK1ddnOXjzS2nBOuUIf5y/a7UEJkxZB2Fm0riW8x9SIytOCE5uy1D7SmE3FGIeJFETRWIYo5oOzxiwJ5DO9mY1dpmaCBFJNBuAcHXVMT+Lkfil5SKdWiUoqCMOpk4laCwlHPHmLkgafN7bTNTwHUyy6zl0iwPdlwcFbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(39860400002)(396003)(366004)(6486002)(66556008)(2616005)(6666004)(2906002)(956004)(66476007)(66946007)(4326008)(107886003)(36756003)(316002)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(16526019)(186003)(6916009)(83380400001)(478600001)(52116002)(26005)(8676002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/LJApc08j2+51lDx4/NPu/+PD+vnCTBu8E1YAV6/cDqNvTnoFnBd0nicMAqf?=
 =?us-ascii?Q?tRzc1CDOiRCZbztSaVh7SGeGCZ9ocpoI3k6nRXd8rPaMym+aPkb/LKQDTyg+?=
 =?us-ascii?Q?JPVf54NYoUIdHuMiLeGkKsD7xqYZlxX7kGfZsszVlayn74w7xdtZF78SJJBh?=
 =?us-ascii?Q?wfpWzL+yBKxPLcc2+32ut/USKj4NnywZro3lF4MX2VpAzEVvx0z3UF76Kzoc?=
 =?us-ascii?Q?FMs4Jv1kYOGRZqVaYOVkG8aAg7PgdIleIBtspQV16opREch9WyPZcfymeU8o?=
 =?us-ascii?Q?aGI2DquP1ufdy95ok5elWBY68C0zs+eCoLWwuLN71npQJ3ie8UGEY3zZ76P/?=
 =?us-ascii?Q?gk3zWLQ53SKIQH81cIbiCwZgUFJHNKI/gNt1/Op28Ar3ePawyBsiNYDRXjRA?=
 =?us-ascii?Q?TZ9uY56+1vozpxmn1rItcgXLHMI6uvw7nBnYuAm6KmC14mN+FcnuxHQK5F1s?=
 =?us-ascii?Q?DcmpEdvkIPz6eHBk+n5GIEo7T+rkl+/oJrZpN8/2rHsiKU+yRgTVVf7IA/ZK?=
 =?us-ascii?Q?K6wtb3bYfKzAdJkZmxT7F2uDOGSFLauf8uKcwJtXq4aHZRe8UVeMjqgh732y?=
 =?us-ascii?Q?FlwZ0Dcc+iTsWcqlvsYX7EctH1p9sTtGEnnXHa7QqlZ01z7utnJtenR1vtZv?=
 =?us-ascii?Q?WU3lBYaWqAXbhTmK5MI0cn1JqEh0e4UGiov3tbPw8fUxotCfEPPGnPFXNM9o?=
 =?us-ascii?Q?7JwX04tw1lNG1VBbAj6sHpAXatGc8AInkbAFpZjXbOWYHvs4CcQhfDCG1y89?=
 =?us-ascii?Q?V/ZfcuXxovpxBhZOpuCie9Gr5g0fT0KpC6PZuYWD/cyatbrMn/FXH0M5FvtD?=
 =?us-ascii?Q?oJtVwKV5AORgBRxRp29nChYIKpUNUg624ZxqWZwSpU11vdqCVuXEppYGliuD?=
 =?us-ascii?Q?JyJBrmoPyEo7DWP1hy8molnKDlDp4efGGXKmJ+8BLAMOh2k7TacB4m5OvDFA?=
 =?us-ascii?Q?Oy37/YHofC1BRP0aic6Q0b5nA9n7X10qDD2mrvvoNVBLURCbxxbUkYl3qC0K?=
 =?us-ascii?Q?WHdsqUBC3DIZzxCo+PUGXEcajXOOGOOSiErLXn0T+pp0mVAjTGOC5WElraew?=
 =?us-ascii?Q?jbwon1/qlTtQRPM4WI0HJ5zOKkDuNTfi7ziLCmzD7+Ja0Z/eSUWBvI4T0jCy?=
 =?us-ascii?Q?vrxtlFWzbwc3yPnhvmSDoPdXsK+nO2/d+655wFwDYVFMYJhhnhWY9dTBgA/l?=
 =?us-ascii?Q?2ozrnRSgH4nzp3DIAZuF/0fIk7Ks1KpyXc10s52uSG6znDXuN3QUesvbmLe/?=
 =?us-ascii?Q?LD/8mKmd3rST0cL/Beoi1W+d89k+7G+gw32OydRQuDarcfZh5oyvqf1YErY/?=
 =?us-ascii?Q?++ZznjXLDDcC9p6VClAxiuxb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5afefdc-55e5-4c79-6dac-08d93bfa64fd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:08:07.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqL/xavXpVzePWYJL6PQoc5FrVLhcEkZjCl5hpXsmkgzGr4Wtt6aWGuv6xM+9qY9sESRAU0iBDl0M/ncpqz9mTDZxITjACz3mvZIbJiTvs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1758
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-GUID: sMo9U3gD8iGPipXEYlMLB0z63nlYg1Rd
X-Proofpoint-ORIG-GUID: sMo9U3gD8iGPipXEYlMLB0z63nlYg1Rd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
is step 6, the re-generated ACPI tables binary blobs.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST                | Bin 0 -> 976 bytes
 tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 4 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..db2adaa8d9b45e295f9976d6bb5a07a813214f52 100644
GIT binary patch
literal 976
zcmaKqTMmLS5Jd+l50TdfOjv?(1qNf{pGN#}aW2XoVQ=kJawAMa;r8^<4tl<ik9Q&x
z9fs@aGWNsscIs_KB7$e!_x3{VFxa)yyAdhW<ewtq@KMTR;_(*;o)AYwsc#_I{R=ny
z8zx&whJ53fsGoYS{%e8zX-SD^^!|)F8lIhx`_IYG$#;3?dmQ>N$k#r!KbMbUbUyg_
zK(;pcerufGzoGM$#7pML|ITms2HKLp#iT7ge?`3d;=pU-HFM;Z{u=Td@?Bo=v9u+>
bCEw+h{yXwJ@?BooAHQFxe`xQi@1uMGuJKX<

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e004c71..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/ERST",
-"tests/data/acpi/q35/ERST",
-"tests/data/acpi/microvm/ERST",
-
-- 
1.8.3.1


