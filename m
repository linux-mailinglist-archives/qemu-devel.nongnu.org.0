Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D3532D97
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWYC-0002BA-9L
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUr-0007hk-S6
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:30:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUo-0003IQ-Vy
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:30:57 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFHgWQ015104;
 Tue, 24 May 2022 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NpX5cWY956uHIb9cOpJ8ll9kr5i9NOFWCPWZy2Hc+bc=;
 b=o3Nc8ipGapn9R8764ZJTs12emrUIY6ETPeXUbpgsKqm1VwD0coh5yJtH1KNqJW+jENdX
 /hArrwIBxQjA9cQwOzoUwqXguduWLAQvL5xFARoq849YnO5mHFhgRG+7ptdW6EfTopV1
 NzivANGzGRnesxRfu7RRvTNBKkqIT+ufGP4JYPEjHDtLCVZrsPTrRCg0LcGrdwbGnIw8
 jIVwxPj4l8EIJ7cZK50WiDXPG3dsTDG7LFYSWlZCdiX15vJF8Ywoo9rhstAtW+3os/sx
 FBpdX7Ojicc+pUfi3hAEPOgqaq+ZP7BiqKQBLb3g0Eo01lYIE7DI7aAm8d3j519/aCI8 +w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pv26wcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:43 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFFZD0016809; Tue, 24 May 2022 15:30:42 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph2k4sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6No6PHx8GYmYUdymSoLsZczomQctpmA02gFsXMf009p82Y1WMyzMBWiOWBOyJH73eKRBZF/N/6QtIx0tcCr6oQE35vCxBmalmoiFD15TVsWhnJtg/HCXOJFGAMl4iU9w8WJylbGSrGqKwzzNXfSfQ1sa3LplVzZluJNtZCLw0FAKDDWcNfIuUtSrobrvEl+Z8MM8aF6/p9zaHlGBLT504n7LN5XRgGaEUZMIXAmQH/ABiwOpnLrmNg6vfGqyESSvkhjKpQ4bV9r2UEdeAOsCB0CuQwafAJLTl7HenfSKsWLz4/bUJ/6I8QmSrBHflqFX06YiM0RGheW4Jy7GgAfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpX5cWY956uHIb9cOpJ8ll9kr5i9NOFWCPWZy2Hc+bc=;
 b=XjOTQT/ScG9ZMYdTxYagykefkFNSY36fl7lBHxsk99sC6SnrwCNSnpT2jU63uf1TeA+1W/uI6X2hJTDW3dKqvwmqBoexb6a7ilATelGRmCClGrqiTlKwT/0mUaTcHLZ1XQG/YtmwjcyibhPexVfrGb57X8Smw0ZgeiLoxzFso7Oy7AeXrxgAIc4kxUXDStniuuD1vfJkjjeXcPdrW7voWiL8ktNVzTUbCpiQhOZ/wf2FpaijjVshLcIrAaNNpXNR9gVtSDc1AT5Z1muXhShMXAxJ1HEx+U2F81gi27KiQUbIQJVgyarmXV58oeIYx5s1I9C8k33071BnCK9+RK53iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpX5cWY956uHIb9cOpJ8ll9kr5i9NOFWCPWZy2Hc+bc=;
 b=oOzSj4YokvcH9ylvZRhkmzPsvGc6ZL2osklIPfr+ANmqTLlpk7rA8h7/EZxQ6JkjQF9oXjQo/IsavCzPsJAny5gBQ/Z0xkaxT6naT2PHNZgnsFAG8OhF8TYh5RELY1ik4hdWUVyuDxoYk3vs7cez/xzUaBrM3LVTIKtmOaMqXEo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:40 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:40 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 00/14] vfio-user server in QEMU
Date: Tue, 24 May 2022 11:30:19 -0400
Message-Id: <cover.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08863ead-1dde-46d6-5af9-08da3d9a5b44
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB31177F7864569FE667FB194B90D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sr23K5/E3ws+CuoD3BmHoKlcui8WYh41km5GoEqPrU9PwCFIlI5t44G9wU6/yIbE+9z9HOuay533ZIWMHmf7btiC7XcVSmncPrkEOiuNjdrlWtEMsf2GTW8G2gcIvT8Atiji8AvZQUcGiU0J+r1h6L2OES52Q92814bE1IdKLcpjuwRFKRyMpsMsbludz64kZrkRNwjfjL0x49sGg14No3liairJFFedTchOEV9fBNcKM57Eeu6T+lXrPAHDWE3uV/jEn4OVSvjmw0zqI5kLGddoa2djcF65WTBWgH9+Mw6upWxXFp2uCKQaNv6LOci4OH+93oGODic/uIo0HQQBHNGULZk0RADTb+Mdi+/Qx6AeDTHdPw4yb1hxNH8It2/3OvnhniWwYp4YB4RupuDQq0EBWeoQaVGxYW5r/arfdW7m3m0Br5fOcT+bkUM3czWdD0wwfkqdsysyGGD3RkzWU9HNw8vjJQcG37U8hfK6PNgd5kNK2kS8NMJQIq48n8oeOvsgwephZ6vEKSNsz2K9gmcSrw2TZzcr/E6rINLRCynbMsarAgfhWoTp111lhLgKAkgUEouUbLEZ1tbCCEbQP55oUMaJlXPaHNqbljKQVuJO1FQkp0xj22isEw9iSOyRC4cLs6/8+aLVl/SB4wTvSvnXFWqBjzW973qUAFS5ulvkCunPuRwrJpqlxLGi+9vksnUmne9KRcHb8GTY5uI4/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmjhtHxF2DnmhXfuGtoO0QZp4lcSZW3EoG3mz91W9NWARDN9Gdu3EXVlg2d1?=
 =?us-ascii?Q?bsx8238xbb9YISG4YAVd9S1Hp1KxB5fzZY0QQURBGcMFxfZxY/JeDubY7YYR?=
 =?us-ascii?Q?6jZHTR/S8ewdBc1fAQFW4x572Hm6hOlw8cONCtY94hLq4CWPPHMYcCfWWYsJ?=
 =?us-ascii?Q?8ofNoqSaO90uqfKUVKumNUx5MtFsAfLXsrAPOFqxGjKMRPsLavHQ7esQJzkg?=
 =?us-ascii?Q?gL8obfwvfoD0sgN4E7yCpdIpDiNNbYPGyNMrgooajyyz4IzkfuFgbGz4OnEX?=
 =?us-ascii?Q?5Mnve5lHUzWN1v6Rc+y4Hi/HNPekIq+45GrtkF6/UJRNiWWfnxRSk+KmKFAr?=
 =?us-ascii?Q?bvFse6qJilAuF0oXxLImkKlzRrQS2hQrEbHG3PEdcaSGkyVRmTMLV3paK77p?=
 =?us-ascii?Q?pynfc9JynlYnD13F+XmUMnHIxuv2D+TdP8R8BNRod6RPN3GMwzLWJOwHi8ui?=
 =?us-ascii?Q?3xkjlU0PPEMvD82yHRKFkUBa6NGOihyjXRvqbAaVrTtHTKYjKoDNr7aLYR5J?=
 =?us-ascii?Q?RNc/GjCg0M7V3MzdP+r4DdEgkxhnnVpLkkMxc+F3koKkPsyEMM8ghD3p//Ur?=
 =?us-ascii?Q?QmjEc43u6JkrVT0V8zhjHNuSuFPRPDCvQlzqIirnpEBZrVrJyBjuaPrtjf+6?=
 =?us-ascii?Q?MpsB6+1tM2eF9M20DUV9AWTWQD+aq1HaUDP82dirXHLJ2FsBa8kIynXrNOlh?=
 =?us-ascii?Q?KNjAzecP9NwIhp4R2LyxKklzWwfNTvEwda4RerfkGS2Qs6kdWHDPORXJfhhP?=
 =?us-ascii?Q?1ohkXkIBgu/96osj3Iou7uGom6ac0taoPCLYOuGLZB6d/4I5jJiN4Ij5K3VJ?=
 =?us-ascii?Q?OCjwnm1g257dAP3RiOjU/rycO1VnXp2j4BfBiyddu5Teuraff6YAB4lmE9o+?=
 =?us-ascii?Q?ssKTg6gn01LbZ2XYXj9+A4ctTIRvtXBHAGb+oM9BLfiCAhzquGfej/EoD0B6?=
 =?us-ascii?Q?GTFWL2SQc0pC/GDoAjBosbgVdjy9bfovFP+ixkeQcHaPzpDm4+Yal5zSi5Si?=
 =?us-ascii?Q?nho+lQNgx8txVO1FsYwpNRSpAEwhTTn3xgH4z8QA84Eu1qwmDcZpuy22XL/m?=
 =?us-ascii?Q?1tZp2gKZEWYn39lbZc104e2afYLGIx3wN9CSfn12rzfXCAI0pnxJJaLT3txU?=
 =?us-ascii?Q?BWZZ2t/ZeXco1avzID/RNlFpX15O01nN7khp2l85lU3Z/PnPZUDNKssOu3tP?=
 =?us-ascii?Q?QXMBkzKz3YWyBSjscfDrZeCmsmBP25UB7DYqEG3JAh6hFPSa0M8/rVfXBzUk?=
 =?us-ascii?Q?tE4dWsEdCPBOaBXRPpPeUHo0e0eJUnX4+8JAv3WFTqvnCBotwx85fGlkvX9C?=
 =?us-ascii?Q?GDGrui+g/7okFL81ndRrUtAbINgeEeb2J4rkoJUdb/4Gvj5+4LGeyc7py0wi?=
 =?us-ascii?Q?WFojGrH5USkX5QFjsDs3YhXIPGrgjrXTEaKj6TI4Sg3nZSEQKmta6aPfsumx?=
 =?us-ascii?Q?Dx9+m1E4sjstAeBJmj3fyyyqKmGr23tUahQ8egwVdm66/SpyBfCs8UDs1xoI?=
 =?us-ascii?Q?JMiEhAXpUgctMv/NLfiWE4Ggn7rZREWrT5jSnp3t0UA+ewg0iNFVSXlNAyxR?=
 =?us-ascii?Q?LRi+AXCSJMih1FLk1iRXoZBuS2es4ljVOPVMHcE61YsuX5+hXhd7Ybqe/VDQ?=
 =?us-ascii?Q?4QAt8GE1YcD1YejIRT9ychdx/lS7tWu8eEQIp+InLwXL8fRgsj5stpdPEI4c?=
 =?us-ascii?Q?rGJAnhF+EXiK4prChLgTAi8NXfQmPB27tYXBNgMgLAXWgwFzaqXEAYwmG4Tl?=
 =?us-ascii?Q?Pt1a1plCkg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08863ead-1dde-46d6-5af9-08da3d9a5b44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:39.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IdVlF0t6MVNX4r/+J0EPurk+ITgLQRx0soxwgscjn0IlcH/Mni6n1M7CYOqggZcpzBv8Hgnpwf8lzmFQVkldw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=781 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-GUID: MRyTez3D3sajW8KTZYUPrJenfyFt75G_
X-Proofpoint-ORIG-GUID: MRyTez3D3sajW8KTZYUPrJenfyFt75G_
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

Hi,

This is v10 of the server side changes to enable vfio-user in QEMU.

Thank you for reviewing and sharing your feedback for the previous
revision. We have addressed your comments in this revision.

We have dropped the following patches in this series:
  - tests/avocado: Specify target VM argument to helper routines
  - configure: require cmake 3.19 or newer
  - vfio-user: avocado tests for vfio-user

We have also made the following changes:
  [PATCH v10 1/14] qdev: unplug blocker for devices
    - updated functions comments for unplug blockers in hw/qdev-core.h

  [PATCH v10 4/14] vfio-user: build library
    - uses meson build system to build libvfio-user library
    - dropped ubuntu CI build

  [PATCH v10 5/14] vfio-user: define vfio-user-server object
    - updated comments for VfioUserServerProperties in qapi/qom.json

  [PATCH v10 6/14] vfio-user: instantiate vfio-user context
    - added comments to vfu_object_init_ctx() explaining function contract

  [PATCH v10 8/14] vfio-user: run vfio-user context
    - vfu_object_ctx_run() asserts that VfuObject->device is not NULL
    - added a comment to vfu_object_ctx_run() explaining why
      VfuObject->device wouldn't be NULL

Thank you very much!

Jagannathan Raman (14):
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device

 configure                               |  17 +
 meson.build                             |  23 +-
 qapi/misc.json                          |  31 +
 qapi/qom.json                           |  20 +-
 include/exec/memory.h                   |   3 +
 include/hw/pci/pci.h                    |  13 +
 include/hw/qdev-core.h                  |  29 +
 include/hw/remote/iommu.h               |  40 ++
 include/hw/remote/machine.h             |   4 +
 include/hw/remote/vfio-user-obj.h       |   6 +
 hw/core/qdev.c                          |  24 +
 hw/pci/msi.c                            |  16 +-
 hw/pci/msix.c                           |  10 +-
 hw/pci/pci.c                            |  13 +
 hw/remote/iommu.c                       | 131 ++++
 hw/remote/machine.c                     |  88 ++-
 hw/remote/vfio-user-obj.c               | 914 ++++++++++++++++++++++++
 softmmu/physmem.c                       |   4 +-
 softmmu/qdev-monitor.c                  |   4 +
 stubs/vfio-user-obj.c                   |   6 +
 tests/qtest/fuzz/generic_fuzz.c         |   9 +-
 .gitlab-ci.d/buildtest.yml              |   1 +
 .gitmodules                             |   3 +
 Kconfig.host                            |   4 +
 MAINTAINERS                             |   5 +
 hw/remote/Kconfig                       |   4 +
 hw/remote/meson.build                   |   4 +
 hw/remote/trace-events                  |  11 +
 meson_options.txt                       |   2 +
 stubs/meson.build                       |   1 +
 subprojects/libvfio-user                |   1 +
 tests/docker/dockerfiles/centos8.docker |   2 +
 32 files changed, 1424 insertions(+), 19 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user

-- 
2.20.1


