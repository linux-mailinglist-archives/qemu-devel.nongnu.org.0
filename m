Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8B542E0E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:43:01 +0200 (CEST)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyt9Q-0001Lw-24
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nyt4D-0006jb-OJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:37:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nyt48-0000uo-QE
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:37:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2589bFY0006530;
 Wed, 8 Jun 2022 10:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4XLPN3RqFWyDmEPciqm64UdI8uYnNBxKfyofrv05Mus=;
 b=d/peyPpqc57mbvfpr8UkONZNBfZFvmuEud0D0rdrZPzvygjroMFpxRhDft2sgEiAqjc3
 NCWmLGqg2rV+G+vrMJoAxgRZuNMZ7JReyNegcSJpMAIBVi/7infoWzZ5VaDL6cfWdFIR
 PiPljtccU55r2pZgo0cj+wsm4EtEGaG8E1w5/wjo+DRlSsDGE9w1/vqWQgphJSgttFRJ
 3fEm+s7Zzf4qL/KogJL+ml6aSEDBoFS98WgnBVUQxhMpxJ0DI+a2pTBLNHsx5hQlelf4
 IDpMQeFJylU/103FymrmhVseWXRhoFule6HCi6ZtTYExkTcOF3IoK4SIn29Ox6FT2jwD gw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexedhdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jun 2022 10:37:23 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 258AJpH7040722; Wed, 8 Jun 2022 10:37:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwu9gtse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jun 2022 10:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3I8ph2ZVeMioNJ+Dmrvdc/dQFExoParEUpajai1/ysT/OVN01IY1/FplzZ9hASwlS0QPshr7NDMLyn/NOJRAz0GQX2IXJ4aXgaPAq2bTAauedVKU9qZP357wyqyNdeHMlJ7WrJlcNYobvFDWmlgNVmJ9HdP+70u1FuyTJAjF0dFDf+hhaUe+4i39A8cn8G1HykmdUe6mYClv+xqQBIBFuE7Bbds0+J/IxbkMvkgmO4K20nl/zoUQjGuW5XxxPENKF57hY0DFhg7dbRQv5Gi5at1j5avPLekzALojHwHSAraWykPkqUAKMRnll/x/iKF9rKU6hKE909YNVUvTw5xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XLPN3RqFWyDmEPciqm64UdI8uYnNBxKfyofrv05Mus=;
 b=OJ6LxVCEwY0SJmBHw5wqfPt9SZWSWQamLLGbYL0mc1cosZ+QZXgF9V25C21dT0BBWZ/debIL1XlvLx6DVMtXA6ciRfVx8Gup6sLK/QsYvOfqhbZPtfQ+Elq9WGtJvBpEmpoIHH8dhLjNoKXHRrVVc3UBB7qeDRLgTlBEToyPdL961sr8HxABBy0d+1HnNFo+IfgNJ+az9wRSBkN4Cqx1muSzMH8Oxvry7S234nY+3k66/8ZuTkSeJv4uhOTC3tLVQ2V4xhRmpMa+u8pjSmodbdJdC/6PYxbnJF9EjBe+d0J6QSOO/QUKwACnVP/QYxbT2AysDY+bp+Jz3pt+9UU/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XLPN3RqFWyDmEPciqm64UdI8uYnNBxKfyofrv05Mus=;
 b=MlouDikEzq+n4wzi4LcC2Uecf1x2HjAYqYvO7cTF8Nms3QaHQlocNM6LCce+EO+6V7JXJ29DYw/GdHWi3haqukFlueFOoovktg6bmruuw1FURZ2UeC0C4nbcbmLT3ZDngYkowk1uGumk0umPcuU7LpejFYN22IDPXzP2W4H2/p4=
Received: from DS7PR10MB4846.namprd10.prod.outlook.com (2603:10b6:5:38c::24)
 by CO1PR10MB4658.namprd10.prod.outlook.com (2603:10b6:303:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 10:37:20 +0000
Received: from DS7PR10MB4846.namprd10.prod.outlook.com
 ([fe80::3105:6c6:de20:94f9]) by DS7PR10MB4846.namprd10.prod.outlook.com
 ([fe80::3105:6c6:de20:94f9%4]) with mapi id 15.20.5332.012; Wed, 8 Jun 2022
 10:37:20 +0000
Message-ID: <caf3bc27-4fa8-12b5-ba9a-4ad07aa082b7@oracle.com>
Date: Wed, 8 Jun 2022 11:37:12 +0100
Subject: Re: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:207:5::26) To DS7PR10MB4846.namprd10.prod.outlook.com
 (2603:10b6:5:38c::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 507874e5-5827-476d-c771-08da493add9b
X-MS-TrafficTypeDiagnostic: CO1PR10MB4658:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB46585B323955D30654BD6DEFBBA49@CO1PR10MB4658.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vta5+sX14tAQjNlXhPNIyjd80jhX/TuSebV3HhSKojbEbvYsl0/7ERzVde12+1J6RjuIP++h967XVlZNNRpkiJtCDet96S3zXnmylkPq40Rmdy/kUwSCWkZLdQw456clSeJoXUhXlwMVWYCm//nA6chcpWYPDcQqK5HL6KDZlsVlCuIPaCgCjxXNMNv2Gz4pyFx1jChIRm5Qf97t1wZAnZTp77LOnRmrJRAmpZOT2wCiP79Rx5SEViNbsfXXeuyN3A4WLTDSMuWOrI7jAPG2INCO+jvkyq32eSTAjHxHQAD3+gZfu3z0YMYXBSVBbhbw7TF7018vBZnuiQpMaVZaPIBS2RwVxAJzkHFo9QanGBFHp8MVaapnYkPXXpwikeYQZ7KOr3G0bDoJQj4ZBpCrpuucXsH9KFbtxTzmdDN0Fkckz4XAWG9G9T2ppVBvVEKZFGkNt5Ef5ObCcyKgbE7UFEBwU4FuOY34qor8Zm1b847iZceviR7MXEWJWueUgKvTUVB/mMooPdcCOxD9DkZNKBgnpELQkHVMiwT0XgqhmaEA1ZMA9P2sHQ4FeG2CHBgysCweb2azH166GvRQRmdPBPSQTWj7MKE8XDNrkSKATL9kHv6CCTTvKcZopoIDbh+Br7vqhm1hG4HdvW6+qCS62ChHmVWJMJzLqltMHO0Lfi+Mywh3YLsczYdRCXiyYyJ15XMleQJBVpI413JaU8E/jF7GRwQYwLijqdNpH4jHzcxS4OY+o4Hzv+p7+1mPWNHFI24h1h0QvSXWrz+U56AGZh85581FStlRqREpISGxj984nUt1ryMrBwiUP3htdgGnCfCjsemeAWy7cfMQRLVaL0kjHJL9XTsVE+Ot0XjUIr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4846.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(7416002)(86362001)(5660300002)(31696002)(38100700002)(54906003)(6916009)(508600001)(6486002)(2906002)(966005)(2616005)(6512007)(53546011)(31686004)(8676002)(6506007)(66556008)(4326008)(66476007)(186003)(26005)(316002)(66946007)(8936002)(36756003)(83380400001)(45980500001)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZsU3lmSSt0ZTNJaG1NbUNBUzFJVGdRbURMUUVxRnAxR2xFcjR4S1VnWFdZ?=
 =?utf-8?B?VnIwbW5sc09QWnBUeVNnUFFXbjluVmN1RVMyZk9lalRETlRObSt6dVBTeEJ3?=
 =?utf-8?B?UFdxcGZhVEYzeDdhMFNkZzNTTmx4NVkvVEd6UzczajZydzFHNkV0Y3h4NDho?=
 =?utf-8?B?VEhZVFh1K0pZZ0pnVnY3eVJnSEk0bEY0S0l4TEJEOGx3V3BiSk1xaHpxSVM2?=
 =?utf-8?B?OGNnaEo4K3JXVUY3Rk9HMlJIb243eGpkN2dTUWd6STR4Ykl5UXFVd05UQWxH?=
 =?utf-8?B?ZWlMSGJ5anZ2Y2hIb1RwUDhtU0pjMy80TjFmVUsyelZBMmhkMzRqVUdTWFY3?=
 =?utf-8?B?cHZzampqNkJ3cTVKdnVSeHhWQ0xSMEJFWFZhcVpsbXIzd01NR0ZjSzJMVDBq?=
 =?utf-8?B?TXFkb2ZqYWdIQTlta1A1bEdhOURUWk56TkFLLzVpUHF0UEdoUDE1QVA5UjVy?=
 =?utf-8?B?ZVlEbU02L2xtSkdTMUhQaEJLOWMyWkIvbDhvREsvUFNBSFZRNCs0aE55S3FP?=
 =?utf-8?B?cUJQb0hWU3orM0RROG5LNGdHdjk4c0FYMTRsRythYTRETVlBL2pjWDJ0aXM4?=
 =?utf-8?B?bU1zMU52RlZqUmNRWjIwV1dyUkJDams3NEZ3V3hrNThsWitiUmMyYndZWS9I?=
 =?utf-8?B?OS94VThGTFpGb3E0NWJCWGNFVzZCc1J3YkJKMG1ZRzFCNG5SR0g1R2lTMDBQ?=
 =?utf-8?B?TTZWVHRHOGJyWGN5dy9uMEhZaFZxSk5ibjBjRWErWWlOL1NqQTJ0QzVzbUdM?=
 =?utf-8?B?RDBuL3dWQklnZDlCMW9PRFhBcjR4QUFvZ0U3RlF0dS9rSHpxcXNTUGUyMGQ4?=
 =?utf-8?B?cEg5MHF0VXVwV1FtRUcyRmFYMXVzTlhMeG5WMzZjM0YrbXl1cVI0VnNsOWs3?=
 =?utf-8?B?T2RmL2pYbUVMWlVnS3VmMEsvZGQyRG5hS0ZibmVIMDNQR3pUUlBzaEhvNVJT?=
 =?utf-8?B?ams1SllaTXlCM3BWWkJjengxWndtNCt5NHV5NjBmQUtxSVVPeWZUWDVVYjdo?=
 =?utf-8?B?SWVNUzI2Y08rdzFueDJjRzNmelRmNFlZT24yS0FIbW9JUStjMUU1cUpRWnZz?=
 =?utf-8?B?KzhRNk1IM0pNSG5hNmFHR2lZTDVNODB4aW51bUxzUkhaSnZOSG5sazBvZyt0?=
 =?utf-8?B?UWJhV2llejgxai8yV2tMbXNCS1dzcTZ2bWxqUDJuUzVBYnYyWExqUnBYdUxJ?=
 =?utf-8?B?WXpKOTZITzRsRGpteEtuQ0REaHBWTy9ROGpZbDhYK0hEclhnZXJqR2hueWx4?=
 =?utf-8?B?dUFBRGsvTVlWRmNjZStMTTZZb1IraGdhZVRzb3Yxd29EY3VrbVZXWlFXR0Vz?=
 =?utf-8?B?bWNBdHAwR09PL1JkRE1ITGRkNmhDaXloTGtCL0Fsa0Z5ZkJCK01jR2N2RGlH?=
 =?utf-8?B?OExyb3VURVdHTGdVdis2ZFV3M1ZGZlVQdU9OdDVXd1FvS2EyVitXblpZaytU?=
 =?utf-8?B?elk0UDY4OTdzY011bGcwKytNZUhqUzBaNVFqQzVUOGU1alh4TFlVRzdXY0li?=
 =?utf-8?B?S01PYVducmt0Vk5JMEU5bmpOZnNyaGxWYnRqa0FRcHVrMDljT29CLzR4RzU1?=
 =?utf-8?B?OU9mYXN2aGxKNzQyK2wvbWxrU0M2bDZsS3I4TjFaN3gzRWU5ajF5OWdNaUt4?=
 =?utf-8?B?bVRuYy81SnNObzZiK09GRVRaUGNHSGZFUnVYZUdoc295ZFJBZElyUllXMzV1?=
 =?utf-8?B?YXZUbGZUWWVPNDhMYUR3Z3dSS2U3SlM4bEZMYVhpRVppcThtYXp6WkRVT2tj?=
 =?utf-8?B?MnlYY2FNMXBRZDViSCt2SW9sTVFvWHc5U0lZSnVqdkxJc0tlM1grY3BJdHRz?=
 =?utf-8?B?OHNaLzZ6SnUybGQ2eDlGT2QvdUIyaFdZRzJ6MWZKaVRYZUxWNTFoMHNJSTZF?=
 =?utf-8?B?cG15bXdKZVBGL2xEd09BVnpydWR1b1grdVlzbVZ5Q0gwdXVWVWh3RkNNU1hE?=
 =?utf-8?B?N3ZHTWFmVXhWSSt1eWtCaUdabytubEd0aU1ESFZIZy91V1VielBNc3JFWktF?=
 =?utf-8?B?SEJ6OENRSjRHR05SZ2xncDhyV1ljZ1NXanF3aHhSU2RML01Tdmx3V0lEdm9U?=
 =?utf-8?B?TFhua3ZJRlhtRkROUVM4TVV5NVRYbUlWVU9tMWhYK1NacldOQ0tWcWxkckNN?=
 =?utf-8?B?M2V2cVZUWmlzVy9OUkgvMjNrWDQvYkdzN3JpbkR6bzhQYXFlZURhUDdRZkZk?=
 =?utf-8?B?dkszaGpJYWxXcXRRU29OTXFKODdlOWsrUkNYTC9GQzZGb2c3Q3NNYTh4QjB3?=
 =?utf-8?B?UmoyN1FTTWQ3OGFLSzVvMlpURTFXZnA4eU8vYzJlcWZqSlRZS3R6UU1jODAz?=
 =?utf-8?B?SlYzOVFVbUFVWFJkOHNwMGVidmxMeVhoZjhoRkY4RGtOcmhqTXBOenpxWVA3?=
 =?utf-8?Q?ZpE55WEE2WxfLWrs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507874e5-5827-476d-c771-08da493add9b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4846.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 10:37:20.5014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtUFDRFIR7nzmZcoGDVc3oXaw3KaCXNAc6vGNPHNNEu0HZMLmQC/KjnosaIoItgqeDkCAQFyIHJLQdvsmc0VJTtcgglRCFqQvJM7kmS1e3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4658
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-08_03:2022-06-07,
 2022-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080045
X-Proofpoint-GUID: KT07t5JYqtHHGyZmbLW0uHPjH3bDHoVy
X-Proofpoint-ORIG-GUID: KT07t5JYqtHHGyZmbLW0uHPjH3bDHoVy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 5/20/22 11:45, Joao Martins wrote:
> v4[5] -> v5:
> * Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
> * Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
> commit message;
> 
> ---
> 
> This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
> particularly when running on AMD systems with an IOMMU.
> 
> Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
> will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
> affected by this extra validation. But AMD systems with IOMMU have a hole in
> the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
> here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
> section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.
> 
> VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
>  -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
> of the failure:
> 
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
> qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
> 	failed to setup container for group 258: memory listener initialization failed:
> 		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)
> 
> Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
> to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
> spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
> as documented on the links down below.
> 
> This small series tries to address that by dealing with this AMD-specific 1Tb hole,
> but rather than dealing like the 4G hole, it instead relocates RAM above 4G
> to be above the 1T if the maximum RAM range crosses the HT reserved range.
> It is organized as following:
> 
> patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
>          address of the 4G boundary
> 
> patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
> 	     to get accessing to pci_hole64_size. The actual pci-host
> 	     initialization is kept as is, only the qdev_new.
> 
> patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
> possible address acrosses the HT region. Errors out if the phys-bits is too
> low, which is only the case for >=1010G configurations or something that
> crosses the HT region.
> 
> patch 5: Ensure valid IOVAs only on new machine types, but not older
> ones (<= v7.0.0)
> 
> The 'consequence' of this approach is that we may need more than the default
> phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
> address, consequently needing 41 phys-bits as opposed to the default of 40
> (TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
> pick the right value of phys-bits (regardless of this series), so we warn in
> case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
> ram blocks, but it was mentioned over RFC that CMOS is only useful for very
> old seabios. 
> 
> Additionally, the reserved region is added to E820 if the relocation is done.
> 
> Alternative options considered (in RFC[0]):
> 
> a) Dealing with the 1T hole like the 4G hole -- which also represents what
> hardware closely does.
> 
> Thanks,
> 	Joao
> 

Ping?

> Older Changelog,
> 
> v3[4] -> v4[5]:
> (changes in patch 4 and 5 only)
> * Rebased to 7.1.0, hence move compat machine attribute to <= 7.0.0 versions
> * Check guest vCPU vendor rather than host CPU vendor (Michael Tsirkin)
> * Squash previous patch 5 into patch 4 to tie in the phys-bits check
>   into the relocate-4g-start logic: We now error out if the phys-bits
>   aren't enough on configurations that require above-4g ram relocation. (Michael Tsirkin)
> * Make the error message more explicit when phys-bits isn't enough to also
>   mention: "cannot avoid AMD HT range"
> * Add comments inside x86_update_above_4g_mem_start() explaining the
>   logic behind it. (Michael Tsirkin)
> * Tested on old guests old guests with Linux 2.6.32/3.10/4.14.35/4.1 based kernels
>   alongside Win2008/2K12/2K16/2K19 on configs spanning 1T and 2T (Michael Tsirkin)
>   Validated -numa topologies too as well as making sure qtests observe no regressions;
> 
>  Notes from v4:
> 
> * the machine attribute that enables this new logic (see last patch)
> is called ::enforce_valid_iova since the RFC. Let me know if folks think it
> is poorly named, and whether something a bit more obvious is preferred
> (e.g. ::amd_relocate_1t).
> 
> * @mst one of the comments you said was to add "host checks" in vdpa/vfio devices.
> In discussion with Alex and you over the last version of the patches it seems
> that we weren't keen on making this device-specific or behind any machine
> property flags (besides machine-compat). Just to reiterate there, making sure we do
> the above-4g relocation requiring properly sized phys-bits and AMD as vCPU
> vendor (as this series) already ensures thtat this is going to be right for
> offending configuration with VDPA/VFIO device that might be
> configured/hotplugged. Unless you were thinking that somehow vfio/vdpa devices
> start poking into machine-specific details when we fail to relocate due to the
> lack of phys-bits? Otherwise Qemu, just doesn't have enough information to tell
> what's a valid IOVA or not, in which case kernel vhost-iotlb/vhost-vdpa is the one
> that needs fixing (as VFIO did in v5.4).
> 
> RFCv2[3] -> v3[4]:
> 
> * Add missing brackets in single line statement, in patch 5 (David)
> * Change ranges printf to use PRIx64, in patch 5 (David)
> * Move the check to after changing above_4g_mem_start, in patch 5 (David)
> * Make the check generic and move it to pc_memory_init rather being specific
> to AMD, as the check is useful to capture invalid phys-bits
> configs (patch 5, Igor).
> * Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
> * Consider pci_hole64_size in patch 4 (Igor)
> * To consider pci_hole64_size in max used addr we need to get it from pci-host,
> so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
> qdev_new("q35") to be before pc_memory_init().
> * Consider sgx_epc.size in max used address, in patch 4 (Igor)
> * Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
> * Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
> due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.
> 
> RFC[0] -> RFCv2[3]:
> 
> * At Igor's suggestion in one of the patches I reworked the series enterily,
> and more or less as he was thinking it is far simpler to relocate the
> ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
> and less intrusive. (patch 1 & 2)
> * Check phys-bits is big enough prior to relocating (new patch 3)
> * Remove the machine property, and it's only internal and set by new machine
> version (Igor, patch 4).
> * Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
> * Add IOMMU SDM in the commit message (Igor, patch 2)
> 
> [0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
> [1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
> [2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
> [3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u
> [4] https://lore.kernel.org/all/20220223184455.9057-1-joao.m.martins@oracle.com/
> [5] https://lore.kernel.org/qemu-devel/20220420201138.23854-1-joao.m.martins@oracle.com/
> 
> Joao Martins (5):
>   hw/i386: add 4g boundary start to X86MachineState
>   i386/pc: create pci-host qdev prior to pc_memory_init()
>   i386/pc: pass pci_hole64_size to pc_memory_init()
>   i386/pc: relocate 4g start to 1T where applicable
>   i386/pc: restrict AMD only enforcing of valid IOVAs to new machine
>     type
> 
>  hw/i386/acpi-build.c         |   2 +-
>  hw/i386/pc.c                 | 126 +++++++++++++++++++++++++++++++++--
>  hw/i386/pc_piix.c            |  12 +++-
>  hw/i386/pc_q35.c             |  14 +++-
>  hw/i386/sgx.c                |   2 +-
>  hw/i386/x86.c                |   1 +
>  hw/pci-host/i440fx.c         |  10 ++-
>  include/hw/i386/pc.h         |   4 +-
>  include/hw/i386/x86.h        |   3 +
>  include/hw/pci-host/i440fx.h |   3 +-
>  10 files changed, 161 insertions(+), 16 deletions(-)
> 

