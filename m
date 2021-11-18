Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAD455976
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:53:18 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnf2b-00028e-0z
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnevR-00022h-HF; Thu, 18 Nov 2021 05:45:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnevO-0006yr-QR; Thu, 18 Nov 2021 05:45:53 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI9c4WQ019268; 
 Thu, 18 Nov 2021 10:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BuNJxWhD1S9CEyXX88Qbv5TRtb3qdeOtM6bQDNcxuYA=;
 b=TsnwnloYeA1QDOHnqo/gfja8xSxg2Y3OXxfXkvSUJ272R2cANgBWQvhQJ7eDOCA7SuuA
 xjtcAI9DWJ5Si+HKb4PeL5q/pq0zdBRBrF/Z7iyzuNpjHzPYU6NyIKYU//fV++VG5aga
 f4An2wYj8h72hccl6Qt8QlCCt0QS9rmsbi+IuNq/8x+bjDAQsOG6jUURaltZBDgUUU55
 4wLnbKinV0j+CgVUitHmPss75WMG/9QOJvFeDUt2SMblK+ETj6OzijWoKsBD1MQeHJJ0
 psV74mj6i+Tebh6pgaaJaVYP6yojuyHMafMcsfRJHDjt2bM5wI+Eo8N59cpHZah62jhl gw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2w8x38k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:45:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAjAq9192804;
 Thu, 18 Nov 2021 10:45:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by userp3020.oracle.com with ESMTP id 3caq4vt1wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:45:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERhC2Suwc/079SaSDzVfrCMCYXHGOakQX2arEqpXaq1vTT4AMD4hPfi+2K1v+c+MAlYJ9k7J7OUeJzIfXJPr/NkNUenQuCikolCIOhde119u7c5BUdqNNX9U21yghf9fGkqNc2Bzxnh49aOH7o7nFPH0xOccTlrHxn3KMAgWMd0UgkFqAwneq1Au8SGFtwlEEYvtAfWTR6nXT55kyDRRVtKHpIJYOAgZ6NN1a1K01lqKo3hxg8+drX2h3URPD6oe9h50faptbwjUM3CZAbYTIYz2CDNIiR1vkTrwlNT/odY52Xl8jxqs4hD49fgJCMj7oYZOyZUmKbeBDuk0eQGN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuNJxWhD1S9CEyXX88Qbv5TRtb3qdeOtM6bQDNcxuYA=;
 b=QU7eKevKWrItFlXek8b2fqVvHVHmaTa2J/khvLisEH6rVHmFmv/k907fCT/LaYirGrTfqSXeeBHX9QG+fPbSx7R7vSTlgN/xbtONnM2ZAhXzXi1iEM1Evh1cflGsmLpxPFBOtJlBrTG1F7O7B5yncp3iR2p9y506ZBQTSR35JRFyNtSj0pTiQeVge9GZAmVaMufaqicPw8cD+3hrJhRKhzqtbbr3FU/TaM7RhcMhpt3H61+PP1WawMZinHm0rLwOpyzNg0eVruYYUqJA2utD4eWuw/zmWouc4brfmnPiRF0T3sai+K+gUV2NL/5Dn6RD0GZJUxhF1wzefEWUGx3IdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuNJxWhD1S9CEyXX88Qbv5TRtb3qdeOtM6bQDNcxuYA=;
 b=r3ehucf4z4au/vWm4zP2yKR3AfLj1RYc9Suk/CTNOXqLEH2qd1VQqxDIh8EmGdi7110zYcW6ePEG4gPIxlZ+Ypx8ROWgHo2mnBWTt/COTFrxz8AI1AjBINE5PfA+rJmMXasgodKyH0hKk7IpCy6aFlBE8wOChgoWo6JOBmD+2zg=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4048.namprd10.prod.outlook.com (2603:10b6:208:181::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:45:28 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:45:28 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2 v2 0/2] hw/block/fdc: Fix CVE-2021-20196
In-Reply-To: <20211117232422.1026411-1-philmd@redhat.com>
References: <20211117232422.1026411-1-philmd@redhat.com>
Date: Thu, 18 Nov 2021 10:45:23 +0000
Message-ID: <m2mtm1n3ng.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR06CA0049.eurprd06.prod.outlook.com
 (2603:10a6:10:120::23) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB8PR06CA0049.eurprd06.prod.outlook.com (2603:10a6:10:120::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 10:45:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 756a26b9-bfca-4bab-a5d6-08d9aa808929
X-MS-TrafficTypeDiagnostic: MN2PR10MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR10MB40486572BC47D9C725B63104F49B9@MN2PR10MB4048.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZ39VJSJYfZM1r0ZyuWdr1J+gvkr0TZdWa21hojZaY+2CLDgzFr4wZ4wcNQBfPeQCP3nnwfmTwVExy42in7EnakDfRQqkqjGU3E8bP3Pp5vm0QdGUKFxlo+tHHIHs0wO2hiBt9CJ5MZoWFdC0QXwCMzjPhe2qIjXPmrKuIsz5XRg5XSQ40gvFQ1H+8tpG5HTbY/CIpRxi6DO0faiP7m4sa3vLF04LYQKLZRrHsZD1Zl+O0rxVr/0lYME5vrDUEZsJ7gh1RI+tO7cgR18dpgsfShl5+q0qCunFqTm2tjZb5MovqxvWVHTe35KnMvtGDSZJGlSmuYFN8wCrwszJxCU2kRbqI4SQarGic2DkHnM02juYDBDeTJwld7Q2t705plW6o+opZKTwtBGw8By/N6gzxI5HQ2wkCU9eCv0JaEtThL6U6T11bssp2SwR4JkjK0eDZjedc8i1xn1zHSCbpmUcBmfgie9HlmRYlP2SWZaBOuXRp/Qqi9ioO6PjPtHC6yOCFZVI+CCShWodYy0TK5mZ68RNbvUdP4Bbf4PnWwWXncpkPTE1Ny4keU8gJ8T8cCTCMUHvFWMSfbbFHtEUgdb6XjTPQyxKkI53XosBcsXTXydKHYu3nX2oaNF87/nbZOCmLjHySkK38fSlckBgppYdbt9ezfsJ5RMpI4hTbnv624Hxf3WZW0RjgkYVbyHApGp0udT4Ma33DbiCkJqTyAlXsxdCdX8un1K+uCuCRJpLMXBMkYt+1m+CsdrSaNVK9Q/EdwhC3IGw5cAnhr2ye1d9uaFIZ6Fkka5MrXt8vp1jbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(8936002)(83380400001)(2906002)(186003)(66476007)(316002)(66946007)(4744005)(4001150100001)(956004)(66556008)(966005)(4326008)(8676002)(44832011)(508600001)(55016002)(5660300002)(38100700002)(38350700002)(6666004)(54906003)(8886007)(52116002)(86362001)(36756003)(7416002)(2616005)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elduNFN4UXNSSmhERjBaT2UrSS82MWtjMWJiWCtPanVpVUdVdEhjSmRCNnVq?=
 =?utf-8?B?K0FYRkJickkxek10dmNXUy9SVytkQmd3Qmo5T0czOWRjZzV6dXZNTFBIenJ5?=
 =?utf-8?B?RFZlQ0lPdkVobW9JZ3ZvSE9lTnBBMGNVUFpIcFhCZEliMlY2YmNzQTgyS3Fu?=
 =?utf-8?B?QjMxdHN5UHBoZ1ZzL0Z1TmdiNGtYd2VGR1BEUElEemZoQWpVUXFPTlZOUXZM?=
 =?utf-8?B?djk0RWtoVGgxK2Vmb1FhUjBrYUg5eXRGYncyNTRkTyt1T2Jwb0JmMnBZYmh2?=
 =?utf-8?B?WlhYRSs4emgra0xvQ2g2bGxxVE9HQkcyK2kzalMyL3Y0TUo0dE5KOVdLZWZu?=
 =?utf-8?B?M3dwYkdkUXBlb2NGMUVlSzFBTUI1TERlTUF5N2xaU1NpZHdVem5udUhEYzA0?=
 =?utf-8?B?Qm4wN1FMR0RpbjROWDMzcTJkaDdSME1NdUlsN011TmorTDA0bkcyem9kWjE3?=
 =?utf-8?B?b1YrMHk2ZmphQlZBcHhLc25sa2d2ZnJRY1BnVG4wdURCdzBwWFlpYkt5LzEw?=
 =?utf-8?B?NVVWTHhKUHJ1bmtWM3B4OUpzeXFiU3c2NXB0ZmtCQ0hZZUdmYU5TNU02RGRy?=
 =?utf-8?B?ektZbzhZbW1GM2Jla0pnclRiK2xwS1lMVDFNU1ZDQW1pV2oyNC9SbTA4NWtZ?=
 =?utf-8?B?Vlg5Q1pMWGkvUS85MGgyeUZOL2VoSmdmZkxrd0NxWWFObXU5aUJjUGdEUHV4?=
 =?utf-8?B?YlFuM1dWSHRDNzhmM3M4SE90Sm1kbitiQ0tqTTV1L29UL0pCOFRZNWdzQ2xl?=
 =?utf-8?B?VkdzMHRvRGhZRjlGOS9tc2Z0dzJ1bUxyWkFGRWpXZFZ2SVQwNkZDQjNKWWhK?=
 =?utf-8?B?S3RaS0tJenVkeWI3RWNITkpja3BDU1FDQ1FWTnFOQjVLWnlzeWtGN1JJb3RJ?=
 =?utf-8?B?UCtsR1JvYTVtVzlRZEc0SmlOcFNNUTlpNTZCS2VTSHNJenBFWnBrSXBDUEFs?=
 =?utf-8?B?UFdNZm1MTXRjOUJ2aXQwNHYyMDFFTHNtWVd0SytOd05zUE9GRXBqcy9RZVpm?=
 =?utf-8?B?V1VHZnQxNlY1RFEwZTRsVWtKTFhEK2J5WFZ5cGVQYys2dmZLMGtqd0R4QmQ5?=
 =?utf-8?B?RXhCYnArdGxZK2V1aWhCK1M2NG05c1UyVU9ZZ3BCeDVYRzI4YkxKWTBwbzA2?=
 =?utf-8?B?VnFDeDV4T1B4emVQNmdsVlRJUUpxbE0zZm5FKzVVMFRITUhiWXYzdnBVLzF4?=
 =?utf-8?B?Qjg3Y2U2MXMrUGpHd1BoR25mYkx5d0N3b1RrM1BQUStHdUp6SnZ0VUlGUHo3?=
 =?utf-8?B?bkFJZDJ2Yi9YNENOK2l2K2VxOGRSWHZqZkdDNjAvV0dwcHNXalVIN1ZmWVVr?=
 =?utf-8?B?aDJEMWtkNTFydVJXUGJhSW9kUnB1OUJndGNsLys2U29ONXA4bVZ3L1hKM2xW?=
 =?utf-8?B?REtNZmQwWEFaTTlRY0YrS3owbVVuNS9CR3k4SDBQUVliRXdTYzhpVW5jbW9l?=
 =?utf-8?B?dUZuaFduTUV3TGZ1Wm8zMXVLc2thL2haUWhNeWFROTlyNGZWL01TNVY1RHd1?=
 =?utf-8?B?QzlCVWo4QnRhYWdVdzcxMi9paXRuSllyQUx2em1IcHpCSXl2WksyOFE4RUhQ?=
 =?utf-8?B?QmZjeDF6Z3YvUlJDbDB5Lzh1YWVBSHFrNzRaS0E0dDNvdFUwMG9pZ2NUMURz?=
 =?utf-8?B?OGZ4SGs4NWl5MzE1alEvUkNZU2FhNFQ1QURNaEdnM1RLaDFnWUcwb2FhT21y?=
 =?utf-8?B?QzdPVCtubC85K3hJbmRhYi9jT0RzNHRuK1RVZ0J2bW5walZRUjZpK1gvb01h?=
 =?utf-8?B?UHI3cUNwVjVORkp4d0RHc3BEOS9hMzBJZVY1VFB5V25hSEd4TyswZHNWY3VD?=
 =?utf-8?B?NE9QQ3orN1JicVV4N1BWd3graWJhck5RYnJwTGFScEdxdXV2VTY5ZnQxTEFT?=
 =?utf-8?B?MU44N0djOHNLYzVFSXlYTmYyL25ZeCs4YmtqQXo3YXZVM1NCN081ejBOOTV1?=
 =?utf-8?B?Vk9wNHBXUjZTOWhmZGZqcVhDcnpmclZFYy9Gbk9ZNjVlRHFYc0ZMbWZVZjlL?=
 =?utf-8?B?TU5rWUZyQzR4dExKcEEvRkppTzVEVXo5ekRyaWFySlhqS0FtNE9nU0NpdkNB?=
 =?utf-8?B?djdNM2dVYnVrYlBQWENIZFp6RmRwcWdDM0I0bVJlZHRyT0MrODg3OHhldmpD?=
 =?utf-8?B?VlBvU3N0d3Fud3NHc2FqTVNwK3FpN2h1UzgzRzJpWnF4Tkk0WDduZkVjKzZU?=
 =?utf-8?Q?xxFUZkqQeQvSUdEMNw3bH7A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756a26b9-bfca-4bab-a5d6-08d9aa808929
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:45:28.5410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muh+NEeu4jVSCXf6jIZ8YeZpgeJ9QsA7TFAypmaMk1Ckq9HIvumSyx33KVk/325yENX4SxY1a/fiSKVChnFyBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4048
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180063
X-Proofpoint-GUID: uDG8DMtb8sFSALW1i69VAdLZ7d3bwNxc
X-Proofpoint-ORIG-GUID: uDG8DMtb8sFSALW1i69VAdLZ7d3bwNxc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

Apart from a nit on patch 1, all looks good, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Thursday, 2021-11-18 at 00:24:20 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> I'm not sure what happened to v1 from Prasad, so since we are
> at rc2 I took a simpler approach to fix this CVE: create an
> empty drive to satisfy the BlockBackend API calls.
>
> Added Alexander's reproducer along.
>
> v1: https://lore.kernel.org/qemu-devel/20210123100345.642933-1-ppandit@re=
dhat.com/
>
> Alexander Bulekov (1):
>   tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>
>  hw/block/fdc.c         | 14 +++++++++++++-
>  tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>
> --=20
> 2.31.1

