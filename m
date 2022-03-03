Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F64CC209
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:57:54 +0100 (CET)
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnpy-00009x-0i
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnt-0005ah-5Q
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnq-0005d5-MZ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:44 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223F2IXu011429; 
 Thu, 3 Mar 2022 15:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LWH/lLeEh4lWWeFjNOyFrPlE16ZHgemIX+wSDjeTvmQ=;
 b=QKZx6HBtFpqplJTsF91eFu2V7+bFb2RiNrguqn+6yrHNyJ0TO5vee8wiaYIlHaedobxv
 iCkzdQFDrz7WCYIPXQ0tmZWojT0Sx5CIQLTKM2vInKbTsXvwld2eiEEojVdlQlMBPdIn
 1ig3UX0T4Kgsm6N7JOFVpN6Xz9S64YP2kQ7tymjAAXwXiw2Ilzdx+pTk3eA8nwoboAht
 11QLFo62dohcmLyYlOvg5S4aIN3qpHo2kz+JrGhmPZYih6ZcJAFPAffdJvtdiuvPypCs
 V/w5hm5GJMACsir5gzQSaTjH0k1FS39rIRwMCsCUhftYFSx2icPkxgJCWYZvSpoLVPH6 fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehdayyhsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Foxj8050573;
 Thu, 3 Mar 2022 15:55:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by aserp3020.oracle.com with ESMTP id 3efc18wwds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjSNy8vazZT7tkJIPiRlOKp2ixaCyBsiQ5kV9RBIM2blgXCNbykJ1nUL9xiHvyvDb/C0z4MVOb0smzRNw4XTT788STFJoMpztg5OU3n9ki8cpDkmQUi/yUN2Osqt6ZL7LskMXyHT59xc37VO0n2+WS77DNyFX4QLc42kXnCXPOTC1vM6D6kUsiyAS7Uo91u/8GUCgYE+/xSwnl5MHrBnA4jkW/4Ofwwz4chqW0Ll4kVBZsX3XWIUShAU3hFrUWXkzzYRaEEnSHD9uyqBW4p0w4T0v9Rx8UQTF8Yd2mlnryPjeiwVtNwwTVB3iFz83vwE+Xwt3H2m5eZLVr4myixhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWH/lLeEh4lWWeFjNOyFrPlE16ZHgemIX+wSDjeTvmQ=;
 b=j7EvjLWujG6X+8H/SwIqimwUp4xnw6tDbpfpMDDWXyjiezafQQ/2hfSqbXvIA1cZgOHHGa9fqUUZkxjyy5Y1SdVAnJxJlvwy4nRrWoVFZYnw2ZOL0w7phZLYFf0zmkzLjo0gf/Xf9zMdobDoqqvnhtdskfvHajRsaMTWCLJOiUwPWWiwoDT26ym/3vNZqKhVZwzDKr3sjOkt8TZmQGor6Xya1eWNKiKcM5tBPu8/lU6uEMjF0BqkspPIj1JYzDm31lftkioOULSL32RQgLs7ChOC3kUObFKn2JRzOxROUX36CelIOHVK39k82CTaED0SsCsbOWUdWwSHG5toR8FBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWH/lLeEh4lWWeFjNOyFrPlE16ZHgemIX+wSDjeTvmQ=;
 b=zbdRo/m1PoYxJOIpQwYfHFiZ61BHib2xiXhlzE6ME5IC3WlPFO8NX06fL2M42uTAKVmikguXgzl//jvPmTkZ6HVzkvUcLxMpZpt35vRZYqIAyRX4x+xTec8ua/sRr79taJGFhWzbmgK2/GsyEAM4HJY2O7QYPzrE2qQx1+DuKdw=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM5PR1001MB2234.namprd10.prod.outlook.com (2603:10b6:4:2c::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:55:31 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:55:31 +0000
Message-ID: <a27a9887-6ede-7d81-e3e7-a76a1ecf23a8@oracle.com>
Date: Thu, 3 Mar 2022 10:55:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 01/29] memory: qemu_check_ram_volatile
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-2-git-send-email-steven.sistare@oracle.com>
 <YhfOaab2tT6SDWnN@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YhfOaab2tT6SDWnN@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:806:d1::11) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5406184-e283-44aa-c89d-08d9fd2e3ea8
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2234BAD61991061644AC0EE1F9049@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YKYSAXSSgG96hu7HOIlZygLJQYrElPR94Mz/AfQIMe8aHwW+YpRVF0Ccc6lrnzFnK40SYzqJYtWsvgrCJ6o0uOUHY+xH9UXXnO/QM0GYH169ubl6taRGO4Mg6Z4wkvCHbToY1mGibcBPbHPl1JB5u20BUa6lwd1n7Gif+J6TX32c47LFEZjKEQk1OtUomq/3OHJeDOe2EJ0B4G+M70c0AX70gOD6S4Vvl1zobDqyu5quEb4FHDeBJEO3WUY50iGtC9c5ndJgyrKnIdn/XZGY8ijRV4fyoc3lQ+AUOsopCyjleHHEVpZtIzW40Qm5SH0+WU4Zp9zfhpGKR02+vkVZ9cpPHB3bplQlBEAuTwLb3apkL/DxoZtZgjY3MAwBWgLvOicIzw/p8TS8fXqIAH2PAqgPNVW40y9WpMfS31Q2gSSRUB/JCRLV7j0ei7iePD/FQE0gcy6hU5AZkmyIGonxnK3WsRx8v6F24PfkqMYjGf1bGwTFLxyz9zR1oWiKILHZ7BAeBDR3VapU2u6beN2Y54ryIGupGQzrpYGI/5GKpEK/JSTN29yEX6ytqxbS7iAJC62ynLoqSTdKXRDZmcMQrLYWv17rSbeRSQFh5Y+OJU7cikKe+4EtMOU/hQSlDMa3DrDzePqSYM2itmTM1jUiWLgjiUadbIcBippDLbytjS10tdq2jtF+lp/JA5ugX3f/ersM8yKt/ZPxGbFNPmIuQLXhZ+H6jLwGuz/A481z0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(186003)(508600001)(26005)(2616005)(31696002)(7416002)(8936002)(5660300002)(86362001)(44832011)(66946007)(8676002)(66556008)(66476007)(54906003)(38100700002)(4326008)(31686004)(6666004)(6512007)(83380400001)(2906002)(6506007)(53546011)(316002)(36916002)(6916009)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVWYW4xS011UEpqWDAxVmxubXoybXViK1hDSlQ1KzBvaDF3STBva09uTGFn?=
 =?utf-8?B?UDZxYlp1TkFEbGYrYWxJTS94cWpjSFh3V0FuSjROWi9aeGZqb2ZJYzlOTHdH?=
 =?utf-8?B?Mm1YWFdLRGw1TFo3V3dZQ2wvbC9xWkJMa0VNZCsyS0ZiUm5GQmhiMFQwdG5m?=
 =?utf-8?B?WHo2RkI4Sy9NbStoZXdBTVk1L3dWL09kMkxDdUZ6dU1EY0RlWlR5Z0lvQmpL?=
 =?utf-8?B?cEY1NmJZYmhDQUNlRjJvRlBnNVUySDBzemxPYlJXbmFIVTdqWU1jOCtxMCsx?=
 =?utf-8?B?d3pZbC93SWcxUFRIQTF3T3Azd1JlNGJGOWRkSlJiaEUzUVZYVXdMWXBscGth?=
 =?utf-8?B?WnJWOU1SZ21EZ0Zja3lBOUNNWDMyVFYrdmU3Sm1VakJHaVVEQlQzY1F5SWJ3?=
 =?utf-8?B?ZUNUSWdrMUNTdVdWZm1CdGlxU1BsaDlxZGRTWjVWQWNQN0hsbWhxSkFaT2Qz?=
 =?utf-8?B?THc1b3N6d01abnJUTUU3SUZPWVVlM1ZOQmdOQ0xBR2F2R2pvVW5JdjNlUGJR?=
 =?utf-8?B?SEJxY3FtbURpK3dRV3ozcFlQNU9HQnpXbVBjRTlKQnlnMWFKbVdUdHUxeUVX?=
 =?utf-8?B?VVpvU0lBWEJhTFY5MEprM1F1UkdaSllxOVhIa2pQdUVGbjRpQy9KNkZ5SllB?=
 =?utf-8?B?RWk5YmNISGVYeGltQmdWaGtJWDFXa3V5VFBicGJhY1pBNEFYc2x4UFdhVjZU?=
 =?utf-8?B?T1hsTmNlQzRISGhkVEtDQjQ5Z2NQUFJPMEdvcHduTDhTTmVNY01KcDRmcUFK?=
 =?utf-8?B?SHU0RS93bHNJdktPcUlyUTBFT21FNzhMYit6eDZFdDB4YXE5SmZYdVNEZ3g5?=
 =?utf-8?B?RjRXTGZaeWNOTlh1TEdkMFlRd3VEZFZ0NS9nMTBWcnZmenEvVmh6RHdBenRY?=
 =?utf-8?B?UW15NnlFaXlEMnhhK1dwbjlDdXZHdmdBTXRBU1J6VUxIVHJpeEF2ZDVZaWsv?=
 =?utf-8?B?NnVOSmpSSkpmY29jV1J6RjB1cTVTbWlNOFlzVERMNGl6bWFuMUZ1bXBkLzZx?=
 =?utf-8?B?OWViMklsZGsxam9TbG9YbTk2VmgvVmZJWFJXN0dpQ1NGU2NrUytyOXFLd2w1?=
 =?utf-8?B?ejBEMXAvdldjRnd1aWNzQTdnMm5Cd1c1QVp1OTY4UGhNN25Nd0pVcUpyZk8x?=
 =?utf-8?B?eDg3U29ZSlVoM1MrK3dqeFVGZ2pKczNQL1N3Q0F6YUh3NFBkQzArT2g4VmlW?=
 =?utf-8?B?QTBaUW5rcVJ3ZjRZSDdGa1FIZ25PQkoyelkxU2s0TUdRSWJsKy9WTS9CQ1Jl?=
 =?utf-8?B?NVM0TVdnUks4UTl4YnhST1A1N2pGMXB3NndIYWIyZU9nTGtQTjhjalkzVnli?=
 =?utf-8?B?NUZSWE9reTdvOE5QM2tiT2pPOThKZHpvTWJremZKaWNOMFZTQTdXVi8vem40?=
 =?utf-8?B?ZW15b012b1QyMm5Ma0U0L1ZRcWd3VmlObWZJNXAwWDRrOWVscFQ2V0RQaEhj?=
 =?utf-8?B?clVLeGZyZ0E3V3ZCUmpPRzlJOWRQQSsrckFtakkyeUtncTY0Mm5GR1UrSTZk?=
 =?utf-8?B?c1lKaDhLcjdWdU03UjJTSWovQnQybHhZcEExRDhReG9NbzN2MU4yaXJ3TnVm?=
 =?utf-8?B?dEhkZE1FUzdvb25icnVBOEJsaHkyT1R4QllNeTlWb2VBQVI5T3JESFRiWENL?=
 =?utf-8?B?QkM2dGRZaHlYaWxObytHNFZ4YWZpeHhrRm1EdlZ4ZCtDUHN6Z0p5b2tuQWJa?=
 =?utf-8?B?MkxvV0hQL2ppYlBOVGg4dWdMR3IzWkJra1FDM1dCY0U0WCt1VkdUMjhVOGhl?=
 =?utf-8?B?YUNvZDEreVE4MkdIWE5CVEx0b2YrcmljRno5TllGRUQyYlR6MzlIOVVOcU55?=
 =?utf-8?B?enk3M3VUR0pmdmozNldJNUZ5cXpKNUxVM2JiVittTWxiaTI0Sjc5dTVzblJ1?=
 =?utf-8?B?ZXEwL0k2T0JrbXNNbGlqUTNtZXoxdjhRK0grR1VmL1Q4WWg3NkNQYWo3RWE5?=
 =?utf-8?B?Q1F3Ly81SzFTYkxQZ2V5RzNlME5sQi9WeURvcHlkOVpob3p4YnNUVjR3V1Ar?=
 =?utf-8?B?N2EwS3d5OVNrYTZqaDhkdmp1KytwRFBXUkdvNERzZzl4dzdzckFHVXEwUVha?=
 =?utf-8?B?ZzFCZ2MwTzJLa016Wnp0WVNNQlI3QzVtdklJWktBSTlUdU1kb3BVZ2srVDJR?=
 =?utf-8?B?RE01Q0w3aUp3QWFVV0ljNW9EOG5kT256OEpCRm5SdUEvd1paMjlvc25QOENk?=
 =?utf-8?B?VlhPdDhRbFpVUEtic0RRTVV3TmZxWlBJS21nckhjSzcyR1p6bi9IVnF3WFpm?=
 =?utf-8?B?MkRyN2lnQTdJRVVWTTlRd0grOTZnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5406184-e283-44aa-c89d-08d9fd2e3ea8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:55:31.2457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQZacduXA+gec3NHkfa5yGlAUF+/S+Gji08Qnt+IVLiOYbtXC9tZHI9nyN9mTGpTMZ/Ink8nTF9NgtNVfpdYmKpvy+wSs9egY2m8ZXMGyIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030076
X-Proofpoint-GUID: cDr5yvtck7yPlw1TuBM2AGrVeHft40PE
X-Proofpoint-ORIG-GUID: cDr5yvtck7yPlw1TuBM2AGrVeHft40PE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 1:28 PM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> Add a function that returns an error if any ram_list block represents
>> volatile memory.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  include/exec/memory.h |  8 ++++++++
>>  softmmu/memory.c      | 26 ++++++++++++++++++++++++++
>>  2 files changed, 34 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 20f1b27..137f5f3 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -2981,6 +2981,14 @@ bool ram_block_discard_is_disabled(void);
>>   */
>>  bool ram_block_discard_is_required(void);
>>  
>> +/**
>> + * qemu_ram_check_volatile: return 1 if any memory regions are writable and not
>> + * backed by shared memory, else return 0.
>> + *
>> + * @errp: returned error message identifying the first volatile region found.
>> + */
>> +int qemu_check_ram_volatile(Error **errp);
>> +
>>  #endif
>>  
>>  #endif
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 7340e19..30b2f68 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -2837,6 +2837,32 @@ void memory_global_dirty_log_stop(unsigned int flags)
>>      memory_global_dirty_log_do_stop(flags);
>>  }
>>  
>> +static int check_volatile(RAMBlock *rb, void *opaque)
>> +{
>> +    MemoryRegion *mr = rb->mr;
>> +
>> +    if (mr &&
>> +        memory_region_is_ram(mr) &&
>> +        !memory_region_is_ram_device(mr) &&
>> +        !memory_region_is_rom(mr) &&
>> +        (rb->fd == -1 || !qemu_ram_is_shared(rb))) {
>> +        *(const char **)opaque = memory_region_name(mr);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +int qemu_check_ram_volatile(Error **errp)
>> +{
>> +    char *name;
> 
> Does that need to be const char *name for safety since you're casting
> it to it below?

Will do, thanks.

- Steve

> Other than that,
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>> +
>> +    if (qemu_ram_foreach_block(check_volatile, &name)) {
>> +        error_setg(errp, "Memory region %s is volatile", name);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>>  static void listener_add_address_space(MemoryListener *listener,
>>                                         AddressSpace *as)
>>  {
>> -- 
>> 1.8.3.1
>>
>>

