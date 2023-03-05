Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFC6AB387
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 00:35:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYxrh-0003sg-4M; Sun, 05 Mar 2023 18:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYxrU-0003sB-OR
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:33:52 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYxrQ-0005lQ-2u
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:33:50 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 325Lgb3E005348; Sun, 5 Mar 2023 23:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=iwVupP7mvuni439/P0bUOgBzEGYKinFvcbsZ/fOs2WY=;
 b=ozquplP9m7wMYCqW4+zT1kgb9KSEQcz8hGcaq0sm5jnBajduXs2V6K+OppLpaIFFIlYn
 cB9QAUEj7VuyVSJGpxQZdur+IAWgWa8lIDVe82Gdz/JiiibOecpjAQamaguugg970gcP
 l6zT6AEDF40jZeAG/68WjpAHgveT00+vFWahepjgjLcW1h1YoR5kC+1L5AKN5kXGV2Ut
 Naou3nE+N7gdsKORw8teTVMTJwErcwpxwtDWghxWZYKiL+88wbBfbS9tBdIQJyS7tzR+
 3ncVf61AcrsMeg5U7FbR3F/evMZu/x2JD6ez8+nNg3l3yLODnXddVtH9w8OtTKeYI363 tw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180ssg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 05 Mar 2023 23:33:44 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 325I55h4036910; Sun, 5 Mar 2023 23:33:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txc9y75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 05 Mar 2023 23:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSdOerW4AzMhQ9q9V+GwWLCHvhLoC8pPuA7rly1v7wXh40o+Li6LzEVztAEOzt+27mNAVVZntJcobiebUxb2ogMjwMysEYZ4g2P3DEfAgrlMR5F4Simb9PpN4XqWjvIcqvXdir6XEltuIr1IrkUnrEOXSD3klIiAXXEKxCQ9skO/lXBYwdIRBmkrxHz5oMoPpWdaWheG/pUXyXC9E3dC7tJbyakD68p7mJiGyj5fiaFburaYDyKRVQP0opA1BTYAHzyccM8BeUyHd1WgMzz6GGQIolV3G5ObnoXqUAVp9q1FIJ6Kpwua4qKWk9lPpZL3O1CYQPNc4IdEp1Qz2iAV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwVupP7mvuni439/P0bUOgBzEGYKinFvcbsZ/fOs2WY=;
 b=Lh0KvvTbCJoKAaVykwVdsZFeY7EbRtVlSPzZcGIir862D7P6R3NOnqTOMqdwzmhrle/EaJAPBBUP7KK/C+8oHa3UUhDZxNHKNsSNR0EGhhJchG5xOPgAM3zyLnudoC3FkJUIHBP/joP1OA5vBzZ704SlTCkQFIo28nCxh4cfKDGKIsx69+pr5tOVQkHG3caJQIOHioRgEDA1T1YgVQy6AKKHrHBrn4XlRK0LlDTXqT1aE0Shibe2FsjU447Y053iDBmNtMZ8vw61jm5JhSjmNisnCgemcewtez0wXGugxtFcUp7aSmNih+GTsbn9+w6sZ25h8q8SSbGSJJOY9+UJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwVupP7mvuni439/P0bUOgBzEGYKinFvcbsZ/fOs2WY=;
 b=FfQGrbxlAoCyCUrYMvY4Dnnt0a1rNCWqPlPvhGTWOUfmF5yIEifFdChKRni4ESUP+IVK8dtBcTl2JSz9L2a5e7zHxxRmAzQDUKXNsRB/k6wIaWjk/uq5S7NFK27Z5kb4OFT9yRqJqJhaJVO6BtyOyyRFqeB2boN0ynSOO5WeKtw=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB5094.namprd10.prod.outlook.com (2603:10b6:408:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Sun, 5 Mar
 2023 23:33:40 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Sun, 5 Mar 2023
 23:33:40 +0000
Content-Type: multipart/mixed; boundary="------------perm0lOVNtTDq6Ty02SQKrCJ"
Message-ID: <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
Date: Sun, 5 Mar 2023 23:33:35 +0000
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230305135734.71d54dd1.alex.williamson@redhat.com>
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230305135734.71d54dd1.alex.williamson@redhat.com>
X-ClientProxiedBy: AM0PR02CA0189.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::26) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BN0PR10MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 183c4627-95f4-4b4d-8b69-08db1dd20d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQrAYygmfry+W2xZz58yUfFUy5icR+/AqtQMlLPG8Z8Pab2S7LK+zn0kwK3nT2FtgJGkIXXZdkGU/RvYnOFUD7K0FSW/I7iurz02PQXwHk3jy1QQgKD6k/+97oDB5TyYl3Rdb2XmtLKt/SYFVgfdmgMVRtx7Wffa2lJUS45I0aD3crthNR/jHcaaTpjQK+3X1Fw1AisrmvcjE2hYx8KgC/CYUnHo9vn0YMAWmWcZQsCEXxHsY/LRF3HiR2tVfWMZiaaoJ5B7Jtc57MJmtH9VIPPa6+J9+Ug/rUpvgiiGqXC+zEKLarPTi2JMjp7PKqQwCeZQzOTaQNQs166H/onvtvfgnM+svEKYpZx7WoWLlvpo/GkMkEDrpK7ZdB5Pf9INeNiUgDnUdGjSTYaTnNm/EFz/WiACAcc5qjRJkPGDQpDSWnw62TxZwYaUsBYCmbHASKnmG8DJY909fcYxNtcBYhZLRlFMwbcAtvw7wxHYCFJDTSLVaxk2QsnpdCMLJEdGS6wsI67sf2ZgUo147jyZVxC0pT9tZ33pi6GByhDDD+lhenFpPM1zN9u/aLaC3ZAzcFMPx5WHk5mXWDJ2T2Pv9G+XapJenelyX7XlU9SWyfUw2uX5PLxB99MAQinv83NWsZjGFtbgTnYBBAfBiI72wXkuI/+z3dyOANiaQXsMTflSjAeMP//zjbzjKWQkhGNjiwIK7ETqnAqN++UN8NqQ+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199018)(36756003)(83380400001)(6666004)(6506007)(6512007)(33964004)(53546011)(186003)(26005)(966005)(2616005)(6486002)(41300700001)(8936002)(66476007)(66556008)(66946007)(31696002)(86362001)(4326008)(6916009)(8676002)(2906002)(235185007)(5660300002)(38100700002)(316002)(54906003)(478600001)(31686004)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVseHQ0WnphTXptbWhSV0wrcUVwM2t0YkVQakg4eWlmS1I1WkRrWGprWmtt?=
 =?utf-8?B?UncrRTVqVTBTZXdtNGVvWmNvMVp1bkd0ZmVudEZXKzhEdEdZbmI4SFZ5Mjhv?=
 =?utf-8?B?eEhJMkM1Q1prMmJzY0tTRkJEclZsbnN3VmlmeUdWaXFKT25rYlJTWFp1Witu?=
 =?utf-8?B?azAyRzByRnBqMUdpYkFjV3lPMUt4dUUxN3gvbTU0MGRDMUlzN3ZkV1U0V3Fs?=
 =?utf-8?B?MCtPbndKZ1phazJhMy9vaEVRMUFUcTArKzlsMVQ4dEhJU3BEYUtpNDdlSjVT?=
 =?utf-8?B?NmN4Smg3TUczRDN1ZmI4SWVGWk9MamxHMkp3MkFqZ2dhekVNY091WkV3b0hT?=
 =?utf-8?B?SFZxd09SZ2FLWlpBTzFWMERDWm9uTGR4NEJ0dVdhUGpiYWg1cVZjMEYxS2FC?=
 =?utf-8?B?UWJtQnhKdUxwcFRVb2g5cU9zd3lEcWlhS3VUcUFSNTk3TUZGUTFvUXNBQldx?=
 =?utf-8?B?SVlXUFovU3BmaWNHZko1QlVXNGdQaC9zQXB3MU5YeXJ1S0xkVFlWU2I5elhr?=
 =?utf-8?B?UUVtSXJLQnNkbEdmY3pVL2JXd0srRDZYckF0aXNQZEdYNnc5bGVLMVJydUYx?=
 =?utf-8?B?a1ZHV3kyb3ZkcXBlc3QydDhYTFdaSG5IczFpTW1ENVZ0alFLSm0wcjZPNU1u?=
 =?utf-8?B?L3F0Ykg4SzRWWGE3TTNDVnQvMzVUUnpXYTJueWViaDBSV3djMmEwVVlNa242?=
 =?utf-8?B?MllzYnJiL2hKTXhvMTdENVpNWUtYeFNCUTdFVWFTWGU5WXBWODd0Ync3aTEv?=
 =?utf-8?B?NzdWRHVmVWRPc1RiOUYySXNtOUxIVlUzV3BHZ0tDZm1KeG1YVzkwWHFzelpp?=
 =?utf-8?B?b2Y4cW9LOEh4MGRldGpQb0kydFVMRDRsWi95TVNiQ1NFZDQyNGhWVmFYdXk2?=
 =?utf-8?B?c2ZJQnZ4K0lWUC9iQjNBVjVVYXROOFpSOWpXdVNmWWVFZ1BWOTdDR1Z3VkFG?=
 =?utf-8?B?aWMzVEFWYk9EclhrUThCeG8xeGFjOE9PNnFTYmFBelZGYnZtbnJCd2xERitH?=
 =?utf-8?B?QS9SNVVYaEdDUEtLdlVraHZ4c1hTRS95NFlwc0swa283cE1VMy8zclUrSHNz?=
 =?utf-8?B?NTM4K0JLQVFnbUVJTDFoUVhmb0FFdlhqc2Y1VXViWlZVcXZibVdWbUw1emRG?=
 =?utf-8?B?Q1E4bUNKMGhkTURpRFU2MS9qRkZpaXlYdEZ2YkdSbXZsQmpoaElXeC93R3Bw?=
 =?utf-8?B?Y1RlWVkwckRJUmlKSjhtZFA1ZWh2WkxGZ1JEamw1YWxJK2NiNXlmTlU1anBQ?=
 =?utf-8?B?Z3dwTTRyOFgzWE1lK0NOK0V0K3c1WDRvT0VYOHBLWHY2OGVoeW5QNjA4dlpv?=
 =?utf-8?B?QUdGSUc5bG9Ta2F4U0U2YWM3RnI4RzZ0YVdIa2NJR1VzSHdyalBrdTBkWTRh?=
 =?utf-8?B?MUVPRnZPT2FLdkZ5NCtIRFlndnFkUlN2L0NzbTJPMHFWYXZzbFgwa1RPNEl4?=
 =?utf-8?B?R1lpWmhoc0ZaVm92TGwwRUpJS1c2dFhucjlQSE4rcFkwV21CejNEMyt1ZExJ?=
 =?utf-8?B?cGNDelpKQjhic2IyTGNteFhFZm1Qam80a0xjQkhTNm9yYXdxM3RoTS9RYkQw?=
 =?utf-8?B?c21lWi83QXFYSi9oNXA0TVFXWlFGS0tINmtTcStnNnJFbkpQQ25GTzJUdlJ1?=
 =?utf-8?B?dHYwS0hKV1NHckkrYUNXVEdtcVpFQVNwbHM3RW1hZzFuOUR3bFQzSElsMUpi?=
 =?utf-8?B?TnhHRDZ4YnlIN2ZPczF1MGNlVVl0T1hwcHhiQU4xZkRuK2szMGNuLzNwY1Rn?=
 =?utf-8?B?K0pYVHdNMS82WUV3OC9sUDEvVDErakNSbDJmMWNVWVM3UGwvbmZXS1ZyeFMw?=
 =?utf-8?B?VEpGMmxlWHJDTlJHeGpJREczc3Y5N2FKanRaVHkwbFYybmk0WVI3MWt4VXVt?=
 =?utf-8?B?WS9tSlVoNjBaYlJSRkdzTHAwTVlvcWpEa3AvQ2Q1MHdKbVliam1FeXlCTGJp?=
 =?utf-8?B?MWZ1eW1iNlV2RXpmVHpHbFlMT1cwMVpoNGF0Rm5keHVzYzlZU3YwTjZwZTJT?=
 =?utf-8?B?STE1cjlnWnNWRTc0aXZqMmZST1JqdWllY3RsbGplUEJqYmk1c2Qxa2Q3QXZW?=
 =?utf-8?B?aGtrb1N1a2k4cDB1YXBjek8xalRwMVliQTFyOEd1U3BoZTZxbmpqYkZ0dDBu?=
 =?utf-8?B?SEo5SHBjZUcrZWdOMVVmZkthandRdVIydjRTSFB0VXFHWXhwRkY1RkxucDdS?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /23yDgsNJJs2R4dMrKun/Zg4mvBZfJSLaOCDpW4MFxCe7Tpch83Nq9j52QRmh5q5rGHJmbxN29ywocVaDLPh2nK3ahnt5ImpFfw6QYlhcD5NxeOWKjo1Dpc2wqUml/EfPnzadRWA6XmUOQ+p2e7L8wR6BOA9nlQ26SQpTgHl/b20Rl40QlBcXhCpwUNm2xEn8J2IjJ+uoKn6ZD7WoJtJ59FHzGne6utINvU0I47RGhhLbXFN6LTu6+vmtQbBluCwkJ0SOvPraGCiMh9AV4sTebpC+KUWJavfwGTJugEUS0G2POjFaC3rTxNPNHjhoxRo+HyNuIMHI0nqBkjCC5x6PgGkUlx8VotHT709jysxcafKdtGY9FoQkVPehV/LIbUvBzU9XMpuvjMyjyyU7+4Z+WMj89KPf6PY8qYFADqHPodgmjwc+nd0jM9naf3L/VKbknPZXRMMskCNAwiErxsTzMcGlvl/ygrE19RcgnymOIMbiOJUwt4eKZCU8vbTQmtAkcXnp3hMIN9QFTjch4tnKLI998s3NQnVX9L0N6lTsXaikHULSmFpaPkKKhEpVdR6rbu+Y5La+ndOwesfyqgF7aBVzvzdYaIE6OOnLH4I1j3lBYgsH+C5qW1KdeLFQ4zkJFrUIT80itimfLJGXga5jcG/bdTuIBPMXQzT2+Fn5pbM2CezZ4wo7T929LCd0WQi6BOPR3iZKO18VgThz2vGCm2VfyN48BCWzMHR1MWzh9MonBZ9v7vgxhK0byK/ecn7k+FhysguMuUWOX47eeNnV4pvJMSYXgKNs+YIvGqZij3FyDmMJPOgMNAMOkh/lXiP
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183c4627-95f4-4b4d-8b69-08db1dd20d51
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 23:33:40.8561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwiuKSwPpEphqn2MNbSXcZJDQNkRFrWpLUpOz/YSQhwq+A9p9TBX59ny9E5DlcnZPJIIR982wL3e2ipDloooDSic4VYsm22DlSQQXzghZ1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303050207
X-Proofpoint-ORIG-GUID: 1h7RaT1hgptwzZgi696KtwTd09pTNLKM
X-Proofpoint-GUID: 1h7RaT1hgptwzZgi696KtwTd09pTNLKM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------perm0lOVNtTDq6Ty02SQKrCJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2023 20:57, Alex Williamson wrote:
> On Sat,  4 Mar 2023 01:43:30 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Hey,
>>
>> Presented herewith a series based on the basic VFIO migration protocol v2
>> implementation [1].
>>
>> It is split from its parent series[5] to solely focus on device dirty
>> page tracking. Device dirty page tracking allows the VFIO device to
>> record its DMAs and report them back when needed. This is part of VFIO
>> migration and is used during pre-copy phase of migration to track the
>> RAM pages that the device has written to and mark those pages dirty, so
>> they can later be re-sent to target.
>>
>> Device dirty page tracking uses the DMA logging uAPI to discover device
>> capabilities, to start and stop tracking, and to get dirty page bitmap
>> report. Extra details and uAPI definition can be found here [3].
>>
>> Device dirty page tracking operates in VFIOContainer scope. I.e., When
>> dirty tracking is started, stopped or dirty page report is queried, all
>> devices within a VFIOContainer are iterated and for each of them device
>> dirty page tracking is started, stopped or dirty page report is queried,
>> respectively.
>>
>> Device dirty page tracking is used only if all devices within a
>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
>> used, and if that is not supported as well, memory is perpetually marked
>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
>> support, the last two usually have the same effect of perpetually
>> marking all pages dirty.
>>
>> Normally, when asked to start dirty tracking, all the currently DMA
>> mapped ranges are tracked by device dirty page tracking. If using a
>> vIOMMU we block live migration. It's temporary and a separate series is
>> going to add support for it. Thus this series focus on getting the
>> ground work first.
>>
>> The series is organized as follows:
>>
>> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>>   adding device dirty page tracking.
>> - Patches 8-10: Implement device dirty page tracking.
>> - Patch 11: Blocks live migration with vIOMMU.
>> - Patches 12-13 enable device dirty page tracking and document it.
>>
>> Comments, improvements as usual appreciated.
> 
> Still some CI failures:
> 
> https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474
> 
> The docker failures are normal, afaict the rest are not.  Thanks,
> 

Ugh, sorry

The patch below scissors mark (and also attached as a file) fixes those build
issues. I managed to reproduce on i386 target builds, and these changes fix my
32-bit build.

I don't have a working Gitlab setup[*] though to trigger the CI to enable to
wealth of targets it build-tests. If you could kindly test the patch attached in
a new pipeline (applied on top of the branch you just build) below to understand
if the CI gets happy. I will include these changes in the right patches (patch 8
and 10) for the v4 spin.

	Joao

[*] I'm working with Gitlab support to understand what's wrong there with my
account.

----------------->8-----------------

From bbf2c3bbb9c9e97f12dfe49f85dac8cc1f0c5d97 Mon Sep 17 00:00:00 2001
From: Joao Martins <joao.m.martins@oracle.com>
Date: Sun, 5 Mar 2023 18:12:29 -0500
Subject: [PATCH v3 14/13] vfio/common: Fix 32-bit builds

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9b909f856722..eecff5bb16c6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1554,7 +1554,7 @@ vfio_device_feature_dma_logging_start_create(VFIOContainer
*container)
         return NULL;
     }

-    control->ranges = (__aligned_u64)ranges;
+    control->ranges = (__u64)(uintptr_t)ranges;
     if (tracking->max32) {
         ranges->iova = tracking->min32;
         ranges->length = (tracking->max32 - tracking->min32) + 1;
@@ -1578,7 +1578,7 @@ static void vfio_device_feature_dma_logging_start_destroy(
     struct vfio_device_feature_dma_logging_control *control =
         (struct vfio_device_feature_dma_logging_control *)feature->data;
     struct vfio_device_feature_dma_logging_range *ranges =
-        (struct vfio_device_feature_dma_logging_range *)control->ranges;
+        (struct vfio_device_feature_dma_logging_range *)(uintptr_t)
control->ranges;

     g_free(ranges);
     g_free(feature);
@@ -1646,7 +1646,7 @@ static int vfio_device_dma_logging_report(VFIODevice
*vbasedev, hwaddr iova,
 {
     uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
                         sizeof(struct vfio_device_feature_dma_logging_report),
-                        sizeof(__aligned_u64))] = {};
+                        sizeof(__u64))] = {};
     struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
     struct vfio_device_feature_dma_logging_report *report =
         (struct vfio_device_feature_dma_logging_report *)feature->data;
@@ -1654,7 +1654,7 @@ static int vfio_device_dma_logging_report(VFIODevice
*vbasedev, hwaddr iova,
     report->iova = iova;
     report->length = size;
     report->page_size = qemu_real_host_page_size();
-    report->bitmap = (__aligned_u64)bitmap;
+    report->bitmap = (__u64)(uintptr_t)bitmap;

     feature->argsz = sizeof(buf);
     feature->flags =
--
2.17.2
--------------perm0lOVNtTDq6Ty02SQKrCJ
Content-Type: text/plain; charset=UTF-8;
 name="0014-vfio-common-Fix-32-bit-builds.patch"
Content-Disposition: attachment;
 filename="0014-vfio-common-Fix-32-bit-builds.patch"
Content-Transfer-Encoding: base64

RnJvbSBiYmYyYzNiYmI5YzllOTdmMTJkZmU0OWY4NWRhYzhjYzFmMGM1ZDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5j
b20+CkRhdGU6IFN1biwgNSBNYXIgMjAyMyAxODoxMjoyOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0gg
djMgMTQvMTNdIHZmaW8vY29tbW9uOiBGaXggMzItYml0IGJ1aWxkcwoKU2lnbmVkLW9mZi1ieTog
Sm9hbyBNYXJ0aW5zIDxqb2FvLm0ubWFydGluc0BvcmFjbGUuY29tPgotLS0KIGh3L3ZmaW8vY29t
bW9uLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vY29tbW9uLmMgYi9ody92ZmlvL2NvbW1v
bi5jCmluZGV4IDliOTA5Zjg1NjcyMi4uZWVjZmY1YmIxNmM2IDEwMDY0NAotLS0gYS9ody92Zmlv
L2NvbW1vbi5jCisrKyBiL2h3L3ZmaW8vY29tbW9uLmMKQEAgLTE1NTQsNyArMTU1NCw3IEBAIHZm
aW9fZGV2aWNlX2ZlYXR1cmVfZG1hX2xvZ2dpbmdfc3RhcnRfY3JlYXRlKFZGSU9Db250YWluZXIg
KmNvbnRhaW5lcikKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCi0gICAgY29udHJvbC0+
cmFuZ2VzID0gKF9fYWxpZ25lZF91NjQpcmFuZ2VzOworICAgIGNvbnRyb2wtPnJhbmdlcyA9IChf
X3U2NCkodWludHB0cl90KXJhbmdlczsKICAgICBpZiAodHJhY2tpbmctPm1heDMyKSB7CiAgICAg
ICAgIHJhbmdlcy0+aW92YSA9IHRyYWNraW5nLT5taW4zMjsKICAgICAgICAgcmFuZ2VzLT5sZW5n
dGggPSAodHJhY2tpbmctPm1heDMyIC0gdHJhY2tpbmctPm1pbjMyKSArIDE7CkBAIC0xNTc4LDcg
KzE1NzgsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2RldmljZV9mZWF0dXJlX2RtYV9sb2dnaW5nX3N0
YXJ0X2Rlc3Ryb3koCiAgICAgc3RydWN0IHZmaW9fZGV2aWNlX2ZlYXR1cmVfZG1hX2xvZ2dpbmdf
Y29udHJvbCAqY29udHJvbCA9CiAgICAgICAgIChzdHJ1Y3QgdmZpb19kZXZpY2VfZmVhdHVyZV9k
bWFfbG9nZ2luZ19jb250cm9sICopZmVhdHVyZS0+ZGF0YTsKICAgICBzdHJ1Y3QgdmZpb19kZXZp
Y2VfZmVhdHVyZV9kbWFfbG9nZ2luZ19yYW5nZSAqcmFuZ2VzID0KLSAgICAgICAgKHN0cnVjdCB2
ZmlvX2RldmljZV9mZWF0dXJlX2RtYV9sb2dnaW5nX3JhbmdlICopY29udHJvbC0+cmFuZ2VzOwor
ICAgICAgICAoc3RydWN0IHZmaW9fZGV2aWNlX2ZlYXR1cmVfZG1hX2xvZ2dpbmdfcmFuZ2UgKiko
dWludHB0cl90KSBjb250cm9sLT5yYW5nZXM7CiAKICAgICBnX2ZyZWUocmFuZ2VzKTsKICAgICBn
X2ZyZWUoZmVhdHVyZSk7CkBAIC0xNjQ2LDcgKzE2NDYsNyBAQCBzdGF0aWMgaW50IHZmaW9fZGV2
aWNlX2RtYV9sb2dnaW5nX3JlcG9ydChWRklPRGV2aWNlICp2YmFzZWRldiwgaHdhZGRyIGlvdmEs
CiB7CiAgICAgdWludDY0X3QgYnVmW0RJVl9ST1VORF9VUChzaXplb2Yoc3RydWN0IHZmaW9fZGV2
aWNlX2ZlYXR1cmUpICsKICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgdmZp
b19kZXZpY2VfZmVhdHVyZV9kbWFfbG9nZ2luZ19yZXBvcnQpLAotICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKF9fYWxpZ25lZF91NjQpKV0gPSB7fTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihfX3U2NCkpXSA9IHt9OwogICAgIHN0cnVjdCB2ZmlvX2RldmljZV9mZWF0dXJl
ICpmZWF0dXJlID0gKHN0cnVjdCB2ZmlvX2RldmljZV9mZWF0dXJlICopYnVmOwogICAgIHN0cnVj
dCB2ZmlvX2RldmljZV9mZWF0dXJlX2RtYV9sb2dnaW5nX3JlcG9ydCAqcmVwb3J0ID0KICAgICAg
ICAgKHN0cnVjdCB2ZmlvX2RldmljZV9mZWF0dXJlX2RtYV9sb2dnaW5nX3JlcG9ydCAqKWZlYXR1
cmUtPmRhdGE7CkBAIC0xNjU0LDcgKzE2NTQsNyBAQCBzdGF0aWMgaW50IHZmaW9fZGV2aWNlX2Rt
YV9sb2dnaW5nX3JlcG9ydChWRklPRGV2aWNlICp2YmFzZWRldiwgaHdhZGRyIGlvdmEsCiAgICAg
cmVwb3J0LT5pb3ZhID0gaW92YTsKICAgICByZXBvcnQtPmxlbmd0aCA9IHNpemU7CiAgICAgcmVw
b3J0LT5wYWdlX3NpemUgPSBxZW11X3JlYWxfaG9zdF9wYWdlX3NpemUoKTsKLSAgICByZXBvcnQt
PmJpdG1hcCA9IChfX2FsaWduZWRfdTY0KWJpdG1hcDsKKyAgICByZXBvcnQtPmJpdG1hcCA9IChf
X3U2NCkodWludHB0cl90KWJpdG1hcDsKIAogICAgIGZlYXR1cmUtPmFyZ3N6ID0gc2l6ZW9mKGJ1
Zik7CiAgICAgZmVhdHVyZS0+ZmxhZ3MgPQotLSAKMi4xNy4yCgo=

--------------perm0lOVNtTDq6Ty02SQKrCJ--

