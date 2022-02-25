Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C34C4501
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:55:42 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNa8K-0007hy-VJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:55:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNZqq-0004cW-2W
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:37:36 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNZqm-00011C-46
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:37:35 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PCSdt4014031; 
 Fri, 25 Feb 2022 12:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Uww+Hns6CQpffSJHDJonm10jO0iUNhooO7H0S6KKNNg=;
 b=Ao06H8gJ/CojhM/RfdcEKMoh1+iWB0I63C4wfjirSKQ6PVPRrQA8hQVo5IFUZvBs20a8
 SNdkSTzBZC3hxFvndZ7CVxYcVD87ux+g+3AjFC0XvGfoukp0X78E4cSu6W2siq5721/t
 DdlN0QGlGzKttYsgT+D0XOFMZoNZ3l/n6SYyZWCgTzjVm1JOPX8mknLdKqZkX24yEcsZ
 ZjcXQdiv1mJiFQJF2ktv3bEwhfVXhz2kOY/98vaQGOdzlX076Jhv16XlxkKaQYJs0nBZ
 Y8iCuPgpWzxH5F3pN56VBsUV87FQnT14OeViFH5oIa5B12AGnROrK3S16WjOCfVj5/Qq nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eey5dg1b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 12:37:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21PCV44N052924;
 Fri, 25 Feb 2022 12:36:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by userp3020.oracle.com with ESMTP id 3eat0s2xfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 12:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+1qnr9DurI02GS5K90nWtr13r3L2DsBUsi0NEEIptzj24JuTO2eSERmyi4nIFfYgldh4wbqRrBaZj83BXLZ3skzL+AUx42vNbO+MKwgAzpoebEpBtL2+VT0rZdenGR4GVl1N0xA9prWe/e1fvFd6hIAJMtVhWaXXVf3p3KKPBQClJd6igggUeXW2ZYRbinS+gkIbfAE9M8HbgBXNvZPDcRnVtOw4epkZIfGdE3Y72x8wjK4aPJ+wBVf0jg+IQ67/N+WeRo0EFGTlYe6CjEsxv82jAkeMwbRF12KRFg5ukyO5pWr8LY5M0kDY8Il6grePUT7hn8GAj8KB7kyPG8KaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uww+Hns6CQpffSJHDJonm10jO0iUNhooO7H0S6KKNNg=;
 b=SHDMnP6EQH39gZ+9qv1aI6iZ0uRRa68uGKUE7O0VjV1kLRyRxyiuHry3bQC5Cf24nHX9z4mlQ4Iuxq8hOIO5vz8pv0MrOXzfBmsMN/l1mNPwEpCEBmh2lGgaxH9Gp5z+asvd6wnZhXiYh0HGH/aDlkyt5ateDtcCokhd6zidjoNSVndn6NajLfJFj2RgORI/6H/Ei+TbimUHoFJhxdHodSet3smU33MhMEGBFUc/ArtVfm+JlskZjGJrz/+JAZJrGAEs5YotGXKyFbISsB/P/SGJKTPxsiTWwXTAup0WRnEir8/NTWWQ0p+CP4iOn2jnn5P5CIuTU0I2vXtyO98lXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uww+Hns6CQpffSJHDJonm10jO0iUNhooO7H0S6KKNNg=;
 b=wksMq0VG5V6M5CFyMqTxJKllsqhmp8SojBzucLXUeWFTEb2S8SXQarGYeluSnxKWaZzNtLHIQG0Kr5NRCo7IeDLI73U2SJRJR/vRUPTJT3TMDMF+Uh0UdOGBXiL8Sn+R05lQ87iHEW9mlZnAaYoHjNuiMjLXfoSWwSAq6vrxqSo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY4PR1001MB2216.namprd10.prod.outlook.com (2603:10b6:910:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 12:36:31 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 12:36:31 +0000
Message-ID: <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
Date: Fri, 25 Feb 2022 12:36:24 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220224144053.3fbe234d.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220224144053.3fbe234d.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c41fe1b-c9ce-4fae-6d58-08d9f85b732d
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2216:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2216353336655199A210561EBB3E9@CY4PR1001MB2216.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnk5mMAnbGat1FuaBAdOwmBA5T93kvF402JJKVqKd0C2EcxvdFxUHFlTc7ZjvbV0tV2CRYJ65TbZaNhbsywp589m4dkUbn3gzAsPfBUy+XtQK9msrTM+kJ/nX0e46ucZHxg/LvOf3J9CQdlFJ/8cB8qPFPIUBXAGVF7bRhBJXYxch4IoitXK3+IK2WxbAed8V+l9qMSYEa8NawtDm/3aMtzQrfFF3sEF93oN2OvUcaWehP5pK25J7WmRLGPqQYWd9yhCAV/5YMfmIemldYsh32O5vve0X9hg4RNpjyfPPMR761IcEI23f8ybnvIoAaqHr18gl47NB6TFkjiC4BvGH2lnSKSRf2W7qxXqB6VoMnvmKYPZ9RgMnD2adKtPWoWpRuljeyP4/5WH7Dofh73rdspSDj59Jc4YFuTKZrt0mPUS++N4Xd+z1mcosbTS48EeNs5SnFJbX1JXuVtieqpUQuAIIyKN2i1wNTDgzv60WSpjM+s9XNX2wdvByakCMoQ1Uor7qPWw5ezHFSiJ362QJhvHxhVUOK46d/1/7wG5XEFQGdQQvjVLxrYZ0BFSV5GRe8xid4BdtxPEPlHMDPC+MsG0/U6DMPLjBH8BSOJzjC4KGLmIun0yVmlhVAS5iMDSnoxIgDAtZPQozP8K5WoS1jO9VVoezDPmRr1+0US3tanj1PFJgLD/aq+dVsEx7vVGeIJFVd4rOfBgOhRLnS2GAeQNU1jsIXXKaWfyGrdJGCorHVTKOUoHnbT5znuWJ6XqtIQlSAfQ6sqPH36pcpOJEw683wg1VhAb9z52Gb17h2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(8676002)(6666004)(31686004)(6916009)(36756003)(2616005)(54906003)(26005)(66476007)(966005)(83380400001)(66556008)(6512007)(4326008)(6486002)(38100700002)(186003)(53546011)(2906002)(66946007)(31696002)(508600001)(8936002)(5660300002)(86362001)(30864003)(7416002)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2d3aUVLbnYrMHpMdnV1dnVtTlJGVlUxREZSMWlLTnhTc0ViSGhoeHJVaFdv?=
 =?utf-8?B?dENRdFNGdjlDMUZUMXQrN0dRL0tEUHEzM2NqeHk3aHZKWmdvUVJkVUdrOFJp?=
 =?utf-8?B?dGZLRVlMQmc4K2s2Y2V0dFVZRUZ2d0k0dEVhNy81KzIyWDRqUWZPMjB3ZG5E?=
 =?utf-8?B?SjJQYWVOdllUc3ltMzJZYkZmRzROZXByNGhodlQ5emQ2NXo3M0JvN0g3TDA0?=
 =?utf-8?B?S2VLcEtPbEdrNHJoeEw3OVB3TVVzVnFkSjU2WUkrbW9zU2xHVXVDa0N2WlF6?=
 =?utf-8?B?bStOQWorRC8wZWNyK3owVWYyaGpyTVVuMS96MC9ici93RlRGMU1vRnRvMVdn?=
 =?utf-8?B?cWpjL2wwQmxaKzNmWGVDZ09jaW43ZnRIcGtTeFBUSXhpcUlQMWd5Nkxvb2Nw?=
 =?utf-8?B?ZHJJbEV2S0sxUXN1L0h5ZkJiSUdMS3F1YXlKNWdaV3RWMWZ0NksrUjJadVE3?=
 =?utf-8?B?TEZTTk9rUjF3T2VINXB4RGRyM2MwR3RrdlZvTnVoWm02YTlMR0dOekt6RUxw?=
 =?utf-8?B?ZXlRQktuVUxuWkVUTnk0Q3NUQ3RUMVl6NExleGFXYVZkanNVWHBiME9VdnUz?=
 =?utf-8?B?dXFPcGxvOUhYeTNncTg5cHJtUHpFdlVpSGZCMm1kK2hmRFp6RkN1c2R6U1pS?=
 =?utf-8?B?ZHNDVjBwK3hCajJpSVFDR3o5S1VxbGdWOGZ1dVN4c2xoQVovcy8vMjkyMHZn?=
 =?utf-8?B?UWthcHhDK0VoREEzM0t5YlZUNHYwa0doOXQybXhFSW84REREUzB4Y1dBWHNu?=
 =?utf-8?B?VzdMTVJCREN4bVZlTnhLTTVrR1pmaTJzNnJsYldZUWJsZVZrMmtWS3EwVlY4?=
 =?utf-8?B?V0dBMyswRTg3a0VLQUlWQkQvTG03Nkc1YTVCWEFSNjd5QnZLSnNLaVJLRVV4?=
 =?utf-8?B?K1JLVFE0bDFxWE9rVXNlSzR4bkRvQ1EzYS9ydFNXQklHcTRraFhJWDBoYmJK?=
 =?utf-8?B?WkNzb0hsM1V0dVRCd0pmOW5OWUhjdEV3WElCRWpQeW5ZWjNQeWpjb1dYTi9E?=
 =?utf-8?B?MC9ETkF3QVFJbFFGbkJUMjBhbnRWSzlkd1VvVWFxWTRhS21qU3lkUlM3MWJM?=
 =?utf-8?B?RmFRYmFMOWd0bTdtOGZ6U0lJN2V6c093anFnZS9sY0dwRWYxVUZ1OUtud2Vo?=
 =?utf-8?B?VjNqbTNiODZQQmhobHRtSjBZaHdXVGlENDMwdFhpaFlNdFlMR01Oby9GL3Fu?=
 =?utf-8?B?RVg5R1V0bGF5Qm5ockRlZklGVWR5aHQzNGZrMFROUVZlTk1DVm5BcTY0dVdF?=
 =?utf-8?B?Zk00Rzc3Y1N1ZjNNeDhMcktXOUpWN3dUY1B5bHJPcUhvc3N5MU9BeldOdDZO?=
 =?utf-8?B?MWNreWYvN2NWYitCWUpkUDJvMEUwWVBSZnpabmVqMTUzYWJnWk9LcmxsRTBh?=
 =?utf-8?B?N2RYV2o5K0I4c25JeTYxWWgvN0xYK2ZTOVd3R2JYQWVSUW4xMlg5S3NNU0lO?=
 =?utf-8?B?Y0FEZXpHSXpFcGdTK2pDL1M0Y1AxNmxUZTNMUWpUTU9jRUt4VDVaMXpHWkc0?=
 =?utf-8?B?Z2VFbWhyZ1ZVZW52NzI4Uk9zYlV6Nk5vK0FNaXlFNmFLNkR4K3cyZ0xiWnBl?=
 =?utf-8?B?VDR1cnRjZ1RCKzQ4OVliL2RBdzY2Qk9Pa09zRzBUSURhellSZHNzMHBxWmQv?=
 =?utf-8?B?cUxueGliNHJ1UHFrS0tQeXFxYWJhcjJYcGg2R0hGZWlTYkUvYTRWZElmUEZi?=
 =?utf-8?B?QnkyajdEYnNlMG1PYzBHSnBrRW1MR1FxaWQxSzArYStxZWtFeG9DZytyeHp1?=
 =?utf-8?B?WFIyM0NDUmFvTm5qMkYwcCtad0NpVWNnSW5YNFdidUFHb1RwRTdxQURJMzdE?=
 =?utf-8?B?bVN0UDJRQlpKczRrMVhCb0crQzBNV016WkJiVW8xaWlMcmZFS04wU0RuRmJy?=
 =?utf-8?B?Q3pzUFllcFFDMWp3U0xjWFh4NzBIV1pmOTJNa2lTbVRpRkg3UDhZN0dscEdw?=
 =?utf-8?B?RlppN05JdkU3Q0RhUEpabTM3RjJuNHlNdnF6cno2VGxtY1NFY0RzYWxSbGZq?=
 =?utf-8?B?d1NWbEVVbm05WmdHNmdtSEFPV1lXbGl4eTQveUptc2x3Vi82cFFCMnRoT01o?=
 =?utf-8?B?K3lEVjdwMy84Ylp1UFpHWmx3bFBUTWhQU3BXTk02Zy91TmVhTzZRbTlST0JW?=
 =?utf-8?B?RFNpcE1yUW1JY3RTRlo3TE9uVndvVlBrSnN3OGJrRkx2VnBjZWcvRGowWG12?=
 =?utf-8?B?OWUyTlN1V3dhcEI4RFJBMHdKVXFRL1R2bkFYd1o4SkdFVGdSYnBsaldCaEhp?=
 =?utf-8?B?dWdmckViWnQ3TjA2YndJc1RvV2lnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c41fe1b-c9ce-4fae-6d58-08d9f85b732d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 12:36:30.9579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu6QB/Og3Qo6Knrg8sf+pYyGlHJWj0j5EvjMBoqaRHDJ20qDxJI+aTLlAJ5rohlsoRZIKqpAszyBFEpyj3n6d6ZRf0mb+WEV9AsAKQE339U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2216
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250070
X-Proofpoint-GUID: 1xUHoJjHQ7roc69uQa2tWzI4j5GDO7zx
X-Proofpoint-ORIG-GUID: 1xUHoJjHQ7roc69uQa2tWzI4j5GDO7zx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 21:40, Alex Williamson wrote:
> On Thu, 24 Feb 2022 20:34:40 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 2/24/22 20:12, Michael S. Tsirkin wrote:
>>> On Thu, Feb 24, 2022 at 08:04:48PM +0000, Joao Martins wrote:  
>>>> On 2/24/22 19:54, Michael S. Tsirkin wrote:  
>>>>> On Thu, Feb 24, 2022 at 07:44:26PM +0000, Joao Martins wrote:  
>>>>>> On 2/24/22 18:30, Michael S. Tsirkin wrote:  
>>>>>>> On Thu, Feb 24, 2022 at 05:54:58PM +0000, Joao Martins wrote:  
>>>>>>>> On 2/24/22 17:23, Michael S. Tsirkin wrote:  
>>>>>>>>> On Thu, Feb 24, 2022 at 04:07:22PM +0000, Joao Martins wrote:  
>>>>>>>>>> On 2/23/22 23:35, Joao Martins wrote:  
>>>>>>>>>>> On 2/23/22 21:22, Michael S. Tsirkin wrote:  
>>>>>>>>>>>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>>>>>>>>>>>> +                                          uint64_t pci_hole64_size)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>>>>>> +    uint32_t eax, vendor[3];
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>>>>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>> +    }  
>>>>>>>>>>>>
>>>>>>>>>>>> Wait a sec, should this actually be tying things to the host CPU ID?
>>>>>>>>>>>> It's really about what we present to the guest though,
>>>>>>>>>>>> isn't it?  
>>>>>>>>>>>
>>>>>>>>>>> It was the easier catch all to use cpuid without going into
>>>>>>>>>>> Linux UAPI specifics. But it doesn't have to tie in there, it is only
>>>>>>>>>>> for systems with an IOMMU present.
>>>>>>>>>>>  
>>>>>>>>>>>> Also, can't we tie this to whether the AMD IOMMU is present?
>>>>>>>>>>>>  
>>>>>>>>>>> I think so, I can add that. Something like a amd_iommu_exists() helper
>>>>>>>>>>> in util/vfio-helpers.c which checks if there's any sysfs child entries
>>>>>>>>>>> that start with ivhd in /sys/class/iommu/. Given that this HT region is
>>>>>>>>>>> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
>>>>>>>>>>> even worth checking the range exists in:
>>>>>>>>>>>
>>>>>>>>>>> 	/sys/kernel/iommu_groups/0/reserved_regions
>>>>>>>>>>>
>>>>>>>>>>> (Also that sysfs ABI is >= 4.11 only)  
>>>>>>>>>>
>>>>>>>>>> Here's what I have staged in local tree, to address your comment.
>>>>>>>>>>
>>>>>>>>>> Naturally the first chunk is what's affected by this patch the rest is a
>>>>>>>>>> precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
>>>>>>>>>> all the tests and what not.
>>>>>>>>>>
>>>>>>>>>> I am not entirely sure this is the right place to put such a helper, open
>>>>>>>>>> to suggestions. wrt to the naming of the helper, I tried to follow the rest
>>>>>>>>>> of the file's style.
>>>>>>>>>>

[snip]

>>>>>>>>>
>>>>>>>>> why are we checking whether an AMD IOMMU is present
>>>>>>>>> on the host? 
>>>>>>>>> Isn't what we care about whether it's
>>>>>>>>> present in the VM? What we are reserving after all
>>>>>>>>> is a range of GPAs, not actual host PA's ...
>>>>>>>>>  
>>>>>>>> Right.
>>>>>>>>
>>>>>>>> But any DMA map done by VFIO/IOMMU using those GPA ranges will fail,
>>>>>>>> and so we need to not map that portion of address space entirely
>>>>>>>> and use some other portion of the GPA-space. This has to
>>>>>>>> do with host IOMMU which is where the DMA mapping of guest PA takes
>>>>>>>> place. So, if you do not have an host IOMMU, you can't
>>>>>>>> service guest DMA/PCIe services via VFIO through the host IOMMU, therefore you
>>>>>>>> don't need this problem.
>>>>>>>>
>>>>>>>> Whether one uses a guest IOMMU or not does not affect the result,
>>>>>>>> it would be more of a case of mimicking real hardware not fixing
>>>>>>>> the issue of this series.  
>>>>>>>
>>>>>>>
>>>>>>> Hmm okay ... my first reaction was to say let's put it under VFIO then.
>>>>>>> And ideally move the logic reporting reserved ranges there too.
>>>>>>> However, I think vdpa has the same issue too.
>>>>>>> CC Jason for an opinion.  
>>>>>>
>>>>>> It does have the same problem.
>>>>>>
>>>>>> This is not specific to VFIO, it's to anything that uses the iommu.  
>>>>>
>>>>> Right. Most VMs don't use the host IOMMU though ;) It's unfortunate
>>>>> that we don't have a global "enable-vfio" flag since vfio devices
>>>>> can be hot-plugged. I think this is not the first time we wanted
>>>>> something like this, right Alex?
> 
> 
> I would very much NOT like to see such a flag ever existing.
> 
>>>>>>> Also, some concerns
>>>>>>> - I think this changes memory layout for working VMs not using VFIO.
>>>>>>>   Better preserve the old layout for old machine types?
>>>>>>>  
>>>>>> Oh definitely, and I do that in this series. See the last commit, and
>>>>>> in the past it was also a machine-property exposed to userspace.
>>>>>> Otherwise I would be breaking (badly) compat/migration.
>>>>>>
>>>>>> I would like to emphasize that these memory layout changes are *exclusive* and
>>>>>> *only* for hosts on AMD with guests memory being bigger than ~950G-~1010G.
>>>>>> It's not every guest, but a fairly limited subset of big-memory guests that
>>>>>> are not the norm.
>>>>>>
>>>>>> Albeit the phys-bits property errors might gives us a bit more trouble, so
>>>>>> it might help being more conservative.
>>>>>>  
>>>>>>> - You mention the phys bits issue very briefly, and it's pretty
>>>>>>>   concerning.  Do we maybe want to also disable the work around if phys
>>>>>>>   bits is too small?   
>>>>>>
>>>>>> We are doing that here (well, v4), as suggested by Igor. Note that in this series
>>>>>> it's a warning, but v4 I have it as an error and with the 32-bit issues that
>>>>>> I found through qtest.
>>>>>>
>>>>>> I share the same concern as you over making this an error because of compatibility.
>>>>>> Perhaps, we could go back to the previous version and turn back into a warning and
>>>>>> additionally even disabling the relocation all together. Or if desired even
>>>>>> depending on a machine-property to enable it.  
>>>>>
>>>>> I would be inclined to disable the relocation. And maybe block vfio? I'm
>>>>> not 100% sure about that last one, but this can be a vfio decision to
>>>>> make.
>>>>>  
>>>> I don't see this as a VFIO problem (VFIO is actually being a good citizen and doing the
>>>> right thing :)). From my perspective this fix is also useful to vDPA (which we also care),
>>>> and thus will also let us avoid DMA mapping in these GPA ranges.
>>>>
>>>> The reason I mention VFIO in cover letter is that it's one visible UAPI change that
>>>> users will notice that suddenly their 1TB+ VMs break.  
>>>
>>> What I mean is that most VMs don't use either VFIO or VDPA.
>>> If we had VFIO,VDPA as an accelerator that needs to be listed
>>> upfront when qemu is started, we could solve this with
>>> a bit less risk by not changing anything for VMs without these two.
>>>   
>> That wouldn't work for the vfio/vdpa hotplug case (which we do use),
>> and part of the reason I picked to always avoid the 1TB hole. VFIO even tells
>> you what are those allowed IOVA ranges when you create the container.
>>
>> The machine property, though, could communicate /the intent/ to add
>> any VFIO or vDPA devices in the future and maybe cover for that. That
>> let's one avoid any 'accelerator-only' problems and restrict the issues
>> of this series to VMs with VFIO/VDPA if the risk is a concern.
>>
>>> Alex what do you think about adding this?
>>>
>>> Given we do not have such a thing right now, one can get
>>> into a situation where phys bits limit CPU, then
>>> more memory is supplied than would fit above reserved region, then
>>> we stick the memory over the reserved region, and finally
>>> then vfio device is added.
>>>   
>> The current code considers the maximum possible address considering
>> memory hotplug, PCI hole64 and etc. So we would need to worry about
>> whether VFIO or VDPA is going to be hotplugged at some point in the
>> future during guest lifecycle, do decide to alter the memory layout
>> at guest provisioning.
>>
>>> In this last configuration, should vfio device add fail?
>>> Or just warn and try to continue? I think we can code this last
>>> decision as part of vfio code and then Alex will get to decide ;)
>>> And yes, a similar thing with vdpa.
>>>   
>>
>> Of all those cases I would feel the machine-property is better,
>> and more flexible than having VFIO/VDPA deal with a bad memory-layout and
>> discovering late stage that the user is doing something wrong (and thus
>> fail the DMA_MAP operation for those who do check invalid iovas)
> 
> The trouble is that anything we can glean from the host system where we
> instantiate the VM is mostly meaningless relative to data center
> orchestration.  We're relatively insulated from these sorts of issues
> on x86 (apparently aside from this case), AIUI ARM is even worse about
> having arbitrary reserved ranges within their IOVA space.
> 
In the multi-socket servers we have for ARM I haven't seen much
issues /yet/ with VFIO. I only have this reserved region:

0x0000000008000000 0x00000000080fffff msi

But of course ARM servers aren't very good representatives of the
shifting nature of other ARM machine models. ISTR some thread about GIC ITS ranges
being reserved by IOMMU in some hardware. Perhaps that's what you might
be referring to about:

https://lore.kernel.org/qemu-devel/1510622154-17224-1-git-send-email-zhuyijun@huawei.com/

> For a comprehensive solution, it's not a machine accelerator property
> or enable such-and-such functionality flag, it's the ability to specify
> a VM memory map on the QEMU command line and data center orchestration
> tools gaining insight across all their systems to specify a memory
> layout that can work regardless of how a VM might be migrated. 
> Maybe
> there's a "host" option to that memory map command line option that
> would take into account the common case of a static host or at least
> homogeneous set of hosts.  Overall, it's not unlike specifying CPU flags
> to generate a least common denominator set such that the VM is
> compatible to any host in the cluster.
> 

I remember you iterated over the initial RFC over such idea. I do like that
option of adjusting memory map... should any new restrictions appear in the
IOVA space appear as opposed to have to change the machine code everytime
that happens.


I am trying to approach this iteratively and starting by fixing AMD 1T+ guests
with something that hopefully is less painful to bear and unbreaks users doing
multi-TB guests on kernels >= 5.4. While for < 5.4 it would not wrongly be
DMA mapping bad IOVAs that may lead guests own spurious failures.
For the longterm, qemu would need some sort of handling of configurable a sparse
map of all guest RAM which currently does not exist (and it's stuffed inside on a
per-machine basis as you're aware). What I am unsure is the churn associated
with it (compat, migration, mem-hotplug, nvdimms, memory-backends) versus benefit
if it's "just" one class of x86 platforms (Intel not affected) -- which is what I find
attractive with the past 2 revisions via smaller change.

> On the device end, I really would prefer not to see device driver
> specific enables and we simply cannot hot-add a device of the given
> type without a pre-enabled VM.  Give the user visibility and
> configurability to the issue and simply fail the device add (ideally
> with a useful error message) if the device IOVA space cannot support
> the VM memory layout (this is what vfio already does afaik).
> 
> When we have iommufd support common for vfio and vdpa, hopefully we'll
> also be able to recommend a common means for learning about system and
> IOMMU restrictions to IOVA spaces. 

Perhaps even advertising platform-wide regions (without a domain allocated) that
are common in any protection domain (for example on x86 this is one
such case where MSI/HT ranges are hardcoded in Intel/AMD).

> For now we have reserved_regions
> reported in sysfs per IOMMU group:
> 
>  $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u | grep -v direct-relaxable

And hopefully iommufd might not want to allow iommu_map() on those reserved
IOVA regions as opposed to letting that go through. Essentially what VFIO does. Unless of
course there's actually a case where this is required to iommu_map reserved regions (which
I don't know).

