Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90145518673
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:19:21 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltN2-000299-BE
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLF-0007w4-BG
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLC-0001Ob-T7
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243B7SdB013665;
 Tue, 3 May 2022 14:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kjvFJIOvwys/UVuFncNELqzdH3RbWKhIth7UDqDKcFU=;
 b=aX/wVVTDHoN2yyGyRu+f1GK2ZVmjo8ru7baZ6FvfxF/GJBLKxDA2Qfymy+oaEZGss7X1
 IzrwCl53s0gQqcQA5yzNUsE2K34WzujR3QQf44JvoqztQCNG3RG6txsiUbMtlsFz8pkB
 9sNwNSkHNTp3LcF/ZQL4s8andIkCWRQdskXvWKzwLYcMbkKitJSUWZyvtwCIEEFhcxjH
 UehGoC3fqkQJb7PdP57AMRbZkNjUfv/4z5s1bYHC2nlbBDgZWQKQcNGGxLjSp0Q5RvgM
 i5pVw3vCR+69JoCbIItcfReKBeeCYGAMcre67CwXriSuJKtvO2Biy0TP4PGLCIgm9dqI 2w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsdtg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:24 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGRg2001680; Tue, 3 May 2022 14:17:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj91k3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOFRgVS8GZYTbH7j391kfpNCuhupkSpCdYqU6YnqD5j+vn7+z3CQL1z/y/356K4P+W3PotPoQQlrbS5RVRpmtBf1SatjW91Vul4I4m0uoC55OQvbxQI6gT4qJv89DN5Sibn1s++RsbBDXR4dVGJsyM/5oAQYq67rnLUzSkfDvLs7itV/Ljyc9ihnHhIU5XELA+zIgbml6YoYMS7ElSJ3V5CGjduDGIFZ1uMHjWHXDmFmjxff9pnAnpHoKtUaBt+Q1g/cItpgDY+fewOvstB+zTrovkk25QxIjrE34M6rd9bmzcKGy6rIGKlpb1q67HVqsHM++w/dO6M4ZUnMR+099w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjvFJIOvwys/UVuFncNELqzdH3RbWKhIth7UDqDKcFU=;
 b=OU6GthxG5j3xPdj9TZWW6Bpb/Vxgywb7/dGjKFhIHs6rB6XsBkvyIXrodMNIOWtJL81pBV5stLe9vIxOX7rjxk71v2VK0DUaMLeKutvUmZDjQRto0uOJUiqD9f0K2tCNqwH+drySr85SkKQ3PQI+y5ueMEV6HVSsV74sYcKUwbLexk+3Fxkj5eh05aEnT5DrqBNGOXBmM9uEQobyksBqK0q2HPvKs8hWnPG/0l6RNxZdKWMtWEnC9IEmI8UgoNxKmHeqcewo49KYFQUGTuKhBVtEc3pBRF3nzTk+dADeJMQwf8QFTqQqvk3jysxUAcuSDt5NcSOkatq+OL7eQP7p0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjvFJIOvwys/UVuFncNELqzdH3RbWKhIth7UDqDKcFU=;
 b=VAev19X/L1us6t7SPa8Q3s4/OEQ5ztUc2QmiJxWPM7otK9kl6h9VQ9BBIaZ+0ziFHllentiGrHNkR8XW5nue+dD0johSbe3b4SyJPUR5LG1hEJ0ct8eQNAh8gTiukjEdwdEq3ZSJlDipWxKh2RfCFNw++tTXqnnRCQ2MQNNha3M=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:21 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:21 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Date: Tue,  3 May 2022 10:16:48 -0400
Message-Id: <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd426cfa-393a-4aa3-0b12-08da2d0fa35c
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33587A944A1B3E2F2336702690C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYQuJldPmVxsXoaXyiZkVNgwKxySas8rTgyL3dqTRhtDfLux34kIUj/AelbDLWV0uozF1CZYJ9lVmUNP1JQzFNxqrtMJXk3qsllLdvzjOg7qF0Rk6lBd8cok2MEtTxpYCPJuqv9mBkZkSx+iGGwpzYYlzEvVAc8chVAVUyLsNDPtf7HJLXlsqXSTRMuizpO65IysU8KCRK85oTkZb5PzR8B+ey6SjsIHlKqYpAsmTSOBbHtvtI60Dv4uXZ2DkP6BVg/8p/ocf8bY/GvnP0GitKejA4aLePM0FGjmZraKzr4TQKomYxgCmwK8OJ9KiZ4n+UHaxevkvHDB2hveCulNbkmdf1bg4ZhrUCVdrsvLKq19uZiXaugRv4qfGwAs4AVm+g2uIxpsgTVoEYsxjtZ5VQnqjGRegxVv+mJsmuxGzs2y+2u9l1ELEICVYiRgJUlmBa1QDqmQ5LgaSyjdG/atEqYgn4np/cNC5vx2ynCrSWO4IQS1mgC1U3SiJ5CCEhpLryywz8FZW+cHaSX692OzLEfnSb16TwVWzmk61box0c7dT16E+HccSN3kEEjf6wL4Hq1z2QjmYElnNpjI1OEc3dxLFEhXIp5jW6dcxYgs5u2jxMMT7onat3tZ4ifIhmPzbf0aCSnqBkWwuqFg+DdCsRa5Rl2skxhOvL6chiJMFuhmq291dSAkiHEn5fPmCBk0G9EOKUUDThwwXH+dFpM97Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(30864003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmN6WU9VMEFybkhqRDVFdnJuMjBtQmFocmZvSy9ML2ZDTUl1QUh4dlhnT0Yx?=
 =?utf-8?B?dDdJSmVQbTRmT0tXYnlPMUJxRWs3TktwWUY2VitLZEllLytYY255UkErbGZL?=
 =?utf-8?B?bFpzUHVaN2ZhSEpFelppTUhDVE5GT2hLaHJaMWRYVHhlMTZLS1ZKL2p5YTJW?=
 =?utf-8?B?R2duVjBvbUduY3VYbTF3ZXdNT1hueitVZ2paOCsrd0FUQUFhdWRkNG5vWmg4?=
 =?utf-8?B?b3U5VVlVdVVWUXN1SUptL0NQdXBJcDNNMmxmTitwWitnNTE3cVQ3eTRoTDE4?=
 =?utf-8?B?YlFkeE0zSjF2ZnNIc0w3STNGRG82V0MrVjZTbDIweWV3eDFaSnNrWGpGVXpN?=
 =?utf-8?B?bXlPUHRBOTBiV0ZEcXhHcG1tV1hWSm1XOUNFZ1BrQWh2VndpSVNldDYyQWRp?=
 =?utf-8?B?TDFHMG5md0J6VGxPamlaVFJudkMyeDFhbTNaeThHRjNVbkwwMVh6Q0xmVjg5?=
 =?utf-8?B?NVcxcldWdzNkamxQWU10aFMxaG03dmY1b2NuaVAvQzdQWTVFa1NPeklHM0JJ?=
 =?utf-8?B?YzZwZEdaeTNOMFNlZ3lEc3dMMld2b1F3azIwaCtFNnBZemxnZGxiV2RTYXdZ?=
 =?utf-8?B?andIdDIwQW5XWnl1bW4zM05rOGN0TU5icnArWFQycEhGc05NUUpkY0lMelY2?=
 =?utf-8?B?c1Q0MThrcjFPcDBHTHgwVjNwMDl3YklFWC9SREIrU0Z3QThQajBYWFhoQmlp?=
 =?utf-8?B?VCtDdW56aWVnZUp2QXY0d2ZPbHlYOWpCbnBKWHBaSERoaC84WHJkUDlpQTdE?=
 =?utf-8?B?cTFyUU4wNEpDZlhXdWFrcU56a1k0SzFHOTB4anNiSnZ6dDdhUi9LdGkwT0ti?=
 =?utf-8?B?Zit6aHM3cFZuMzYxMit5anpGck54NWZaVFpzOEIvWjJmeFBOa082MFNpS242?=
 =?utf-8?B?YUE3aTlUejVuTjVtLzB3RmowL1I3NnBuWUUrUDJIK0YyRE95K3NTcndaelM5?=
 =?utf-8?B?NWZRUGR3RzV5OHFWWWRpN0FwazgvR1ZVUDduZlQvekl1YmZsWWJ2bDlldXJn?=
 =?utf-8?B?V21TTXJ0VS9PTWRRMHhjZSs1eUpPZXc3SWVQRHdRQzE5NDBZS21DaUwrUFlR?=
 =?utf-8?B?R1pqaVRQWVJjNmdDbHdLUitrYkRuQlgwTWN4SmpoMFgvdWpJdkN0WlUrejUv?=
 =?utf-8?B?cmJSRmxmT3ozV2N5QW5EOEhUUGcycXMxdGtrZlNCWmZraWJ6WkxFM2Vwaytu?=
 =?utf-8?B?YmZoOHBDZmNKejVaRDE2N01sUTA4d3JONHFPUHIvMUdFL0RWTlM4Rmt3VzFi?=
 =?utf-8?B?WExKVWdhQkV4RWh5UUR2OFZuZlRwbkJuOEc3dEFrTHhqbmpkVTFzSUlHWUlI?=
 =?utf-8?B?bWI0VGtXc1FpdkNvdlhaTkpGL2lJTWxMd2sxQ2cySHZlVm1LVm9YbmNUQTly?=
 =?utf-8?B?T1lpNHdUQUJIbGY4UFM1VzZkM2c1bS9FSXFGMExiRmVOdDRubXQ0R2VBa0hj?=
 =?utf-8?B?ZDg2R0VmTVNQTkpITWpLOHI0NUdHRzJxM09kZHBNcjlqRjZSeEFPUlV5SHQr?=
 =?utf-8?B?UzdMcEM3WlRuMGc5OXg1YmRtNElPc3NvdVI1VWcwVE90NmpSTHkvaGRacnFM?=
 =?utf-8?B?ZGpId3pmOENaZVNhakxGQjdXcUNFWmFMY1BDQmpXdWVGeFI1S1Y4T3JVZlpE?=
 =?utf-8?B?L00yNzAzRzVTR3BxL3cybFpLV2l0WExxeXFCalVWandkZ1AwV1BRbG80TmhC?=
 =?utf-8?B?aHZ1KzY5a0VHMWFxY2JZR0lPVVZHOHcwMEZTaVdEekZhQXBjQ3RRMS9XbG1w?=
 =?utf-8?B?eXV1aW9DUDFuMG5HT2FvVEVLcVhBNjFxVjNiMkdiT2txNmt4bjNOY1RWU3NR?=
 =?utf-8?B?RFpmaDYzWUJramk2ZDRUV2NaYkRUVVZocG8yS016VU41TjFNVjBjT1pFYmNR?=
 =?utf-8?B?SDgyVGRhWjkzYzNlSkR5dFBuMnVPYkdPeHFBZ1BKc3BFajJjTEdBd3pqSDdM?=
 =?utf-8?B?NGljUjFDQWIrRmllQ3BWeUxFUGlJVXRrYnhNZ0JXRm9ONUN1M2V5dVJiNzRx?=
 =?utf-8?B?dTBwdjd6U1AzdHloSFR2UnF5a1k1YSt3d1lsY3dleHV6YmY3cy9sS1ZXVUE5?=
 =?utf-8?B?cDRIV3hnNXgzcWs3eFd3b2NDQXg4K0VwZVowekhadlJncmJYaDJoRW1RKzZp?=
 =?utf-8?B?RWNjVE5jTjBGR2VCWk9ncFVCM3JMQVlMV1I2UmVsaURlbFoySnE0V3lRVG1w?=
 =?utf-8?B?WUtEcFc3TW40NXp2WnFLbk1Sc1p0TkdpOTFjdzI2TkFMdWwxVm43ZGw2YTlC?=
 =?utf-8?B?N2pQclgxNmJJRFNwdVdza3JtckNIc056S05zRW9vZEhKZVhsazBMM1NMOXpT?=
 =?utf-8?B?WmM1d0VDc2RqT0xSK2JKdmhZaG92T0tEa01kZ2dzYXhxOTRHandlQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd426cfa-393a-4aa3-0b12-08da2d0fa35c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:21.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZwqZGzJ/8hZcD//+PaEKMrPyN5vxG8dSpxmN27vqau4ucWAND0jRGwNo1+PLPni0bMBdYJREUI4evFifiMlcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-GUID: JjP9VKYrJRD4L3CULnrlLPI3zwXT4mxO
X-Proofpoint-ORIG-GUID: JjP9VKYrJRD4L3CULnrlLPI3zwXT4mxO
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   2 +
 hw/remote/machine.c         |  27 +++++
 hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 262 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..582def0522 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -703,6 +703,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfio-user library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -842,7 +856,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -905,7 +920,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 8d0fa98d33..ac32fda387 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -24,6 +24,8 @@ struct RemoteMachineState {
     RemoteIOHubState iohub;
 
     bool vfio_user;
+
+    bool auto_shutdown;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9f3cdc55c3..4d008ed721 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -77,6 +77,28 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
     s->vfio_user = value;
 }
 
+static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->auto_shutdown;
+}
+
+static void remote_machine_set_auto_shutdown(Object *obj, bool value,
+                                             Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = value;
+}
+
+static void remote_machine_instance_init(Object *obj)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = true;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -90,12 +112,17 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
                                    remote_machine_set_vfio_user);
+
+    object_class_property_add_bool(oc, "auto-shutdown",
+                                   remote_machine_get_auto_shutdown,
+                                   remote_machine_set_auto_shutdown);
 }
 
 static const TypeInfo remote_machine = {
     .name = TYPE_REMOTE_MACHINE,
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
+    .instance_init = remote_machine_instance_init,
     .class_init = remote_machine_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..bc49adcc27
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,210 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on,auto-shutdown=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
+    {                                                                     \
+        if (vfu_object_auto_shutdown()) {                                 \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
+        } else {                                                          \
+            error_report((fmt), ## __VA_ARGS__);                          \
+        }                                                                 \
+    }                                                                     \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static bool vfu_object_auto_shutdown(void)
+{
+    bool auto_shutdown = true;
+    Error *local_err = NULL;
+
+    if (!current_machine) {
+        return auto_shutdown;
+    }
+
+    auto_shutdown = object_property_get_bool(OBJECT(current_machine),
+                                             "auto-shutdown",
+                                             &local_err);
+
+    /*
+     * local_err would be set if no such property exists - safe to ignore.
+     * Unlikely scenario as auto-shutdown is always defined for
+     * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
+     * TYPE_REMOTE_MACHINE
+     */
+    if (local_err) {
+        auto_shutdown = true;
+        error_free(local_err);
+    }
+
+    return auto_shutdown;
+}
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && vfu_object_auto_shutdown()) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 84b0e019e8..1b5719cd89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3599,6 +3599,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


