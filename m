Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E396F6ACE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:04:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXgd-0000Wb-EL; Thu, 04 May 2023 08:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1puXgZ-0000Vj-FJ; Thu, 04 May 2023 08:03:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1puXgW-0000MC-R1; Thu, 04 May 2023 08:03:46 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34444Jh6009035; Thu, 4 May 2023 12:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=FcDPVvJyRn47DXWCMVeXel4ng4zzJLG1mCfoXx7+KOw=;
 b=IgwalFr4tEEt6ZWjaTK6j9O0nHM98URT3LhDLR4+d8Hj6wqXKzOkvOZMdAUkcReDeIS4
 /MwyyiPUsE/6ve+yRgWsR1CPOrCIf4TKX+YqDDn0FtbOjLyB0db1xdyiG94j5LaimP/1
 5jyA1m4qWK4jDndJCUZvFfUb2b8qC1axrDz+k33u+YBUQaZ24CEPwpqFK/OsXKsSnJAR
 Dt+3HvM4aTeQjJ4oKJcZ1JJX6do6dH+ogqFlAARBH6MAMmD2WehPzN0uFz4CEYtdPnb5
 wMe2M7jpDbZEqx/YSpKHAwf2fg/borMgO6aGeCFaW4ka2GGOFfaNrLISvJnjQm1sD2Y/ Wg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q8u9d1rxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:03:38 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 344AAj7F024917; Thu, 4 May 2023 12:03:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3q8sp8m233-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 May 2023 12:03:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiXHgfSd+ZT0TrcDO3LakzEe7r7rm+RJg/GGvHJqRgipRqJoOccph5AlPd/ovoEBjaoKCXT7/Q8MhtnTnMSGwFUs7oOejXUQ7Ze1y+BMSXprxsRvey6hdtdC3PdSTb2fJc14DE0Yzg9MxsDEh/Cptw9/KVhJoLjdmFGjDOtpHLJrG20MZf3XQq2ZPpPP0NvVUy85ZpLhZ9bomu5SaF4bDwPXsDpsAfdCDD6pP0KwyRAOuwtXM9ownJpkXD8z3zEZwcGzgmG0wRdhhJ2q+ReAJcbcCzos3WbotAM12iFr8yzqCMAEczK6kBZISbVliPF2kzjNxDHDpWcoE1tditQwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcDPVvJyRn47DXWCMVeXel4ng4zzJLG1mCfoXx7+KOw=;
 b=YTmbCHMG2JTUILSu9lo2IhdPyt86wRyErzoT+eecHiATXWg3R+UU0V8tj2HJOfE6b2b5OsDhgpH3+m7t7Gu9E2b/b4zUT2jsyJNkkTuovrcl2m8yh9lh2Ux31o2KouwCprMu2MN6C9835CD89MjXmjOko1gLl2+IZhbQZbm4LBVtyIsLbBS/VI0OQl7eq/zQ4b8CwCxaIXo8jipWBJqk3ieVvSw+sJs7rvoiILmM1rhFumx60hCT0IFcM8QbgI89+3pagTPL9dTeP0Um0mQGbPADfUBgi7QDXY3LKJzOXQ1Qf8ZWGmkav4l8p5NRoUOkdiTZ+9q8zVxtJ89RVZ8u8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcDPVvJyRn47DXWCMVeXel4ng4zzJLG1mCfoXx7+KOw=;
 b=zrMzFUlghBeUhOeoHUQMrEd43hRW/7VZf5Pr8KF/935zVBPBgErFYWlQjLzHNqEPsyIRoeRVViqhGAdkRiUCTHpizsyGyRXl8GbniWKflIMagn6M4P0+vsT1OwyFFiZVJzfBRuEikLG+EAJEjqdsusyTZnwEFLtgaLsb6f/B0LM=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by IA0PR10MB7369.namprd10.prod.outlook.com (2603:10b6:208:40e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 12:03:12 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8ed9:9d1:444a:c3d1]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8ed9:9d1:444a:c3d1%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:03:12 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mauro
 Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, "open
 list:PReP" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v10 7/8] raven: disable reentrancy detection for iomem
In-Reply-To: <20230427211013.2994127-8-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-8-alxndr@bu.edu>
Date: Thu, 04 May 2023 13:03:07 +0100
Message-ID: <m2lei4mhhg.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|IA0PR10MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 3979314f-9676-4f8e-ff60-08db4c9788b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1kj8HclW5E5N4+ZRNUYzT4NsHHYLEuB+85wFCIoOTBceB/P+qAOC5kjS89m0p4SgkenwMdJvOAe+coxP3bNt/4Qcrf46MPJRNJ04FADZgH38RwD3AAPGuy1ZsYAcC5AWoeKpxw6ve+oBo4uzwx+WnLLawJ89oaq4tA9oOhBmGpooU2T+I4ocLIk+D+Nb6AwkmcfRSyN+w7L/qnfEyTgUdlZRS3s+qctrfglPJds9jh+IFakjToCvl+c1njLsPAgJk8EXUGhyDQbC9vzjYXPTP1K9c6ecU1yR2a4QfRlXrE66702zChneBEDlCtEBhjUioMSDtTw6rRThPOTtnVX3dn3Mxik9D9vCpAV2LJWdDfl91ks2rjNLEIN0Xr2Fb3KJfOIRyneUl8RqIVHqGq6UXVsnBPjo+EOjZkbKNAVdLNG0dtF2hkX+JTpBNuMPzS3yF4fVCyYXNVMaO55vVe4/4Hg5acs00N/frkuCbG80JDfRNDzIyDwcVTW44vKwBYmdcPzA/0QfKJSTqMOmgfN9kuqjY6Q6CdHYoJjhzL1NdenQaMDexL8bHvcKmmzHg4Lj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(8676002)(8936002)(6506007)(6512007)(26005)(2616005)(7416002)(36756003)(2906002)(44832011)(83380400001)(478600001)(6666004)(41300700001)(6486002)(54906003)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(86362001)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qr/0J3b8iCrIHRpyS1yww7KPYlniJY3tHYEWGuHALlBdsmlwFNPtbq+MGcZC?=
 =?us-ascii?Q?ZWtGSsZWCgEM26yFhF22Gi2+/r5oTjf5hxeMy8XgzbEUNVPYJThIOZXpsqtU?=
 =?us-ascii?Q?MVdY2xuOx+6fCoL+7oqrExGzKsa6BnFtka9+JUgSxCog8OXwXVwvd9ZEZRLI?=
 =?us-ascii?Q?SJuJkm5f2v2wbhGzMi+LDbig3ToOxsdkntZy6U5guhbGSxEjgwwDKwxqmJs5?=
 =?us-ascii?Q?4zTxis3hbm76BYdWnZp/tLrjE8NYv6xvXLOD5oz9RCChEZZEfZVNfa17WJTr?=
 =?us-ascii?Q?P6UlmYlgyXQ5K1+t2EhOBHhVOKqg1YHyZqfHCzUD86OaaANIJFmmkBHVf7d+?=
 =?us-ascii?Q?4JxnAQy/PNjtAMaPkfZPqVhKqXEz6nvNxRtTYr+rnhTZsvOHpIAIYQVazTHo?=
 =?us-ascii?Q?X7lr6stQh5ZTBHJcLLXVcyPabcObT+Db7BT7u2/ThXmje0xEtqjewdWuW58r?=
 =?us-ascii?Q?FowIObDLPHyOBS9hOCJmmBYz243dLyOlMoWj7Ad+7hkwqGW65iO67X4vdRWG?=
 =?us-ascii?Q?t40jh4421xTVtqP1PTZvGE0OmkS3bM8z9pv25pcgfzdTngyOpifq8qfe83lA?=
 =?us-ascii?Q?bbMVr4Po2gtY7aqSPm065AMFSLu7U+0HCctpZ193edHRc+CKc5nFpNvkucJR?=
 =?us-ascii?Q?MS2W2svPdAUHxUMLBpKlP4PDdFI+4f1GuGxa1HcEEuav/kSExRzaZpUUffFb?=
 =?us-ascii?Q?zewrhWryrJE2kw9t2FGjgr8QQOAjuE0wrAsMsef3A06jtk6tBVjW1h+7DueI?=
 =?us-ascii?Q?wNKw4ZQQUhWTPpib0HQewAuwBVFuPxio1HCvxr2VybHtX3V/SBISOf+e0Bid?=
 =?us-ascii?Q?/RXw8qSbXxM9Nzj/j0jOHDdYRxaGEPyEjIOAgAeuO1329ocQVrMUmH1lzmzu?=
 =?us-ascii?Q?LpR+fGg9Us2JYwrE/S5enT6d/lteWZBfrSGGlsaauxFCbM8w98Cwjg6BquJg?=
 =?us-ascii?Q?XvXUZVUwRwxfnmTev4kVdxX+qr+9lggPuc71RO6aEfgzni7EzkyRWI5osT+A?=
 =?us-ascii?Q?Af9ho38L+htgMpiP8lf6aX+3C22jpdMB62Gzl/oHIuXfHBQl3gcQNdqKHdwb?=
 =?us-ascii?Q?PEmVOHoIt2ScvFT2mg8bGWQjtNxRYBqJBYOMQWedOulPad1I5luuM75N9aet?=
 =?us-ascii?Q?/thUG4EqRVWiZyW9sNuhSlhpCJ+mzYyW7Pxl+thcbikm35a22MOWuvnbkByo?=
 =?us-ascii?Q?uYVQ2bKTJHBxB+ZHlGH9EUTntu5qoHUX6GwVxRTmiSGZndKdOgLt+45+rqJQ?=
 =?us-ascii?Q?BnY6lQw7UwgQekOoWGaMiNX/2XTwpHvwtITVZqbWmIvVqrkf7lZsclptcvRf?=
 =?us-ascii?Q?UDRP7vGarPN/xYNITPidx78ol/VCGbif9FdUzz7DAb8zWyhsL4f65tl1c6m6?=
 =?us-ascii?Q?Villxfq+lwoeG81xbDLBEC8DRaLqfRvrDsfRpKUSPuVn/lHXyD8K2NSR0VPh?=
 =?us-ascii?Q?KvChR3C+9uwVjwBSjb1NS3ol/MAmSzhAgsN3tAoGRLkHzc1l1mV3jKR0OkHZ?=
 =?us-ascii?Q?y5DtDiCXKUSdGzpx+GJ5aNKDkdv/Ok8yu1Hzebl1xMbX6t5WurMCOb/6rFi3?=
 =?us-ascii?Q?qZxf/rViXOzuq1AMlOWwH0E2fFK5CuzEDWjLsJtobuCXFQiy3WPW1OEdKji6?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?H8zkUJMF5SnvwV5ZlE1jta59KyUgoUU6NCN6sFCGToZVd/J5KjdBbZgac1B4?=
 =?us-ascii?Q?daQQRMvSN+h7uYdpAUMXFMZj4Ni9rfIsJPKFx+lweFO0PloFDWVMB+PoQnzk?=
 =?us-ascii?Q?R3KbwaF+4otBPqgJumfQoBJVuVg56spsKucosQ4jgwUh/P9QkKFWMHMFCq2w?=
 =?us-ascii?Q?a9Mrmz2gnQgftpUtAUo9j727qCMBaIdNEQ5kcMm5sFPzthlwQFywA1ruCjga?=
 =?us-ascii?Q?x2WMYKmr7vNsNX+xmxtVdAxeSiQQmZ3wz1ZO5uB0GIRV7U28/fanY7Dv898u?=
 =?us-ascii?Q?vPE+hH07ycqfBD5RI8TpH2WT3fHneltpIEg+RcQjIf1JarqVsYvggTMbmbtl?=
 =?us-ascii?Q?kgnB7C8j4bzHAfCXCtPVXMutf7OSkeFUTQ9+Adk/7aUPykHPKY+TxFLy80Yn?=
 =?us-ascii?Q?l4OQkBX74Lrcfzj1YK4RXp1C9WH0wt9f9uNZ+3yvDBEH8GYMiLiG4eyW6ROu?=
 =?us-ascii?Q?MS3Tnj+hXwKsZ4kmLd4Yau+BlHvNwSMQRY+2R8LJA3xEposoGagXGz3AZTXB?=
 =?us-ascii?Q?J+3sX0AHNh+Dw+cjOT7nTWjhGc395R9pabHLPA0j+Qz1B4kqtZVuLvaOzoWH?=
 =?us-ascii?Q?iBzAAodOQwdFsD62wfW64+AZTWtnlkNBu0Hqf+C45PNPdsYiRYtCKANDR3aa?=
 =?us-ascii?Q?Oihe9mBxfBTrlKaMC4v+SnBqnyLrx+dujEpOwpwTezNMJ1rjXJ+wy+s/ysJN?=
 =?us-ascii?Q?YAxrR1SOzrUTPUhy41Idu/hD1oU2i+mf2bg+TPWQQzRAkJkhtNEPB9RVwnFt?=
 =?us-ascii?Q?7kZPopRnLo5PyEpBRYWVQ1sf+YdtQDv6E24KGakCTMgUdsa+iczzTvcRMTFR?=
 =?us-ascii?Q?kyd6WgKQBu0+9BYGqQQ0xLYpeKNfCvkbGQuc5EXoxW7shjZzBSv8foe7Rquq?=
 =?us-ascii?Q?nO8KsluHdLOm4G44qWLaVR3yx9ues8nWClpNpOcMd1xhK7ooSBiubu0OeUu9?=
 =?us-ascii?Q?T+hPOfYuwz6Yw4Dxr3J/eRL8MK8GL4chezCwrEGOIro=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3979314f-9676-4f8e-ff60-08db4c9788b9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:03:12.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/vDiIAT3/SitEGLe3xohOGD3p27ZF2x6qk2aocmiF+acyE/6N16ioYjehKu8dvGdMJxpT86OWX9+eqfLmj69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_08,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040099
X-Proofpoint-GUID: ydtjA2MSBR1ifBo7N3E-TfWSFdNn13W3
X-Proofpoint-ORIG-GUID: ydtjA2MSBR1ifBo7N3E-TfWSFdNn13W3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, 2023-04-27 at 17:10:12 -04, Alexander Bulekov wrote:
> As the code is designed for re-entrant calls from raven_io_ops to
> pci-conf, mark raven_io_ops as reentrancy-safe.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  hw/pci-host/raven.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
> index 072ffe3c5e..9a11ac4b2b 100644
> --- a/hw/pci-host/raven.c
> +++ b/hw/pci-host/raven.c
> @@ -294,6 +294,13 @@ static void raven_pcihost_initfn(Object *obj)
>      memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
>      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
>  
> +    /*
> +     * Raven's raven_io_ops use the address-space API to access pci-conf-idx
> +     * (which is also owned by the raven device). As such, mark the
> +     * pci_io_non_contiguous as re-entrancy safe.
> +     */
> +    s->pci_io_non_contiguous.disable_reentrancy_guard = true;
> +
>      /* CPU address space */
>      memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
>                                  &s->pci_io);
> -- 
> 2.39.0

