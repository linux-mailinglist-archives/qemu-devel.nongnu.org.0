Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80596449C06
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 19:55:04 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk9nL-0007jB-CI
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 13:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mk9mP-00073x-Gv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:54:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mk9mM-0008Mu-5O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:54:05 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8IME34007564; 
 Mon, 8 Nov 2021 18:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zy3OABIyeeuqjADWoiNHUEYgt+5itkUzkfQc9bKvxWE=;
 b=FtkVUv1o0fN2uKv5JV3o76OSxTWEDLx8h8ZecrkNZjm9GePPuoUi3pLg3Cazua+jKz3h
 X6bXspjPGODNLXKZigZE4eBgCef4pMN7nPKFtFfNiHVhTYK8iXzVC1rPMCdtEMw8E0iR
 aTA+89n7V5LMz4gzHOWgwdVEamwx93oPUbuthufZ+ZnS+TTwCa/tuglZqqY7LSchaU64
 lfdU8JvhyKWuSopsXGgfQ1CUv3tFSHfjHO4PSWv2n7HRzIeIeGNxffTmekibU9a021CF
 Tlj5eIkxLpfnjWRTH1w1r5zjsqCic7p2BUDjZdsuw7M7RTVF6jkr/p7M5hl3A+lzXOsS qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk54c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 18:53:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8IVLDw038760;
 Mon, 8 Nov 2021 18:53:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3c5etue90w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 18:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtkWiGmXF2HhLSZhk6Y3bSXToksHj2/cpZ04Bu4b1WY//NYu9cFqT7N+48Chq6UtFaukbHOviju2L05TNeVpYH2LQEsm6nW1mF2HRSVlNjHcuN15qBdFuom8yY421Z7HL9rX3qfDD9YpM1NKsJkKCWKbFft7TeLz7y2yJtrbslirKPXPDRercoKRKSv9tjsgexreoVVnxGtAsvUBe+/9ohthBjUDqKl+Is0/P+0c0o9azxtHiDfsvqPutB3J/C/yBbPZf3QjDxLb4PT2ZR1epQ1DcpCGpq/0PIBaUENAqJG79h8wtfUg2ZnpsQrLKV/13xx3iAvRyUEa0X7ddrzBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy3OABIyeeuqjADWoiNHUEYgt+5itkUzkfQc9bKvxWE=;
 b=CKOJQOlAT9OV47n0mPQ/W2o3NEnjx9B+jHuq6vMw80+1BIdhW7Zim0pq/IbK0C7Se+EzjjulxeQAOj6eyETF3UpIEqfSUAtQM9oxoU5uBRJBtdyutKDvn8dulasuxZixa8JcTnLiq5482zTJBHc4WOqrXPjvDHhjwM+7054EXykoEUEXpszQn/tGPT9gigfpBok13LzHUHh0g8R3/j7QqkLvkEOwpxAuwGlcfbM6BebWebb7Y1vuNcRN0lEU2pUZ40DcYxW2hPwQGI18knA5mzk2bGVi+DZQWWqFtWrcEU5oMr0WHKNtc8WjQp4DbMOMn4767qxCgyz36mkYXhBAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy3OABIyeeuqjADWoiNHUEYgt+5itkUzkfQc9bKvxWE=;
 b=T7xNzD2cM8lc1ZSTdFDOmqFxaIYlaKll3Q+JGNOHxZTo25EeeWGPSf4aFxsBjEDiMcdsq8BeuJUnG41ahdMM3dAvWzSuLKvakfuQBa1avtsUkoYSMIm2uOWG+UwlA8tqwpPMiFVrFu283rLfx1xnQ67aAxL5Z+iTk8rrkkFrDIw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM5PR10MB1418.namprd10.prod.outlook.com (2603:10b6:3:e::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Mon, 8 Nov 2021 18:53:54 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 18:53:54 +0000
Message-ID: <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
Date: Mon, 8 Nov 2021 13:53:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
From: "Annie.li" <annie.li@oracle.com>
To: qemu-devel@nongnu.org, jusual@redhat.com
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
In-Reply-To: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:805:de::20) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [10.39.228.151] (138.3.201.23) by
 SN6PR05CA0007.namprd05.prod.outlook.com (2603:10b6:805:de::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.4 via Frontend Transport; Mon, 8 Nov 2021 18:53:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1c2fe42-1e46-452c-22ce-08d9a2e91ca9
X-MS-TrafficTypeDiagnostic: DM5PR10MB1418:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1418D4B6CCB7EDF575398489E5919@DM5PR10MB1418.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaSdQADFv7AvbQl00io7MnXzSjvd19u6EfxWYMnI1rFiEF1VjgwZMsO0UCVd28VOju8lonb42M2GXKNCrFb81ppC5snV3RUGf/7LYXdMg/c1Wz3upF7awZXrzoIAV8oWTcoungRhgaFzjLgGSA0S6rh4kAdKKSU+a/QQxl8vltGr+XFalUQIU0AW5TlKN4PNsJrZoOR3eGDj1eezRKEP1/XQMvpMoK1PTML9vT6JJsTeu30uOAoA+QklA6JUnAmTUeUdbzacoCgOyS710LxJZ7S81FO21n+yuFLQ1hlAMNCusLgu/aRgjutNbvKn+akRJ2JPwsMQFs/gQrtPzqs2OUZIYNUplvksyZo0LMdIAlN5fmxKxLi6CWw1O37LJje5T1Sp3VCAEXbemW9vryf/M3rMlBk1IUOK4J4KP59Cq/VDyWzvzBYb0gKgotHlYO8g5y8EXkVFINUP+k89bMpzdVrm9CsynYRz83HyO+RFjXAJQMmihGs7R1bR5Nvtx98pdyy1Xq74NJTel6fujYFFdie+RYeXyIEFkhVOP9sI9lXvwjdAtHgQLf62TI5uHGTHemBVz8MQqBlLXxG1etC1dQ8JdUPbp1RundbX/vEtO0mScVt3CvBomVOQF+gpCfpMBoIT5CWVB8FRIA8sQTDYB0sBe1C4xp4ujAOxrhq4HYfKC+6NseD/gw7ZY0/gVvkb8NO7SsWXJUpnbkj+hBwU/9vFCii+dAWyYTFh+IVvqeyx7u4WxGcpaHq2SNBh1zGzOTF5Ui5K+lhZ9Px4FrHxBtppp1pFFXVAxL+C9WlsahS/OYaWwmSN4eLEZ806AArG/BuCPc4Ts4zkTY0G5KMuSIxz/R7yKhXtdW+ooCSH6A0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(16576012)(31686004)(8676002)(6486002)(36756003)(4326008)(53546011)(8936002)(83380400001)(86362001)(38100700002)(2906002)(186003)(26005)(66556008)(66946007)(966005)(31696002)(66476007)(5660300002)(2616005)(508600001)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FUbW1FbDg0ejJGUE5QcE5aWnE0eDFOTGtzbTRxSzhuZ1crdlRRNVJlMjk5?=
 =?utf-8?B?eEoyTlFGZUxOTE05RW9sN1NBZjBRSXNTWU9qRmFheVRFQ0ZZMmNGbXB6T28w?=
 =?utf-8?B?c1JLTUdFZExHMFpneUtVL05IRmM0TmpoYWRTRXNyVXE5eDhoOVdFNjRhSk05?=
 =?utf-8?B?VUJQaTlnVmV6V1puREZoQk9IaWVyOWtPTWhGeHNnZTM3RUExaVd2VWY4NDYx?=
 =?utf-8?B?SHRuUWhTQWlKei9oTVoydi9NUjdaSGU1cmlVNnBBclB3OEtZY3l4ZnJ2YnlI?=
 =?utf-8?B?Wksyd2lNZ0dsdmU2cWhmaFRTd3QyZFEwM3IzNUN3eDhsOTFLK2labDlMWmNT?=
 =?utf-8?B?ZzlrNDg5T1NGVlJmTk5tMHJaR0plSkM5SDB6Yml5UkZTdnVtWTgwVlh4RW4x?=
 =?utf-8?B?eTVteW16dFpMNHA3WUxQZmxKNmtNU0VWK3docU92TnY2RHhKR0hDQnhHV0J3?=
 =?utf-8?B?OXNPaFBVeFAraExDWlUwQzVyZ0VrSGtBeUZhUit4ajBieC9IVlorU2Jrclls?=
 =?utf-8?B?R2dNTkpHRUVZcGVQUXhqZU5EemZTWmc1cWllZEk0VnZoNU1tQk82cjUxRHVN?=
 =?utf-8?B?M3hvTGd2cFJIMlp4Zzg5aEQvZHR1WHhGTHdIZGJ0aXhCMmdyNFh3NThLTnpw?=
 =?utf-8?B?L1dkZG9tbC9jV3g4TmtnRmV4VmtXSUdPNlV4Yk5YQkFZbWhuVjRUbTB0VXMv?=
 =?utf-8?B?eTlESi9QUmtnS0I5Snlmd05mVFJzbG9nR2NrMmRKeDA2Tnl1aU9ad01iQW1p?=
 =?utf-8?B?SWlKZ0N0MmN4SlBqL1pqUkFrOXAySng4bmY2aWxEKzAvRXBDT3BETmVMbUJP?=
 =?utf-8?B?a2NmK3lxQ1h4TlBvYzRoMXA5aFJHMXB2TVlsTTJlb1VZT3RJSkZLcEpPVnJt?=
 =?utf-8?B?NWtJdnpGZ1V0a0pTeUp5Um91a0dhOExreEhOdkc1MUJWUU1qU1dod3RSemd3?=
 =?utf-8?B?cmRqZzRaeC9FbUJNZVV0a3RDTkJMRVg5Uk12MnJ6RElYbDJidXY4RDZnU2I5?=
 =?utf-8?B?aTh6ZzUza0dDbEkxV0JCRlVGNVhHY2pESzJDNkdzeWJVUGNSMEtyZ3VHRU1Z?=
 =?utf-8?B?VXc4NEd2dm1RV2U5cFcvWVZHbkxLcXdLOXpid1huUVpYaGgxblhUTGlQSTZw?=
 =?utf-8?B?UFNRcFFaQ0dIMzFkTDBzelJHRDE1Z0xwdkVwcy9qUWk0ZkNPMzBha1FJaHhz?=
 =?utf-8?B?QXlPZDMzL2tOekpyL1VSdE9QM0pWdTl4YXROekM5UFN3WjNGWnJKMVJENFJr?=
 =?utf-8?B?S0YzRkZPbHEyYTNENldqWkQ3akhlSkt2WmdKc1E4MjR0TEMrWW1DWkF2YU9Q?=
 =?utf-8?B?OS9GWXRTaGlZYklONGZIazhvZDhuSXlQOHhtSVB4eDlDWGFJb3NaM29HZmlZ?=
 =?utf-8?B?Wmx4bFhzbGZvYk1ET091ZnVXdEpzUDMrem44YjVoNUJUa0VvaDV4alpxNDhR?=
 =?utf-8?B?NmJ4S3gzVk9NY255MGdEbVk0Z2dDMmlmZklRc2tCMGtpZDU3UUQraUZUdkJn?=
 =?utf-8?B?dlEyZnRINU9IWFk0akJTNjZ5Umo0dmtpeUJvRWRReW1aMExaOCtwT1haZlpS?=
 =?utf-8?B?YmY3WlNiZkpuazlpbVllYXZnaVlzZUNvUTBKZy9PeDFjdVdoZkJ3UjNmTVUz?=
 =?utf-8?B?ZGdoZGRLbHU3Uk4rMVlZOW1hRzdIbHBSNS9tbFBHdXNkYkxIRkd0SEdqUldv?=
 =?utf-8?B?OGFoRTdCa3BYdGpYM2Y2RmJYUFhoTjNVK28wdUgzTXFTSVlBc3lSZVRFZXZK?=
 =?utf-8?B?SjlHaG1IVWN1eGZERWJ1ZTBRNTRhSDFDcU1udnJqRzdqNUh2NFlvWlp1Z01C?=
 =?utf-8?B?NFRhUVVUeGxWOGpwcmVKRUdYMzhaZzAzakxUaTdtRHF3QXg2MHV0MjRrTzRl?=
 =?utf-8?B?SW9kR1J0azd0T3JYdkxBU1MwSUhzL3NKcWxpQUo2c2NQdTkwQStXc0VNVTQv?=
 =?utf-8?B?SStvQW5yZXg0Ny9MOWhSRGthQmRoemlhdXd3NEo0eWUzdk1ZT0hkS1pBbUM1?=
 =?utf-8?B?RkNLZGFsdzhSUkF6dnpVbUg3Sk0xQXZuLzVYa21vUk91WXBSaXJMR1pxL2lG?=
 =?utf-8?B?Q2dPV3dVSlY5aGJtMlZ1UnlPZC8wVFJpbXRwQUpoQm1INDJGWFpkSWZLTWt4?=
 =?utf-8?B?cllXdkFMN3I3Y1ZvY2VJVEg5Z3Y2WXFneUpYVkVPS1gvYy9qZHB6aFMvQ01Y?=
 =?utf-8?Q?8kQhJsB+/hiCuZ8FGhAuORo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c2fe42-1e46-452c-22ce-08d9a2e91ca9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 18:53:54.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SABMTQzp3qayEGMlv99PKj3HG2stZ+1/zDzBSpnuw8XI7zrKoHM6p/+Pe3TJDtNbYiepERha4QKC62Hx4x09Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1418
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080111
X-Proofpoint-GUID: mcsZsdnTCWRiNgAOZV2A99lHxiDvhZMo
X-Proofpoint-ORIG-GUID: mcsZsdnTCWRiNgAOZV2A99lHxiDvhZMo
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Julia

Not sure if you've noticed my previous email...

After switching from PCIe native hotplug to ACPI PCI hotplug(with 
patches 
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03306.html), 
I've run into the secondary virtio_blk hotplugging issue in Windows q35 
guest.

Now, it seems Linux q35 guest also runs into issues when 
virtio_blk/virtio_net device is hotplugged, both devices fail to get 
proper BAR memory assigned. After hot-plugging  virtio_blk device, dmesg 
shows following error,

[  111.131377] pci 0000:03:00.0: [1af4:1042] type 00 class 0x010000
[  111.131815] pci 0000:03:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
[  111.132206] pci 0000:03:00.0: reg 0x20: [mem 0x00000000-0x00003fff 
64bit pref]
[  111.135050] pci 0000:03:00.0: BAR 4: no space for [mem size 
0x00004000 64bit pref]
[  111.135053] pci 0000:03:00.0: BAR 4: failed to assign [mem size 
0x00004000 64bit pref]
[  111.135055] pci 0000:03:00.0: BAR 1: no space for [mem size 0x00001000]
[  111.135056] pci 0000:03:00.0: BAR 1: failed to assign [mem size 
0x00001000]
[  111.136332] virtio-pci 0000:03:00.0: virtio_pci: leaving for legacy 
driver

After hot-plugging  virtio_nic device, dmesg shows following error.

[  144.932161] pci 0000:04:00.0: [1af4:1041] type 00 class 0x020000
[  144.932613] pci 0000:04:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
[  144.932999] pci 0000:04:00.0: reg 0x20: [mem 0x00000000-0x00003fff 
64bit pref]
[  144.933093] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[  144.935734] pci 0000:04:00.0: BAR 6: no space for [mem size 
0x00040000 pref]
[  144.935737] pci 0000:04:00.0: BAR 6: failed to assign [mem size 
0x00040000 pref]
[  144.935739] pci 0000:04:00.0: BAR 4: no space for [mem size 
0x00004000 64bit pref]
[  144.935741] pci 0000:04:00.0: BAR 4: failed to assign [mem size 
0x00004000 64bit pref]
[  144.935743] pci 0000:04:00.0: BAR 1: no space for [mem size 0x00001000]
[  144.935744] pci 0000:04:00.0: BAR 1: failed to assign [mem size 
0x00001000]
[  144.937163] virtio-pci 0000:04:00.0: virtio_pci: leaving for legacy 
driver

This error in Linux guest looks similar to the one I posted in Windows 
guest earlier, there are memory conflicts among these hotplugged devices.

I am using Linux host version 5.15.0, the qemu version 6.1.0(patched 
with 
https://patchwork.kernel.org/project/qemu-devel/patch/20210916132838.3469580-3-ani@anisinha.ca/), 
OVMF version stable202108.

If I switch from the ACPI PCI hotplug to PCIe native hotplug with 
following option, these errors are gone.

-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off

However, with PCIe native hotplug, we have been seeing other 
hotplug/unplug failures, for example, deleted virtio disks still show in 
q35 Windows guest.

I am wondering if anyone has seen this kind of errors with ACPI PCI 
hotplug in q35 guests with latest QEMU version?

Thanks

Annie

On 11/1/2021 10:06 AM, Annie.li wrote:
> Hello,
>
> I've found an issue when hot-plugging the secondary virtio_blk device 
> into q35 Windows guest(2019) with upstream qemu 6.1.0(+1 patch). The 
> first disk can be hot-plugged successfully.
>
> The qemu options for PCIe root port is,
>
>  -device 
> pcie-root-port,port=2,chassis=2,id=pciroot2,bus=pcie.0,addr=0x2,multifunction=on 
> \
>  -device 
> pcie-root-port,port=3,chassis=3,id=pciroot3,bus=pcie.0,addr=0x3,multifunction=on 
> \
>  -device 
> pcie-root-port,port=4,chassis=4,id=pciroot4,bus=pcie.0,addr=0x4,multifunction=on 
> \
>  -device 
> pcie-root-port,port=5,chassis=5,id=pciroot5,bus=pcie.0,addr=0x5,multifunction=on 
> \
>  -device 
> pcie-root-port,port=6,chassis=6,id=pciroot6,bus=pcie.0,addr=0x6,multifunction=on 
> \
>
> The command to hotplug 1st virtio_blk disk is following, the PCI slot 
> of the 1st virtio_blk is Pci slot 0(PCI bus 1, device 0, function 0).
>
>  drive_add auto 
> file=block_10.qcow2,format=qcow2,if=none,id=drive10,cache=none
>
>  device_add virtio-blk-pci,drive=drive10,id=block-disk10,bus=pciroot2
>
> Following is the related "info mtree" after the 1st virtio_blk device 
> is hot plugged
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>     00000000febff000-00000000febfffff (prio 1, i/o): virtio-blk-pci-msix
>       00000000febff000-00000000febff01f (prio 0, i/o): msix-table
>       00000000febff800-00000000febff807 (prio 0, i/o): msix-pba
>     0000000fffffc000-0000000fffffffff (prio 1, i/o): virtio-pci
>       0000000fffffc000-0000000fffffcfff (prio 0, i/o): virtio-pci-common
>       0000000fffffd000-0000000fffffdfff (prio 0, i/o): virtio-pci-isr
>       0000000fffffe000-0000000fffffefff (prio 0, i/o): virtio-pci-device
>       0000000ffffff000-0000000fffffffff (prio 0, i/o): virtio-pci-notify
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> Right after the secondary virtio_blk device is hot-plugged, a yellow 
> mark shows on the first virtio_blk device in the Windows guest. The 
> PCI slot info of the 2nd virtio_blk is Pci slot 0(PCI bus 2, device 0, 
> function 0). The debug log of Windows virtio_blk driver shows a 
> "ScsiStopAdapter" adapter control operation is triggered first, and 
> then "StorSurpriseRemoval". From the following "info mtree", it seems 
> the 2nd virtio_blk device is occupying the same memory resource as the 
> above 1st virtio_blk device. Maybe this causes the failure of the 1st 
> virtio_blk device and then the system assume it is surprisingly removed?
>
> The command to hotplug 2nd virtio_blk disk,
>
>  drive_add auto 
> file=block_11.qcow2,format=qcow2,if=none,id=drive11,cache=none
>
>  device_add virtio-blk-pci,drive=drive11,id=block-disk11,bus=pciroot3
>
> Following is the related "info mtree" after the 2nd virtio_blk device 
> is hot-plugged,
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>     00000000febff000-00000000febfffff (prio 1, i/o): virtio-blk-pci-msix
>       00000000febff000-00000000febff01f (prio 0, i/o): msix-table
>       00000000febff800-00000000febff807 (prio 0, i/o): msix-pba
>     0000000fffffc000-0000000fffffffff (prio 1, i/o): virtio-pci
>       0000000fffffc000-0000000fffffcfff (prio 0, i/o): virtio-pci-common
>       0000000fffffd000-0000000fffffdfff (prio 0, i/o): virtio-pci-isr
>       0000000fffffe000-0000000fffffefff (prio 0, i/o): virtio-pci-device
>       0000000ffffff000-0000000fffffffff (prio 0, i/o): virtio-pci-notify
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
> memory-region: pci_bridge_pci
>   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
>
>
> Note: I've patched the upstream 6.1.0 qemu with following patch,
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20210916132838.3469580-3-ani@anisinha.ca/ 
>
>
> the acpi-pci-hotplug memory is following as expected,
>
>   0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
>   0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-mem-hotplug
>
> Thanks
>
> Annie
>

