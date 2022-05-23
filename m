Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149D531575
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:17:18 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCcH-0002gS-KO
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ntCZq-0000bX-JN
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:14:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ntCZn-0005zI-QM
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:14:46 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NHDsdR022811;
 Mon, 23 May 2022 18:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=O0laprifVSCE7M62VwGAKbmFphvq3J78AqFGZ9P/M+Q=;
 b=VeNLAieayDZmzST8WQH738k5jNTAXHnC4lWFjx3DClow6cPVQrB5EiSfpWMsX0T2AhRQ
 MDRhRh9GiMO+PL6PcwWrfnnWlNBRLh7ytbGtHmu0/c8AICWH+NcBL9sbDV5m+0cLg4bY
 ZcEJPk4R7jZPjl62OuGQDg176/qJXZJa4cDfjQWhJmXnOu3TWLlbseMRXVho0xPiXEtL
 qCBEvq1SX71oIjBIP/UbP9C/PAtS9nFV4kDDadu6KVazbhrE5Ds6RpxvjgJdNTzSvgdP
 KKP166rUn+oCye8hZ9GlkfkUHugQfDtZiCUj8I64dJcaonSJEbJ3Fi+6/brrXJHG561g Yg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6rmtv65k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 18:14:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24NI9oNK033627; Mon, 23 May 2022 18:14:38 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8268h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 18:14:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyREe3kxODpTe9a052/xWCSbDi7S23d+zy4BKxbVeyp2dMjG9ZOAgnQd8PSPP9XCjHT44gQ9X2uoYQs+CSc6Dq6jl2gNdv6rkF4IZ6gwRt5Eg6QG/Un285e5eBMfcPx+A5JWIrTcv7/sGNeVJMElK914FnXLybhFZ79tnKzPgpdhctQd/YX78bSM4mhmGrxdnenQhr+4z5nH1acx5MDnKeR5yBf/Yxs0qZT5rlLylMWbSIP7zVNqgiyIQxk+XrrnW/QaF+NBnNd4I7sAyBFROtQMjxnEApkSw/ZeDTK7mfQeZsda25B2aMtP0Su1BAADaCtTGpSLZ/jABuxVUsF9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0laprifVSCE7M62VwGAKbmFphvq3J78AqFGZ9P/M+Q=;
 b=BLCrI1hzzLLFGoLBwSEt/Al4i9TKRZTQED7wdR+cp04y1rjQoO7aQZiyTadXDyV8PfwxQMQPfzqtfQecr8fePH1L+2zoU3WqBz1VqQSM/My1USmGdN0jNs3pl6wnDhGruIkcIqtqrMd8lrQPKQ/MUx4Hpik36qfi0enM4HvUHztotBUqjZpbMUmUtKLaKNZn56c9MboVF4s7qjUdEyUOYDtWiK/reIUk6v4LbKbfz8R2xGQkZJ0dRKTPcm8r3DwuYgrcLsE3SKdKmpwxHDFLAS3MiVu+kKAy+Zkis0ZqXYtfepFYp2ji87ayRNG9Fpqu4JxzpLSmLg1yyJTTkobZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0laprifVSCE7M62VwGAKbmFphvq3J78AqFGZ9P/M+Q=;
 b=KMvCHOEfLQpY5NFI9/HuHyV/937iWE2fn/oYHu+uvRdDnnXg3/pvOIU+Q0+4cDCU45yTKcnBf+zbn7q6PvS+m3C1PE6tZxEEGol5qgUT6L1cjOsPAx3X7gO8mUeS4O8gycvC1Obt0ZjMmDRs11Duk1onLe0/Q3/srBhY0suZHoQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3050.namprd10.prod.outlook.com (2603:10b6:5:67::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Mon, 23 May
 2022 18:14:36 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 18:14:36 +0000
Message-ID: <c76e2332-60e0-57b6-98ea-eeb924d568b9@oracle.com>
Date: Mon, 23 May 2022 19:14:39 +0100
Subject: Re: [PATCH 6/9] vfio/migration: Implement VFIO migration protocol v2
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-7-avihaih@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220512154320.19697-7-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0703a7a-43dd-4ccb-3e0d-08da3ce8186c
X-MS-TrafficTypeDiagnostic: DM6PR10MB3050:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3050D259AA7F20D6D27A0C1BBBD49@DM6PR10MB3050.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tG+F30GEIPU93codHDA3WQZ2AwhzYiFVbn9bIOd43krQ9wwm3UHdfn+CQMar14uqhfS7ncwC3rtUqZ8wcYL2tc1lOklZ7ajW1sVlCDvxc/TODotWr56hxJw+wZ4ejpNj/uMtWHs9LAqb0OaTyEcD6l9fTVRrwSLaQ+K96sOp0IX9eregpVbnk7eVxnHq6twKsKvj7WHQQeUi/x1/2pwmyI07hBk+MwsJZnOp7jaFB6z//iCVhjOMh/9BsjOaCHzhERRVb8thJuXyMqtE2WiZNjGxdwV3deYoErbF2lhiIeUICs5ZE1Ic88nUg8hM3TdJiX0oZcX+zheUur3uMGJU7cMeJDTIQBhHB1JmwCzBe/LdOsSmK6smfu5LpPFNebZh+r3CN7OI3LVoPj1HomdRR1A6isC1Tqxcy5ZaVPNdf+BCocIePt5ebmFMINofzHV7Recur6YDAmPDkhFZ6t/IC5qgV/yJeXNWbmiWBIs9T3Nrx1nihzmJVsCJJV8T9VJlnhgpTrin2M8MJSQzewT268BjIhONV+K2VMdV56lrrl0db4AizpzKJezNzzm/Uj9EFRWSn/0TzIMMysACJKxpD0DcxCP3qScfYtNK45JrQHwqGMgOQYFZSSm5FK4xjXSjgM2ph1f/djoCGd/0YX2HbZilM8s4wKRMKIQsSwTzflihevxLWKgl/45PlWmUpy0WNgBxwH87PLjbQTZC79eq2OEcd3uRhpYx4+hqb919IYAQYlHofJoDV17fsG42QWuU/TCtPhltkSEbbZksMjYexs3+CcYntkdNbfAuSPbXRvBL76+0brcTBDpNjcvt97QqmAqaO1j88Z6ZnIBJJcBxQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(8936002)(31686004)(54906003)(6512007)(6506007)(38100700002)(316002)(5660300002)(53546011)(26005)(31696002)(83380400001)(66476007)(66556008)(86362001)(66946007)(4326008)(2616005)(186003)(966005)(6486002)(2906002)(36756003)(8676002)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0ZKa2g3amI3T2N5bk9UdDBEZlVjVytLcGZtZU9nT0dkZWMwUFlzckEvaWUr?=
 =?utf-8?B?UHg0V3VUR3dZSVN1NytnVHQraHkyeHhOc2wvSHJPcE1uOG5vTG5PZmxxYkFM?=
 =?utf-8?B?R2Nwd3IvWERnSTFJUjNzM2orZlNuOXpZS0tiOGNnNnl3ZnNBOWRKc2w3Q3pJ?=
 =?utf-8?B?dzV3SVdIc1crTFRPVHJTbDBabEZJUm1ld0VTWDdwd0wzczJQVng0R3dSVjkx?=
 =?utf-8?B?ZzZBTEI4ellLV05TMjBWSURYS2xTMjMvanNFdDE3SnJoN2dpeFJiQ1ZxTlZ6?=
 =?utf-8?B?TXVhZ29wbnROa3RON0tneEJlakpoSjlHK3FDQkp5STFyWENTVkppN2ozOHI1?=
 =?utf-8?B?T3kvQVg4L0luc3dWTlVxTy9kQzFHd1ZlbjV6d3B5dWY2MVo5eHVVRTA0WHRC?=
 =?utf-8?B?N1RGU1FnVlV6VDBvK2kzVzd5Z2hWalBObE9wbFNzbmgzMVR6c0pyYkFzY1Mz?=
 =?utf-8?B?cllTcXc2VGFKbmpuaTJxK3p4VHA0Mk5TVktiMlBIbUFvYmlwUkRqazNYUmxK?=
 =?utf-8?B?cWk0RlRkN2JXajJKTndZQ2UyWmVVVVVudVg4dnR1U0dBNzBZb3dtalVVSW1T?=
 =?utf-8?B?N3pqYVF4bWhIUEJPWUlEY1ZZTmI1TzdySnJxV2MxSklnMG5PanU0c1dtQ1hL?=
 =?utf-8?B?emg0OUhCbG1rVnk5SWxCSmxrK2F6cnNoWnlPbGd1Sm0venVCMGJRSE41MXJp?=
 =?utf-8?B?Ui9kNkZDSkhVRnBjYjV6WUZmbGJ2ekE5NWtSS0JPTWdPSTFUTWJZS2RocXVZ?=
 =?utf-8?B?ZEhLUzZWVnFNcStSK2xEV2lOL1BkNjFlcTU2Vlp3NHpRT2NZZzZycVNDd0Fo?=
 =?utf-8?B?TmFPaHdKTDFmWjZpaDBEMUl6T04rZXFkWWxFeE9xQU8vblVwUTV2ZEdPZ3VH?=
 =?utf-8?B?TkFnVzEyZXBLWEI2RnJTL2p0R1lnR2lsSW1yL2dUQ2lOV3FSZ2lKeXk1dExu?=
 =?utf-8?B?TVowSFFTNzFqY1lDelBDaHFjYk9BL2laZzBqVnVhWTIyZk1PQkJYdXhRNUV0?=
 =?utf-8?B?dTlVSzNJeDFaL1gwOGhnMlhhZk9Wc1ZPb0RXUCtma3liQ3R6aXZTUDl0SHZU?=
 =?utf-8?B?QkFUVlpNbjE2V2JIbVprT2pOUm5ibmthUU5CYkUrcjloc1pCUW5yUWs2TWNB?=
 =?utf-8?B?Um9WUHFGbUUySVN3a3RCSmYveG9NRVFpQkdQYm00SEVTandYSVNCeTZVWUdZ?=
 =?utf-8?B?WGtsOUlka2lvREQ5cVdiakdPY0FiNTlKb1UwVEZadHdzeDB3TDRZNzZYQlNs?=
 =?utf-8?B?d09ybUJjbC9MNkM1bVRCa0xmNDRLQlIzdTNaNXlNY1c0R2x0SnFDeHpkckg1?=
 =?utf-8?B?ekRLdUxqRzRqWGRIbVp3cEZQNjNYQ0NYcno4eHVFNHQ0QmJQWVJGMnlGdTRk?=
 =?utf-8?B?Z1dYaTlIK3Y1cVBBT3RRU3dvWHRQbmJ5dFVuam9hV0RaamVjc0VOUFZoekli?=
 =?utf-8?B?Ly9MN0VKSlMyOUM3SU9KT3JiNDc4aDNpSE9sZUVvVmpxWkVweDhNYjNORERj?=
 =?utf-8?B?eHREd2dob01IcGVtQ2FuT0tEb2JodXkrNWxTelRGbGl0V25DK2Zpc21iUXYy?=
 =?utf-8?B?bFY2a1crclRqT2U1cHdmR3d0V05CeW85UGRRZFRJU0w2UklUbkpwQU5xdjFv?=
 =?utf-8?B?RWREZWxDdE5LOFFHd3BEVFQxMHMrZTRGK29lRWZoMWtBOGVOZkYvTVlmVTdB?=
 =?utf-8?B?Z3cwcFZsQ3JSd0c2cHVJMjJxcVZ2RVovZ3QvTHJIV0M0ZXlEYjVCc1ZycDlS?=
 =?utf-8?B?alQrTHd2OWEzOWIxMTcwWjRHNGR3b01MZFpjQ29ZY1JVNEZkbEt6QnZHN00v?=
 =?utf-8?B?d043VmNpWHUvTXpNVkpYbFNHR1hNSUE3b1FLNDdsL2k0S1dZSG5QcFVMSU9P?=
 =?utf-8?B?NFB5SG5yanJCT1VjVjJucEJCMUJoQVZyd2FMZzdmZytPYTc4b2FJY3c0N2NJ?=
 =?utf-8?B?VXAwQVRiS3FHVkJuNzZCK3JxZ09FSzlFTm1Od0lSZWYyT2lYRDlxc0RQc3pz?=
 =?utf-8?B?UEszdEdtUjR6VTVhRG5ZM1pNSld5YVRLTkg2SWw0VlZaN2M0WGRZVTI4SXNz?=
 =?utf-8?B?MWFiUkV6NlV3RUt4QVFTK0dDQ05LSGhmOXNNODM1L3J2ODZ4cHdZbjhhb1ps?=
 =?utf-8?B?VW5aY05NRyt6MjczUTZreXdPWFVrTmVRcFNFVjJEb29uTS9pajNiYlBJMEo3?=
 =?utf-8?B?N25DVGVwcy8zeGZaZWRjejExZUY4Ly93alVZY1dqZzVpSFQzRWhxQXVObEJl?=
 =?utf-8?B?dDFYRUVINGdFMFJ0NDE2SkZFckh5eFQrV3U5NURkOWNQQis2TTk3NTJIeFFi?=
 =?utf-8?B?VUVhSW1QOW5uSVBTL3pQUjJMZVcxTDRyQ2FwYVE0Um5hRXhqR3RqSWpwYTBB?=
 =?utf-8?Q?OxJvtdcMf2yszwzE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0703a7a-43dd-4ccb-3e0d-08da3ce8186c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 18:14:36.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx+Uy1K0iimt8B1+hvfNRtI0HFtaalWsTW/wsOd36LetloU8DuRIQN4JGFuT9M/SLfdNG2WHox2xSZWubpFL6R0H6Y+EOU/5wOrTzNi3e70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3050
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-23_07:2022-05-23,
 2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230103
X-Proofpoint-GUID: Z_UJifAv9diAkxju_39f-BMfLYF0siUG
X-Proofpoint-ORIG-GUID: Z_UJifAv9diAkxju_39f-BMfLYF0siUG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 5/12/22 16:43, Avihai Horon wrote:
> Replace the current VFIO migration protocol v1 implementation with a new
> implementation corresponding to VFIO migration protocol v2.
> 
> The main changes are:
> - VFIO device state is now represented as a finite state machine instead
>   of a bitmap.
> 
> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>   ioctl and normal read() and write() instead of the migration region.
> 
> - As VFIO migration protocol v2 currently doesn't support the pre-copy
>   phase of migration, .save_live_pending and .save_live_iterate handlers
>   plus pre-copy relevant code are removed.
> 
> Detailed information about VFIO migration protocol v2 and difference
> compared to v1 can be found here [1].
> 
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c              |  21 +-
>  hw/vfio/migration.c           | 628 +++++++---------------------------
>  hw/vfio/trace-events          |   9 +-
>  include/hw/vfio/vfio-common.h |   8 +-
>  4 files changed, 153 insertions(+), 513 deletions(-)
> 
This looks like a fairly big patch, though more than 70% of it is removing
code. Perhaps you could split it into adding v2 and removing v1 afterwards, rather
than a single replacement patch? It's just a suggestion anyhow, to hopefully ease
analysis of the new additions. The removal looks to muddle a tiny bit.

I don't wanna throw you into potentially unnecessary work should maintainers disagree,
so here's an attempt:

	https://github.com/jpemartins/qemu/commits/for-avihai

If you apply your series on top of the same base commit (78ac2eebbab9) you should be able
to compare both branches.

I haven't found yet any particular flaws in your new logic (but will reply back if I find
any).

