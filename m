Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E479D3F5177
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:44:44 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFsB-00018W-Tz
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIFqx-0008V6-75
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:43:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mIFqt-00035L-J0
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:43:26 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17NHKZda006594;
 Mon, 23 Aug 2021 19:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+X75Pf1kVYtEKjhcPrt6Lwp/Wr0YWk7qm3dtczutlJM=;
 b=FkQQetUoRN/UP3pyta9K1qXNbtRwc8bTEdoHOOSMDQWgkY/c7DVDH3uqUKq4lyDMJ2aZ
 g/FAc3OmaC/mTPXjyU3evRveNjoRor5qUjc383YMX0uBgiSj5BwxIhA0GcFHWzKmXm70
 BgXVCdd5v41mbv1oEVq+80FTWqcFQaeLXDMvR7ztbP72Jl2Wak8kr57fTcQQO3xR48xs
 hkIf1TXhIiSV+6vllfrYO5glvawSKLFyzvfarmJBL1BEHPXRG4VV46Y3CB7BeSCUYXyt
 QdMRH3iyTddiG1zoxzwS8wbRzBvDTLVdMSFmC2ZiPwYtcS9cOrInGFP2VDQjVijMd/dP GQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=+X75Pf1kVYtEKjhcPrt6Lwp/Wr0YWk7qm3dtczutlJM=;
 b=MOVXrlFJn1UVpNnfPA5vFhZjmbVpLeegQn7BbdJsP41oL3SpVjDPCiB0lA+9kxEmyAxS
 wsLFWqUxm/bXnDKPOdAV10b+zEfs+TTba1LGMT+yO/63Hq8v3rKy++GEhg+4epQjWxuk
 nh+/d31D1aI/nFISOqWUos4AhuTGhm3kOCIxpXpuoCPFiGIrzwB01plJesASvFSWqcZg
 H0T3D3n6yKck3ytQvdvL0I8MrLbhDxEAZEx6tPIyrJMDKqj4gTnZE6nLrmYSQVIac8gO
 BMnYq4ULM/8dbsf4wSfpxQVk+hF/qRh9i8Bnn5WBDM7B7bZS27VIaiwhhDbeTqBLi7Ww NA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aktrttkxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 19:43:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17NJfEvh186156;
 Mon, 23 Aug 2021 19:43:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3020.oracle.com with ESMTP id 3ajsa3wnvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 19:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7LkfA6zRdEYvs0e5ExwC9YpcRtAY11uud6TSXtMPzP6sYEonQaBqi8rikNKxatpPZ1Q6k7UH30bN5eDgGdk4OiBvaCNv7j8vIg7fvGRnv7SQqZhKHL/WeiY9kTNqouAyq+7yB8qlf23Zb1p8DPMxuj7bNnj4X4siX9L1e6X4xoaDMmAZ/TA6H575OPusvilhDYyQF7/DgF4z9FD69L9Ay5eO1DpNvsOQyf1nqvLHxZKJJK38r6HPFoox/ngfanAK+WgdmUBBR9pDhafd6QGI4Urb7FU/mRwwNQQUSi9Y75RQZNnVkEcLrMhDoPu1dPg1Ev2ORGK16qupTLEJlLiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X75Pf1kVYtEKjhcPrt6Lwp/Wr0YWk7qm3dtczutlJM=;
 b=DBz9R39J5E8THY4+McWRU1EsXnefR0ytTtRAS5WW/qYLCdrk+ZECW4KkiOTDg5BRCbKRVTZFsln1MktzPkZvmOJOk4li/n1jJUqrDMtdsnVXngX5gj+AYXa2NCjkF3n7kh90yOKtgn9u40KSzXdbAn3W1iLKyCGYh600IYKw6H22D9qF8q/RU1iuOG5ywTNsTyG3+ZxNwMQUJQcdOHa8GTCWHHxTtmU+1dLHR7zXK2MlyLhKEFoWB+wZhl0xBVb6u5r3+BV9W6e7wtFkK+LmEObd6cfdqTtp7GrvaDX/uAU2My8eTpSEg8dVN+SLeLQRIKlzDoBiV+YGvDOUYfmNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X75Pf1kVYtEKjhcPrt6Lwp/Wr0YWk7qm3dtczutlJM=;
 b=wOf04LVuNlGKKJgKemBGFdtU/QUSAJRd5d/56nMUy6WuXhcT5Ekjc2Ttc5RGvL1azPOEc+emlkGq1wf/4KktFf5rNL6h0cHbY8lC0YvBIt+wdRJuCjoHtN1LfsUZ0psqnJ68dS3K4elUowN/5RTGWPSKmDBvsDfNYMJu8brQCws=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB5437.namprd10.prod.outlook.com (2603:10b6:a03:3aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 19:43:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 19:43:06 +0000
Subject: Re: [PATCH V6 19/27] vfio-pci: cpr part 1 (fd and dma)
To: Alex Williamson <alex.williamson@redhat.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-20-git-send-email-steven.sistare@oracle.com>
 <20210810110608.480af93b.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <18c5bb47-256e-322a-0644-7145820de2d5@oracle.com>
Date: Mon, 23 Aug 2021 15:43:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210810110608.480af93b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:806:f2::15) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.39.217.55] (138.3.201.55) by
 SN7PR04CA0010.namprd04.prod.outlook.com (2603:10b6:806:f2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 19:43:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9046c706-882c-42c3-702e-08d9666e3a58
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5437559C82450FC780FF8BDBF9C49@SJ0PR10MB5437.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oWMaEqaU+lF6ZlzGQsNeXiHDZ1r+9h7ZKGWdaMH+KMvuGbkRYXuC5+hlVt2raGO64RC2H6R1giMYUNw3PRDerOY8cBZ2ZDkdiT/JGl12RBj/6BKOv1i41OStI786YEqkB7rNESseMzsDiXdf+AJ4x5kAjRKixiBxanQ+FriPRcGnSkCpCibdyR9bfdYW334DSp7xjVHSWyP7S22gaOhTBX+1H85DCEu45Guww14Ktidagc01VJ6hX62oO2yn7gVoKhjgT21kGkn121RJ/YeK8mzAHRQdUa54mUD5rswrcpo0fxVVRfNqhDCkfviac2UiAQ9+xtz5cSG3c7j5k6gBb+KceFriyVwnsaiB28nsAGAAGVhmkvG1GvwYJ9DUyDMmgb7PJlflnNMVI2pNhrQp0rmY28b31eSqj0K5paIuCVcwO52ssaZ8jqPSfcHCoB4tGoW+SEIdJqWGhoXtybu3oGDUTAxUB98U7ZII6Wxcc9zFEk3Ahb7jDgdQM51ftAndKvNyq3oiql2oijLw5II9s+GvHvQH50E4zW6KwuZqKgnpEsutj/MofaiDEXETyeuBkbAdrRnSBmYBXI+Mr3bExjvrb9csjoZzEIlzpNbwKCK7f74tItBoyQeuxWYeArXb0hpmknDg37wt7fxScvjPhaQokihoC+Ov1/MIharkwG4OKVw1g3FYznPGVFYRbSSmRxou3oc11y0XLwXrCF173d3ovLsrjY9J7/pKLmhzes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(366004)(376002)(346002)(478600001)(31686004)(6486002)(66946007)(66476007)(66556008)(86362001)(54906003)(6666004)(7416002)(38100700002)(16576012)(107886003)(6916009)(5660300002)(316002)(956004)(186003)(44832011)(8676002)(2616005)(26005)(8936002)(53546011)(36756003)(36916002)(83380400001)(30864003)(2906002)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUh6dDR0eHJqZzRNZEZvL0kxMHZyTk5jRm8wak1FT21Bb1FoNUp6WnZCMHFh?=
 =?utf-8?B?aXNVbmozZFRPb0N5bU5rRDFEWU1HSGljZFpURzYrb2NqdXpta0VIZHFLQzNY?=
 =?utf-8?B?SkdKeTFGWWtFZ0ptNWNVNHZKRk9WbEJBRmhzeXhzUmlMS0owY2dFY2FqcEt3?=
 =?utf-8?B?bW4zTFF3aXA2aHRWOXdZbDRNbDRuUWpkeGIvOW1tNnIzTnJ5OHNEdmxGZjgx?=
 =?utf-8?B?UTFhbVJsQjJnVkNUeWYzSUpxMitOY3FyZWFoaTZyWFE0c2RHSnliMjJUU2c1?=
 =?utf-8?B?TWd0S3FZdEdCbkFTbURleTFWV0oyODVXR2tHY1NTWWoxcXdPWHFtSzBCQ080?=
 =?utf-8?B?d1prb2FSWGtiK1lhTjEwT1ZlMTRrN29nOERLUXRtSG9hRk5DckhESCtTQ2s3?=
 =?utf-8?B?bGk3QzZqYkxrK1JDbHNQRXZvaktlNGpwVnhnTUhuVHE0VUVDRFNxQnhvMmVn?=
 =?utf-8?B?RklzQWVxejVHMTc4enJ4dldmbFJxU2g3eCszMTEzK1FZZEhiVDVRTWhpK0Nr?=
 =?utf-8?B?bWRTVHliZDFrR1NHU0ltWUt3OGtVR0M3bFRSWmxRRy82eUl4UVArNjMvbVN4?=
 =?utf-8?B?d1paUkxTa01Bb2lZNWNvUW9vVkZpd2RoTFJ6TW5aNmJkTGpnUkRpRjE0TFlq?=
 =?utf-8?B?WXhwUitQSEx1SmJVSmFsak8yOEhLMHc3WWNyYmcrZVJ5L3R0TGRLTHg1d0hC?=
 =?utf-8?B?WE1tYldaQnpFL2p0TnRHTmNNQlNqSkNqb3JzT1BXN2djU3NQZkI1OXlrcEZC?=
 =?utf-8?B?ajdzUFAyTllUMndkWTBzSWw3OEF6RG4wMmZxNHJ5K3pjNHh6VWpYc1JnZ2U5?=
 =?utf-8?B?K1dQRGl4WGV3NVRUMEVTWFhkUUk5Vk1kL3VwenErV1ZhZktxamtLc1lLR29y?=
 =?utf-8?B?dUh2NmhMeWc3a0pQZjJZY2hBVDNxWi9iQzdaQldFdUFPbDU2dGFReFI3V2xF?=
 =?utf-8?B?ZGhPWWh2d25NVHRRSmQrV3ppVEN5c2pjQkUxS0QxZXQwZFY4NG44YkVoTnhL?=
 =?utf-8?B?aXFWU1ZJb3R3d0V4QXdaYnBvRkl0eGlObFpCZi8zUjZkR3dzaVNNL29oVzdT?=
 =?utf-8?B?aytaSExyQXZwa1pCYldwa2xaVmIwZWxXMHZHSFVTRm9qc0dPVENFMDQwMU9H?=
 =?utf-8?B?QWtXSExGYkNTUHFTbmdtaHllSGtJMW5LWWxLWW1UNldoTGVIQi94K0lTMXh1?=
 =?utf-8?B?UExNRHRnUi9nRUFmZ1lVbVJhN09oTG14OWZINXNJWHVuQ3ZOOVlmcDZ1ZXZo?=
 =?utf-8?B?ZFRLa3RXUWpmNWNMcXo0azg5QzJOS0xhYnZ6NlgxY0tjRTJadzFOaURZN3l1?=
 =?utf-8?B?MmdwWmM0YXBwaCtmUlNJSnp4Zitxd0Yyam5qNEVHNHllM096NTIxcDVhNGRs?=
 =?utf-8?B?aW40TzFaTFpPUXREMDN3bVJXVWxoTFE3SVhoRzFYWkh4ZnRTWnFKM1ZVTTd4?=
 =?utf-8?B?UDhYMkVFV09xMkROMFoxTURZTjBOTjBMKzVmeHVZa21PSitzM0pLb3Azb0lQ?=
 =?utf-8?B?K2NRUFZQT1hCZitMU1NIdGV3UUpTaDZCTEtSeUhhRUpQZGh0YUsxeGFpWHlG?=
 =?utf-8?B?N1kyb3V3bEdqamJpVlFHUllDQjcxaVBqd3FKdXNXZE1oNnRhblp4KzRBVDFX?=
 =?utf-8?B?a0RTaXhvalV2R2RwdFFpeFZlTkx6K3YzWHlidnlFVm50U3lIUFpmUk5Jekth?=
 =?utf-8?B?NXBzSUZpTGh2VGVEWUtnT1FPQTBKYUtLK01MK25ZMklTS09xeTl0RDFlcmxC?=
 =?utf-8?Q?qO7i3SRRhJm0RaxmCcmXnm3t7Xi2yd22UcJv+XZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9046c706-882c-42c3-702e-08d9666e3a58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 19:43:06.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN+17ZmXChmD8/msT7FN5ndz8h0tET17aQWCiqPQrZo/rutuQdqp+uXxS169TPdXm6IsJStxGnDLeyMRaJALg2qNUiZOWlx4Z5orbnzVHkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5437
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230134
X-Proofpoint-GUID: t9Ex_NqHRghz-UuD8bdRXYQflLqSHGoZ
X-Proofpoint-ORIG-GUID: t9Ex_NqHRghz-UuD8bdRXYQflLqSHGoZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/2021 1:06 PM, Alex Williamson wrote:
> On Fri,  6 Aug 2021 14:43:53 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> At vfio creation time, save the value of vfio container, group, and device
>> descriptors in cpr state.
>>
>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>> should not persist across miscellaneous fork and exec calls that may be
>> performed during normal operation.
>>
>> On qemu restart, vfio_realize() finds the descriptor env vars, uses
>> the descriptors, and notes that the device is being reused.  Device and
>> iommu state is already configured, so operations in vfio_realize that
>> would modify the configuration are skipped for a reused device, including
>> vfio ioctl's and writes to PCI configuration space.  The result is that
>> vfio_realize constructs qemu data structures that reflect the current
>> state of the device.  However, the reconstruction is not complete until
>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>> state.  It rebuilds vector data structures and attaches the interrupts to
>> the new KVM instance.  cpr-load then walks the flattened ranges of the
>> vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to inform the kernel
>> of the new VA's.  Lastly, it starts the VM and suppresses vfio device reset.
>>
>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>> support.  Part 3 adds INTX support.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  MAINTAINERS                   |   1 +
>>  hw/pci/pci.c                  |   4 ++
>>  hw/vfio/common.c              |  69 ++++++++++++++++--
>>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 |  57 +++++++++++++++
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/pci/pci.h          |   1 +
>>  include/hw/vfio/vfio-common.h |   5 ++
>>  include/migration/cpr.h       |   3 +
>>  linux-headers/linux/vfio.h    |   6 ++
>>  migration/cpr.c               |  10 ++-
>>  migration/target.c            |  14 ++++
>>  13 files changed, 325 insertions(+), 7 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a9d2ed8..3132965 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2904,6 +2904,7 @@ CPR
>>  M: Steve Sistare <steven.sistare@oracle.com>
>>  M: Mark Kanda <mark.kanda@oracle.com>
>>  S: Maintained
>> +F: hw/vfio/cpr.c
>>  F: include/migration/cpr.h
>>  F: migration/cpr.c
>>  F: qapi/cpr.json
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 59408a3..b9c6ca1 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -307,6 +307,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>>  {
>>      int r;
>>  
>> +    if (dev->reused) {
>> +        return;
>> +    }
>> +
>>      pci_device_deassert_intx(dev);
>>      assert(dev->irq_state == 0);
>>  
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 7918c0d..872a1ac 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -31,6 +31,7 @@
>>  #include "exec/memory.h"
>>  #include "exec/ram_addr.h"
>>  #include "hw/hw.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/range.h"
>> @@ -464,6 +465,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>>      }
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>>          /*
>>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
>> @@ -501,6 +506,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .size = size,
>>      };
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>>      }
>> @@ -1872,6 +1881,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>      if (iommu_type < 0) {
>>          return iommu_type;
>>      }
>> +    if (container->reused) {
>> +        container->iommu_type = iommu_type;
>> +        return 0;
>> +    }
>>  
> 
> I'd like to see more comments throughout, but particularly where we're
> dumping out of functions for reused containers, groups, and devices.
> For instance map/unmap we're assuming we'll reach the same IOMMU
> mapping state we had previously, how do we validate that, why can't we
> only set vaddr in the mapping path rather than skipping it for a later
> pass at the flatmap, do we actually see unmaps, is deferring listener
> registration an alternate option, which specific reset path are we
> trying to defer, why are VFIOPCIDevices the only PCIDevices that set
> reused, there are some assumptions about the iommu_type that could use
> further description, etc.

Will do.

>>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>>      if (ret) {
>> @@ -1972,6 +1985,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>  {
>>      VFIOContainer *container;
>>      int ret, fd;
>> +    bool reused;
>>      VFIOAddressSpace *space;
>>  
>>      space = vfio_get_address_space(as);
>> @@ -2007,7 +2021,13 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>       * details once we know which type of IOMMU we are using.
>>       */
>>  
>> +    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
>> +    reused = (fd >= 0);
>> +
>>      QLIST_FOREACH(container, &space->containers, next) {
>> +        if (container->fd == fd) {
>> +            break;
>> +        }
>>          if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
> 
> Letting the reused case call this ioctl feels a little sloppy.  I'm
> assuming we've tested this in a vIOMMU config or other setups where
> we'd actually have multiple containers and we're relying on the ioctl
> failing, but why call it at all if we already know the group is
> attached to a container.

Good find, this was unintentional.  Will fix.

>>[...]
>> +++ b/hw/vfio/cpr.c
>> @@ -0,0 +1,160 @@
>> +/*
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/vfio.h>
>> +#include "hw/vfio/vfio-common.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/error.h"
>> +#include "trace.h"
>> +
>> +static int
>> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_unmap unmap = {
>> +        .argsz = sizeof(unmap),
>> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
>> +        .iova = 0,
>> +        .size = 0,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
>> +                              ram_addr_t size, void *vaddr,
>> +                              Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_map map = {
>> +        .argsz = sizeof(map),
>> +        .flags = VFIO_DMA_MAP_FLAG_VADDR,
>> +        .vaddr = (__u64)(uintptr_t)vaddr,
>> +        .iova = iova,
>> +        .size = size,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
>> +        error_setg_errno(errp, errno,
>> +                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
>> +                         iova, size, vaddr);
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int
>> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
>> +{
>> +    MemoryRegion *mr = section->mr;
>> +    VFIOContainer *container = handle;
>> +    const char *name = memory_region_name(mr);
>> +    ram_addr_t size = int128_get64(section->size);
>> +    hwaddr offset, iova, roundup;
>> +    void *vaddr;
>> +
>> +    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
> 
> A comment reminding us why we're also skipping iommu regions would be
> useful.  

OK.

> It's not clear to me why this needs to happen separately from
> the listener.  

After vfio_realize registers the address space listener, subsequent device realizations
can modify the address space.  After all realizations, qemu's picture of the address space
matches the kernel's picture of mapped dma ranges, and it is safe to call vfio_region_remap.
However, the intermediate qemu picture after each realization may not match the kernel's
picture, so we cannot allow the listener to issue incremental ioctl's.

> There's a sufficient degree of magic here that I'm
> afraid it's going to get broken too easily if it's left to me trying to
> remember how it's supposed to work.
>> +        return 0;
>> +    }
>> +
>> +    offset = section->offset_within_address_space;
>> +    iova = REAL_HOST_PAGE_ALIGN(offset);
>> +    roundup = iova - offset;
>> +    size -= roundup;
>> +    size = REAL_HOST_PAGE_ALIGN(size);
>> +    vaddr = memory_region_get_ram_ptr(mr) +
>> +            section->offset_within_region + roundup;
>> +
>> +    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
>> +    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
>> +}
>> +
>> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
>> +{
>> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
>> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
>> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
>> +                         "or VFIO_UNMAP_ALL");
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +int vfio_cpr_save(Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +    VFIOAddressSpace *space, *last_space;
>> +    VFIOContainer *container, *last_container;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_is_cpr_capable(container, errp)) {
>> +                return -1;
>> +            }
>> +        }
>> +    }
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
>> +                goto unwind;
>> +            }
>> +        }
>> +    }
>> +    return 0;
>> +
>> +unwind:
>> +    last_space = space;
>> +    last_container = container;
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            Error *err;
>> +
>> +            if (space == last_space && container == last_container) {
>> +                break;
>> +            }
> 
> Isn't it sufficient to only test the container?  I think we'd be in
> trouble if we found a container on multiple address space lists.  Too

OK.

> bad we don't have a continue_reverse foreach or it might be trivial to
> convert to a qtailq. 
> 
>> +            if (address_space_flat_for_each_section(space->as,
>> +                                                    vfio_region_remap,
>> +                                                    container, &err)) {
>> +                error_prepend(errp, "%s", error_get_pretty(err));
>> +                error_free(err);
>> +            }
>> +        }
>> +    }
>> +    return -1;
>> +}
>> +
>> +int vfio_cpr_load(Error **errp)
>> +{
>> +    VFIOAddressSpace *space;
>> +    VFIOContainer *container;
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_is_cpr_capable(container, errp)) {
>> +                return -1;
>> +            }
>> +            container->reused = false;
>> +            if (address_space_flat_for_each_section(space->as,
>> +                                                    vfio_region_remap,
>> +                                                    container, errp)) {
>> +                return -1;
>> +            }
>> +        }
>> +    }
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            vbasedev->reused = false;
>> +        }
>> +    }
> 
> The above is a bit disjoint between group/device and space/container,
> how about walking container->group_list rather than the global group
> list?

OK.

>> +    return 0;
>> +}
>> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
>> index da9af29..e247b2b 100644
>> --- a/hw/vfio/meson.build
>> +++ b/hw/vfio/meson.build
>> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>>    'migration.c',
>>  ))
>>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>> +  'cpr.c',
>>    'display.c',
>>    'pci-quirks.c',
>>    'pci.c',
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e8e371e..64e2557 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -29,6 +29,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/qdev-properties-system.h"
>>  #include "migration/vmstate.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/module.h"
>> @@ -2899,6 +2900,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>          vfio_put_group(group);
>>          goto error;
>>      }
>> +    pdev->reused = vdev->vbasedev.reused;
>>  
>>      vfio_populate_device(vdev, &err);
>>      if (err) {
>> @@ -3168,6 +3170,10 @@ static void vfio_pci_reset(DeviceState *dev)
>>  {
>>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>>  
>> +    if (vdev->pdev.reused) {
>> +        return;
>> +    }
> 
> Why are we the only ones using PCIDevice.reused and why are we testing
> that rather than VFIOPCIDevice.reused above?  These have different
> lifecycles and the difference is too subtle, esp. w/o comments.

PCIDevice.reused is referenced in hw/pci/pci.c:pci_do_device_reset().

I'll add a reused field to VFIOPCIDevice for use in the vfio specific code.

>> +
>>      trace_vfio_pci_reset(vdev->vbasedev.name);
>>  
>>      vfio_pci_pre_reset(vdev);
>> @@ -3275,6 +3281,56 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +static void vfio_merge_config(VFIOPCIDevice *vdev)
>> +{
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
>> +    g_autofree uint8_t *phys_config = g_malloc(size);
>> +    uint32_t mask;
>> +    int ret, i;
>> +
>> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
>> +    if (ret < size) {
>> +        ret = ret < 0 ? errno : EFAULT;
>> +        error_report("failed to read device config space: %s", strerror(ret));
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < size; i++) {
>> +        mask = vdev->emulated_config_bits[i];
>> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
>> +    }
>> +}
>> +
>> +static int vfio_pci_post_load(void *opaque, int version_id)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +
>> +    vfio_merge_config(vdev);
>> +
>> +    pdev->reused = false;
>> +
>> +    return 0;
>> +}
>> +
>> +static bool vfio_pci_needed(void *opaque)
>> +{
>> +    return cpr_mode() == CPR_MODE_RESTART;
>> +}
>> +
>> +static const VMStateDescription vfio_pci_vmstate = {
>> +    .name = "vfio-pci",
>> +    .unmigratable = 1,
> 
> Doesn't this break the experimental (for now) migration support?

Yes, thanks.  I will delete this line and add a comment.  vfio_pci_needed() guarantees
that this handler is only used for cpr.

> 
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .post_load = vfio_pci_post_load,
>> +    .needed = vfio_pci_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -3282,6 +3338,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->reset = vfio_pci_reset;
>>      device_class_set_props(dc, vfio_pci_dev_properties);
>> +    dc->vmsd = &vfio_pci_vmstate;
>>      dc->desc = "VFIO-based PCI device assignment";
>>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>      pdc->realize = vfio_realize;
>> [...]
>> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
>> index e680594..48a02c0 100644
>> --- a/linux-headers/linux/vfio.h
>> +++ b/linux-headers/linux/vfio.h
>> @@ -52,6 +52,12 @@
>>  /* Supports the vaddr flag for DMA map and unmap */
>>  #define VFIO_UPDATE_VADDR		10
>            ^^^^^^^^^^^^^^^^^
> 
> It's already there.  Thanks,

Thanks, I will delete that and the dup'd VFIO_UNMAP_ALL                        .

- Steve

>> +/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
>> +#define VFIO_UNMAP_ALL                        9
>> +
>> +/* Supports VFIO DMA map and unmap with the VADDR flag */
>> +#define VFIO_UPDATE_VADDR              10
>> +

