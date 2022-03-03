Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD84CC263
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:14:17 +0100 (CET)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo5o-0005u8-37
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnov-0008Cr-De
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnot-0005uA-De
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:56:49 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223F64U3007662; 
 Thu, 3 Mar 2022 15:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cxRgsDhbLNWmN8JBJnyVZH42rxFC2/gj1kVUGxGOlQg=;
 b=YfKc5htpN810otNzE9vKeOVpFUcv6VpwN5WPOdNkxjNHRtaaVERIQ5hiborMaDDenZFb
 o+8owh88AYR5W0VlJKv4Fi7xll59Uuz15rv1iCv8ZijYYjJFbKhCsbLw1wDqF5fERmhO
 MZrSTqr1aguNTLGPMUicnmF04o51oreIg4UiEZ5T/zVBbtlt+Z8YpQwFl7Riu7roTCHT
 I/trc4Nhx4acPYDy70AjahR9W6Hnexc8VwnLcSa8WToiTW6BgIPhSGu1hCWyEhXGG5dC
 l9bWEWtf7u88MR1VNQhnEfMY9IZX3cYbWeUhrP0gkNPVfyOgdqvwMD29/Qu1E9a0tsKS 6Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15arywx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Fu51R078964;
 Thu, 3 Mar 2022 15:56:35 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by userp3030.oracle.com with ESMTP id 3ef9b3pu22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcsVOnTkjbDK7dl/r4InZUm5ZuP13pTRJXqH98Cc+eWEdTYCUTmd2F71pnKXRjlhb2baq29tsA0kjRBx8skeAiXoqQ54GoO0VomLQQzBDK/pgFANXpCG+TmiQ/09q3XOOxHDxWWl1oiN+JqtyBIW1V0Af1GTlmsuJocBLT0Ts3BF5fUXby5GJwrqt4H0+Jbsp0v/W5JMDtORcK5/mYiulZP1NzS2rAgwAEpUNsZ5JXcFOj2hawhC/OmE4yvn7QmmXUzJyNovLLlOVihOu6DIy5i30n8237TW9W3jCFv5e8igdAnlhRBdDvExNlANu6Y+8C+FiscYFyNEN2bajKp4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxRgsDhbLNWmN8JBJnyVZH42rxFC2/gj1kVUGxGOlQg=;
 b=TSEZH0ebtf9bRQ7JkrHv3pm0fk+Z/SjQD0/OIQgR7rp0of52xB59rcuJ59Ccm2d8BXVkkc/g/3CuwYJopquyLkYEe6h4jk1Iio/xnf4tEWzVhsuE+DujFaOjKld0l/xGWx/2KKMFaseBXzcEGmvorDpO66i3MCZ7PyYRlHKHJDhUdbTCkvbmnfcNXy7kUp8efKvbJ1UO6AOuTQScZDVXYO7El0r6wElJ4/8+coQy6ORcwEojGXlrr11tsbjKqFANTqJ5i9ksDayOPEPf6ARp7MZ867ylJo1EopBtypoOCH2ig6NSDorceYiaNlIrf3LKMsAbDreMTkOAJUuzaXvHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxRgsDhbLNWmN8JBJnyVZH42rxFC2/gj1kVUGxGOlQg=;
 b=ucsbZ2p2b9GgsQf554Nn+N1vNaEazBdGpoBGB5eP0SV7TyA1Tf4udF9Xkq7ajHEn10Og/OF7OiRjCRBLyUxL7Ags0uRlv0Q2opFNjtqultk4aR8+E4ino2c1fuQhJzSumOqHzqgziqS3kfZZEP7aukKgYpRit4xDAVZWNJD+1x0=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MN2PR10MB3309.namprd10.prod.outlook.com (2603:10b6:208:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:56:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:56:32 +0000
Message-ID: <945426b0-5588-7aa2-aca7-eeafe7a8f008@oracle.com>
Date: Thu, 3 Mar 2022 10:56:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 05/29] vl: start on wakeup request
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-6-git-send-email-steven.sistare@oracle.com>
 <YhfTxBKb7IIqpsj1@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YhfTxBKb7IIqpsj1@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bdb7305-e8d7-4a58-580e-08d9fd2e62ff
X-MS-TrafficTypeDiagnostic: MN2PR10MB3309:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3309EC8BC24B217508A3708DF9049@MN2PR10MB3309.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dw8mKDYKiJhDpty4n88YfiAkbMzeBSWsYE/KRs6pp9NXI3F9GEhmB3mxhICnKHsAPQCf9aBC4yiv+q9FcMC68Yng+ePhmBqufcNF0SiHZOUGCVwNN2L7w/3ts7fomktx2MFuaOlejW0IppP4N+WXW+qSK7V/TbidgHnV/dse48hXqjJ8QxrWJBxtsfLfsq90IGSo+1b3AhnRzRUr8IPU4XNWiPADXujM+eJ4Q8I3ftIGu6bTtt6kMaIURolyqCFaS1ond0uiHjBybMLCxMNe6/BQ+SbeNUt0a3hQ9JfOF0P/FglMeyVnbx5MaG3hcURXlrOvwwVAClMZfTN5muUitkWd5LYm3sORBlGAM3wwSziCV2i0Y66VdEEjMWMVbNMAmqpZFGYz/5kciVP2ZaC2Rc3I93/oO2rJy78d8Idcqr4iuIEe6z+QrPNrsLNKwiKxKElmvhwGyr9UlZJJe8N7WDBrrF7xBzpnan8evOEByXi2I8u3+6HfJ8CmnEkmqSrPkTHPzeHxE5EX5e1rsZKwkGvVbY517AUbSEy8+PM3AEKVkYhWeQKgs7YQ2SGlJOlsJumuHIYbUc/OZkwFR2kanEir53CksrVPnQcGkBseSBqNHxHEGfKkaNp4hapLzaNqwdysz2fianWV5F/BbQLUdV7VHllR6ShzTFsGxWfV/rZQY52I/p0jLR74YKpzKbirwywF2iNcTQNxSVDfrMQl3L5/jAbDSS5zEnu30TZCaAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(2906002)(36916002)(38100700002)(53546011)(6506007)(110136005)(5660300002)(7416002)(44832011)(8936002)(4326008)(8676002)(66946007)(66476007)(66556008)(6666004)(26005)(316002)(2616005)(31696002)(6512007)(31686004)(36756003)(508600001)(6486002)(83380400001)(186003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9WRVdRWnJMdDd5MnRwSGlyMDZCVG04eGxocStQR2h6ZldsWFF0UXNEd0VN?=
 =?utf-8?B?cDhmNjR5dDg1Zm9Qc2FnNVdTOTZjR0pJeUJvelZmZmNvUUcrc3NwV2ZiQkJE?=
 =?utf-8?B?V1VVN1NWMkxtbWVsZkJZbE5XeWJUbnFXUUtJVGhXNGdBVFhQdkQ5eXRQRlY1?=
 =?utf-8?B?bElrMVlBY2N6Z3RQMnAydkVRTVgwcW54WUlKRXRwcE1rWmpoMU1tQk1GTXRQ?=
 =?utf-8?B?OStzTFh4aldKLzA0cU9EVGg2TTA4b1lkWkFjaTNJVURCb1FPK3pSRTBYMU5y?=
 =?utf-8?B?alZ0cXcwSHFFVnY2cGs5MDVHS3E0aGN3b0NzeUhHaW81QlR3S0t0ZlpHRXdP?=
 =?utf-8?B?eHJDWEY3RUJBWm1KSDYrbWF3bkJhakhvb2lFbW5QaTVoR2RVM2VNRVpKUjhQ?=
 =?utf-8?B?R1dONWRObzNITE91MHdJNDNla3lteXZmd2g1NHYvT1B0NWZ5UkQ4WHdrR1NP?=
 =?utf-8?B?WmhVVnI5bzhsbm90dEEzTTN1ckJzbURSdVI0ZXdFdmx5cjA5ZzgxYlJLSDA2?=
 =?utf-8?B?Q3VhMEVRVVBNQmpuNjhHUjdTUzFsTlc5T0JqcDk0czNyV1RIRFJXMkl1eEtX?=
 =?utf-8?B?dlhjY1lMak5QeHp2ZGhPRGNoMUliR2JlNEZpZlQxaTBxcGQzb3A0MzNac055?=
 =?utf-8?B?N3Q4T2RLUktmWDgweVZ2RWhpNDdMVFZLaldpeWlYczF4eVhCZUlyZ2dHWmRD?=
 =?utf-8?B?REdlRDV2cTNiaTNTNS9FK2NtVU9iUzVXcCtGMGlKVWpUV3pSd2VzVzhTOXV2?=
 =?utf-8?B?WmNPd0Y0ajNDR2xNQ2IzUy9oQXN2QkswV0hBVlZZcm1NOWNKeVlZeWhLTkIr?=
 =?utf-8?B?NUpjWXNsdmQ3U01peXYybmlRcDdCSGZrblZzdEZoaEFPem5NdTlTVUtTMVdX?=
 =?utf-8?B?WG8vZTNkY1lZdG9qaTVJc3V5aVY3OVhTUTFIbjZQdEE3M0RvWEFwQjFLd29W?=
 =?utf-8?B?Mk5zbG8xdkxsRTRpL1BHTWNZSU8zdjFJUnM4a25zU2ZUM0RnZkhHU3I0YWFN?=
 =?utf-8?B?UUNybUREeWhaNlRxL2pVYmNXMlBSYTlhTjl0NTFDK1p1VGpPaTVxdVdkMTZu?=
 =?utf-8?B?YjRlWGtHVnhIdXJIdzRwN2ZVa3piU01CdVJTdGlRM2o4Q3UzZlE4aFFGR0Jk?=
 =?utf-8?B?RWYyVDM5OENoa3NNdFY0L2JVSmZEM1p2bWIzMmMvUTIvS3VERkI3STlsc3lT?=
 =?utf-8?B?SDBITEJ5cFNJSUxIRXZVVlZiMXpxdi91R1NXeTlmb1V1MnkxcENIRFo3RDY4?=
 =?utf-8?B?T01lWmIxZ3lzbTZwbHNFd0U2Mm1OM1k2V3hqTW9PdW9yYXdQc3duUU5VUFRU?=
 =?utf-8?B?Yyt0NmllbVU0RTJqMzl6R0srMTkxWUdqS256c1hyZWZua1RYdmFWTVpRUzRt?=
 =?utf-8?B?bHJtMHI2MWh6aXh1dzVUaVJ2MFU0Tk00aVJ4ZWhMTHBrK2lLMVAzWlhOTEhp?=
 =?utf-8?B?K3FaaEFHQ0Jkc00vbDdESDJkRmFpaUk4RGdJN3lqV1NJTlFzL1B3Y3QrMzBT?=
 =?utf-8?B?bmpJaG1QRmo2cHdjOC9TRXZLbGUycDRacm5LTzB3b3pLa2pid2ZGZVNUdHpJ?=
 =?utf-8?B?SHlxNEtkZCsxMHVCQngrSVNSMjFub3RPbEtFNzFmUytJeHFHVmx3NFJWd3Fq?=
 =?utf-8?B?VE5ybGM3QjFaYnIrVnQ5aTM5azE1d0VPT1FRNThJVVJhNFEybUlyM1N0TzZt?=
 =?utf-8?B?ODJLTEIzUFk2RW9VOVUvdUErTG9ZUzNyOWdqL1lEQlN3SnlVMzBJdmxsUmNa?=
 =?utf-8?B?MTNIWVM2T0x3ZWpidE01QitlRlpIWWlncloya3YzZXBlQkRqa0RmRWh1N3N2?=
 =?utf-8?B?d281NjNVVGI5VVM3Q1cxZ0xINDlGL1ZQYVFsektGWVI5UzkvL2dsMjcrQ09U?=
 =?utf-8?B?MXJzOE9BWkRiWk41QWxDK3VMNUIzM2ljYkVkVlJMYlExcnVJUEJhSE5sWWtz?=
 =?utf-8?B?UFpucGhRZWFMSUM4SzI1TGFLMWlWR3I3NkZaeGc2QW0yeDN0b0pSSjllZ3ZO?=
 =?utf-8?B?ZVhTdnBLUit2V245eEtiaFBEZUoveStwUnJScWkxMUsrdkdUZ3RrSG1zbURq?=
 =?utf-8?B?M0plTUFySk4vYno4YUd2emlRTjc3d2EwZEszN09aa2t0VGtwZXViOFdQRllw?=
 =?utf-8?B?ZWVaWmxNbGJseVhLRlBYQi9nQUtNS3IwYzlJUHgyUHNPUkREY0JRMUM0SWtI?=
 =?utf-8?B?MGx3VnVvZkJLd0VmVWtHakZxR1J4NEFOS3krMEowWUxEYmIzVDhIUndmMWFQ?=
 =?utf-8?B?WVBlK0UvN2ZIaHR4RStNdVBacHBnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdb7305-e8d7-4a58-580e-08d9fd2e62ff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:56:32.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bAlI/AlHvyvYWk34xlli3m5RzuM7yqe/HEnOR6QbY8EvAbznz1zXgNge8HlkNEPS0cE7fimzbd7XS9Up9ixhlibN8bH2g72wd5pMg5ig7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3309
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030077
X-Proofpoint-ORIG-GUID: 8wd_gwjcv2Ij_Do3OJjDV0vx9bmms95G
X-Proofpoint-GUID: 8wd_gwjcv2Ij_Do3OJjDV0vx9bmms95G
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/2022 1:51 PM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> If qemu starts and loads a VM in the suspended state, then a later wakeup
>> request will set the state to running, which is not sufficient to initialize
>> the vm, as vm_start was never called during this invocation of qemu.  See
>> qemu_system_wakeup_request().
>>
>> Define the start_on_wakeup_requested() hook to cause vm_start() to be called
>> when processing the wakeup request.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  include/sysemu/runstate.h |  1 +
>>  softmmu/runstate.c        | 17 ++++++++++++++++-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
>> index a535691..b655c7b 100644
>> --- a/include/sysemu/runstate.h
>> +++ b/include/sysemu/runstate.h
>> @@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>>  void qemu_system_suspend_request(void);
>>  void qemu_register_suspend_notifier(Notifier *notifier);
>>  bool qemu_wakeup_suspend_enabled(void);
>> +void qemu_system_start_on_wakeup_request(void);
>>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>>  void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>>  void qemu_register_wakeup_notifier(Notifier *notifier);
>> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>> index 10d9b73..3d344c9 100644
>> --- a/softmmu/runstate.c
>> +++ b/softmmu/runstate.c
>> @@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
>>      { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>>      { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>>      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
>> +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
>> +    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
> 
> This seems separate? 

The RUN_STATE_SUSPENDED line is required for start on wake to work after qemu restarts.

> Is this the bit that allows you to load the VM into suspended?

Yes.

> But I note you're allowing PAUSED or SUSPENDED here, but the wake up
> code only handles suspended - is that expected?

The RUN_STATE_PAUSED line does not belong here. I will move it to  "cpr: reboot mode".

- Steve

>>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
>> @@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
>>      }
>>  }
>>  
>> +static bool start_on_wakeup_requested;
>>  static ShutdownCause reset_requested;
>>  static ShutdownCause shutdown_requested;
>>  static int shutdown_signal;
>> @@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
>>      notifier_list_add(&suspend_notifiers, notifier);
>>  }
>>  
>> +void qemu_system_start_on_wakeup_request(void)
>> +{
>> +    start_on_wakeup_requested = true;
>> +}
> 
> Markus: Is this OK, or should this actually be another runstate
> (PRELAUNCH_SUSPENDED??? or the like??) - is there an interaction here
> with the commandline change ideas for a build-the-guest at runtime?
> 
> Dave
> 
>>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>>  {
>>      trace_system_wakeup_request(reason);
>> @@ -574,7 +582,14 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>>      if (!(wakeup_reason_mask & (1 << reason))) {
>>          return;
>>      }
>> -    runstate_set(RUN_STATE_RUNNING);
>> +
>> +    if (start_on_wakeup_requested) {
>> +        start_on_wakeup_requested = false;
>> +        vm_start();
>> +    } else {
>> +        runstate_set(RUN_STATE_RUNNING);
>> +    }
>> +
>>      wakeup_reason = reason;
>>      qemu_notify_event();
>>  }
>> -- 
>> 1.8.3.1
>>
>>

