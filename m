Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF675FE5D5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 01:15:12 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj7Pz-00023B-An
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 19:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oj7OY-0000ZL-Ry
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 19:13:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oj7OT-0001T2-Jg
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 19:13:42 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DLqee1003845;
 Thu, 13 Oct 2022 23:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=WKuq5cs0560xjICH9UxQlArQX6/Kjb7H7RegxPK8l6A=;
 b=ZH8AKWEBFMKMu+N+psJRU8NJm95gSPCQKPpwCjIwraENocW4lGQUxJAEyZsIjPhB+5WZ
 0gcqFgPjJmh65a/Qs9C/Od49LHvd+83fDBhz4BygcZuB8Yyl3fCsm+43pxOrFAqSVbGp
 iHB82L9X9ar6zabKqWVFOhy12UzA1ouJJ9d7dP6q3NyRet5e03jcukPQiXiT0H7jvneV
 4ckjMCck5joqYNbo+SLVY8124OniW0SCClIYZgSm+qIgNxoPv3TttaKQZ3NuDEWG7hdw
 Vwww060kCbdqyDDJqzPbL4Y4+zkt6kr8Q5isBvHk+2iiRzHeiEtBpkDUHyteuajTwj0o /g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6r4v8hg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 23:13:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29DMZsgv018604; Thu, 13 Oct 2022 23:13:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn6vhg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 23:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3b1kWtknoJOYDz7zx6Mfq2T9X3yOnfWKValdLlEhmbEI94D/manuXbcV1ZkHjn9lWl4pdoaqrVYu4zE/8K0utLxWYpvWIZ5TXynGqGbQJ4Z5xCkJzn6MMSPDZ1e71umnho5OpOKltFHhgS2YBk5UKScnOj+N3WZnivJ+7dVQhj8f9Kv/iRF2fUhrKFpRiJRlAHdK/rV/T9GTPAvNQTS95NPhJG0Fcuit80fP/FmbdNtqi5mL0X7JC6W6QdAisarCyvF6dhLTKGuBXUeveB4X+umGU1zSfziqDxvSs+bXJvGE+j+1QvGX+a5A++3twp82PIkU6IyuAyUW2Jb0PDMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKuq5cs0560xjICH9UxQlArQX6/Kjb7H7RegxPK8l6A=;
 b=ljlvwpf9qM8uUIiNU2xLws8WU1r/gRV0nWzU+/t5+YlzRI5avlGW0VwGxMd0j3eRKwlt1DluJ3Q8FKYKkkiU8XBUM6qtWdVkQBa0TzgAFjqh6L14ZtISTNOA8NyckIVfx5G/Z0sNKy131UxgEHqjxo+CfvyTW5KqXLYI7Xy0A3NTM79T6NjWH0iLpcGBo1jPubKghVvreZSnmuhvB0k+Pfm/ur39aiGKtk8f8HZum7q0rnZLsnkTwr/f4lbw1WyXsJJfZB6qqmm+TZfRXqvMZqsWf0hH/Hj+KCyCLLUbC9UpD/Geu8OIy4UBBjvUYTdO96tjwJMiGNllpwKG8K43rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKuq5cs0560xjICH9UxQlArQX6/Kjb7H7RegxPK8l6A=;
 b=BP07sJjIcYLi5n35SDKMIGkGPUlNa0kQHbM1gbgQF8mzqEPIY7bj7P0onJzoPLhs8YY/78cW5SkcUrvkeow6ZZLGHJaSrsgZP/g9AI+mGS8d7kQ4eVLbcUdBPB2tZcI0Br2k7gsvqTDbo5CU6guql06YhjB1dj86kiqMiQerKf0=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CH0PR10MB5308.namprd10.prod.outlook.com (2603:10b6:610:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 13 Oct
 2022 23:13:02 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc%7]) with mapi id 15.20.5709.019; Thu, 13 Oct 2022
 23:13:00 +0000
Content-Type: multipart/alternative;
 boundary="------------9niG61WXDoP8rcSCyuDSFdGg"
Message-ID: <d625202e-9729-a050-db31-da2a5d89d58c@oracle.com>
Date: Thu, 13 Oct 2022 16:12:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>,
 Shuo Wang <shuo.s.wang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
 <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
 <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
X-ClientProxiedBy: DS7PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:8:56::18) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CH0PR10MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2076dc67-0f73-4f3b-3aa7-08daad707926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja4g1wrurLYlLQ91s4k0ABiLreNhB0YzF+4dR0rk18NzVPdQCdovF1ybgf4/z44TprqQVAhFHwqmB5O95RVevP04iKB9DnS7G51loslbp/2nzj8UlhCYvzt2MrNHZjloO36MV/fatcBKlp4IkpxkBKrX6Oiosw9m6/2jwR4yL9RiQC6XoMQ7nFRJpwWuutl6wvqpLTI1GHs3QiMYwJawd5ITFLtbDKOdTbWsTqSeTr30viNtX+PubAYTIIHYFBWyinnOzqrEeY9epzNo0zdRSXNzChUdv8IWu4sQn6XnQxqnzMUgTGFKogIn4CTjWhw2vOEG4TXHBAkbrkkOpo6Ao+tv5JtfNKDY+9GFfNdkWg2L7TBA11rYjggrrG8gEYjtwsuINu1j7J0CXy8wQ63N/7gEr9ca08g/RuVE7vLX2B/u4UjYFPd3c8nRA3z0ogkJGrUg711gqz92zuPEYSl+RTS9lvBSxBGkPadj3fyQJ9MCplRdW+OsWGW8IvY21RuDtHAgb0Xrk+aI7b+CjO5VUhm3Mxu+pL6hEmMRKI8tpxpbkGBnvpAeGtqQfLCUofatuBFtR6IOQ4eItDD9tXExYPvpqaS919oBLBqP1hM5imRVgxb0em9NbMQ7DUTFm6bbRRL3er3J/gcAjpPgCHzFWJxSaZQx4ji48T7o+Ygl6tnd1WX9HUEfbMkMIgccHIBpyW6ycna15nhM0PCEPO2rQWCkiRcV6/kG1eLy+Cw6hW46oqgxgw9dd2+67PkRq3gVAayKCa+Alt357aMP85F66AAQ4kkWvWR+t6wVbdMkvUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(6486002)(2906002)(2616005)(478600001)(186003)(6506007)(53546011)(36916002)(33964004)(41300700001)(6512007)(26005)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(107886003)(86362001)(31696002)(38100700002)(5660300002)(6916009)(8936002)(54906003)(36756003)(30864003)(31686004)(66574015)(83380400001)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDVQQ2F6anl6ZE96bGxEZllqSTAzOGpmbHhzaUdNRlE0YjA4Q0owNHRLQnhw?=
 =?utf-8?B?aVNJRXZMZmpOek4vbmp6S0tiLzR1Y2FlV3FodHZYSHJPZnp6a3ErTTlRSUk3?=
 =?utf-8?B?dnpkNzNPSmhtYjNHcHdNVndHdlZtWVVlMzZVM2RwUmNVdzc3aEFLaUJLZ2gr?=
 =?utf-8?B?NnFiMWRRbWZ5V29tbjYybVZTSi9nRFR1NDhKQmZUYkNUUXpEYk1LLytVdlFx?=
 =?utf-8?B?M1hqL0RMN2t4MDB4ZWxaTlR0d0JiSU1GRGV1NU43QmlqUmpCVmRJZDVIdW4z?=
 =?utf-8?B?YW1MMzRlakJEcmNyTE1ZUnhJekQvUmZ5Yit4OGU0MDAvMmNpTS9ldkxxNWkw?=
 =?utf-8?B?VmxKbndteEJMaENMcGF1aWs4OXk1bm9rb25zcXZldEpoZVFIUEtnbTdjL0VV?=
 =?utf-8?B?TWIzZk1BQmlhZjBFYzZoai9yUzEvUWVybHBBdlRHMitneTJ0bUtwM1JJSHNW?=
 =?utf-8?B?WkZmaGZFQUtEWDRwYTlUbDgwdThPL1RhQmxJUUU4M0Q3MVo3UFB5R1IvaXU3?=
 =?utf-8?B?NWorZVdoZzJ3SkZEbVBIUzRsaGUvOTloMGJYV1EzQ1R6UXo4amRuT1dTVEVz?=
 =?utf-8?B?OXRWVGFENEMyazNucHAxMktWUHd0ZXlQaElqWFhFWVcwSndBVEhNeVplOWti?=
 =?utf-8?B?RmpiQUxIMlBiaXVnUlhGeVFFYzQyVnV1OS9uekdMdjdXMC9zai9oKzFHWjc3?=
 =?utf-8?B?VThLT0hLN2pmZHJCdjRBdW1GQUwrV1k1WUlCMnJtbi8yQkxLRjhrQndRbVlE?=
 =?utf-8?B?eHJWNUhWenFvMUxjV281aE5ZQjNsNy83SW1PNWpKWTR3eVZRMG1EOStXUS9z?=
 =?utf-8?B?OGNMVlFHRzIyQkt0Zkg3TzRXQlFQVTB6cXRiNWtxcjFIeDJuODFFT0RMVnA1?=
 =?utf-8?B?N2cxZmNTNGlRbXRIWWR3QUZCZjlyRGV3VVFZWXhsTjkwbEhlOHZhQlZ6RVpi?=
 =?utf-8?B?dU8zdEdPWGZYRmsxOGpqUzlqQ1pXWmZxaTdSNGpBSWhORHB2cUpkVzlsQmc3?=
 =?utf-8?B?Y2Fza3c2N1RWSWdtYjdxZE5aQ212RlphbDBEd2YxbU5pQzdnd0VLYm15MHpl?=
 =?utf-8?B?dnpIR3Mzdm1DMC9tUVZyZWlpcmVac2dEVDFxay9DVHlqM2ZKVXNCelBqUDMw?=
 =?utf-8?B?WTA2R0EvaTdUMlBMU0Y2VUFMamNhL3RFR1kzQ1ZwT3ZJQVRqZ1JHU1d4c0hE?=
 =?utf-8?B?NS9MZ1Z4NkRDYzVVbFVuWVpYL09uVUdydUxGSEJUdDB2a1F1SGs0dDFLODN1?=
 =?utf-8?B?eWRnMlhDY2xRa3JuTmkrSDhxcTFlWXB2L0dmQktVR3p6bkVTczRZcktiRWwz?=
 =?utf-8?B?WDlvMGlvUkpIN0VyZ25lL3ZtSk1TTURsU1hURHZJbmNwN3FNbEY3dXFkOGo0?=
 =?utf-8?B?QlROdThCT2Vuc3N2QnBza1BoNDU5UUpnKzh3QTJzN09CVWljODF1aFJMZ21q?=
 =?utf-8?B?VDU1MWlQRFVHZjIwejBKdU16QzBsNFpaQXVIb0R3RmxXa2dBUTExV0ZxdEly?=
 =?utf-8?B?Wm1OazRUcGpYd0xtREFKUjJqOWhtWlhNeVZrQndvS3o0NDByUGpwTDRVM2tz?=
 =?utf-8?B?blliUGQ3Q0JROVJJU25idjN6eE9DSXE0Qjg4ZTA2WTdJa25HRlcvL0tpb0ZJ?=
 =?utf-8?B?OStyd2R6ZEZXWGY3ZnBFR3ViOGxydWUzM2FTS3dTWEhHSnZwOEtCOU9hTGhI?=
 =?utf-8?B?ZDJubTBZZHZ4SXk1bGl2dXNFY2pINDExZ01tdGNTQmFLY25QRHpyeW9aeGIy?=
 =?utf-8?B?NFNsVjA0T3o2MmY2TEExcXNDSURabDJYWWVJck5BNDcyS0RHVm5pL0JxeTNi?=
 =?utf-8?B?NTVyaFRzK29DM2FlVzYvRmsxRjloOTIvY0Z3dGE5UGpZUWVycTc0aGZtcHdP?=
 =?utf-8?B?Vi9LeWFkampDZzBVbEJJWWhweEw3NVhIR1F3Y1g0RU96ZkZQcjliSVE0YjlL?=
 =?utf-8?B?bUNUUE9HQ3ViWUhZdk4xemNTVWJzaHJZa2RHQWdzVVRVV09IOE9lanlYdnhT?=
 =?utf-8?B?dkNrendTOUNKbXFaa200SWErMTBBcm5SKzZicjlGMHcvcktSZUZZZEJyY3Bi?=
 =?utf-8?B?MThUeW10d1M2YmtEYWpEU05YeHJnQ3g5NUUybUlKamgycDk2enF3dDYzZjhy?=
 =?utf-8?Q?qYxAtPc6s81orP7igX234vonT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2076dc67-0f73-4f3b-3aa7-08daad707926
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 23:13:00.8555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5j9DE9z1k8VM1WZUEzvJzLvl0xvsbvF1WVii7Vmn2lOg1Yklup+V8qg3FSZCT3M4DdvU5fK9zN2Eg6f/DWiAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130130
X-Proofpoint-ORIG-GUID: VgIonJ5qOO7orgHHXwkJ09ViMF_g_Zgz
X-Proofpoint-GUID: VgIonJ5qOO7orgHHXwkJ09ViMF_g_Zgz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------9niG61WXDoP8rcSCyuDSFdGg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jason,

On 10/12/2022 10:02 PM, Jason Wang wrote:
>
> 在 2022/10/12 13:59, Si-Wei Liu 写道:
>>
>>
>> On 10/11/2022 8:09 PM, Jason Wang wrote:
>>> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com>  
>>> wrote:
>>>> On 10/8/2022 10:43 PM, Jason Wang wrote:
>>>>
>>>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>  
>>>> wrote:
>>>>
>>>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>>>> backend as another parameter to instantiate vhost-vdpa net client.
>>>> This would benefit the use case where only open file descriptors, as
>>>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>>>> process.
>>>>
>>>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>>>>
>>>> Adding Cindy.
>>>>
>>>> This has been discussed before, we've already had
>>>> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
>>>> has been proposed here. (And this is how libvirt works if I understand
>>>> correctly).
>>>>
>>>> Yes, I was aware of that discussion. However, our implementation of 
>>>> the management software is a bit different from libvirt, in which 
>>>> the paths in /dev/fdset/NNN can't be dynamically passed to the 
>>>> container where QEMU is running. By using a specific vhostfd 
>>>> property with existing code, it would allow our mgmt software 
>>>> smooth adaption without having to add too much infra code to 
>>>> support the /dev/fdset/NNN trick.
>>> I think fdset has extra flexibility in e.g hot-plug to allow the file
>>> descriptor to be passed with SCM_RIGHTS.
>> Yes, that's exactly the use case we'd like to support. Though the 
>> difference in our mgmt software stack from libvirt is that any 
>> dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ) 
>> can't be allowed to get passed through to the container running QEMU 
>> on the fly for security reasons. fd passing is allowed, though, with 
>> very strict security checks.
>
>
> Interesting, any reason for disallowing fd passing?
For our mgmt software stack, QEMU is running in a secured container with 
its own namespace(s) with minimally well known and trusted devices from 
root ns exposed (only) at the time when QEMU is being started.  Direct 
fd passing via SCM_RIGHTS is allowed, but fdset device node exposure is 
not allowed and not even considered useful to us, as it adds an 
unwarranted attack surface to the QEMU's secured container 
unnecessarily. This has been the case and our security model for a while 
now w.r.t hot plugging vhost-net/tap and vhost-scsi devices, so will do 
for vhost-vdpa with vhostfd. It's not an open source project, though 
what I can share is that it's not a simple script that can be easily 
changed, and allow passing extra devices e.g. fdset especially on the 
fly is not even in consideration per suggested security guideline. I 
think we don't do anything special here as with other secured containers 
that disallow dynamic device injection on the fly.

> I'm asking since it's the way that libvirt work and it seems to me we 
> don't get any complaints in the past.
I guess it was because libvirt doesn't run QEMU in a container with very 
limited device exposure, otherwise this sort of constraints would pop 
up. Anyway the point and the way I see it is that passing vhostfd is 
proved to be working well and secure with other vhost devices, I don't 
see why vhost-vdpa is treated special here that would need to enforce 
the fdset usage. It's an edge case for libvirt maybe, but supporting 
QEMU's vhost-vdpa device to run in a securely contained environment with 
no dynamic device injection shouldn't be an odd or bizarre use case.


Thanks,
-Siwei

>
>
>> That's the main motivation for this direct vhostfd passing support 
>> (noted fdset doesn't need to be used along with /dev/fdset node).
>>
>> Having it said, I found there's also nuance in the 
>> vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation: 
>> the fd to open has to be dup'ed from the original one passed via 
>> SCM_RIGHTS. This also has implication on security that any ioctl call 
>> from QEMU can't be audited through the original fd.
>
>
> I'm not sure I get this, but management layer can enforce a ioctl 
> whiltelist for safety.
>
> Thanks
>
>
>> With this regard, I think vhostfd offers more flexibility than work 
>> around those qemu_open() specifics. Would these justify the use case 
>> of concern?
>>
>> Thanks,
>> -Siwei
>>
>>>   It would still be good to add
>>> the support.
>>>
>>>> On the other hand, the other vhost backends, e.g. tap (via 
>>>> vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as 
>>>> parameter to instantiate device, although the /dev/fdset trick also 
>>>> works there. I think vhost-vdpa is not  unprecedented in this case?
>>> Yes.
>>>
>>> Thanks
>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>
>>>>
>>>> Thanks
>>>>
>>>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>>>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>>>
>>>> ---
>>>> v2:
>>>>    - fixed typo in commit message
>>>>    - s/fd's/file descriptors/
>>>> ---
>>>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>>>   qapi/net.json    |  3 +++
>>>>   qemu-options.hx  |  6 ++++--
>>>>   3 files changed, 27 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>> index 182b3a1..366b070 100644
>>>> --- a/net/vhost-vdpa.c
>>>> +++ b/net/vhost-vdpa.c
>>>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, 
>>>> const char *name,
>>>>
>>>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>       opts = &netdev->u.vhost_vdpa;
>>>> -    if (!opts->vhostdev) {
>>>> -        error_setg(errp, "vdpa character device not specified with 
>>>> vhostdev");
>>>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>>>> +        error_setg(errp,
>>>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= was 
>>>> specified");
>>>>           return -1;
>>>>       }
>>>>
>>>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>> -    if (vdpa_device_fd == -1) {
>>>> -        return -errno;
>>>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>>>> +        error_setg(errp,
>>>> +                   "vhost-vdpa: vhostdev= and vhostfd= are 
>>>> mutually exclusive");
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    if (opts->has_vhostdev) {
>>>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>> +        if (vdpa_device_fd == -1) {
>>>> +            return -errno;
>>>> +        }
>>>> +    } else if (opts->has_vhostfd) {
>>>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), 
>>>> opts->vhostfd, errp);
>>>> +        if (vdpa_device_fd == -1) {
>>>> +            error_prepend(errp, "vhost-vdpa: unable to parse 
>>>> vhostfd: ");
>>>> +            return -1;
>>>> +        }
>>>>       }
>>>>
>>>>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>> index dd088c0..926ecc8 100644
>>>> --- a/qapi/net.json
>>>> +++ b/qapi/net.json
>>>> @@ -442,6 +442,8 @@
>>>>   # @vhostdev: path of vhost-vdpa device
>>>>   #            (default:'/dev/vhost-vdpa-0')
>>>>   #
>>>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
>>>> +#
>>>>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>>>>   #          (default: 1)
>>>>   #
>>>> @@ -456,6 +458,7 @@
>>>>   { 'struct': 'NetdevVhostVDPAOptions',
>>>>     'data': {
>>>>       '*vhostdev':     'str',
>>>> +    '*vhostfd':      'str',
>>>>       '*queues':       'int',
>>>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] 
>>>> } } }
>>>>
>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>> index 913c71e..c040f74 100644
>>>> --- a/qemu-options.hx
>>>> +++ b/qemu-options.hx
>>>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>>       "                configure a vhost-user network, backed by a 
>>>> chardev 'dev'\n"
>>>>   #endif
>>>>   #ifdef __linux__
>>>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>>>> +    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>>>       "                configure a vhost-vdpa network,Establish a 
>>>> vhost-vdpa netdev\n"
>>>> +    "                use 'vhostdev=/path/to/dev' to open a vhost 
>>>> vdpa device\n"
>>>> +    "                use 'vhostfd=h' to connect to an already 
>>>> opened vhost vdpa device\n"
>>>>   #endif
>>>>   #ifdef CONFIG_VMNET
>>>>       "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>>>> @@ -3280,7 +3282,7 @@ SRST
>>>>                -netdev type=vhost-user,id=net0,chardev=chr0 \
>>>>                -device virtio-net-pci,netdev=net0
>>>>
>>>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>>>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>>>       Establish a vhost-vdpa netdev.
>>>>
>>>>       vDPA device is a device that uses a datapath which complies with
>>>> -- 
>>>> 1.8.3.1
>>>>
>>>>
>>
>

--------------9niG61WXDoP8rcSCyuDSFdGg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Jason,<br>
    <br>
    <div class="moz-cite-prefix">On 10/12/2022 10:02 PM, Jason Wang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6310b693-b885-3242-9579-92f189f0d1b5@redhat.com">
      <br>
      在 2022/10/12 13:59, Si-Wei Liu 写道:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 10/11/2022 8:09 PM, Jason Wang wrote:
        <br>
        <blockquote type="cite">On Tue, Oct 11, 2022 at 1:18 AM Si-Wei
          Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>&nbsp; wrote:
          <br>
          <blockquote type="cite">On 10/8/2022 10:43 PM, Jason Wang
            wrote:
            <br>
            <br>
            On Sat, Oct 8, 2022 at 5:04 PM Si-Wei
            Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>&nbsp; wrote:
            <br>
            <br>
            Similar to other vhost backends, vhostfd can be passed to
            vhost-vdpa
            <br>
            backend as another parameter to instantiate vhost-vdpa net
            client.
            <br>
            This would benefit the use case where only open file
            descriptors, as
            <br>
            opposed to raw vhost-vdpa device paths, are accessible from
            the QEMU
            <br>
            process.
            <br>
            <br>
            (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
            <br>
            <br>
            Adding Cindy.
            <br>
            <br>
            This has been discussed before, we've already had
            <br>
            vhostdev=/dev/fdset/$fd which should be functional
            equivalent to what
            <br>
            has been proposed here. (And this is how libvirt works if I
            understand
            <br>
            correctly).
            <br>
            <br>
            Yes, I was aware of that discussion. However, our
            implementation of the management software is a bit different
            from libvirt, in which the paths in /dev/fdset/NNN can't be
            dynamically passed to the container where QEMU is running.
            By using a specific vhostfd property with existing code, it
            would allow our mgmt software smooth adaption without having
            to add too much infra code to support the /dev/fdset/NNN
            trick.
            <br>
          </blockquote>
          I think fdset has extra flexibility in e.g hot-plug to allow
          the file
          <br>
          descriptor to be passed with SCM_RIGHTS.
          <br>
        </blockquote>
        Yes, that's exactly the use case we'd like to support. Though
        the difference in our mgmt software stack from libvirt is that
        any dynamic path in /dev (like /dev/fdset/ABC or
        /dev/vhost-vdpa-XYZ) can't be allowed to get passed through to
        the container running QEMU on the fly for security reasons. fd
        passing is allowed, though, with very strict security checks.
        <br>
      </blockquote>
      <br>
      <br>
      Interesting, any reason for disallowing fd passing?</blockquote>
    For our mgmt software stack, QEMU is running in a secured container
    with its own namespace(s) with minimally well known and trusted
    devices from root ns exposed (only) at the time when QEMU is being
    started.&nbsp; Direct fd passing via SCM_RIGHTS is allowed, but fdset
    device node exposure is not allowed and not even considered useful
    to us, as it adds an unwarranted attack surface to the QEMU's
    secured container unnecessarily. This has been the case and our
    security model for a while now w.r.t hot plugging vhost-net/tap and
    vhost-scsi devices, so will do for vhost-vdpa with vhostfd. It's not
    an open source project, though what I can share is that it's not a
    simple script that can be easily changed, and allow passing extra
    devices e.g. fdset especially on the fly is not even in
    consideration per suggested security guideline. I think we don't do
    anything special here as with other secured containers that disallow
    dynamic device injection on the fly.<br>
    <br>
    <blockquote type="cite" cite="mid:6310b693-b885-3242-9579-92f189f0d1b5@redhat.com"> I'm
      asking since it's the way that libvirt work and it seems to me we
      don't get any complaints in the past.
      <br>
    </blockquote>
    I guess it was because libvirt doesn't run QEMU in a container with
    very limited device exposure, otherwise this sort of constraints
    would pop up. Anyway the point and the way I see it is that passing
    vhostfd is proved to be working well and secure with other vhost
    devices, I don't see why vhost-vdpa is treated special here that
    would need to enforce the fdset usage. It's an edge case for libvirt
    maybe, but supporting QEMU's vhost-vdpa device to run in a securely
    contained environment with no dynamic device injection shouldn't be
    an odd or bizarre use case.<br>
    <br>
    <br>
    Thanks,<br>
    -Siwei<br>
    <br>
    <blockquote type="cite" cite="mid:6310b693-b885-3242-9579-92f189f0d1b5@redhat.com">
      <br>
      <br>
      <blockquote type="cite">That's the main motivation for this direct
        vhostfd passing support (noted fdset doesn't need to be used
        along with /dev/fdset node).
        <br>
        <br>
        Having it said, I found there's also nuance in the
        vhostdev=/dev/fdset/XyZ interface besides the /dev node
        limitation: the fd to open has to be dup'ed from the original
        one passed via SCM_RIGHTS. This also has implication on security
        that any ioctl call from QEMU can't be audited through the
        original fd.
        <br>
      </blockquote>
      <br>
      <br>
      I'm not sure I get this, but management layer can enforce a ioctl
      whiltelist for safety.
      <br>
      <br>
      Thanks
      <br>
      <br>
      <br>
      <blockquote type="cite">With this regard, I think vhostfd offers
        more flexibility than work around those qemu_open() specifics.
        Would these justify the use case of concern?
        <br>
        <br>
        Thanks,
        <br>
        -Siwei
        <br>
        <br>
        <blockquote type="cite">&nbsp; It would still be good to add
          <br>
          the support.
          <br>
          <br>
          <blockquote type="cite">On the other hand, the other vhost
            backends, e.g. tap (via vhost-net), vhost-scsi and
            vhost-vsock all accept vhostfd as parameter to instantiate
            device, although the /dev/fdset trick also works there. I
            think vhost-vdpa is not&nbsp; unprecedented in this case?
            <br>
          </blockquote>
          Yes.
          <br>
          <br>
          Thanks
          <br>
          <br>
          <blockquote type="cite">Thanks,
            <br>
            -Siwei
            <br>
            <br>
            <br>
            <br>
            Thanks
            <br>
            <br>
            Signed-off-by: Si-Wei Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
            <br>
            Acked-by: Eugenio Pérez<a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>
            <br>
            <br>
            ---
            <br>
            v2:
            <br>
            &nbsp;&nbsp; - fixed typo in commit message
            <br>
            &nbsp;&nbsp; - s/fd's/file descriptors/
            <br>
            ---
            <br>
            &nbsp; net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
            <br>
            &nbsp; qapi/net.json&nbsp;&nbsp;&nbsp; |&nbsp; 3 +++
            <br>
            &nbsp; qemu-options.hx&nbsp; |&nbsp; 6 ++++--
            <br>
            &nbsp; 3 files changed, 27 insertions(+), 7 deletions(-)
            <br>
            <br>
            diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
            <br>
            index 182b3a1..366b070 100644
            <br>
            --- a/net/vhost-vdpa.c
            <br>
            +++ b/net/vhost-vdpa.c
            <br>
            @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev
            *netdev, const char *name,
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(netdev-&gt;type ==
            NET_CLIENT_DRIVER_VHOST_VDPA);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opts = &amp;netdev-&gt;u.vhost_vdpa;
            <br>
            -&nbsp;&nbsp;&nbsp; if (!opts-&gt;vhostdev) {
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;vdpa character device not
            specified with vhostdev&quot;);
            <br>
            +&nbsp;&nbsp;&nbsp; if (!opts-&gt;has_vhostdev &amp;&amp;
            !opts-&gt;has_vhostfd) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vhost-vdpa: neither vhostdev= nor
            vhostfd= was specified&quot;);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            <br>
            -&nbsp;&nbsp;&nbsp; vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR,
            errp);
            <br>
            -&nbsp;&nbsp;&nbsp; if (vdpa_device_fd == -1) {
            <br>
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -errno;
            <br>
            +&nbsp;&nbsp;&nbsp; if (opts-&gt;has_vhostdev &amp;&amp;
            opts-&gt;has_vhostfd) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;vhost-vdpa: vhostdev= and vhostfd= are
            mutually exclusive&quot;);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; if (opts-&gt;has_vhostdev) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdpa_device_fd = qemu_open(opts-&gt;vhostdev,
            O_RDWR, errp);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vdpa_device_fd == -1) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -errno;
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +&nbsp;&nbsp;&nbsp; } else if (opts-&gt;has_vhostfd) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdpa_device_fd = monitor_fd_param(monitor_cur(),
            opts-&gt;vhostfd, errp);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vdpa_device_fd == -1) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_prepend(errp, &quot;vhost-vdpa: unable to
            parse vhostfd: &quot;);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = vhost_vdpa_get_features(vdpa_device_fd,
            &amp;features, errp);
            <br>
            diff --git a/qapi/net.json b/qapi/net.json
            <br>
            index dd088c0..926ecc8 100644
            <br>
            --- a/qapi/net.json
            <br>
            +++ b/qapi/net.json
            <br>
            @@ -442,6 +442,8 @@
            <br>
            &nbsp; # @vhostdev: path of vhost-vdpa device
            <br>
            &nbsp; #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default:'/dev/vhost-vdpa-0')
            <br>
            &nbsp; #
            <br>
            +# @vhostfd: file descriptor of an already opened vhost vdpa
            device
            <br>
            +#
            <br>
            &nbsp; # @queues: number of queues to be created for multiqueue
            vhost-vdpa
            <br>
            &nbsp; #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (default: 1)
            <br>
            &nbsp; #
            <br>
            @@ -456,6 +458,7 @@
            <br>
            &nbsp; { 'struct': 'NetdevVhostVDPAOptions',
            <br>
            &nbsp;&nbsp;&nbsp; 'data': {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '*vhostdev':&nbsp;&nbsp;&nbsp;&nbsp; 'str',
            <br>
            +&nbsp;&nbsp;&nbsp; '*vhostfd':&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'str',
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '*queues':&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'int',
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '*x-svq':&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {'type': 'bool', 'features' : [
            'unstable'] } } }
            <br>
            <br>
            diff --git a/qemu-options.hx b/qemu-options.hx
            <br>
            index 913c71e..c040f74 100644
            <br>
            --- a/qemu-options.hx
            <br>
            +++ b/qemu-options.hx
            <br>
            @@ -2774,8 +2774,10 @@ DEF(&quot;netdev&quot;, HAS_ARG,
            QEMU_OPTION_netdev,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configure a vhost-user network,
            backed by a chardev 'dev'\n&quot;
            <br>
            &nbsp; #endif
            <br>
            &nbsp; #ifdef __linux__
            <br>
            -&nbsp;&nbsp;&nbsp; &quot;-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n&quot;
            <br>
            +&nbsp;&nbsp;&nbsp; &quot;-netdev
            vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n&quot;
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configure a vhost-vdpa
            network,Establish a vhost-vdpa netdev\n&quot;
            <br>
            +&nbsp;&nbsp;&nbsp; &quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use 'vhostdev=/path/to/dev' to open a
            vhost vdpa device\n&quot;
            <br>
            +&nbsp;&nbsp;&nbsp; &quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use 'vhostfd=h' to connect to an
            already opened vhost vdpa device\n&quot;
            <br>
            &nbsp; #endif
            <br>
            &nbsp; #ifdef CONFIG_VMNET
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;-netdev
            vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n&quot;
            <br>
            @@ -3280,7 +3282,7 @@ SRST
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -netdev type=vhost-user,id=net0,chardev=chr0
            \
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -device virtio-net-pci,netdev=net0
            <br>
            <br>
            -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
            <br>
            +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Establish a vhost-vdpa netdev.
            <br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vDPA device is a device that uses a datapath which
            complies with
            <br>
            --
            <br>
            1.8.3.1
            <br>
            <br>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------9niG61WXDoP8rcSCyuDSFdGg--

